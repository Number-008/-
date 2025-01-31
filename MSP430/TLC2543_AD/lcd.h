/*
 * lcd.h
 *
 *  Created on: 2013-6-29
 *      Author: qin
 */

#ifndef LCD_H_
#define LCD_H_
#include "msp430G2553.h"
#define		W_CMD		0xf8
#define		W_DAT		0xfa
extern char DisBuf1[17];
extern char DisBuf2[17];
extern char DisBuf3[17];
extern char DisBuf4[17];
void LCDInit(void);
void  LCDWrite(u8 type,u8 dat);
void LCD_ShowString(u8 col,u8 row,char *str);
void LCD_ShowChar(u8 col,u8 row,u8 c);
void RefDis(void);
#endif /* LCD_H_ */
