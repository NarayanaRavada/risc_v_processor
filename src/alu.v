/*

         █████╗ ██╗     ██╗   ██╗
        ██╔══██╗██║     ██║   ██║
        ███████║██║     ██║   ██║
        ██╔══██║██║     ██║   ██║
        ██║  ██║███████╗╚██████╔╝
        ╚═╝  ╚═╝╚══════╝ ╚═════╝ 
*/

/*
        Control Signals 
    ------------------------
    0000 -> not  1000 -> rlc
    0001 -> and  1001 -> rrc
    0010 -> or
    0011 -> xor
    0100 -> add
    0101 -> sub
    0110 -> mul
    0111 -> div
 */



module alu #(parameter Width = 32)
(
    input [3:0] ctrlSig,
    input [Width-1:0] op1, op2,
    output reg [Width-1:0] aluOut,
    output reg carry,
    output zero
);

always @(*)
    begin
        case(ctrlSig)
            4'b0000: aluOut <= ~op1;
            4'b0001: aluOut <= op1 & op2; 
            4'b0010: aluOut <= op1 | op2; 
            4'b0011: aluOut <= op1 ^ op2; 
            4'b0100: {carry, aluOut} <= op1 + op2; 
            4'b0101: {carry, aluOut} <= op1 - op2; 
            4'b0110: {carry, aluOut} <= op1 * op2; 
            4'b0111: {carry, aluOut} <= op1 / op2; 
            4'b1000: aluOut <= op1 >> op2; 
            4'b1001: {carry, aluOut} <= op1 << op2; 
            4'b1010: 
                begin
                    aluOut <= op1 - op2;
                    carry <= (op1 > op2 ? 1 : 0);
                end

           default: aluOut <= 32'b0;
       endcase

    end

    assign zero = ~|aluOut;
endmodule
