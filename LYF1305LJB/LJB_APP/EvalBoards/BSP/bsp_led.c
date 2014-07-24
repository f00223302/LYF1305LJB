/*
	FileName : BSP_led.c
	Description :
		LED 硬件驱动程序。
	Created on 2013.02.20 by ZZP.

	Revision History:

*/


#include  <cpu.h>
#include "stm32f2xx.h"
#include "stm32f2xx_rcc.h"
#include "stm32f2xx_gpio.h"
#include "bsp_led.h"

//////////////////////////////////////////////////////////////////
///记录采集板
//////////////////////////////////////////////////////////////////
#if defined JLB_CPU_SAMPLE
GPIO_TypeDef* GPIO_PORT[LEDn] = {LED1_GPIO_PORT, LED2_GPIO_PORT, LED3_GPIO_PORT};
const uint16_t GPIO_PIN[LEDn] = {LED1_PIN, LED2_PIN, LED3_PIN};
const uint32_t GPIO_CLK[LEDn] = {LED1_GPIO_CLK, LED2_GPIO_CLK, LED3_GPIO_CLK};
//////////////////////////////////////////////////////////////////
///记录控制板
//////////////////////////////////////////////////////////////////
#elif defined JLB_CPU_MAIN
GPIO_TypeDef* GPIO_PORT[LEDn] = {LED1_GPIO_PORT, LED2_GPIO_PORT, LED3_GPIO_PORT, LED4_GPIO_PORT, LED5_GPIO_PORT};
const uint16_t GPIO_PIN[LEDn] = {LED1_PIN, LED2_PIN, LED3_PIN, LED4_PIN, LED5_PIN};
const uint32_t GPIO_CLK[LEDn] = {LED1_GPIO_CLK, LED2_GPIO_CLK, LED3_GPIO_CLK, LED4_GPIO_CLK, LED5_GPIO_CLK};
//////////////////////////////////////////////////////////////////
///解码板
//////////////////////////////////////////////////////////////////
#elif defined JMB_CPU_MAIN
GPIO_TypeDef* GPIO_PORT[LEDn] = {LED1_GPIO_PORT};
const uint16_t GPIO_PIN[LEDn] = {LED1_PIN};
const uint32_t GPIO_CLK[LEDn] = {LED1_GPIO_CLK};
//////////////////////////////////////////////////////////////////
///连接板
//////////////////////////////////////////////////////////////////
#elif defined LJB_CPU_MAIN
GPIO_TypeDef* GPIO_PORT[LEDn] = {LED1_GPIO_PORT, LED2_GPIO_PORT, LED3_GPIO_PORT};
const uint16_t GPIO_PIN[LEDn] = {LED1_PIN, LED2_PIN, LED3_PIN};
const uint32_t GPIO_CLK[LEDn] = {LED1_GPIO_CLK, LED2_GPIO_CLK, LED3_GPIO_CLK};

#endif

/*
*********************************************************************************************************
*********************************************************************************************************
*                                              LED FUNCTIONS
*********************************************************************************************************
*********************************************************************************************************
*/
/*
*********************************************************************************************************
*                                             BSP_LED_Init()
*
* Description : Initialize the I/O for the LEDs
*
* Argument(s) : none.
*
* Return(s)   : none.
*
* Caller(s)   : BSP_Init().
*
* Note(s)     : none.
*********************************************************************************************************
*/
void  BSP_LED_Init (void)
{
	GPIO_InitTypeDef  GPIO_InitStructure;
	uint8_t i;
  
	///General information
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_DOWN;
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;

	for (i = 0; i < LEDn; i++){

  		/* Enable the GPIO_LED Clock */
  		RCC_AHB1PeriphClockCmd(GPIO_CLK[i], ENABLE);
  		/* Configure the GPIO_LED pin */
  		GPIO_InitStructure.GPIO_Pin = GPIO_PIN[i];  	
  		GPIO_Init(GPIO_PORT[i], &GPIO_InitStructure);
	}
}



/*
*********************************************************************************************************
*                                             BSP_LED_On()
*
* Description : Turn ON any or all the LEDs on the board.
*
* Argument(s) : led     The ID of the LED to control:
*
*                       1    turn ON LED 1
*                       2    turn ON LED 2
*                       3    turn ON LED 3
*						...
*                       15   turn ON all LEDs on the board
*
* Return(s)   : none.
*
* Caller(s)   : Application.
*
* Note(s)     : none.
*********************************************************************************************************
*/

void  BSP_LED_Off (CPU_INT08U led)
{
	uint8_t i;

	switch (led) {

    	case LED_ALL: 		///LED_ALL
			for (i = 0; i < LEDn; i++)
				GPIO_ResetBits(GPIO_PORT[i], GPIO_PIN[i]);
			break;

    	default:
			if (led <= LEDn)
				GPIO_ResetBits(GPIO_PORT[led - 1], GPIO_PIN[led - 1]);
			break;
	}
}

/*
*********************************************************************************************************
*                                              BSP_LED_Off()
*
* Description : Turn OFF any or all the LEDs on the board.
*
* Argument(s) : led     The ID of the LED to control:
*
*                       1    turn OFF LED 1
*                       2    turn OFF LED 2
*                       3    turn OFF LED 3
*						...
*                       15   turn OFF all LEDs on the board
*
* Return(s)   : none.
*
* Caller(s)   : Application.
*
* Note(s)     : none.
*********************************************************************************************************
*/
void  BSP_LED_On (CPU_INT08U led)
{
	uint8_t i;

	switch (led) {

    	case LED_ALL: 		///LED_ALL
			for (i = 0; i < LEDn; i++)
				GPIO_SetBits(GPIO_PORT[i], GPIO_PIN[i]);
			break;

    	default:
			if (led <= LEDn)
				GPIO_SetBits(GPIO_PORT[led - 1], GPIO_PIN[led - 1]);
			break;
	}
}

/*
*********************************************************************************************************
*                                            BSP_LED_Toggle()
*
* Description : TOGGLE any or all the LEDs on the board.
*
* Argument(s) : led     The ID of the LED to control:
*
*                       1    TOGGLE LED 1
*                       2    TOGGLE LED 2
*                       3    TOGGLE LED 3
*						...
*                       15   TOGGLE all LEDs on the board
*
* Return(s)   : none.
*
* Caller(s)   : Application.
*
* Note(s)     : none.
*********************************************************************************************************
*/

void  BSP_LED_Toggle (CPU_INT08U led)
{
	uint8_t i;

	switch (led) {
		
		case LED_ALL:

			for (i = 0; i < LEDn; i++)
				GPIO_PORT[i]->ODR ^= GPIO_PIN[i];
			break;

    	default:			
			if (led <= LEDn)
				GPIO_PORT[led - 1]->ODR ^= GPIO_PIN[led - 1];
		  break;
	}
}



