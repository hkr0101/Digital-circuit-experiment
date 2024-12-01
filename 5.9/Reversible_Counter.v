`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/01 21:11:10
// Design Name: 
// Module Name: Reversible_Counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Reversible_Counter(
    input ld_, ct_, u_, cp,
    input [3:0] D,
    output reg m,
    output rco_,
    output reg [3:0] Q
);
    always @(posedge cp or negedge ld_) begin
        if (~ld_) begin
            Q <= D;
            m <= 0;
        end else if (~ct_) begin
            if (~u_) begin
                if (Q == 4'b0000) begin
                    Q <= 4'b1111;
                    m <= 1;
                end else begin
                    Q <= Q - 1;
                    m <= 0;
                end
            end else begin
                if (Q == 4'b1111) begin
                    Q <= 4'b0000;
                    m <= 1;
                end else begin
                    Q <= Q + 1;
                    m <= 0;
                end
            end
        end
    end

    assign rco_ = cp|ct_|(~m);
endmodule
