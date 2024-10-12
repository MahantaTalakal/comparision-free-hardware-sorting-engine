`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2024 14:38:44
// Design Name: 
// Module Name: D_FF
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


module D_FF(
input clk,
input wire[7:0] data_in,
output wire[7:0] data_out
    );
    
    reg[7:0]data_out_reg;
    
    always@(posedge clk) 
    begin
    data_out_reg<=data_in;
    end
    
    assign data_out=data_out_reg;
    
endmodule
