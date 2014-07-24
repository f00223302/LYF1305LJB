/*
	FileName : F205_SysTick.c
	Description :
	Created on 2013.01.18 by ZZP.

	Revision History:

*/


/*
*******************************************************************************
  Copyright (C), 2010-2012, timll Tech. Co., Ltd.
  FileName      : SysTick/SysTick_Example/main.c 
  Author        : lichy       
  Version       : 1.0.0     
  Date          : 2011/10/09
  Description   : This example shows how to configure system tick timer and use
                  it to generate a 1 ms time base. A Delay function is implemented
                  based on the system tick timer end-of-count event. The four LEDs 
                  LED1, LED2, LED3 and LED4 are toggled with a timing defined by 
                  the Delay function.
  Function List : 
  History       :
  <author>      : lichy       
  <time>        : 2011/10/09
  <version>     : 1.0.0 	
  <desc>        : build this moudle			 
*******************************************************************************
*/

/* Includes ------------------------------------------------------------------*/
#include "stm32f2xx.h"
#include "stm322xg_eval.h"
#include "F205_SysTick.h"
#include "F205_Led.h"
#include "F205_Gpio.h"
#include <stdio.h>

/** @addtogroup STM32F2xx_StdPeriph_Examples
  * @{
  */



/* Private functions ---------------------------------------------------------*/

/**
  * @brief   Main program
  * @param  None
  * @retval None
  */
void F205_ConfigSysTick(__IO uint32_t tick)
{
  if (SysTick_Config(SystemCoreClock / tick))
  { 
    /* Capture error */ 
    while (1);
  }
}


/**
  * @brief  Decrements the TimingDelay variable.
  * @param  None
  * @retval None
  */
void F205_SysTickFunc(void)
{
	MyInfo.SysTm++;

	F205_BiosLed();

	F205_FeedDog();
}


#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */ 

/**
  * @}
  */ 

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
