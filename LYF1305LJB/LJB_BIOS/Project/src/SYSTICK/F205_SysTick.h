/*
	FileName : F205_Systick.h
	Description :
	Created on 2013.01.18 by ZZP.

	Revision History:
*/

#ifndef __F205_SYS_TICK_H__
#define __F205_SYS_TICK_H__

#include <core_cm3.h>

void F205_ConfigSysTick(__IO uint32_t tick);
void F205_SysTickFunc(void);


#endif//

