/*
	FileName : bsp_gpio.c
	Description : 
			JLB GPIO uint
	Created on 2013.10.11 by ZZP.

	Revision History:

*/

#include "bsp.h"



////////////////////////////////////////////////////////////////////////////////////////////////
///							Local variables and function prototypes
////////////////////////////////////////////////////////////////////////////////////////////////
void BSP_EXTI9_5_ISRHandler(void);
void EXTILine6_Config(void);
void EXTILine7_Config(void);


////////////////////////////////////////////////////////////////////////////////////////////////
///						Global function realizations
////////////////////////////////////////////////////////////////////////////////////////////////

void BSP_GPIO_Init(void)
{
	GPIO_InitTypeDef  GPIO_InitStructure;	  

///////////////////////////////////////////////////////////
///连接板
///////////////////////////////////////////////////////////
#if defined LJB_CPU_MAIN
	///PA2, 11, 12: OUT
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
			
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2 | GPIO_Pin_11 | GPIO_Pin_12;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
  	GPIO_Init(GPIOA, &GPIO_InitStructure);


	///PB8, 9，10 : OUT
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8 | GPIO_Pin_9 | GPIO_Pin_10;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
  	GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	///串口供电
	USART_CTRL_ENABLE;

	///I2C写保护
	FLASH_WP_ENABLE;//FLASH_WP_DISABLE;


	//先使能串口接收，但还得在后面的每次接收前先使能，就像发送那样
	BSP_EnableUsartTx(COM1, DISABLE);
	BSP_EnableUsartTx(COM6, DISABLE);

#endif

///////////////////////////////////////////////////////////
///记录采集板
///////////////////////////////////////////////////////////
#if defined JLB_CPU_SAMPLE
	///PA8, 9, 10: OUT
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
			
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8 | GPIO_Pin_9 | GPIO_Pin_10;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
  	GPIO_Init(GPIOA, &GPIO_InitStructure);

	///PB2, 5, 8, 9 : OUT
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2 | GPIO_Pin_5 | GPIO_Pin_8 | GPIO_Pin_9;
  	GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	///
	SELECT_ADC_L_CH;
	
///////////////////////////////////////////////////////////
///记录控制板
///////////////////////////////////////////////////////////
#elif defined JLB_CPU_MAIN
	///PA2, 8, 11, 12: OUT
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
			
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2 | GPIO_Pin_8 | GPIO_Pin_11 | GPIO_Pin_12;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
  	GPIO_Init(GPIOA, &GPIO_InitStructure);

	///PB2, 8, 9, 14 : OUT
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2 | GPIO_Pin_8 | GPIO_Pin_9 | GPIO_Pin_14;
  	GPIO_Init(GPIOB, &GPIO_InitStructure);
	///PB15 : IN
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_15;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  	GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	///PC13: ?
	
	///PF7~11: OUT
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF, ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7 | GPIO_Pin_8 | GPIO_Pin_9 | GPIO_Pin_10 | GPIO_Pin_11;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  	GPIO_Init(GPIOF, &GPIO_InitStructure);
	
	
	///PG8~15: IN
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOG, ENABLE);
	GPIO_InitStructure.GPIO_Pin = 	GPIO_Pin_8  | GPIO_Pin_9  | GPIO_Pin_10 | GPIO_Pin_11 | \
									GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  	GPIO_Init(GPIOF, &GPIO_InitStructure);
	
///////////////////////////////////////////////////////////
///	解码板
///////////////////////////////////////////////////////////
#elif defined JMB_CPU_MAIN
	///PA4, 5, 6, 7: OUT
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
			
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4 | GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
  	GPIO_Init(GPIOA, &GPIO_InitStructure);

	///PB12, 13, 14 : OUT
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14;
  	GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	///PC8: OUT
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8;
  	GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	///PC0, 1, 2, 3, 4, 5 : IN
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3 | GPIO_Pin_4 | GPIO_Pin_5;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  	GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	///设置中断
	EXTILine6_Config();
	EXTILine7_Config();
	EXTI_ClearITPendingBit(EXTI_Line6);
	EXTI_ClearITPendingBit(EXTI_Line7);
	/* Enable and set EXTI Line6 Interrupt*/
	BSP_IntVectSet(BSP_INT_ID_EXTI9_5, BSP_EXTI9_5_ISRHandler);
    BSP_IntEn( BSP_INT_ID_EXTI9_5);
#endif
}




void BSP_FeedDog(void)
{
#if defined JMB_CPU_MAIN
	///PB14:
	GPIOB->ODR ^= GPIO_Pin_14;
#else
	///PB8:
	GPIOB->ODR ^= GPIO_Pin_8;
#endif
}

uint8_t		BSP_DetectSD(void)
{
	return (GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_15));
}

///连接板
#if defined LJB_CPU_MAIN
void 	BSP_EnableUsartTx(COM_TypeDef com, uint8_t enable)
{
	switch (com)
	{
		case COM1:
			if (enable)
			{
				GPIOA->BSRRH = GPIO_Pin_12;//BSRRH
			}
			else
			{
				GPIOA->BSRRL = GPIO_Pin_12;//BSRRL
			}
			break;
		
		case COM6:
			if (enable)
			{	
			    GPIOB->BSRRH = GPIO_Pin_10;//BSRRH
			}
			else
			{
				GPIOB->BSRRL = GPIO_Pin_10;//BSRRL
			}
			break;
		
		default:
			return;
	}
	
	///需要等待一段时间：50us，此处最少 1000！
    ///Deleted by zhanggong 20140324
	/*if (enable)
	{
		Delay(1000);
	}  */
}
#endif


///记录采集板
#if defined JLB_CPU_SAMPLE
void 	BSP_EnableUsartTx(COM_TypeDef com, uint8_t enable)
{
	switch (com){
		
		case COM1:
			if (enable)
				GPIOB->BSRRH = GPIO_Pin_5;
			else
				GPIOB->BSRRL = GPIO_Pin_5;
			break;
		
		case COM6:
			if (enable)
				GPIOB->BSRRH = GPIO_Pin_10;
			else
				GPIOB->BSRRL = GPIO_Pin_10;
			break;
		
		default:
			return;
	}
	
	///需要等待一段时间：50us，此处最少 1000！
	if (enable)
		Delay(1000);
}

///记录控制板
#elif defined JLB_CPU_MAIN

void 	BSP_EnableUsartTx(COM_TypeDef com, uint8_t enable)
{
	switch (com){
		
		case COM1:
			if (enable)
				GPIOA->BSRRH = GPIO_Pin_8;
			else
				GPIOA->BSRRL = GPIO_Pin_8;
			break;
					
		case COM4:
			if (enable)
				GPIOB->BSRRH = GPIO_Pin_2;
			else
				GPIOB->BSRRL = GPIO_Pin_2;
			break;
				
		case COM6:
			if (enable)
				GPIOB->BSRRH = GPIO_Pin_9;
			else
				GPIOB->BSRRL = GPIO_Pin_9;
			break;
		
		default:
			return;
	}
	
	///需要等待一段时间：50us，此处最少 1000！
	if (enable)
		Delay(1000);
}





uint8_t		BSP_GetSwStatus(void)
{
	uint16_t res;
	
	res = GPIO_ReadInputData(GPIOG);
	return (res >> 8);
}


#elif defined JMB_CPU_MAIN

void 	BSP_EnableUsartTx(COM_TypeDef com, uint8_t enable)
{
	switch (com){
					
		case COM3:
			if (enable)
				GPIOB->BSRRH = GPIO_Pin_12;
			else
				GPIOB->BSRRL = GPIO_Pin_12;
			break;
		
		case COM4:
			if (enable)
				GPIOA->BSRRH = GPIO_Pin_4;
			else
				GPIOA->BSRRL = GPIO_Pin_4;
			break;
					
		case COM6:
			if (enable)
				GPIOC->BSRRH = GPIO_Pin_8;
			else
				GPIOC->BSRRL = GPIO_Pin_8;
			break;
		
		default:
			return;
	}
	
	///需要等待一段时间：50us，此处最少 1000！
	if (enable)
		Delay(1000);
}


#endif

///PF6
void EXTILine6_Config(void)
{
	EXTI_InitTypeDef   EXTI_InitStructure;
	GPIO_InitTypeDef   GPIO_InitStructure;

	/* Enable GPIOF clock */
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF, ENABLE);
	/* Enable SYSCFG clock */
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
  
	/* Configure PF6 pin as input floating */
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;
	GPIO_Init(GPIOF, &GPIO_InitStructure);

	/* Connect EXTI Line6 to PF6 pin */
	SYSCFG_EXTILineConfig(EXTI_PortSourceGPIOF, EXTI_PinSource6);

	/* Configure EXTI Line6 */
	EXTI_InitStructure.EXTI_Line = EXTI_Line6;
	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;  
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;
	EXTI_Init(&EXTI_InitStructure);
}


///PF7
void EXTILine7_Config(void)
{
	EXTI_InitTypeDef   EXTI_InitStructure;
	GPIO_InitTypeDef   GPIO_InitStructure;

	/* Enable GPIOF clock */
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF, ENABLE);
	/* Enable SYSCFG clock */
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
  
	/* Configure PF7 pin as input floating */
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7;
	GPIO_Init(GPIOF, &GPIO_InitStructure);

	/* Connect EXTI Line6 to PF7 pin */
	SYSCFG_EXTILineConfig(EXTI_PortSourceGPIOF, EXTI_PinSource7);

	/* Configure EXTI Line7 */
	EXTI_InitStructure.EXTI_Line = EXTI_Line7;
	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;  
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;
	EXTI_Init(&EXTI_InitStructure);
}


void BSP_EXTI9_5_ISRHandler(void)
{
	uint8_t status = 0;
	
	if(EXTI_GetITStatus(EXTI_Line6) != RESET)
	{    
		/* Clear the EXTI line 6 pending bit */
		EXTI_ClearITPendingBit(EXTI_Line6);
		status = 1;
	}
	
	if(EXTI_GetITStatus(EXTI_Line7) != RESET)
	{    
		/* Clear the EXTI line 6 pending bit */
		EXTI_ClearITPendingBit(EXTI_Line7);
		status |= 2;
	}
	
	if (BSP_Info.EXTI9_5_CallBack)
		BSP_Info.EXTI9_5_CallBack(status, NULL);
}





