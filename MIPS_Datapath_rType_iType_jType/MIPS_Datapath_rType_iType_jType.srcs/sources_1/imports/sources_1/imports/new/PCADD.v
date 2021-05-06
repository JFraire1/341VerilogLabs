`timescale 1ns / 1ps

module PCADD(
    input [31:0] Din,
    output [31:0] PC_Add_Out
    );
    assign PC_Add_Out = Din + 4;
endmodule