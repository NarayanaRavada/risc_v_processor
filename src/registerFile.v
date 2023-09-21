module RegisterFile #(parameter Width = 32)
(
    input clk, RegWrite, rst,
    input [4:0] RR1, RR2, WR1, 
    input [Width-1:0] WD,
    output reg [Width-1:0] RD1, RD2
);

initial
begin
    for(i = 0; i < Width; i = i + 1)
    begin
        reg_mem[i] <= 32'd0;
    end
end

reg [Width-1:0] reg_mem [31:0];
integer i;
always @(posedge clk) 
begin
    if(rst) 
        begin
            for(i = 0; i < Width; i = i + 1)
            begin
                reg_mem[i] <= 32'd0;
            end
        end
    else if(!rst && RegWrite)
        begin 
            reg_mem[WR1] <= WD;
            $monitor("%0t : d6 = %d, d4 = %d, d8 = %d", $time, reg_mem[6], reg_mem[4], reg_mem[8]);
        end
    end
always @(*) 
    begin
        RD1 <= reg_mem[RR1];
        RD2 <= reg_mem[RR2];
    end
endmodule
