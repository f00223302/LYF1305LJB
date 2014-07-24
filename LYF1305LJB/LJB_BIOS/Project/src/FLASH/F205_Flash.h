/*
	FileName : F205_flash.h
	Description :
	Created on 2013.01.18 by ZZP.

	Revision History:

*/


/**
  ******************************************************************************
  * @file    STM32F2xx_IAP/inc/flash_if.h 
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    02-May-2011
  * @brief   This file provides all the headers of the flash_if functions.
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
  ******************************************************************************
  */ 

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __F205_FLASH_H__
#define __F205_FLASH_H__

#include <core_cm3.h>

/* Includes ------------------------------------------------------------------*/
#include "stm32f2xx.h"


#define BIOS_FLASH_SECTORS	(OB_WRP_Sector_0 | OB_WRP_Sector_1)
#define PARAM_FLASH_SECTORS	(OB_WRP_Sector_2)

#if defined USE_CPU_F205RC///CPU：STM32F205RC
	#define APP_FLASH_SECTORS	(OB_WRP_Sector_4 | OB_WRP_Sector_5)
#elif USE_CPU_F205ZE///CPU：STM32F205ZE
	#define APP_FLASH_SECTORS	(OB_WRP_Sector_4 | OB_WRP_Sector_5 | OB_WRP_Sector_6 | OB_WRP_Sector_7)
#else
	#error "在项目属性-C/C++ 页中定义 CPU 名称"
#endif


/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Base address of the Flash sectors */
#define ADDR_FLASH_SECTOR_0     ((uint32_t)0x08000000) /* Base @ of Sector 0, 16 Kbyte */
#define ADDR_FLASH_SECTOR_1     ((uint32_t)0x08004000) /* Base @ of Sector 1, 16 Kbyte */
#define ADDR_FLASH_SECTOR_2     ((uint32_t)0x08008000) /* Base @ of Sector 2, 16 Kbyte */
#define ADDR_FLASH_SECTOR_3     ((uint32_t)0x0800C000) /* Base @ of Sector 3, 16 Kbyte */
#define ADDR_FLASH_SECTOR_4     ((uint32_t)0x08010000) /* Base @ of Sector 4, 64 Kbyte */
#define ADDR_FLASH_SECTOR_5     ((uint32_t)0x08020000) /* Base @ of Sector 5, 128 Kbyte */

///F205RC 没有如下存储区
#define ADDR_FLASH_SECTOR_6     ((uint32_t)0x08040000) /* Base @ of Sector 6, 128 Kbyte */
#define ADDR_FLASH_SECTOR_7     ((uint32_t)0x08060000) /* Base @ of Sector 7, 128 Kbyte */
#define ADDR_FLASH_SECTOR_8     ((uint32_t)0x08080000) /* Base @ of Sector 8, 128 Kbyte */
#define ADDR_FLASH_SECTOR_9     ((uint32_t)0x080A0000) /* Base @ of Sector 9, 128 Kbyte */
#define ADDR_FLASH_SECTOR_10    ((uint32_t)0x080C0000) /* Base @ of Sector 10, 128 Kbyte */
#define ADDR_FLASH_SECTOR_11    ((uint32_t)0x080E0000) /* Base @ of Sector 11, 128 Kbyte */

/* End of the Flash address */
#if defined USE_CPU_F205RC
	#define USER_FLASH_END_ADDRESS        0x0803FFFF
#elif USE_CPU_F205ZE
	#define USER_FLASH_END_ADDRESS        0x0807FFFF
#endif


///PARAMS
#define PARAMS_ADDRESS				(uint32_t)0x08008000
#define PARAMS_START_SECTOR			FLASH_Sector_2
#define PARAMS_END_SECTOR			FLASH_Sector_2
///参数定义：
/*
	BIOS:  61 41 73 86 版本字节1 版本字节2 20 年 月 日 00 00 00 00 CRC高位 CRC低位
	APP:   71 61 42 55 版本字节1 版本字节2 20 年 月 日 00 00 00 00 CRC高位 CRC低位
*/


/* Define the address from where user application will be loaded.
   Note: the 1st and 2nd sectors 0x08000000-0x08007FFF are reserved for the IAP code
   		 the 3rd secotr 0x08008000-0x0800BFFF is reserved for params
		 the 4th 0x0800C000-0x0800FFFF are reserved.   
*/
#define APPLICATION_ADDRESS   (uint32_t)0x08010000

#define APPLICATION_START_SECTOR	FLASH_Sector_4

#if defined USE_CPU_F205RC
	#define APPLICATION_END_SECTOR		FLASH_Sector_5
#elif USE_CPU_F205ZE
	#define APPLICATION_END_SECTOR		FLASH_Sector_7
#endif


/* Define the user application size */
#define USER_FLASH_SIZE   (USER_FLASH_END_ADDRESS - APPLICATION_ADDRESS + 1)


typedef  void (*pFunction)(void); 

/* Exported macro ------------------------------------------------------------*/
/* Exported functions ------------------------------------------------------- */

uint8_t F205_EraseSectors(uint32_t StartSec, uint32_t EndSec);
uint8_t F205_ProgramFlash(uint32_t addr, uint32_t data);
uint8_t F205_WriteParams(uint32_t addr, uint8_t *data, uint16_t len);
void F205_ReadParams(uint32_t addr, uint8_t *data, uint16_t len);
uint8_t F205_WriteProtection(uint32_t WRPSec, uint8_t Enable);

#endif  /* __F205_FLASH_H__ */

/*******************(C)COPYRIGHT 2011 STMicroelectronics *****END OF FILE******/





