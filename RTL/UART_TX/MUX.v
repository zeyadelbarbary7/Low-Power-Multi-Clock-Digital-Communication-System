module MUX (
    input wire [1:0] mux_sel,
    input wire ser_data,
    input wire par_bit,
    output reg TX_OUT
);

localparam  start_bit_mux = 2'b00,
            stop_bit_mux = 2'b01,
            ser_data_mux = 2'b10,
            par_bit_mux = 2'b11;

localparam  start_bit = 1'b0,
            stop_bit = 1'b1;

always @(*)
begin
    case (mux_sel)
        start_bit_mux: TX_OUT = start_bit;
        stop_bit_mux: TX_OUT = stop_bit;
        ser_data_mux: TX_OUT = ser_data;
        par_bit_mux: TX_OUT = par_bit;
        default: TX_OUT = stop_bit;
    endcase
end

endmodule