`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2022 04:44:47 PM
// Design Name: 
// Module Name: Parking_System
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


module Parking_System(
    input [15:0] cars,
    output reg [15:0] count,
    output reg [7:0] number1,
    output reg [7:0] number2
    );

    always @(cars)
    begin
        count <= cars;
        number1 = cars[7]+ cars[6]+cars[5]+cars[4]+cars[3]+cars[2]+cars[1]+cars[0];
        number2 = cars[15]+cars[14]+cars[13]+cars[12]+cars[11]+cars[10]+cars[9]+cars[8];

    end
endmodule