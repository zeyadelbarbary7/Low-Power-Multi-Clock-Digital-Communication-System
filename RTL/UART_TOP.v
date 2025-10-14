module UART_TOP #(
    parameter Data_width = 8
) (
    input wire RX_IN,
    input wire F_EMPTY_VALID,
    input wire [Data_width-1:0] RD_Data,
    input wire [Data_width-1:0] UART_CONFIG,
    input wire TX_CLK,
    input wire RX_CLK,
    input wire RST_UART,
    output wire TX_OUT,
    output wire BUSY,
    output wire parity_error,
    output wire Frame_error,
    output wire [Data_width-1:0] RX_OUT,
    output wire RX_VALID
);

// Instantiation of UART_TX
UART_TX #(
    .Data_width_top(Data_width)
) UART_TX_INST(
    .p_data_TOP(RD_Data),
    .data_valid_TOP(~F_EMPTY_VALID),
    .part_en_TOP(UART_CONFIG[0]),
    .par_typ_TOP(UART_CONFIG[1]),
    .CLK_TOP(TX_CLK),
    .RST_TOP(RST_UART),
    .TX_OUT_TOP(TX_OUT),
    .busy_TOP(BUSY)
);

// Instantiation of UART_RX
RX_Top_Module #(.Data_width_top(Data_width)) RX_Top_Module_inst(
    .RX_IN_top(RX_IN),
    .prescale_top(UART_CONFIG[7:2]),
    .PAR_EN_top(UART_CONFIG[0]),
    .PAR_TYP_top(UART_CONFIG[1]),
    .CLK_top(RX_CLK),
    .RST_top(RST_UART),
    .data_valid_top(RX_VALID),
    .P_DATA_top(RX_OUT),
    .stp_err_top(Frame_error),
    .par_err_top(parity_error)
);


endmodule