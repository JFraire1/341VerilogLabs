`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2021 01:06:27 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUCntl,
    output reg [31:0] ALUout,
    output reg N,
    output Z,
    output reg C,
    output reg V
    );
    assign Z = (ALUout == 0) ? 1'b1 : 1'b0;
    always@(*) begin // makes always block sensetive to everything
        case(ALUCntl)
            4'b0000: begin  //AND
                        ALUout = A & B;
                        C = 1'bx;
                        V = 1'bx;
                        N = ALUout[31];
                     end
             4'b0001: begin  //OR
                        ALUout = A | B;
                        C = 1'bx;
                        V = 1'bx;
                        N = ALUout[31];
                     end
            4'b0011: begin  //XOR
                        ALUout = A ^ B;
                        C = 1'bx;
                        V = 1'bx;
                        N = ALUout[31];
                     end
             4'b0010: begin  //Add Unsign
                        {C,ALUout} = A + B;               
                        V = C;
                        N = 1'b0;
                     end
             4'b0110: begin  //Subtract Unsign
                       {C,ALUout} = A - B;                        
                        V = C;
                        N = 1'b0;
                     end                        
             4'b1100: begin  //NOR
                        ALUout = ~(A | B);
                        C = 1'bx;
                        V = 1'bx;
                        N = ALUout[31];
                     end                          
            4'b0111: begin  //NOT
                        ALUout = ~A;
                        C = 1'bx;
                        V = 1'bx;
                        N = ALUout[31];
                     end
            4'b1101: begin  //Shift
                        ALUout = A << 1;
                        C = A[31];
                        V = 1'bx;
                        N = ALUout[31];
                     end                                                                       
            4'b1010: begin // Add Signed
                        {C,ALUout} = A+B;
                        if ((A[31] & B[31] & ~ALUout[31] )|| (~A[31] & ~B[31] & ALUout[31]))
                            V = 1'b1;
                        else
                            V = 1'b0;
                        N = ALUout[31];         
                     end
           4'b1110: begin // Subtract Signed
                        {C,ALUout} = A-B;
                        if ((~A[31] & ~B[31] & ALUout[31] )|| (A[31] & B[31] & ~ALUout[31] ))
                            V = 1'b1;
                        else
                            V = 1'b0;
                        N = ALUout[31];         
                     end                              
            default: begin
                        ALUout = 32'bx;
                        {C,V,N} = 3'bxx;
                     end   
        endcase
        
end
    
    
     
    
        
    
    
    
    
    
endmodule
