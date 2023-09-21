module Adder #(parameter Width = 32) 
(
    input [Width-1:0] A, B,
    output [Width-1:0] out
);

assign out = A + B;

endmodule
