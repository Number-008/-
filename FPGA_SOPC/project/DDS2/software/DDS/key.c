#include "key.h"
#include "dds.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
/********************************************************************
* 名 称：key(void)
* 功 能：按键处理
* 入口参数：KEY_INPUT
* 出口参数：
********************************************************************/

void key(void)
{
	if(KEY_INPUT != 0x0f)
		{
			usleep(10000);                      //延时20ms
			if(KEY_INPUT != 0x0f)               //如果是由短暂脉冲引起的中断则忽略
			{
				switch(KEY_INPUT)
					{
						case 0x0e:
							{
								
								//while(KEY_INPUT==0x0e);//等待按键释放
								if(IORD_ALTERA_AVALON_PIO_DATA(SW2_BASE))
								{
									if(freq<=10000000)freq+=1000;

								}
								else
								{
									if(freq<=10000000)freq+=1;
								}

								DDS_OUT(freq);
								usleep(50);

							}break;
						case 0x0d:
							{
								
								//while(KEY_INPUT==0x0d);//等待按键释放

								if(IORD_ALTERA_AVALON_PIO_DATA(SW2_BASE))
								{
									if(freq>1000)freq-=1000;

								}
								else
								{
									if(freq>0)freq--;
								}
								DDS_OUT(freq);
								usleep(50);
							}break;
						case 0x0b:
							{
								
								//while(KEY_INPUT==0x0b);//等待按键释放
								if(pha<360)pha++;
								DDS_Phasew(pha);
								usleep(8);
							}break;
						case 0x07:
							{
								
								//while(KEY_INPUT==0x07);//等待按键释放
								if(pha>0)pha--;
								DDS_Phasew(pha);
								usleep(8);
							}break;
					}
			}
			
		}

}
