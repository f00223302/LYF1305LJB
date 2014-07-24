/*
	FileName : app_uart6.h
	Description : 

		UART6 is used as RS485 device to communicate with HOST.

	Created on 2013.10.11 by ZZP.


	Revision History:


*/

#ifndef __APP_USART6__
#define __APP_USART6__

#include "includes.h"
#include <stm32f2xx.h>
#include <stm32f2xx.h>
#include "Usart_Common.h"

#define USART6_RX_BUF_SIZE		((uint16_t)1 << 10)
#define USART6_TX_BUF_SIZE		((uint16_t)1 << 8)

#define USART6_RX_BUF_MASK		(USART6_RX_BUF_SIZE - 1)
#define USART6_TX_BUF_MASK		(USART6_TX_BUF_SIZE - 1)

extern uint8_t		Usart6RxBuf[USART6_RX_BUF_SIZE];
extern uint8_t		Usart6TxBuf[USART6_TX_BUF_SIZE];


#define  U6TXFRAME_MAX    4
#define  U6TXFRAME_MASK  (U6TXFRAME_MAX-1)
#define  U6TXFRAME_DBUF_MAX    64

typedef struct{
	uint8_t rIndex;
	uint8_t wIndex;
	uint8_t fdBuf[U6TXFRAME_MAX][U6TXFRAME_DBUF_MAX];
	uint16_t flenBuf[U6TXFRAME_MAX];
	
}U6_TXFRMBUF, *pU6TXFRMBUF;

extern U6_TXFRMBUF U6_TxFrmBuf; // transmit frame buf 



void  AppTaskUsart6 (void *p_arg);

void Usart6_RxFrameHandler(DATA_STRUCT *Info);


void Calibrate(void);

void WriteChInfo(void);

void ReadChInfo(void);


//Added by me 20140328
/********************根据张工的50V 修改为110V 通道的**************************/

void AckParams(void);

void WriteChParams(DATA_STRUCT *Info);

void UpdateParams(DATA_STRUCT *Info);

void Ack110VOffset(void);

void Ack110VRes(void);

uint8_t CheckProtectData(DATA_STRUCT *Info);

void AckWriteProtection(uint8_t err);

/********************根据张工的50V 修改为110V 通道的**************************/



/********************根据张工的提议增加的**************************/

void AckBoardID(void);
void WriteBoardID(DATA_STRUCT *Info);
void AckMaintInfo(void);
void WriteMaintInfo(DATA_STRUCT *Info);

/********************根据张工的提议增加的**************************/


//referenced to LBJ and added by me
void Usart6_TxDeal(void);



#endif//EOF





