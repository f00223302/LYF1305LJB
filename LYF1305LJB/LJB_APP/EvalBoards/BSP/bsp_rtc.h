/*
	FileName : bsp_rtc.h
	Description :
	
	Created on 2013.10.14 by ZZP.
	
	Revision History:
	
*/


#ifndef __BSP_RTC_H__
#define __BSP_RTC_H__


#include "core_cm3.h"
#include "stm32f2xx_rtc.h"

///时间和日期结构：存储当前时间和日期
extern RTC_TimeTypeDef RTC_TimeStructure;
extern RTC_DateTypeDef RTC_DateStructure;

void BSP_InitRTC(void);
void BSP_SetDateTime(RTC_TimeTypeDef *Time, RTC_DateTypeDef *Date);

void RTC_Callback(void);



#endif///EOF






