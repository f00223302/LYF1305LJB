/*
	FileName : app_RTC.c
	Description : 
		RTC hardware calendar.
	Created on 2013.10.14 by ZZP.
	
	Revision History:
	
*/

#include "ucos_ii.h"
#include "bsp.h"
#include "app_rtc.h"
#include  "app.h"
#include "MiscFnx.h"

//////////////////////////////////////////////
///		Local functions and variables
//////////////////////////////////////////////


#define TIME_SRC_TAX	0
#define TIME_SRC_USER	1
#define TIME_SRC_CLK	2

RTC_TimeTypeDef LastTm;
RTC_DateTypeDef LastDate;


void CalibrateTime(uint8_t tm_src, uint32_t tm1, uint32_t tm2);
uint16_t CheckTimeValid(uint8_t TmSrc, void *Buf);





//////////////////////////////////////////////
///		Global function realizations
//////////////////////////////////////////////
void  AppTaskRTC (void *p_arg)
{
	uint8_t err;
	uint32_t tm1, tm2;
#if OS_CRITICAL_METHOD == 3                     
	OS_CPU_SR  cpu_sr = 0;
#endif
	(void)p_arg;
	
	while (DEF_TRUE){

		if (AppInfo.RdyFlag){

			OSSemPend(Sem_RtcAlarm, 0, &err);
			
			if (AppInfo.TaxDataValid39){
				
				OS_ENTER_CRITICAL();
					tm1 = AppInfo.TaxTime;
				OS_EXIT_CRITICAL();
				
				CheckTimeValid(TIME_SRC_TAX, (void *)&tm1);
			}
			
			if (AppInfo.UserTimeValid){
				
				AppInfo.UserTimeValid = 0;
				tm1 = AppInfo.UserTime;
				///tm2 = 0;///AppInfo.NowTime;
				CalibrateTime(TIME_SRC_USER, tm1, 0);
			}
			else if (AppInfo.TaxTimeValid){
		
				OS_ENTER_CRITICAL();
		
					tm1 = AppInfo.TaxTime;
					tm2 = AppInfo.NowTime;
		
				OS_EXIT_CRITICAL();
				
				CalibrateTime(TIME_SRC_TAX, tm1, tm2);
			}
		}
		else
			OSTimeDly(10);
		
		AppInfo.TaskRtcCnt++;
	}
}

uint32_t App_RTC_Callback(unsigned char Arg, void *ptr)
{
	uint32_t tmp;
			
	tmp = RTC_TimeStructure.RTC_Seconds + ((uint16_t)RTC_TimeStructure.RTC_Minutes << 6) + 
			((uint32_t)RTC_TimeStructure.RTC_Hours << 12);
	tmp |= (((uint32_t)RTC_DateStructure.RTC_Date << 17) + ((uint32_t)RTC_DateStructure.RTC_Month << 22) + 
			((uint32_t)RTC_DateStructure.RTC_Year << 26));
		
	AppInfo.NowTime = tmp;
	AppInfo.OneSecAlarmFlag = 1;
	AppInfo.OrderOf1Sec = 0;
	
	if (AppInfo.RdyFlag)
		OSSemPost(Sem_RtcAlarm);
	
	return 0;
}


void CalibrateTime(uint8_t tm_src, uint32_t tm1, uint32_t tm2)
{
	RTC_TimeTypeDef Tm;
	RTC_DateTypeDef Date;
	
	if (!CheckTimeValid(tm_src, (void *)&tm1))
		return;
	
	if (tm2){
		
		Tm.RTC_Seconds = tm2 & 0x3f;
		Tm.RTC_Minutes = (tm2 >> 6) & 0x3f;
		Tm.RTC_Hours = (tm2 >> 12) & 0x1f;
		Date.RTC_Date = (tm2 >> 17) & 0x1f;
		Date.RTC_Month = (tm2 >> 22) & 0x0f;
		Date.RTC_Year = (tm2 >> 26);
		tm2 = GetTimeToSeconds((uint8_t *)&Tm, (uint8_t *)&Date);
	}
	
	Tm.RTC_Seconds = tm1 & 0x3f;
	Tm.RTC_Minutes = (tm1 >> 6) & 0x3f;
	Tm.RTC_Hours = (tm1 >> 12) & 0x1f;
	Date.RTC_Date = (tm1 >> 17) & 0x1f;
	Date.RTC_Month = (tm1 >> 22) & 0x0f;
	Date.RTC_Year = (tm1 >> 26);
	tm1 = GetTimeToSeconds((uint8_t *)&Tm, (uint8_t *)&Date);
	
	if ((!tm2) || (tm1 >= tm2 + 15) || (tm2 >= tm1 + 15)){
		
		Tm.RTC_H12 = RTC_H12_AM;
		BSP_SetDateTime(&Tm, &Date);
	}
}







uint16_t CheckTimeValid(uint8_t TmSrc, void *Buf)
{
	uint16_t Yr, Mo, Dt, Hr, Mi, Sc;
	uint16_t OK = 1;
	uint32_t *ptr;
	long long TTm,  CTm;
	RTC_TimeTypeDef Tm;
	RTC_DateTypeDef Date;
  
	switch (TmSrc){
		
		case TIME_SRC_TAX://0://TAX2 Tm
			/*ptr = (uint16_t *)Buf;
			Sc = (ptr[0] & 0x3F);
			Mi = ((ptr[0] & 0x0FC0) >> 6);
			Hr = (ptr[0] >> 12) + ((ptr[1] & 0x01) << 4);
  
			Dt = ((ptr[1] & 0x3E) >> 1);
			Mo = ((ptr[1] & 0x03C0) >> 6);
			Yr = (ptr[1] >> 10);*/
			ptr = (uint32_t *)Buf;
			Sc = ptr[0] & 0x3F;
			Mi = (ptr[0] >> 6) & 0x3F;
			Hr = (ptr[0] >> 12) & 0x1F;
			Dt = (ptr[0] >> 17) & 0x1F;
			Mo = (ptr[0] >> 22) & 0x0F;
			Yr = (ptr[0] >> 26) & 0x3F;
			break;
		
		case TIME_SRC_CLK:
		case TIME_SRC_USER:
			ptr = (uint32_t *)Buf;
			Sc = ptr[0] & 0x3F;
			Mi = (ptr[0] >> 6) & 0x3F;
			Hr = (ptr[0] >> 12) & 0x1F;
			Dt = (ptr[0] >> 17) & 0x1F;
			Mo = (ptr[0] >> 22) & 0x0F;
			Yr = (ptr[0] >> 26) & 0x3F;
			break;
		default:
			return (0);
	}
  
	switch (Mo)
	{
		case 1 :
		case 3 :
		case 5 :
		case 7 :
		case 8 :
		case 10 :
		case 12 :
			if ((Dt == 0) || (Dt > 31)) 
				OK = 0;
			break;
		case 2 :
			if ((Dt == 0) || (Dt > 29)) 
				OK = 0;
			break;
		case 4 :
		case 6 :
		case 9 :
		case 11 :
			if ((Dt == 0) || (Dt > 30)) 
				OK = 0;
			break;
		default :
			OK = 0;
			break;
	}
	if (Hr > 23) OK = 0;
	if (Mi > 59) OK = 0;
	if (Sc > 59) OK = 0;
  
	if (!OK)
		return (OK);
    
	if (TmSrc == TIME_SRC_TAX){
    			
		if ((Yr == 0) || (Yr >= 32))
			Yr = AppInfo.NowTime >> 26;
								
		Tm.RTC_Hours = Hr;
		Tm.RTC_Minutes = Mi;
		Tm.RTC_Seconds = Sc;
		Date.RTC_Year = Yr;
		Date.RTC_Month = Mo;
		Date.RTC_Date = Dt;
		TTm = GetTimeToSeconds((uint8_t *)&Tm, (uint8_t *)&Date);
		CTm = GetTimeToSeconds((uint8_t *)&LastTm, (uint8_t *)&LastDate);
		if ((TTm == CTm) || (TTm == CTm + 1) || (TTm == CTm + 2)){
				
			AppInfo.TaxCnt++;
			AppInfo.TaxTimeIncCnt += (TTm - CTm);
		}
		else{
				
			AppInfo.TaxCnt = 0;
			OK = 0;
			AppInfo.TaxErrCnt++;
		}
		LastTm.RTC_Seconds = Sc;
		LastTm.RTC_Minutes = Mi;
		LastTm.RTC_Hours = Hr;
		LastDate.RTC_Date = Dt;
		LastDate.RTC_Month = Mo;
		LastDate.RTC_Year = Yr;
		
		if (AppInfo.TaxCnt >= 10){
			
			if ((AppInfo.TaxTimeIncCnt > 8) && (AppInfo.TaxTimeIncCnt < 12)){
			
				AppInfo.TaxTimeValid = 1;
				AppInfo.TaxErrCnt = 0;
			}
			else
				AppInfo.TaxTimeValid = 0;
			
			AppInfo.TaxCnt = 0;
			AppInfo.TaxTimeIncCnt = 0;
		}
		else if (AppInfo.TaxErrCnt >= 5)
		{
			AppInfo.TaxTimeValid = 0;
			return (0);
		}
  }
  
  return (OK);
}






















