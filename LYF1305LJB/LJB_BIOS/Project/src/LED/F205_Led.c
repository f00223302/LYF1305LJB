/*
	FileName : F205_Led.c
	Description :
	Created on 2013.01.18 by ZZP.

	Revision History:

*/

#include "stm32f2xx.h"
#include "stm322xg_eval.h"

#include "F205_SysTick.h"
#include "F205_Led.h"

///
#define OTHER_BOARD	0

static __IO uint32_t WkLedTm;
static __IO uint32_t RxLedTm;
static __IO uint32_t TxLedTm;

void F205_WkLed(void);
void F205_RxLed(void);
void F205_TxLed(void);
void F205_ComLed(void);
void F205_ErrLed(void);
void F205_TaxLed(void);

///////////////////////////////////////////////////////////
///			Global function realizations
///////////////////////////////////////////////////////////
void F205_InitLED(void)
{
#if defined JLB_CPU_SAMPLE
	STM_EVAL_LEDInit(LED1);
  	STM_EVAL_LEDInit(LED2);
  	STM_EVAL_LEDInit(LED3);
#elif defined JLB_CPU_CONTROL
	STM_EVAL_LEDInit(LED4);
	STM_EVAL_LEDInit(LED5);
	STM_EVAL_LEDInit(LED6);
	STM_EVAL_LEDInit(LED7);
	STM_EVAL_LEDInit(LED8);
#elif defined JMB_CPU_MAIN
	STM_EVAL_LEDInit(LED9);
#elif defined LJB_CPU
	STM_EVAL_LEDInit(LED10);
    STM_EVAL_LEDInit(LED11);
#endif
}


void F205_PowOnLedFlash(void)
{
#if defined JLB_CPU_SAMPLE
  	STM_EVAL_LEDOn(LED1);
  	STM_EVAL_LEDOn(LED2);
  	STM_EVAL_LEDOn(LED3); 

  	MyInfo.SysTm = 0;
	while (MyInfo.SysTm < 500){}

  	STM_EVAL_LEDOff(LED1);
  	STM_EVAL_LEDOff(LED2);
  	STM_EVAL_LEDOff(LED3);

	MyInfo.SysTm = 0;
	while (MyInfo.SysTm < 300){}
		
#elif defined JLB_CPU_CONTROL
	STM_EVAL_LEDOn(LED4);
  	STM_EVAL_LEDOn(LED5);
  	STM_EVAL_LEDOn(LED6);
	STM_EVAL_LEDOn(LED7);
  	STM_EVAL_LEDOn(LED8);

  	MyInfo.SysTm = 0;
	while (MyInfo.SysTm < 500){}

  	STM_EVAL_LEDOff(LED4);
  	STM_EVAL_LEDOff(LED5);
  	STM_EVAL_LEDOff(LED6);
	STM_EVAL_LEDOff(LED7);
  	STM_EVAL_LEDOff(LED8);

	MyInfo.SysTm = 0;
	while (MyInfo.SysTm < 300){}
		
#elif defined JMB_CPU_MAIN
	STM_EVAL_LEDOn(LED9);

  	MyInfo.SysTm = 0;
	while (MyInfo.SysTm < 500){}

  	STM_EVAL_LEDOff(LED9);

	MyInfo.SysTm = 0;
	while (MyInfo.SysTm < 300){}

#elif defined LJB_CPU
  	STM_EVAL_LEDOn(LED10);
  	STM_EVAL_LEDOn(LED11);

  	MyInfo.SysTm = 0;
	while (MyInfo.SysTm < 500){}

  	STM_EVAL_LEDOff(LED10);
  	STM_EVAL_LEDOff(LED11);

	MyInfo.SysTm = 0;
	while (MyInfo.SysTm < 300){}		
#endif
}

void F205_BiosLed(void)
{
    /* Start:Deleted by fxs,2013.12.12 */
    /*
	F205_WkLed();                       //LJB暂没实现这个，因无对应的指示灯
	*/
    /* End:Deleted by fxs,2013.12.12 */

	F205_TaxLed();
	
	F205_ComLed();
}




///////////////////////////////////////////////////////////
///			Local function realizations
///////////////////////////////////////////////////////////
void F205_WkLed(void)
{
#if defined JLB_CPU_CONTROL
	if (MyInfo.RdyFlag){
		if (WkLedTm >= 100){
			STM_EVAL_LEDOn(LED4);
			WkLedTm = 0;
		}
		else{
			WkLedTm++;
			if (WkLedTm == 50)
				STM_EVAL_LEDOff(LED4);
		}
	}
#endif
	
#if defined JMB_CPU_MAIN
	if (MyInfo.RdyFlag){
		if (WkLedTm >= 100){
			STM_EVAL_LEDOn(LED9);
			WkLedTm = 0;
		}
		else{
			WkLedTm++;
			if (WkLedTm == 50)
				STM_EVAL_LEDOff(LED9);
		}
	}
#endif
}


void F205_TxLed(void)
{
#if (OTHER_BOARD == 1)
	if (MyInfo.RdyFlag){
		if (MyInfo.TxFlag){
			if (TxLedTm >= 500){
				STM_EVAL_LEDOff(LED3);
				TxLedTm = 0;
				MyInfo.TxFlag--;
			}
			else{
				if ((TxLedTm % 100)	== 0)
					STM_EVAL_LEDOn(LED3); 			
				else if ((TxLedTm % 50) == 0)
					STM_EVAL_LEDOff(LED3);
				TxLedTm++;
			}
		}
		else{
			STM_EVAL_LEDOff(LED3);
			TxLedTm = 0;
		}
	}
#endif
}

void F205_RxLed(void)
{
#if (OTHER_BOARD == 1)
	if (MyInfo.RdyFlag){
		if (MyInfo.RxFlag){
			if (RxLedTm >= 500){
				STM_EVAL_LEDOff(LED2);
				RxLedTm = 0;
				MyInfo.RxFlag--;
			}
			else{
				if ((RxLedTm % 100) == 0)
					STM_EVAL_LEDOn(LED2); 			
				else if ((RxLedTm % 50) == 0)
					STM_EVAL_LEDOff(LED2);
				RxLedTm++;
			}
		}
		else{
			STM_EVAL_LEDOff(LED2);
			RxLedTm = 0;
		}
	}
#endif
}

void F205_ComLed(void)
{
#if defined JLB_CPU_SAMPLE
	if (MyInfo.RdyFlag){
		
		if (MyInfo.RxFlag){
			
			if (RxLedTm >= 500){
				STM_EVAL_LEDOff(LED1);
				RxLedTm = 0;
				MyInfo.RxFlag--;
			}
			else{
				if ((RxLedTm % 100) == 0)
					STM_EVAL_LEDOn(LED1); 			
				else if ((RxLedTm % 50) == 0)
					STM_EVAL_LEDOff(LED1);
				RxLedTm++;
			}
		}
		else{
			STM_EVAL_LEDOff(LED1);
			RxLedTm = 0;
		}
	}
#endif

#if defined LJB_CPU
	if (MyInfo.RdyFlag)
	{
		if (MyInfo.RxFlag)
		{
			if (RxLedTm >= 500)
			{
				STM_EVAL_LEDOff(LED11);
				RxLedTm = 0;
				MyInfo.RxFlag--;
			}
			else
			{
				if ((RxLedTm % 100) == 0)
				{
					STM_EVAL_LEDOn(LED11); 			
				}
				else if ((RxLedTm % 50) == 0)
					{
					    STM_EVAL_LEDOff(LED11);
					}
				RxLedTm++;
			}
		}
		else
		{
			STM_EVAL_LEDOff(LED11);
			RxLedTm = 0;
		}
	}
#endif

}


///采样CPU BIOS 状态由 TAX 灯指示
void F205_TaxLed(void)
{
#if defined JLB_CPU_SAMPLE
	if (MyInfo.RdyFlag){
		if (WkLedTm >= 100){
			STM_EVAL_LEDOn(LED3);
			WkLedTm = 0;
		}
		else{
			WkLedTm++;
			if (WkLedTm == 50)
				STM_EVAL_LEDOff(LED3);
		}
	}
#endif

#if defined LJB_CPU
	if (MyInfo.RdyFlag)
	{
		if (WkLedTm >= 100)
		{
			STM_EVAL_LEDOn(LED10);
			WkLedTm = 0;
		}
		else
		{
			WkLedTm++;
			if (WkLedTm == 50)
			{
				STM_EVAL_LEDOff(LED10);
			}
		}
	}
#endif
}







