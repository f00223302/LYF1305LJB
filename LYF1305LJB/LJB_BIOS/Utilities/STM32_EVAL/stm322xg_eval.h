/**
  ******************************************************************************
  * @file    stm322xg_eval.h
  * @author  MCD Application Team
  * @version V4.6.1
  * @date    18-April-2011
  * @brief   This file contains definitions for STM322xG_EVAL's Leds, push-buttons
  *          and COM ports hardware resources.
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
  
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM322xG_EVAL_H
#define __STM322xG_EVAL_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f2xx_dma.h"
#include "stm32f2xx_i2c.h"
#include "stm32f2xx_usart.h"

#include "F205_USART.h"
	 
///Board Address
#if defined JLB_CPU_SAMPLE
	#define CPU_F205_ADDRESS		0x21
#elif defined JLB_CPU_CONTROL
	#define CPU_F205_ADDRESS		0x20
#elif defined JMB_CPU_MAIN			
	 #define CPU_F205_ADDRESS		0x30
#elif defined LJB_CPU			
	 #define CPU_F205_ADDRESS		0x50
#else
	#error "在项目属性-C/C++ 页中定义板名称"
#endif


///软件日期
#define F205_BIOS_MAIN_VER		0x10
#define F205_BIOS_SUB_VER		0x00
#define F205_BIOS_YEAR			0x13//0x14
#define F205_BIOS_MONTH	     	0x10//0x05
#define F205_BIOS_DATE			0x10//0x07

//Started Added by me 20140718
//内部软件版本信息
#define INTERNAL_BIOS_MAIN_VER		0x10
#define INTERNAL_BIOS_SUB_VER		0x00
#define INTERNAL_BIOS_YEAR			0x14
#define INTERNAL_BIOS_MONTH	     	0x07
#define INTERNAL_BIOS_DATE			0x18
//End Added by me 20140718
   
///是否采用 DMA 发送 USART 数据
#define USART_TX_USE_DMA				1

#if (USART_TX_USE_DMA)
#define USART_TX_DMA_INTERRUPT_EN		1
#endif

/** @LED1,LED2,LED3 and LED4 are maped to LED6,LED7,LED8 and LED9 on the DevKit1207 Evaluation Board.
  * @{ F205ZDC: LED定义
  */
#define LEDn                             12
////////////////////////////////////////////////////////////////////
///CPU_SAMPLE LEDs:
////////////////////////////////////////////////////////////////////
///COM LED
#define LED1_PIN                         GPIO_Pin_8
#define LED1_GPIO_PORT                   GPIOA
#define LED1_GPIO_CLK                    RCC_AHB1Periph_GPIOA

/*******************************PA9、10用作usart1的管脚**************************/
#if 1
///CAN LED  
#define LED2_PIN                         GPIO_Pin_7//GPIO_Pin_9
#define LED2_GPIO_PORT                   GPIOA
#define LED2_GPIO_CLK                    RCC_AHB1Periph_GPIOA

///TAX LED  
#define LED3_PIN                         GPIO_Pin_6//GPIO_Pin_10
#define LED3_GPIO_PORT                   GPIOA
#define LED3_GPIO_CLK                    RCC_AHB1Periph_GPIOA

#endif

////////////////////////////////////////////////////////////////////
///CPU_MAIN LEDs:
////////////////////////////////////////////////////////////////////
///Work LED
#define LED4_PIN                         GPIO_Pin_7
#define LED4_GPIO_PORT                   GPIOF
#define LED4_GPIO_CLK                    RCC_AHB1Periph_GPIOF

///ERR LED
#define LED5_PIN                         GPIO_Pin_8
#define LED5_GPIO_PORT                   GPIOF
#define LED5_GPIO_CLK                    RCC_AHB1Periph_GPIOF

///copy LED
#define LED6_PIN                         GPIO_Pin_9
#define LED6_GPIO_PORT                   GPIOF
#define LED6_GPIO_CLK                    RCC_AHB1Periph_GPIOF

///CFG LED
#define LED7_PIN                         GPIO_Pin_10
#define LED7_GPIO_PORT                   GPIOF
#define LED7_GPIO_CLK                    RCC_AHB1Periph_GPIOF

///misc LED
#define LED8_PIN                         GPIO_Pin_11
#define LED8_GPIO_PORT                   GPIOF
#define LED8_GPIO_CLK                    RCC_AHB1Periph_GPIOF


////////////////////////////////////////////////////////////////////
///JMB LEDs:
////////////////////////////////////////////////////////////////////
///BLNK LED
#define LED9_PIN                         GPIO_Pin_7
#define LED9_GPIO_PORT                   GPIOA
#define LED9_GPIO_CLK                    RCC_AHB1Periph_GPIOA


////////////////////////////////////////////////////////////////////
///LJB LEDs:
////////////////////////////////////////////////////////////////////
//BIOS升级APP时工作的LED
#define LED10_PIN                         GPIO_Pin_10
#define LED10_GPIO_PORT                   GPIOC
#define LED10_GPIO_CLK                    RCC_AHB1Periph_GPIOC

#define LED11_PIN                         GPIO_Pin_11
#define LED11_GPIO_PORT                   GPIOC
#define LED11_GPIO_CLK                    RCC_AHB1Periph_GPIOC


//BIOS未升级APP时工作的LED
#define LED12_PIN                         GPIO_Pin_12
#define LED12_GPIO_PORT                   GPIOC
#define LED12_GPIO_CLK                    RCC_AHB1Periph_GPIOC


/**
  * @}
  */ 

/** @addtogroup STM322xG_EVAL_LOW_LEVEL_COM
  * @{
  */
#define COMn                             2

/**F205: 定义IO
 * @brief Definition for COM port1, connected to USART6
 */ 
#define EVAL_COM1                        USART6
#define EVAL_COM1_CLK                    RCC_APB2Periph_USART6
#define EVAL_COM1_TX_PIN                 GPIO_Pin_6
#define EVAL_COM1_TX_GPIO_PORT           GPIOC
#define EVAL_COM1_TX_GPIO_CLK            RCC_AHB1Periph_GPIOC
#define EVAL_COM1_TX_SOURCE              GPIO_PinSource6
#define EVAL_COM1_TX_AF                  GPIO_AF_USART6
#define EVAL_COM1_RX_PIN                 GPIO_Pin_7
#define EVAL_COM1_RX_GPIO_PORT           GPIOC
#define EVAL_COM1_RX_GPIO_CLK            RCC_AHB1Periph_GPIOC
#define EVAL_COM1_RX_SOURCE              GPIO_PinSource7
#define EVAL_COM1_RX_AF                  GPIO_AF_USART6
#define EVAL_COM1_IRQn                   USART6_IRQn



///F205 : USART6 data register address:
#define USART6_DATA_REG_ADDR	    (USART6_BASE + 0x04)


///dma: DMA2 Stream7
#define DMA_Stream		DMA2_Stream7
#define DMA_IRQn		DMA2_Stream7_IRQn
#define DMA_Ch			DMA_Channel_5
#define DMA_Periph		RCC_AHB1Periph_DMA2
#define DMA_FLAG_TCIF	DMA_FLAG_TCIF7

		 
/**F205: 定义IO
 * @brief Definition for COM port2, connected to USART1
 */ 
#define EVAL_COM2                        USART1
#define EVAL_COM2_CLK                    RCC_APB2Periph_USART1
#define EVAL_COM2_TX_PIN                 GPIO_Pin_9
#define EVAL_COM2_TX_GPIO_PORT           GPIOA
#define EVAL_COM2_TX_GPIO_CLK            RCC_AHB1Periph_GPIOA
#define EVAL_COM2_TX_SOURCE              GPIO_PinSource9
#define EVAL_COM2_TX_AF                  GPIO_AF_USART1
#define EVAL_COM2_RX_PIN                 GPIO_Pin_10
#define EVAL_COM2_RX_GPIO_PORT           GPIOA
#define EVAL_COM2_RX_GPIO_CLK            RCC_AHB1Periph_GPIOA
#define EVAL_COM2_RX_SOURCE              GPIO_PinSource10
#define EVAL_COM2_RX_AF                  GPIO_AF_USART1
#define EVAL_COM2_IRQn                   USART1_IRQn


///product : USART1 data register address:
#define USART1_DATA_REG_ADDR	(USART1_BASE + 0x04)

//APP中对usart1用到的DMA资源的定义，这里暂时先不用，和上面的usart6共用
#if 1
///dma: DMA2 Stream7
#define USART1_DMA_STREAM		    DMA2_Stream7
#define USART1_DMA_IRQn		        DMA2_Stream7_IRQn
#define USART1_DMA_CHANNEL			DMA_Channel_4
#define USART1_DMA_Periph		    RCC_AHB1Periph_DMA2
#define USART1_DMA_FLAG_TCIF	    DMA_FLAG_TCIF7
#endif



typedef enum 
{
	LED1 = 0,
	LED2 = 1,
	LED3 = 2,
	LED4 = 3,
	LED5 = 4,
	LED6 = 5,
	LED7 = 6,
	LED8 = 7,
	LED9 = 8,
	LED10 = 9,
	LED11 = 10,
    LED12
} Led_TypeDef;


typedef enum 
{
	COM1 = 0,
	COM2
} COM_TypeDef;  


typedef struct{
	uint8_t BdAddr;
	uint8_t BdType;
	uint8_t FirmType;
	uint8_t RxFlag;
	uint8_t TxFlag;
	uint8_t RdyFlag;
	uint8_t WorkSts;
	uint8_t AckFlag;
	uint8_t TxRdy;

	uint32_t SysTm;
	uint32_t DlyTm;

	uint16_t FirmFrameIndex;
}MY_INFO, *pMY_INFO;

extern MY_INFO MyInfo;

/**
  * @}
  */  
/**
  * @}
  */ 
  
/** @defgroup STM322xG_EVAL_LOW_LEVEL_Exported_Macros
  * @{
  */  
/**
  * @}
  */ 


/** @defgroup STM322xG_EVAL_LOW_LEVEL_Exported_Functions
  * @{
  */
void STM_EVAL_LEDInit(Led_TypeDef Led);
void STM_EVAL_LEDOn(Led_TypeDef Led);
void STM_EVAL_LEDOff(Led_TypeDef Led);
void STM_EVAL_LEDToggle(Led_TypeDef Led);
void STM_EVAL_COMInit(COM_TypeDef COM, USART_InitTypeDef* USART_InitStruct, USART_BufDef *USART_BufStruct); 

void F205_UsartDMAConfig(COM_TypeDef COM, USART_BufDef *USART_BufStruct);

void F205_DisablePeripherals(COM_TypeDef COM);


void Delay(uint32_t dlyTm);



/**
  * @}
  */
  
#ifdef __cplusplus
}
#endif

#endif /* __STM322xG_EVAL_H */
/**
  * @}
  */ 

/**
  * @}
  */ 

/**
  * @}
  */

/**
  * @}
  */  

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
