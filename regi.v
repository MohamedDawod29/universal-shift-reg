// parametrized shift register

module regi 
				#(parameter n = 4)
		
	      	(
					input clk,reset_n,
					input [1:0] s,
					input [n-1:0] D,
					output reg [n-1:0] Q,
					input shift_right_Din,shift_left_Din,
					output s_left_dout, 
					output s_right_dout
				);
				
				always @ (posedge clk)
					begin
						if (~reset_n)
						   Q <= 4'b0000;
						else
							begin 
								Q <= Q;
								 case (s)
								    2'b00: Q <= Q;
								    2'b01: Q <= {shift_right_Din,Q[n-1:1]};
								    2'b10: Q <= {Q[n-2:0],shift_left_Din};
								    2'b11: Q <= D;
								    default: Q <= Q;
								 endcase
							end
					 end
					 
					 
				 assign s_left_dout = Q [0];
				 assign s_right_dout = Q[n-1];
				 
endmodule
								 
						 