module SPI_Master (
  input wire clk,                 // System clock
  input wire rst,                 // Reset signal
  input wire enable,              // enable the master to start operation
  input wire [31:0] data_out,      // Data to be sent
  input wire [7:0] commands,      // Data to be sent
  input wire [23:0] Address,      // Data to be sent
  output reg CS,                 // Chip Select (active low)
  output reg SCLK,                // Serial Clock
  output reg MOSI,                // Master Out Slave In
  output reg MISO                 // Data received from the slave (miso)
);
parameter IDLE = 2'b00;
parameter START = 2'b01;
parameter TRANSFER = 2'b10;
parameter STOP = 2'b11;

reg [1:0] current_state , next_state;
reg [1:0] clk_count = 2'b11;
reg [31:0] shift_reg = 32'h0000_0000;
reg [5:0] shift_count = 6'b000000;
reg [31:0] Slave_reg = 32'h0000_0000;
integer i = 0;
integer z =0;
  
  always @(posedge clk) 
    begin
        if (rst) current_state <= IDLE;
        else 
           begin
                current_state = next_state ;
                clk_count = clk_count + 1'b1;  
                SCLK = ~clk_count[0];
            end 
                
    end
  always @(*) begin
    case(current_state)
      IDLE : begin 
                next_state =  enable ? START : IDLE ;
                CS = 1'b1;
                SCLK = 1'b1;
                MISO = 1'b0;
                MOSI = 1'b0;
                shift_count = 5'b00000;
                shift_reg = 32'h0000_0000;
                Slave_reg = 32'h0000_0000;
            if (clk) begin
                 shift_reg = {Address , commands};
                end
    end
      START : begin
                CS = 1'b0;
           if (!SCLK && clk) begin
                MOSI = shift_reg[i];
                Slave_reg = {MOSI, Slave_reg[31:1]};
                shift_count = shift_count + 1'b1;
                i = i + 1'b1;
                end
           if (shift_count == 32)begin
              shift_count = 0;
              i = 1'b0;
              next_state = TRANSFER ;
              end
    end
      TRANSFER  : begin
             if (clk)
         begin
                shift_reg = data_out;
         end
               if (commands == 8'b00000000)  // Read commad
                begin
                 MISO = 1'b0;
                end
           else
           begin
               if (commands == 8'b1101001) // write commad
             begin
               if (!SCLK && clk)
               begin
                MOSI = shift_reg[z];
                Slave_reg = {MOSI, Slave_reg[31:1]};
                shift_count = shift_count + 1'b1;
                z = z + 1'b1;
           if (shift_count == 32)begin
              shift_count = 0;
              z = 1'b0;
               next_state = STOP ;
               SCLK = 1'b1;
               end
              else
              begin
                next_state = current_state ;
            end
          end
          end
          end
          end
      STOP : begin
         next_state = IDLE;
         SCLK = 1'b1;
         CS = 1'b1;
         end
     default : begin 
         next_state = IDLE ;
         end
    endcase
  end

endmodule 