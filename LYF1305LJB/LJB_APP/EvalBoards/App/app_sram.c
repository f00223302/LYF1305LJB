/*
	FileName : app_sram.c
	Description:
		���ļ�����������Ҫ�����ⲿ SRAM �еı�����
		���ļ������е����ѡ��Ҫ�������ⲿ RAM �С�
		���ļ�����ֻ�������ݣ������庯����
		
	Created on 2013.10.15 by ZZP.
	
	Revision History:
	
*/

#include "app_cfg.h"
#include "app_adc.h"
#include "app_sd.h"


///*********************************
///			��¼�����CPU
///*********************************
#if defined JLB_CPU_MAIN

	uint8_t SampleBuf[SAMPLE_BUF_SIZE];
	
	STS_FRAME StsFrame[STS_BUF_MASK + 1];
	
#endif

