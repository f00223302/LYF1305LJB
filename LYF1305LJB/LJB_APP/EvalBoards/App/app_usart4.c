/*
	FileName : app_uart4.c
	Description : 
		采样板用来接收 TAX 0x38 帧；记录板控制 CPU 连接 RA/RB，接收采样 CPU 传送的数据，应答采样 CPU 的查询。
		
	Created on 2013.08.05 by ZZP.


	Revision History:
	

*/
#include  <app_cfg.h>
#include  <includes.h>
#include "app_usart4.h"
#include "app.h"
#include "miscfnx.h"
#include "bsp.h"
#include "Usart_Common.h"
#include "app_adc.h"



//////////////////////////////////////////////
///		USART functions and variables
//////////////////////////////////////////////

uint8_t		Usart4RxBuf[USART4_RX_BUF_SIZE];
uint8_t		Usart4TxBuf[USART4_TX_BUF_SIZE];

uint8_t		_tmpRxBuf4[USART4_RX_BUF_SIZE];
uint8_t		_tmpTxBuf4[USART4_TX_BUF_SIZE];
DATA_STRUCT _RxInfo4;
DATA_STRUCT _TxInfo4;


/////////////////////////////////////////////////////////////////////////////////////
///					USART4 任务函数
/////////////////////////////////////////////////////////////////////////////////////
void  AppTaskUsart4 (void *p_arg)
{
	(void)p_arg;

	///为帧缓冲区分配地址：
	_RxInfo4.data = _tmpRxBuf4;
	_TxInfo4.data = _tmpTxBuf4;
		
	while (DEF_TRUE){

		if (AppInfo.RdyFlag == 1){

			Usart_RxDataHandler(COM4, &_RxInfo4);

			AppInfo.TaskUsartCnt[COM4]++;
		}
		
		OSTimeDly(10);
	}
}

void Usart4_RxFrameHandler(DATA_STRUCT *Info)
{	
	switch (Info->cmd){
		
		case CMD_RESET:
		case CMD_INQUIRY_VERSION:
		default:
			break;
	}
}


///发送例见 USART1
///。。。。。














