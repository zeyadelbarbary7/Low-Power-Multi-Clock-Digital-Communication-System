module FIFO_RD #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 8
) (
    input wire rinc,
    input wire rclk,
    input wire rrst_n,
    input wire [ADDR_WIDTH-1:0] rq2_wptr,
    output wire rempty,
    output reg [ADDR_WIDTH-1:0] rptr,
    output wire [ADDR_WIDTH-2:0] raddr
);

// internal signals
reg [ADDR_WIDTH-1:0] binary_rptr;   // binary read pointer

wire [ADDR_WIDTH-1:0] rptr_comb;

assign rptr_comb = binary_rptr ^ (binary_rptr >> 1); // gray code pointer

assign raddr = binary_rptr[ADDR_WIDTH-2:0]; // read address

assign rempty = (rptr == rq2_wptr); // empty logic

// increment binary pointer
always @(posedge rclk or negedge rrst_n) begin
    if(!rrst_n) begin   // Active low reset
        binary_rptr <= {ADDR_WIDTH{1'b0}};
    end else if (rinc & ~rempty) begin  // read pointer increment
        binary_rptr <= binary_rptr + 1;
    end
end

// converting binary read pointer to gray coded
always @(posedge rclk or negedge rrst_n) begin
    if(!rrst_n)
        rptr <= 'b0;
    else
        rptr <= rptr_comb;
end

endmodule