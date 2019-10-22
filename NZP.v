module NZP(in, n, z, p);
 input [15:0] in;
 output reg n, z, p;

 //three seperate registers need three seperate conditionals
 always @ (*)
  if(in == 16'b0)
   z <= 1;
  else
   z <= 0;

 always @ (*)
  if((in[15] == 0) & (in != 16'b0))
   p <= 1;
  else
   p <= 0;
 always @ (*)
  if(in[15] == 1)
   n <= 1;
  else
   n <= 0;

endmodule
