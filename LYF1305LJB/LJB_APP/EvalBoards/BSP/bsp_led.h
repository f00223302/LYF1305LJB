/*
	FileName : BSP_led.c
	Description :
		LED BSP file
	Created on 2013.02.20 by ZZP.

	Revision History:

*/


#ifndef __BSP_LED_H__ 
#define __BSP_LED_H__

#include "core_cm3.h"


//////////////////////////////////////////////////////////////////
///记录采集板
//////////////////////////////////////////////////////////////////
#if defined JLB_CPU_SAMPLE

#define LEDn			3

///com
#define LED_COM			0x01
///can
#define LED_CAN			0x02
///tax
#define LED_TAX			0x03

///以上所有灯
#define LED_ALL			0x0f



///COM LED
#define LED1_PIN                         GPIO_Pin_8
#define LED1_GPIO_PORT                   GPIOA
#define LED1_GPIO_CLK                    RCC_AHB1Periph_GPIOA

///CAN LED  
#define LED2_PIN                         GPIO_Pin_9
#define LED2_GPIO_PORT                   GPIOA
#define LED2_GPIO_CLK                    RCC_AHB1Periph_GPIOA

///TAX LED  
#define LED3_PIN                         GPIO_Pin_10
#define LED3_GPIO_PORT                   GPIOA
#define LED3_GPIO_CLK                    RCC_AHB1Periph_GPIOA

//////////////////////////////////////////////////////////////////
///记录控制板
//////////////////////////////////////////////////////////////////
#elif defined JLB_CPU_MAIN

#define LEDn				5

///WORK
#define LED_WORK			0x01
///ERR
#define LED_ERR				0x02
///COPY
#define LED_COPY			0x03
///LAIS
#define LED_LAIS			0x04
///misc
#define LED_MISC			0x05

///以上所有灯
#define LED_ALL				0x0f



///work LED
#define LED1_PIN                         GPIO_Pin_7
#define LED1_GPIO_PORT                   GPIOF
#define LED1_GPIO_CLK                    RCC_AHB1Periph_GPIOF

///ERR LED  
#define LED2_PIN                         GPIO_Pin_8
#define LED2_GPIO_PORT                   GPIOF
#define LED2_GPIO_CLK                    RCC_AHB1Periph_GPIOF

///COPY LED  
#define LED3_PIN                         GPIO_Pin_9
#define LED3_GPIO_PORT                   GPIOF
#define LED3_GPIO_CLK                    RCC_AHB1Periph_GPIOF

///LAIS LED
#define LED4_PIN                         GPIO_Pin_10
#define LED4_GPIO_PORT                   GPIOF
#define LED4_GPIO_CLK                    RCC_AHB1Periph_GPIOF

///MISC LED
#define LED5_PIN                         GPIO_Pin_11
#define LED5_GPIO_PORT                   GPIOF
#define LED5_GPIO_CLK                    RCC_AHB1Periph_GPIOF

//////////////////////////////////////////////////////////////////
///解码板
//////////////////////////////////////////////////////////////////
#elif defined JMB_CPU_MAIN

#define LEDn			1

///BLNK
#define LED_BLNK		0x01

///以上所有灯
#define LED_ALL			0x0f



///BLNK LED
#define LED1_PIN                         GPIO_Pin_7
#define LED1_GPIO_PORT                   GPIOA
#define LED1_GPIO_CLK                    RCC_AHB1Periph_GPIOA

//////////////////////////////////////////////////////////////////
///连接板
//////////////////////////////////////////////////////////////////
#elif defined LJB_CPU_MAIN

#define LEDn			3

///tax
#define LED_WORK		0x01

///com
#define LED_USART_RX	0x02

///can
#define LED_USART_TX	0x03


///以上所有灯
#define LED_ALL			0x0f


///TAX LED  
#define LED1_PIN                         GPIO_Pin_10
#define LED1_GPIO_PORT                   GPIOC
#define LED1_GPIO_CLK                    RCC_AHB1Periph_GPIOC

///CAN LED
#define LED2_PIN                         GPIO_Pin_11
#define LED2_GPIO_PORT                   GPIOC
#define LED2_GPIO_CLK                    RCC_AHB1Periph_GPIOC

///COM LED  
#define LED3_PIN                         GPIO_Pin_12
#define LED3_GPIO_PORT                   GPIOC
#define LED3_GPIO_CLK                    RCC_AHB1Periph_GPIOC


#endif


void  BSP_LED_Init (void);
void  BSP_LED_On (uint8_t led);
void  BSP_LED_Off (uint8_t led);
void  BSP_LED_Toggle (uint8_t led);

#endif
