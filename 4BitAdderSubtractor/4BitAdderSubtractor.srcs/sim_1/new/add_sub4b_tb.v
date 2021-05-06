`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2021 01:38:29 PM
// Design Name: 
// Module Name: add_sub4b_tb
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


module add_sub4b_tb;
    reg [3:0] a, b;
    reg addsubtb;
    wire [3:0] sum;
    wire coutb;
    wire overflowtb;
    integer i;
    
    addSub4B 
    uut(.A(a), .B(b), .add_sub(addsubtb), .S(sum), .cout(coutb), .overflow(overflowtb));

    initial begin
        $timeformat(-9, 1," ns", 9);
        $display("");
        $display("Enter Header Here");
        $display("");
        
        for(i=0;i<512;i=i+1) begin
            {addsubtb, a, b} = i;
            #3;
            $display("time = %0t A = %b B = %b add_sub = %b || cout = %b S = %b overflow = %b", 
            $time, a, b, addsubtb, coutb, sum, overflowtb);
        end        
    $finish;     
    end
endmodule
