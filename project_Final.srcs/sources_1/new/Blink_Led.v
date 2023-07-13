module Blink_Led(
    input clk,
    output count    
    );
	 
integer counter;
reg state;

always @ (posedge clk) begin
    counter <= counter + 1;
	 if(counter >= 50000000 )begin
		counter <=0;
		state <= !state;
	 end 
end
	 
assign count = state;	 

endmodule
