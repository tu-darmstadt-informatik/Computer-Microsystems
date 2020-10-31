`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:26:41 06/01/2011
// Design Name:   modmul_fix
// Module Name:   E:/Xilinx ISE/workspace/u1/modmul_fixTest.v
// Project Name:  u1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: modmul_fix
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module modmul_fixTest;

// Inputs
	reg clk;
	reg reset;
	reg [10:0] datain_a;
	reg [10:0] datain_b;
	reg enable;

	// Outputs
	wire [10:0] dataout;
	wire valid;

	// Instantiate the Unit Under Test (UUT)
	modmul_fix uut (
		.clk(clk), 
		.reset(reset),  
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
		
		#100;
		enable = 1;
		
		
        
		// Add stimulus here

	end
      
endmodule

