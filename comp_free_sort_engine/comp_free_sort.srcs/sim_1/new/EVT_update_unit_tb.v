`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2024 18:41:24
// Design Name: 
// Module Name: EVT_update_unit_tb
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


module EVT_update_unit_tb;

  // Inputs
  reg clk;
  reg en;
  reg [7:0] LED_out;
  reg [7:0] EVT;

  // Outputs
  wire [7:0] EVT_next;

  // Instantiate the Unit Under Test (UUT)
  EVT_update_unit uut (
    .clk(clk),
    .en(en),
    .LED_out(LED_out),
    .EVT(EVT),
    .EVT_next(EVT_next)
  );

  // Clock generation (50 MHz -> 20 ns period)
  always #10 clk = ~clk;

  // Testbench stimulus
  initial begin
    // Initialize inputs
    clk = 0;
    en = 0;
    LED_out = 8'b00000001; // One-hot encoded value (bit 0 is '1')
    EVT = 8'b00000000;
    
    // Wait for the clock to stabilize
    #20;
    
    // Test Case 1: Enable low, no change in EVT_next
    en = 0;
    LED_out = 8'b00000001; // One-hot encoded value (bit 0 is '1')
    EVT = 8'b11001100;
    #20;

    // Test Case 2: Enable high, check EVT_next update
    en = 1;
    #20;
    
    // Test Case 3: Change EVT and LED_out values (one-hot encoded LED_out)
    EVT = 8'b11110000;
    LED_out = 8'b00000010; // One-hot encoded value (bit 1 is '1')
    #20;

    // Test Case 4: Change to another set of inputs with one-hot encoding
    EVT = 8'b01010101;
    LED_out = 8'b00000100; // One-hot encoded value (bit 2 is '1')
    #20;

    // Test Case 5: Another one-hot encoded value
    EVT = 8'b11111111;
    LED_out = 8'b00001000; // One-hot encoded value (bit 3 is '1')
    #20;

    // Test Case 6: Another one-hot encoded value
    EVT = 8'b10101010;
    LED_out = 8'b00010000; // One-hot encoded value (bit 4 is '1')
    #20;

    // Test Case 7: Reset EVT and LED_out (one-hot)
    EVT = 8'b00100000;
    LED_out = 8'b00100000; // One-hot encoded value (bit 5 is '1')
    en = 1;
    #20;

    // Finish simulation
    $finish;
  end

  // Monitor the signals
  initial begin
    $monitor("At time %0t, clk = %b, en = %b, LED_out = %b, EVT = %b, EVT_next = %b", 
              $time, clk, en, LED_out, EVT, EVT_next);
  end
  
endmodule


