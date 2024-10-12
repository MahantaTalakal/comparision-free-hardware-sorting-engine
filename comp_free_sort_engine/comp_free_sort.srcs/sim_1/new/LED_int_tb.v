`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2024 13:14:13
// Design Name: 
// Module Name: LED_int_tb
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


module LED_int_tb;

    // Inputs
    reg [7:0] next;
    
    // Outputs
    wire [7:0] LED_int;

    // Instantiate the Unit Under Test (UUT)
    LED_int uut (
        .next(next),
        .LED_int(LED_int)
    );

    integer i;

    initial begin
        // Display headers for clarity
        $display("Next\t\tLED_int");
        
        // Initialize input
        next = 0;

        // Iterate over all possible 2^8 combinations for next
        for (i = 0; i < 256; i = i + 1) begin
            // Assign new input value
            next = i;
            
            // Wait for the result to propagate
            #10;
            
            // Display the current input and output values
            $display("%b\t%b", next, LED_int);
        end
        
        // Finish simulation
        $finish;
    end

endmodule
