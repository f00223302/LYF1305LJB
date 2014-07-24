/*
	FileName : F205_Gpio.h
	Description :
	Created on 2013.01.18 by ZZP.

	Revision History:

*/


#ifndef __F205_GPIO_H__
#define __F205_GPIO_H__

#include <core_cm3.h>

extern void F205_InitGpio(void);
extern uint8_t F205_GetBdAddr(void);
extern uint8_t F205_GetBdType(void);
extern void F205_EnableUsartTx(void);
extern void F205_DisableUsartTx(void);
extern void F205_FeedDog(void);
extern uint8_t F205_GetCapStatus(void);




#endif//
