module buttonFsm (
	input clk,
	input button,    
	output stateful_button
);
reg sb;
reg [1:0] state;
initial begin
	sb=0;
	state=0;
end
always @(posedge clk) begin
	case(state)
	0:
	begin
		if (button) begin
			state <=3;
		end
		else begin
			state <=0;	
		end	
	end
	1:
	begin
		if (button) begin
			state <=2;
		end
		else begin
			state <=1;	
		end	
		
	end
	2:
	begin
		if (button) begin
			state <=2;
		end
		else begin
			state <=0;	
		end	
		
	end
	3:
	begin
		if (button) begin
			state <=3;
		end
		else begin
			state <=1;	
		end	
		
	end
	
	default: begin
		
	end
	endcase
	
end
always @(state or button) begin
	case(state)
	0:
	begin
		if (button) begin
			sb=1;
		end
		else begin
			sb=0;	
		end	
	end
	1:
	begin
		if (button) begin
			sb=0;
		end
		else begin
			sb=1;	
		end	
		
	end
	2:
	begin
		if (button) begin
			sb=0;
		end
		else begin
			sb=0;
		end	
		
	end
	3:
	begin
		if (button) begin
			sb=1;
		end
		else begin
			sb=1;
		end	
		
	end
	
	default:
	 begin
		
	end
	endcase
end

assign stateful_button = sb ;

endmodule
