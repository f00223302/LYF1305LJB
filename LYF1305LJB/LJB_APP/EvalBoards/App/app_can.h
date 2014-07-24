/*
	FileName : app_can.h
	Description : 
		
	Created on 2013.10.23 by ZZP.
	
	Revision History:
	
*/

#ifndef __APP_CAN_H__
#define __APP_CAN_H__

#include "stm32f2xx_can.h"

#define CAN_RX_FRAME_SIZE		((uint16_t)1 << 7)
#define CAN_TX_FRAME_SIZE		((uint16_t)1 << 7)

#define CAN_RX_FRAME_MASK		(CAN_RX_FRAME_SIZE - 1)
#define CAN_TX_FRAME_MASK		(CAN_TX_FRAME_SIZE - 1)



extern CAN_InitTypeDef CanInit[2];
extern CAN_FilterInitTypeDef CanFilterInit[2];


extern CanRxMsg CanRxFrame[2][CAN_RX_FRAME_SIZE];
extern CanTxMsg CanTxFrame[2][CAN_TX_FRAME_SIZE];


void AppTaskCAN1(void *p_arg);
void InitCanParams(void);

uint32_t	CAN_CallBack(unsigned char Arg, void *ptr);



#endif///EOF





