`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:12 03/08/2013 
// Design Name: 
// Module Name:    Divider50MHZ 
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
module Divider50MHZ(
    input CLK_50M,
    input nCLR,
    output reg CLK_1HZout
    );
	parameter N=25;
	parameter CLK_Freq=50000000;
	parameter Out_Freq=1;
	
	reg[N-1:0] Count_DIV;
	always@(posedge CLK_50M,negedge nCLR)
	begin
		if(!nCLR)
		begin
			CLK_1HZout<=0;
			Count_DIV<=0;
		end
		else
		begin
			if(Count_DIV<(CLK_Freq/(2*Out_Freq)-1))
				Count_DIV<=Count_DIV+1'b1;
			else
			begin
				Count_DIV<=0;
				CLK_1HZout<=~CLK_1HZout;
			end
		end
	end
endmodule
