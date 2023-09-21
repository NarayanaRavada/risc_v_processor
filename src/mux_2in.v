module Mux2 #(parameter Width = 32)
(
    input [Width-1 : 0] A, B,
    input  s,
    output [Width-1 : 0] out
);

assign out = s ? B : A;
endmodule
