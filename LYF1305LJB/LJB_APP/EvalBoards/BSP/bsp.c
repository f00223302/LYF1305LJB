/*
	FileName : bsp.c
	Description : 
			部分硬件驱动程序。
			
			缺省硬件 DMA 分配如下：（不同应用需要根据实际连接情况更改）
			
							DMA2		STREAM			CHANNEL
			-------------------------------------------------------------
			SPI1_Rx			DMA2		0				2
			SPI1_Tx			DMA2		5				3
			SDIO			DMA2		3				4
			ADC1			DMA2		4				0
			USART6_Tx		DMA2		6				5
			USART1_Tx		DMA2		7				4
			
							DMA1		STREAM			CHANNEL
			-------------------------------------------------------------
			I2C1_Rx			DMA1		0				1
			I2C1_Tx			DMA1		5				1
			USART3_Tx		DMA1		3				4
			USART4_Tx		DMA1		4				4
			USART2_Tx		DMA1		6				4
			USART5_Tx		DMA1		7				4	
			
			DAC1			DMA1		5				7------confilict with I2C1_Tx
			
			I2C2_Rx			DMA1		2				7
			I2C2_Tx			DMA1		7				7------Confilict with USART5_Tx
			
			I2C3_Rx			DMA1		2				3------confilict with I2C2_Rx
			I2C3_Tx			DMA1		4				3------confilict with USART4_Tx
			
			SPI2_Rx			DMA1		3				0------confilict with USART3_Tx
			SPI2_Tx			DMA1		4				0------confilict with USART4_Tx
			
			SPI3_Rx			DMA1		0				0------confilict with I2C1_Rx
			SPI3_Tx			DMA1		5				0------confilict with I2C1_Tx
			

			
	Created on 2013.10.11 by ZZP.

	Revision History:


*/



/*
*********************************************************************************************************
*                                     MICIRUM BOARD SUPPORT PACKAGE
*
*                             (c) Copyright 2012; Micrium, Inc.; Weston, FL
*
*               All rights reserved.  Protected by international copyright laws.
*               Knowledge of the source code may NOT be used to develop a similar product.
*               Please help us continue to provide the Embedded community with the finest
*               software available.  Your honesty is greatly appreciated.
*********************************************************************************************************
*/

/*
*********************************************************************************************************
*
*                                        BOARD SUPPORT PACKAGE
*
*                                     ST Microelectronics STM32
*                                              on the
*
*                                           STM3220G-EVAL
*                                         Evaluation Board
*
* Filename      : bsp.c
* Version       : V1.00
* Programmer(s) : SL
*                 DC
*********************************************************************************************************
*/


/*
*********************************************************************************************************
*                                             INCLUDE FILES
*********************************************************************************************************
*/

#define   BSP_MODULE

#include  "app_cfg.h"

#include  <bsp.h>
#include  <string.h>


/*
*********************************************************************************************************
*                                            LOCAL DEFINES
*********************************************************************************************************
*/



/*
*********************************************************************************************************
*                                           LOCAL CONSTANTS
*********************************************************************************************************
*/
const uint32_t USART_BaudRate[] = {	
									USART_1_BAUD_RATE,
									USART_2_BAUD_RATE,
									USART_3_BAUD_RATE,
									USART_4_BAUD_RATE,
									USART_5_BAUD_RATE,
									USART_6_BAUD_RATE
								};

/*
*********************************************************************************************************
*                                          LOCAL DATA TYPES
*********************************************************************************************************
*/


/*
*********************************************************************************************************
*                                            LOCAL TABLES
*********************************************************************************************************
*/


/*
*********************************************************************************************************
*                                       LOCAL GLOBAL VARIABLES
*********************************************************************************************************
*/
BSP_INFO BSP_Info;




/*
*********************************************************************************************************
*                                             REGISTERS
*********************************************************************************************************
*/

#define  DWT_CR      *(CPU_REG32 *)0xE0001000
#define  DWT_CYCCNT  *(CPU_REG32 *)0xE0001004
#define  DEM_CR      *(CPU_REG32 *)0xE000EDFC


/*
*********************************************************************************************************
*                                            REGISTER BITS
*********************************************************************************************************
*/

#define  DEM_CR_TRCENA                   (1 << 24)

#define  DWT_CR_CYCCNTENA                (1 <<  0)


/*
*********************************************************************************************************
*                                      LOCAL FUNCTION PROTOTYPES
*********************************************************************************************************
*/
void BSP_InitUsart(COM_TypeDef COM, uint8_t MultiMode, uint8_t Addr);




/*
*********************************************************************************************************
*                                               BSP_InitInfo()
*
* Description : Initialize structure BSP_Info.
*
* Argument(s) : none.
*
* Return(s)   : none.
*
* Caller(s)   : Application.
*
* Note(s)     : (1) This function SHOULD be called before any other BSP function is called.
*
*********************************************************************************************************
*/
///初始化 BSP_Info 结构
void BSP_InitInfo(void)
{
	memset(&BSP_Info, 0, sizeof(BSP_INFO));
}


/*
*********************************************************************************************************
*                                               BSP_Init()
*
* Description : Initialize the Board Support Package (BSP).
*
* Argument(s) : none.
*
* Return(s)   : none.
*
* Caller(s)   : Application.
*
* Note(s)     : (1) This function SHOULD be called after BSP_InitInfo() and before any other BSP function is called.
*
*               (2) CPU instruction / data tracing requires the use of the following pins :
*                   (a) (1) Aysynchronous     :  PB[3]
*                       (2) Synchronous 1-bit :  PE[3:2]
*                       (3) Synchronous 2-bit :  PE[4:2]
*                       (4) Synchronous 4-bit :  PE[6:2]
*
*                   (c) The application may wish to adjust the trace bus width depending on I/O
*                       requirements.
*********************************************************************************************************
*/

void  BSP_Init (void)
{

    /* At this stage the microcontroller clock setting is already configured,
       this is done through SystemInit() function which is called from startup
       file (startup_stm32f2xx.s) before to branch to application main.
       To reconfigure the default setting of SystemInit() function, refer to
       system_stm32f2xx.c file
     */	
#if APP_SRAM_ENABLE
	BSP_SRAM_Init();//此处为记录板上的，我没有，不需要，已屏蔽
#endif
	
	///Disable all Initerrupts
	BSP_IntInit();

	///Initialize the other I/Os for external dog, USART Tx control and board address
  	BSP_GPIO_Init();

	/* Initialize the I/Os for the LED      controls.       */
	BSP_LED_Init();

#if APP_ADC_ENABLE
	///Initialize ADC
	if (BSP_Info.ADCBuf[0] != NULL)
		BSP_ADC_Init(BSP_Info.ADCBuf[0]);
	else
		BSP_Info.Error |= BSP_ERROR_ADC_BUF_EMPTY; 
#endif
	
#if APP_DAC_ENABLE
	///Init DAC
	if (BSP_Info.DACBuf[0] != NULL)
		BSP_DAC_Init(BSP_Info.DACBuf[0]);
	else
		BSP_Info.Error |= BSP_ERROR_DAC_BUF_EMPTY;
#endif

#if APP_USART_1_ENABLE
	Sem_UsartTxRdy[COM1] = OSSemCreate(1);
	#if defined USART_1_MULTI_COMMUNICATION
		BSP_InitUsart(COM1, 1, USART_1_MULTI_COMMUNICATION_ADDRESS);
	#else
		BSP_InitUsart(COM1, 0, 0);
	#endif
#endif

#if APP_USART_2_ENABLE
	Sem_UsartTxRdy[COM2] = OSSemCreate(1);
	#if defined USART_2_MULTI_COMMUNICATION
		BSP_InitUsart(COM2, 1, USART_2_MULTI_COMMUNICATION_ADDRESS);
	#else
		BSP_InitUsart(COM2, 0, 0);
	#endif
#endif	

#if APP_USART_3_ENABLE
	Sem_UsartTxRdy[COM3] = OSSemCreate(1);
	#if defined USART_3_MULTI_COMMUNICATION
		BSP_InitUsart(COM3, 1, USART_3_MULTI_COMMUNICATION_ADDRESS);
	#else
		BSP_InitUsart(COM3, 0, 0);
	#endif
#endif

#if APP_USART_4_ENABLE
	Sem_UsartTxRdy[COM4] = OSSemCreate(1);
	#if defined USART_4_MULTI_COMMUNICATION
		BSP_InitUsart(COM4, 1, USART_4_MULTI_COMMUNICATION_ADDRESS);
	#else
		BSP_InitUsart(COM4, 0, 0);
	#endif
#endif	
	
#if APP_USART_5_ENABLE
	Sem_UsartTxRdy[COM5] = OSSemCreate(1);
	#if defined USART_5_MULTI_COMMUNICATION
		BSP_InitUsart(COM5, 1, USART_5_MULTI_COMMUNICATION_ADDRESS);
	#else
		BSP_InitUsart(COM5, 0, 0);
	#endif
#endif	

#if APP_USART_6_ENABLE
	Sem_UsartTxRdy[COM6] = OSSemCreate(1);
	#if defined USART_6_MULTI_COMMUNICATION
		BSP_InitUsart(COM6, 1, USART_6_MULTI_COMMUNICATION_ADDRESS);
	#else
		BSP_InitUsart(COM6, 0, 0);
	#endif
#endif		
	
#if APP_I2C_1_ENABLE
	BSP_InitI2C1();
#endif

#if APP_SPI_1_ENABLE
	BSP_InitSPI1();
#endif


#if APP_RTC_ENABLE
	BSP_InitRTC();
#endif

#if APP_CAN_1_ENABLE
	///BSP_InitCan(CAN_1, );
#endif

#if APP_CAN_2_ENABLE
	///BSP_InitCan();
#endif

#if APP_SD_ENABLE
	BSP_InitSD();
#endif

#if APP_USB_HOST_ENABLE
	BSP_InitUSB();
#endif

#if APP_ADC_ENABLE
	///Timer3 for ADC:
	BSP_Tm3_Init();	
#endif
}



/*
*********************************************************************************************************
*                                               BSP_RNG_Read()
*
* Description : Read the value of the RNG.
*
* Argument(s) : none.
*
* Return(s)   : ????.
*
* Caller(s)   : Application.
*
* Note(s)     : none.
*********************************************************************************************************
*/

CPU_INT32U  BSP_RNG_Read (void)
{
    CPU_INT32U  rng_val;


    RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);         /* Enable RNG clock.                                    */

    RNG_REG->CR |= RNG_CR_IE;                                   /* Enable RNG ISR.                                      */
    RNG_REG->CR |= RNG_CR_RNGEN;                                /* Enable LFSR & err detector.                          */

    while ((RNG_REG->SR & RNG_SR_DRDY) == 0) {
            ;
    }
    rng_val = (CPU_INT32U)RNG_REG->DR;                          /* Save RNG data reg.                                   */

    RNG_REG->CR &= ~RNG_CR_IE;                                  /* Disable RNG ISR.                                     */
    RNG_REG->CR &= ~RNG_CR_RNGEN;                               /* Disable LFSR & err detector.                         */
    RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, DISABLE);        /* Disable RNG clock.                                   */

    return (rng_val);                                           /* Return rand value.                                   */
}


/*
*********************************************************************************************************
*                                            BSP_CPU_ClkFreq()
*
* Description : Read CPU registers to determine the CPU clock frequency of the chip.
*
* Argument(s) : none.
*
* Return(s)   : The CPU clock frequency, in Hz.
*
* Caller(s)   : Application.
*
* Note(s)     : none.
*********************************************************************************************************
*/

CPU_INT32U  BSP_CPU_ClkFreq (void)
{
    RCC_ClocksTypeDef  rcc_clocks;


    RCC_GetClocksFreq(&rcc_clocks);
    return ((CPU_INT32U)rcc_clocks.HCLK_Frequency);
}


/*
*********************************************************************************************************
*                                       BSP_CPU_TickInit()
*
* Description : This function reads CPU registers to determine the CPU clock frequency of the chip in KHz.
*
* Argument(s) : none.
*
* Return(s)   : none.
*
* Caller(s)   : Application.
*
* Note(s)     : none.
*********************************************************************************************************
*/

void  BSP_CPU_TickInit  (void)
{
    CPU_INT32U  cpu_clk_freq;
    CPU_INT32U  cnts;


    cpu_clk_freq = BSP_CPU_ClkFreq();                           /* Determine SysTick reference freq.                    */
#if (OS_VERSION >= 30000u)
    cnts         = (cpu_clk_freq / OSCfg_TickRate_Hz);          /* Determine nbr SysTick increments                     */
#else
    cnts         = (cpu_clk_freq / OS_TICKS_PER_SEC);
#endif
    OS_CPU_SysTickInit(cnts);                                   /* Initialize the SysTick.                            */
}



void Delay(uint32_t dlyTm)
{
	uint32_t i;

	for (i = 0; i < dlyTm; i++){
		__NOP();
	}
}


/////////////////////////////////////////////////////////////////////////////////////
//								Local function
/////////////////////////////////////////////////////////////////////////////////////
void BSP_InitUsart(COM_TypeDef COM, uint8_t MultiMode, uint8_t Addr)
{
	USART_InitTypeDef USART_InitStructure;
		
	USART_InitStructure.USART_BaudRate = USART_BaudRate[COM];
	if (MultiMode)
		USART_InitStructure.USART_WordLength = USART_WordLength_9b;
	else
		USART_InitStructure.USART_WordLength = USART_WordLength_8b;
	USART_InitStructure.USART_StopBits = USART_StopBits_1;
	USART_InitStructure.USART_Parity = USART_Parity_No;
	USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
	///首先恢复复位缺省态
	USART_DeInit(COM_USART[COM]);
	///设置串口
  	BSP_USART_Init(COM, &USART_InitStructure, MultiMode, Addr);
}





/*$PAGE*/
/*
*********************************************************************************************************
*                                          CPU_TS_TmrInit()
*
* Description : Initialize & start CPU timestamp timer.
*
* Argument(s) : none.
*
* Return(s)   : none.
*
* Caller(s)   : CPU_TS_Init().
*
*               This function is an INTERNAL CPU module function & MUST be implemented by application/
*               BSP function(s) [see Note #1] but MUST NOT be called by application function(s).
*
* Note(s)     : (1) CPU_TS_TmrInit() is an application/BSP function that MUST be defined by the developer
*                   if either of the following CPU features is enabled :
*
*                   (a) CPU timestamps
*                   (b) CPU interrupts disabled time measurements
*
*                   See 'cpu_cfg.h  CPU TIMESTAMP CONFIGURATION  Note #1'
*                     & 'cpu_cfg.h  CPU INTERRUPTS DISABLED TIME MEASUREMENT CONFIGURATION  Note #1a'.
*
*               (2) (a) Timer count values MUST be returned via word-size-configurable 'CPU_TS_TMR'
*                       data type.
*
*                       (1) If timer has more bits, truncate timer values' higher-order bits greater
*                           than the configured 'CPU_TS_TMR' timestamp timer data type word size.
*
*                       (2) Since the timer MUST NOT have less bits than the configured 'CPU_TS_TMR'
*                           timestamp timer data type word size; 'CPU_CFG_TS_TMR_SIZE' MUST be
*                           configured so that ALL bits in 'CPU_TS_TMR' data type are significant.
*
*                           In other words, if timer size is not a binary-multiple of 8-bit octets
*                           (e.g. 20-bits or even 24-bits), then the next lower, binary-multiple
*                           octet word size SHOULD be configured (e.g. to 16-bits).  However, the
*                           minimum supported word size for CPU timestamp timers is 8-bits.
*
*                       See also 'cpu_cfg.h   CPU TIMESTAMP CONFIGURATION  Note #2'
*                              & 'cpu_core.h  CPU TIMESTAMP DATA TYPES     Note #1'.
*
*                   (b) Timer SHOULD be an 'up'  counter whose values increase with each time count.
*
*                   (c) When applicable, timer period SHOULD be less than the typical measured time
*                       but MUST be less than the maximum measured time; otherwise, timer resolution
*                       inadequate to measure desired times.
*
*                   See also 'CPU_TS_TmrRd()  Note #2'.
*********************************************************************************************************
*/

#if (CPU_CFG_TS_TMR_EN == DEF_ENABLED)
void  CPU_TS_TmrInit (void)
{
    CPU_INT32U  cpu_clk_freq_hz;


    DEM_CR         |= (CPU_INT32U)DEM_CR_TRCENA;                /* Enable Cortex-M3's DWT CYCCNT reg.                   */
    DWT_CYCCNT      = (CPU_INT32U)0u;
    DWT_CR         |= (CPU_INT32U)DWT_CR_CYCCNTENA;

    cpu_clk_freq_hz = BSP_CPU_ClkFreq();
    CPU_TS_TmrFreqSet(cpu_clk_freq_hz);
}
#endif


/*$PAGE*/
/*
*********************************************************************************************************
*                                           CPU_TS_TmrRd()
*
* Description : Get current CPU timestamp timer count value.
*
* Argument(s) : none.
*
* Return(s)   : Timestamp timer count (see Notes #2a & #2b).
*
* Caller(s)   : CPU_TS_Init(),
*               CPU_TS_Get32(),
*               CPU_TS_Get64(),
*               CPU_IntDisMeasStart(),
*               CPU_IntDisMeasStop().
*
*               This function is an INTERNAL CPU module function & MUST be implemented by application/
*               BSP function(s) [see Note #1] but SHOULD NOT be called by application function(s).
*
* Note(s)     : (1) CPU_TS_TmrRd() is an application/BSP function that MUST be defined by the developer
*                   if either of the following CPU features is enabled :
*
*                   (a) CPU timestamps
*                   (b) CPU interrupts disabled time measurements
*
*                   See 'cpu_cfg.h  CPU TIMESTAMP CONFIGURATION  Note #1'
*                     & 'cpu_cfg.h  CPU INTERRUPTS DISABLED TIME MEASUREMENT CONFIGURATION  Note #1a'.
*
*               (2) (a) Timer count values MUST be returned via word-size-configurable 'CPU_TS_TMR'
*                       data type.
*
*                       (1) If timer has more bits, truncate timer values' higher-order bits greater
*                           than the configured 'CPU_TS_TMR' timestamp timer data type word size.
*
*                       (2) Since the timer MUST NOT have less bits than the configured 'CPU_TS_TMR'
*                           timestamp timer data type word size; 'CPU_CFG_TS_TMR_SIZE' MUST be
*                           configured so that ALL bits in 'CPU_TS_TMR' data type are significant.
*
*                           In other words, if timer size is not a binary-multiple of 8-bit octets
*                           (e.g. 20-bits or even 24-bits), then the next lower, binary-multiple
*                           octet word size SHOULD be configured (e.g. to 16-bits).  However, the
*                           minimum supported word size for CPU timestamp timers is 8-bits.
*
*                       See also 'cpu_cfg.h   CPU TIMESTAMP CONFIGURATION  Note #2'
*                              & 'cpu_core.h  CPU TIMESTAMP DATA TYPES     Note #1'.
*
*                   (b) Timer SHOULD be an 'up'  counter whose values increase with each time count.
*
*                       (1) If timer is a 'down' counter whose values decrease with each time count,
*                           then the returned timer value MUST be ones-complemented.
*
*                   (c) (1) When applicable, the amount of time measured by CPU timestamps is
*                           calculated by either of the following equations :
*
*                           (A) Time measured  =  Number timer counts  *  Timer period
*
*                                   where
*
*                                       Number timer counts     Number of timer counts measured
*                                       Timer period            Timer's period in some units of
*                                                                   (fractional) seconds
*                                       Time measured           Amount of time measured, in same
*                                                                   units of (fractional) seconds
*                                                                   as the Timer period
*
*                                                  Number timer counts
*                           (B) Time measured  =  ---------------------
*                                                    Timer frequency
*
*                                   where
*
*                                       Number timer counts     Number of timer counts measured
*                                       Timer frequency         Timer's frequency in some units
*                                                                   of counts per second
*                                       Time measured           Amount of time measured, in seconds
*
*                       (2) Timer period SHOULD be less than the typical measured time but MUST be less
*                           than the maximum measured time; otherwise, timer resolution inadequate to
*                           measure desired times.
*********************************************************************************************************
*/

#if (CPU_CFG_TS_TMR_EN == DEF_ENABLED)
CPU_TS_TMR  CPU_TS_TmrRd (void)
{
    return ((CPU_TS_TMR)DWT_CYCCNT);
}
#endif

