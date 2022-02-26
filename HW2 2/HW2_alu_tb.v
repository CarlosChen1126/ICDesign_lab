`timescale 1ns/10ps
module tb();
reg clk, rst_n_i;
reg [7:0] data_a_i, data_b_i;
reg [2:0] inst_i;
wire [15:0] data_o;
initial begin     
     $dumpfile("iclab.fsdb");
     $dumpvars;   	 
     clk=1'b0;
     rst_n_i=1'b1;
     data_a_i=8'd0;
     data_b_i=8'd0;
     inst_i=3'b0;

     #1 rst_n_i=1'b0;
     #6 rst_n_i=1'b1;
        
     #10 data_a_i=8'd25; data_b_i=8'd35; inst_i=3'b011;
     #20 data_a_i=8'd37; data_b_i=8'd128; inst_i=3'b100;
     #30 data_a_i=8'd50; data_b_i=8'd60; inst_i=3'b110;
     #40 data_a_i=8'd65; data_b_i=8'd100; inst_i=3'b110;
     #50 $finish;
end

always begin
  #5 clk=~clk;
end

alu I1(clk,rst_n_i,data_a_i,data_b_i,inst_i,data_o);
endmodule
