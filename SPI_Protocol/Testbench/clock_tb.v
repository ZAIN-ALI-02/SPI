`timescale 1ns/1ns
`include "clock.v"

module clock_divider_tb;
    initial begin
        $dumpfile("./temp/clock_tb.vcd");
        $dumpvars(0,clock_divider_tb); 
    end

  // Inputs
  reg clk;
  reg rst;
  wire SCLK_2;
  wire SCLK_4;
  reg [1:0] clk_count ;



 clock_divider uut (
    .clk(clk),
    .rst(rst),
    .SCLK_2(SCLK_2),
    .SCLK_4(SCLK_4)
   // .clk_count(clk_count)
  );

     initial 
    clk = 1'b1;
    always #5 clk = ~clk;
    

    initial begin
     rst = 1;
    #10
     rst = 0;
     #10000;
    $finish;
    end
  endmodule