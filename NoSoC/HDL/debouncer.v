/* Author: Jean Castillo
	The purpuse of this module is to debounce the EN trigger button
	*/
module debouncer(in, clk, out);
	input in, clk;
	output out;
	
	reg [17:0] rep;
	reg inhist, out, start;
	
	always @(posedge clk) begin
		if ((inhist== 0)||(inhist==1)) begin
	
		if ((in == 1) && (inhist != in)) begin
				start = 1;
				inhist = in;
			end
		else begin
			if((in == 0) && (inhist != in)) begin
				inhist = in;
				out = 0;
				start = 0;
				rep = 0;
			end
		end
		
		if(start) begin
			if(rep >= 250000) //10 msec
				out = 1;
			else begin
				if (in == 1)
					rep = rep + 1;
				else rep = 0;
			end
		end
		end
		else begin
			inhist = in;
			rep = 0;
			out = 0;
		end
	end
	
endmodule
