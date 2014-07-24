/*
	FileName : app_uart2.c
	Description : 

	Created on 2013.08.05 by ZZP.


	Revision History:
	

*/
#include  <app_cfg.h>
#include  <includes.h>
#include "app_usart2.h"
#include "app.h"
#include "miscfnx.h"
#include "bsp.h"
#include "Usart_Common.h"



//////////////////////////////////////////////
///		USART functions and variables
//////////////////////////////////////////////
uint8_t		Usart2RxBuf[USART2_RX_BUF_SIZE];
uint8_t		Usart2TxBuf[USART2_TX_BUF_SIZE];

uint8_t		_tmpRxBuf2[USART2_RX_BUF_SIZE];
uint8_t		_tmpTxBuf2[USART2_TX_BUF_SIZE];
DATA_STRUCT _RxInfo2;
DATA_STRUCT _TxInfo2;


/////////////////////////////////////////////////////////////////////////////////////
///					USART2 任务函数
/////////////////////////////////////////////////////////////////////////////////////
void  AppTaskUsart2 (void *p_arg)
{
	(void)p_arg;
	
	///为帧缓冲区分配地址：
	_RxInfo2.data = _tmpRxBuf2;
	_TxInfo2.data = _tmpTxBuf2;

	while (DEF_TRUE){

		if (AppInfo.RdyFlag){
			
			Usart_RxDataHandler(COM2, &_RxInfo2);
			AppInfo.TaskUsartCnt[COM2]++;
		}
		OSTimeDly(10);
	}
}

void Usart2_RxFrameHandler(DATA_STRUCT *Info)
{
	switch (Info->cmd){
		
		case CMD_RESET:
			break;
		
		case CMD_INQUIRY_VERSION:

			break;
		
		default:
			break;
	}
}

///发送例见 USART1
///。。。。。











