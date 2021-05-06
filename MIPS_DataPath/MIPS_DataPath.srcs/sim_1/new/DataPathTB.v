`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 12:37:41 PM
// Design Name: 
// Module Name: DataPathTB
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


module DataPathTB;
    reg Clock;
    reg reset;
    
    wire [31:0] dOut;
    
    DataPath uut(.clock(Clock), .Reset(reset), .Dout(dOut));
    
    integer i;
    
    always #10 Clock = ~Clock; //20 ns cycle     
    
    task DumpRegFile; begin
        $timeformat(-9, 1, " ns", 9);
        for(i=0; i<32; i=i+1) begin
            @(posedge Clock)
            $display("t = %t rf(%0d): %h",
                        $time, i, uut.rf.regArray[i]);
        end
    end
    endtask
    
    initial begin
        $readmemh("imem.dat", uut.im.imem);
        $readmemh("regfile.dat", uut.rf.regArray);
        $timeformat(-9, 1, " ns", 9); //stuff to read memory and format time
        
        
        $display("--------------------------------------------------");
        $display("                                                  ");
        $display("                  MIPS Data Path                  ");
        $display("                                                  ");
        $display("--------------------------------------------------");
        
        Clock = 0; //initialize clock to 0 and reset to 1
        reset = 1;
        $display("t = %t: D_Out = %h", $time, dOut);
        $display("");
        $display("Reset now 0");
        $display("");
        @(negedge Clock) //after first cycle
        reset = 0;
        for (i=0;i<10;i=i+1) begin
          $display("t = %t: D_Out = %h", $time, dOut);
          #20;      //every cycle thereafter to display dout in console
        end
        $display("");
        $display("                 End of Test                 ");
        $display("");
        
        DumpRegFile;
        
        $finish;
    end    
endmodule
