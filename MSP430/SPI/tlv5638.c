/*
 * tlv5638.c
 *
 *  Created on: 2013-5-19
 *      Author: Qin Hai Cheng
 */

#include "tlv5638.h"
#include "msp430g2553.h"
#include "lcd.h"
#include "spi.h"
u16 TLV5638=0;
//SPI写数据
void TLV5638_Write(u16 dat)
{
	P2OUT &= ~BIT1;//CS拉低
	SpiSetCK(3);
	SpiSendData(dat);
	P2OUT |= BIT1;//P1.0高电平即CS拉高
}

void TLV5638_Out(u16 dat)// V0=2*REF*CODE/4096(V)
{
	char BUF[7];
	if(dat<2048)
	{
		TLV5638_Write(0xd001);//1.024V  fast mode\normal operation
		TLV5638_Write(0x4000 | dat*2);//DAC B output
	}
	else
	{
		TLV5638_Write(0xd002);//2.048V  fast mode\normal operation
		TLV5638_Write(0x4000 | dat);//DAC B output
	}
   if(dat<1000)
   {
	BUF[0]=' ';
   	BUF[1]=dat/100%10+0x30;
	BUF[2]=dat/10%10+0x30;
	BUF[3]=dat%10+0x30;
	if	(BUF[1]==0x30 && BUF[2]==0x30)
		BUF[1]=BUF[2]=' ';
	else if	(BUF[1]==0x30 )
		BUF[2]=' ';
	BUF[4]='m';
	BUF[5]='V';
   }
   else  if(dat>=1000)
   {
		BUF[0]=dat/1000+0x30;
		BUF[1]='.';
	   	BUF[2]=dat/100%10+0x30;
		BUF[3]=dat/10%10+0x30;
		BUF[4]=dat%10+0x30;
		BUF[5]='V';
   	 }
   BUF[6]='\0';
   LCD_ShowString(1,2,BUF);
}








//D14:1--fast mode，0--slow mode
//D13:1--power down,0--normal operation
//D15      D12
//0			0	写数据到DAC B和缓冲
//0			1	写数据到缓冲区
//1			0	写数据到DAC A和更新DAC B 与缓冲区的内容
//1			1	写数据到控制寄存器
//控制寄存器	XXXXX	D1		D0
//						0		0  EXT
//						0		1  1.024
//						1		0  2.048
//						1		1  EXT
//TLV5638_Write(0x2000);//设置为低功耗模式
//0XD001 1.024V 0XD002 2.048V  fast mode\normal operation

//0x5000 | XXXX	 Write new DAC B value to BUFFER and update DAC B output
//0x1000 | XXXX	 Write data for DAC B to BUFFER
//oxc000 | XXXX	 Write new DAC A value and update DAC A and B simultaneously
