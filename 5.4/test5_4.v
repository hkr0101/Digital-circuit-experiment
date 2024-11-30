`timescale 1ns / 1ps

module test_Binary_Priority_Encoder;
  reg en;
  reg [7:0] I;
  wire [2:0] Y;
  wire done;
  Binary_Priority_Encoder uut (
    .en(en),
    .I(I),
    .Y(Y),
    .done(done)
  );

  // 初始化输入信号
  initial begin
    // 初始值
    en = 0;
    I = 8'b00000000;
    $monitor("Time = %0t | en = %b, I = %b, Y = %b, done = %b", $time, en, I, Y, done);

    // 测试用例1：en = 0，所有I值均无效
    #10 en = 0; I = 8'b00000000;
    #10 en = 0; I = 8'b11100000;  // en = 0，done应该为0

    // 测试用例2：en = 1，输入不同的I值
    #10 en = 1; I = 8'b00000001;  // 只输入I[0]，done=1，Y=0
    #10 en = 1; I = 8'b00000010;  // 只输入I[1]，done=1，Y=1
    #10 en = 1; I = 8'b00000100;  // 只输入I[2]，done=1，Y=2
    #10 en = 1; I = 8'b00001000;  // 只输入I[3]，done=1，Y=3
    #10 en = 1; I = 8'b00010000;  // 只输入I[4]，done=1，Y=4
    #10 en = 1; I = 8'b00100000;  // 只输入I[5]，done=1，Y=5
    #10 en = 1; I = 8'b01000000;  // 只输入I[6]，done=1，Y=6
    #10 en = 1; I = 8'b10000000;  // 只输入I[7]，done=1，Y=7

    // 测试用例3：输入多个值（以测试优先级）
    #10 en = 1; I = 8'b11111111;  // 所有输入有效，I[7]优先，done=1，Y=7
    #10 en = 1; I = 8'b11000000;  // 输入I[7]和I[6]，done=1，Y=7（I[7]优先）
    #10 en = 1; I = 8'b00000111;  // 输入I[2], I[1], I[0]，done=1，Y=2（I[2]优先）

    // 结束仿真
    #10 $finish;
  end

endmodule
