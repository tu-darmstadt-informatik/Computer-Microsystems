`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:24:00 06/01/2011 
// Design Name: 
// Module Name:    modmul_fix 
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
module modmul_fix(   
	 input 			wire clk,
    input 			wire reset,
    input 			wire[10:0] datain_a,
    input  			wire[10:0] datain_b,
    input 			wire enable,
    output 			wire[10:0]dataout,
    output 			wire valid
    );

	
	reg[3:0]		counter;
	reg[21:0] 	dataoutReg;
	reg[10:0]	datain_aReg;
	reg[21:0]	datain_bReg;
	reg[21:0]	polynomReg;
	reg			validReg;
	
	
	
	assign dataout = dataoutReg[10:0];
	assign valid = validReg;
	
	initial begin
		counter		<= 0;
		dataoutReg <= 0;
		validReg 	<= 0;
	end

	//reset
	always@(posedge reset)
	begin
		counter		<= 0;
		dataoutReg 	<= 0;
		validReg 	<= 0;
	end


	//clk
	always@(posedge clk)
	begin
		if(enable == 1 && counter == 0)
		begin
			datain_aReg = datain_a; 	
			datain_bReg = datain_b;		
			polynomReg	= 12'b100000000101; //polynom;
		end 
		
		//enable und counter < 12 (datain_a bzw datain_b -> 11bit)
		if(enable == 1 && counter < 4'b1100)
		begin
			
			//multiplikation aufgeteilt in additionen
			if(datain_aReg[0] == 1)
			begin
				dataoutReg <= dataoutReg ^ datain_bReg;	
			end			
			//nächster schritt
			datain_aReg <= datain_aReg >> 1;
			datain_bReg <= datain_bReg << 1;
		
			counter <= counter + 1;
		
		end
		
		//modulo rechnung
		if(counter == 4'b1100) //counter == 12
		begin
			if(dataoutReg > polynomReg)
			begin
				polynomReg <= polynomReg << 1;
			end else
			begin
				if( polynomReg >= dataoutReg)	polynomReg = polynomReg >> 1;
	
				counter = counter + 1;				
			end
		end
		
		if(counter == 4'b1101) //counter = 13
		begin
			dataoutReg = dataoutReg ^ polynomReg;
			validReg <= 1;
		end
	end





endmodule
