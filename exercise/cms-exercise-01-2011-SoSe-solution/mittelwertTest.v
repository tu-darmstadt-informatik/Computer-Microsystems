`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:49:11 05/03/2011
// Design Name:   mittelwert
// Module Name:   E:/Xilinx ISE/workspace/u1/mittelwertTest.v
// Project Name:  u1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mittelwert
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mittelwertTest;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [15:0] C;
	reg [15:0] D;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	mittelwert uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;
		D = 0; //erwartete Ausgabe = 0


		// Wait 100 ns for global reset to finish
		#100;
		//erster Test (Trivialfall): nur positive Eingaben
		A = 16'b0000_0000_0000_0010;	//   2
		B = 16'b0000_0000_0000_0010;	//   2
		C = 16'b0000_0000_0000_0010;	//   2
		D = 16'b0000_0000_0000_0010;	//   2	erwartete Ausgabe = 2
		
		#100;
		//zweiter Test: negative Eingaben. Ergebniss muss gerundet werden.
		A = 16'b1111_1111_1111_1100;	// - 4
		B = 16'b1111_1111_1111_1111;	// - 1
		C = 16'b0000_0000_0000_0001;	//   1
		D = 16'b1111_1111_1111_1111;	// - 1	erwartete Ausgabe = - 2
		
		#100;
		//dritter Test: negative Eingaben. Überlaufbehandlung
		A = 16'b1111_1111_1111_1111;	// - 1
		B = 16'b1111_1111_1111_1111;	// - 1
		C = 16'b1111_1111_1111_1111;	// - 1
		D = 16'b1111_1111_1111_1111;	// - 1	erwartete Ausgabe = - 1
	

		//weitere wichtige fälle?

	end
      
endmodule

