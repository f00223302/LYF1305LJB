/*
	FileName : app_uart3.h
	Description : 

		UART3 is used as TAX receiver.

	Created on 2013.10.11 by ZZP.


	Revision History:


*/

#ifndef __APP_USART3__
#define __APP_USART3__

#include "includes.h"

#define USART3_RX_BUF_SIZE		((uint16_t)1 << 10)
#define USART3_TX_BUF_SIZE		((uint16_t)1 << 10)

#define USART3_RX_BUF_MASK		(USART3_RX_BUF_SIZE - 1)
#define USART3_TX_BUF_MASK		(USART3_TX_BUF_SIZE - 1)

extern uint8_t		Usart3RxBuf[USART3_RX_BUF_SIZE];
extern uint8_t		Usart3TxBuf[USART3_TX_BUF_SIZE];



void  AppTaskUsart3 (void *p_arg);

void Usart3_RxFrameHandler(DATA_STRUCT *Info);




#endif//EOF





