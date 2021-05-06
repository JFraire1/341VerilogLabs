`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 05:54:04 PM
// Design Name: 
// Module Name: iType_tb
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


module iType_tb;
    reg Clock;
    reg reset;
    
    DataPath uut(.clock(Clock), .Reset(reset));
    
    integer i;
    
    always #10 Clock = ~Clock; //20 ns cycle     
    
    task DumpMemFile; begin
        $timeformat(-9, 1, " ns", 9);
        for(i=24; i<52; i=i+4) begin
            @(posedge Clock)
            $display("t = %t Memory Location: %0d: %h",
                        $time, i, {uut.DM.dmem[i + 2'd0],
                                   uut.DM.dmem[i + 2'd1],
                                   uut.DM.dmem[i + 2'd2], 
                                   uut.DM.dmem[i + 2'd3]});
        end
    end
    endtask
    
    task DumpRegFile; begin
        $timeformat(-9, 1, " ns", 9);
        for(i=8; i<15; i=i+1) begin
            @(posedge Clock)
            $display("t = %t rf($t%0d): %h",
                        $time, i-8, uut.rf.regArray[i]);
        end
    end
    endtask
    
    initial begin
        $readmemh("imemLab5.dat", uut.im.imem);
        $readmemh("DataMem.dat", uut.DM.dmem);
        $timeformat(-9, 1, " ns", 9); //stuff to read memory and format time
        
        
        $display("--------------------------------------------------");
        $display("                                                  ");
        $display("                  MIPS Data Path                  ");
        $display("                                                  ");
        $display("--------------------------------------------------");
        
        Clock = 0; //initialize clock to 0 and reset to 1
        reset = 1;
        
        @(negedge Clock)
        reset = 0;
        #600;
        
        $display("--------------------------------------------------");
        $display("                 Final Values:                    ");
        $display("--------------------------------------------------");
        
        DumpMemFile;
        $display("");
        DumpRegFile;
        
        $display("");     
        $display("");
        $display("                 End of Test                 ");
        $display("");
        $finish;
    end  
    
endmodule
