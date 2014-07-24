/*
	FileName : bsp_ADC.h
	Description :
		ADC BSP header file.
	Created on 2013.02.20 by ZZP.

	Revision History:

*/

#ifndef __BSP_ADC_H__
#define __BSP_ADC_H__

#include "core_cm3.h"


///单一 ADC
#define ADC_METHOD_SINGLE	1
///2路
#define ADC_METHOD_DUAL		2
///三路 ADC
#define ADC_METHOD_TRIPLE	3

	

void BSP_ADC_Init(uint16_t *ResBuf);
void BSP_ADC_Start(void);

#endif///BSP_ADC_H




