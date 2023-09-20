`include "../src/data_memory.v"

/* DataMemory Test Bench */

module tb;

parameter Width = 32;

reg clk = 0;
reg MemWrite = 1, MemRead = 1;
reg [7:0] Addr = 8'b00000000;
reg [Width-1:0] WrData = {Width/2{2'b10}};

wire [Width-1:0] ReadData;

DataMemory #(Width) dm (
    .clk(clk),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .Addr(Addr),
    .WrData(WrData),
    .ReadData(ReadData)
);

initial #200 $finish;
always #5 clk <= ~clk;

always @ (ReadData)
begin
    $monitor("%b", ReadData);
end

endmodule
