/*
	FileName : bsp_can.c
	Description : 
		CAN 
		
	Created on 2013.10.16 by ZZP.
	
	Revision History:
	
*/

#include "bsp.h"
#include "bsp_can.h"

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
///									常量定义
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

GPIO_TypeDef* CAN_TX_PORT[2] = {		CAN_1_TX_GPIO_PORT,
										CAN_2_TX_GPIO_PORT};
 
GPIO_TypeDef* CAN_RX_PORT[2] = {		CAN_1_RX_GPIO_PORT,
										CAN_2_RX_GPIO_PORT};

const uint32_t CAN_CLK[2] = {			CAN_1_CLK,
										CAN_2_CLK};

const uint32_t CAN_TX_PORT_CLK[2] = {	CAN_1_TX_GPIO_CLK,
										CAN_2_TX_GPIO_CLK
									};
 
const uint32_t CAN_RX_PORT_CLK[2] = {	CAN_1_RX_GPIO_CLK,
										CAN_2_RX_GPIO_CLK
									};

const uint16_t CAN_TX_PIN[2] = 		{	CAN_1_TX_PIN,
										CAN_2_TX_PIN
									};

const uint16_t CAN_RX_PIN[2] = 		{	CAN_1_RX_PIN,
										CAN_2_RX_PIN
									};
 
const uint8_t CAN_TX_SOURCE[2] = {		CAN_1_TX_SOURCE,
										CAN_2_TX_SOURCE
									};

const uint8_t CAN_RX_SOURCE[2] = {		CAN_1_RX_SOURCE,
										CAN_2_RX_SOURCE
									};
 
const uint8_t CAN_AF_PORT[2] = {		CAN_1_AF_PORT,
										CAN_2_AF_PORT
									};
 

const uint32_t CanIntID[2] = {	CAN_1_INT_ID,
								CAN_2_INT_ID};

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
///								函数原型
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
void (*CanIsr[2])(void);
void Can1_Isr(void);
void Can2_Isr(void);




//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
///								函数实现
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
void BSP_InitCan(CAN_TypeDef* CANx, CAN_InitTypeDef *CanInit, CAN_FilterInitTypeDef *FilterInit)
{
	uint8_t i;
	GPIO_InitTypeDef  GPIO_InitStructure;
  
	/* CAN GPIOs configuration **************************************************/

	if (CANx == CAN_1)
		i = 1;
	else if (CANx == CAN_2)
		i = 2;
	else
		return;
		
	/* Enable GPIO clock */
	RCC_AHB1PeriphClockCmd(CAN_TX_PORT_CLK[i] | CAN_RX_PORT_CLK[i], ENABLE);
  
	/* Configure CAN RX and TX pins */
	GPIO_InitStructure.GPIO_Pin = CAN_RX_PIN[i] ;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
	GPIO_Init(CAN_RX_PORT[i], &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = CAN_TX_PIN[i];
	GPIO_Init(CAN_TX_PORT[i], &GPIO_InitStructure);

	/* Connect CAN pins to AF9 */
	GPIO_PinAFConfig(CAN_RX_PORT[i], CAN_RX_SOURCE[i], CAN_AF_PORT[i]);
	GPIO_PinAFConfig(CAN_TX_PORT[i], CAN_TX_SOURCE[i], CAN_AF_PORT[i]); 

	/* CAN configuration ********************************************************/  
	/* Enable CAN clock */
	RCC_APB1PeriphClockCmd(CAN_CLK[i], ENABLE);
	
	/* CAN register init */
	CAN_DeInit(CANx);
	
	///	
	CAN_Init(CANx, CanInit);

	///
	CAN_FilterInit(FilterInit);
  
  
	/* Enable Tx mailbox empty Interrupt, FIFO 0 message pending Interrupt */
	CAN_ITConfig(CANx, CAN_IT_TME | CAN_IT_FMP0, ENABLE);
	
	
	/* Configure and enable TX empty interrupt */
	BSP_IntVectSet(CanIntID[i], CanIsr[i]);
    BSP_IntEn(CanIntID[i]);
}




void (*CanIsr[2])(void) = 
{
	Can1_Isr,	
	Can2_Isr
};


void Can1_Isr(void)
{
	CanRxMsg 	*MsgPtr;
	uint16_t 	i;
	
	if (CAN_MessagePending(CAN_1, CAN_FIFO0)){
		
		i = BSP_Info.CanRxMsgIndex[0];
		MsgPtr = BSP_Info.CanRxMsgPtr[0] + i;
		CAN_Receive(CAN_1, CAN_FIFO0, MsgPtr);
		
		BSP_Info.CanRxMsgIndex[0]++;
		BSP_Info.CanRxMsgIndex[0] &= BSP_Info.CanRxMsgMask[0];		
	}
	
	if (BSP_Info.CANCallBack)
		BSP_Info.CANCallBack(0, NULL);
}

void Can2_Isr(void)
{
	CanRxMsg 	*MsgPtr;
	uint16_t 	i;
	
	if (CAN_MessagePending(CAN_2, CAN_FIFO0)){
		
		i = BSP_Info.CanRxMsgIndex[1];
		MsgPtr = BSP_Info.CanRxMsgPtr[1] + i;
		CAN_Receive(CAN_2, CAN_FIFO0, MsgPtr);
		
		BSP_Info.CanRxMsgIndex[1]++;
		BSP_Info.CanRxMsgIndex[1] &= BSP_Info.CanRxMsgMask[1];		
	}
	
	if (BSP_Info.CANCallBack)
		BSP_Info.CANCallBack(1, NULL);
}






