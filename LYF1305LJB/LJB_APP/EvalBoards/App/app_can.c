/*
	FileName : app_can.c
	Description : 
		
	Created on 2013.10.23 by ZZP.
	
	Revision History:
	
*/
#include "app_cfg.h"
#include "bsp.h"
#include "app_can.h"
#include "app.h"

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
///									Variables ∂®“Â
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
CAN_InitTypeDef CanInit[2];
CAN_FilterInitTypeDef CanFilterInit[2];

CanRxMsg CanRxFrame[2][CAN_RX_FRAME_SIZE];
CanTxMsg CanTxFrame[2][CAN_TX_FRAME_SIZE];

uint16_t HandleIndex = 0;

void CanRxHandler(void);

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
///							Global function realizations
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
void AppTaskCAN1(void *p_arg)
{	
	
	(void)p_arg;
	

	while (DEF_TRUE){
		
		if (AppInfo.RdyFlag){
			///CanTxHandler();
			CanRxHandler();
		}

		OSTimeDly(5);
	}
}


void InitCanParams(void)
{
	CAN_StructInit(&CanInit[0]);

	/* CAN cell init */
	CanInit[0].CAN_TTCM = DISABLE;
	CanInit[0].CAN_ABOM = DISABLE;
	CanInit[0].CAN_AWUM = DISABLE;
	CanInit[0].CAN_NART = DISABLE;
	CanInit[0].CAN_RFLM = DISABLE;
	CanInit[0].CAN_TXFP = DISABLE;
	CanInit[0].CAN_Mode = CAN_Mode_Normal;
	CanInit[0].CAN_SJW = CAN_SJW_3tq;
    
	/* CAN Baudrate = 250kBps (CAN clocked at 4 MHz) */
	CanInit[0].CAN_BS1 = CAN_BS1_12tq;
	CanInit[0].CAN_BS2 = CAN_BS2_3tq;
	CanInit[0].CAN_Prescaler = 15;
	
	/* CAN filter init */
	CanFilterInit[0].CAN_FilterNumber = 0;
	CanFilterInit[0].CAN_FilterMode = CAN_FilterMode_IdMask;
	CanFilterInit[0].CAN_FilterScale = CAN_FilterScale_32bit;
	CanFilterInit[0].CAN_FilterIdHigh = 0x0000;
	CanFilterInit[0].CAN_FilterIdLow = 0x0000;
	CanFilterInit[0].CAN_FilterMaskIdHigh = 0x0000;
	CanFilterInit[0].CAN_FilterMaskIdLow = 0x0000;
	CanFilterInit[0].CAN_FilterFIFOAssignment = 0;
	CanFilterInit[0].CAN_FilterActivation = ENABLE;
}

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
///								Local Functio Realizations
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
uint32_t	CAN_CallBack(unsigned char Arg, void *ptr)
{
	if (!Arg){///CAN_1
	}
	else{///CAN_2
	}
	return 0;
}


void CanRxHandler(void)
{
	uint16_t Index;
	
	Index = BSP_Info.CanRxMsgIndex[0];
	while (HandleIndex != Index){
		
		HandleIndex++;
		HandleIndex &= BSP_Info.CanRxMsgMask[0];
	}
}

void CanTxHandler(void)
{
	uint8_t res;
	CanTxMsg *Msg;
	
	///
	///Msg. = 
	res = CAN_Transmit(CAN_1, Msg);
	if (res == CAN_TxStatus_NoMailBox){
	}
	
}





		
		
		




