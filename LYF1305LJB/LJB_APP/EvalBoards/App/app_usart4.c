/*
	FileName : app_uart4.c
	Description : 
		�������������� TAX 0x38 ֡����¼����� CPU ���� RA/RB�����ղ��� CPU ���͵����ݣ�Ӧ����� CPU �Ĳ�ѯ��
		
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
///					USART4 ������
/////////////////////////////////////////////////////////////////////////////////////
void  AppTaskUsart4 (void *p_arg)
{
	(void)p_arg;

	///Ϊ֡�����������ַ��
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


///�������� USART1
///����������














