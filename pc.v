module PC(Buss, clk, reset, ldPC, eabOut, selPC, PCOut);
 input clk, reset, ldPC;
 input [1:0] selPC;
 input [15:0] Buss, eabOut;
 output reg [15:0] PCOut;

 wire [15:0] PCplusone;

 //increments the PC
 assign PCplusone = Buss + 1;

 //conditionals to let signals through; a mux.
 always @ (posedge clk)
  if(reset == 1)
   PCOut <= 16'b0;
  else if(ldPC == 1)
   if(selPC == 2'b10)
    PCOut <= Buss;
   else if(selPC == 2'b01)
    PCOut <= eabOut;
   else if(selPC == 2'b11)
    PCOut <= PCOut;
   else
    PCOut <= PCplusone;
endmodule
