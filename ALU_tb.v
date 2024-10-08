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
