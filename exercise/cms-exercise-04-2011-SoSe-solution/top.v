`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:10:57 06/12/2011 
// Design Name: 
// Module Name:    top 
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
module top(
	input wire 			clk,			//clock
	input wire 			reset, 		//synchroner reset
	input wire [31:0]	A,				//Eingang A
	input wire [31:0] B,				// "		 B
	input wire [31:0] C,				// "		 C
	input wire 			input_valid,// =1: Es liegen gültige Daten an
	
	output wire [31:0] result,		//Ergebnis
	output wire 		 result_ready //=1: Das Ergebnis ist gültig
    );

	reg [31:0] c1, c2, c3, c3_1, c4, b1, b2, a1, a2, a3, a4, a5; //Pipeline-Register

	reg [6:0] countReg;

	wire[31:0] mult_wire;
	
	mult mulli(clk, 0, a3, 13, mult_wire);	 //Initialisierung von Multiplikationsmodul
	
	
	//Funktionnen:
	
	// * 2
	function [31:0] mul2;	//multipliziert input mit 2
		input [31:0]arg;
		begin
			mul2 = arg << 1; //shit um 1 nach links entspricht * 2
		end
	endfunction
	
	
	// + !! Braucht 1 Takt !!
	function [31:0] plus;	//addiert beide argumente
		input [31:0]arg1;
		input [31:0]arg2;
		begin
			plus = arg1 + arg2;// oder XOR !?!? 
		end
	endfunction
	
	
	// - !! Braucht 1 Takt !!
	function [31:0] minus;	//addiert beide argumente
		input [31:0]arg1;
		input [31:0]arg2;
		begin
			minus = arg1 - arg2;
		end
	endfunction

	
	//Pipeline
	always@(posedge clk) begin
		if(reset) begin //synchroner reset
			countReg <= 7'b0000000;
			c1 <= 0;
			c2 <= 0;
			c3 <= 0;
			c3_1 <= 0;
			c4 <= 0;
			b1 <= 0;
			b2 <= 0;
			a1 <= 0;
			a2 <= 0;
			a3 <= 0;
			a4 <= 0;
			a5 <= 0;
		end
		
		if(input_valid) begin //es liegen gültige Daten an, lade neue Werte ein
			countReg[0] <= 1;
			c1 <= C;
			b1 <= B;
			a1 <= A;
		end
		else begin
		countReg <= countReg << 1;
		c2 <= c1;				//schleife nur werte durch...
		c3 <= c2;				//schleife nur werte durch...
		c3_1 <= c3;				//schleife nur werte durch...
		c4 <= c3_1;				//schleife nur werte durch...
		b2 <= b1;				//schleife nur werte durch...
		a2 <= mul2(a1);		//a2 bekommt a1 * 2
		a3 <= plus(a2, b2);	//a3 bekommt a2 + b2
		a4 <= mult_wire;		//gebe multiplikation an a4 weiter																
		a5 <= minus(a4, c4);	//a5 bekommt a4 - c4
		end
	end
	
	
	assign result = a5;
	assign result_ready = countReg[6];


endmodule
