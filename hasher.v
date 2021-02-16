module hasher (
	input clk,    // Clock
	input [15:0] cur_time,
	input [15:0] student_id,
	output [15:0] cur_hash	
);
reg [31:0] prev_hash;
reg [15:0] curhash;
initial begin
	prev_hash=0;
	curhash=0;
end
always @(posedge clk) begin
	prev_hash=cur_hash;
	prev_hash=(cur_time^student_id)-prev_hash;
	prev_hash=prev_hash*prev_hash;
	prev_hash=prev_hash>>8;
	prev_hash=prev_hash & 16'b1111111111111111;
	curhash=prev_hash;
	
end
assign cur_hash = curhash ;

endmodule