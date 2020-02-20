`include "blink_led.v"

module top(
	CLK,
	LED1,
	LED2
);

input CLK; //input 100Mhz clock
output LED1;
output LED2;

reg [23:0] clk_div; // 22 bit counter
wire led_clock; //signal with approx 0.6Hz clock: 100000000/(2^24)
assign led_clock = clk_div[23];

always @ (posedge CLK) begin
	clk_div <= clk_div + 22'b1;
end

blink_led blink1(led_clock, LED1, LED2);

endmodule
