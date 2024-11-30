`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/27 18:44:32
// Design Name: 
// Module Name: test5_3
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


module test_binary_decoder;
    reg A, B, C, G1, G2A, G2B;
    wire [7:0] Y_;
    binary_decoder uut (
        .A(A),
        .B(B),
        .C(C),
        .G1(G1),
        .G2A(G2A),
        .G2B(G2B),
        .Y_(Y_)
    );
    initial begin
        A = 0; B = 0; C = 0; G1 = 0; G2A = 0; G2B = 0;
        #10;
        $display("Test 1 - G1=%b G2A=%b G2B=%b | Y_=%b", G1, G2A, G2B, Y_);
        G1 = 1; G2A = 1; G2B = 1; A = 0; B = 0; C = 0;
        #10;
        $display("Test 2 - G1=%b G2A=%b G2B=%b A=%b B=%b C=%b | Y_=%b", G1, G2A, G2B, A, B, C, Y_);
        A = 1; B = 0; C = 0;
        #10;
        $display("Test 3 - G1=%b G2A=%b G2B=%b A=%b B=%b C=%b | Y_=%b", G1, G2A, G2B, A, B, C, Y_);
        A = 1; B = 1; C = 0;
        #10;
        $display("Test 4 - G1=%b G2A=%b G2B=%b A=%b B=%b C=%b | Y_=%b", G1, G2A, G2B, A, B, C, Y_);
        A = 1; B = 1; C = 1;
        #10;
        $display("Test 5 - G1=%b G2A=%b G2B=%b A=%b B=%b C=%b | Y_=%b", G1, G2A, G2B, A, B, C, Y_);
        G1 = 0; G2A = 1; G2B = 1; A = 0; B = 0; C = 0;
        #10;
        $display("Test 6 - G1=%b G2A=%b G2B=%b A=%b B=%b C=%b | Y_=%b", G1, G2A, G2B, A, B, C, Y_);
        G1 = 1; G2A = 0; G2B = 1; A = 1; B = 0; C = 0;
        #10;
        $display("Test 7 - G1=%b G2A=%b G2B=%b A=%b B=%b C=%b | Y_=%b", G1, G2A, G2B, A, B, C, Y_);
        G1 = 1; G2A = 1; G2B = 0; A = 1; B = 1; C = 0;
        #10;
        $display("Test 8 - G1=%b G2A=%b G2B=%b A=%b B=%b C=%b | Y_=%b", G1, G2A, G2B, A, B, C, Y_);
        $stop;
    end
endmodule
