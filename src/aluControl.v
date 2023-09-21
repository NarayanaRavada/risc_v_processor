module AluControl(
    input [1:0] Aluop,
    input [6:0] func7,
    input [2:0] func3,
    output reg [3:0] control
);

always @(*) 
begin
    case (Aluop)
        2'b00 : control <= 4'b0100; // add;
        2'b01 : control <= 4'b0101; // sub;
        2'b10 :
        begin
            case(func3)
                    3'b000 : control <= (func7 == 7'd0 ?  4'b0100 : 4'b0101); // add, sub
                    3'b001 : control <= 4'b0011; // xor
                    3'b010 : control <= 4'b0010; // or
                    3'b011 : control <= 4'b0001; // and
                    3'b100 : control <= (func7 == 7'd0 ?  4'b0110 : 4'b0110); // rs, rs
                    3'b101 : control <= (func7 == 7'd0 ?  4'b0111 : 4'b0111); // ls, ls
                    3'b110 : control <= 4'b1000;
                    default : control <= 4'bxxx;
                endcase
            end
    endcase
end
endmodule
