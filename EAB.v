module EAB(selEAB1, selEAB2, PC, Ra, IR, eabOut);
 input selEAB1;
 input [1:0] selEAB2;
 input [10:0] IR;
 input [15:0] Ra, PC;
 output [15:0] eabOut;

 //outputs of the sign extend functions
 wire [15:0] IRlong6;
 wire [15:0] IRlong9;
 wire [15:0] IRlong11;

 //in between wires for the muxes
 wire [15:0] secondlevelmuxreg1;
 wire [15:0] secondlevelmuxreg2;

 //these are three different versions of the sign extend function modified
 //for different length inputs
 elevento16signextend(IR, IRlong11);
 nineto16signextend(IR[8:0], IRlong9);
 sixto16signextend(IR[5:0], IRlong6);

 //simple regs; the first two feed into the first;
 ADDR2mux(selEAB2, IRlong6, IRlong9, IRlong11, secondlevelmuxreg1);
 ADDR1mux(selEAB1, PC, Ra, secondlevelmuxreg2);
 ADDER(secondlevelmuxreg1, secondlevelmuxreg2, eabOut);
endmodule
module elevento16signextend(input signed [10:0] IRshort, output signed [15:0] IRlong);

 assign IRlong = IRshort;

endmodule
module nineto16signextend(input signed [8:0] IRshort, output signed [15:0] IRlong);

 assign IRlong = IRshort;

endmodule
module sixto16signextend(input signed [5:0] IRshort, output signed [15:0] IRlong);

 assign IRlong = IRshort;

endmodule
module ADDR2mux (selEAB2, in6, in9, in11, out);
 input [1:0] selEAB2;
 input [15:0] in6, in9, in11;
 output [15:0] out;

 //conditional statement
 assign out = (selEAB2==0)? 16'b0: (selEAB2==1)? in6: (selEAB2==2)? in9: in11;

endmodule
module ADDR1mux(selEAB1, PC, Ra, out);
 input selEAB1;
 input [15:0] PC, Ra;
 output [15:0] out;

 assign out = (selEAB1 == 1)? Ra: PC;
endmodule
module ADDER(in1, in2, out);
 input [15:0] in1, in2;
 output [15:0] out;

 assign out = in1 + in2;
endmodule
