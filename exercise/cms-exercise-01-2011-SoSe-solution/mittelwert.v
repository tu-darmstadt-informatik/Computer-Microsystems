`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:21:18 05/03/2011 
// Design Name: 
// Module Name:    mittelwert 
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
module mittelwert(
	input signed [15:0] A, B, C, D,
	output wire[15:0] out  
    );
	 
	 reg[17:0] reg1;				
	 assign out = reg1[17:2];	//lege wire an register an

	 always@(*)
	 reg1 <= A + B + C + D;
	 


endmodule
