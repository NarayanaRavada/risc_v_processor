module DataMemory #(parameter Width = 32) (
    input clk, MemWrite, MemRead,
    input [Width-1:0] Addr, WrData,
    output reg [Width-1:0] ReadData
);

reg [Width-1:0] mem[511:0];
integer i;

initial 
begin
    for (i = 0; i < 8; i++)
    begin
        mem[i] = 32'h00000000; 
    end
    always (posedge clk) 
    begin
        if (MemRead == 1'b1) 
        begin
            ReadData <= mem[Addr]
        end
    end
end
