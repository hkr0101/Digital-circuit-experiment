

`timescale 1ns / 1ps

module Ripple_Carry_Adder_Test;           
    reg [3:0] A;           // 4位输入A
    reg [3:0] B;           // 4位输入B
    reg Cin;               // 进位输入
    wire [3:0] Sum;        // 4位输出Sum
    wire Cout;             // 输出进位Cout

    // 实例化 Ripple_Carry_Adder 模块
    Ripple_Carry_Adder The_UUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // 测试样例
        A = 0; B = 0; Cin = 0;   // 第 1 组测试：A=0, B=0, Cin=0
        #10; A = 1; B = 1; Cin = 0;   // 第 2 组测试：A=1, B=1, Cin=0
        #10; A = 2; B = 3; Cin = 0;   // 第 3 组测试：A=2, B=3, Cin=0
        #10; A = 4; B = 4; Cin = 0;   // 第 4 组测试：A=4, B=4, Cin=0
        #10; A = 7; B = 7; Cin = 1;   // 第 5 组测试：A=7, B=7, Cin=1
        #10; A = 15; B = 15; Cin = 0; // 第 6 组测试：A=15, B=15, Cin=0
        #10; A = 15; B = 15; Cin = 1; // 第 7 组测试：A=15, B=15, Cin=1

        // 可以根据需要添加更多测试样例
    end
endmodule
