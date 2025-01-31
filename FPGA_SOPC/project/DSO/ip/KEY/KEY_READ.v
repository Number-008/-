module KEY_READ(
             // clk inputs:
				  csi_clk,
				  csi_reset_n,
				 // Avalon-MM Slave  
              avs_chipselect,
//              avs_address,
				  avs_read, 
              avs_readdata,
             //KEY_IN interface:
				  coe_KEY_IN
           )
;
  parameter KEY_WIDTH = 4;
  
  output  [KEY_WIDTH-1: 0] avs_readdata;
  input            csi_clk;
  input            csi_reset_n;
  input            avs_chipselect;
  input         	 avs_read;
//  input   [  1: 0] avs_address;
  input   [KEY_WIDTH-1: 0] coe_KEY_IN;

//读KEY input
  
assign avs_readdata = (avs_chipselect & avs_read) ? coe_KEY_IN : {{KEY_WIDTH-1}{1'b0}};    

endmodule

