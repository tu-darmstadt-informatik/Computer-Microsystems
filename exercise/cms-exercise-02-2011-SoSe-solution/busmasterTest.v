`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:44:32 05/20/2011
// Design Name:   busmaster
// Module Name:   E:/Xilinx ISE/workspace/u1/busmasterTest.v
// Project Name:  u1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: busmaster
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////



/*
Aufgabenteil b):
Die hinteren Devices können aushungern, da die vorderen Devices den Bus blockieren.
Um dies zu verhindern, könnte man für jedes Device ein Grant-Signal einführen, so dass
der Busmaster nach Prioritätsvergabe oder ähnlichem die Devices dem Bus zuteilen kann.
*/








module busmasterTest;

	// Inputs
	reg clk;
	reg resetBusmaster;
	reg resetDev0;
	reg resetDev1;
	reg resetDev2;
	reg resetDev3;

	// Outputs
	wire grant;
	wire next_grant_0_1;
	wire next_grant_1_2;
	wire next_grant_2_3;
	wire [31:0] data_device_to_busmaster;
	wire [3:0] id_device_to_busmaster;
	wire request_device_to_busmaster;
	


	// Instantiate the Unit Under Test (UUT)
	busmaster uut (
		.clk(clk), 
		.reset(resetBusmaster), 
		.request(request_device_to_busmaster), 
		.datain(data_device_to_busmaster), 
		.id(id_device_to_busmaster), 
		.grant(grant)
	);
	
	
	device #(0) device0(	.clk(clk),
								.reset(resetDev0),
								.grant(grant),
								.dataout(data_device_to_busmaster),
								.id(id_device_to_busmaster),
								.next_grant(next_grant_0_1),
								.request(request_device_to_busmaster));
	device #(1) device1(	.clk(clk),
								.reset(resetDev1),
								.grant(next_grant_0_1),
								.dataout(data_device_to_busmaster),
								.id(id_device_to_busmaster),
								.next_grant(next_grant_1_2),
								.request(request_device_to_busmaster));
	device #(2) device2(	.clk(clk),
								.reset(resetDev2),
								.grant(next_grant_1_2),
								.dataout(data_device_to_busmaster),
								.id(id_device_to_busmaster),
								.next_grant(next_grant_2_3),
								.request(request_device_to_busmaster));
	device #(3) device3(	.clk(clk),
								.reset(resetDev3),
								.grant(next_grant_2_3),
								.dataout(data_device_to_busmaster),
								.id(id_device_to_busmaster),
								.next_grant(),
								.request(request_device_to_busmaster));
	
	
	//generate clock
	always
		begin
			clk = 1; #5; clk = 0; #5;
		end
		
	
	
	
	
	
	initial begin
		// Initialize Inputs
		resetBusmaster = 0;
		resetDev0 = 0;
		resetDev1 = 0;
		resetDev2 = 0;
		resetDev3 = 0;


		// Wait 100 ns for global reset to finish
		#100;
      resetBusmaster = 1;
		
		#100;
		resetBusmaster = 0;
		
		#100;
		resetDev1 = 1;
		
		#100;
		resetDev1 = 0;
		
		#100;
		resetDev0 = 1;
		
		#100;
		resetDev0 = 0;
		
		#100;
		resetDev2 = 1;
		
		#100;
		resetDev2 = 0;
		
		#100;
		resetDev3 = 1;
		
		#100;
		resetDev3 = 0;
		
		
		
		
		
		
		// Add stimulus here

	end
	
	
      
endmodule

