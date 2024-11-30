`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/30 18:53:38
// Design Name: 
// Module Name: JK_Flip_Flop
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


module JK_Flip_Flop(
    input j,k,cp,s_,r_,
    output reg Q,
    output Q_
    );
    always @(negedge cp or negedge s_ or negedge r_)begin
        if(~r_)begin
            Q<=0;
        end
        else if(~s_)begin
            Q<=1;
        end
        else begin
            case ({j,k})
                2'b00:Q<=Q;
                2'b01:Q<=0;
                2'b10:Q<=1;
                2'b11:Q<=~Q;
                default:Q<=Q;
            endcase
        end
    end
    assign Q_ = ~Q;
endmodule
