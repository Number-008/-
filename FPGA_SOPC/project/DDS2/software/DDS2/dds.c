#include "dds.h"
#include "string.h"
#include "lcd12864.h"
#include "dds_data.h"
alt_u32 freq=1000;
alt_u16 pha=0;

void WriteFreq(double n)//2^48=281474976710656;
{
	alt_u64 K;
	K=n*2814749.76710656;
	FREQW_L((alt_u32) K);
	FREQW_H((alt_u32)(K>> 32 ));
}

void WritePhasew(float n)
{
	double P;
	P=n*0.087890625;
	PHASEW((alt_u32) P);

}


//��ʾƵ��ֵ
void DDS_OUT(alt_u32 n)
{
   char d[11];
   WriteFreq(n);

   	if(n>=0 && n<1000)
   		{
   	   		d[0]=' ';
   	   		d[1]=' ';
   	   		d[2]=' ';
   	   		d[3]=' ';
   	   		d[4]=' ';
   	   		d[5]=(alt_u32)n/100%10+0x30;
   	   		d[6]=(alt_u32)n/10%10+0x30;
   	   		d[7]=(alt_u32)n%10+0x30;
   			d[8]='H';
   			d[9]='z';
   		   	if(d[5]==0x30 && d[6]==0x30)
   		   		d[5]=d[6]=' ';
   		   	else if(d[5]==0x30) d[5]=' ';

   		}
   	else if(n>=1000 && n<1000000)
   		{
			d[0]=(alt_u32)n/100000+0x30;
			d[1]=(alt_u32)n/10000%10+0x30;
			d[2]=(alt_u32)n/1000%10+0x30;
			d[3]='.';
			d[4]=(alt_u32)n/100%10+0x30;
			d[5]=(alt_u32)n/10%10+0x30;
			d[6]=(alt_u32)n%10+0x30;
			d[7]='K';
			d[8]='H';
			d[9]='z';
   		}
   	else if(n>=1000000)
   		{
			d[0]=(alt_u32)n/100000000+0x30;
			d[1]=(alt_u32)n/10000000%10+0x30;
			d[2]=(alt_u32)n/1000000%10+0x30;
			d[3]='.';
			d[4]=(alt_u32)n/100000%10+0x30;
			d[5]=(alt_u32)n/10000%10+0x30;
			d[6]=(alt_u32)n/1000%10+0x30;
   			d[7]='M';
   			d[8]='H';
   			d[9]='z';
   		}
   	d[10]='\0';
   	if(d[0]==0x30 && d[1]==0x30)
   		d[0]=d[1]=' ';
   	else if(d[0]==0x30) d[0]=' ';
   	LCD_ShowString(7,2,d);
}

void DDS_Phasew(alt_u16 n)
{
   char d[5];
   WritePhasew(n);
   d[0]=n/100+0x30;
   d[1]=n/10%10+0x30;
   d[2]=n%10+0x30;
   d[3]=0xdf;
   d[4]='\0';
   LCD_ShowString(13,1,d);

}

//0--z���Ҳ���1--������ 2--���ǲ�;3--��ݲ�
void DDS_RAM_WR(alt_u8 n)
{
	alt_u16 i;
	switch(n)
	{
		case 0:{
				for(i = 0; i < 4096; i++)
					DDS_DATA_WRITE(i,sin[i]);
				LCD_ShowString(5,1,"1");
		}break;
		case 1:{
			for(i = 0; i < 4096; i++)
				DDS_DATA_WRITE(i,fb[i]);
			LCD_ShowString(5,1,"2");
		}break;
		case 2:{
			for(i = 0; i < 4096; i++)
				DDS_DATA_WRITE(i,san[i]);
			LCD_ShowString(5,1,"3");
		}break;
		case 3:{
			for(i = 0; i < 4096; i++)
				DDS_DATA_WRITE(i,jc[i]);
			LCD_ShowString(5,1,"4");
		}break;
		default:
			break;
	}


}

void DDS_Init(void)
{
	freq=1000;
	pha=0;
	DDS_OUT(freq);
	DDS_Phasew(pha);

}
