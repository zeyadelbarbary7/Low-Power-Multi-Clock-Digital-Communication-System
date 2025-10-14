module Pulse_Gen (
    input wire RST,
    input wire CLK,
    input wire LVL_SIG,
    output wire PULSE_SIG
);

reg Flop1, Flop2;

assign PULSE_SIG = Flop1 & ~Flop2;

always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        Flop1 <= 1'b0;
        Flop2 <= 1'b0;
    end else begin
        Flop1 <= LVL_SIG;
        Flop2 <= Flop1;
    end
end

endmodule