`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/18 19:34:51
// Design Name: 
// Module Name: tb_CLA_4bit
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


module tb_CLA_4bit;
    reg [3:0] A, B;    // 输入
    reg Cin;           // 初始进位
    wire [3:0] Sum;    // 输出和
    wire Cout;         // 输出进位

    // 实例化 CLA 模块
    CLA_4bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // 仿真测试
        $monitor("Time=%0t | A=%b B=%b Cin=%b | Sum=%b Cout=%b", $time, A, B, Cin, Sum, Cout);

        // 测试用例
        A = 4'b0001; B = 4'b0010; Cin = 0; #10; // 1 + 2 = 3
        A = 4'b1010; B = 4'b0101; Cin = 0; #10; // 10 + 5 = 15
        A = 4'b1111; B = 4'b0001; Cin = 1; #10; // 15 + 1 + 1 = 17
        A = 4'b1100; B = 4'b1010; Cin = 0; #10; // 12 + 10 = 22
        $finish;
    end
endmodule

