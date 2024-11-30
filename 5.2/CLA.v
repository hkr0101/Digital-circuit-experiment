module CLA_4bit (
    input [3:0] A,      // 4位加数
    input [3:0] B,      // 4位被加数
    input Cin,          // 初始进位
    output [3:0] Sum,   // 4位和
    output Cout         // 最终进位
);
    // 局部信号
    wire [3:0] G;       // 生成信号
    wire [3:0] P;       // 传播信号
    wire [3:0] C;       // 进位信号

    // 生成和传播信号
    assign G = A & B;   // G[i] = A[i] & B[i]
    assign P = A | B;   // P[i] = A[i] | B[i]

    // 进位信号
    assign C[0] = Cin;                          // C0 = Cin
    assign C[1] = G[0] | (P[0] & C[0]);         // C1 = G0 + P0 * C0
    assign C[2] = G[1] | (P[1] & C[1]);         // C2 = G1 + P1 * C1
    assign C[3] = G[2] | (P[2] & C[2]);         // C3 = G2 + P2 * C2

    // 最终进位
    assign Cout = G[3] | (P[3] & C[3]);         // Cout = G3 + P3 * C3
    
    // 求和
    assign Sum = A ^ B ^ C;                         // Sum[i] = P[i] ^ C[i]

endmodule
