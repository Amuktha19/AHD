`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2022 01:40:03 AM
// Design Name: 
// Module Name: pc
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


module pc(
    input [31:0] d,
    input ld,
    input rst,
    input clk,
    input inc,
    output reg [31:0] q
    );
    reg [31:0] cnt;

always @(posedge clk) begin
    if (rst) cnt = 32'b00000001000000000000000000000000; 
    else begin
        if(ld) cnt=d;
        else begin
            if(inc) cnt=d+4;
        end
   end
   q=cnt;
 end
        

endmodule