`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/01 12:24:50
// Design Name: 
// Module Name: Shift_Register
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


module Shift_Register(
    input cr_,s0,s1,cp,sr,sl,
    input [7:0] d,
    output reg [7:0] Q
    );
    integer i;
    always@(negedge cr_ or posedge cp)begin
        if(~cr_)begin
            Q <= 8'b00000000;
        end else if(s1 & s0)begin
            Q<=d;
        end else if(s0)begin
            for(i=1;i<=7;i=i+1)begin
                Q[i-1]<=Q[i];
            end
            Q[7]<=sr;
        end else if(s1)begin
            for(i=0;i<=6;i=i+1)begin
                Q[i+1]<=Q[i];
            end
            Q[0]<=sl;
        end
    end
    
    
endmodule
