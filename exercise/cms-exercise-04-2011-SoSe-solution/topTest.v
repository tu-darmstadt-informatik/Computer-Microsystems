`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:17:38 06/17/2011
// Design Name:   top
// Module Name:   E:/Xilinx ISE/workspace/klausurpipeline/topTest.v
// Project Name:  klausurpipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module topTest;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] A;
	reg [31:0] B;
	reg [31:0] C;
	reg input_valid;

	// Outputs
	wire [31:0] result;
	wire result_ready;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.reset(reset), 
		.A(A), 
		.B(B), 
		.C(C), 
		.input_valid(input_valid), 
		.result(result), 
		.result_ready(result_ready)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		A = 0;
		B = 0;
		C = 0;
		input_valid = 0;

		// Wait 100 ns for global reset to finish
		#50;
      
		reset = 1;
		
		#50;
		
		reset = 0;
		
		#50;
		input_valid = 1;
		A = 1;				//erwartetes Ergebnis: 38
		B = 1;
		C = 1;
		
		#15;
		input_valid = 0;
		
		
		
		#100;
		input_valid = 1;
		A = 1;				//erwartetes Ergebnis: 49
		B = 2;
		C = 3;
		
		#15;
		input_valid = 0;
		
		
		#100;
		input_valid = 1;
		A = 3;				//erwartetes Ergebnis: 103
		B = 2;
		C = 1;
		
		#15;
		input_valid = 0;
		
		
		#100;
		
		
		
		

	end
	
	always #10 clk = ~clk;
	
	
      
endmodule

