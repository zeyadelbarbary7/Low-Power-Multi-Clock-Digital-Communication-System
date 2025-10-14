module data_sampling (
    input wire [5:0] prescale,
    input wire RX_IN,
    input wire dat_samp_en,
    input wire [5:0] edge_cnt,
    input wire CLK,
    input wire RST,
    output reg sampled_bit
);

reg [2:0] samples_registers;    // Storing 3 samples
reg [1:0] samples_counter;      // Samples Counter

always @(posedge CLK or negedge RST) begin
    if (!RST) begin // Active low RST
        sampled_bit <= 1'b0;
        samples_counter <= 2'd0;
        samples_registers <= 3'd0;
    end else if (dat_samp_en) begin         // Takes 3 samples (mid and and 2 cycles around)
        if ((edge_cnt == prescale/2) || (edge_cnt == (prescale/2) + 1) || (edge_cnt == (prescale/2) - 1)) begin
            samples_registers[samples_counter] <= RX_IN;
            samples_counter <= samples_counter + 1;
        end

        if (samples_counter == 2'd3) begin      // Voting after 3 samples
            sampled_bit <= (samples_registers[0] & samples_registers[1]) | (samples_registers[1] & samples_registers[2]) | (samples_registers[0] & samples_registers[2]);
            samples_counter <= 2'd0;
        end
    end
end

endmodule