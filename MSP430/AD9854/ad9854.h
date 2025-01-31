/*
 * ad9854.h
 *
 *  Created on: 2013-9-3
 *      Author: 覃海程
 */

#ifndef AD9854_H_
#define AD9854_H_

//******************************************************************
//端口操作
#define AD9854_CS_UP       		P1OUT |= BIT2
#define AD9854_CS_DOWN     		P1OUT &=~BIT2   	//片选

#define AD9854_UPDATE_UP   		P1OUT |= BIT4
#define AD9854_UPDATE_DOWN 		P1OUT &=~BIT4	//更新时钟

#define AD9854_IO_RESET_UP    	P1OUT |= BIT0
#define AD9854_IO_RESET_DOWN  	P1OUT &=~BIT0	//SPI总线复位

#define AD9854_RESET_UP    		P1OUT |= BIT6
#define AD9854_RESET_DOWN  		P1OUT &=~BIT6   	//主复位

#define AD9854_OSC_ON    		P1OUT |= BIT5
#define AD9854_OSC_OFF  		P1OUT &=~BIT5	//晶振控制


////////////////////////////////////////////////////////////////////
//                                                                //
//                             INSTRUCTION BYTE                   //
//                                                                //
////////////////////////////////////////////////////////////////////

//******************************************************************
//寄存器地址 注意是串行地址
#define	  AD9854_Addr_PHA1       0        	// 2 Bytes
#define	  AD9854_Addr_PHA2       1        	// 2 Bytes
#define	  AD9854_Addr_FRE1       2        	// 6 Bytes
#define	  AD9854_Addr_FRE2       3        	// 6 Bytes
#define	  AD9854_Addr_DELTA      4        	// 6 Bytes
#define	  AD9854_Addr_UPDATA     5        	// 4 Bytes
#define	  AD9854_Addr_RAMP_CLK   6        	// 3 Bytes
#define	  AD9854_Addr_CTR_REG    7        	// 4 Bytes
#define	  AD9854_Addr_I_MUL      8        	// 2 Bytes
#define	  AD9854_Addr_Q_MUL      9        	// 2 Bytes
#define	  AD9854_Addr_SHAPED     10       	// 1 Bytes
#define	  AD9854_Addr_Q_DAC      11        	// 2 Bytes
//******************************************************************

//******************************************************************
//寄存器长度
#define	  AD9854_Length_PHA1       2        	// 2 Bytes
#define	  AD9854_Length_PHA2       2        	// 2 Bytes
#define	  AD9854_Length_FRE1       6        	// 6 Bytes
#define	  AD9854_Length_FRE2       6        	// 6 Bytes
#define	  AD9854_Length_DELTA      6        	// 6 Bytes
#define	  AD9854_Length_UPDATA     4        	// 4 Bytes
#define	  AD9854_Length_RAMP_CLK   3        	// 3 Bytes
#define	  AD9854_Length_CTR_REG    4        	// 4 Bytes
#define	  AD9854_Length_I_MUL      2        	// 2 Bytes
#define	  AD9854_Length_Q_MUL      2        	// 2 Bytes
#define	  AD9854_Length_SHAPED     1       		// 1 Bytes
#define	  AD9854_Length_Q_DAC      2        	// 2 Bytes

////////////////////////////////////////////////////////////////////
//                                                                //
//                          VARIABLES   DEFINITION                //
//                                                                //
////////////////////////////////////////////////////////////////////

void Update_AD9854(void);
void Io_Reset_AD9854(void);
void Init_AD9854(void);
void Write_AD9854_Freq(double Freq);

#endif /* AD9854_H_ */
