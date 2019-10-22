module IR (b, clk, reset, IdIR, IR);
 input [15:0] b;
 input clk, reset, IdIR;
 output reg [15:0] IR;

 //this is a simple d flip flop module
 always @ (posedge clk) begin
  if(reset == 1)
   IR <= 16'b0;
  else
   if(IdIR == 1)
    IR <= b;
   else
    IR <= IR;
 end

endmodule
