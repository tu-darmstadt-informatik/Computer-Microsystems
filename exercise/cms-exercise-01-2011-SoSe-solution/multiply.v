`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:27 05/03/2011 
// Design Name: 
// Module Name:    multiply 
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
module multiply(
	input [3:0] a,
	input [3:0] b,
	output wire [5:0] out
    );

	reg [5:0] reg1;
	assign out = reg1;
	
	always@(*)
	reg1 <= a * b;		//nicht zulässig
	

endmodule
