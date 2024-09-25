module fir_filter (input clk,reset,input signed [15:0] xn,output reg signed [31:0] yn);

    parameter N = 4;             
    reg signed [15:0] b [0:N-1]; 
    reg signed [15:0] delay_line [0:N-1];  
    integer i;
    
    initial begin
        b[0] = 16'd1;
        b[1] = 16'd2;
        b[2] = 16'd3;
        b[3] = 16'd4;
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < N; i = i + 1) begin
                delay_line[i] <= 16'd0;
            end
            yn <= 32'd0;
        end 
        else
        begin
 
            for (i = N-1; i > 0; i = i - 1) begin
                delay_line[i] <= delay_line[i-1];
            end
            delay_line[0] <= xn;

            yn <= 0;
            for (i = 0; i < N; i = i + 1) begin
                yn <= yn + (b[i] * delay_line[i]);
            end
        end
    end
endmodule
