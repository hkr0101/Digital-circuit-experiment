module CLA_4bit (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire [4:0] C;
    assign C[0] = Cin;
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : FA_LOOP 
            FullAdder FA (
                .A(A[i]),
                .B(B[i]),
                .Cin(C[i]),
                .Sum(Sum[i]),
                .Cout(C[i+1])
            );
        end
    endgenerate
    assign Cout = C[4];

endmodule
