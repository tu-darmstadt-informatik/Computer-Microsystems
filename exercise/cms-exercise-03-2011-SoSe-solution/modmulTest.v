`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:02:22 05/24/2011
// Design Name:   modmul
// Module Name:   E:/Xilinx ISE/workspace/u1/modmulTest.v
// Project Name:  u1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: modmul
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module modmulTest;

	// Inputs
	reg clk;
	reg reset;
	reg [11:0] polynom;
	reg [10:0] datain_a;
	reg [10:0] datain_b;
	reg enable;

	// Outputs
	wire [10:0] dataout;
	wire valid;

	// Instantiate the Unit Under Test (UUT)
	modmul uut (
		.clk(clk), 
		.reset(reset), 
		.polynom(polynom), 
		.datain_a(datain_a), 
		.datain_b(datain_b), 
		.enable(enable), 
		.dataout(dataout), 
		.valid(valid)
	);
	
	
	always
		begin
			clk = 1; #5; clk = 0; #5;
		end

	initial begin
		// Initialize Inputs
		reset = 0;
		polynom = 0;
		datain_a = 0;
		datain_b = 0;
		enable = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
		
		#100;
		reset = 0;
		
		#100;
		datain_a = 11'b10000101001;
		datain_b = 11'b00000001001;
		polynom 	= 12'b100000000101;
		
		#100;
		enable = 1;
		
		
        
		// Add stimulus here

	end
      
endmodule

