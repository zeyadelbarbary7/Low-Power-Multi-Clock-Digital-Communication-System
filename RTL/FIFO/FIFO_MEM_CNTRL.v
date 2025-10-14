module FIFO_MEM_CNTRL #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 8
) (
    input wire [DATA_WIDTH-1:0] wdata,
    input wire [ADDR_WIDTH-2:0] waddr,
    input wire wfull,
    input wire winc,
    input wire wclk,
    input wire wrst_n,
    input wire [ADDR_WIDTH-2:0] raddr,
    output reg [DATA_WIDTH-1:0] rdata
);

localparam DEPTH = (1 << (ADDR_WIDTH-1));   // 2^ADDR_WIDTH

integer i;

reg [DATA_WIDTH-1:0] FIFO_MEMORY [DEPTH-1:0];   // FIFO memory array

wire wclken;    
assign wclken = (winc & ~wfull);    // write enable

always @(posedge wclk or negedge wrst_n) begin
    if(!wrst_n) begin   // Active low reset
        for (i = 0 ; i < DEPTH ; i = i + 1) begin
            FIFO_MEMORY [i] = {DATA_WIDTH{1'b0}};
        end
    end else if (wclken) begin
        FIFO_MEMORY[waddr] <= wdata;    // write operation
    end

end

always @(*) begin
    rdata <= FIFO_MEMORY[raddr];    // read operation
end

endmodule