/*
	FileName : sd_disk.h
	Description : 
	
	Created on 2013.10.25 by ZZP.
	
	Revision History:
	
*/


#ifndef __SD_DISK_H__
#define __SD_DISK_H__


#include "integer.h"
#include "bsp_sd.h"
#include "diskio.h"




DSTATUS MMC_disk_initialize(BYTE drv);
DSTATUS MMC_disk_status(BYTE drv);
DRESULT MMC_disk_read(BYTE drv, uint8_t *buff, uint32_t sector, uint8_t count);
DRESULT MMC_disk_write(BYTE drv, uint8_t *buff, uint32_t sector, uint8_t count);
DRESULT MMC_disk_ioctl(BYTE drv, uint8_t cmd, void *buff);



#endif///EOF



