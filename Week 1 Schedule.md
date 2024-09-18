# Week 1
## Day 1
We revisited the basics of Verilog and its framework, including the rules for both testbench creation and design. This review was crucial as we worked on understanding Verilog codes, and was tasked to build an ALU program testbench, which required precise implementation and testing.

ALU Testbench:

Module alu_tb();  
reg [31:0]a;  
reg [31:0]b;  
reg [2:0]fun;  
wire [31:0]y;  
alu U0(a,b,fun,y);  
initial  
begin  
a= 32'h00000000;  
b= 32'hffffffff;  
#10 fun=0;  
#10 fun = 1;  
#10 fun = 2;  
#10 fun = 3;  
#10 fun = 4;  
#10 $finish;  
end  
endmodule  

Additionally, we selected a test engineer within our group, __Shreyas S__, to focus on the testing process, ensuring the functionality and correctness of the design through the developed testbench.
