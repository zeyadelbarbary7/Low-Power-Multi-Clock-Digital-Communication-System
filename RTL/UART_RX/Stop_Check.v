module Stop_Check (
    input wire stp_chk_en,
    input wire sampled_bit,
    input wire [5:0] edge_cnt,
    input wire [5:0] prescale,
    output wire stp_err
);

// Check for stop bit error
assign stp_err = (stp_chk_en && (sampled_bit == 0) && edge_cnt == (prescale - 1));

endmodule
