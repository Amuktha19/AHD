`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2022 11:50:53 PM
// Design Name: 
// Module Name: tb_pc
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


module tb_pc(    );
reg t_clk, t_rst, t_ld, t_inc; 
    reg [31:0] t_d;
    wire [31:0] t_q;
    
    integer fp,r;
    reg f_rst, f_ld, f_inc; 
    reg [31:0] f_d;
    reg [31:0] f_q;
    
    pc dut(
        .clk(t_clk),
        .rst(t_rst),
        .ld(t_ld),
        .inc(t_inc),
        .d(t_d),
        .q(t_q)
    );
    initial begin
        fp = $fopen("testcase1.csv","r");
        if(fp==0)begin
            $display("Error opening file");
            $stop; 
    end
         t_clk = 1;
         while(! $feof(fp))begin
            r = $fscanf(fp,"%b,%b,%b,%h,%h",f_rst,f_ld,f_inc,f_d,f_q);
            
            t_rst = f_rst;
            t_ld = f_ld;
            t_inc=f_inc;
            t_d=f_d;
            
         
         #10
         t_clk = 0;
         #10 
         t_clk = 1;
         
         if(t_q != f_q)begin
            $display("Error:Counter Value is not appropriate at %t",$time);
            $stop;
         end
        end
    $fclose(fp);
    $display("Testbench Successfull");
    $stop;
    end
    

endmodule
