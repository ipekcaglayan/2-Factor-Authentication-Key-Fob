module top (

	input sysclk,    // 1 MHz
	input button_in,
	input [15:0] student_id,
	output[3:0] D5_out,	
	output[3:0] D4_out,	
	output[3:0] D3_out,	
	output[3:0] D2_out,	
	output[3:0] D1_out		
);

wire clk500;
wire clk5s;
wire [15:0] curtime;
wire [15:0] curhash;
wire disp;
rtcClkDivider clkd(
	.sys_clk(sysclk),    
	.clk_500Hz(clk500), 
	.clk_5s(clk5s)
	);

timekeeper timekep(
	.clk(clk5s),    
	.cur_time(curtime)	
	);

hasher hs(
	.clk(clk5s),  
	.cur_time(curtime),
	.student_id(student_id),
	.cur_hash(curhash)	
	);
buttonFsm button(
	.clk(clk500),
	.button(button_in),    
	.stateful_button(disp)
	);
b16toBCD display(
	.to_display(curhash),
	.enable(disp),
	.D5(D5_out),	
	.D4(D4_out),
	.D3(D3_out),
	.D2(D2_out),
	.D1(D1_out)
	);

endmodule