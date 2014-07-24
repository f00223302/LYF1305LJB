/*
	FileName : F205_Gpio.c
	Description :
	Created on 2013.01.18 by ZZP.

	Revision History:

*/

#include "stm32f2xx.h"
#include "stm322xg_eval.h"
#include "F205_Gpio.h"

GPIO_InitTypeDef  GPIO_InitStructure;


///配置设备前需要先允许其 CLOCK，否则会失败
void F205_InitGpio(void)
{
	///////////////////////////////////////////////////////////////////////
	///				用于 LED 及 控制信号的 IO 定义
	///////////////////////////////////////////////////////////////////////
	
	/* Start:Deleted by fxs,2013.12.12 */
	/*
#if defined JLB_CPU_SAMPLE
	
		///CPU_SAMPLE:  PA8,9,10: LED
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE); 	
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8 | GPIO_Pin_9 | GPIO_Pin_10;
		
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOA, &GPIO_InitStructure);
    */
    /* End:Deleted by fxs,2013.12.12 */

	

	
	///PA15: IN
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOA, &GPIO_InitStructure); 

	///PA11, 12: OUT
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11 | GPIO_Pin_12;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  	GPIO_Init(GPIOA, &GPIO_InitStructure);

/***
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	///PA15: IN
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;

	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;

	GPIO_Init(GPIOA, &GPIO_InitStructure);
***/

	///PB8, 9，10 : OUT
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8 | GPIO_Pin_9 | GPIO_Pin_10;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
  	GPIO_Init(GPIOB, &GPIO_InitStructure);


    /* Start:Deleted by fxs,2013.12.12 */
    /*
#elif defined JLB_CPU_CONTROL
	///CPU_MAIN:	LED--PF7,8,9,10,11
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF, ENABLE);		
  	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7 | GPIO_Pin_8 | GPIO_Pin_9 | GPIO_Pin_10 | GPIO_Pin_11;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP ;
	GPIO_Init(GPIOF, &GPIO_InitStructure);
	
	/// PB8: FEED_DOG;  PB9: UART6_CTRL
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);		
  	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8 | GPIO_Pin_9;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP ;
	GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	///PA15: IN
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE); 	
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOA, &GPIO_InitStructure);
		
#elif defined JMB_CPU_MAIN
	///PA7: OUT
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
			
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
  	GPIO_Init(GPIOA, &GPIO_InitStructure);
	
	///PA15: IN
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
	GPIO_Init(GPIOA, &GPIO_InitStructure);

	/// PB14: FEED_DOG; 
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);		
  	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_14;
	GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	///PC8: UART6_CTRL
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8;
  	GPIO_Init(GPIOC, &GPIO_InitStructure);
		
#endif
    */
    /* End:Deleted by fxs,2013.12.12 */	
}


uint8_t F205_GetBdAddr(void)
{
	MyInfo.BdAddr = CPU_F205_ADDRESS;
	return 0;
}


uint8_t F205_GetBdType(void)
{
	/*uint8_t res;
	
	res = GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_12);
	res <<= 1;
	res |= GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_13);

	return (res & 0x03);*/
	
	return 0;
}


///Enable Tx:PB9 = 0
void F205_EnableUsartTx(void)												
{
    /* Start:Deleted by fxs,2013.12.12 */
    /*
#if defined JMB_CPU_MAIN
	GPIOC->BSRRH = GPIO_Pin_8;
#else
     */
	/* End:Deleted by fxs,2013.12.12 */
	GPIOA->BSRRH = GPIO_Pin_12;
	GPIOB->BSRRH = GPIO_Pin_10;
    /* Start:Deleted by fxs,2013.12.12 */
    /*
#endif
     */
    /* End:Deleted by fxs,2013.12.12 */

}

///Disable Tx and Enable Rx: PB9 = 1
void F205_DisableUsartTx(void)
{
    /* Start:Deleted by fxs,2013.12.12 */
    /*
#if defined JMB_CPU_MAIN
	GPIOC->BSRRL = GPIO_Pin_8;
#else
     */
    /* End:Deleted by fxs,2013.12.12 */
	GPIOA->BSRRL = GPIO_Pin_12;
	GPIOB->BSRRL = GPIO_Pin_10;
    /* Start:Deleted by fxs,2013.12.12 */
    /*
#endif
     */
    /* End:Deleted by fxs,2013.12.12 */
}


void F205_FeedDog(void)
{
    /* Start:Deleted by fxs,2013.12.12 */
    /*
#if defined JMB_CPU_MAIN
	GPIOB->ODR ^= GPIO_Pin_14;
#else
    */
    /* End:Deleted by fxs,2013.12.12 */

	///PB8:
	GPIOB->ODR ^= GPIO_Pin_8;
    /* Start:Deleted by fxs,2013.12.12 */
    /*
#endif
    */
    /* End:Deleted by fxs,2013.12.12 */

}

uint8_t F205_GetCapStatus(void)
{
	return ((~GPIO_ReadInputDataBit(GPIOA, GPIO_Pin_15)) & 0x01);
}






