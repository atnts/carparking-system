`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2022 10:56:10 AM
// Design Name: 
// Module Name: divide
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
module divider(
    input clock,
    output clk_out
    );
    
    reg elapsed;//elapsed time 1 second
    reg [27:0] state;
    
    always @ (posedge clock)
    if (state == 100000) state <= 0;
        else state <= state + 1;
        
    always @(state)
    if (state == 100000) elapsed = 1;
        else elapsed = 0;
        
    assign clk_out = elapsed;
    
endmodule