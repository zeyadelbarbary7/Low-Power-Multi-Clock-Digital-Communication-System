module ALU #(
    parameter input_width = 8,
    parameter output_width = input_width * 2
) (
    input wire [input_width-1:0] A,
    input wire [input_width-1:0] B,
    input wire [3:0] ALU_FUN,
    input wire Enable,
    input wire CLK,
    input wire RST,
    output reg [output_width-1:0] ALU_OUT,
    output reg OUT_VALID
);

reg [output_width-1:0] ALU_OUT_TEMP; // Temporary register to hold ALU output
reg OUT_VALID_TEMP;

always @(*) begin
    ALU_OUT_TEMP = 'b0;
    OUT_VALID_TEMP = 1'b0;
    if (Enable) begin
        OUT_VALID_TEMP = 1'b1;
        case (ALU_FUN)
            4'b0000: begin // unsigned Addition
                ALU_OUT_TEMP = A + B;
            end
            4'b0001: begin // unsigned Subtraction
                ALU_OUT_TEMP = A - B;
            end
            4'b0010: begin // unsigned Multiplication
                ALU_OUT_TEMP = A * B;
            end
            4'b0011: begin // unsigned Division
                if (B != 0) begin
                    ALU_OUT_TEMP = A / B;
                end else begin
                    ALU_OUT_TEMP = 'b0; // Handle division by zero
                end
            end

            4'b0100: begin // AND
                ALU_OUT_TEMP = A & B;
            end
            4'b0101: begin // OR
                ALU_OUT_TEMP = A | B;
            end
            4'b0110 : begin // NAND
                ALU_OUT_TEMP = ~(A & B);
            end
            4'b0111: begin // NOR
                ALU_OUT_TEMP = ~(A | B);
            end
            4'b1000: begin // XOR
                ALU_OUT_TEMP = A ^ B;
            end
            4'b1001: begin // XNOR
                ALU_OUT_TEMP = ~(A ^ B);
            end

            4'b1010 : begin // CMP (A = B)
                if (A == B)
                    ALU_OUT_TEMP = 'b1; // Set output to 1 if A equals B
                else
                    ALU_OUT_TEMP = 'b0; // Set output to 0 if A not equal B
            end
            4'b1011 : begin // CMP (A > B)
                if (A > B)
                    ALU_OUT_TEMP = 'b10; // Set output to 2 if A is greater than B
                else
                    ALU_OUT_TEMP = 'b0; // Set output to 0 if A is not greater than B
            end
            4'b1100 : begin // CMP (A < B)
                if (A < B)
                    ALU_OUT_TEMP = 'b11; // Set output to 3 if A is less than B
                else
                    ALU_OUT_TEMP = 'b0; // Set output to 0 if A is not less than B
            end

            4'b1101: begin // Shift Right Logical
                ALU_OUT_TEMP = A >> 1; // Shift A right by 1 bit
            end
            4'b1110: begin // Shift Left Logical
                ALU_OUT_TEMP = A << 1; // Shift A left by 1 bit
            end

            default: ALU_OUT_TEMP = 'b0; 
        endcase
    end else 
        OUT_VALID_TEMP = 1'b0;
end

always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        ALU_OUT <= 'b0;
        OUT_VALID <= 1'b0;
    end else begin
        // Register the output on the clock edge
        ALU_OUT <= ALU_OUT_TEMP;
        OUT_VALID <= OUT_VALID_TEMP;
    end
end

endmodule