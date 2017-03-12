`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:11:04 03/08/2013 
// Design Name: 
// Module Name:    counter10 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module counter10(
    input CP,
    input nCR,
    input EN,
    output reg[3:0] Q
    );

	always@(posedge CP,negedge nCR)
		if(~nCR) 
			Q<=4'b0000;
		else
			if(~EN)
				 Q<=Q;
			else 
				if(Q==4'b1001)	
					Q<=4'b0000;
				else
					Q<=Q+1'b1;

endmodule
