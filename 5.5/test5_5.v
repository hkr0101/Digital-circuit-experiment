`timescale 1ns / 1ps

module test_Multiplexer;

  // 输入信号
  reg [3:0] A, B, C, D;  // 4位输入
  reg en;                  // 使能信号
  reg [1:0] s;            // 选择信号

  // 输出信号
  wire [3:0] Y;           // 4位输出

  // 实例化被测试的模块
  Multiplexer uut (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .en(en),
    .s(s),
    .Y(Y)
  );

  // 初始化输入信号
  initial begin
    // 初始值
    en = 0;
    A = 4'b0000;
    B = 4'b0001;
    C = 4'b0010;
    D = 4'b0011;
    s = 2'b00;

    // 打印输出
    $monitor("Time = %0t | en = %b, s = %b, A = %b, B = %b, C = %b, D = %b, Y = %b", $time, en, s, A, B, C, D, Y);

    // 测试用例1：en = 0，所有输入都不影响输出
    #10 en = 0; s = 2'b00;
    #10 en = 0; s = 2'b01;
    #10 en = 0; s = 2'b10;
    #10 en = 0; s = 2'b11;

    // 测试用例2：en = 1，选择不同的输入
    #10 en = 1; s = 2'b00;  // 选择 A，Y 应为 A
    #10 en = 1; s = 2'b01;  // 选择 B，Y 应为 B
    #10 en = 1; s = 2'b10;  // 选择 C，Y 应为 C
    #10 en = 1; s = 2'b11;  // 选择 D，Y 应为 D

    // 测试用例3：更改 A, B, C, D 的值，验证输出
    #10 A = 4'b1000; B = 4'b1010; C = 4'b1100; D = 4'b1111;
    #10 en = 1; s = 2'b00;  // 选择 A，Y 应为 1000
    #10 en = 1; s = 2'b01;  // 选择 B，Y 应为 1010
    #10 en = 1; s = 2'b10;  // 选择 C，Y 应为 1100
    #10 en = 1; s = 2'b11;  // 选择 D，Y 应为 1111

    // 结束仿真
    #10 $finish;
  end

endmodule
