module Lab6Version2(b, clk, regWE, reset, DR, SR1, SR2, Ra, Rb);
 input [15:0] b;
 input clk, regWE, reset;
 input [2:0] DR, SR1, SR2;
 output [15:0] Ra, Rb;

 wire [7:0] decoded;

 wire [15:0] Reg0;
 wire [15:0] Reg1;
 wire [15:0] Reg2;
 wire [15:0] Reg3;
 wire [15:0] Reg4;
 wire [15:0] Reg5;
 wire [15:0] Reg6;
 wire [15:0] Reg7;

 decoder(DR, decoded);

 //calls eight instances of  16 bit wide
 //will only write to a certain register if the decoded bit is high
 //the decoded bit will only be high if the destination input
 //corresponds with the register
 DFF2 register0(b, (regWE & decoded[0]), clk, reset, Reg0);
 DFF2 register1(b, (regWE & decoded[1]), clk, reset, Reg1);
 DFF2 register2(b, (regWE & decoded[2]), clk, reset, Reg2);
 DFF2 register3(b, (regWE & decoded[3]), clk, reset, Reg3);
 DFF2 register4(b, (regWE & decoded[4]), clk, reset, Reg4);
 DFF2 register5(b, (regWE & decoded[5]), clk, reset, Reg5);
 DFF2 register6(b, (regWE & decoded[6]), clk, reset, Reg6);
 DFF2 register7(b, (regWE & decoded[7]), clk, reset, Reg7);

 //mux determines which register signals will come through
 mux(Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7, SR1, Ra);
   mux(Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7, SR2, Rb);

endmodule
module DFF2 (D, en, clk, reset, q);
 input [15:0] D;
 input en, reset, clk;
 output reg [15:0] q;

 always @(posedge clk)
  if(reset)
   q<=16'b0;
  else
   if(en)
    q <= D;
   else
    q <= q;
endmodule
module decoder(DR, decoded);
 input [2:0] DR;
 output reg[7:0] decoded;

 always @ (*)
  if(DR==0)
   decoded <= 8'b00000001;
  else if(DR==1)
   decoded <= 8'b00000010;
  else if(DR==2)
   decoded <= 8'b00000100;
  else if(DR==3)
   decoded <= 8'b00001000;
  else if(DR==4)
   decoded <= 8'b00010000;
  else if(DR==5)
   decoded <= 8'b00100000;
  else if(DR==6)
   decoded <= 8'b01000000;
  else
   decoded <= 8'b10000000;

endmodule
module mux(Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7, src, out);
 input [15:0] Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7;
 input [2:0] src;
 output wire [15:0] out;

 assign out = (src ==0)? Reg0: (src==1)? Reg1: (src==2)? Reg2: (src==3)? Reg3: (src==4)? Reg4: (src==5)?
 Reg5: (src==6)? Reg6: Reg7;
endmodule
