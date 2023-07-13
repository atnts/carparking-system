`timescale 1ns / 1ps

module Top_Module(
    input clk,
    input [15:0] cars,
    output [15:0] count,
    output[6:0] seg,
    output[3:0] an 
    );

    wire clk_out;
    wire [1:0] refresh_counter;
    wire [3:0] ONE_DIGIT;
    wire [7:0] number1;
    wire [7:0] number2;

    reg [3:0] digit1;
    reg [3:0] digit2;
    reg [3:0] digit3;
    reg [3:0] digit4;

    divider DIVIDER(clk, clk_out);

    refresh_counter REFRESH_COUNTER(clk_out, refresh_counter);

    anode_control ANODE_CONTROL(
        .refresh_counter(refresh_counter),
        .anode(an));

    Parking_System V0(cars,count,number1,number2);

    always @ (number1 or number2)begin

           if (number1 == 8'b00000000 && number2 == 8'b00000000)begin
            digit1 = 12;
            digit2 = 12;
            digit3 = 11;
            digit4 = 10;
            end 
      else begin
            digit1 = number1 % 10;
            digit2 = 14;
            digit3 = number2 % 10;
            digit4 = 13;
            end
        end
        
    BCD_control BCD_CONTROL(
        .digit1(digit1),
        .digit2(digit2),
        .digit3(digit3),
        .digit4(digit4),
        .refresh_counter(refresh_counter),
        .ONE_DIGIT(ONE_DIGIT));

    BCD_to_cathode BCD_TO_CATHODE(
        .digit(ONE_DIGIT),
        .cathode(seg));
        
endmodule
//////////////////////////////////////////////////////////////////////////////////




