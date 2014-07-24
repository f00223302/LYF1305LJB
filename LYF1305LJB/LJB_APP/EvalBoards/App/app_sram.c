/*
	FileName : app_sram.c
	Description:
		该文件定义所有需要放在外部 SRAM 中的变量。
		该文件属性中的相关选项要定义在外部 RAM 中。
		该文件可以只定义数据，不定义函数。
		
	Created on 2013.10.15 by ZZP.
	
	Revision History:
	
*/

#include "app_cfg.h"
#include "app_adc.h"
#include "app_sd.h"


///*********************************
///			记录板控制CPU
///*********************************
#if defined JLB_CPU_MAIN

	uint8_t SampleBuf[SAMPLE_BUF_SIZE];
	
	STS_FRAME StsFrame[STS_BUF_MASK + 1];
	
#endif

