`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HUST
// Engineer: 
// 
// Create Date:    20:34:42 03/08/2013 
// Design Name: 	
// Module Name:    top 
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
module top(
    input CLK_50M,
    input nCR,EN,Adj_Min,Adj_Hour, 
    output [3:0] smg_wei,
    output [7:0] smg_duan,
    output Sec
    );
	supply1 Vdd;
	wire MinL_EN,MinH_EN,Hour_EN,CP;
	wire [7:0] Hour,Minute,Second;
	wire [3:0] duan_ctr,wei_ctr;
	wire[7:0] duan_temp;
	//1HZ
	Divider50MHZ U0(CLK_50M,nCR,CP);
	
	assign Sec = CP;
	//second
	counter10 U1(CP,nCR,EN,Second[3:0]); 	
	counter6  U2(CP,nCR,(Second[3:0]==4'h9),Second[7:4]);
	
	//adjust minute EN/ Adj_Min=1 adjust; Adj_Min=0,continue
	assign MinL_EN = Adj_Min?Vdd:(Second==8'h59);
	assign MinH_EN = (Adj_Min&&(Minute[3:0])==4'h9)||(Minute[3:0]==4'h9)&&(Second==8'h59);
	 
	//minute counter
	counter10 U3(CP,nCR,MinL_EN,Minute[3:0]);
	counter6  U4(CP,nCR,MinH_EN,Minute[7:4]);
	
	//adjust hour EN / Adj_Hour=1 adjust; Adj_Hour=0,continue
	assign Hour_EN=Adj_Hour?Vdd:((Minute==8'h59)&&(Second==8'h59));
	
	//hour counter
	counter24 U5(CP,nCR,Hour_EN,Hour[7:4],Hour[3:0]);
	
	//display
	display dis(CLK_50M,Hour,Minute,duan_ctr,wei_ctr);
	duanma yima(duan_ctr,duan_temp);
	
	assign smg_duan=duan_temp;
	assign smg_wei =wei_ctr;
	
endmodule

