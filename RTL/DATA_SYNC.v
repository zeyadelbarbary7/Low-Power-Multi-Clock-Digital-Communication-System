module DATA_SYNC #(
    parameter NUM_STAGES = 2,   // No of FF stages for synchronizing
    parameter BUS_WIDTH = 8
) (
    input wire [BUS_WIDTH-1:0] unsync_bus,
    input wire bus_enable,
    input wire CLK,
    input wire RST,
    output reg [BUS_WIDTH-1:0] sync_bus,
    output reg enable_pulse
);

reg [NUM_STAGES-1:0] bus_enable_out;    // shift register to pass "bus_enable" through NUM_STAGES flip-flops
reg enable_flop;

// combinational wire that generates the "new data" pulse
wire Pulse_Gen;
assign Pulse_Gen = bus_enable_out[NUM_STAGES-1] & !enable_flop;

// MUX
always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        sync_bus <= {BUS_WIDTH{1'b0}};
    end else if (Pulse_Gen) begin
        sync_bus <= unsync_bus; // capture new value when pulse hits
    end else
        sync_bus <= sync_bus;   // Hold the old Value
end

// synchronizer for bus_enable signal (Parameterized)
always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        bus_enable_out <= {NUM_STAGES{1'b0}};
    end else begin
        bus_enable_out <= {bus_enable_out[NUM_STAGES-2:0],bus_enable};
    end
end

// store last stage of bus_enable_out for pulse generation
always @(posedge CLK or negedge RST ) begin
    if(!RST)
        enable_flop <= 1'b0;
    else
        enable_flop <= bus_enable_out[NUM_STAGES-1];
end

// register the pulse_Gen so it aligns with sync_bus update
always @(posedge CLK or negedge RST) begin
    if(!RST)
        enable_pulse <= 1'b0;
    else
        enable_pulse <= Pulse_Gen;
end

endmodule