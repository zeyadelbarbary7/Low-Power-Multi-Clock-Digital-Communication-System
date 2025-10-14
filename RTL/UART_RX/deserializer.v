module deserializer #(
    parameter Data_width = 8
)(
    input wire sampled_bit,
    input wire deser_en,
    input wire [5:0] edge_cnt,
    input wire [3:0] bit_cnt,
    input wire [5:0] prescale,
    input wire CLK,
    input wire RST,
    output reg [Data_width-1:0] P_DATA
);


always @(posedge CLK or negedge RST) begin
    if (!RST)  // Active low RST
        P_DATA <= 8'd0;
    else if (deser_en && bit_cnt < 4'd9 && edge_cnt == (prescale - 1)) 
        P_DATA[bit_cnt-1] <= sampled_bit; // receive LSB first
    else
        P_DATA <= P_DATA; // retain previous value
end

endmodule