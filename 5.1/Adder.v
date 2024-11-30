`timescale 1ns / 1ps
module full_adder(
 input A,
 input B,
 input Cin,
 output Cout,
 output Sum
 );
//  assign Sum=A^B^Cin;
//  assign Cout=(A&B)|(A&Cin)|(B&Cin);
wire x1,x2,x3,x4,x5

xor u1(x1,A,B);
xor u2(Sum,x1,Cin);
and u3(x2,A,B);
and u4(x3,A,Cin);
and u5(x4,B,Cin);
or  u6(x5,x2,x3);
or  u7(Cout,x4,x5);

endmodule

module Ripple_Carry_Adder(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

wire C1,C2,C3;
full_adder fa0(
    .A(A[0]),
    .B(B[0]),
    .Cin(Cin),
    .Cout(C1),
    .Sum(Sum[0])
);
full_adder fa1 (
    .A(A[1]),
    .B(B[1]),
    .Cin(C1),
    .Cout(C2),
    .Sum(Sum[1])
);
full_adder fa2 (
    .A(A[2]),
    .B(B[2]),
    .Cin(C2),
    .Cout(C3),
    .Sum(Sum[2])
);
full_adder fa3 (
    .A(A[3]),
    .B(B[3]),
    .Cin(C3),
    .Cout(Cout),
    .Sum(Sum[3])
);
endmodule

