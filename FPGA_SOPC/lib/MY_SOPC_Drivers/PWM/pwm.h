/*
 * pwm.h
 *
 *  Created on: 2013-7-28
 *      Author: Qin Hai Cheng
 */

#ifndef PWM_H_
#define PWM_H_
#include "system.h"
#include "alt_types.h"
#include <io.h>

#define PWM_Dx	10000


#define WrPwmEn(data)  IOWR(PWM_BASE,0,data)
#define WrPwmT(data)   IOWR(PWM_BASE,1,data)
#define WrPwmD(data)   IOWR(PWM_BASE,2,data)

#define WrPwmEn2(data)  IOWR(PWM2_BASE,0,data)
#define WrPwmT2(data)   IOWR(PWM2_BASE,1,data)
#define WrPwmD2(data)   IOWR(PWM2_BASE,2,data)

void PWMDutyCycle(alt_u8 x,alt_u8 y,alt_u16 n);
#endif /* PWM_H_ */
