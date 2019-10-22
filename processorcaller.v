module Processor(in, a, b, c);
 input [15:0] in;
 output a, b, c;
 NZP(in, a, b, c);
endmodule
/*
module PCCaller(Buss, clk, reset, ldPC, eabOut, selPC, PCOut);
 input [15:0] Buss, eabOut;
 input clk, reset, ldPC;
 input [1:0] selPC;
 output [15:0] PCOut;
 PC(Buss, clk, reset, ldPC, eabOut, selPC, PCOut);
endmodule
*/

/*
module MARunitcaller(in, data, alcr, clk, highlow, out);
 input [15:0] in, data;
 input highlow, aclr, clk;
 output [15:0] out;

 MARunit(in, data, alcr, clk, highlow, out);
endmodule
*/
module EABcaller(selEAB1, selEAB2, PC, Ra, IR, eabOut);
 input [1:0] selEAB2;
 input selEAB1;
 input [15:0] PC;
 input [15:0] Ra;
 input [10:0] IR;
 output [15:0] eabOut;

 EAB(selEAB1, selEAB2, PC, Ra, IR, eabOut);
endmodule
module myMARMuxcaller(myIR, eabOut, selMAR, MarMuxOut);
 input [7:0] myIR;
 input [15:0] eabOut;
 input selMAR;
 output [15:0] MarMuxOut;

 myMARMux(myIR, eabOut, selMAR, MarMuxOut);
endmodule
module alucaller(Ra, Rb, IR, aluControl, aluOut);
 input [15:0] Ra;
 input [15:0] Rb;
 input [15:0] IR;
 input [1:0] aluControl;
 output wire [15:0] aluOut;

 alu(Ra, Rb, IR[5:0], aluControl, aluOut);
endmodule
module IRcaller(Buss, clk, reset, IdIR, IRa);
 input [15:0] Buss;
 input clk, reset, IdIR;
 output [15:0] IRa;

 IR(Buss, clk, reset, IdIR, IRa);

endmodule
