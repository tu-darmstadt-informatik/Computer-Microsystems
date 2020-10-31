`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:05:28 05/03/2011
// Design Name:   multiply
// Module Name:   E:/Xilinx ISE/workspace/u1/multiplyTest.v
// Project Name:  u1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiply
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module multiplyTest;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [5:0] out;

	// Instantiate the Unit Under Test (UUT)
	multiply uut (
		.a(a), 
		.b(b), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		a = 4'b0000;
		b = 4'b0000;
		
		
		#100;
		
		a = 4'b0010;
		b = 4'b0001;
		
		
		#100;
		
		a = 4'b0100;
		b = 4'b0010;
		
		
		
		#100;
		
		a = 4'b0000;
		b = 4'b0000;
        
		// Add stimulus here

	end
      
endmodule

