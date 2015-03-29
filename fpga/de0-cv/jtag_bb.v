// megafunction wizard: %Virtual JTAG%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: sld_virtual_jtag 

// ============================================================
// File Name: jtag.v
// Megafunction Name(s):
// 			sld_virtual_jtag
//
// Simulation Library Files(s):
// 			
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 14.1.0 Build 186 12/03/2014 SJ Web Edition
// ************************************************************

//Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, the Altera Quartus II License Agreement,
//the Altera MegaCore Function License Agreement, or other 
//applicable license agreement, including, without limitation, 
//that your use is for the sole purpose of programming logic 
//devices manufactured by Altera and sold by Altera or its 
//authorized distributors.  Please refer to the applicable 
//agreement for further details.

module jtag (
	ir_out,
	tdo,
	ir_in,
	tck,
	tdi,
	virtual_state_cdr,
	virtual_state_cir,
	virtual_state_e1dr,
	virtual_state_e2dr,
	virtual_state_pdr,
	virtual_state_sdr,
	virtual_state_udr,
	virtual_state_uir);

	input	[3:0]  ir_out;
	input	  tdo;
	output	[3:0]  ir_in;
	output	  tck;
	output	  tdi;
	output	  virtual_state_cdr;
	output	  virtual_state_cir;
	output	  virtual_state_e1dr;
	output	  virtual_state_e2dr;
	output	  virtual_state_pdr;
	output	  virtual_state_sdr;
	output	  virtual_state_udr;
	output	  virtual_state_uir;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: PRIVATE: show_jtag_state STRING "0"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: SLD_AUTO_INSTANCE_INDEX STRING "YES"
// Retrieval info: CONSTANT: SLD_INSTANCE_INDEX NUMERIC "0"
// Retrieval info: CONSTANT: SLD_IR_WIDTH NUMERIC "4"
// Retrieval info: CONSTANT: SLD_SIM_ACTION STRING ""
// Retrieval info: CONSTANT: SLD_SIM_N_SCAN NUMERIC "0"
// Retrieval info: CONSTANT: SLD_SIM_TOTAL_LENGTH NUMERIC "0"
// Retrieval info: USED_PORT: ir_in 0 0 4 0 OUTPUT NODEFVAL "ir_in[3..0]"
// Retrieval info: USED_PORT: ir_out 0 0 4 0 INPUT NODEFVAL "ir_out[3..0]"
// Retrieval info: USED_PORT: tck 0 0 0 0 OUTPUT NODEFVAL "tck"
// Retrieval info: USED_PORT: tdi 0 0 0 0 OUTPUT NODEFVAL "tdi"
// Retrieval info: USED_PORT: tdo 0 0 0 0 INPUT NODEFVAL "tdo"
// Retrieval info: USED_PORT: virtual_state_cdr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_cdr"
// Retrieval info: USED_PORT: virtual_state_cir 0 0 0 0 OUTPUT NODEFVAL "virtual_state_cir"
// Retrieval info: USED_PORT: virtual_state_e1dr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_e1dr"
// Retrieval info: USED_PORT: virtual_state_e2dr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_e2dr"
// Retrieval info: USED_PORT: virtual_state_pdr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_pdr"
// Retrieval info: USED_PORT: virtual_state_sdr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_sdr"
// Retrieval info: USED_PORT: virtual_state_udr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_udr"
// Retrieval info: USED_PORT: virtual_state_uir 0 0 0 0 OUTPUT NODEFVAL "virtual_state_uir"
// Retrieval info: CONNECT: @ir_out 0 0 4 0 ir_out 0 0 4 0
// Retrieval info: CONNECT: @tdo 0 0 0 0 tdo 0 0 0 0
// Retrieval info: CONNECT: ir_in 0 0 4 0 @ir_in 0 0 4 0
// Retrieval info: CONNECT: tck 0 0 0 0 @tck 0 0 0 0
// Retrieval info: CONNECT: tdi 0 0 0 0 @tdi 0 0 0 0
// Retrieval info: CONNECT: virtual_state_cdr 0 0 0 0 @virtual_state_cdr 0 0 0 0
// Retrieval info: CONNECT: virtual_state_cir 0 0 0 0 @virtual_state_cir 0 0 0 0
// Retrieval info: CONNECT: virtual_state_e1dr 0 0 0 0 @virtual_state_e1dr 0 0 0 0
// Retrieval info: CONNECT: virtual_state_e2dr 0 0 0 0 @virtual_state_e2dr 0 0 0 0
// Retrieval info: CONNECT: virtual_state_pdr 0 0 0 0 @virtual_state_pdr 0 0 0 0
// Retrieval info: CONNECT: virtual_state_sdr 0 0 0 0 @virtual_state_sdr 0 0 0 0
// Retrieval info: CONNECT: virtual_state_udr 0 0 0 0 @virtual_state_udr 0 0 0 0
// Retrieval info: CONNECT: virtual_state_uir 0 0 0 0 @virtual_state_uir 0 0 0 0
// Retrieval info: GEN_FILE: TYPE_NORMAL jtag.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL jtag.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL jtag.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL jtag.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL jtag_inst.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL jtag_bb.v TRUE
