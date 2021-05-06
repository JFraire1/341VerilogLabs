`timescale 1ns / 1ps

module DataPath(
    input clock,
    input Reset,
    wire [31:0] Dout
    );
    
    wire [31:0] PCaddin;
    wire [31:0] PCaddout;
    wire [3:0] ALUCntl;
    wire [31:0] instruction;
    wire RegWrite;
    wire [31:0] rsvalue, rtvalue;
    wire [31:0] ALUout;    
    
    PC pc(.Din(PCaddout), .clock(clock), .Reset(Reset), .PC_Out(PCaddin));
    PCADD pcadd(.Din(PCaddin), .PC_Add_Out(PCaddout));
    Control cntrl(.Op(instruction[31:26]), .Func(instruction[5:0]), .ALUCntl(ALUCntl), .RegWrite(RegWrite));
    ALU alu(.ALUCntl(ALUCntl), .A(rsvalue), .B(rtvalue), .ALUout(ALUout));
    Instruction_Memory im(.Addr(PCaddin), .Inst_out(instruction));
    regfile32 rf(.clk(clock), .reset(Reset), .D_En(RegWrite), .D_Addr(instruction[15:11]), .S_Addr(instruction[25:21]), .T_Addr(instruction[20:16]), .D(ALUout), .S(rsvalue), .T(rtvalue));
    
    assign Dout = ALUout;
endmodule