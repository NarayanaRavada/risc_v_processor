module Alu #(parameter Width = 32)
(
    input [3:0] ctrlSig,
    input [Width-1:0] op1, op2,
    output reg [Width-1:0] aluOut,
    output reg carry,
    output reg zero
);

initial
begin
    zero = 0;
    carry = 0;
end

always @(*)
begin
    case(ctrlSig)
        4'b0000: aluOut <= ~op1;
        4'b0001: aluOut <= op1 & op2; 
        4'b0010: aluOut <= op1 | op2; 
        4'b0011: aluOut <= op1 ^ op2; 
        4'b0100: {carry, aluOut} <= op1 + op2; 
        4'b0101: {carry, aluOut} <= op1 - op2; 
        4'b0110: aluOut <= op1 >> op2; 
        4'b0111: aluOut <= op1 << op2;
        4'b1000: 
        begin
            aluOut <= op1 - op2;
            carry <= (op1 > op2 ? 1 : 0);
        end

        default: aluOut <= 32'bx;
    endcase
    zero = aluOut == 0;
end

endmodule

/*
        Control Signals 
    ------------------------
    0000 -> not  0110 -> rs
    0001 -> and  0111 -> ls
    0010 -> or   1000 -> cmp
    0011 -> xor  
    0100 -> add
    0101 -> sub
 */
