module rtcClkDivider (
	input sys_clk,    // 1 MHz
	output clk_500Hz, // 500 Hz
	output clk_5s  // 0.2 Hz
);
reg c500;
reg c5;
reg [10:0]counter1;
reg [128:0] counter2;
reg [128:0] ctrl;

initial begin
	counter1 =0 ;
	counter2 =0 ;
	c500=0;
	c5 =0 ;
	ctrl= KEYCHANGE_PERIOD*1000000;
end
parameter KEYCHANGE_PERIOD = 5 ;  // DO NOT CHANGE THE NAME OF THIS PARAMETER 
// AND MAKE SURE TO USE THIS PARAMETER INSTEAD OF HARDCODING OTHER VALUES
always @(posedge sys_clk) begin
	
	if (counter1==999) begin
		c500<= ~c500;
		counter1 <=counter1+1;
	end
		
	else if (counter1==1999) begin
		c500<= ~c500;
		counter1 <=0;
	end
	else begin
		counter1<=counter1+1;
		c500<=c500;
	end

	if (counter2==(ctrl/2-1)) begin
		c5 <= ~c5;
		counter2 <=counter2+1;
	end
		
	else if (counter2==(ctrl-1)) begin
		c5 <= ~c5;
		counter2 <=0;
	end
	else begin
		counter2 <=counter2+1;
		c5 <= c5;
	end

	
end
assign clk_5s =c5 ;
assign clk_500Hz =c500 ;

endmodule