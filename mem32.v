`timescale 1ns / 1ps



module mem32(clk, rst, rd, wr, addr, Indata, Dataout, valid);
    input clk, rst, rd, wr;
    input [1:0] addr;           
    input [31:0] Indata;        
    output reg [7:0] Dataout;  
    output reg valid;         

    reg [7:0] mem_array[0:3];   

    reg [1:0] write_counter;  

    always @(posedge clk or posedge rst) 
    begin
        if (rst) begin
            Dataout <= 8'b0;    
            valid <= 0;         
            write_counter <= 2'b00; 
        end 
        else begin
            if (wr && !rd) begin
                case (write_counter)
                    2'b00: mem_array[0] <= Indata[7:0]; 
                    2'b01: mem_array[1] <= Indata[15:8]; 
                    2'b10: mem_array[2] <= Indata[23:16]; 
                    2'b11: begin
                        mem_array[3] <= Indata[31:24];    
                        valid <= 1;                       
                    end
                endcase
                if (write_counter < 2'b11) begin
                    write_counter <= write_counter + 1;   
                end
            end 
            else if (rd && !wr) begin
                Dataout <= mem_array[addr];              
            end 
            else begin
                Dataout <= 8'bz;                          
            end
        end
    end
endmodule
