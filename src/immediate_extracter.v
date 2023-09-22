module ImmediateExtractor #(parameter Width = 32)
(
    input [1:0] ImmSrc,
    input [Width-1:0] In,
    output reg [Width-1:0] Out
);
initial Out = 32'b0;

always @(*)
begin
    case(ImmSrc)
        2'b00 : Out <= {{Width-12{In[31]}},In[31:20]};
        2'b01 : Out <= {{Width-12{In[31]}},In[31:25],In[11:7]};
        2'b10 : Out <= {{Width-12{In[31]}},In[31],In[7],In[30:25],In[11:8]};
        2'b11 : Out <= {{Width-20{In[31]}},In[31],In[19:12],In[20],In[30:21]};
    default : Out <= {Width{1'b0}};
    endcase
end
endmodule
