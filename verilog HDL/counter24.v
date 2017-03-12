`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:14:05 03/08/2013 
// Design Name: 
// Module Name:    counter24 
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
module counter24(
	input CP,nCR,EN,
	output reg [3:0] CntH,CntL
	);
	always@(posedge CP,negedge nCR)
	begin
		if(~nCR)
			{CntH,CntL} <= 8'h00;
		else
			if(~EN)
				{CntH,CntL} <= {CntH,CntL};
			else
				if((CntH>2)||(CntL>9)||((CntH==2)&&(CntL>3)))
					{CntH,CntL}<=8'h00;
				else
					if((CntH==2)&&(CntL<3))
						begin
						CntH <= CntH;
						CntL <= CntL+1'b1;
						end
					else
						if(CntL==9)
							begin
							CntH<=CntH+1'b1;
							CntL<=4'b0000;
							end
						else
							begin
							CntH <= CntH;
							CntL <= CntL+1'b1;
							end
	end
endmodule
