module InstructionMemory #(parameter Width = 32)
(
    input [Width-1:0] Addr,
    output [Width-1:0] RD
);

reg [Width-1:0] mem[511:0];

integer i;
initial begin
  $readmemh("../test/program.mem", mem, 0, 19);
end

assign RD = mem[Addr];

endmodule
