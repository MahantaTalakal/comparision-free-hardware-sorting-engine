`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2024 15:14:14
// Design Name: 
// Module Name: EVT_update_unit
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


module EVT_update_unit(
input wire clk,
input wire[7:0] LED_out,EVT,
output wire[7:0] EVT_next
    );
    
    reg[7:0] EVT_next_reg,EVT_next1;
    wire[7:0] EVT_next_wire;

    always@*
    begin
    EVT_next_reg[0]=EVT[0] & (~LED_out[0]);
    EVT_next_reg[1]=EVT[1] & (~LED_out[1]);
    EVT_next_reg[2]=EVT[2] & (~LED_out[2]);
    EVT_next_reg[3]=EVT[3] & (~LED_out[3]);
    EVT_next_reg[4]=EVT[4] & (~LED_out[4]);
    EVT_next_reg[5]=EVT[5] & (~LED_out[5]);
    EVT_next_reg[6]=EVT[6] & (~LED_out[6]);
    EVT_next_reg[7]=EVT[7] & (~LED_out[7]);
    end
    
    assign EVT_next_wire= EVT_next_reg;
    D_FF D1(clk,EVT_next_wire,EVT_next);
    
    
    
    
    
endmodule
