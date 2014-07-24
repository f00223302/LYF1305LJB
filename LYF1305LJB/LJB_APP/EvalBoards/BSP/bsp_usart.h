/*
	FileName : bsp_usart.h
	Description : 
		usart BSP file.
	Created on 2013.07.30 by ZZP.

	Revision History:

*/

#ifndef __BSP_USART_H__
#define __BSP_USART_H__

#include "core_cm3.h"
#include "stm32f2xx.h"
#include "ucos_ii.h"







/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/// 					以下内容一般无需更改
/// 如果串口资源或 DMA 分配在不同的位置，则可更改定义
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
///串口数量
#define COMn		6

/////////////////////////////////////////////////////
///				COM names
/////////////////////////////////////////////////////
typedef enum  {
	COM1 = 0,
	COM2,
	COM3,
	COM4,
	COM5,
	COM6
} COM_TypeDef;

//////////////////////////////////////////////////////
///			USART DMA intformation structure
//////////////////////////////////////////////////////
typedef struct{
	DMA_Stream_TypeDef *stream;
	uint32_t	DataRegAddr;
	uint32_t	DMA_Channel;
	uint32_t	DMA_ItTCIF;
	uint32_t	DMA_ItTEIF;
	uint32_t	DMA_ItFEIF;
	uint32_t	DMA_FlagTCIF;
	uint16_t	DMA_Int_ID;
}USART_DMA, *pUSART_DMA;






/////////////////////////////////////////////////////////////
///			USART1
/////////////////////////////////////////////////////////////
#define PRD_COM1                        USART1
#define PRD_COM1_CLK                    RCC_APB2Periph_USART1
#define PRD_COM1_TX_PIN                 GPIO_Pin_9
#define PRD_COM1_TX_GPIO_PORT           GPIOA
#define PRD_COM1_TX_GPIO_CLK            RCC_AHB1Periph_GPIOA
#define PRD_COM1_TX_SOURCE              GPIO_PinSource9
#define PRD_COM1_TX_AF                  GPIO_AF_USART1
#define PRD_COM1_RX_PIN                 GPIO_Pin_10
#define PRD_COM1_RX_GPIO_PORT           GPIOA
#define PRD_COM1_RX_GPIO_CLK            RCC_AHB1Periph_GPIOA
#define PRD_COM1_RX_SOURCE              GPIO_PinSource10
#define PRD_COM1_RX_AF                  GPIO_AF_USART1

///product : USART1 data register address:
#define USART1_DATA_REG_ADDR			(USART1_BASE + 0x04)



///USART1 DMA stream
#define USART1_DMA_STREAM				DMA2_Stream7
///USART1 DMA channel
#define USART1_DMA_CHANNEL				DMA_Channel_4
///USART1 DMA TCIF
#define USART1_DMA_IT_TCIF				DMA_IT_TCIF7
///USART1 DMA TEIF
#define USART1_DMA_IT_TEIF				DMA_IT_TEIF7
///USART1 DMA FEIF
#define USART1_DMA_IT_FEIF				DMA_IT_FEIF7
//
#define USART1_DMA_FLAG_TCIF			DMA_FLAG_TCIF7
///
#define USART1_DMA_INT_ID				BSP_INT_ID_DMA2_STREAM7
///
#define USART1_INT_ID					BSP_INT_ID_USART1


/////////////////////////////////////////////////////////////
///			USART2
/////////////////////////////////////////////////////////////
#define PRD_COM2                        USART2
#define PRD_COM2_CLK                    RCC_APB1Periph_USART2
#define PRD_COM2_TX_PIN                 GPIO_Pin_2
#define PRD_COM2_TX_GPIO_PORT           GPIOA
#define PRD_COM2_TX_GPIO_CLK            RCC_AHB1Periph_GPIOA
#define PRD_COM2_TX_SOURCE              GPIO_PinSource2
#define PRD_COM2_TX_AF                  GPIO_AF_USART2
#define PRD_COM2_RX_PIN                 GPIO_Pin_3
#define PRD_COM2_RX_GPIO_PORT           GPIOA
#define PRD_COM2_RX_GPIO_CLK            RCC_AHB1Periph_GPIOA
#define PRD_COM2_RX_SOURCE              GPIO_PinSource3
#define PRD_COM2_RX_AF                  GPIO_AF_USART2

///product : USART1 data register address:
#define USART2_DATA_REG_ADDR			(USART2_BASE + 0x04)


///USART2 DMA stream
#define USART2_DMA_STREAM				DMA1_Stream6
///USART2 DMA channel
#define USART2_DMA_CHANNEL				DMA_Channel_4
///USART2 DMA TCIF
#define USART2_DMA_IT_TCIF				DMA_IT_TCIF6
///USART2 DMA TEIF
#define USART2_DMA_IT_TEIF				DMA_IT_TEIF6
///USART2 DMA FEIF
#define USART2_DMA_IT_FEIF				DMA_IT_FEIF6
//
#define USART2_DMA_FLAG_TCIF			DMA_FLAG_TCIF6
///
#define USART2_DMA_INT_ID				BSP_INT_ID_DMA1_STREAM6
///
#define USART2_INT_ID					BSP_INT_ID_USART2


/////////////////////////////////////////////////////////////
///			USART3
/////////////////////////////////////////////////////////////
#define PRD_COM3                        USART3
#define PRD_COM3_CLK                    RCC_APB1Periph_USART3
#define PRD_COM3_TX_PIN                 GPIO_Pin_10
#define PRD_COM3_TX_GPIO_PORT           GPIOB
#define PRD_COM3_TX_GPIO_CLK            RCC_AHB1Periph_GPIOB
#define PRD_COM3_TX_SOURCE              GPIO_PinSource10
#define PRD_COM3_TX_AF                  GPIO_AF_USART3
#define PRD_COM3_RX_PIN                 GPIO_Pin_11
#define PRD_COM3_RX_GPIO_PORT           GPIOB
#define PRD_COM3_RX_GPIO_CLK            RCC_AHB1Periph_GPIOB
#define PRD_COM3_RX_SOURCE              GPIO_PinSource11
#define PRD_COM3_RX_AF                  GPIO_AF_USART3

///product : USART1 data register address:
#define USART3_DATA_REG_ADDR			(USART3_BASE + 0x04)


///USART3 DMA stream
#define USART3_DMA_STREAM				DMA1_Stream3
///USART3 DMA channel
#define USART3_DMA_CHANNEL				DMA_Channel_4
///USART3 DMA TCIF
#define USART3_DMA_IT_TCIF				DMA_IT_TCIF3
///USART3 DMA TEIF
#define USART3_DMA_IT_TEIF				DMA_IT_TEIF3
///USART3 DMA FEIF
#define USART3_DMA_IT_FEIF				DMA_IT_FEIF3
//
#define USART3_DMA_FLAG_TCIF			DMA_FLAG_TCIF3
///
#define USART3_DMA_INT_ID				BSP_INT_ID_DMA1_STREAM3
///
#define USART3_INT_ID					BSP_INT_ID_USART3



////////////////////////////////////////////////////////////
///			USART4
////////////////////////////////////////////////////////////
#define PRD_COM4                        UART4
#define PRD_COM4_CLK                    RCC_APB1Periph_UART4
#define PRD_COM4_TX_PIN                 GPIO_Pin_10
#define PRD_COM4_TX_GPIO_PORT           GPIOC
#define PRD_COM4_TX_GPIO_CLK            RCC_AHB1Periph_GPIOC
#define PRD_COM4_TX_SOURCE              GPIO_PinSource10
#define PRD_COM4_TX_AF                  GPIO_AF_UART4
#define PRD_COM4_RX_PIN                 GPIO_Pin_11
#define PRD_COM4_RX_GPIO_PORT           GPIOC
#define PRD_COM4_RX_GPIO_CLK            RCC_AHB1Periph_GPIOC
#define PRD_COM4_RX_SOURCE              GPIO_PinSource11
#define PRD_COM4_RX_AF                  GPIO_AF_UART4

///product : USART4 data register address:
#define USART4_DATA_REG_ADDR			(UART4_BASE + 0x04)


///USART4 DMA stream
#define USART4_DMA_STREAM				DMA1_Stream4
///USART4 DMA channel
#define USART4_DMA_CHANNEL				DMA_Channel_4
///USART4 DMA TCIF
#define USART4_DMA_IT_TCIF				DMA_IT_TCIF4
//
#define USART4_DMA_FLAG_TCIF			DMA_FLAG_TCIF4
///USART4 DMA TEIF
#define USART4_DMA_IT_TEIF				DMA_IT_TEIF4
///USART4 DMA FEIF
#define USART4_DMA_IT_FEIF				DMA_IT_FEIF4
///
#define USART4_DMA_INT_ID				BSP_INT_ID_DMA1_STREAM4
///
#define USART4_INT_ID					BSP_INT_ID_USART4


////////////////////////////////////////////////////////////
///			USART5
////////////////////////////////////////////////////////////
#define PRD_COM5                        UART5
#define PRD_COM5_CLK                    RCC_APB1Periph_UART5
#define PRD_COM5_TX_PIN                 GPIO_Pin_12
#define PRD_COM5_TX_GPIO_PORT           GPIOC
#define PRD_COM5_TX_GPIO_CLK            RCC_AHB1Periph_GPIOC
#define PRD_COM5_TX_SOURCE              GPIO_PinSource12
#define PRD_COM5_TX_AF                  GPIO_AF_UART5
#define PRD_COM5_RX_PIN                 GPIO_Pin_2
#define PRD_COM5_RX_GPIO_PORT           GPIOD
#define PRD_COM5_RX_GPIO_CLK            RCC_AHB1Periph_GPIOD
#define PRD_COM5_RX_SOURCE              GPIO_PinSource2
#define PRD_COM5_RX_AF                  GPIO_AF_UART5

///product : USART5 data register address:
#define USART5_DATA_REG_ADDR			(UART5_BASE + 0x04)


///USART5 DMA stream
#define USART5_DMA_STREAM				DMA1_Stream7
///USART5 DMA channel
#define USART5_DMA_CHANNEL				DMA_Channel_4
///USART5 DMA TCIF
#define USART5_DMA_IT_TCIF				DMA_IT_TCIF7
///USART5 DMA TEIF
#define USART5_DMA_IT_TEIF				DMA_IT_TEIF7
///USART5 DMA FEIF
#define USART5_DMA_IT_FEIF				DMA_IT_FEIF7
//
#define USART5_DMA_FLAG_TCIF			DMA_FLAG_TCIF7
///
#define USART5_DMA_INT_ID				BSP_INT_ID_DMA1_STREAM7
///
#define USART5_INT_ID					BSP_INT_ID_USART5


/////////////////////////////////////////////////////////////
///			USART6
/////////////////////////////////////////////////////////////
#define PRD_COM6                        USART6
#define PRD_COM6_CLK                    RCC_APB2Periph_USART6
#define PRD_COM6_TX_PIN                 GPIO_Pin_6
#define PRD_COM6_TX_GPIO_PORT           GPIOC
#define PRD_COM6_TX_GPIO_CLK            RCC_AHB1Periph_GPIOC
#define PRD_COM6_TX_SOURCE              GPIO_PinSource6
#define PRD_COM6_TX_AF                  GPIO_AF_USART6
#define PRD_COM6_RX_PIN                 GPIO_Pin_7
#define PRD_COM6_RX_GPIO_PORT           GPIOC
#define PRD_COM6_RX_GPIO_CLK            RCC_AHB1Periph_GPIOC
#define PRD_COM6_RX_SOURCE              GPIO_PinSource7
#define PRD_COM6_RX_AF                  GPIO_AF_USART6

///product : USART6 data register address:
#define USART6_DATA_REG_ADDR			(USART6_BASE + 0x04)


///USART6 DMA stream
#define USART6_DMA_STREAM				DMA2_Stream6
///USART6 DMA channel
#define USART6_DMA_CHANNEL				DMA_Channel_5
///USART6 DMA TCIF
#define USART6_DMA_IT_TCIF				DMA_IT_TCIF6
///USART6 DMA TEIF
#define USART6_DMA_IT_TEIF				DMA_IT_TEIF6
///USART6 DMA FEIF
#define USART6_DMA_IT_FEIF				DMA_IT_FEIF6
//
#define USART6_DMA_FLAG_TCIF			DMA_FLAG_TCIF6
///
#define USART6_DMA_INT_ID				BSP_INT_ID_DMA2_STREAM6
///
#define USART6_INT_ID					BSP_INT_ID_USART6



////////////////////////////////////////////////////////////
///			USART variables
////////////////////////////////////////////////////////////
extern USART_TypeDef* 	COM_USART[COMn];
extern OS_EVENT*		Sem_UsartTxRdy[COMn];




///////////////////////////////////////////////////////////
///			USART global functions
///////////////////////////////////////////////////////////
void BSP_USART_Init(COM_TypeDef COM, USART_InitTypeDef* USART_InitStruct, uint8_t MultiMode, uint8_t Addr);
void BSP_USART_TxData(COM_TypeDef COM, uint16_t len);
uint8_t BSP_GetUsartTxStatus(COM_TypeDef COM);


#endif
