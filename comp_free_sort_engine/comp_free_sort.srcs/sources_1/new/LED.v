`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2024 12:54:19
// Design Name: 
// Module Name: LED
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


module LED(
    input wire[7:0] Next,
    input wire en,
    output wire[2:0] LED_addr
    
    );
    
    wire[7:0] LED_Int;

    LED_int L1(Next,en,LED_Int);
    encoder E1(LED_Int,en,LED_addr);
    
endmodule
