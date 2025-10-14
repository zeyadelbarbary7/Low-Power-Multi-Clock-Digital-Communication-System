module serializer #(
    parameter Data_width = 8
)(
    input wire [Data_width-1:0] p_data,
    input wire ser_en,
    input wire CLK,
    input wire RST,
    output reg ser_data,
    output reg ser_done
);

reg [2:0] counter;
reg [Data_width-1:0] shift_reg;

wire flag;
assign flag = (counter == 3'd7);

always @(posedge CLK or negedge RST) begin
    if(!RST)
    begin
        ser_data <= 1'b0;
        ser_done <= 1'b0;
        counter <= 3'd0;
        shift_reg <= 8'd0;
    end
    else
    begin
        if(ser_en && counter == 0)
        begin
            shift_reg <= {1'b0,p_data[7:1]};
            ser_data <= p_data[0];  // Only takes data while counter == 0
            counter <= counter + 1;
        end
        else if (counter > 0 && counter < 4'd8)
        begin
            ser_data <= shift_reg[0];
            shift_reg <= {1'b0,shift_reg[7:1]};
            counter <= counter + 1;
            ser_done <= (flag);
        end
        else
        begin
            ser_done <= 1'b0;
            counter <= 3'd0;
        end
    end
end


endmodule
