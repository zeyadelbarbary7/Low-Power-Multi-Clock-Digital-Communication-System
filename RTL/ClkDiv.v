module ClkDiv #(
    parameter DivRatio_Width = 8 
)(
    input wire i_ref_clk,
    input wire i_rst_n,
    input wire i_clk_en,
    input wire [DivRatio_Width-1:0] i_div_ratio,
    output wire o_div_clk
);

reg [DivRatio_Width-1:0] counter;  // Counter to track clock cycles
reg flag;   // For hadling odd division
reg div_clk_internal;   // Internal divided Clock (will be assigned to the o_div_clk)
reg [DivRatio_Width-1:0] prev_div_ratio;   // to detect changes in div_ration
reg flag_odd;   // for handling when change from even to odd and last div_clk_internal is high

wire odd_check; // 1 if division ratio is odd, 0 if even
assign odd_check = i_div_ratio[0];

wire [DivRatio_Width-1:0] half_toggle;
assign half_toggle = i_div_ratio >> 1;

wire [DivRatio_Width-1:0] half_toggle_p1;
assign half_toggle_p1 = i_div_ratio - half_toggle;

always @(posedge i_ref_clk or negedge i_rst_n) begin
    if(!i_rst_n) begin  // Active Low RST
        div_clk_internal <= 1'b0;
        flag <= 1'b0;
        counter <= 8'd1;
        prev_div_ratio <= i_div_ratio;
        flag_odd <= 1'b0;
    end else begin
        if (i_div_ratio != prev_div_ratio) begin    // If divider ratio changes, reset counter and flag
            prev_div_ratio <= i_div_ratio; // Update div_ratio
            div_clk_internal <= ~div_clk_internal;  // Flip ensures smoother transition
            counter <= 8'd1;
            flag <= 1'b0;
            flag_odd <= (div_clk_internal);     // Save state for odd divider case
        end else if((i_clk_en == 1) && (i_div_ratio > 1)) begin     // Handling Even case (regular case)
            if (!odd_check && counter == half_toggle) begin
                div_clk_internal <= !div_clk_internal;
                counter <= 8'd1;
            end else if(odd_check && flag_odd) begin    // Handilng odd case when last div_clk_internal is high
                counter <= counter + 1;
                flag_odd <= 0;
                flag <= ~flag;
            end else if(odd_check && (((counter == half_toggle) && !flag) || ((counter == half_toggle_p1) && flag))) begin  // Handling Odd regular case
                div_clk_internal <= !div_clk_internal;
                counter <= 8'd1;
                flag <= !flag;
            end else    // Keep counting
                counter <= counter + 1;
        end else begin  // Force reset when i_clk_en is disabled
            div_clk_internal <= 1'b0;
            flag <= 1'b0;
            counter <= 8'd1;
        end
    end
end

// Final output: divided clock if enabled & ratio > 1, else pass ref clock
assign o_div_clk = (i_clk_en && (i_div_ratio > 1)) ? div_clk_internal : i_ref_clk;


endmodule