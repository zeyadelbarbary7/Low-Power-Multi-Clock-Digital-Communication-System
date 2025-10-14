`timescale 1ns/1ps
module Final_System_TOP_tb();

// Parameters
parameter REF_CLOCK_PERIOD = 10;
parameter UART_CLOCK_PERIOD = 271;
parameter UART_CLOCK_PERIOD_TX = 8680;
parameter DATA_WIDTH_IN_tb = 8;
parameter DATA_WIDTH_OUT_tb = DATA_WIDTH_IN_tb * 2;
parameter ALU_OPERATIONS_tb = 4;
parameter ADDRESS_WIDTH_tb = 4;
parameter RST_SYNC_NUM_STAGES_tb = 2;
parameter DivRatio_Width_tb = 8;

// Signals
reg RX_IN_tb;
reg UART_CLK_tb;
reg REF_CLK_tb;
reg RST_tb;
wire TX_OUT_tb;
wire Parity_Error_tb;
wire Frame_Error_tb;

integer passed_tests = 0;
integer failed_tests = 0;

// DUT instance
SYS_TOP #(
    .DATA_WIDTH_IN(DATA_WIDTH_IN_tb),
    .ADDRESS_WIDTH(ADDRESS_WIDTH_tb),
    .ALU_OPERATIONS(ALU_OPERATIONS_tb),
    .DATA_WIDTH_OUT(DATA_WIDTH_OUT_tb),
    .SYNC_NUM_STAGES(RST_SYNC_NUM_STAGES_tb),
    .DivRatio_Width_top(DivRatio_Width_tb)
) sys_top_inst (
    .UART_RX_IN(RX_IN_tb),
    .UART_CLK(UART_CLK_tb),
    .REF_CLK(REF_CLK_tb),
    .RST_N(RST_tb),
    .UART_TX_O(TX_OUT_tb),
    .parity_error(Parity_Error_tb),
    .framing_error(Frame_Error_tb)
);

initial begin
    $dumpfile("Final_System_TOP_tb.vcd");
    $dumpvars();

    initialize();
    reset();
    $display("INFO: System reset released at %0t ns.", $time);
    #(2 * UART_CLOCK_PERIOD);

    // **** Test_Case 1: Register Write, then Read ****
    begin
        $display("\n**** [Test_Case 1] Verifying Register Write and Read ****");
        // Write 0xAB to address 0x05
        uart_send_byte(8'hAA,1'b1,1'b0); // Reg Write
        uart_send_byte(8'h05,1'b1,1'b0); // Address
        uart_send_byte(8'hAB,1'b1,1'b0); // Data
        #(3 * UART_CLOCK_PERIOD_TX);

        // Read from address 0x05 and expect 0xAB back
        uart_send_byte(8'hBB,1'b1,1'b0); // Reg Read
        uart_send_byte(8'h05,1'b1,1'b0); // Address
        uart_receive_and_check(8'hAB,1'b1,1'b0);
    end

    // **** Test_Case 2: ALU Operation with Operands (Multiply) ****
    begin
        $display("\n**** [Test_Case 2] Verifying ALU Operation with Operands (10 * 7 = 70) ****");
        uart_send_byte(8'hCC,1'b1,1'b0); // ALU Op w/ Operands 
        uart_send_byte(8'd10,1'b1,1'b0); // Operand A
        uart_send_byte(8'd7,1'b1,1'b0);  // Operand B
        uart_send_byte(8'h02,1'b1,1'b0); // ALU FUN for Multiplication
        uart_receive_and_check(8'd70,1'b1,1'b0);
    end

    // **** Test_Case 2.1: ALU Operation with Operands (Multiply) (Testing (16 bits * 16 bits) (will be received by 2 frames))****
    begin
        $display("\n**** [Test_Case 2.1] Verifying ALU Operation with Operands (200 * 200 = 40000) ****");
        uart_send_byte(8'hCC,1'b1,1'b0); // ALU Op w/ Operands 
        uart_send_byte(8'd200,1'b1,1'b0); // Operand A
        uart_send_byte(8'd200,1'b1,1'b0);  // Operand B
        uart_send_byte(8'h02,1'b1,1'b0); // ALU FUN for Multiplication
        uart_receive_and_check(8'b0100_0000,1'b1,1'b0);
        uart_receive_and_check(8'b1001_1100,1'b1,1'b0);
    end

    // **** Test_Case 3: ALU Operation without Operands (Addition) ****
    begin
        $display("\n**** [Test_Case 3] Verifying ALU Operation without Operands (10 + 7 = 17) ****");
        uart_send_byte(8'hDD,1'b1,1'b0); // ALU Op w/ Operands
        uart_send_byte(8'h00,1'b1,1'b0); // ALU FUN for Addition
        uart_receive_and_check(8'd400,1'b1,1'b0);
    end

    // 3ayez 28yr de ll taskaya l gdeda
    // **** Test_Case 4: UART Parity Error ****
    begin
        $display("\n**** [Test_Case 4] Checking UART Parity Error Detection ****");
        RX_IN_tb = 1'b0; #(UART_CLOCK_PERIOD_TX); // Start bit
        RX_IN_tb = 1'b1; #(8*UART_CLOCK_PERIOD_TX); // Dummy data
        RX_IN_tb = 1'b1; #(UART_CLOCK_PERIOD_TX); // WRONG parity (It is default even wl 1 da kda hykhleha odd)
        RX_IN_tb = 1'b1; #(UART_CLOCK_PERIOD_TX); // Stop bit
    end


    // **** Test_Case 5: UART Frame Error ****
    begin
        $display("\n**** [Test_Case 5] Checking UART Frame Error Detection ****");
        RX_IN_tb = 1'b0; #(UART_CLOCK_PERIOD_TX); // Start bit
        RX_IN_tb = 1'b1; #(8*UART_CLOCK_PERIOD_TX); // Dummy data
        RX_IN_tb = 1'b0; #(UART_CLOCK_PERIOD_TX); // Even Parity
        RX_IN_tb = 1'b0; #(UART_CLOCK_PERIOD_TX); // Wrong stop bit (l mafrod tb2a b 1 --> Frame_Error_tb=1)
    end

    // **** Test_Case 6: Enable Odd Parity ****
    begin
        $display("\n**** [Test_Case 6] Enable Odd Parity ****");
        // Write to REG2 (0x02): Prescale=32, ParityEn=1, ParityType=1 (Odd)
        uart_send_byte(8'hAA, 1'b1, 1'b0); // Reg Write
        uart_send_byte(8'h02, 1'b1, 1'b0); // Address = REG2
        uart_send_byte(8'b10000011, 1'b1, 1'b0); // Data: enable + odd
    end

    // **** Test_Case 7: Register Write/Read at Address 0x15 ****
    begin
        $display("\n**** [Test_Case 7] Verifying Register Write/Read at Address 0x15 ****");

        // Write 0xA5 to REG[0x15]
        uart_send_byte(8'hAA, 1'b1, 1'b1); // Reg Write Command
        uart_send_byte(8'd15, 1'b1, 1'b1); // Address = 0d15
        uart_send_byte(8'hA5, 1'b1, 1'b1); // Data = 0xA5
        #(3 * UART_CLOCK_PERIOD_TX);

        // Read back from REG[0x15]
        uart_send_byte(8'hBB, 1'b1, 1'b1); // Reg Read Command
        uart_send_byte(8'd15, 1'b1, 1'b1); // Address = 0d15
        uart_receive_and_check(8'hA5, 1'b1, 1'b1); // Expect 0xA5
    end

    // **** TEST_Case 8: Disable Parity ****
    begin
        $display("\n**** [TEST_Case 8] Disabling UART Parity ****");
        // Write to REG2 (0x02): disable parity, keep prescale = 32
        uart_send_byte(8'hAA,1'b1,1'b1);  // Reg Write Cmd
        uart_send_byte(8'h02,1'b1,1'b1);  // Address = UART Config
        uart_send_byte(8'b10000000,1'b1,1'b1); // Prescale=32 (100000), ParityEn=0, ParityType=0
    end

    // **** Test_Case 9: ALU Division ****
    begin
        $display("\n**** [Test_Case 9] ALU Division (49 / 7 = 7) ****");
        uart_send_byte(8'hCC,1'b0,1'b0);    // ALU Op w/ Operands 
        uart_send_byte(8'd49,1'b0,1'b0);    // Operand A
        uart_send_byte(8'd7,1'b0,1'b0);     // Operand B
        uart_send_byte(8'h03,1'b0,1'b0);    // ALU FUN for Division
        uart_receive_and_check(8'd7,1'b0,1'b0);
    end

    // **** Test_Case 10: ALU AND (0xF0 & 0x0F = 0x00) ****
    begin
        $display("\n**** [Test_Case 10] ALU AND Operation ****");
        uart_send_byte(8'hCC,1'b0,1'b0);    // ALU Op w/ Operands 
        uart_send_byte(8'hF0,1'b0,1'b0);    // Operand A
        uart_send_byte(8'h0F,1'b0,1'b0);    // Operand B
        uart_send_byte(8'h04,1'b0,1'b0);    // ALU FUN for AND
        uart_receive_and_check(8'h00,1'b0,1'b0);
    end

    // **** Test_Case 11: ALU OR without operands (0xF0 | 0x0F = 0xFF) ****
    begin
        $display("\n**** [Test_Case 11] ALU OR Operation ****");
        uart_send_byte(8'hDD,1'b0,1'b0);    // ALU Op w/ Operands   
        uart_send_byte(8'h05,1'b0,1'b0);    // ALU FUN for OR
        uart_receive_and_check(8'hFF,1'b0,1'b0);
    end

    // **** Test_Case 12: Change Prescale to 16 ****
    begin
        $display("\n**** [Test_Case 12] Changing UART Prescale to 16 ****");
        uart_send_byte(8'hAA, 1'b0, 1'b0);   // Reg Write
        uart_send_byte(8'h02, 1'b0, 1'b0);   // UART Config Address
        uart_send_byte(8'b01000001, 1'b0, 1'b0); // Prescale=16, ParityEn=1, ParityType=0
    end

    #(2 * UART_CLOCK_PERIOD_TX);

    // ***** Test_Case 13: Register Write/Read at Address 0x0A ****
    begin
        $display("\n**** [Test_Case 13] Verifying Register Write/Read at Address 0x0A ****");

        // Write 0x5A to REG[0x0A]
        uart_send_byte(8'hAA, 1'b1, 1'b0); // Reg Write Command
        uart_send_byte(8'd10, 1'b1, 1'b0); // Address = 0d10
        uart_send_byte(8'h5A, 1'b1, 1'b0); // Data = 0x5A
        #(3 * UART_CLOCK_PERIOD_TX);

        // Read back from REG[0x0A]
        uart_send_byte(8'hBB, 1'b1, 1'b0); // Reg Read Command
        uart_send_byte(8'd10, 1'b1, 1'b0); // Address = 0d10
        uart_receive_and_check(8'h5A, 1'b1, 1'b0); // Expect 0x5A
    end

    // **** Test_Case 14: ALU Subtraction (20 - 5 = 15) ****
    begin
        $display("\n**** [Test_Case 14] ALU Subtraction (20 - 5 = 15) ****");
        uart_send_byte(8'hCC,1'b1,1'b0);    // ALU Op w/ Operands 
        uart_send_byte(8'd20,1'b1,1'b0);    // Operand A
        uart_send_byte(8'd5,1'b1,1'b0);     // Operand B
        uart_send_byte(8'h01,1'b1,1'b0);    // ALU FUN for Subtraction
        uart_receive_and_check(8'd15,1'b1,1'b0);
    end

    // **** Test_Case 15: ALU XOR without operands (0x14 ^ 0x05 = 0x11) ****
    begin
        $display("\n**** [Test_Case 15] ALU XOR Operation ****");
        uart_send_byte(8'hDD,1'b1,1'b0);    // ALU Op w/ Operands   
        uart_send_byte(8'h08,1'b1,1'b0);    // ALU FUN for XOR
        uart_receive_and_check(8'h11,1'b1,1'b0);
    end

    // **** Final Summary and Simulation End ****
    $display("\n-----------------------------------------");
    $display("---           TEST SUMMARY            ---");
    $display("---    PASSED: %0d   |   FAILED: %0d    ---", passed_tests, failed_tests);
    $display("-----------------------------------------");

    #(5 * UART_CLOCK_PERIOD_TX);

    $stop;

end

// Task to initialize signals
task initialize;
begin
    RX_IN_tb = 1'b1;
    UART_CLK_tb = 1'b0;
    REF_CLK_tb = 1'b0;
    RST_tb = 1'b0;
end
endtask

// Task to perform a reset sequence
task reset;
begin
    RST_tb = 1'b1;
    #(UART_CLOCK_PERIOD)
    RST_tb = 1'b0;
    #(UART_CLOCK_PERIOD)
    RST_tb = 1'b1;
end
endtask

// Task to receive a byte serially and check it against an expected value
task uart_receive_and_check;
    input [7:0] expected_byte;
    input par_en;
    input par_type; // 0 = even, 1 = odd
    reg [7:0] received_byte;
    integer i;
begin
    $display("Waiting to receive response from DUT...");
    // Wait for the start bit (falling edge)
    @(negedge TX_OUT_tb);
    $display("Start bit detected. Receiving data...");
    
    // Wait half a bit period to sample in the middle of the first data bit
    #(UART_CLOCK_PERIOD_TX/2);

    // Sample all 8 data bits
    for (i = 0; i < 8; i = i + 1) begin
        #(UART_CLOCK_PERIOD_TX);
        received_byte[i] = TX_OUT_tb;
    end
    
    // Wait for the stop bit period to finish
    if (par_en)
        #(UART_CLOCK_PERIOD_TX); // Skip parity bit if enabled
    #(UART_CLOCK_PERIOD_TX); // Skip stop bit

    // Check the result
    if (received_byte == expected_byte) begin
        $display("PASSED: Received 0x%h, matches expected 0x%h.", received_byte, expected_byte);
        passed_tests = passed_tests + 1;
    end else begin
        $error("FAILED: Received 0x%h, but expected 0x%h.", received_byte, expected_byte);
        failed_tests = failed_tests + 1;
    end
end
endtask

//================================================================
// Task to send a byte serially (11-BIT UART Frame with Parity)
//================================================================
task uart_send_byte;
    input [7:0] data;
    input par_en;
    input par_type; // 0 = even, 1 = odd
    integer i;
    reg parity_bit;
begin
    // Calculate parity bit if needed
    if(par_en) begin
        if (par_type == 1'b0)
            parity_bit = ^data;      // even parity
        else
            parity_bit = ~^data;     // odd parity
    end

    // $display("INFO: Sending byte 0x%h with parity bit %b...", data, parity_bit);
    
    $display("Sending byte 0x%h with parity bit %b... time: %t", data, parity_bit, $time);
    // 1. Start Bit (1 bit)
    RX_IN_tb = 1'b0;
    #(UART_CLOCK_PERIOD_TX);

    // 2. Data Bits (8 bits, LSB first)
    for (i = 0; i < 8; i = i + 1) begin
        RX_IN_tb = data[i];
        #(UART_CLOCK_PERIOD_TX);
    end

    // 3. Parity Bit (if enabled)
    if (par_en) begin
        RX_IN_tb = parity_bit;
        #(UART_CLOCK_PERIOD_TX);
    end

    // 4. Stop Bit (1 bit)
    RX_IN_tb = 1'b1;
    #(UART_CLOCK_PERIOD_TX);
end
endtask

// Capture data right when Frame_Error_tb or Parity_Error_tb goes high
always @(posedge Frame_Error_tb or posedge Parity_Error_tb) begin
    if(Parity_Error_tb) begin
        $display("PASSED: Parity error detected");
        passed_tests = passed_tests + 1;    
    end else if(Frame_Error_tb) begin
        $display("PASSED: Frame error detected");
        passed_tests = passed_tests + 1;    
    end
end

// clock generation
always #(REF_CLOCK_PERIOD/2) REF_CLK_tb = ~REF_CLK_tb;
always #(UART_CLOCK_PERIOD/2) UART_CLK_tb = ~UART_CLK_tb;

endmodule
