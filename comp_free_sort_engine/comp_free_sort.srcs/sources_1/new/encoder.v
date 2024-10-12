`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2024 13:29:06
// Design Name: 
// Module Name: encoder
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


module encoder(
input wire[7:0] LED_int,
input wire en,
output wire[2:0] LED_addr
    );
    reg[2:0] LED_addr_reg;
    
    always @(*) begin
    if(en)  begin
    
        LED_addr_reg = 3'b000;
       
        casez (LED_int)
            8'b1???????: LED_addr_reg = 3'b111;
            8'b01??????: LED_addr_reg = 3'b110;
            8'b001?????: LED_addr_reg = 3'b101;
            8'b0001????: LED_addr_reg = 3'b100;
            8'b00001???: LED_addr_reg = 3'b011;
            8'b000001??: LED_addr_reg = 3'b010;
            8'b0000001?: LED_addr_reg = 3'b001;
            8'b00000001: LED_addr_reg = 3'b000;
            default: LED_addr_reg = 3'bxxx;   
        endcase
        end
    end
    
    assign LED_addr=LED_addr_reg;
    
endmodule
