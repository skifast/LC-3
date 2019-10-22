module MARMux2(myIR, eabOut, selMAR, MarMuxOut);
 input [7:0] myIR;
 input [15:0] eabOut;
 input selMAR;
 output [15:0] MarMuxOut;

 wire [15:0] zeroextended;

 eightto16signextend(myIR, zeroextended);
 mux(eabOut, zeroextended, selMAR, MarMuxOut);

 //assign MarMuxOut = eabOut;
endmodule
module eightto16signextend(input signed [7:0] IRshort, output signed [15:0] IRlong);

 assign IRlong = IRshort;

endmodule
module mux(eabOut, signexin, selMAR, muxout);
 input [15:0] eabOut;
 input [15:0] signexin;
 input selMAR;
 output [15:0] muxout;

 assign muxout = (selMAR == 1)? signexin: eabOut;
endmodule
