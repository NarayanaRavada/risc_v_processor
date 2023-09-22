`include "../src/processor.v"

module processor_tb;

reg clk, rst = 1'b1;

processor riscv(clk, rst);

initial clk = 0;
initial forever #5 clk = ~clk;

initial
begin
    #4 rst = 0;
    #10000 $finish;
end

endmodule
