#include "lcd12864.h"
#include "stdio.h"
#include "system.h"
#include "io.h"
#define ReadRef IORD(DJD_BASE,0)
#define ReadTest IORD(DJD_BASE,1)
double n;
char d[14];
void DJDaut(void)
{
	alt_u32 d1,d2;
	d1=ReadTest;
	d2=ReadRef;
	n=(d1*200000000.0f)/d2;
	if(n>=0.000 && n<0.001)
	{
		n=n*1000000;
		n=n*1000000;
		d[10]='u';
		d[11]='H';
		d[12]='z';
	}
	else if(n>=0.001 && n<1)
	{
		n=n*100000;
		n=n*10000;
		d[10]='m';
		d[11]='H';
		d[12]='z';

	}
	else if(n>=1 && n<1000)
		{
			n=n*1000000;
			d[10]='H';
			d[11]='z';
			d[12]=' ';

		}
	else if(n>=1000 && n<1000000)
		{
			n=n*1000;
			d[10]='K';
			d[11]='H';
			d[12]='z';
		}
	else if(n>=1000000)
		{
			d[10]='M';
			d[11]='H';
			d[12]='z';
		}

	d[0]=(alt_u32)n/100000000+0x30;
	d[1]=(alt_u32)n/10000000%10+0x30;
	d[2]=(alt_u32)n/1000000%10+0x30;
	d[3]='.';
	d[4]=(alt_u32)n/100000%10+0x30;
	d[5]=(alt_u32)n/10000%10+0x30;
	d[6]=(alt_u32)n/1000%10+0x30;
	d[7]=(alt_u32)n/100%10+0x30;
	d[8]=(alt_u32)n/10%10+0x30;
	d[9]=(alt_u32)n%10+0x30;
	d[13]='\0';
	if(d[0]==0x30 && d[1]==0x30)
		d[0]=d[1]=' ';
	else if(d[0]==0x30) d[0]=' ';
	LCD_ShowString(4,2,d);
}

int main(void)
{
	LCD_Init();//lcd12864��ʼ��
	LCD_ShowString(1,1,"Frequency is");
	while(1)
	{
		DJDaut();
		usleep(500000);
	}
    return 0;
}

