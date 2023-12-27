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
  input wire MISO                 // Data received from the slave (miso)
);



localparam IDLE = 2'b00;
localparam  ADDRESS_COMMAND = 2'b10;
localparam DATA = 2'b11;
localparam START = 2'b01;

reg  toggle,address_command,data_transmited,data_recived , MISO_reg;
reg [1:0] current_state , next_state;
reg [31:0] shift_reg = 32'h0000_0000;
reg [5:0] shift_count = 6'b000_000;
reg [31:0] Slave_reg = 32'h0000_0000;


 always @(posedge clk) 
    begin
        if (rst) 
            begin
                current_state <= IDLE ;
                toggle <= 1;
            end 
        else 
            begin
                current_state <= next_state ;
                toggle <= ~toggle;  
            end 
    end



 always @(posedge clk) 
    begin
        if (rst) 
            begin
                    shift_reg <= 0;
                    shift_count <= 0;
                    address_command <= 0;
                    data_transmited <= 0;
                    data_recived <=0;
            end 
        else 
            begin
                if (current_state == IDLE || current_state == START)
                data_transmited <= 0 ;
                else
                data_transmited <= data_transmited;

                if (next_state == ADDRESS_COMMAND)
                shift_reg <= {commands , Address};
                else
                shift_reg <= shift_reg;
                if (current_state == ADDRESS_COMMAND) begin
                    
                if (SCLK) begin
                    shift_reg <= {shift_reg[30:0],1'b0};
                    shift_count <= shift_count + 1;
                    if (shift_count == 31) begin
                        shift_count <= 0;
                        address_command <= 1; 
                    end
                    else begin
                        address_command <= 0;

                    end
                end
                else begin
                    shift_reg <= shift_reg;
                    address_command <= 0;
                end
            end
                else
                if (commands == 8'h56 || commands == 8'b11101001)begin
                 if (current_state == DATA) begin
                 if (SCLK) begin
                    shift_reg <= {shift_reg[30:0],1'b0};
                    if (shift_count == 33) begin
                        shift_count <= 0;
                        data_transmited <= 1;
                    end
                    else begin
                        shift_count <= shift_count + 1;
                        data_transmited <= 0;
                    end
                end
                else begin
                    shift_reg <= shift_reg;
                    shift_count <= shift_count;
                    data_transmited <= 0;
                end
                 end
                 if (shift_count == 0 && next_state == DATA)
                 shift_reg <= data_out;
            end
            else begin
                if (commands == 8'b1111_1111)begin
                if (current_state == DATA) begin
                 if (SCLK == 0) begin
                    Slave_reg <= {Slave_reg[30:0],MISO};
                    if (shift_count == 31) begin
                        shift_count <= 0;
                        data_recived <= 1;
                    end
                    else begin
                        shift_count <= shift_count + 1;
                        data_recived <= 0;
                        
                    end
                end
                else begin
                    Slave_reg <= Slave_reg;
                    shift_count <= shift_count;
                    data_recived <= 0;
                    
                end
                end
                 end
            end
    end
    end

    always @(*) begin
        if (rst) begin
            next_state = 0;
            SCLK = 1;
            CS = 1;
            MOSI = 0;
            MISO_reg = 0;

        end
        else begin
            case (current_state)
                IDLE: 
                begin
                    CS = 1;
                    SCLK = 1;
                    MOSI = 0;
                    MISO_reg = 0;
                    if (enable == 1'b1) begin
                        next_state = START;
                    end     
                end

                 START: 
                begin  
                    // SCLK = toggle;
                       CS = 0;
                       MOSI = 0;
                       MISO_reg = 0;
                       next_state = ADDRESS_COMMAND;

                end

                 ADDRESS_COMMAND: 
                begin
                       SCLK = toggle;
                       CS = 0;
                       MISO_reg = 0;
                       MOSI = shift_reg[31];
                       if (address_command)
                       begin
                       next_state = DATA;
                       end
                       else
                       next_state = current_state;
                end

                 DATA: 
                begin
                       SCLK = toggle;
                       
                       CS = 0;
                       if (SCLK == 0)begin
                       MOSI = shift_reg[31];
                       end
                       if (data_transmited || data_recived)begin
                       next_state = IDLE;
                       SCLK = 1;
                       end
                       else
                       next_state = current_state;
                end
                       default: next_state = IDLE;
            endcase
        end
    end
 //   assign MISO = MISO_reg;
endmodule