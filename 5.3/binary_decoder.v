`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/25 11:17:40
// Design Name: 
// Module Name: binary_decoder
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


module binary_decoder(
    input A,B,C,G1,G2A,G2B,
    output reg [7:0]Y_
    );
    reg [7:0]Y;
    
    always@(*)begin
        Y = 8'b0;
        if(G1&G2A&G2B)begin
        Y[0]=!(A|B|C);
        Y[1]=A&!B&!C;
        Y[2]=!A&B&!C;
        Y[3]=A&B&!C;
        Y[4]=!A&!B&C;
        Y[5]=A&!B&C;
        Y[6]=!A&B&C;
        Y[7]=A&B&C;
        end
        Y_=~Y;
     end
     
endmodule
