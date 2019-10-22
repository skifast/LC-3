module MARunit(addressin, data, aclr, clk, ldMAR, out);

 input [15:0] addressin, data;
 input ldMAR, aclr, clk;
 output [15:0] out;

 reg [15:0] MARReg;
 reg [15:0] MDRReg;

 reg ld;

 always @ (*) begin
  if(ldMAR==1) begin
   //if idMAR is high, there is data being written to an address
   //the second to last parameter into the memory module will thus be 1
   MARReg <= addressin;
   //if we are writing to some address, memory will write to that address and
   //store it in MDRReg
   //writing requires data from the data register to be put into a certain address in the address register
   ld <= 0;
  end
  else begin
   //reading requires the data taken from the address register and put into the data register
   MARReg <= addressin;
   MDRReg <= data;
   ld<= 1;
  end
 end

 //the writing function will not have an output, so MDRReg can be the "output" for
 //reading and writing
 memory(aclr, MARReg, clk, MDRReg, ld, out);

endmodule
