module SYS_TOP #(
    parameter DATA_WIDTH_IN = 8,
    parameter ADDRESS_WIDTH = 4,
    parameter ALU_OPERATIONS = 4,
    parameter DATA_WIDTH_OUT = DATA_WIDTH_IN * 2,
    parameter SYNC_NUM_STAGES = 2,
    parameter DivRatio_Width_top = 8
) (
    input wire UART_RX_IN,
    input wire UART_CLK,
    input wire REF_CLK,
    input wire RST_N,
    output wire UART_TX_O,
    output wire parity_error,
    output wire framing_error
);

// internal signals
wire WrEn_top;
wire RdEn_top;
wire [ADDRESS_WIDTH-1:0] Addr_top;
wire [DATA_WIDTH_IN-1:0] Wr_D_top;
wire [DATA_WIDTH_IN-1:0] Rd_D_top;
wire Rd_D_Vld_top;
wire Gate_EN_top;
wire [DATA_WIDTH_IN-1:0] OP_A_top;
wire [DATA_WIDTH_IN-1:0] OP_B_top;
wire ALU_CLK_top;
wire [ALU_OPERATIONS-1:0] ALU_FUN_top;
wire ALU_EN_top;
wire [DATA_WIDTH_OUT-1:0] ALU_OUT_top;
wire ALU_OUT_VALID_top;
wire [DATA_WIDTH_IN-1:0] WR_DATA_top;
wire WR_INC_top;
wire FIFO_FULL_top;
wire SYNC_RST_1;
wire SYNC_RST_2;
wire CLK_div_en_top;
wire [DivRatio_Width_top-1:0] Div_ratio_top;
wire [DivRatio_Width_top-1:0] Div_ratio_MUX_top;
wire RX_CLK_top;
wire TX_CLK_top;
wire FIFO_EMPTY_top;
wire [DATA_WIDTH_IN-1:0] RD_DATA_top;
wire [DATA_WIDTH_IN-1:0] UART_CONFIG_top;
wire RD_INC_top;   // output of Pulse_Gen module
wire BUSY_top;      // output of UART w input of Pulse_Gen module
wire [DATA_WIDTH_IN-1:0] RX_OUTPUT;    // output of UART w input of DATA Synchronizer module
wire RX_DATA_VALID_OUTPUT;    // output of UART w input of DATA Synchronizer module
wire [DATA_WIDTH_IN-1:0] RX_DATA_SYNC;    // output of DATA Synchronizer w input SYS_CTRL
wire RX_DATA_VALID_SYNC;    // output of DATA Synchronizer w input SYS_CTRL

// modules instantiation
CLK_GATE clk_gate_inst (
    .CLK_EN(Gate_EN_top),
    .CLK(REF_CLK),
    .GATED_CLK(ALU_CLK_top)
);

// Reset Synchronizers
RST_SYNC #(
    .NUM_STAGES(SYNC_NUM_STAGES)
) rst_sync_1_inst (
    .RST(RST_N),
    .CLK(REF_CLK),
    .SYNC_RST(SYNC_RST_1)
);

RST_SYNC #(
    .NUM_STAGES(SYNC_NUM_STAGES)
) rst_sync_2_inst (
    .RST(RST_N),
    .CLK(UART_CLK),
    .SYNC_RST(SYNC_RST_2)
);

// Clock Dividers
ClkDiv #(
    .DivRatio_Width(DivRatio_Width_top)
) ClkDiv_RX_inst (
    .i_ref_clk(UART_CLK),
    .i_rst_n(SYNC_RST_2),
    .i_clk_en(CLK_div_en_top),
    .i_div_ratio(Div_ratio_MUX_top),     // output of the MUX (Prescale) lazm yt8yr
    .o_div_clk(RX_CLK_top)    // --> to UART_RX_CLK
);

ClkDiv #(
    .DivRatio_Width(DivRatio_Width_top)
) ClkDiv_TX_inst (
    .i_ref_clk(UART_CLK),
    .i_rst_n(SYNC_RST_2),
    .i_clk_en(CLK_div_en_top),
    .i_div_ratio(Div_ratio_top),
    .o_div_clk(TX_CLK_top)    // --> to UART_TX_CLK
);

// Pulse Generator
Pulse_Gen Pulse_Gen_inst(
    .RST(SYNC_RST_2),
    .CLK(TX_CLK_top),
    .LVL_SIG(BUSY_top),
    .PULSE_SIG(RD_INC_top)
);

// Data Synchronizer
DATA_SYNC #(
    .NUM_STAGES(SYNC_NUM_STAGES),
    .BUS_WIDTH(DATA_WIDTH_IN)
) DATA_SYNC_inst (
    .unsync_bus(RX_OUTPUT),
    .bus_enable(RX_DATA_VALID_OUTPUT),
    .CLK(REF_CLK),
    .RST(SYNC_RST_1),
    .sync_bus(RX_DATA_SYNC),
    .enable_pulse(RX_DATA_VALID_SYNC)
);

// MUX for Div_ratio selection
CLKDIV_MUX #(
    .WIDTH(DATA_WIDTH_IN)
) CLKDIV_MUX_inst (
    .IN(UART_CONFIG_top[7:2]),
    .OUT(Div_ratio_MUX_top)
);

// UART_TOP
UART_TOP #(
    .Data_width(DATA_WIDTH_IN)
) UART_TOP_inst (
    .RX_IN(UART_RX_IN),
    .F_EMPTY_VALID(FIFO_EMPTY_top),
    .RD_Data(RD_DATA_top),
    .UART_CONFIG(UART_CONFIG_top),
    .TX_CLK(TX_CLK_top),
    .RX_CLK(RX_CLK_top),
    .RST_UART(SYNC_RST_2),
    .TX_OUT(UART_TX_O),
    .BUSY(BUSY_top),
    .parity_error(parity_error),
    .Frame_error(framing_error),
    .RX_OUT(RX_OUTPUT),
    .RX_VALID(RX_DATA_VALID_OUTPUT)
);

// System Controller
SYS_CTRL #(
    .Data_width(DATA_WIDTH_IN),
    .Address_width(ADDRESS_WIDTH),
    .ALU_Operations(ALU_OPERATIONS)
) sys_ctrl_inst (
    .Rd_Data(Rd_D_top), 
    .REG_Rd_Data_valid(Rd_D_Vld_top),
    .ALU_OUT(ALU_OUT_top),
    .ALU_OUT_VALID(ALU_OUT_VALID_top),
    .FIFO_FULL(FIFO_FULL_top),
    .SYNCED_DATA(RX_DATA_SYNC),  //3ayezz 28yrhom l lly hykhrog mn l data Synchronizer
    .RX_DATA_VALID(RX_DATA_VALID_SYNC),   //3ayezz 28yrhom l lly hykhrog mn l data Synchronizer
    .CLK(REF_CLK),
    .RST(SYNC_RST_1),
    .WrEn(WrEn_top),
    .RdEn(RdEn_top),
    .Addr(Addr_top),
    .Wr_Data(Wr_D_top),
    .Gate_EN(Gate_EN_top),
    .ALU_FUN(ALU_FUN_top),
    .En(ALU_EN_top),
    .WR_INC(WR_INC_top),
    .WR_DATA(WR_DATA_top),
    .CLK_div_en(CLK_div_en_top)
);

// Register File
Register_File #(
    .Data_width(DATA_WIDTH_IN),
    .Address_width(ADDRESS_WIDTH)
) register_file_inst (
    .WrData(Wr_D_top),
    .Address(Addr_top),
    .WrEn(WrEn_top),
    .RdEn(RdEn_top),
    .CLK(REF_CLK),
    .RST(SYNC_RST_1),
    .RdData(Rd_D_top),
    .RdData_Valid(Rd_D_Vld_top),
    .REG0(OP_A_top),
    .REG1(OP_B_top),
    .REG2(UART_CONFIG_top),
    .REG3(Div_ratio_top)
);

// ALU
ALU #(
    .input_width(DATA_WIDTH_IN),
    .output_width(DATA_WIDTH_OUT)
) ALU_inst(
    .A(OP_A_top),
    .B(OP_B_top),
    .ALU_FUN(ALU_FUN_top),
    .Enable(ALU_EN_top),
    .CLK(ALU_CLK_top),
    .RST(SYNC_RST_1),
    .ALU_OUT(ALU_OUT_top),
    .OUT_VALID(ALU_OUT_VALID_top)
);

// ASYNC FIFO
ASYNC_FIFO #(
    .DATA_WIDTH(DATA_WIDTH_IN),
    .ADDR_WIDTH(ADDRESS_WIDTH)
) async_fifo_inst (
    .W_CLK(REF_CLK),
    .W_RST(SYNC_RST_1),
    .W_INC(WR_INC_top),
    .WR_DATA(WR_DATA_top),
    .R_CLK(TX_CLK_top),
    .R_RST(SYNC_RST_2),
    .R_INC(RD_INC_top),     // 3ayez 28yro l lly hykhrog mn l pulse GEN module
    .RD_DATA(RD_DATA_top),
    .FULL(FIFO_FULL_top),
    .EMPTY(FIFO_EMPTY_top)
);

endmodule