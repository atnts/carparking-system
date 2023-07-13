module Seven_Segment(
input clock,
input clock1,
input [4:0]in,
input [15:0]sw,
output reg [6:0] seg,
output reg [3:0]an
);
reg [3:0]first; //register for the first digit
reg [3:0]second; //register for the second digit
reg [3:0]third;
reg [3:0]fourth;
reg [6:0]sseg;
reg [3:0]time_t[0:15];
integer i;
initial
begin
first <= 0;
second <= 0;
third <=0;
fourth <=0;
for(i = 0;i<16;i=i+1)
begin
time_t[i] <= 0;
end
end
always @(in)
begin
if(in > 4'd9)
begin
second = in/10;
first = in - (second*10);
end
else
begin
first = in;
second = 0;
end
end
always @(posedge clock1)
begin
if(sw[8]==0)
begin
time_t[8] = time_t[8]+1;
end
else if (sw[8]==1)
begin
fourth = time_t[0]/10;
third = time_t[8] - (fourth*10);
time_t[8]=0;
end
end
//Multiplexing circuit below
localparam N = 18;
reg [N-1:0]count;
always @ (posedge clock)
begin
count <= count + 1;
end
always @ (*)
begin
case(count[N-1:N-2])
2'b00 :
begin
sseg = first;
an = 4'b1110;
end
2'b01:
begin
sseg = second;
an = 4'b1101;
end
2'b10:
begin
sseg = third; //unknown sent to produce '-'
an = 4'b1011;
end
2'b11:
begin
sseg = fourth; //unknown sent to produce '-'
an = 4'b0111;
end
endcase
end
always @ (*)
begin
$display("%d %d",fourth,third);
case(sseg)
4'd0 : seg = 7'b1000000; //0
4'd1 : seg = 7'b1111001; //1
4'd2 : seg = 7'b0100100; //2
4'd3 : seg = 7'b0110000; //3
4'd4 : seg = 7'b0011001; //4
4'd5 : seg = 7'b0010010; //5
4'd6 : seg = 7'b0000010; //6
4'd7 : seg = 7'b1111000; //7
4'd8 : seg = 7'b0000000; //8
4'd9 : seg = 7'b0010000; //9
default : seg = 7'b0111111; //dash
endcase
end
endmodule