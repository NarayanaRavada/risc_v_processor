module ProgramCounter (
    input clk, PCen, rst,
    input [7:0] PCnext,
    output reg [7:0] PC
);

always @ (posedge clk or posedge rst)
begin
    if (rst) 
    begin
        PC <= 8'h00;
    end
    else 
    begin
        PC <= PCnext;
    end
end

endmodule
