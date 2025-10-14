module ASYNC_FIFO #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)(
    input  wire W_CLK,
    input  wire W_RST,
    input  wire W_INC,
    input  wire [DATA_WIDTH-1:0] WR_DATA,
    input  wire R_CLK,
    input  wire R_RST,
    input  wire R_INC,
    output wire [DATA_WIDTH-1:0] RD_DATA,
    output wire FULL,
    output wire EMPTY
);

// internal signals
wire [ADDR_WIDTH-1:0] wptr;
wire [ADDR_WIDTH-1:0] rptr;
wire [ADDR_WIDTH-1:0] wq2_rptr;
wire [ADDR_WIDTH-1:0] rq2_wptr;
wire [ADDR_WIDTH-2:0] waddr; 
wire [ADDR_WIDTH-2:0] raddr;

// Synchronizers
DF_SYNC #(.ADDR_WIDTH(ADDR_WIDTH)) sync_rptr_to_wclk (
    .ptr(rptr),
    .clk(W_CLK),
    .rst(W_RST),
    .q2_ptr(wq2_rptr)
);

DF_SYNC #(.ADDR_WIDTH(ADDR_WIDTH)) sync_wptr_to_rclk (
    .ptr(wptr),
    .clk(R_CLK),
    .rst(R_RST),
    .q2_ptr(rq2_wptr)
);

// Write pointer and full logic
FIFO_WR #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) write_ctrl (
    .winc(W_INC),
    .wq2_rptr(wq2_rptr),
    .wclk(W_CLK),
    .wrst_n(W_RST),
    .wfull(FULL),
    .wptr(wptr),
    .wadrr(waddr)
);

// Read pointer and empty logic
FIFO_RD #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) read_ctrl (
    .rinc(R_INC),
    .rclk(R_CLK),
    .rrst_n(R_RST),
    .rq2_wptr(rq2_wptr),
    .rempty(EMPTY),
    .rptr(rptr),
    .raddr(raddr)
);

// FIFO memory
FIFO_MEM_CNTRL #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) mem_ctrl (
    .wdata(WR_DATA),
    .waddr(waddr),
    .wfull(FULL),
    .winc(W_INC),
    .wclk(W_CLK),
    .wrst_n(W_RST),
    .raddr(raddr),
    .rdata(RD_DATA)
);

endmodule
