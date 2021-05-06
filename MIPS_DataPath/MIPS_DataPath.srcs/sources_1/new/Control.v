`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2021 04:57:58 PM
// Design Name: 
// Module Name: Control
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


module Control(
    input [5:0] Op, Func,
    output reg RegWrite,
    output reg [3:0] ALUCntl
    );
    always@(*)begin
        if (Op == 6'b0)begin
            RegWrite = 1'b1;
            case(Func)
                6'h20:begin
                    ALUCntl = 4'b1010;
                end
                6'h21:begin
                    ALUCntl = 4'b0010;
                end
                 6'h22:begin
                    ALUCntl = 4'b1110;
                end
                6'h23:begin
                    ALUCntl = 4'b0110;
                end
                6'h24:begin
                    ALUCntl = 4'b0000;
                end
                 6'h25:begin
                    ALUCntl = 4'b0001;
                end
                6'h26:begin
                    ALUCntl = 4'b0011;
                end
                6'h27:begin
                    ALUCntl = 4'b1100;
                end
                 6'h2A:begin
                    ALUCntl = 4'b0101;
                end
                6'h2B:begin
                    ALUCntl = 4'b1001;
                end
                default:begin
                    ALUCntl = 4'b0000;
                end
            endcase
        end
        else begin
            RegWrite = 1'b0;
            ALUCntl = 4'b0000;        
        end
    end
endmodule
