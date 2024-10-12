`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2024 13:00:53
// Design Name: 
// Module Name: Block_tb
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


module Block_tb;

    // Inputs
    reg [7:0] Data, previous;
    
    // Outputs
    wire [7:0] next;

    // Instantiate the Unit Under Test (UUT)
    Block uut (
        .Data(Data),
        .previous(previous),
        .next(next)
    );

    integer i, j;

    initial begin
        // Display headers for clarity
        $display("Data\tPrevious\tNext\t\tOR_Out");
        
        // Initialize inputs
        Data = 0;
        previous = 0;

        // Iterate over all possible 2^8 combinations for Data and Previous
        for (i = 0; i < 256; i = i + 1) begin
            for (j = 0; j < 256; j = j + 1) begin
                // Assign new input combinations
                Data = i;
                previous = j;
                
                // Wait for the result to propagate
                #10;
                
                // Display the current input and output values
                $display("%b\t%b\t%b", Data, previous, next);
            end
        end
        
        // Finish simulation
        $finish;
    end

endmodule

