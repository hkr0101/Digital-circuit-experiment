`timescale 1ns / 1ps

module Reversible_Counter_tb;
    reg ld_;
    reg ct_;
    reg u_;
    reg cp;
    reg [3:0] D;
    wire rco_;
    wire [3:0] Q;
    wire m;
    Reversible_Counter uut (
        .ld_(ld_),
        .ct_(ct_),
        .u_(u_),
        .cp(cp),
        .D(D),
        .m(m),
        .rco_(rco_),
        .Q(Q)
    );
    always #5 cp = ~cp;

    initial begin
        ld_ = 1;
        ct_ = 1;
        u_ = 1;
        cp = 0;
        D = 4'b0000;
        $monitor("Time=%t | ld_=%b ct_=%b u_=%b cp=%b D=%b | Q=%b m=%b rco_=%b",
                 $time, ld_, ct_, u_, cp, D, Q, m, rco_);
        #10;
        ld_ = 0;
        D = 4'b0101;
        #10;
        ld_ = 1;
        #20;
        ct_ = 0;
        u_ = 1;
        #100;
        u_ = 0;
        #100;
        ld_ = 0;
        D = 4'b1110;
        #10;
        ld_ = 1;
        #20;
        u_ = 1;
        #100;
        u_ = 0;
        #100;
        $stop;
    end
endmodule
