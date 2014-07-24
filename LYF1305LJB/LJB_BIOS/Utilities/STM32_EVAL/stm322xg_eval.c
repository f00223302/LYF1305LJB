/*
	FileName : stm3xg_eval.c
	Description :
	Created on 2013.01.18 by ZZP.

	Revision History:

*/



/**
  ******************************************************************************
  * @file    stm322xg_eval.c
  * @author  MCD Application Team
  * @version V4.6.1
  * @date    18-April-2011
  * @brief   This file provides
  *            - set of firmware functions to manage Leds, push-button and COM ports
  *            - low level initialization functions for SD card (on SDIO) and
  *              serial EEPROM (sEE)
  *          available on STM322xG-EVAL evaluation board(MB786) RevA and RevB 
  *          from STMicroelectronics.
  *
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
  ******************************************************************************
  */ 
  
/* Includes ------------------------------------------------------------------*/
#include "stm32f2xx.h"
#include "core_cm3.h"
#include "stm322xg_eval.h"
#include "stm32f2xx_sdio.h"
#include "stm32f2xx_dma.h"
#include "stm32f2xx_i2c.h"
#include "stm32f2xx_gpio.h"
#include "stm32f2xx_rcc.h"
#include "stm32f2xx_exti.h"
#include "misc.h"
#include "stm32f2xx_syscfg.h"

#include "F205_USART.h"







#define TIMEOUT_MAX              10000 /* Maximum timeout value */


/** @defgroup STM322xG_EVAL_LOW_LEVEL_Private_Variables
  * @{
  */ 
GPIO_TypeDef* GPIO_PORT[LEDn] = {	LED1_GPIO_PORT, LED2_GPIO_PORT, LED3_GPIO_PORT, LED4_GPIO_PORT, 
									LED5_GPIO_PORT, LED6_GPIO_PORT, LED7_GPIO_PORT, LED8_GPIO_PORT,
									LED9_GPIO_PORT, LED10_GPIO_PORT,LED11_GPIO_PORT, LED12_GPIO_PORT};
const uint16_t GPIO_PIN[LEDn] = {	LED1_PIN, 		LED2_PIN, 		LED3_PIN, 		LED4_PIN, 
									LED5_PIN, 		LED6_PIN,		LED7_PIN, 		LED8_PIN,
									LED9_PIN, 		LED10_PIN,      LED11_PIN,      LED12_PIN};
const uint32_t GPIO_CLK[LEDn] = {	LED1_GPIO_CLK, 	LED2_GPIO_CLK, 	LED3_GPIO_CLK,	LED4_GPIO_CLK, 
									LED5_GPIO_CLK, 	LED6_GPIO_CLK,	LED7_GPIO_CLK, 	LED8_GPIO_CLK,
									LED9_GPIO_CLK,	LED10_GPIO_CLK, LED11_GPIO_CLK, LED12_GPIO_CLK};


USART_TypeDef* COM_USART[COMn] = {EVAL_COM1, EVAL_COM2}; 

GPIO_TypeDef* COM_TX_PORT[COMn] = {EVAL_COM1_TX_GPIO_PORT, EVAL_COM2_TX_GPIO_PORT};
 
GPIO_TypeDef* COM_RX_PORT[COMn] = {EVAL_COM1_RX_GPIO_PORT, EVAL_COM2_RX_GPIO_PORT};

const uint32_t COM_USART_CLK[COMn] = {EVAL_COM1_CLK, EVAL_COM2_CLK};

const uint32_t COM_TX_PORT_CLK[COMn] = {EVAL_COM1_TX_GPIO_CLK, EVAL_COM2_TX_GPIO_CLK};
 
const uint32_t COM_RX_PORT_CLK[COMn] = {EVAL_COM1_RX_GPIO_CLK, EVAL_COM2_RX_GPIO_CLK};

const uint16_t COM_TX_PIN[COMn] = {EVAL_COM1_TX_PIN, EVAL_COM2_TX_PIN};

const uint16_t COM_RX_PIN[COMn] = {EVAL_COM1_RX_PIN, EVAL_COM2_RX_PIN};
 
const uint8_t COM_TX_PIN_SOURCE[COMn] = {EVAL_COM1_TX_SOURCE, EVAL_COM2_TX_SOURCE};

const uint8_t COM_RX_PIN_SOURCE[COMn] = {EVAL_COM1_RX_SOURCE, EVAL_COM2_RX_SOURCE};
 
const uint8_t COM_TX_AF[COMn] = {EVAL_COM1_TX_AF, EVAL_COM2_TX_AF};
 
const uint8_t COM_RX_AF[COMn] = {EVAL_COM1_RX_AF, EVAL_COM2_RX_AF};

const uint8_t COM_IRQn[COMn] = {EVAL_COM1_IRQn, EVAL_COM2_IRQn};

const uint32_t USART_DATA_REG_ADDR[COMn] = {USART6_DATA_REG_ADDR, USART1_DATA_REG_ADDR}; 


void F205_UsartDMAConfig(COM_TypeDef COM, USART_BufDef *USART_BufStruct);

/**
  * @}
  */ 


/**
  * @brief  Configures LED GPIO.
  * @param  Led: Specifies the Led to be configured. 
  *   This parameter can be one of following parameters:
  *     @arg LED1
  *     @arg LED2
  *     @arg LED3
  * @retval None
  */
void STM_EVAL_LEDInit(Led_TypeDef Led)
{
  	GPIO_InitTypeDef  GPIO_InitStructure;
  
  	/* Enable the GPIO_LED Clock */
  	RCC_AHB1PeriphClockCmd(GPIO_CLK[Led], ENABLE);


  	/* Configure the GPIO_LED pin */
  	GPIO_InitStructure.GPIO_Pin = GPIO_PIN[Led];
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  	GPIO_Init(GPIO_PORT[Led], &GPIO_InitStructure);
}

/**
  * @brief  Turns selected LED On.
  * @param  Led: Specifies the Led to be set on. 
  *   This parameter can be one of following parameters:
  *     @arg LED1
  *     @arg LED2
  *     @arg LED3
  * @retval None
  */
void STM_EVAL_LEDOff(Led_TypeDef Led)
{
  	GPIO_PORT[Led]->BSRRH = GPIO_PIN[Led];
}

/**
  * @brief  Turns selected LED Off.
  * @param  Led: Specifies the Led to be set off. 
  *   This parameter can be one of following parameters:
  *     @arg LED1
  *     @arg LED2
  *     @arg LED3
  * @retval None
  */
void STM_EVAL_LEDOn(Led_TypeDef Led)
{
  	GPIO_PORT[Led]->BSRRL = GPIO_PIN[Led]; 
}

/**
  * @brief  Toggles the selected LED.
  * @param  Led: Specifies the Led to be toggled. 
  *   This parameter can be one of following parameters:
  *     @arg LED1
  *     @arg LED2
  *     @arg LED3
  * @retval None
  */
void STM_EVAL_LEDToggle(Led_TypeDef Led)
{
  	GPIO_PORT[Led]->ODR ^= GPIO_PIN[Led];
}




/**
  * @brief  Configures COM port.
  * @param  COM: Specifies the COM port to be configured.
  *   This parameter can be one of following parameters:    
  *     @arg COM1
  *     @arg COM2  
  * @param  USART_InitStruct: pointer to a USART_InitTypeDef structure that
  *   contains the configuration information for the specified USART peripheral.
  * @retval None
  */
void STM_EVAL_COMInit(COM_TypeDef COM, USART_InitTypeDef* USART_InitStruct, USART_BufDef *USART_BufStruct)
{
  	GPIO_InitTypeDef GPIO_InitStructure;
  	NVIC_InitTypeDef NVIC_InitStructure;

  	/* Enable GPIO clock */
  	RCC_AHB1PeriphClockCmd(COM_TX_PORT_CLK[COM] | COM_RX_PORT_CLK[COM], ENABLE);

	if ((COM == COM1) || (COM == COM2))
  	{
    	/* Enable UART clock */
    	RCC_APB2PeriphClockCmd(COM_USART_CLK[COM], ENABLE);
  	}

  	/* Connect PXx to USARTx_Tx*/
  	GPIO_PinAFConfig(COM_TX_PORT[COM], COM_TX_PIN_SOURCE[COM], COM_TX_AF[COM]);

  	/* Connect PXx to USARTx_Rx*/
  	GPIO_PinAFConfig(COM_RX_PORT[COM], COM_RX_PIN_SOURCE[COM], COM_RX_AF[COM]);

  	/* Configure USART Tx as alternate function  */
  	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;

  	GPIO_InitStructure.GPIO_Pin = COM_TX_PIN[COM];
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  	GPIO_Init(COM_TX_PORT[COM], &GPIO_InitStructure);

  	/* Configure USART Rx as alternate function  */
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  	GPIO_InitStructure.GPIO_Pin = COM_RX_PIN[COM];
  	GPIO_Init(COM_RX_PORT[COM], &GPIO_InitStructure);


  	///F205: 为得到高速率，需要8x采样：
  	USART_OverSampling8Cmd(COM_USART[COM], DISABLE);

  	/* USART configuration */
  	USART_Init(COM_USART[COM], USART_InitStruct);


  	///允许NVIC：	
  	/* Configure the preemption priority and subpriority:
     	- 1 bits for pre-emption priority: possible value are 0 or 1 
     	- 3 bits for subpriority: possible value are 0..7
     	- Lower values gives higher priority  
   	*/
  	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);  
  	/* Enable the WAKEUP_BUTTON_EXTI_IRQn Interrupt */
  	NVIC_InitStructure.NVIC_IRQChannel = COM_IRQn[COM];//EVAL_COM1_IRQn
  	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x00;
  	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x00;
  	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  	NVIC_Init(&NVIC_InitStructure);

  	///F205: 允许发送完成中断和接收中断
  	USART_ITConfig(COM_USART[COM], USART_IT_TC, 	ENABLE);
	USART_ClearITPendingBit(COM_USART[COM], USART_IT_TC);
	USART_ITConfig(COM_USART[COM], USART_IT_RXNE, 	ENABLE);
	USART_ITConfig(COM_USART[COM], USART_IT_ORE,	ENABLE);

  

  	///F205: 配置 DMA
#if (USART_TX_USE_DMA)
  	F205_UsartDMAConfig(COM, USART_BufStruct);
#if (USART_TX_DMA_INTERRUPT_EN)
	///NVIC_PriorityGroupConfig(NVIC_PriorityGroup_1);
  	NVIC_InitStructure.NVIC_IRQChannel = DMA_IRQn;
  	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
  	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
  	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  	NVIC_Init(&NVIC_InitStructure);	
  	///允许发送DMA中断
	//DMA_ITConfig(DMA_Stream, DMA_IT_FE, ENABLE);
	DMA_ITConfig(DMA_Stream, DMA_IT_TC, ENABLE);
	DMA_ClearFlag(DMA_Stream, DMA_FLAG_TCIF);
#endif
#endif
    
  	/* Enable USART */
  	USART_Cmd(COM_USART[COM], ENABLE);
}

#if (USART_TX_USE_DMA)
void F205_UsartDMAConfig(COM_TypeDef COM, USART_BufDef *USART_BufStruct)
{
	//	NVIC_InitTypeDef NVIC_InitStructure;
	DMA_InitTypeDef DMA_InitStructure;
	__IO uint32_t    Timeout = TIMEOUT_MAX;

	/* Enable DMA clock */
  	RCC_AHB1PeriphClockCmd(DMA_Periph, ENABLE); 	

	///接收数据：由于不知道数据长度，不采用 DMA 方式

	/// Reset DMA Stream registers (for debug purpose)
  	DMA_DeInit(DMA_Stream);

  	/* Check if the DMA Stream is disabled before enabling it.
     	Note that this step is useful when the same Stream is used multiple times:
     	enabled, then disabled then re-enabled... In this case, the DMA Stream disable
     	will be effective only at the end of the ongoing data transfer and it will 
     	not be possible to re-configure it before making sure that the Enable bit 
     	has been cleared by hardware. If the Stream is used only once, this step might 
     	be bypassed. */
  	
	while (DMA_GetCmdStatus(DMA_Stream) != DISABLE){}


	///USART6 TX : DMA2 Channel 5, stream 7
	DMA_InitStructure.DMA_Channel = DMA_Ch;

	///USART1 TX : DMA2 Channel 4, stream 7
//	DMA_InitStructure.DMA_Channel = USART1_DMA_CHANNEL;

	DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)&(USART_BufStruct->TxBuf[0]);
  	DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)USART_DATA_REG_ADDR[COM];
  	DMA_InitStructure.DMA_DIR = DMA_DIR_MemoryToPeripheral;
  	DMA_InitStructure.DMA_BufferSize = 0;
  	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
  	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
  	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
  	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
  	DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;///DMA_Mode_Circular;
  	DMA_InitStructure.DMA_Priority = DMA_Priority_High;
  	DMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Disable;         
  	DMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_Full;
  	DMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_Single;
  	DMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_Single;
  	DMA_Init(DMA_Stream, &DMA_InitStructure);

	///允许USART_TX_DMA：
	USART_DMACmd(COM_USART[COM], USART_DMAReq_Tx, ENABLE);
	 
	///此时不允许 USART6 TX DMA
  	DMA_Cmd(DMA_Stream, DISABLE);
}
#endif


void F205_DisablePeripherals(COM_TypeDef COM)
{
	NVIC_InitTypeDef NVIC_InitStructure;

	///F205: 禁止接收中断
  	USART_ITConfig(COM_USART[COM], USART_IT_TC, 	DISABLE);
	USART_ITConfig(COM_USART[COM], USART_IT_RXNE, 	DISABLE);
	USART_ITConfig(COM_USART[COM], USART_IT_ORE,	DISABLE);

	///禁止DMA 中断
	DMA_ITConfig(DMA_Stream, DMA_IT_FE, DISABLE);
	DMA_ITConfig(DMA_Stream, DMA_IT_TC, DISABLE);

	NVIC_InitStructure.NVIC_IRQChannel = DMA_IRQn;
  	NVIC_InitStructure.NVIC_IRQChannelCmd = DISABLE;
  	NVIC_Init(&NVIC_InitStructure);	

	NVIC_InitStructure.NVIC_IRQChannel = COM_IRQn[COM]; //EVAL_COM1_IRQn
  	NVIC_InitStructure.NVIC_IRQChannelCmd = DISABLE;
  	NVIC_Init(&NVIC_InitStructure);
  
  	/* Disable USART */
  	USART_Cmd(COM_USART[COM], DISABLE);
		 
	///禁止 USART6 TX DMA
  	DMA_Cmd(DMA_Stream, DISABLE);

	/* Disable DMA clock */
  	RCC_AHB1PeriphClockCmd(DMA_Periph, DISABLE);
	///Disable USART6 clock
	RCC_APB1PeriphClockCmd(COM_USART_CLK[COM], DISABLE);

	///关闭 SysTick
	SysTick->CTRL  = 0;                    /* Disable SysTick IRQ and SysTick Timer */

}

void Delay(uint32_t dlyTm)
{
	uint32_t i;

	for (i = 0; i < dlyTm; i++){
		__NOP();
	}
}









    
/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
