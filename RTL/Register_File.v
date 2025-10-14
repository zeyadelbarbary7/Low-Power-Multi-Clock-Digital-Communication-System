module Register_File #(
    parameter Data_width = 8,
    parameter Address_width = 4
) (
    input wire [Data_width-1:0] WrData, // Data to write into the register
    input wire [Address_width-1:0] Address, // Address to write/read
    input wire WrEn,    // Write enable signal
    input wire RdEn,    // Read enable signal
    input wire CLK, // Clock signal
    input wire RST, // Reset signal
    output reg [Data_width-1:0] RdData,  // Data read from the register
    output reg RdData_Valid,
    output wire [Data_width-1:0] REG0,
    output wire [Data_width-1:0] REG1,
    output wire [Data_width-1:0] REG2,
    output wire [Data_width-1:0] REG3
);

integer i;

// Register file declaration
reg [Data_width-1:0] Reg_File [(2**Address_width)-1:0];

always @(posedge CLK or negedge RST) begin
    if(!RST) begin  // Reset the register file
        for ( i = 0 ; i < (2**Address_width) ; i = i + 1 ) begin
            if(i == 2)
                Reg_File[i] <= 8'b100000_0_1;
            else if (i == 3)
                Reg_File[i] <= 8'b00100000;
            else
                Reg_File[i] <= 8'b0;
        end
        RdData <= 8'b0;
        RdData_Valid <= 1'b0;
    end else begin
        if(WrEn && !RdEn)   // Write operation
            Reg_File[Address] <= WrData;
        else if(RdEn && !WrEn) begin // Read operation
            RdData <= Reg_File[Address];
            RdData_Valid <= 1'b1;
        end else
            RdData_Valid <= 1'b0;
    end
end

assign REG0 = Reg_File[0];
assign REG1 = Reg_File[1];
assign REG2 = Reg_File[2];
assign REG3 = Reg_File[3];

endmodule