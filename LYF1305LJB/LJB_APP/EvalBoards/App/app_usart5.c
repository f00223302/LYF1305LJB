/*
	FileName : app_uart5.c
	Description : 

	Created on 2013.08.05 by ZZP.


	Revision History:
	

*/
#include  <app_cfg.h>
#include  <includes.h>
#include "app_usart5.h"
#include "app.h"
#include "miscfnx.h"
#include "bsp.h"
#include "Usart_Common.h"



//////////////////////////////////////////////
///		USART functions and variables
//////////////////////////////////////////////
uint8_t		Usart5RxBuf[USART5_RX_BUF_SIZE];
uint8_t		Usart5TxBuf[USART5_TX_BUF_SIZE];

uint8_t		_tmpRxBuf5[USART5_RX_BUF_SIZE];
uint8_t		_tmpTxBuf5[USART5_TX_BUF_SIZE];
DATA_STRUCT _RxInfo5;
DATA_STRUCT _TxInfo5;


/////////////////////////////////////////////////////////////////////////////////////
///					USART5 任务函数
/////////////////////////////////////////////////////////////////////////////////////
void  AppTaskUsart5 (void *p_arg)
{
	(void)p_arg;
	
	///为帧缓冲区分配地址：
	_RxInfo5.data = _tmpRxBuf5;
	_TxInfo5.data = _tmpTxBuf5;

	while (DEF_TRUE){

		if (AppInfo.RdyFlag){
			
			Usart_RxDataHandler(COM5, &_RxInfo5);
			AppInfo.TaskUsartCnt[COM5]++;
		}
		OSTimeDly(10);
	}
}

void Usart5_RxFrameHandler(DATA_STRUCT *Info)
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








