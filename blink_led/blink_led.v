module blink_led(
    CLK,
    LED1,
    LED2
);

input CLK;
output LED1;
output LED2;

reg LED1_register;
reg LED2_register;

assign LED1 = LED1_register;
assign LED2 = ~LED2_register;

always @ (posedge CLK) begin
	LED1_register = ~LED1_register;
	LED2_register = ~LED2_register;
end

endmodule