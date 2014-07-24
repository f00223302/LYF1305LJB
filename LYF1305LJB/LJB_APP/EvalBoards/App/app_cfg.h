/*
	FileName : app_cfg.h
	Description : 
		CM3 ϵͳӲ�����á���ͬӦ�ÿɸ���ʵ��Ӳ�����ù��ܵ�Ԫ��
	
	Created on 2012.10.18 by ZZP.
	
	Revision History:
	
*/


#ifndef  __APP_CFG_H__
#define  __APP_CFG_H__

#include  <stdio.h>
#include <cpu_core.h>

/*
*********************************************************************************************************
*                                       MODULE ENABLE / DISABLE
*********************************************************************************************************
*/
#define APP_CFG_SERIAL_EN  DEF_ENABLED
///���� Tick ����App_TimeTickFunc()
#define 	APP_CFG_TICK_FUNC			DEF_ENABLED




//////////////////////////////////////////////////////////////////
///						������Щ USART
//////////////////////////////////////////////////////////////////

#define 	APP_USART_1_ENABLE			DEF_ENABLED

#define 	APP_USART_2_ENABLE			DEF_DISABLED

#define 	APP_USART_3_ENABLE			DEF_DISABLED

#define 	APP_USART_4_ENABLE			DEF_DISABLED

#define 	APP_USART_5_ENABLE			DEF_DISABLED

#define 	APP_USART_6_ENABLE			DEF_ENABLED


//////////////////////////////////////////////////////////////////
///							I2C
//////////////////////////////////////////////////////////////////

#define 	APP_I2C_1_ENABLE			DEF_ENABLED

#define 	APP_I2C_2_ENABLE			DEF_DISABLED
#define		APP_I2C_3_ENABLE			DEF_DISABLED

//////////////////////////////////////////////////////////////////
///							SPI
//////////////////////////////////////////////////////////////////
#define		APP_SPI_1_ENABLE			DEF_DISABLED
#define 	APP_SPI_2_ENABLE			DEF_DISABLED
#define		APP_SPI_3_ENABLE			DEF_DISABLED


//////////////////////////////////////////////////////////////////
///							CAN
//////////////////////////////////////////////////////////////////
#define		APP_CAN_1_ENABLE			DEF_DISABLED
#define 	APP_CAN_2_ENABLE			DEF_DISABLED

//////////////////////////////////////////////////////////////////
///							ADC
//////////////////////////////////////////////////////////////////
#define 	APP_ADC_ENABLE				DEF_ENABLED

//////////////////////////////////////////////////////////////////
///							DAC
//////////////////////////////////////////////////////////////////
#define 	APP_DAC_ENABLE				DEF_DISABLED

//////////////////////////////////////////////////////////////////
///							RTC
//////////////////////////////////////////////////////////////////
#define 	APP_RTC_ENABLE				DEF_DISABLED

//////////////////////////////////////////////////////////////////
///							USB
//////////////////////////////////////////////////////////////////
#define 	APP_USB_HOST_ENABLE			DEF_DISABLED

//////////////////////////////////////////////////////////////////
///							SD
//////////////////////////////////////////////////////////////////
#define 	APP_SD_ENABLE				DEF_DISABLED


//////////////////////////////////////////////////////////////////
///							SRAM
//////////////////////////////////////////////////////////////////
#define 	APP_SRAM_ENABLE				DEF_DISABLED

//////////////////////////////////////////////////////////////////
///						FILE SYSTEM
//////////////////////////////////////////////////////////////////
#define		APP_FILE_SYSTEM_ENABLE		DEF_DISABLED

//////////////////////////////////////////////////////////////////
///						EXTI9_5
//////////////////////////////////////////////////////////////////
#define		APP_EXTI9_5_ENABLE			DEF_DISABLED


/////////////////////////////////////////////////
///			������Ҫ���ò�����
/////////////////////////////////////////////////
///COM1
#define USART_1_BAUD_RATE				115200L
///COM2
#define USART_2_BAUD_RATE				115200L
///COM3
#define USART_3_BAUD_RATE				115200L
///COM4
#define USART_4_BAUD_RATE				115200L
///COM5
#define USART_5_BAUD_RATE				115200L
///COM6
#define USART_6_BAUD_RATE				115200L




///�Ƿ�ദ����ͨ�ŷ�ʽ��
#if defined JLB_CPU_SAMPLE

#define USART_3_MULTI_COMMUNICATION
#define USART_3_MULTI_COMMUNICATION_ADDRESS		0x39

#define USART_4_MULTI_COMMUNICATION
#define USART_4_MULTI_COMMUNICATION_ADDRESS		0x38

#endif

 /* Maximum timeout value */
///���ݶ�ʱ
#define USART1_TIMEOUT_MAX              10000
#define USART2_TIMEOUT_MAX              10000
#define USART3_TIMEOUT_MAX              10000
#define USART4_TIMEOUT_MAX              10000
#define USART5_TIMEOUT_MAX              10000
#define USART6_TIMEOUT_MAX              10000




/////////////////////////////////////////////////
///			CAN ��������
/////////////////////////////////////////////////
///CAN1
#define CAN_1_BAUD_RATE					250000L
///CAN2
#define CAN_2_BAUD_RATE					250000L



/////////////////////////////////////////////////
///			ADC ��������
/////////////////////////////////////////////////
///TIM3 ��ʱƵ��:HZ
#if defined JLB_CPU_SAMPLE
	#define 	TIM3_FREQ	1000L
#elif defined JLB_CPU_MAIN
	#define 	TIM3_FREQ	12500L
#else
	#define 	TIM3_FREQ	12500L
#endif


/////////////////////////////////////////////////
///			DAC ����Ƶ��
/////////////////////////////////////////////////
#define 	TIM6_FREQ	12000L










/*
*********************************************************************************************************
*                                            TASK PRIORITIES
*********************************************************************************************************
*/
///��ʼ����
#define  APP_TASK_START_PRIO							55u




///ADC��������
#define  APP_TASK_ADC_PRIO								11u

///DAC ��������
#define  APP_TASK_DAC_PRIO								12u

///RTC ��������
#define  APP_TASK_RTC_PRIO								13u

///USB ��������
#define  APP_TASK_USB_PRIO								14u


///CAN ��������
#define  APP_TASK_CAN_1_PRIO							15u
#define  APP_TASK_CAN_2_PRIO							16u




///�����շ�����
#define	 APP_TASK_USART_1_PRIO							21u
#define	 APP_TASK_USART_2_PRIO							22u
#define	 APP_TASK_USART_3_PRIO							23u
#define	 APP_TASK_USART_4_PRIO							24u
#define	 APP_TASK_USART_5_PRIO							25u
#define	 APP_TASK_USART_6_PRIO							26u


///I2C ��������
#define  APP_TASK_I2C_1_PRIO							27u
#define  APP_TASK_I2C_2_PRIO							28u
#define  APP_TASK_I2C_3_PRIO							29u

///SPI ��������
#define  APP_TASK_SPI_1_PRIO							30u
#define  APP_TASK_SPI_2_PRIO							31u
#define  APP_TASK_SPI_3_PRIO							32u




///SD ��������
#define  APP_TASK_SD_PRIO								33u


///ϵͳ��ʱ����
#define  OS_TASK_TMR_PRIO                       		(OS_LOWEST_PRIO - 2)


/*
*********************************************************************************************************
*                                            TASK STACK SIZES
*                             Size of the task stacks (# of OS_STK entries)
*********************************************************************************************************
*/
///��ʼ����
#define  APP_TASK_START_STK_SIZE                        256u

///�����շ�����
#define	APP_TASK_USART_1_STK_SIZE						1024u
#define	APP_TASK_USART_2_STK_SIZE						512u
#define	APP_TASK_USART_3_STK_SIZE						512u
#define	APP_TASK_USART_4_STK_SIZE						512u
#define	APP_TASK_USART_5_STK_SIZE						512u
#define	APP_TASK_USART_6_STK_SIZE						512u

///ADC��������
#define APP_TASK_ADC_STK_SIZE							512u


///I2C ��������
#define APP_TASK_I2C_1_STK_SIZE							512u
#define APP_TASK_I2C_2_STK_SIZE							512u
#define APP_TASK_I2C_3_STK_SIZE							512u

///SPI ��������
#define APP_TASK_SPI_1_STK_SIZE							512u
#define APP_TASK_SPI_2_STK_SIZE							512u
#define APP_TASK_SPI_3_STK_SIZE							512u


///CAN ��������
#define  APP_TASK_CAN_1_STK_SIZE						512u
#define  APP_TASK_CAN_2_STK_SIZE						512u


///RTC ��������
#define APP_TASK_RTC_STK_SIZE							512u

///
///DAC ��������
#define APP_TASK_DAC_STK_SIZE							512u

///USB ��������
#define APP_TASK_USB_STK_SIZE							512u

///SD ��������
#define APP_TASK_SD_STK_SIZE							512u



/*
*********************************************************************************************************
*                                            BSP CFG
*********************************************************************************************************
*/

#define  BSP_CFG_SER_COMM_SEL                   BSP_SER_COMM_UART_01




/*
*********************************************************************************************************
*                                     TRACE / DEBUG CONFIGURATION
*********************************************************************************************************
*/
#if 0
#define  TRACE_LEVEL_OFF                                0
#define  TRACE_LEVEL_INFO                               1
#define  TRACE_LEVEL_DBG                                2
#endif

#define  APP_TRACE_LEVEL                                TRACE_LEVEL_INFO

#if (APP_CFG_SERIAL_EN == DEF_ENABLED)
#define  APP_TRACE                                      BSP_Ser_Printf
#else
#define  APP_TRACE                                      printf
#endif

#define  APP_TRACE_INFO(x)               ((APP_TRACE_LEVEL >= TRACE_LEVEL_INFO)  ? (void)(APP_TRACE x) : (void)0)
#define  APP_TRACE_DBG(x)                ((APP_TRACE_LEVEL >= TRACE_LEVEL_DBG)   ? (void)(APP_TRACE x) : (void)0)

#endif

