`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:14:50 03/08/2013 
// Design Name: 
// Module Name:    display 
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
module display(
    input CLK_50M,
	 input [7:0] Hour,Minute,
	 output reg[3:0] duan_ctr,
    output [3:0] wei_ctrl
    );
	 
	reg clk_400HZ;
	reg [3:0]wei_ctr=4'b1110;
	integer clk_cnt;
	
	always @(posedge CLK_50M)
		if(clk_cnt==32'd100000)
		begin
			clk_cnt<=1'b0;
			clk_400HZ<=~clk_400HZ;
		end
		else
		clk_cnt<=clk_cnt+1'b1;
	
	always@(posedge clk_400HZ)
		wei_ctr={wei_ctr[2:0],wei_ctr[3]};	
		
	always@(wei_ctr)
		case(wei_ctr)
			4'b1110:duan_ctr=Minute[3:0];
			4'b1101:duan_ctr=Minute[7:4];
			4'b1011:duan_ctr=Hour[3:0];
			4'b0111:duan_ctr=Hour[7:4];
		endcase
	assign wei_ctrl=wei_ctr;
endmodule
/*
	parameter N=25;
	parameter CLK_Freq=50000000;
	parameter Out_Freq=250;
	
	reg[N-1:0] Count_DIV;
	always@(posedge CLK_50M)
	begin
			if(Count_DIV<(CLK_Freq/(2*Out_Freq)-1))
				Count_DIV<=Count_DIV+1'b1;
			else
			begin
				Count_DIV<=0;
				cp<=~cp;
			end
	end
	always@(posedge cp)
		wei_ctr<={wei_ctr[2:0],wei_ctr[3]};
	assign weima=wei_ctr;
	*/