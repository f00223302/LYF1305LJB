/*
	FileName : BSP_I2C.h
	Description :
		I2C 驱动程序。
		目前只定义了 I2C_1，用作 EEPROM-FM24CL04B 等芯片接口。
	
	Created on 2013.10.14 by ZZP.
	
	Revision History:
	
*/


#ifndef __BSP_I2C_H__
#define __BSP_I2C_H__

#include "core_cm3.h"



////////////////////////////////////////////
///类型：FM24CL04B
////////////////////////////////////////////
///#define sEE_M24C64_32
#define sEE_FM24CL04B

/**
  * @brief  I2C EEPROM Interface pins
  */  
#define sEE_I2C                          I2C1
#define sEE_I2C_CLK                      RCC_APB1Periph_I2C1
#define sEE_I2C_SCL_PIN                  GPIO_Pin_6                  /* PB.06 */
#define sEE_I2C_SCL_GPIO_PORT            GPIOB                       /* GPIOB */
#define sEE_I2C_SCL_GPIO_CLK             RCC_AHB1Periph_GPIOB
#define sEE_I2C_SCL_SOURCE               GPIO_PinSource6
#define sEE_I2C_SCL_AF                   GPIO_AF_I2C1
#define sEE_I2C_SDA_PIN                  GPIO_Pin_7                  /* PB.07 */
#define sEE_I2C_SDA_GPIO_PORT            GPIOB                       /* GPIOB */
#define sEE_I2C_SDA_GPIO_CLK             RCC_AHB1Periph_GPIOB
#define sEE_I2C_SDA_SOURCE               GPIO_PinSource7
#define sEE_I2C_SDA_AF                   GPIO_AF_I2C1



#define sEE_I2C_DMA                      DMA1   
#define sEE_I2C_DMA_CHANNEL              DMA_Channel_1
#define sEE_I2C_DMA_STREAM_TX            DMA1_Stream6//DMA1_Stream5
#define sEE_I2C_DMA_STREAM_RX            DMA1_Stream0   
#define sEE_I2C_DMA_CLK                  RCC_AHB1Periph_DMA1
#define sEE_I2C_DR_Address               ((uint32_t)0x40005410)
#define sEE_USE_DMA
   
#define sEE_I2C_DMA_TX_IRQn              BSP_INT_ID_DMA1_STREAM6//BSP_INT_ID_DMA1_STREAM5
#define sEE_I2C_DMA_RX_IRQn              BSP_INT_ID_DMA1_STREAM0
#define sEE_I2C_DMA_PREPRIO              0
#define sEE_I2C_DMA_SUBPRIO              0   
   
#define sEE_TX_DMA_FLAG_FEIF             DMA_FLAG_FEIF6//DMA_FLAG_FEIF5
#define sEE_TX_DMA_FLAG_DMEIF            DMA_FLAG_DMEIF6//DMA_FLAG_DMEIF5
#define sEE_TX_DMA_FLAG_TEIF             DMA_FLAG_TEIF6//DMA_FLAG_TEIF5
#define sEE_TX_DMA_FLAG_HTIF             DMA_FLAG_HTIF6//DMA_FLAG_HTIF5
#define sEE_TX_DMA_FLAG_TCIF             DMA_FLAG_TCIF6//DMA_FLAG_TCIF5
#define sEE_RX_DMA_FLAG_FEIF             DMA_FLAG_FEIF0
#define sEE_RX_DMA_FLAG_DMEIF            DMA_FLAG_DMEIF0
#define sEE_RX_DMA_FLAG_TEIF             DMA_FLAG_TEIF0
#define sEE_RX_DMA_FLAG_HTIF             DMA_FLAG_HTIF0
#define sEE_RX_DMA_FLAG_TCIF             DMA_FLAG_TCIF0
   
#define sEE_DIRECTION_TX                 0
#define sEE_DIRECTION_RX                 1  

/* Time constant for the delay caclulation allowing to have a millisecond 
   incrementing counter. This value should be equal to (System Clock / 1000).
   ie. if system clock = 120MHz then sEE_TIME_CONST should be 120. */
#define sEE_TIME_CONST                   120 


#if !defined (sEE_M24C08) && !defined (sEE_M24C64_32) && !defined (sEE_AT24C02) && !defined (sEE_FM24CL04B)
/* Use the defines below the choose the EEPROM type */
/* #define sEE_M24C08*/  /* Support the device: M24C08. */
/* note: Could support: M24C01, M24C02, M24C04 and M24C16 if the blocks and 
   HW address are correctly defined*/
//#define sEE_M24C64_32  /* Support the devices: M24C32 and M24C64 */
#error "you mast define eeprom type"
#endif

#ifdef sEE_M24C64_32
	/* For M24C32 and M24C64 devices, E0,E1 and E2 pins are all used for device 
		address selection (ne need for additional address lines). According to the 
		Harware connection on the board (on STM3210C-EVAL board E0 = E1 = E2 = 0) */

	#define sEE_HW_ADDRESS         0xA0   /* E0 = E1 = E2 = 0 */ 

#elif defined (sEE_M24C08)
	/* The M24C08W contains 4 blocks (128byte each) with the adresses below: E2 = 0 
		EEPROM Addresses defines */
	#define sEE_Block0_ADDRESS     0xA0   /* E2 = 0 */ 
	/*#define sEE_Block1_ADDRESS     0xA2*/ /* E2 = 0 */  
	/*#define sEE_Block2_ADDRESS     0xA4*/ /* E2 = 0 */
	/*#define sEE_Block3_ADDRESS     0xA6*/ /* E2 = 0 */


#endif /* sEE_M24C64_32 */

/* I2C clock speed configuration (in Hz) 
	WARNING: 
	Make sure that this define is not already declared in other files (ie. 
	stm322xg_eval.h file). It can be used in parallel by other modules. */
#ifndef I2C_SPEED
	#if defined  (sEE_FM24CL04B)
		#define I2C_SPEED                        400000
	#else
		#define I2C_SPEED                        100000
	#endif
#endif /* I2C_SPEED */

///#define I2C_SLAVE_ADDRESS7			0xBf
#define I2C_SLAVE_ADDRESS7			0xAf


#if defined (sEE_M24C08)
	#define sEE_PAGESIZE			16u
#elif defined (sEE_M24C64_32)
	#define sEE_PAGESIZE			32u
#elif defined sEE_AT24C02
	#define sEE_PAGESIZE			8u
#elif defined sEE_FM24CL04B
	#define sEE_PAGESIZE			256u
#endif
   
/* Maximum Timeout values for flags and events waiting loops. These timeouts are
   not based on accurate values, they just guarantee that the application will 
   not remain stuck if the I2C communication is corrupted.
   You may modify these timeout values depending on CPU frequency and application
   conditions (interrupts routines ...). */   
#define sEE_FLAG_TIMEOUT         ((uint32_t)0x1000)
#define sEE_LONG_TIMEOUT         ((uint32_t)(10 * sEE_FLAG_TIMEOUT))

/* Maximum number of trials for sEE_WaitEepromStandbyState() function */
#define sEE_MAX_TRIALS_NUMBER     300
   
/* Defintions for the state of the DMA transfer */   
#define sEE_STATE_READY           0
#define sEE_STATE_BUSY            1
#define sEE_STATE_ERROR           2
   
#define sEE_OK                    0
#define sEE_FAIL                  1 

  
void BSP_InitI2C1(void);

///Start Added 20140313
uint8_t BSP_ReadI2C1(uint8_t *buf, uint16_t ReadAddr, uint16_t *NumByteToRead);
uint8_t BSP_WriteI2C1(uint8_t *buf, uint16_t WriteAddr, uint16_t NumByteToWrite);
///End Added 20140313



void     	sEE_DeInit(void);
void     	sEE_Init(void);
uint32_t 	sEE_ReadBuffer(uint8_t* pBuffer, uint16_t ReadAddr, uint16_t* NumByteToRead);
uint32_t 	sEE_WritePage(uint8_t* pBuffer, uint16_t WriteAddr, uint16_t* NumByteToWrite);
void     	sEE_WriteBuffer(uint8_t* pBuffer, uint16_t WriteAddr, uint16_t NumByteToWrite);
uint32_t 	sEE_WaitEepromStandbyState(void);

void 		sEE_LowLevel_DeInit(void);
void 		sEE_LowLevel_Init(void); 
void 		sEE_LowLevel_DMAConfig(uint32_t pBuffer, uint32_t BufferSize, uint32_t Direction);

/* USER Callbacks: These are functions for which prototypes only are declared in
   EEPROM driver and that should be implemented into user applicaiton. */  
/* sEE_TIMEOUT_UserCallback() function is called whenever a timeout condition 
   occure during communication (waiting on an event that doesn't occur, bus 
   errors, busy devices ...).
   You can use the default timeout callback implementation by uncommenting the 
   define USE_DEFAULT_TIMEOUT_CALLBACK in stm322xg_eval_i2c_ee.h file.
   Typically the user implementation of this callback should reset I2C peripheral
   and re-initialize communication or in worst case reset all the application. */
uint32_t sEE_TIMEOUT_UserCallback(void);

#endif//EOF




