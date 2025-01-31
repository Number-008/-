/*
 * spi.c
 *
 *  Created on: 2013-7-21
 *      Author: Qin Hai Cheng
 */
#include "msp430G2553.h"
#include "spi.h"

//发送一个字节数据
void SpiWriteDat(u8 c)
{
	UCA0TXBUF=c;
	while ((IFG2 & UCA0TXIFG)==0); // 等待上一字节发完
	IFG2 &=~ UCA0TXIFG;
}

//接收一个字节数据
u8 SpiReadDat(void)
{
	while ((IFG2 & UCA0RXIFG)==0); // 收到一字节?
	IFG2 &=~ UCA0RXIFG;
    return(UCA0RXBUF);
}

//发送和接收一个字节数据
u8 SpiWriteData(u8 c)
{
	SpiWriteDat(c);
	return SpiReadDat();
}

//串口发送接收16位数据函数   10、12、14、16位AD、DA用
u16 SpiSendData(u16 dat)
{
	u16 RX_temp=0;

	RX_temp = SpiWriteData((dat>>8 ) & 0xff);
	RX_temp <<= 8;
	RX_temp |= SpiWriteData(dat & 0xff);

	return RX_temp;
}
//UCLK时钟分频设置
void SpiSetCLK(u16 fen)
{
	if(fen<256) UCA0BR0 = fen;
	else
	{
		UCA0BR0 = fen / 256;
		UCA0BR1 = fen % 256;
	}

}

//SPI时钟模式设置
//0:上升沿发送，下降沿接收，正常UCLK,			时钟信号的低电平为无效电平；
//1:下降沿发送，上升沿接收，正常UCLK,			时钟信号的高电平为无效电平；
//2:下降沿发送，上升沿接收，延时半个周期UCLK,	时钟信号的低电平为无效电平；
//3:上升沿发送，下降沿接收，延时半个周期UCLK,	时钟信号的高电平为无效电平；
void SpiSetCK(u8 P)
{
	switch(P)
	{
		case 0:{UCA0CTL0 &= ~UCCKPH;	UCA0CTL0 &= ~UCCKPL;}break;
		case 1:{UCA0CTL0 &= ~UCCKPH;	UCA0CTL0 |= UCCKPL;	}break;
		case 2:{UCA0CTL0 |= UCCKPH;		UCA0CTL0 &= ~UCCKPL;}break;
		case 3:{UCA0CTL0 |= UCCKPH;		UCA0CTL0 |= UCCKPL;	}break;
		default:break;
	}
}

//SPI初始化设置
void SpiInit(void)
{
	UCA0CTL1 |= UCSWRST;
	P1SEL = BIT1 + BIT2 + BIT4;
	P1SEL2 = BIT1 + BIT2 + BIT4;
	UCA0CTL0 |=  UCMSB + UCMST + UCSYNC;  	// 3-pin, 8-bit SPI master
	UCA0CTL1 |= UCSSEL_2;                   // SMCLK
	//UCA0BR0 = 0x02;							//1M/2=500KHz
	//UCA0BR1 = 0x00;
	SpiSetCLK(2);
	UCA0MCTL = 0x00; 						// no modulation
	//UCA0CTL0 |= UCMODE_0; // 3-pin mode
	//UCA0CTL0 |= UCCKPH;
	//UCA0CTL0 |= UCCKPL;
	SpiSetCK(2);
	UCA0CTL1 &= ~UCSWRST;                   // **Initialize USCI state machine**
	//IE2 |= UCA0RXIE;                      // Enable USCI0 RX interrupt
}
