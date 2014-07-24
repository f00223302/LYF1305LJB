/*
	FileName : app_uart5.h
	Description : 

	Created on 2013.08.05 by ZZP.


	Revision History:


*/

#ifndef __APP_USART5__
#define __APP_USART5__

#include "includes.h"

#define USART5_RX_BUF_SIZE		((uint16_t)1 << 10)
#define USART5_TX_BUF_SIZE		((uint16_t)1 << 10)

#define USART5_RX_BUF_MASK		(USART5_RX_BUF_SIZE - 1)
#define USART5_TX_BUF_MASK		(USART5_TX_BUF_SIZE - 1)

extern uint8_t		Usart5RxBuf[USART5_RX_BUF_SIZE];
extern uint8_t		Usart5TxBuf[USART5_TX_BUF_SIZE];



///////////////////////////////////////////////
///			ÃüÁîºê¶¨Òå
///////////////////////////////////////////////





void  AppTaskUsart5 (void *p_arg);
void  Usart5_RxFrameHandler(DATA_STRUCT *Info);




#endif//EOF





