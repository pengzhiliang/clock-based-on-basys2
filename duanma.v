`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:51:57 03/08/2013 
// Design Name: 
// Module Name:    duanma 
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
module duanma(
    input [3:0] duan_ctrl,
    output [7:0] duan_out
    );
	reg[7:0] duan_temp;
	 
	always@(duan_ctrl)
		case(duan_ctrl)
			4'h0:duan_temp=8'b1100_0000;//0
			4'h1:duan_temp=8'b1111_1001;//1
			4'h2:duan_temp=8'b1010_0100;//2
			4'h3:duan_temp=8'b1011_0000;//3
			4'h4:duan_temp=8'b1001_1001;//4
			4'h5:duan_temp=8'b1001_0010;//5
			4'h6:duan_temp=8'b1000_0010;//6
			4'h7:duan_temp=8'b1111_1000;//7
			4'h8:duan_temp=8'b1000_0000;//8
			4'h9:duan_temp=8'b1001_0000;//9
			default:	
				duan_temp=8'b1111_1111;//no
			endcase
	assign 		duan_out=duan_temp;
endmodule
