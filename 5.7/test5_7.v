`timescale 1ns / 1ps

module Register8bit_tb;
    reg [7:0] D;
    reg clk, clr, en_;
    wire [7:0] Z;
    Register8bit dut (
        .D(D),
        .clk(clk),
        .clr(clr),
        .en_(en_),
        .Z(Z)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        D = 8'b0;
        clr = 0;
        en_ = 1;
        #5 clr = 1; #10 clr = 0;
        #10 D = 8'b10101010; en_ = 0;
        #10;
        en_ = 1; 
        #10;
        clr = 1; 
        #10 clr = 0;
        D = 8'b11001100; en_ = 0;
        #10;
        en_ = 1;D = 8'b11111111;
        #5;
        en_ = 0;
        #15;
        $finish;
    end
    initial begin
        $monitor("Time=%0t | D=%b | clk=%b | clr=%b | en_=%b | Z=%b ", 
                 $time, D, clk, clr, en_, Z );
    end
endmodule