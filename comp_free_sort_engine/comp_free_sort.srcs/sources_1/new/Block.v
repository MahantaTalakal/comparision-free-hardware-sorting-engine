`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2024 12:36:45
// Design Name: 
// Module Name: Block
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


module Block(
    input wire[7:0] Data,previous,
    input wire en,
    output wire[7:0] next
    );
    
    wire[7:0] and_out;
    wire or_out;
    
    Cell C1(Data[0], previous[0],or_out,en,next[0],and_out[0]);
    Cell C2(Data[1], previous[1],or_out,en,next[1],and_out[1]);
    Cell C3(Data[2], previous[2],or_out,en,next[2],and_out[2]);
    Cell C4(Data[3], previous[3],or_out,en,next[3],and_out[3]);
    Cell C5(Data[4], previous[4],or_out,en,next[4],and_out[4]);
    Cell C6(Data[5], previous[5],or_out,en,next[5],and_out[5]);
    Cell C7(Data[6], previous[6],or_out,en,next[6],and_out[6]);
    Cell C8(Data[7], previous[7],or_out,en,next[7],and_out[7]);
    
    
    assign or_out=|and_out;
    
    
endmodule
