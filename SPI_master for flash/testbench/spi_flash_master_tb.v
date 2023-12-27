`timescale 1ns/1ns
`include "spi_wrapper.v"

module SPI_Master_tb;
   
  initial begin
        $dumpfile("./temp/spi_flash_master_tb.vcd");
        $dumpvars(0,SPI_Master_tb); 
    end
   // inputs
   reg clk;               // System clock
   reg rst;                 // Reset signal
   reg enable ;          // enable the master to start operation
            
   reg [31:0] data_out ;     // Data to be sent
   reg [7:0] commands ;    // Data to be sent
   reg [23:0] Address ;     // Data to be sent

   //outputs

   reg MISO ;               // Data received from the slave (miso)
   reg [1:0] selector;
 spi_wrapper uut_wrapper (
    .clk(clk),
    .rst(rst),
    .selector(selector),

    .MISO(MISO)
  );
   always #5 clk = ~clk;
initial
       begin
clk = 1'b1;
rst = 1'b1;
#50
rst = 0;
selector = 2'b00;
#500
selector = 2'b01;
#1340
selector = 2'b00;
#1000
selector = 2'b10;
#680
MISO = 1;
#20
MISO = 1;
#20
MISO = 1;
#20
MISO = 1;
#20
MISO = 0;
#20
MISO = 0;
#20
MISO = 0;
#20
MISO = 1;
#20
MISO = 1;
#20
MISO = 0;
#20
MISO = 1;
#20
MISO = 1;
#20
MISO = 1;
#20
MISO = 1;
#20
MISO = 1;
#20
MISO = 0;
#20
MISO = 0;
#20
MISO = 0;
#20
MISO = 1;
#20
MISO = 1;
#20
MISO = 0;
#20
MISO = 1;
#20
MISO = 1;
#20
MISO = 1;
#20
MISO = 1;
#20
MISO = 1;
#20
MISO = 0;
#20
MISO = 0;
#20
MISO = 0;
#20
MISO = 1;
#20
MISO = 1;
#20
MISO = 0;
#20
MISO = 1;
#20
#30000;
$finish;
        end
endmodule

