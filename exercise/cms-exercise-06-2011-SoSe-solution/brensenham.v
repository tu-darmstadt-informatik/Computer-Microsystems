`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:29:00 07/08/2011 
// Design Name: 
// Module Name:    brensenham 
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
module bresenham(
	input wire clk ,
	input wire reset ,
	input wire [7:0] x_0 , 		// Koordinaten des St a r tpunkt e s
	input wire [7:0] y_0 ,
	input wire [7:0] x_1 , 		// Koordinaten des Endpunktes
	input wire [7:0] y_1 ,
	input wire input_valid , 	//=1: Es l i e g en g ü l t i g e Eingabedaten an
	output wire [7:0] x_out , 	// Koordinaten des a k tue l l en Bi ldpunktes
	output wire [7:0] y_out ,
	output wire output_valid, 	//=1: a k t u e l l e r Bi ldpunkt g ü l t i g
	output wire ready_for_data //=1: Modul i s t b e r e i t , neue Eingabedaten anzunehmen
	);


//kombinatorische logik
wire signed [7:0] dx;
wire signed [7:0] sx;
wire signed [7:0] dy;
wire signed [7:0] sy;
wire signed [7:0] err;


assign dx 	= (x_1 >= x_0) ? (x_1 - x_0) : -(x_1 - x_0);
assign sx 	= (x_0 < x_1) ? 1 : -1;
assign dy 	= (y_1 >= y_0) ? -(y_1 - y_0) : (y_1 - y_0);
assign sy 	= (y_0 < y_1) ? 1 : -1;
assign err 	= dx + dy;

reg signed [7:0] dxReg;
reg signed [7:0] sxReg;
reg signed [7:0] dyReg;
reg signed [7:0] syReg;
reg signed [7:0] errReg;

reg signed[7:0] x0Reg;
reg signed[7:0] y0Reg;
reg signed[7:0] x1Reg;
reg signed[7:0] y1Reg;



reg signed[7:0] e2;

reg input_validReg; 
reg output_validReg;
reg ready_for_dataReg;
reg signed [7:0] x_outReg;
reg signed [7:0] y_outReg;

assign output_valid = output_validReg;
assign ready_for_data = ready_for_dataReg;
assign x_out = x_outReg;
//assign x_out = errReg;
assign y_out = y_outReg;



always@(posedge clk)
begin
	if(reset)
	begin
		output_validReg <= 0;
		ready_for_dataReg <= 1;
		x_outReg <= 0;
		y_outReg <= 0;
	end
	else if(input_valid) //übernehme daten
	begin
		input_validReg <= 1;
		ready_for_dataReg <= 0;
		dxReg <= dx;
		sxReg <= sx;
		dyReg <= dy;
		syReg <= sy;
		errReg <= err;
		x0Reg <= x_0;
		y0Reg <= y_0;
		x1Reg <= x_1;
		y1Reg <= y_1;
	end else				
	begin
		
		if(input_validReg)
		//set pixel
		begin
			x_outReg <= x0Reg;
			y_outReg <= y0Reg;
			output_validReg <= 1;
	
	
			if((x0Reg == x1Reg) && (y0Reg == y1Reg))	
				begin
					//abbruch
					ready_for_dataReg <= 1;
				end
			else
				begin
					e2 = errReg;
					e2 = e2 << 1; //e2 = 2*err
					
					if(e2 >= dyReg && e2 > dxReg)		// e2 >= dy ?
					begin
						errReg <= errReg + dyReg;
						x0Reg <= x0Reg + sxReg;
					end
					else
					if (e2 <= dxReg && e2 < dyReg)	//e2 <= dx ?
					begin
						errReg <= errReg + dxReg;
						y0Reg <= y0Reg + syReg;
					end
					else
					begin
						errReg <= errReg + dyReg + dxReg;
						x0Reg <= x0Reg + sxReg;
						y0Reg <= y0Reg + syReg;

					end
				end
		end
	
		
	end
	


end











endmodule
