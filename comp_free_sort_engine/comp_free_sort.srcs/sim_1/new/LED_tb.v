`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2024 13:26:08
// Design Name: 
// Module Name: LED_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LED_tb;

  // Inputs
  reg [7:0] Next;
  reg en;

  // Outputs
  wire [2:0] LED_addr;

  // Instantiate the LED module
  LED uut (
    .Next(Next), 
    .en(en), 
    .LED_addr(LED_addr)
  );

  // Testbench stimulus
  initial begin
    // Initialize inputs
    Next = 8'b00000000;
    en = 0;

    // Wait for 10 ns
    #10;

    // Test Case 1: Enable is low, check if outputs remain unaffected
    Next = 8'b10101010;
    en = 0;
    #10;

    // Test Case 2: Enable high, check the output when 'Next' is set
    en = 1;
    #10;

    // Test Case 3: Change 'Next' input
    Next = 8'b00001111;
    #10;

    // Test Case 4: Set 'Next' with a different value
    Next = 8'b11110000;
    #10;

    // Test Case 5: All bits of 'Next' high
    Next = 8'b11111111;
    #10;

    // Test Case 6: Set 'Next' to another value with alternating bits
    Next = 8'b01010101;
    #10;

    // Finish simulation
    $finish;
  end

  // Monitor the signals
  initial begin
    $monitor("At time %0t, Next = %b, en = %b, LED_addr = %b", 
              $time, Next, en, LED_addr);
  end
  
endmodule

