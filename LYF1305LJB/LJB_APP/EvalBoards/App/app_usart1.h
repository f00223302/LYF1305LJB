/*
	FileName : app_uart1.h
	Description : 

		UART1�����͹��ػ�ͨ�ţ����ӿ���CIRϵͳ�к�CIR����ͨ�ţ�

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

///���� I2C ����������ʼƫ����
#define POW_DATA_OFFSET		16
///��������¼����
#define MAX_POW_DATA_CNT	(31)
///���� I2C ��������֡��С
#define POW_DATA_SIZE		16



extern uint8_t		Usart1RxBuf[USART1_RX_BUF_SIZE];
extern uint8_t		Usart1TxBuf[USART1_TX_BUF_SIZE];



///////////////////////////////////////////////
///			����궨��
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





