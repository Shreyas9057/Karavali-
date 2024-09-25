module fir_filter_tb();

    reg clk;
    reg reset;
    reg signed [15:0] xn;       
    wire signed [31:0] yn;        

    fir_filter uut (.clk(clk),.reset(reset),.xn(xn),.yn(yn));

    initial begin
        clk = 0;
        forever #10 clk = ~clk;  
    end

    initial 
    begin
   
        reset = 1;
        xn = 16'd0;

        #20 reset = 0;

        #20 xn = 16'd100; 
        #20 xn = 16'd200;
        #20 xn = 16'd300; 
        #20 xn = 16'd400;  
        #20 xn = 16'd0;    
        
        #100 $finish;
    end

    initial 
    begin
        $monitor("At time %0t: xn = %d, yn = %d", $time, xn, yn);
    end
endmodule
