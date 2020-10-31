`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:14:16 06/12/2011 
// Design Name: 
// Module Name:    mult 
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
module mult(
	input	 wire 			clk, 		//Takt
	input	 wire 			reset , 	//synchroner Reset
	input	 wire [31:0] 	A,			//Eingang A
	input	 wire [31:0]	B, 		// " B
	output wire [31:0] 	result 	//Ergebnis
	);
	reg [31:0] r1, r2;
	always@(posedge clk) begin
		if(reset)begin
			r1 <= 0;
			r2 <= 0;
		end
		else begin
		r1 <= A * B;
		r2 <= r1;
		end
	end

	assign result = r2;


endmodule
