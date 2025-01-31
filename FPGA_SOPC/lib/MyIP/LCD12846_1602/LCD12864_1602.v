module LCD12864_1602(   
 // Clcok Input  

   input         csi_clk,  
   input         csi_reset_n,  
   // Avalon-MM Slave  
   input         avs_chipselect,  
   input [1:0]   avs_address,  
   input         avs_write,  
   input [31:0]  avs_writedata,  
   input         avs_read,  
   output [31:0] avs_readdata,    
   // Conduit End   
   // lcd12864 interface  
   output reg    coe_e,  
   output reg    coe_rw,   
   output reg    coe_rs,  
   inout [7:0]   coe_data_io  

 );  

//++++++++++++++++++++++++++++++++++++++  

 // 写 开始  

 //++++++++++++++++++++++++++++++++++++++  

 reg  [7:0] coe_data_o; 
 //reg CLK_LCD; //LCD时钟信号 
 //reg [23:0]cnt; 

//assign PSB = 1; 
//assign RST_LCD = 1; 

// CLK频率为100MHz, 产生LCD时钟信号, 10Hz 
/*always @(posedge csi_clk or negedge csi_reset_n) 
begin 
    if (!csi_reset_n) 
    begin 
cnt <= 24'b0; 
CLK_LCD <= 0; 
    end 
    else if(cnt == 9999999) 
    begin 
cnt <= 0; 
CLK_LCD <= ~CLK_LCD; 
    end 
    else 
cnt <= cnt +1'b1; 
end */

 always@(posedge csi_clk, negedge csi_reset_n)  
 begin  
  if (!csi_reset_n)  
   begin   
    coe_e      <= 1'b0;  
    coe_rw     <= 1'b0;  
    coe_rs     <= 1'b0;  
    coe_data_o <= 8'b0;  
   end  
  else if (avs_chipselect & avs_write)  
  begin  
     case (avs_address)  
          0: coe_e      <= avs_writedata[0];  
          1: coe_rw     <= avs_writedata[0];  
          2: coe_rs     <= avs_writedata[0];  
          3: coe_data_o <= avs_writedata[7:0];  
     endcase  
  end  
end  

 //--------------------------------------  

// 写 结束  

 //--------------------------------------  

 //++++++++++++++++++++++++++++++++++++++  

 // 读 开始  

 //++++++++++++++++++++++++++++++++++++++  

 reg  [7:0] readdata_r;  
 wire [7:0] coe_data_i;  
 always@(posedge csi_clk)  
if (avs_chipselect & avs_read)  
begin  
    if (avs_address == 3)  
      readdata_r  <= coe_data_i;  
     else  
      readdata_r  <= 8'b0;  
   end  
   else 
     readdata_r <= 8'b0;  
assign avs_readdata = {24'b0, readdata_r};   

 //--------------------------------------  

// 读 结束  

 //--------------------------------------  

 //++++++++++++++++++++++++++++++++++++++  

 // 双向口 开始  

 //++++++++++++++++++++++++++++++++++++++  

reg coe_data_o_en;  
always@(posedge csi_clk)  
   if (avs_chipselect & avs_write)  
     coe_data_o_en <= 1'b0;  
   else if (avs_chipselect & avs_read)  
     coe_data_o_en <= 1'b1;  
assign coe_data_i   = coe_data_io;  
assign coe_data_io  = coe_data_o_en ? 8'bz : coe_data_o;  

 //--------------------------------------  

 // 双向口 结束  

//--------------------------------------  
endmodule 

