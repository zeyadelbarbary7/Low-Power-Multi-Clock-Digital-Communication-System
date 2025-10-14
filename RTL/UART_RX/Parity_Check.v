module Parity_Check #(
    parameter Data_width = 8
)(
    input wire par_chk_en,
    input wire PAR_TYP,         // 0 : Even , 1 : Odd
    input wire sampled_bit,
    input wire [Data_width-1:0] P_DATA,    // Data from deserializer
    input wire [5:0] edge_cnt,
    input wire [5:0] prescale,
    output reg  par_err
);

always @(*) begin
    if (par_chk_en && (edge_cnt == (prescale - 1))) begin
        if (PAR_TYP == 1'b0)
            par_err = (sampled_bit != ^P_DATA);   // even parity check
        else
            par_err = (sampled_bit != ~^P_DATA);  // odd parity check
    end else begin
        par_err = 1'b0;
    end
end

endmodule
