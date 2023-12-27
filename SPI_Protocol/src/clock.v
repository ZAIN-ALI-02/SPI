module clock_divider (
    input clk, rst,
    output reg SCLK_2,
    output reg SCLK_4
    );
reg [1:0] clk_count = 2'b00;
always @ (posedge(clk), posedge(rst))
begin
    if (rst) begin
        SCLK_2 <= 0; 
        SCLK_4 <= 0 ;
        end
    else begin
        clk_count <= clk_count + 1'b1;
    end
     SCLK_2 = clk_count[0];
     SCLK_4 = clk_count[1];
    end
endmodule