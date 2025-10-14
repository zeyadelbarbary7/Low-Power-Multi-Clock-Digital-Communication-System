module parity_calc #(
    parameter Data_width = 8
)(
    input wire [Data_width-1:0] p_data,
    input wire data_valid,
    input wire par_typ, // 0 : Even , 1 : odd
    input wire CLK,
    input wire RST,
    input wire busy,
    output reg par_bit
);

always @(posedge CLK or negedge RST)
begin
    if (!RST)
    begin
        par_bit <= 1'b0;
    end
    else
    begin
        if (data_valid && !busy)
        begin
            if (par_typ == 1'b0) // Even Parity
                par_bit <= ^p_data;
            else // Odd Parity
                par_bit <= ~^p_data;
        end
    end
end

endmodule