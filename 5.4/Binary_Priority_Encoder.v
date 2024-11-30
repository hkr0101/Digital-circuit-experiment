`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/27 19:18:31
// Design Name: 
// Module Name: Binary_Priority_Encoder
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


module Binary_Priority_Encoder(
    input en,
    input [0:7]I,
    output reg [0:2]Y,
    output reg done
    );
    always@(*)begin
        Y=3'b0;
        done=0;
        if(en)begin
            done=1;
            if(I[0])begin end
            else if(I[1])begin Y[0]=1; end
            else if(I[2])begin Y[1]=1; end
            else if(I[3])begin Y[0]=1;Y[1]=1; end
            else if(I[4])begin Y[2]=1; end
            else if(I[5])begin Y[2]=1;Y[0]=1; end
            else if(I[6])begin Y[2]=1;Y[1]=1; end
            else if(I[7])begin Y[0]=1;Y[2]=1;Y[1]=1; end
            else begin done=0; end
        end
    end
    
endmodule
