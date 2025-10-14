module RST_SYNC #(
    parameter NUM_STAGES = 2    // No of FF stages for RST synchronizing
) (
    input wire RST,
    input wire CLK,
    output wire SYNC_RST
);

// FF stages to make reset safe with the clock
reg [NUM_STAGES-1:0] SYNC_RST_FF;

// The synchronized reset comes from the last flip-flop in the chain
assign SYNC_RST = SYNC_RST_FF[NUM_STAGES-1];

always @(posedge CLK or negedge RST) begin
    if(!RST) begin 
        // When reset is active, clear all flip-flops
        SYNC_RST_FF <= {NUM_STAGES{1'b0}};
    end else begin
        // When reset is released, shift in 1's
        // After a NUM_STAGES FF, output goes high with the clock
        SYNC_RST_FF <= {SYNC_RST_FF[NUM_STAGES-2:0], 1'b1};
    end
end

endmodule