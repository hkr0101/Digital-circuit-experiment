`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/01 00:44:02
// Design Name: 
// Module Name: Register8bit
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


module Register8bit(
    input [7:0] D,
    input clk,clr,en_,
    output [7:0] Z
    );
    reg [7:0] Q;
    always @(posedge clk or posedge clr)begin
        if(en_)begin end
        else if (clr) begin
            Q <= 8'b0;
        end else if(clk)begin
            Q <= D;
        end else begin
            Q <= Q;
        end
    end
    assign Z=en_? 1'bz:Q;
endmodule
