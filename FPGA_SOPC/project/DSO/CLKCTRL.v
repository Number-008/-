// megafunction wizard: %ALTCLKCTRL%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altclkctrl 

// ============================================================
// File Name: CLKCTRL.v
// Megafunction Name(s):
// 			altclkctrl
//
// Simulation Library Files(s):
// 			cycloneii
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 13.0.0 Build 156 04/24/2013 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2013 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


//altclkctrl CBX_AUTO_BLACKBOX="ALL" CLOCK_TYPE="Global Clock" DEVICE_FAMILY="Cyclone II" USE_GLITCH_FREE_SWITCH_OVER_IMPLEMENTATION="OFF" clkselect ena inclk outclk
//VERSION_BEGIN 13.0 cbx_altclkbuf 2013:04:24:18:08:47:SJ cbx_cycloneii 2013:04:24:18:08:47:SJ cbx_lpm_add_sub 2013:04:24:18:08:47:SJ cbx_lpm_compare 2013:04:24:18:08:47:SJ cbx_lpm_decode 2013:04:24:18:08:47:SJ cbx_lpm_mux 2013:04:24:18:08:47:SJ cbx_mgl 2013:04:24:18:11:10:SJ cbx_stratix 2013:04:24:18:08:47:SJ cbx_stratixii 2013:04:24:18:08:47:SJ cbx_stratixiii 2013:04:24:18:08:47:SJ cbx_stratixv 2013:04:24:18:08:47:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = clkctrl 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  CLKCTRL_altclkctrl_6df
	( 
	clkselect,
	ena,
	inclk,
	outclk) ;
	input   [1:0]  clkselect;
	input   ena;
	input   [3:0]  inclk;
	output   outclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [1:0]  clkselect;
	tri1   ena;
	tri0   [3:0]  inclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_clkctrl1_outclk;
	wire  [1:0]  clkselect_wire;
	wire  [3:0]  inclk_wire;

	cycloneii_clkctrl   clkctrl1
	( 
	.clkselect(clkselect_wire),
	.ena(ena),
	.inclk(inclk_wire),
	.outclk(wire_clkctrl1_outclk)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		clkctrl1.clock_type = "Global Clock",
		clkctrl1.ena_register_mode = "falling edge",
		clkctrl1.lpm_type = "cycloneii_clkctrl";
	assign
		clkselect_wire = {clkselect},
		inclk_wire = {inclk},
		outclk = wire_clkctrl1_outclk;
endmodule //CLKCTRL_altclkctrl_6df
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module CLKCTRL (
	clkselect,
	inclk0x,
	inclk1x,
	outclk);

	input	  clkselect;
	input	  inclk0x;
	input	  inclk1x;
	output	  outclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  clkselect;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  sub_wire0;
	wire [0:0] sub_wire3 = 1'h0;
	wire  sub_wire4 = 1'h1;
	wire [1:0] sub_wire8 = 2'h0;
	wire  sub_wire7 = inclk1x;
	wire  outclk = sub_wire0;
	wire  sub_wire1 = clkselect;
	wire [1:0] sub_wire2 = {sub_wire3, sub_wire1};
	wire  sub_wire5 = inclk0x;
	wire [3:0] sub_wire6 = {sub_wire8, sub_wire7, sub_wire5};

	CLKCTRL_altclkctrl_6df	CLKCTRL_altclkctrl_6df_component (
				.clkselect (sub_wire2),
				.ena (sub_wire4),
				.inclk (sub_wire6),
				.outclk (sub_wire0));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: clock_inputs NUMERIC "2"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: CONSTANT: USE_GLITCH_FREE_SWITCH_OVER_IMPLEMENTATION STRING "OFF"
// Retrieval info: CONSTANT: clock_type STRING "Global Clock"
// Retrieval info: USED_PORT: clkselect 0 0 0 0 INPUT GND "clkselect"
// Retrieval info: USED_PORT: inclk0x 0 0 0 0 INPUT NODEFVAL "inclk0x"
// Retrieval info: USED_PORT: inclk1x 0 0 0 0 INPUT NODEFVAL "inclk1x"
// Retrieval info: USED_PORT: outclk 0 0 0 0 OUTPUT NODEFVAL "outclk"
// Retrieval info: CONNECT: @clkselect 0 0 1 1 GND 0 0 0 0
// Retrieval info: CONNECT: @clkselect 0 0 1 0 clkselect 0 0 0 0
// Retrieval info: CONNECT: @ena 0 0 0 0 VCC 0 0 0 0
// Retrieval info: CONNECT: @inclk 0 0 2 2 GND 0 0 2 0
// Retrieval info: CONNECT: @inclk 0 0 1 0 inclk0x 0 0 0 0
// Retrieval info: CONNECT: @inclk 0 0 1 1 inclk1x 0 0 0 0
// Retrieval info: CONNECT: outclk 0 0 0 0 @outclk 0 0 0 0
// Retrieval info: GEN_FILE: TYPE_NORMAL CLKCTRL.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL CLKCTRL.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL CLKCTRL.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL CLKCTRL.bsf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL CLKCTRL_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL CLKCTRL_bb.v TRUE
// Retrieval info: LIB_FILE: cycloneii
