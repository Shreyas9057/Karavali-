`timescale 1ns / 1ps

module mem32_tb;
    reg clk,rst,rd,wr;
    reg [1:0] addr;
    reg [31:0] Indata;

    wire [7:0] Dataout;
    wire valid;

   mem32 dut (.clk(clk),.rst(rst),.rd(rd),.wr(wr),.addr(addr),.Indata(Indata),.Dataout(Dataout),.valid(valid));
    always #5 clk = ~clk;
    initial 
    begin
 
        clk = 0;
        rst = 1;         
        rd = 0;
        wr = 0;
        addr = 2'b00;
        Indata = 32'h00000000;
        
        #10;rst = 0;
        Indata = 32'hffffffff; 
        wr = 1;                 

        #10;
        #10; 
        #10; 
        #10; 
        #10; wr = 0;
        
        if (valid) 
            $display("Valid flag set. All data written successfully.");
        else
            $display("Error: Valid flag not set!");
            
        rd = 1;
        addr = 2'b00;  
        
        #10;
        $display("Read byte 0: Dataout = %h (Expected: A1)", Dataout);
        addr = 2'b01;
        
        #10;
        $display("Read byte 1: Dataout = %h (Expected: B2)", Dataout);

        addr = 2'b10;
        #10;
        $display("Read byte 2: Dataout = %h (Expected: C3)", Dataout);

        addr = 2'b11;  
        #10;
        $display("Read byte 3: Dataout = %h (Expected: D4)", Dataout);

        rd = 0;
        #10;
        $finish;
    end
endmodule
