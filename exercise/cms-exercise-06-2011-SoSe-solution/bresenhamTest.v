`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:25:30 07/08/2011
// Design Name:   bresenham
// Module Name:   E:/Xilinx ISE/workspace/klausurpipeline/bresenhamTest.v
// Project Name:  klausurpipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bresenham
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bresenhamTest;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] x_0;
	reg [7:0] y_0;
	reg [7:0] x_1;
	reg [7:0] y_1;
	reg input_valid;

	// Outputs
	wire [7:0] x_out;
	wire [7:0] y_out;
	wire output_valid;
	wire ready_for_data;

	// Instantiate the Unit Under Test (UUT)
	bresenham uut (
		.clk(clk), 
		.reset(reset), 
		.x_0(x_0), 
		.y_0(y_0), 
		.x_1(x_1), 
		.y_1(y_1), 
		.input_valid(input_valid), 
		.x_out(x_out), 
		.y_out(y_out), 
		.output_valid(output_valid), 
		.ready_for_data(ready_for_data)
	);

	always begin #50; clk = ~ clk; end

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		x_0 = 0;
		y_0 = 0;
		x_1 = 0;
		y_1 = 0;
		input_valid = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		reset = 1;
		
		#60;
		reset = 0;
		
		
		
		#100;
//		x_0 = 0;			
//		x_1 = 5;
//		y_0 = 0;
//		y_1 = 5;

//		x_0 = 0;			
//		x_1 = 5;
//		y_0 = 0;
//		y_1 = 3;
		
		x_0 = 2;
		x_1 = 9;
		y_0 = 3;
		y_1 = 9;

		
		#60;
		input_valid = 1;
		
		#60;
		input_valid = 0;
		
        
		// Add stimulus here

	end
      
endmodule

