module UART_TX #(
    parameter Data_width_top = 8
)(
    input wire [Data_width_top-1:0] p_data_TOP,
    input wire data_valid_TOP,
    input wire par_typ_TOP,
    input wire part_en_TOP,
    input wire CLK_TOP,
    input wire RST_TOP,
    output wire TX_OUT_TOP,
    output wire busy_TOP
);

// Internal Signals
wire ser_done_top;
wire ser_en_top;
wire par_bit_top;
wire ser_data_top;
wire [1:0] mux_sel_top;

// Serializer instance
serializer #(.Data_width(Data_width_top)) serializerINST(
    .p_data(p_data_TOP),
    .ser_data(ser_data_top),
    .ser_done(ser_done_top),
    .ser_en(ser_en_top),
    .CLK(CLK_TOP),
    .RST(RST_TOP)
);

// FSM instance
FSM FSMINST(
    .data_valid(data_valid_TOP),
    .par_en(part_en_TOP),
    .ser_done(ser_done_top),
    .ser_en(ser_en_top),
    .mux_sel(mux_sel_top),
    .busy(busy_TOP),
    .CLK(CLK_TOP),
    .RST(RST_TOP)
);

// parity_calc instance
parity_calc #(.Data_width(Data_width_top)) parity_calcINST(
    .p_data(p_data_TOP),
    .data_valid(data_valid_TOP),
    .par_typ(par_typ_TOP),
    .busy(busy_TOP),
    .par_bit(par_bit_top),
    .CLK(CLK_TOP),
    .RST(RST_TOP)
);

// MUX instance
MUX MUXINST(
    .mux_sel(mux_sel_top),
    .ser_data(ser_data_top),
    .par_bit(par_bit_top),
    .TX_OUT(TX_OUT_TOP)
);

endmodule