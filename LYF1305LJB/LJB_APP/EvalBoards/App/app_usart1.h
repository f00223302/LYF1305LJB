/*
	FileName : app_uart1.h
	Description : 

		UART1用来和工控机通信（本接口在CIR系统中和CIR主机通信）

	Created on 2013.08.05 by ZZP.


	Revision History:


*/

#ifndef __APP_USART1__
#define __APP_USART1__

#include "includes.h"
#include "Usart_Common.h"

#define USART1_RX_BUF_SIZE		((uint16_t)1 << 10)
#define USART1_TX_BUF_SIZE		((uint16_t)1 << 10)

#define USART1_RX_BUF_MASK		(USART1_RX_BUF_SIZE - 1)
#define USART1_TX_BUF_MASK		(USART1_TX_BUF_SIZE - 1)

///定义 I2C 掉电数据起始偏移量
#define POW_DATA_OFFSET		16
///定义掉电记录数量
#define MAX_POW_DATA_CNT	(31)
///定义 I2C 掉电数据帧大小
#define POW_DATA_SIZE		16



extern uint8_t		Usart1RxBuf[USART1_RX_BUF_SIZE];
extern uint8_t		Usart1TxBuf[USART1_TX_BUF_SIZE];



///////////////////////////////////////////////
///			命令宏定义
///////////////////////////////////////////////





void  AppTaskUsart1 (void *p_arg);
void  Usart1_RxFrameHandler(DATA_STRUCT *Info);


void Calibrate(void);

void WriteChInfo(void);

void ReadChInfo(void);

void ReadBoardWorkInfo(void);

void ReportPowOffData(int ClearData);
//void ReportPowOffData(void);


#endif//EOF





