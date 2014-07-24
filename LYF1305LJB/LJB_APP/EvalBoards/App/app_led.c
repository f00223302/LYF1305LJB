/*
	FileName : app_led.c
	Description : 
	
	Created on 2013.10.27 by ZZP.
	
	Revision History:
	
*/

#include "bsp.h"
#include "app.h"
#include "app_led.h"


void LedHandler(void)
{
	//////////////////////////////
	///		记录采集板
	//////////////////////////////
#if defined JLB_CPU_SAMPLE	
	
	if (AppInfo.ComLedFlag){
		
		if (AppInfo.ComLedTm >= 160){
			
			BSP_LED_Off(LED_COM);
			AppInfo.ComLedTm = 0;
			AppInfo.ComLedFlag--;
		}
		else{
			
			if ((AppInfo.ComLedTm % 80) == 0)
				BSP_LED_On(LED_COM);
			else if ((AppInfo.ComLedTm % 40) == 0)
				BSP_LED_Off(LED_COM);
			
			AppInfo.ComLedTm++;
		}
	}
	
	if (AppInfo.CanLedFlag){
		
		if (AppInfo.CanLedTm >= 160){
			
			BSP_LED_Off(LED_CAN);
			AppInfo.CanLedTm = 0;
			AppInfo.CanLedFlag--;
		}
		else{
			
			if ((AppInfo.CanLedTm % 80) == 0)
				BSP_LED_On(LED_CAN);
			else if ((AppInfo.CanLedTm % 40) == 0)
				BSP_LED_Off(LED_CAN);
			
			AppInfo.CanLedTm++;
		}
	}
	
	if (AppInfo.TaxLedFlag){
		
		if (AppInfo.TaxLedTm >= 160){
			
			BSP_LED_Off(LED_TAX);
			AppInfo.TaxLedTm = 0;
			AppInfo.TaxLedFlag--;
		}
		else{
			
			if ((AppInfo.TaxLedTm % 80) == 0)
				BSP_LED_On(LED_TAX);
			else if ((AppInfo.TaxLedTm % 40) == 0)
				BSP_LED_Off(LED_TAX);
			
			AppInfo.TaxLedTm++;
		}
	}
	
	//////////////////////////////
	///		记录控制板
	//////////////////////////////
#elif defined JLB_CPU_MAIN
	
	if (AppInfo.WorkLedFlag){
			
		if ((AppInfo.WorkLedTm % 80) == 0)
			BSP_LED_On(LED_WORK); 			
		else if ((AppInfo.WorkLedTm % 40) == 0)
			BSP_LED_Off(LED_WORK);
			
		AppInfo.WorkLedTm++;
	}
		
	if (AppInfo.ErrLedFlag){
			
		if (AppInfo.ErrLedTm >= AppInfo.ErrLedTmConst2){
				
			BSP_LED_Off(LED_ERR);
			AppInfo.ErrLedTm = 0;
		}				
		else if (AppInfo.ErrLedTm <= AppInfo.ErrLedTmConst1)
			BSP_LED_On(LED_ERR);
			
		AppInfo.ErrLedTm++;
	}
		
	if (AppInfo.CopyLedFlag){
		
		if (AppInfo.CopyLedTm >= 160){
			
			BSP_LED_Off(LED_COPY);
			AppInfo.CopyLedTm = 0;
			AppInfo.CopyLedFlag--;
		}
		else{
			
			if ((AppInfo.CopyLedTm % 80) == 0)
				BSP_LED_On(LED_COPY);
			else if ((AppInfo.CopyLedTm % 40) == 0)
				BSP_LED_Off(LED_COPY);
			
			AppInfo.CopyLedTm++;
		}
	}
	
	if (AppInfo.LaisLedFlag){
		
		if (AppInfo.LaisLedTm >= 160){
			
			BSP_LED_Off(LED_LAIS);
			AppInfo.LaisLedTm = 0;
			AppInfo.LaisLedFlag--;
		}
		else{
			
			if ((AppInfo.LaisLedTm % 80) == 0)
				BSP_LED_On(LED_LAIS);
			else if ((AppInfo.LaisLedTm % 40) == 0)
				BSP_LED_Off(LED_LAIS);
			
			AppInfo.LaisLedTm++;
		}
	}
	
	
	if (AppInfo.MiscLedFlag){
		
		if (AppInfo.MiscLedTm >= 160){
			
			BSP_LED_Off(LED_MISC);
			AppInfo.MiscLedTm = 0;
			AppInfo.MiscLedFlag--;
		}
		else{
			
			if ((AppInfo.MiscLedTm % 80) == 0)
				BSP_LED_On(LED_MISC);
			else if ((AppInfo.MiscLedTm % 40) == 0)
				BSP_LED_Off(LED_MISC);
			
			AppInfo.MiscLedTm++;
		}
	}
	
	//////////////////////////////
	///		解码板
	//////////////////////////////
#elif defined JMB_CPU_MAIN
	if (AppInfo.WorkLedFlag){
			
		if ((AppInfo.WorkLedTm % 80) == 0)
			BSP_LED_On(LED_BLNK); 			
		else if ((AppInfo.WorkLedTm % 40) == 0)
			BSP_LED_Off(LED_BLNK);
			
		AppInfo.WorkLedTm++;
	}

	//////////////////////////////
	///		连接板
	//////////////////////////////
#elif defined LJB_CPU_MAIN	

    if (AppInfo.WorkLedTm >= 500)
    {
        BSP_LED_Off(LED_WORK);
		
        AppInfo.WorkLedTm = 0;
    }
    else
    {
        if ((AppInfo.WorkLedTm % 200)   == 0)
        {
            BSP_LED_On(LED_WORK);
        }
		else if ((AppInfo.WorkLedTm % 100) == 0)
		{
            BSP_LED_Off(LED_WORK);
		}

		AppInfo.WorkLedTm++;
    }


	if (AppInfo.UsartRxFlag[COM1])
	{	
		if (AppInfo.RxLedTm >= 160)
		{	
			BSP_LED_Off(LED_USART_RX);
			
			AppInfo.RxLedTm = 0;
			
			AppInfo.UsartRxFlag[COM1]--;
		}
		else
		{	
			if ((AppInfo.RxLedTm % 80) == 0)
			{
				BSP_LED_On(LED_USART_RX);
			}
			else if ((AppInfo.RxLedTm % 40) == 0)
			{
				 BSP_LED_Off(LED_USART_RX);
			}
			
			AppInfo.RxLedTm++;
		}
	}
	else
	{
		BSP_LED_Off(LED_USART_TX);
		
		AppInfo.RxLedTm = 0;
	}

	if (AppInfo.UsartTxFlag[COM1])
	{	
		if (AppInfo.TxLedTm >= 160)
		{	
			BSP_LED_Off(LED_USART_TX);
			AppInfo.TxLedTm = 0;
			AppInfo.UsartTxFlag[COM1]--;
		}
		else
		{	
			if ((AppInfo.TxLedTm % 80) == 0)
			{
				BSP_LED_On(LED_USART_TX);
			}
			else if ((AppInfo.TxLedTm % 40) == 0)
			{
			    BSP_LED_Off(LED_USART_TX);
			}
			
			AppInfo.TxLedTm++;
		}
	}
	else
	{
		BSP_LED_Off(LED_USART_TX);
		
		AppInfo.RxLedTm = 0;
	}

#endif
}





