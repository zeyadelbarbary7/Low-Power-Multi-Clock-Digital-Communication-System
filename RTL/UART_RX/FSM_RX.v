module FSM_RX (
    input wire RX_IN,
    input wire PAR_EN,
    input wire [5:0] edge_cnt,
    input wire [3:0] bit_cnt,
    input wire stp_err,
    input wire strt_glitch,
    input wire par_err,
    input wire par_en,
    input wire [5:0] prescale,
    input wire CLK,
    input wire RST,
    output reg dat_samp_en,
    output reg enable,
    output reg deser_en,
    output reg data_valid,
    output reg par_chk_en,
    output reg strt_chck_en,
    output reg stp_chk_en
);

// FSM Encoding (Gray)
localparam  idle = 3'b000,
            start_check = 3'b001,
            deserialize_data = 3'b011,
            Parity_Check = 3'b111,
            stop_check = 3'b110;

reg [5:0] prescale_reg;

// Synchronizing prescale to avoid glitches
always @(posedge CLK or negedge RST) begin
    if(!RST)
        prescale_reg <= 6'd32;  // default prescale value = 32
    else
        prescale_reg <= prescale;
end

reg [2:0] Current_State, Next_State;

// State Transition
always @(posedge CLK or negedge RST) begin
    if(!RST)
        Current_State <= idle;
    else
        Current_State <= Next_State;
end

always @(*) begin
    case (Current_State)
        idle:
        begin
            if(RX_IN == 0)
                Next_State = start_check;
            else
                Next_State = idle;
        end

        start_check:
        begin
            if(edge_cnt == (prescale_reg - 1)) begin
                if(!strt_glitch)
                    Next_State = deserialize_data;
                else
                    Next_State = idle;
            end else
                Next_State = start_check;
        end

        deserialize_data:
        begin
            if((bit_cnt == 4'd8) & (edge_cnt == (prescale_reg - 1))) begin
                if(PAR_EN)
                    Next_State = Parity_Check;
                else
                    Next_State = stop_check;
            end else
                Next_State = deserialize_data;
        end

        Parity_Check:
        begin
            if(edge_cnt == (prescale_reg - 1)) begin
                if(!par_err)
                    Next_State = stop_check;
                else
                    Next_State = idle;
            end else
                Next_State = Parity_Check;
        end

        stop_check:
        begin
            if(edge_cnt == (prescale_reg - 1)) begin
                if(!stp_err) begin
                    if(RX_IN == 0)      // for consequent Frames
                        Next_State = start_check;
                    else
                        Next_State = idle;
                end else if (RX_IN == 0)
                    Next_State = start_check; // if stop bit error and RX_IN is low, go to start_check
                else
                    Next_State = idle; // if stop bit error and RX_IN is high, go to idle
            end else
                Next_State = stop_check;
        end
        default: Next_State = idle;
    endcase
end

// Output Logic
always @(*) begin
    dat_samp_en = 0;
    enable = 0;
    deser_en = 0;
    data_valid = 0;
    par_chk_en = 0;
    strt_chck_en = 0;
    stp_chk_en = 0;
    case (Current_State)
        // idle: all initialized with zero

        start_check:
        begin
            dat_samp_en = 1'b1;
            enable = 1'b1;
            // if(edge_cnt == prescale_reg - 2)
                strt_chck_en = 1'b1;
        end

        deserialize_data:
        begin
            dat_samp_en = 1'b1;
            enable = 1'b1;
            deser_en = 1'b1;
        end

        Parity_Check:
        begin
            dat_samp_en = 1'b1;
            enable = (edge_cnt < prescale_reg - 1 )? 1'b1: 1'b0;
            // enable = 1'b1;
            par_chk_en = 1'b1;
        end

        stop_check:
        begin
            dat_samp_en = 1'b1;
            enable = (edge_cnt < prescale_reg - 1 )? 1'b1: 1'b0;
            stp_chk_en = 1'b1;
            if(edge_cnt == (prescale_reg - 1))
                data_valid = (stp_err == 0 && par_err == 0);     // Only valid when all bits are okay
        end

        default: 
        begin
            dat_samp_en = 0;
            enable = 0;
            deser_en = 0;
            data_valid = 0;
            par_chk_en = 0;
            strt_chck_en = 0;
            stp_chk_en = 0;
        end
    endcase

end

endmodule