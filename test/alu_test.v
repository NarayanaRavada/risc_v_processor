`include "../src/alu.v"

/* ALU Test Bench */

module alu_test;

parameter Width = 8;

reg [3:0] ctrlSig;
reg [Width-1:0] op1 = 10, op2 = 4;
wire [Width-1:0] aluOut;
wire zero, carry;
integer i = 0;

alu #(Width) mod(
    .ctrlSig(ctrlSig),
    .op1(op1),
    .op2(op2), 
    .aluOut(aluOut), 
    .zero(zero), 
    .carry(carry)
);

initial 
begin
    $display("op1 = %d, op2 = %d", op1, op2);
    $display("op1 = %b, op2 = %b", op1, op2);
    $display("\x1b[4m                                   \x1b[24m");
    $display("operation   output   carry   zero  ");
    $display("\x1b[9m                                   \x1b[29m");
    for (i = 0; i < 11; i = i + 1) 
    begin
        #5
        ctrlSig <= i;
        $display("   %b       %d      %b       %b", ctrlSig, aluOut, carry, zero);
    end
    $display("\x1b[9m                                   \x1b[29m");
end

endmodule
