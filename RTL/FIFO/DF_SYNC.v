module DF_SYNC #(
    parameter ADDR_WIDTH = 4
) (
    input wire [ADDR_WIDTH-1:0] ptr,
    input wire clk,
    input wire rst,
    output reg [ADDR_WIDTH-1:0] q2_ptr
);

reg [ADDR_WIDTH-1:0] FF_inside;  // First flip-flop stage

always @(posedge clk or negedge rst) begin
    if (!rst) begin  // Active low reset
        FF_inside  <= 0;
        q2_ptr <= 0;
    end else begin
        FF_inside <= ptr;   // First stage
        q2_ptr <= FF_inside;    // Second stage
    end
end

endmodule