module FullAdder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
    wire AxorB;
    wire AandB, AxorBandCin;
    xor (AxorB, A, B);
    xor (Sum, AxorB, Cin);
    and (AandB, A, B);
    and (AxorBandCin, AxorB, Cin);
    or  (Cout, AandB, AxorBandCin);
endmodule
