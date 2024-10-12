`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2024 12:26:08
// Design Name: 
// Module Name: Cell
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


module Cell(
input wire data_bit,previous, select_line,
input wire en,
output wire next, and_out
    );
    reg next_reg, and_out_reg;
    
    always@(*)
    if(en)
    begin
    and_out_reg= data_bit & previous;
    
    next_reg= select_line? and_out:previous;
    end 
    
        
    assign next=next_reg;
    assign and_out=and_out_reg;
    
endmodule
