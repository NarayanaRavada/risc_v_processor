module register #(parameter Width = 32)(
    input clk, reg_wr, rst,
    input [4:0] RR1, RR2, WR1, 
    input [Width-1:0] WD
    output reg [Width-1:0] RD1, RD2, 
);

reg [Width-1:0] reg_mem [31:0];
integer i;
always @(posedge clk or posedge rst) 
begin
    if(rst) 
        begin
            for(i = 0; i < Width; i = i + 1)
            begin
                reg_mem[i] <= 32'd0;
            end
        end
    else if(!rst && reg_wr)
        begin 
            reg_mem[WR1] <= WD;
        end
    end
always @(*) 
    begin
        RD1 <= reg_mem[RR1];
        RD2 <= reg_mem[RR2];
    end
endmodule
