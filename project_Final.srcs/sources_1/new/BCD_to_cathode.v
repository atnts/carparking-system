`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2022 12:44:47 AM
// Design Name: 
// Module Name: BCD_to_cathode
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

module BCD_to_cathode (
    input [3:0] digit,
    output reg [6:0] cathode = 0);

    always@ (digit)
    begin
        case (digit)
            4'd0 : cathode = 7'b0000001; //0
            4'd1 : cathode = 7'b1001111; //1
            4'd2 : cathode = 7'b0010010; //2
            4'd3 : cathode = 7'b0000110; //3
            4'd4 : cathode = 7'b1001100; //4
            4'd5 : cathode = 7'b0100100; //5
            4'd6 : cathode = 7'b0100000; //6
            4'd7 : cathode = 7'b0001111; //7
            4'd8 : cathode = 7'b0000000; //8
            4'd9 : cathode = 7'b0000100; //9
            4'd10 : cathode = 7'b0111000; //F
            4'd11 : cathode = 7'b1000001; //U
            4'd12 : cathode = 7'b1110001; //L
            4'd13 : cathode = 7'b0001000; //A
            4'd14 : cathode =  7'b0110001; //C
            default : cathode = 7'b1111111;
        endcase
    end
endmodule
