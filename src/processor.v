/*
██████╗ ██╗███████╗ ██████╗          ██╗   ██╗
██╔══██╗██║██╔════╝██╔════╝          ██║   ██║
██████╔╝██║███████╗██║         █████╗██║   ██║
██╔══██╗██║╚════██║██║         ╚════╝╚██╗ ██╔╝
██║  ██║██║███████║╚██████╗           ╚████╔╝ 
╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝            ╚═══╝  
*/


`include "../src/mux_2in.v"
`include "../src/programcounter.v"
`include "../src/adder.v"
`include "../src/instruction_memory.v"
`include "../src/main_decoder.v"
`include "../src/immediate_extracter.v"
`include "../src/registerFile.v"
`include "../src/aluControl.v"
`include "../src/alu.v"
`include "../src/data_memory.v"
`include "../src/mux_3in.v"

module processor #(parameter Width = 32)
(
    input clk, rst
);

wire [31:0] PC, PCp4, PCinput, PCtarget;
wire RegWrite, AluSrc, MemWrite, Branch, PCsrc, Zero;
wire [1:0] ImmSrc, ResultSrc, AluOp;
wire [Width-1:0] ImmEx;
wire [Width-1:0] RD, RD1, RD2, WriteData, AluOut, ReadData, MuxedAddr; 
wire [3:0] ctrlSig;

Mux2 #(32) m1(PCp4, PCtarget, PCsrc, PCinput);
ProgramCounter #(32) pc(clk, PCinput, PC);
Adder #(32) a1(PC, 1, PCp4);
InstructionMemory #(32) Im(PC, RD);
MainDecoder Md(RD[6:0], RegWrite, ALUSrc, MemWrite, Branch, jump, ImmSrc, ResultSrc, AluOp);
ImmediateExtractor #(32) Ie(ImmSrc, RD, ImmEx);
RegisterFile Rf(clk, RegWrite, rst, RD[19:15], RD[24:20], RD[11:7], WriteData, RD1, RD2);
Mux2 #(32) m2(RD2, ImmEx, ALUSrc, MuxedAddr);
AluControl AC(AluOp, RD[31:25], RD[14:12], ctrlSig);
Alu #(32) Alu(ctrlSig, RD1, MuxedAddr, AluOut, carry, Zero);
DataMemory #(32) Dm(clk, MemWrite, MemRead, AluOut, RD2, ReadData);
Mux3 #(32) m3(ReadData, AluOut, PCp4, ResultSrc, WriteData);
Adder #(32) a2(PC, ImmEx, PCtarget);
nand And(andOut, Branch, Zero);
and Or(PCsrc, andOut, jump);

endmodule
