`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2021 10:47:22 AM
// Design Name: 
// Module Name: circuit2_tb
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


module circuit2_tb;
    reg a, b;
    wire f2;
    integer i;
    
    circuit2 uut(.A(a), .B(b), .F2(f2));
    
    initial begin
        $timeformat(-9, 1, " ns", 9);
        $display(" ");
        $display(" ");
        $display(" ");
        
        for(i=0;i<4;i=i+1) begin
            {a, b} = i;
            #5; $display("time = %t A = %0b B = %0b || F2 = %0b ", $time, a, b, f2);
        end 
        $finish;
    end   
endmodule
