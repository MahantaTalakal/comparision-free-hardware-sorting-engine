`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2024 18:27:29
// Design Name: 
// Module Name: tb_Block
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


module tb_Block();

  // Inputs
  reg [7:0] Data;
  reg [7:0] previous;
  reg en;

  // Outputs
  wire [7:0] next;

  // Instantiate the Block module
  Block uut (
    .Data(Data), 
    .previous(previous), 
    .en(en), 
    .next(next)
  );

  // Testbench stimulus
  initial begin
    // Initialize inputs
    Data = 8'b00000000;
    previous = 8'b00000000;
    en = 0;

    // Wait for 10 ns
    #10;
    
    // Test Case 1: Enable low, inputs should have no effect
    Data = 8'b10101010;
    previous = 8'b11001100;
    en = 0;
    #10;
    
    // Test Case 2: Enable high, check if next changes as per Data and previous
    en = 1;
    #10;

    // Test Case 3: Change Data and previous inputs
    Data = 8'b11110000;
    previous = 8'b00001111;
    #10;

    // Test Case 4: Another set of inputs
    Data = 8'b01010101;
    previous = 8'b00110011;
    #10;

    // Test Case 5: Check if all bits get updated
    Data = 8'b11111111;
    previous = 8'b11111111;
    #10;

    // Test Case 6: Reset Data and previous
    Data = 8'b00000000;
    previous = 8'b00000000;
    #10;
    
    // Finish simulation
    $finish;
  end

  // Monitor the signals
  initial begin
    $monitor("At time %0t, Data = %b, previous = %b, en = %b, next = %b", 
              $time, Data, previous, en, next);
  end
  
endmodule
