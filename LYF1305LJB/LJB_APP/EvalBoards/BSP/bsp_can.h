/*
	FileName : bsp_can.h
	Description : 
		CAN DRIVER.
		
	Created on 2013.10.16 by ZZP.
	
	Revision History:
	
*/


#ifndef __BSP_CAN_H__
#define __BSP_CAN_H__


#include "core_cm3.h"



///CAN1
#define CAN_1_INT_ID				BSP_INT_ID_CAN1_TX

#define CAN_1						CAN1
#define CAN_1_CLK					RCC_APB1Periph_CAN1
#define CAN_1_RX_PIN				GPIO_Pin_11
#define CAN_1_TX_PIN				GPIO_Pin_12
#define CAN_1_RX_GPIO_PORT			GPIOA
#define CAN_1_TX_GPIO_PORT			GPIOA
#define CAN_1_RX_GPIO_CLK			RCC_AHB1Periph_GPIOA
#define CAN_1_TX_GPIO_CLK			RCC_AHB1Periph_GPIOA
#define CAN_1_AF_PORT				GPIO_AF_CAN1
#define CAN_1_RX_SOURCE				GPIO_PinSource11 
#define CAN_1_TX_SOURCE				GPIO_PinSource12

///CAN2
#define CAN_2_INT_ID				BSP_INT_ID_CAN2_TX

#define CAN_2						CAN2
#define CAN_2_CLK					(RCC_APB1Periph_CAN1 | RCC_APB1Periph_CAN2)
#define CAN_2_RX_PIN				GPIO_Pin_12
#define CAN_2_TX_PIN				GPIO_Pin_13
#define CAN_2_RX_GPIO_PORT			GPIOB
#define CAN_2_TX_GPIO_PORT			GPIOB
#define CAN_2_RX_GPIO_CLK			RCC_AHB1Periph_GPIOB
#define CAN_2_TX_GPIO_CLK			RCC_AHB1Periph_GPIOB
#define CAN_2_AF_PORT				GPIO_AF_CAN2
#define CAN_2_RX_SOURCE				GPIO_PinSource12
#define CAN_2_TX_SOURCE				GPIO_PinSource13 




void BSP_InitCan(CAN_TypeDef* CANx, CAN_InitTypeDef *CanInit, CAN_FilterInitTypeDef *FilterInit);




#endif///EOF



