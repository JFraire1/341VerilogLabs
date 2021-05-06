`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2021 01:12:21 PM
// Design Name: 
// Module Name: addSub4B
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


module addSub4B(
    input [3:0] A, B,
    input add_sub,
    output [3:0] S,
    output cout,
    output overflow
    );
    
    wire c0, c1, c2;
    
    wire xor0, xor1, xor2, xor3;
    
    assign xor0 = add_sub ^ B[0],
    xor1 = add_sub ^ B[1],
    xor2 = add_sub ^ B[2],
    xor3 = add_sub ^ B[3];
    
    FA fa0(.A(A[0]), .B(B[0]), .c_in(add_sub), .c_out(c0), .sum(S[0])),
    fa1(.A(A[1]), .B(B[1]), .c_in(c0), .c_out(c1), .sum(S[1])),
    fa2(.A(A[2]), .B(B[2]), .c_in(c1), .c_out(c2), .sum(S[2])),
    fa3(.A(A[3]), .B(B[3]), .c_in(c2), .c_out(cout), .sum(S[3]));

    assign overflow = cout ^ c2;
    
endmodule
