`timescale 1ns / 1ps

module PC(
    input clock,
    input Reset,
    input [31:0] Din,
    output reg [31:0] PC_Out
    );
    always@(posedge clock, posedge Reset)begin
        if (Reset) PC_Out <= 32'b0;
        else PC_Out <= Din;
    end   
endmodule
