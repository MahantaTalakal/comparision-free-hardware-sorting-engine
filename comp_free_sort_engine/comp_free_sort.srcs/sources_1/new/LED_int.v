`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2024 13:04:14
// Design Name: 
// Module Name: LED_int
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


module LED_int(
input wire[7:0] next,
input wire en,
output wire[7:0] LED_int
    );
    
    reg[7:0] LED_int_reg;
    
    always @(*)
    begin
    if(en) begin
    LED_int_reg[0]=next[0];
    LED_int_reg[1]=~next[0]&next[1];
    LED_int_reg[2]=(~(|next[1:0]))&next[2];
    LED_int_reg[3]=(~(|next[2:0]))&next[3];
    LED_int_reg[4]=(~(|next[3:0]))&next[4];
    LED_int_reg[5]=(~(|next[4:0]))&next[5];
    LED_int_reg[6]=(~(|next[5:0]))&next[6];
    LED_int_reg[7]=(~(|next[6:0]))&next[7];
    end
    
    else LED_int_reg=8'bx;
    
    end
    
    assign LED_int=LED_int_reg;
    
endmodule
