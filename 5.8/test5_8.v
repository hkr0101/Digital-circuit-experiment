`timescale 1ns / 1ps

module Shift_Register_tb;
    reg cr_;
    reg s0;
    reg s1;
    reg cp;
    reg sr;
    reg sl;
    reg [7:0] d;
    wire [7:0] Q;
    Shift_Register uut (
        .cr_(cr_),
        .s0(s0),
        .s1(s1),
        .cp(cp),
        .sr(sr),
        .sl(sl),
        .d(d),
        .Q(Q)
    );
    initial begin
        cp = 0;
        forever #5 cp = ~cp;
    end
    initial begin
        cr_ = 0; s0 = 0; s1 = 0; sr = 0; sl = 0; d = 8'b0;
        #10 cr_ = 0;
        #10 cr_ = 1;
        if (Q !== 8'b00000000) $display("Test Case 1 Failed!");
        #10 s1 = 1; s0 = 1; d = 8'b10101010;
        if (Q !== 8'b10101010) $display("Test Case 2 Failed!");
        #10 s1 = 0; s0 = 1; sr = 1;
        #10;
        if (Q !== 8'b01010101) $display("Test Case 3 Failed!");
        #10 s1 = 1; s0 = 0; sl = 1;
        #10;
        if (Q !== 8'b10101010) $display("Test Case 4 Failed!");
        #10 s1 = 0; s0 = 0;
        #10;
        if (Q !== 8'b10101010) $display("Test Case 5 Failed!");
        #10;
        $stop;
    end

endmodule
