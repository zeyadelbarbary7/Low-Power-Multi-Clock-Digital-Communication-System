module SYS_CTRL #(
    parameter Data_width = 8,
    parameter Address_width = 4,
    parameter ALU_Operations = 4
)(
    // input declarations
    input wire [Data_width-1:0] Rd_Data,
    input wire REG_Rd_Data_valid,
    input wire [(Data_width*2)-1:0] ALU_OUT,
    input wire ALU_OUT_VALID,
    input wire FIFO_FULL,
    input wire [Data_width-1:0] SYNCED_DATA,
    input wire RX_DATA_VALID,
    input wire CLK,
    input wire RST,
    // output declarations
    output reg WrEn,
    output reg RdEn,
    output reg [Address_width-1:0] Addr,
    output reg [Data_width-1:0] Wr_Data,
    output reg Gate_EN,
    output reg [ALU_Operations-1:0] ALU_FUN,
    output reg En,
    output reg WR_INC,
    output reg [Data_width-1:0] WR_DATA,
    output wire CLK_div_en
);

assign CLK_div_en = 1'b1;

reg [Address_width-1:0] RegAdress;

// State Enum Definition
typedef enum logic [3:0] {
        idle              = 4'b0000,
        Write_Addres_wait = 4'b0001,
        write_data_wait   = 4'b0011,
        Read_Address_wait = 4'b0111,
        Read_data_wait    = 4'b1111,
        Sending_data      = 4'b1110,
        Operand_A_wait    = 4'b1100,
        operand_B_wait    = 4'b1000,
        ALU_FUN_wait      = 4'b1001,
        ALU_OUT_wait      = 4'b1011,
        Sending_LSB       = 4'b1101,
        Sending_MSB       = 4'b0101
} state_e;

state_e current_state, next_state;


// State Transition
always_ff @(posedge CLK or negedge RST) begin
    if(!RST)
        current_state <= idle;
    else
        current_state <= next_state;
end

always_comb begin
    case (current_state)
        idle: begin
            if(RX_DATA_VALID) begin
                case (SYNCED_DATA)
                    8'hAA: next_state = Write_Addres_wait;
                    8'hBB: next_state = Read_Address_wait;
                    8'hCC: next_state = Operand_A_wait;
                    8'hDD: next_state = ALU_FUN_wait;
                    default: next_state = idle;
                endcase
            end else
                next_state = idle;
        end 

        // Command_Check: begin
        //     if(RX_DATA_VALID) begin
        //         case (SYNCED_DATA)
        //             8'hAA: next_state = Write_Addres_wait;
        //             8'hBB: next_state = Read_Address_wait;
        //             8'hCC: next_state = Operand_A_wait;
        //             8'hDD: next_state = ALU_FUN_wait;
        //             default: next_state = idle;
        //         endcase
        //     end else 
        //         next_state = Command_Check;
        // end

        Write_Addres_wait: begin
            if(RX_DATA_VALID)
                next_state = write_data_wait;
            else
                next_state = Write_Addres_wait;
        end

        write_data_wait: begin
            if(RX_DATA_VALID)
                next_state = idle;
            else
                next_state = write_data_wait;
        end

        Read_Address_wait: begin
            if(RX_DATA_VALID)
                next_state = Read_data_wait;
            else
                next_state = Read_Address_wait;
        end

        Read_data_wait: begin
            if(REG_Rd_Data_valid)
                next_state = Sending_data;
            else
                next_state = Read_data_wait;
        end

        Sending_data: begin
            if(~FIFO_FULL)
                next_state = idle;
            else
                next_state = Sending_data;
        end

        Operand_A_wait: begin
            if(RX_DATA_VALID)
                next_state = operand_B_wait;
            else
                next_state = Operand_A_wait;
        end

        operand_B_wait: begin
            if(RX_DATA_VALID)
                next_state = ALU_FUN_wait;
            else
                next_state = operand_B_wait;
        end

        ALU_FUN_wait: begin
            if(RX_DATA_VALID)
                next_state = ALU_OUT_wait;
            else
                next_state = ALU_FUN_wait;
        end

        ALU_OUT_wait: begin
            if(ALU_OUT_VALID)
                next_state = Sending_LSB;
            else
                next_state = ALU_OUT_wait;
        end

        Sending_LSB: begin
            if(~FIFO_FULL)
                next_state = Sending_MSB;
            else
                next_state = Sending_LSB;
        end

        Sending_MSB: begin
            if(~FIFO_FULL)
                next_state = idle;
            else
                next_state = Sending_MSB;
        end

        default: next_state = idle;
    endcase
end


// Output Logic
always_comb begin
    // Default values
    WrEn = 1'b0;
    RdEn = 1'b0;
    RegAdress = 4'b0;
    Wr_Data = 8'b0;
    Gate_EN = 1'b0;
    ALU_FUN = 4'b0;
    En = 1'b0;
    WR_INC = 1'b0;
    WR_DATA = 8'b0;
    case (current_state)
        // idle: all initialized with zero

        // Command_Check: all initialized with zero

        Write_Addres_wait: begin
            if(RX_DATA_VALID) begin
                RegAdress = SYNCED_DATA[3:0];
            end else begin
                RegAdress = 4'b0;
            end
        end

        write_data_wait: begin
            if(RX_DATA_VALID) begin
                Wr_Data = SYNCED_DATA;
                WrEn = 1'b1;
            end else begin
                Wr_Data = 8'b0;
                WrEn = 1'b0;
            end
        end

        Read_Address_wait: begin
            if(RX_DATA_VALID) begin
                RegAdress = SYNCED_DATA[3:0];
            end else begin
                RegAdress = 4'b0;
            end
        end

        Read_data_wait: begin
            if(REG_Rd_Data_valid) begin
                RdEn = 1'b0;
            end else begin
                RdEn = 1'b1;
            end
        end

        Sending_data: begin
            if(~FIFO_FULL) begin
                WR_DATA = Rd_Data;
                WR_INC = 1'b1;
            end else begin
                Wr_Data = 8'b0;
                WR_INC = 1'b0;
            end
        end

        Operand_A_wait: begin
            if(RX_DATA_VALID) begin
                Wr_Data = SYNCED_DATA;
                WrEn = 1'b1;
            end else begin
                Wr_Data = 8'b0;
                WrEn = 1'b0;
            end
        end

        operand_B_wait: begin
            if(RX_DATA_VALID) begin
                Wr_Data = SYNCED_DATA;
                WrEn = 1'b1;
            end else begin
                Wr_Data = 8'b0;
                WrEn = 1'b0;
            end
        end

        ALU_FUN_wait: begin
            Gate_EN = 1'b1;
            if(RX_DATA_VALID) begin
                ALU_FUN = SYNCED_DATA[3:0];
                En = 1'b1;
            end else begin
                ALU_FUN = 4'b0;
                En = 1'b0;
            end
        end

        ALU_OUT_wait: begin
            if(ALU_OUT_VALID) begin
                En = 1'b0;
                Gate_EN = 1'b0;
            end else begin
                Gate_EN = 1'b1;
                En = 1'b1;
            end
        end

        Sending_LSB: begin
            if (~FIFO_FULL) begin
                WR_DATA = ALU_OUT[7:0]; // Assuming we write the Least 8 bits of ALU_OUT
                WR_INC = 1'b1;
            end else begin
                WR_DATA = 8'b0;
                WR_INC = 1'b0;
            end
        end

        Sending_MSB: begin
            if (~FIFO_FULL) begin
                WR_DATA = ALU_OUT[15:8]; // Assuming we write the Most 8 bits of ALU_OUT
                WR_INC = 1'b1;
            end else begin
                WR_DATA = 8'b0;
                WR_INC = 1'b0;
            end
        end

        default: begin
            // Default values
            WrEn = 1'b0;    
            RdEn = 1'b0;    
            Wr_Data = 8'b0; 
            Gate_EN = 1'b0; 
            RegAdress = 4'b0;   
            ALU_FUN = 4'b0; 
            En = 1'b0;  
            WR_INC = 1'b0;  
            WR_DATA = 8'b0; 
        end
        endcase
end

always_ff @(posedge CLK or negedge RST) begin
    if(!RST)
        Addr = 4'b0;
    else begin
        case (current_state)
            Write_Addres_wait: Addr <= RegAdress;
            Read_Address_wait: Addr <= RegAdress;
            Operand_A_wait: Addr <= 4'b0;    // REG0 is at address 0
            operand_B_wait: Addr <= 4'd1;    // REG1 is at address 1
        endcase
    end
end

endmodule