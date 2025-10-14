module RX_Top_Module #(
    parameter Data_width_top = 8
)(
    input wire RX_IN_top,
    input wire [5:0] prescale_top,
    input wire PAR_EN_top,
    input wire PAR_TYP_top,
    input wire CLK_top,
    input wire RST_top,
    output wire data_valid_top,
    output wire [Data_width_top-1:0] P_DATA_top,
    output wire stp_err_top,
    output wire par_err_top
);


// Internal Signals
wire [3:0] bit_cnt_top;
wire [5:0] edge_cnt_top;
wire    dat_samp_en_top,
        enable_top,
        sampled_bit_top,
        deser_en_top,
        par_chk_en_top,
        strt_chck_en_top,
        strt_glitch_top,
        stp_chk_en_top,
        par_err_wire,
        stp_err_wire;

// Assign internal to top outputs
assign stp_err_top = stp_err_wire;
assign par_err_top = par_err_wire;

// Instantiate modules
FSM_RX FSM_INST(
    .RX_IN(RX_IN_top),
    .PAR_EN(PAR_EN_top),
    .edge_cnt(edge_cnt_top),
    .bit_cnt(bit_cnt_top),
    .stp_err(stp_err_top),
    .strt_glitch(strt_glitch_top),
    .par_err(par_err_top),
    .par_en(PAR_EN_top),
    .prescale(prescale_top),
    .CLK(CLK_top),
    .RST(RST_top),
    .dat_samp_en(dat_samp_en_top),
    .enable(enable_top),
    .deser_en(deser_en_top),
    .data_valid(data_valid_top),
    .par_chk_en(par_chk_en_top),
    .strt_chck_en(strt_chck_en_top),
    .stp_chk_en(stp_chk_en_top)
);

data_sampling data_sampling_INST(
    .prescale(prescale_top),
    .RX_IN(RX_IN_top),
    .dat_samp_en(dat_samp_en_top),
    .edge_cnt(edge_cnt_top),
    .CLK(CLK_top),
    .RST(RST_top),
    .sampled_bit(sampled_bit_top)
);

deserializer #(.Data_width(Data_width_top)) deserializer_INST(
    .deser_en(deser_en_top),
    .sampled_bit(sampled_bit_top),
    .edge_cnt(edge_cnt_top),
    .bit_cnt(bit_cnt_top),
    .prescale(prescale_top),
    .CLK(CLK_top),
    .RST(RST_top),
    .P_DATA(P_DATA_top)
);

edge_bit_counter edge_bit_counter_INST(
    .CLK(CLK_top),
    .RST(RST_top),
    .enable(enable_top),
    .stp_chk_en(stp_chk_en_top),
    .edge_cnt(edge_cnt_top),
    .bit_cnt(bit_cnt_top),
    .prescale(prescale_top)
);

Strt_Check Strt_Check_INST(
    .strt_chck_en(strt_chck_en_top),
    .sampled_bit(sampled_bit_top),
    .edge_cnt(edge_cnt_top),
    .prescale(prescale_top),
    .strt_glitch(strt_glitch_top)
);

Parity_Check #(.Data_width(Data_width_top)) Parity_Check_INST(
    .par_chk_en(par_chk_en_top),
    .PAR_TYP(PAR_TYP_top),
    .sampled_bit(sampled_bit_top),
    .P_DATA(P_DATA_top),
    .edge_cnt(edge_cnt_top),
    .prescale(prescale_top),
    .par_err(par_err_wire)
);

Stop_Check Stop_Check_INST(
    .stp_chk_en(stp_chk_en_top),
    .edge_cnt(edge_cnt_top),
    .prescale(prescale_top),
    .sampled_bit(sampled_bit_top),
    .stp_err(stp_err_wire)
);

endmodule