`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2021 11:11:37 AM
// Design Name: 
// Module Name: circuit1_tb
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


module circuit1_tb;
    reg a, b, c;
    wire f1;
    integer i;
    
    circuit1 uut(.A(a), .B(b), .C(c), .F1(f1));
    
    initial begin
        $timeformat(-9, 1, " ns", 9);
        $display(" ");
        $display(" ");
        $display(" ");
        
        for(i=0;i<8;i=i+1) begin
            {a, b, c} = i;
            #5; $display("time = %t A = %0b B = %0b C = %0b || F2 = %0b ", $time, a, b, c, f1);
        end 
        $finish;
    end
endmodule
