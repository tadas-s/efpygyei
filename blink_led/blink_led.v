module top(
	CLK,
	LED1,
	LED2
);

input CLK; //input 100Mhz clock
output LED1;
output LED2;

reg [23:0] clk_div; // 22 bit counter
reg LED1_register;
reg LED2_register;
wire led_clock; //signal with approx 0.6Hz clock: 100000000/(2^24)

assign LED1 = LED1_register;
assign LED2 = ~LED2_register;
assign led_clock = clk_div[23];

always @ (posedge CLK) begin
	clk_div <= clk_div + 22'b1;
end

always @ (posedge led_clock) begin
	LED1_register = ~LED1_register;
	LED2_register = ~LED2_register;
end

endmodule
