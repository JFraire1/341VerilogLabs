`timescale 1ns / 1ps

module DataPath(
    input clock,
    input Reset
    );
    
    wire [31:0] PCaddin;
    wire [31:0] PCaddout;
    wire [3:0] ALUCntl;
    wire [31:0] instruction;
    wire [31:0] rsvalue, rtvalue;
    wire [31:0] ALUout;
    wire RegDst;
    wire RegWrite;
    wire [1:0] Branch;
    wire MemRead;
    wire MemtoReg;
    wire MemWrite;
    wire ALUsrc;
    wire ALUZero;
    wire jump;
    wire [31:0] JumpMuxOut;
    wire [31:0] BranchMuxOut;
    wire [31:0] ALUSrcMuxOut;
    wire [31:0] DataMuxOut;
    wire [4:0] InstructionMuxOut;
    wire [31:0] SignExtImm;
    wire [31:0] jumpAddress = {PCaddout[31:28], instruction[25:0], 2'b00};
    wire [31:0] SignExtShiftAdd = (SignExtImm << 2) + PCaddout;
    wire [31:0] ReadData;
    
    DataMem DM(.clk(clock), .mem_wr(MemWrite), .mem_rd(MemRead), .addr(ALUout), .wr_data(rtvalue), .rd_data(ReadData));
    SignExtend SE(.in(instruction[15:0]), .out(SignExtImm));
    Mux5 InstructionMux(.in1(instruction[20:16]), .in2(instruction[15:11]), .sel(RegDst), .out(InstructionMuxOut));
    Mux32 DataMux(.in1(ALUout), .in2(ReadData), .sel(MemtoReg), .out(DataMuxOut));
    Mux32 ALUSrcMux(.in1(rtvalue), .in2(SignExtImm), .sel(ALUSrc), .out(ALUSrcMuxOut));
    Mux32 BranchMux(.in1(PCaddout), .in2(SignExtShiftAdd), .sel((Branch[0] & ALUZero) | (Branch[1] & ~ALUZero)), .out(BranchMuxOut));
    Mux32 JumpMux(.in1(BranchMuxOut), .in2(jumpAddress), .sel(jump), .out(JumpMuxOut));
    PC pc(.Din(JumpMuxOut), .clock(clock), .Reset(Reset), .PC_Out(PCaddin));
    PCADD pcadd(.Din(PCaddin), .PC_Add_Out(PCaddout));
    Control cntrl(.Op(instruction[31:26]), .Func(instruction[5:0]), .ALUCntl(ALUCntl), .RegWrite(RegWrite), 
    .RegDst(RegDst), .MemRead(MemRead), .MemWrite(MemWrite), .MemtoReg(MemtoReg), .ALUSrc(ALUSrc), .Branch(Branch), .jump(jump));
    ALU alu(.ALUCntl(ALUCntl), .A(rsvalue), .B(ALUSrcMuxOut), .ALUout(ALUout), .Z(ALUZero));
    Instruction_Memory im(.Addr(PCaddin), .Inst_out(instruction));
    regfile32 rf(.clk(clock), .reset(Reset), .D_En(RegWrite), .D_Addr(InstructionMuxOut), .S_Addr(instruction[25:21]), .T_Addr(instruction[20:16]), .D(DataMuxOut), .S(rsvalue), .T(rtvalue));
    
endmodule