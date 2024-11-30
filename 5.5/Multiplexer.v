`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/27 19:53:54
// Design Name: 
// Module Name: Multiplexer
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


module Multiplexer(
    input [0:3]A,B,C,D,
    input en,
    input [0:1]s,
    output reg [0:3]Y
    );
    always@(*)begin
        Y=4'b0;
        if(en)begin
            if(s==2'b00)begin
                Y=A;
            end
            if(s==2'b01)begin
                Y=B;
            end
            if(s==2'b10)begin
                Y=C;
            end
            if(s==2'b11)begin
                Y=D;
            end
        end
    end
endmodule
