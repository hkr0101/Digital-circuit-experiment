`timescale 1ns / 1ps

module test_JK_Flip_Flop;
    reg j, k, cp, s_, r_;
    wire Q, Q_;
    JK_Flip_Flop uut (
        .j(j),
        .k(k),
        .cp(cp),
        .s_(s_),
        .r_(r_),
        .Q(Q),
        .Q_(Q_)
    );
    always begin
        #5 cp = ~cp;
    end
    initial begin
        cp = 0;
        j = 0;
        k = 0;
        s_ = 1;
        r_ = 1;
        $monitor("Time = %t | j = %b | k = %b | s_ = %b | r_ = %b | Q = %b | Q_ = %b", 
                 $time, j, k, s_, r_, Q, Q_);
        #10;
        j = 0; k = 0; s_ = 1; r_ = 1; #10;
        j = 0; k = 1; s_ = 1; r_ = 1; #10;
        j = 1; k = 0; s_ = 1; r_ = 1; #10;
        j = 1; k = 1; s_ = 1; r_ = 1; #10;
        j = 1; k = 1; s_ = 1; r_ = 0; #10;
        j = 1; k = 1; s_ = 0; r_ = 1; #10;
        $finish;
    end
endmodule
