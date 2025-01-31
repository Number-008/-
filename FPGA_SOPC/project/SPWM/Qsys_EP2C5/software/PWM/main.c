#include "key.h"
#include "lcd12864.h"
#include"pwm.h"

int main()
{ 
	LCD_Init();
	WrPwmEn(1);
	WrPwmEn2(1);
	WrPwmT(PWM_Dx);
	WrPwmT2(PWM_Dx);
	WrPwmD(PWMDC1);
	WrPwmD2(PWMDC2);
	LCD_ShowString(1,1,"PWM1");
	PWMDutyCycle(4,1,PWMDC1);
	LCD_ShowString(1,2,"PWM2");
	PWMDutyCycle(4,2,PWMDC2);
	while (1)
	{
		KeyScan();

	}
	return 0;
}
