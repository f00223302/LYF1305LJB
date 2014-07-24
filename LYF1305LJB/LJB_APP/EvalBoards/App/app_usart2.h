/*
	FileName : app_uart2.h
	Description : 

	Created on 2013.08.05 by ZZP.


	Revision History:


*/

#ifndef __APP_USART2__
#define __APP_USART2__

#include "includes.h"

#define USART2_RX_BUF_SIZE		((uint16_t)1 << 10)
#define USART2_TX_BUF_SIZE		((uint16_t)1 << 10)

#define USART2_RX_BUF_MASK		(USART2_RX_BUF_SIZE - 1)
#define USART2_TX_BUF_MASK		(USART2_TX_BUF_SIZE - 1)

extern uint8_t		Usart2RxBuf[USART2_RX_BUF_SIZE];
extern uint8_t		Usart2TxBuf[USART2_TX_BUF_SIZE];



///////////////////////////////////////////////
///			ÃüÁîºê¶¨Òå
///////////////////////////////////////////////





void  AppTaskUsart2 (void *p_arg);
void  Usart2_RxFrameHandler(DATA_STRUCT *Info);




#endif//EOF





