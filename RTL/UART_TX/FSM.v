module FSM (
    input wire data_valid,
    input wire par_en,
    input wire ser_done,
    input wire CLK,
    input wire RST,
    output reg ser_en,
    output reg busy,
    output reg [1:0] mux_sel
);

// FSM Encoding (Gray)
localparam  idle = 3'b000,
            Send_Start = 3'b001,
            Send_data = 3'b011,
            send_parity = 3'b111,
            send_end = 3'b110;

reg [2:0] current_state, next_state;

// State Transition
always @(posedge CLK or negedge RST)
begin
    if(!RST)
        current_state <= idle;
    else
        current_state <= next_state;
end

// State Transition
always @(*)
begin
    case (current_state)
        idle:
        begin
            if(data_valid)
                next_state = Send_Start;
            else
                next_state = idle;
        end 

        Send_Start: next_state = Send_data;

        Send_data:
        begin
            if (ser_done)
                next_state = par_en ? send_parity : send_end;
            else
                next_state = Send_data;
        end

        send_parity: next_state = send_end;

        send_end: next_state = idle;
        // begin
        //     if(data_valid)
        //         next_state = Send_Start;
        //     else
        //         next_state = idle;
        // end

        default: next_state = idle;
    endcase
end

// Output Logic
always @(*) begin
    busy = 1'b1;
    ser_en = 1'b0;
    mux_sel = 2'b01;

    case (current_state)
        idle: busy = 1'b0;

        Send_Start:
        begin
            ser_en = 1'b1;
            mux_sel = 2'b00;
        end

        Send_data: mux_sel = 2'b10;

        send_parity: mux_sel = 2'b11;

        send_end: mux_sel = 2'b01;

        default: 
        begin
            busy = 1'b0;
            ser_en = 1'b0;
            mux_sel = 2'b01;
        end
    endcase
end

endmodule