module DataMemory #(parameter Width = 32) 
(
    input clk, MemWrite, MemRead,
    input [Width-1:0] Addr,
    input [Width-1:0] WriteData,
    output reg [Width-1:0] ReadData
);

reg [Width-1:0] mem[511:0];
integer i;

initial
begin
    for (i = 0; i < 511; i = i + 1)
    begin
        mem[i] = {Width{1'b0}};
    end
end

always @ (posedge clk)
begin
    if (MemRead == 1'b1)
    begin
        ReadData <= mem[Addr];
    end

    if (MemWrite == 1'b1)
    begin
        mem[Addr] <= WriteData;
    end
end

endmodule
