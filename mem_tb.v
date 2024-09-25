`timescale 1ns / 1ps


module mem_tb;

   
    reg clk;
    reg rst;
    reg wr;
    reg rd;
    reg [3:0] addr;
    reg [7:0] Datain;
    wire [7:0] Dataout;

    
    mem uut (
        .Dataout(Dataout),
        .wr(wr),
        .rd(rd),
        .clk(clk),
        .rst(rst),
        .addr(addr),
        .Datain(Datain)
    );

    
    always #5 clk = ~clk;

    initial begin
        
        clk = 0;
        rst = 0;
        wr = 0;
        rd = 0;
        addr = 0;
        Datain = 0;

        
        rst = 1;
        #10;
        rst = 0;

        
        wr = 1;
        rd = 0;
        addr = 4'b0001;
        Datain = 8'hAA;
        #10;

        wr = 1;
        rd = 0;
        addr = 4'b0010;
        Datain = 8'hBB;
        #10;
        
   
        wr = 0;
        rd = 1;
        addr = 4'b0001;
        #10;

        wr = 0;
        rd = 1;
        addr = 4'b0010;
        #10;
        
        wr = 0;
                rd = 0;
                addr = 4'b0010;
                Datain = 8'hBB;
                #10;
                
        wr = 1;
        rd = 1;
        addr = 4'b0010;
        #10;
        
        rst=1;
        #10;
        
      
        $finish;
    end

    initial begin
        $monitor("Time = %0t, rst = %b, wr = %b, rd = %b, addr = %b, Data_in = %h, Data_out = %h", 
                 $time, rst, wr, rd, addr, Datain, Dataout);
    end

endmodule


