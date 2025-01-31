module LED_OUT(
             // inputs:
				  csi_clk,
              csi_reset_n,
             // Avalon-MM Slave   
              avs_chipselect,
				  avs_address, 
              avs_write_n,
              avs_writedata,
				  avs_readdata,

             // outputs:
              coe_LED//只写
           )
;
  output  [  3: 0] coe_LED;
  
  input         csi_clk;
  input         csi_reset_n;
  input         avs_chipselect;
  input	[2:0]  avs_address; 
  input         avs_write_n;
  input  [3:0]  avs_writedata;
  output [3:0]  avs_readdata;

	
  reg     [3:0] data_out;
  wire    [3:0] coe_LED;
  wire    [3:0] read_out;

	assign read_out =(avs_chipselect & avs_write_n
		& avs_address==0 )? data_out:4'b0;
//地址译码
  always @(posedge csi_clk or negedge csi_reset_n)
    begin
      if (csi_reset_n == 0)
          data_out <= 4'b1111;
			else if (avs_chipselect && ~avs_write_n)  
				begin  
					case (avs_address)  
						0:data_out 	  <= avs_writedata[3 : 0]; 
						1:data_out[0] <= avs_writedata[0];
						2:data_out[1] <= avs_writedata[0];
						3:data_out[2] <= avs_writedata[0];
						4:data_out[3] <= avs_writedata[0];
						default:;
					endcase  
				end  
    end
 
  assign coe_LED = data_out;
  assign avs_readdata = read_out;
endmodule

