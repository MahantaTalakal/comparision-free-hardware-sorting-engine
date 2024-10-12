`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2024 15:03:42
// Design Name: 
// Module Name: decoder_3to8
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


module decoder_3to8 (
    input wire [2:0] LED_addr, // 3-bit input
    output wire [7:0] LED_int       // 8-bit output
);
    reg [7:0] LED_int_reg;

    always @(*) begin
        LED_int_reg = 8'b00000000;
        
        case (LED_addr)
            3'b000: LED_int_reg = 8'b00000001;  
            3'b001: LED_int_reg = 8'b00000010;  
            3'b010: LED_int_reg = 8'b00000100; 
            3'b011: LED_int_reg = 8'b00001000; 
            3'b100: LED_int_reg = 8'b00010000;  
            3'b101: LED_int_reg = 8'b00100000; 
            3'b110: LED_int_reg = 8'b01000000; 
            3'b111: LED_int_reg = 8'b10000000; 
            default: LED_int_reg = 8'b00000000; 
        endcase
    end
    
    assign LED_int=LED_int_reg;

endmodule

