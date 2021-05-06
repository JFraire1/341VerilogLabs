`timescale 1ns / 1ps

module Mux32(
    input [31:0] in1, in2,
    input sel,
    output reg [31:0] out
    );
    always@(*)begin
        out = (~sel)? in1: in2; 
    end
endmodule