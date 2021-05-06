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
    output reg [1:0] Branch,
    output reg RegWrite, RegDst, MemRead, MemWrite, MemtoReg, ALUSrc,
    output reg [3:0] ALUCntl
    );
    always@(*)begin
        case(Op)
            6'b0: begin
                RegWrite = 1'b1;
                RegDst = 1'b1;
                ALUSrc = 1'b0;
                Branch = 2'b00;
                MemtoReg = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                case(Func)
                6'h20:ALUCntl = 4'b1010;
                6'h21:ALUCntl = 4'b0010;
                6'h22:ALUCntl = 4'b1110;
                6'h23:ALUCntl = 4'b0110;
                6'h24:ALUCntl = 4'b0000;
                6'h25:ALUCntl = 4'b0001;
                6'h26:ALUCntl = 4'b0011;
                6'h27: ALUCntl = 4'b1100;
                6'h2A: ALUCntl = 4'b0101;
                6'h2B: ALUCntl = 4'b1001;
                default: ALUCntl = 4'b0000;
            endcase
        end
        6'h08:begin //Add Immediate
            RegWrite = 1'b1;
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            Branch = 2'b00;
            MemtoReg = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            ALUCntl = 4'b1010;
        end
        6'h09:begin //Add I Unsigned
            RegWrite = 1'b1;
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            Branch = 2'b00;
            MemtoReg = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            ALUCntl = 4'b0010;    
        end
        6'h0C:begin //And Immediate
            RegWrite = 1'b1;
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            Branch = 2'b00;
            MemtoReg = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            ALUCntl = 4'b0000;
        end
        6'h0D:begin //Or Immediate
            RegWrite = 1'b1;
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            Branch = 2'b00;
            MemtoReg = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            ALUCntl = 4'b0001;
        end
        6'h23:begin //load word
            RegWrite = 1'b1;
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            Branch = 2'b00;
            MemtoReg = 1'b1;
            MemRead = 1'b1;
            MemWrite = 1'b0;
            ALUCntl = 4'b1010;        
        end
        6'h2B:begin //store word 
            RegWrite = 1'b0;
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            Branch = 2'b00;
            MemtoReg = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b1;
            ALUCntl = 4'b1010;
        end
        6'h04:begin //beq
            RegWrite = 1'b0;
            RegDst = 1'b0;
            ALUSrc = 1'b0;
            Branch = 2'b01;
            MemtoReg = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            ALUCntl = 4'b1110;    
        end
        6'h05:begin //bne
            RegWrite = 1'b0;
            RegDst = 1'b0;
            ALUSrc = 1'b0;
            Branch = 2'b10;
            MemtoReg = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            ALUCntl = 4'b1110; 
        end
        6'h0A:begin //slt Immediate
            RegWrite = 1'b1;
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            Branch = 2'b00;
            MemtoReg = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            ALUCntl = 4'b0101;
        end
        6'h0B:begin //slt I Unsigned
            RegWrite = 1'b1;
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            Branch = 2'b00;
            MemtoReg = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            ALUCntl = 4'b1001;
        end
        default:begin
            RegWrite = 1'b0;
            RegDst = 1'b1;
            ALUSrc = 1'b0;
            Branch = 2'b00;
            MemtoReg = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            ALUCntl = 4'b0000;
        end 
    endcase
    end
endmodule
