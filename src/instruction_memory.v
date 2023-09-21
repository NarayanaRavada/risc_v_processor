module InstructionMemory #(parameter Width = 32)
(
    input [Width-1:0] Addr,
    output [Width-1:0] RD
);

reg [Width-1:0] mem[511:0];

initial
begin
    mem[0] = 32'h00a30313;
    mem[4] = 32'h00120213;
    mem[8] = 32'h00440433;
    mem[12] = 32'hfe4318e3;
end

assign RD = mem[Addr];

endmodule
