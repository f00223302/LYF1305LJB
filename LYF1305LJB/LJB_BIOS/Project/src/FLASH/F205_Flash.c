/*
	FileName : F205_flash.c
	Description :
	Created on 2013.01.18 by ZZP.

	Revision History:

*/


/* Includes ------------------------------------------------------------------*/
#include "stm32f2xx.h"
#include "stm322xg_eval.h"
#include "F205_Flash.h"


//允许写保护
#define FLASH_USE_PROTECTION		1




uint8_t F205_EraseSectors(uint32_t StartSec, uint32_t EndSec)
{
	uint8_t try = 3;
	uint8_t err;
	uint32_t i;

	while (try--){

		err = 0;
		/* Unlock the Flash to enable the flash control register access *************/ 
  		FLASH_Unlock();

  		for (i = StartSec; i <= EndSec; i += 8)
  		{
    		/* Device voltage range supposed to be [2.7V to 3.6V], the operation will
       			be done by word */ 
    		if (FLASH_EraseSector(i, VoltageRange_3) != FLASH_COMPLETE)
    		{ 
      			/* Error occurred while sector erase. 
         			User can add here some code to deal with this error  */
      			err = 1;
				break;
			}
    	}
		if (!err)
			break;
  	}
	return err;
}

uint8_t F205_ProgramFlash(uint32_t addr, uint32_t data)
{
	uint32_t data32;

	if (FLASH_ProgramWord(addr, data) == FLASH_COMPLETE){

		data32 = *(__IO uint32_t*)addr;

    	if (data32 != data)
      		return 1;
		else
			return 0;
    }
    else
		return 1;
}


uint8_t F205_WriteProtection(uint32_t WRPSec, uint8_t Enable)
{
	uint32_t SectorsWRPStatus;
	uint8_t err, try = 3;

	if (WRPSec > 0x3f)
		return 5;

	while (try--){

		err = 0;

		FLASH_Unlock();
		FLASH_ClearFlag(FLASH_FLAG_EOP | FLASH_FLAG_OPERR | FLASH_FLAG_WRPERR | FLASH_FLAG_PGAERR | FLASH_FLAG_PGSERR);
	
		/* Get FLASH_WRP_SECTORS write protection status */
    	SectorsWRPStatus = FLASH_OB_GetWRP() & WRPSec;

		if (Enable){///Enable write protection

#if (FLASH_USE_PROTECTION>0)
			/* If FLASH_WRP_SECTORS are not write protected, enable the write protection */
			if (SectorsWRPStatus != 0){///至少一个SEC不是写保护

      			/* Enable the Flash option control register access */
      			FLASH_OB_Unlock();

      			/* Enable FLASH_WRP_SECTORS write protection */
      			FLASH_OB_WRPConfig(WRPSec, ENABLE); 

      			/* Start the Option Bytes programming process */  
      			if (FLASH_OB_Launch() != FLASH_COMPLETE)
        			err = 1;

      			/* Disable the Flash option control register access (recommended to protect 
        			the option Bytes against possible unwanted operations) */
      			FLASH_OB_Lock();

      			/* Get FLASH_WRP_SECTORS write protection status */
      			SectorsWRPStatus = FLASH_OB_GetWRP() & WRPSec;

      			/* Check if FLASH_WRP_SECTORS are write protected */
      			if (SectorsWRPStatus != 0x00)
					err = 1;
			}
#endif
		}

		else{

    		if (SectorsWRPStatus != WRPSec){///至少一个SEC是写保护

     			/* If FLASH_WRP_SECTORS are write protected, disable the write protection */

      			/* Enable the Flash option control register access */
      			FLASH_OB_Unlock();

      			/* Disable FLASH_WRP_SECTORS write protection */
      			FLASH_OB_WRPConfig(WRPSec, DISABLE); 

      			/* Start the Option Bytes programming process */  
      			if (FLASH_OB_Launch() != FLASH_COMPLETE)
        			err = 1;

      			/* Disable the Flash option control register access (recommended to protect 
        			the option Bytes against possible unwanted operations) */
      			FLASH_OB_Lock();

      			/* Get FLASH_WRP_SECTORS write protection status */
      			SectorsWRPStatus = FLASH_OB_GetWRP() & WRPSec;
  
      			/* Check if FLASH_WRP_SECTORS write protection is disabled */
      			if (SectorsWRPStatus != WRPSec)
					err = 1;
			}
		}
		if (!err)
			break;
	}
	return err;
}




uint8_t F205_WriteParams(uint32_t addr, uint8_t *data, uint16_t len)
{
	uint32_t tmpAddr, data32, *buf;
	uint16_t i;
	FLASH_Status status;
	
	///解除信息扇区写保护：
	if (F205_WriteProtection(PARAM_FLASH_SECTORS, DISABLE))
		return 2;
	///擦除信息扇区：
	if (F205_EraseSectors(PARAMS_START_SECTOR, PARAMS_END_SECTOR))
		return 3;
	
	buf = (uint32_t *)&(data[0]);
	tmpAddr = addr;

	for (i = 0; i < (len >> 2); i++){

		status = FLASH_ProgramWord(tmpAddr, buf[i]);
		if (status == FLASH_COMPLETE){

			data32 = *(__IO uint32_t*)tmpAddr;

    		if (data32 != buf[i])
      			return 5;
    	}
    	else
			return 4;

		tmpAddr += 4;
	}

	///校验
	tmpAddr = addr;
	for (i = 0; i < (len >> 2); i++){

		data32 = *(__IO uint32_t*)tmpAddr;

    	if (data32 != buf[i])
      		return 5;

		tmpAddr += 4;
	}

	///写保护：
	if (F205_WriteProtection(PARAM_FLASH_SECTORS, ENABLE))
		return 6;

	F205_WriteProtection(PARAM_FLASH_SECTORS, ENABLE);

	FLASH_Lock();

	return 0;
}


void F205_ReadParams(uint32_t addr, uint8_t *data, uint16_t len)
{
	uint32_t *buf;
	uint16_t i;

	buf = (uint32_t *)data;

	for (i = 0; i < (len >> 2); i++){
		
		buf[i] = *(__IO uint32_t*)addr;
		addr += 4;
	}
}

