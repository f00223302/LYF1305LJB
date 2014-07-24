/*
	FileName : app_dac.h
	Description : 
		
	Created on 2013.07.30 by ZZP.
	
	Revision History:
	
*/

#ifndef __APP_DAC_H__
#define __APP_DAC_H__

#include <core_cm3.h>


#define DAC_BUF_SIZE	4096
#define DAC_BUF_MASK	(DAC_BUF_SIZE - 1)


///数据发送完毕后关闭
#define DAC_OUT_ONCE		0
///循环发送
#define DAC_OUT_FOREVER		1

///乒乓
extern uint16_t 	DacBuf[2][DAC_BUF_SIZE];

/*
	Type: DAC_OUT_ONCE, DAC_OUT_FOREVER
	DataCnt:
		Type == DAC_OUT_ONCE 时表示总长度
*/
uint8_t	StartDacXfer(uint8_t Type, uint16_t *Data, uint16_t DataCnt);

void StopDacXfer(void);

#endif///EOF


