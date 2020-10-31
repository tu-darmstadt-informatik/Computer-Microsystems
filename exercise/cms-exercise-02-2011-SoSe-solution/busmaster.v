`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:47:37 05/19/2011 
// Design Name: 
// Module Name:    busmaster 
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
module busmaster(
	input wire			clk,
	input wire			reset,
	input wire			request,
	input wire[31:0]	datain,
   input wire[3:0]	id,
	output wire			grant
	 );
	 
	
	reg grantReg;
	assign	grant = grantReg;
		
	 

always@(reset)
	begin
		grantReg <= 0;
	end

always@(posedge clk)
	begin
	if(request == 1)
		begin
			grantReg <= 1;
		end else
			grantReg <= 0;
	end

endmodule




module device #(
	parameter device_id = 0
)(
	input wire			clk,
	input wire 			reset,
	input wire 			grant,
	output wire [31:0] dataout,
	output wire [3:0] id,
	output wire 		next_grant,
	output wire 		request
);

	reg requestReg;
	reg next_grantReg;
	reg [31:0] dataoutReg;
	reg [3:0] idReg;
	
	assign request = requestReg;
	assign next_grant = next_grantReg;
	assign dataout = dataoutReg;
	assign id = idReg;
	
initial begin
	requestReg <= 1'bz;
end

always@(posedge reset)
	begin
			requestReg <= 1;
			next_grantReg <= 0;
	end
	
always@(posedge clk)
	begin
		if(grant == 1 && requestReg == 1)
			begin
				dataoutReg <= device_id; //testausgabe
				next_grantReg <= 0;
				idReg <= device_id;
				requestReg <= 1'bz;
			end
		else
			begin
				next_grantReg <= grant;
				dataoutReg <= 32'bz;
				idReg <= 4'bz;
			end
		
			
	end



endmodule
