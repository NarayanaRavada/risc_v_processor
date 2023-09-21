module ProgramCounter #(parameter Width = 32)
(
    input clk,
    input [Width-1:0] PCnext,
    output reg [Width-1:0] PC
);

initial PC = 32'b0;

always @ (posedge clk)
begin
    PC <= PCnext;
end

endmodule
