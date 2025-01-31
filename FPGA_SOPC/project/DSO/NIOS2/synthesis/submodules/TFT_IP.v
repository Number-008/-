module TFT_IP(
				//系统时钟
					csi_clk,  
					csi_reset_n,     
				// Avalon-MM Slave
					avs_chipselect_n,	
					avs_address,  
					avs_write_n,  
					avs_writedata,  
					avs_read_n,		
					avs_readdata,      
				//LCD接口
					coe_LCD_LED,
					LCD_RST,
					LCD_CS,		
					LCD_RD,   
					LCD_WR,
					LCD_RS,		
					LCD_DB
				 );

input 				csi_clk;
input					csi_reset_n;	 
input		[1:0]   	avs_address; 
input            	avs_write_n;
input         		avs_chipselect_n;
input             avs_read_n;
input  	[ 15: 0] avs_writedata;
output 	[ 15: 0] avs_readdata;

output				coe_LCD_LED;
output				LCD_RST;
output				LCD_CS;		
output				LCD_RD;   
output				LCD_WR;
output				LCD_RS;	
inout		[15:0]	LCD_DB;				 

reg					coe_LCD_LED;
wire					LCD_RST;
wire					LCD_CS;		
wire					LCD_RD;   
wire					LCD_WR;
wire					LCD_RS;
wire		[15:0]	LCD_DB;
wire		[15:0] avs_readdata;			 

always@(posedge csi_clk, negedge csi_reset_n)  
begin  
	if (!csi_reset_n)
		coe_LCD_LED	  	<= 1'b1;
		else if (!(avs_chipselect_n | avs_write_n)) 
			case (avs_address)  
				2'b00: 	coe_LCD_LED <= avs_writedata[0];  
			 default:;
			endcase			
end

			 
assign LCD_RST 	= csi_reset_n;	
assign LCD_CS 		= avs_chipselect_n;
assign LCD_RD		= avs_read_n;
assign LCD_WR		= avs_write_n;
assign LCD_RS    	= avs_address[0];//H--数据，L--指令
assign LCD_DB		= (~avs_chipselect_n & avs_address[1])? avs_writedata :16'bz;
assign avs_readdata  = LCD_DB;
//地址A1A0:10--写指令，11写数据，00控制背光灯;读时：A0=1读数据，A0=0读寄存器
endmodule 

