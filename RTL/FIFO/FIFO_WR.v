module FIFO_WR #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
) (
    input wire winc,
    input wire [ADDR_WIDTH-1:0] wq2_rptr,
    input wire wclk,
    input wire wrst_n,
    output wire wfull,
    output reg [ADDR_WIDTH-1:0] wptr,
    output wire [ADDR_WIDTH-2:0] wadrr
);

// internal signals
reg [ADDR_WIDTH-1:0] binary_wptr;   // binary write pointer

wire [ADDR_WIDTH-1:0] wptr_comb;

assign wptr_comb = binary_wptr ^ (binary_wptr >> 1); // gray code pointer

// full logic
assign wfull = ((wq2_rptr[ADDR_WIDTH-1] != wptr[ADDR_WIDTH-1]) 
            && (wq2_rptr[ADDR_WIDTH-2] != wptr[ADDR_WIDTH-2]) 
            && (wq2_rptr[ADDR_WIDTH-3:0] == wptr[ADDR_WIDTH-3:0]));

assign wadrr = binary_wptr[ADDR_WIDTH-2:0]; // write address

// increment binary pointer
always @(posedge wclk or negedge wrst_n) begin
    if(!wrst_n) begin   // Active low reset
        binary_wptr <= {ADDR_WIDTH{1'b0}};
    end else if (winc & ~wfull) begin   // write pointer increment
        binary_wptr <= binary_wptr + 1'b1;
    end
end

// converting binary write pointer to gray coded
always @(posedge wclk or negedge wrst_n) begin
    if(!wrst_n) begin
        wptr <= 'b0;
    end else
        wptr <= wptr_comb;
end

endmodule