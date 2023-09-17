`include "./alu.v"
`include "./aluControl.v"
`include "./register.v"

module alu_combined;

parameter Width = 8;

reg [Width-1:0] op1 = 10, op2 = 4;
wire [Width-1:0] aluOut;
wire carry;
wire zero;

reg [1:0] Aluop = 2'b11;
reg [3:0] func;
wire [3:0] control;

reg clk = 1, reg_wr = 1, rst = 0;
reg [4:0] RR1 = 0, RR2 = 1, WR1 = 0; 
reg [Width-1:0] WD = 8'b0;
wire [Width-1:0] RD1, RD2;

AluControl aluControl(.Aluop(Aluop), .func(func), .control(control));
alu #(Width) alu(.ctrlSig(control), .op1(RD1), .op2(RD2), .aluOut(aluOut), .carry(carry), .zero(zero));
register #(Width) (.clk(clk), .reg_wr(reg_wr), .rst(rst), .RR1(RR1), .RR2(RR2), .WR1(WR1), .WD(WD), .RD1(RD1), .RD2(RD2));

integer i = 0;

initial
begin 
    $display("op1 = %d, op2 = %d", RD1, RD2);
    $display("op1 = %b, op2 = %b", RD1, RD2);
    $display("\x1b[4m                                   \x1b[24m");
    $display("operation   output   carry   zero  ");
    $display("\x1b[9m                                   \x1b[29m");
    for (i = 0; i < 10; i = i + 1) 
        begin
            #10
            func <= i;
            $display("   %b       %d      %b       %b", control, aluOut, carry, zero);
        end 
    $display("\x1b[9m                                   \x1b[29m");
end
endmodule
