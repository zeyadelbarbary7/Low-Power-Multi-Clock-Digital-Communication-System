module Strt_Check (
    input wire        strt_chck_en,
    input wire        sampled_bit,
    input wire [5:0]  edge_cnt,
    input wire [5:0]  prescale,
    output wire        strt_glitch
);

// Check for start bit glitch
assign strt_glitch = (strt_chck_en && (edge_cnt == (prescale - 1)) && (sampled_bit == 1));

endmodule