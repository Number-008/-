/***************************************************************
  Filename    : Phase_Measure_IP.v
  Created on: : 2013/08/24 
  Athor       : Qin Hai Cheng
  Function    : 周期、相位差测量IP核
***************************************************************/
module Phase_Measure_IP(
						input	csi_clk,
						input	csi_reset_n,
						input	avs_chipselect,
						input avs_address,
						input	avs_read, 
						output [31:0]avs_readdata,
						input clk, 
						input coe_S_in1, 
						input coe_S_in2
);

reg Flag,clr;
reg [31:0] cnt,Cycle_R1,Cycle_R2;

always @(posedge coe_S_in1,negedge csi_reset_n)
begin
	if(csi_reset_n==0)
		Flag<=0;
		else
			Flag<=~Flag;
end

always @(posedge clk,negedge Flag)
begin
	if(Flag ==0) clr<=1'b0;	
		else clr<=1'b1;						
end
	
always @(posedge clk,negedge csi_reset_n)
begin
	if(csi_reset_n==0)
		cnt<=0;
		else if(clr==0)
			cnt<=0;
			else if(Flag==1)
				cnt<=cnt+1;
end

always @(negedge Flag)
	Cycle_R2<=cnt;

always @(posedge coe_S_in2)
	if(Flag & coe_S_in2==1)
	Cycle_R1<=cnt;
	
assign avs_readdata = (avs_chipselect & avs_read) ? (avs_address==0 ? Cycle_R1 : Cycle_R2):32'b0; 
endmodule
