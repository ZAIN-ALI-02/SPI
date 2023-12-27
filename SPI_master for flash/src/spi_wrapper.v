
`include "spi_flash_master.v"
module spi_wrapper (
  input wire clk,                 // System clock
  input wire rst,                 // Reset signal
  input wire [1:0] selector,
  
  output wire CS,                 // Chip Select (active low)
  output wire SCLK,                // Serial Clock
  output wire MOSI,                // Master Out Slave In
  input wire MISO                 // Data received from the slave (miso)
);




   reg enable;            // enable the master to start operation
   reg [31:0] data_out;      // Data to be sent
   reg [7:0] commands;     // commad to be sent
   reg [23:0] Address;      // Adddress to be sent

localparam IDLE = 2'b00;
localparam  READ = 2'b10;
localparam WRITE = 2'b01;
reg [1:0] current_state;

always @(posedge clk) 
    begin
        if (rst) 
            begin
                current_state <= IDLE;
            end 
        else 
            begin
                current_state <= selector; 
            end 
    end

    always @(*) begin
        if (rst) begin
            data_out = 0;
            commands = 0;
            Address = 0;
            enable = 0;

        end
        else begin
            case (current_state)
                IDLE: 
                begin
                data_out = 0;
                commands = 0;
                Address = 0;
                enable = 0;
                end

                 READ: 
                begin 
                data_out = 32'h0000;
                commands = 8'hFF;
                Address = 24'h456FAB;
                enable = 1;      
                end

                 WRITE: 
                begin
                data_out = 32'h1234AADD;
                commands = 8'h56;
                Address = 24'h258AFA;
                enable = 1;
                end
               default: current_state = IDLE;
            endcase
        end
    end

 SPI_Master uut_master (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .data_out(data_out),
    .commands(commands),
    .Address(Address),
    .CS(CS),
    .SCLK(SCLK),
    .MOSI(MOSI),
    .MISO(MISO)
  );
endmodule

