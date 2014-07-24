/*
	FileName : bsp_rtc.c
	Description :
		1、闹钟功能设置为 1s 钟中断一次；
		2、在中断中读出当前时钟；
		3、时钟数据格式：byte, !NOT BCD!
		4、
	
	Created on 2013.10.14 by ZZP.
	
	Revision History:
	
*/

#include "stm32f2xx.h"
#include "stm32f2xx_rtc.h"
#include "bsp.h"


#define RTC_DEBUG		0

#if RTC_DEBUG
#define RTC_printf(fmt, args...)		printf (fmt ,##args)
#else
#define RTC_printf(fmt, args...)
#endif


#define RTC_DEF_SECOND			0x00
#define RTC_DEF_MINUTE			0x00
#define RTC_DEF_HOUR			0x00

#define RTC_DEF_DATE			0x10
#define RTC_DEF_MONTH			0x10
#define RTC_DEF_YEAR			0x13

#define RTC_DEF_DAY				0x02



/////////////////////////////////////////////////////////////////////////////
///				Global variables and function prototypes
/////////////////////////////////////////////////////////////////////////////
RTC_TimeTypeDef RTC_TimeStructure;
RTC_DateTypeDef RTC_DateStructure;



/////////////////////////////////////////////////////////////////////////////
///				Local variables and function prototypes
/////////////////////////////////////////////////////////////////////////////
__IO uint32_t AsynchPrediv = 0, SynchPrediv = 0;



void RTC_Config(void);
void RTC_TimeRegulate(void);
void BSP_RTC_IsrHandler(void);



/////////////////////////////////////////////////////////////////////////////
///					Global function realizations
/////////////////////////////////////////////////////////////////////////////
void BSP_InitRTC(void)
{
	RTC_InitTypeDef RTC_InitStructure;
	EXTI_InitTypeDef  EXTI_InitStructure;
	
	if (RTC_ReadBackupRegister(RTC_BKP_DR0) != 0x32F2){ 
		
		/* RTC configuration  */
		RTC_Config();

		/* Configure the RTC data register and RTC prescaler */
		RTC_InitStructure.RTC_AsynchPrediv = AsynchPrediv;
		RTC_InitStructure.RTC_SynchPrediv = SynchPrediv;
		RTC_InitStructure.RTC_HourFormat = RTC_HourFormat_24;
   
		/* Check on RTC init */
		if (RTC_Init(&RTC_InitStructure) == ERROR)
		{
			RTC_printf("\n\r        /!\\***** RTC Prescaler Config failed ********/!\\ \n");
		}

		/* Configure the time register */
		RTC_TimeRegulate(); 
	}
	else{
		/* Check if the Power On Reset flag is set */
		if (RCC_GetFlagStatus(RCC_FLAG_PORRST) != RESET)
		{
			RTC_printf("\r\n Power On Reset occurred....\n");
		}
		/* Check if the Pin Reset flag is set */
		else if (RCC_GetFlagStatus(RCC_FLAG_PINRST) != RESET)
		{
			RTC_printf("\r\n External Reset occurred....\n");
		}

		RTC_printf("\r No need to configure RTC....\n");
    
		/* Enable the PWR clock */
		RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR, ENABLE);

		/* Allow access to RTC */
		PWR_BackupAccessCmd(ENABLE);

		/* Wait for RTC APB registers synchronisation */
		RTC_WaitForSynchro();

		/* Clear the RTC Alarm Flag */
		RTC_ClearFlag(RTC_FLAG_ALRAF);

		/* Clear the EXTI Line 17 Pending bit (Connected internally to RTC Alarm) */
		EXTI_ClearITPendingBit(EXTI_Line17);
	}
	
	
	/* RTC Alarm A Interrupt Configuration */
	EXTI_ClearITPendingBit(EXTI_Line17);
	EXTI_InitStructure.EXTI_Line = EXTI_Line17;
	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising;
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;
	EXTI_Init(&EXTI_InitStructure);
  	
	///允许中断
	///中断设置
	BSP_IntVectSet(BSP_INT_ID_RTC, BSP_RTC_IsrHandler);
    BSP_IntEn(BSP_INT_ID_RTC);

}


void BSP_SetDateTime(RTC_TimeTypeDef *Time, RTC_DateTypeDef *Date)
{
	ErrorStatus status;
	
	Time->RTC_H12     = RTC_H12_AM;
  
	/* Disable the Alarm A */
	RTC_AlarmCmd(RTC_Alarm_A, DISABLE);
	
	status = RTC_SetDateTime(RTC_Format_BIN, Date, Time);
	if (status == ERROR){
	}
	else{
	}
	
	/* Enable the Alarm A */
	RTC_AlarmCmd(RTC_Alarm_A, ENABLE);
}



/////////////////////////////////////////////////////////////////////////////
///					Local function realizations
/////////////////////////////////////////////////////////////////////////////
/**
  * @brief  Configure the RTC peripheral by selecting the clock source.
  * @param  None
  * @retval None
  */
void RTC_Config(void)
{
	/* Enable the PWR clock */
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR, ENABLE);

	/* Allow access to RTC */
	PWR_BackupAccessCmd(ENABLE);
   
	///LSE used as RTC source clock
	/* Enable the LSE OSC */
	RCC_LSEConfig(RCC_LSE_ON);

	/* Wait till LSE is ready */  
	while(RCC_GetFlagStatus(RCC_FLAG_LSERDY) == RESET)
	{
	}

	/* Select the RTC Clock Source */
	RCC_RTCCLKConfig(RCC_RTCCLKSource_LSE);
  
	SynchPrediv = 0xFF;
	AsynchPrediv = 0x7F;

  
	/* Enable the RTC Clock */
	RCC_RTCCLKCmd(ENABLE);

	/* Wait for RTC APB registers synchronisation */
	RTC_WaitForSynchro();
}

/**
  * @brief  Returns the time entered by user, using Hyperterminal.
  * @param  None
  * @retval None
  */
void RTC_TimeRegulate(void)
{
	RTC_AlarmTypeDef  RTC_AlarmStructure;
	
	RTC_printf("\r==============Time Settings=====================================\n");
	
	RTC_TimeStructure.RTC_H12 = RTC_H12_AM;
  
	RTC_TimeStructure.RTC_Hours = RTC_DEF_HOUR;
    RTC_TimeStructure.RTC_Minutes = RTC_DEF_MINUTE;
    RTC_TimeStructure.RTC_Seconds = RTC_DEF_SECOND;
	/* Configure the RTC time register */
	if(RTC_SetTime(RTC_Format_BCD, &RTC_TimeStructure) == ERROR)
	{
		RTC_printf("\n>> !! RTC Set Time failed. !! <<\n");
	} 
	else
	{
		RTC_printf("\n>> !! RTC Set Time success. !! <<\n");
	}
	
	
	RTC_printf("\r==============Date Settings=====================================\n");
	RTC_DateStructure.RTC_Year = RTC_DEF_YEAR;
	RTC_DateStructure.RTC_Month = RTC_DEF_MONTH;
	RTC_DateStructure.RTC_Date = RTC_DEF_DATE;
	RTC_DateStructure.RTC_WeekDay = RTC_DEF_DAY;
	/* Configure the RTC time register */
	if(RTC_SetDate(RTC_Format_BCD, &RTC_DateStructure) == ERROR)
	{
		RTC_printf("\n>> !! RTC Set Date failed. !! <<\n");
	} 
	else
	{
		RTC_printf("\n>> !! RTC Set Time success. !! <<\n");
		/* Indicator for the RTC configuration */
		RTC_WriteBackupRegister(RTC_BKP_DR0, 0x32F2);
	}

	
	/* Disable the Alarm A */
	RTC_AlarmCmd(RTC_Alarm_A, DISABLE);

	RTC_printf("\r==============Alarm A Settings=====================================\n");
	RTC_AlarmStructure.RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
	
    RTC_AlarmStructure.RTC_AlarmTime.RTC_Hours = 0x00;
    RTC_AlarmStructure.RTC_AlarmTime.RTC_Minutes = 0x00;
    RTC_AlarmStructure.RTC_AlarmTime.RTC_Seconds = 0x00;
	
	/* Set the Alarm A */
	RTC_AlarmStructure.RTC_AlarmDateWeekDay = 0x31;
	RTC_AlarmStructure.RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
	RTC_AlarmStructure.RTC_AlarmMask = RTC_AlarmMask_All;

	/* Configure the RTC Alarm A register */
	RTC_SetAlarm(RTC_Format_BCD, RTC_Alarm_A, &RTC_AlarmStructure);

	/* Enable the RTC Alarm A Interrupt */
	RTC_ITConfig(RTC_IT_ALRA, ENABLE);
   
	/* Enable the alarm  A */
	RTC_AlarmCmd(RTC_Alarm_A, ENABLE);
}


////RTC Alarm interrupt isr:
void BSP_RTC_IsrHandler(void)
{
	if(RTC_GetITStatus(RTC_IT_ALRA) != RESET)
	{
		/* Get the current Time */
		RTC_GetTime(RTC_Format_BIN, &RTC_TimeStructure);
		/* Get the current Date */
		RTC_GetDate(RTC_Format_BIN, &RTC_DateStructure);
		
		if (BSP_Info.RTCCalBack)
			BSP_Info.RTCCalBack(0, NULL);
		
		RTC_ClearITPendingBit(RTC_IT_ALRA);
		EXTI_ClearITPendingBit(EXTI_Line17);
	} 
}








