/*
	FileName : stm32f2xx_it.c
	Description :
	Created on 2013.01.18 by ZZP.

	Revision History:

*/



/**
  ******************************************************************************
  * @file    ADC/DualADC_RegulSimu_DMAmode1/stm32f2xx_it.c 
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    18-April-2011
  * @brief   Main Interrupt Service Routines.
  *          This file provides template for all exceptions handler and 
  *          peripherals interrupt service routine.
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
#include "stm32f2xx_it.h"
#include "stm322xg_eval.h"
#include "F205_usart.h"
#include "stm32f2xx.h"
#include "F205_Gpio.h"


extern void F205_SysTickFunc(void);


__IO uint16_t USART_RxIndex = 0;


/** @addtogroup STM32F2xx_StdPeriph_Examples
  * @{
  */

/** @addtogroup ADC_DualADC_RegulSimu_DMAmode1
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/******************************************************************************/
/*            Cortex-M3 Processor Exceptions Handlers                         */
/******************************************************************************/

/**
  * @brief   This function handles NMI exception.
  * @param  None
  * @retval None
  */
void NMI_Handler(void)
{
}

/**
  * @brief  This function handles Hard Fault exception.
  * @param  None
  * @retval None
  */
void HardFault_Handler(void)
{
  /* Go to infinite loop when Hard Fault exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles Memory Manage exception.
  * @param  None
  * @retval None
  */
void MemManage_Handler(void)
{
  /* Go to infinite loop when Memory Manage exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles Bus Fault exception.
  * @param  None
  * @retval None
  */
void BusFault_Handler(void)
{
  /* Go to infinite loop when Bus Fault exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles Usage Fault exception.
  * @param  None
  * @retval None
  */
void UsageFault_Handler(void)
{
  /* Go to infinite loop when Usage Fault exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles SVCall exception.
  * @param  None
  * @retval None
  */
void SVC_Handler(void)
{
}

/**
  * @brief  This function handles Debug Monitor exception.
  * @param  None
  * @retval None
  */
void DebugMon_Handler(void)
{
}

/**
  * @brief  This function handles PendSVC exception.
  * @param  None
  * @retval None
  */
void PendSV_Handler(void)
{
}

/**
  * @brief  This function handles SysTick Handler.
  * @param  None
  * @retval None
  */
void SysTick_Handler(void)
{
	F205_SysTickFunc();
}

/******************************************************************************/
/*                 STM32F2xx Peripherals Interrupt Handlers                   */
/*  Add here the Interrupt Handler for the used peripheral(s) (PPP), for the  */
/*  available peripheral interrupt handler's name please refer to the startup */
/*  file (startup_stm32f2xx.s).                                               */
/******************************************************************************/

/**
  * @brief  This function handles PPP interrupt request.
  * @param  None
  * @retval None
  */
/*void PPP_IRQHandler(void)
{
}*/


/****************************************
 USART1 added by me 2014 02 28 
***************************************/

#if 0

///USART1 只使用 RX 中断，TX 由 DMA 管理
void USART1_IRQHandler(void)
{
	uint32_t status;

	status = USART1->SR;

	if (status & 0x28){

		///RXNE
		//if (status & 0x20) 
		//	USART_ClearITPendingBit(USART1, USART_IT_RXNE);   
		///ORE
		if (status & 0x08)
			USART_ClearITPendingBit(USART1, USART_IT_ORE); 

		///if (status & 0x20)
		{

			///数据放入缓冲区：
			USART_tmpRxBuf[USART_RxIndex] = USART_ReceiveData(USART1) & 0xff;
			USART_RxIndex++;
			USART_RxIndex &= USART_RX_BUF_MASK;
		}
	}

	///TXC
	if (status & 0x40){

		USART_ClearITPendingBit(USART1, USART_IT_TC);         /* Clear the USART1 Transmit interrupt.                */
#if (USART_TX_USE_DMA)
		///关闭发送控制
		F205_DisableUsartTx();
#endif
		//设置完成标志：
		MyInfo.TxRdy = 1;
	}
}

#endif

#if 1
///USART6 只使用 RX 中断，TX 由 DMA 管理
void USART6_IRQHandler(void)
{
	uint32_t status;

	status = USART6->SR;

	if (status & 0x28){

		///RXNE
		//if (status & 0x20) 
		//	USART_ClearITPendingBit(USART1, USART_IT_RXNE);   
		///ORE
		if (status & 0x08)
			USART_ClearITPendingBit(USART6, USART_IT_ORE); 

		///if (status & 0x20)
		{

			///数据放入缓冲区：
			USART_tmpRxBuf[USART_RxIndex] = USART_ReceiveData(USART6) & 0xff;
			USART_RxIndex++;
			USART_RxIndex &= USART_RX_BUF_MASK;
		}
	}

	///TXC
	if (status & 0x40){

		USART_ClearITPendingBit(USART6, USART_IT_TC);         /* Clear the USART1 Transmit interrupt.                */
#if (USART_TX_USE_DMA)
		///关闭发送控制
		F205_DisableUsartTx();
#endif
		//设置完成标志：
		MyInfo.TxRdy = 1;
	}
}

#endif

#if (USART_TX_USE_DMA)
#if (USART_TX_DMA_INTERRUPT_EN)
///DMA2 Stream7 中断服务程序：
void DMA2_Stream7_IRQHandler(void)
{
	uint32_t  status;

	status = DMA2->HISR;

	///DMA 传送完成
	if (status & 0x08000000){

		DMA_ClearITPendingBit(DMA2_Stream7, DMA_IT_TCIF7);
		
	}

	///DMA 传送错误
	if (status & 0x02000000)
		DMA_ClearITPendingBit(DMA2_Stream7, DMA_FLAG_TEIF7);	

	///DMA FIFO 错误
	if (status & 0x00400000)
		DMA_ClearITPendingBit(DMA2_Stream7, DMA_FLAG_FEIF7);
}
#endif
#endif





/**
  * @}
  */ 

/**
  * @}
  */ 

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
