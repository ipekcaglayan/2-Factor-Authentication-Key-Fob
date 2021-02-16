module timekeeper (
	input clk,    // Clock
	output[15:0] cur_time	
);
reg [15:0] ct;
initial begin
	ct= 0;
end
always @(posedge clk) begin
	if (ct==16'b1111111111111111) begin
		ct<=0;
		
	end
	else begin
		ct<=ct+1;
	end
end
assign cur_time =ct ;

endmodule