/*
	FileName : app_uart4.h
	Description : 

	Created on 2013.08.05 by ZZP.


	Revision History:


*/

#ifndef __APP_USART4__
#define __APP_USART4__

#include "includes.h"

#define USART4_RX_BUF_SIZE		((uint16_t)1 << 10)
#define USART4_TX_BUF_SIZE		((uint16_t)1 << 8)

#define USART4_RX_BUF_MASK		(USART4_RX_BUF_SIZE - 1)
#define USART4_TX_BUF_MASK		(USART4_TX_BUF_SIZE - 1)

extern uint8_t		Usart4RxBuf[USART4_RX_BUF_SIZE];
extern uint8_t		Usart4TxBuf[USART4_TX_BUF_SIZE];



///////////////////////////////////////////////
///			ÃüÁîºê¶¨Òå
///////////////////////////////////////////////





void  AppTaskUsart4 (void *p_arg);
void  Usart4_RxFrameHandler(DATA_STRUCT *Info);




#endif//EOF





