/*
	FileName : BSP_TM6.c
	Description :
		Timer6 硬件驱动程序。
	Created on 2013.02.20 by ZZP.

	Revision History:

*/

#include "app_cfg.h"
#include "bsp.h"
#include "system_stm32f2xx.h"


/////////////////////////////////////////////////////////
///			Local defines and variables
/////////////////////////////////////////////////////////
///TM6 输入时钟：
#define TIM6_CK_CNT		6000000L


#define DEBUG_TM6_EN		0
#if		DEBUG_TM6_EN
///仅用于调试
__IO uint32_t	MyTestVal = 0;
#endif//DEBUG_TM6_EN



/////////////////////////////////////////////////////////
///			Global function realizations
/////////////////////////////////////////////////////////
void BSP_Tm6_Init(void)
{
	TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
	uint16_t PrescalerValue;

	/* TIM6 clock enable */
  	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM6, ENABLE);


  	/* ---------------------------------------------------------------
    	TIM3 Configuration: Up counting Mode:
    	TIM3 counter clock at 6 MHz
  	--------------------------------------------------------------- */

  	/* Compute the prescaler value */
	///why div 2?
  	PrescalerValue = (uint16_t) ((SystemCoreClock / 2) / TIM6_CK_CNT) - 1;

  	/* Time base configuration */
  	TIM_TimeBaseStructure.TIM_Period = TIM6_CK_CNT / TIM6_FREQ - 1;
  	TIM_TimeBaseStructure.TIM_Prescaler = 0;
  	TIM_TimeBaseStructure.TIM_ClockDivision = 0;
  	TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;

  	TIM_TimeBaseInit(TIM6, &TIM_TimeBaseStructure);

  	/* Prescaler configuration */
  	TIM_PrescalerConfig(TIM6, PrescalerValue, TIM_PSCReloadMode_Immediate);


	/* TIM6 TRGO selection */
  	TIM_SelectOutputTrigger(TIM6, TIM_TRGOSource_Update);
  
  	///暂不允许
  	TIM_Cmd(TIM6, DISABLE);
}



