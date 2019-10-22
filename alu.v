module alu(Ra, Rb, IR, aluControl, aluOut);
 input [15:0] Rb, Ra;
 input [5:0] IR;
 input [1:0] aluControl;
 output wire [15:0] aluOut;

 //IRlong will be the sign extended version of IR
 wire [15:0] IRlong;
 wire [15:0] pass;

 fiveto16signextend(IR[4:0], IRlong);
 SR2Mux(Rb, IRlong, IR[5], pass);

 assign aluOut = (aluControl==0)? Ra: (aluControl==1)? (Ra+pass): (aluControl==2)? (Ra & pass): ~Ra;

endmodule
//simple implementatin of sign extention using built in functions
module fiveto16signextend(input signed [4:0] IRshort, output signed [15:0] IRlong);

 assign IRlong = IRshort;

endmodule
module SR2Mux(SR2, IRlong, IR5, pass);
 input [15:0] IRlong;
 input [15:0] SR2;
 input IR5;
 output wire [15:0] pass;

 assign pass = (IR5==1)? IRlong: SR2;
endmodule
