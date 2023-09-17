module AluControl(
    input [1:0] Aluop,
    input [3:0] func,
    output reg [3:0] control
);

always @(*) 
begin
    case (Aluop)
        2'b00 : control <= 4'b0100; // add;
        2'b01 : control <= 4'b0100; // add;
        2'b10 : control <= 4'b0100; // add;
        2'b11 : case(func)
                    4'b0000 : control <= 4'b0100;// add
                    4'b0001 : control <= 4'b0101;// sub
                    4'b0010 : control <= 4'b0110;// mul
                    4'b0011 : control <= 4'b0111;// div
                    4'b0100 : control <= 4'b0000;// not
                    4'b0101 : control <= 4'b0001;// and
                    4'b0110 : control <= 4'b0010;// or
                    4'b0111 : control <= 4'b0011;// xor
                    default : control <= 4'bxxxx;
                endcase
    endcase
end
endmodule
