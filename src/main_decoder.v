module MainDecoder
(
    input [6:0] Opcode,
    output RegWrite, AluSrc, MemWrite, Branch, jump,
    output [1:0] ImmSrc, ResultSrc, AluOp
);
reg [10:0] control;
assign { RegWrite, ImmSrc, AluSrc, MemWrite, ResultSrc, Branch, AluOp, jump } = control;

always @(*)
    begin
    case(Opcode)
        7'b0110011 : control <= 11'b1xx00010100; // R-type
        7'b0000011 : control <= 11'b10010100000; // lw-type
        7'b0100011 : control <= 11'b00111xx0000; // s-type
        7'b0010011 : control <= 11'b10010010100; // I-type
        7'b1100011 : control <= 11'b01000xx1011; // sb-type
        7'b1100111 : control <= 11'b111x0100xx1; // jalr-type
        default : control    <= 11'bxxxxxxxxxxx;
    endcase
end
endmodule

/* TODO
* check beq and bneq
* */
