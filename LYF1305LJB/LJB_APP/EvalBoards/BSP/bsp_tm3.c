/*
	FileName : BSP_TM3.c
	Description :
		Timer3 硬件驱动程序。
	Created on 2013.02.20 by ZZP.

	Revision History:

*/

#include "app_cfg.h"
#include "bsp.h"
#include "system_stm32f2xx.h"




/////////////////////////////////////////////////////////
///			Local defines and variables
/////////////////////////////////////////////////////////
///TM3 输入时钟：
#define TIM3_CK_CNT		6000000L

void BSP_TIM3_ISRHandler(void);

#define DEBUG_TM3_EN		0
#if		DEBUG_TM3_EN
///仅用于调试
__IO uint32_t	MyTestVal = 0;
#endif//DEBUG_TM3_EN


/////////////////////////////////////////////////////////
///			Global function realizations
/////////////////////////////////////////////////////////
void BSP_Tm3_Init(void)
{
	TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
	uint16_t PrescalerValue;

	/* TIM3 clock enable */
  	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM3, ENABLE);


  	/* ---------------------------------------------------------------
    	TIM3 Configuration: Up counting Mode:
    	TIM3 counter clock at 6 MHz
  	--------------------------------------------------------------- */

  	/* Compute the prescaler value */
	///why div 2?
  	PrescalerValue = (uint16_t) ((SystemCoreClock / 2) / TIM3_CK_CNT) - 1;

  	/* Time base configuration */
  	TIM_TimeBaseStructure.TIM_Period = TIM3_CK_CNT / TIM3_FREQ - 1;
  	TIM_TimeBaseStructure.TIM_Prescaler = 0;
  	TIM_TimeBaseStructure.TIM_ClockDivision = 0;
  	TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;

  	TIM_TimeBaseInit(TIM3, &TIM_TimeBaseStructure);

  	/* Prescaler configuration */
  	TIM_PrescalerConfig(TIM3, PrescalerValue, TIM_PSCReloadMode_Immediate);
   
  	/* TIM Interrupts enable */
  	TIM_ITConfig(TIM3, TIM_IT_Update, ENABLE);

  	/* TIM3 enable counter */
  	TIM_Cmd(TIM3, ENABLE);


	BSP_IntVectSet(BSP_INT_ID_TIM3, BSP_TIM3_ISRHandler);
    BSP_IntEn(BSP_INT_ID_TIM3);
}


///定时中断：
void BSP_TIM3_ISRHandler(void)
{
	if (TIM_GetITStatus(TIM3, TIM_IT_Update) != RESET)
  	{
    	TIM_ClearITPendingBit(TIM3, TIM_IT_Update);		

		///此处启动 ADC
		if (BSP_Info.Tm3CallBack)
			BSP_Info.Tm3CallBack(0, NULL);
#if		DEBUG_TM3_EN
		///调试定时器常数：
		MyTestVal++;
		if (MyTestVal == TIM3_FREQ){
			MyTestVal = 0;
			BSP_LED_Toggle(LED_WORK);
		}
#endif
	}
}


