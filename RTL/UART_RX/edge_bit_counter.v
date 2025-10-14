module edge_bit_counter (
    input wire enable,
    input wire [5:0] prescale,
    input wire stp_chk_en,
    input wire CLK,
    input wire RST,
    output reg [3:0] bit_cnt,
    output reg [5:0] edge_cnt
);

always @(posedge CLK or negedge RST) begin
    if(!RST) begin      // Active low RST
        edge_cnt <= 6'd0;
        bit_cnt <= 4'd0;
    end else if (enable && bit_cnt < 4'd11) begin
        if(edge_cnt == (prescale - 1)) begin
            edge_cnt <= 6'd0;           // resed edge_counter after prescale
            bit_cnt <= bit_cnt + 1;     // increment bit counter by one when edge_counter == prescale
        end else
            edge_cnt <= edge_cnt + 1;
    end else begin  // Reset Data if not enabled
        edge_cnt <= 6'd0;
        bit_cnt <= 4'd0;
    end
end

endmodule