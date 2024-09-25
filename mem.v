`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2024 11:35:34
// Design Name: 
// Module Name: mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mem(Dataout, wr, rd, clk, rst, addr, Datain);

output reg [7:0] Dataout;
input wr, rd, clk, rst;
input [3:0] addr;
input [7:0] Datain;

reg [7:0] A[0:10];
 integer i;

always @ (posedge clk or posedge rst)
begin
    if (rst)
    begin
        for (i = 0; i < 11; i = i + 1)
            A[i] <= 8'b0;
        Dataout <= 8'b0;
    end
    else
    begin
        case ({wr, rd})
            2'b10: A[addr] <= Datain;  
            2'b01: Dataout <= A[addr]; 
            2'b00: Dataout<=Dataout;
            default: Dataout <= 8'bz;  
        endcase
    end
end

endmodule
