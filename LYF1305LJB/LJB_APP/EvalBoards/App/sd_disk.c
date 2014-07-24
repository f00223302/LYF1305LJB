/*
	FileName : sd_disk.c
	Description : 
	
	Created on 2013.10.25 by ZZP.
	
	Revision History:
	
*/


#include "sd_disk.h"
#include "bsp.h"

#define MULTI_BLOCK_ACCESS_ENABLE	1


/////////////////////////////////////////////////////////////////////////////////////
///					SD 全局函数实现
/////////////////////////////////////////////////////////////////////////////////////
DSTATUS MMC_disk_initialize(BYTE drv)
{
	DSTATUS res = 0;
	
	if (BSP_Info.SD_Protected)
		res |= STA_PROTECT;
	if (BSP_Info.SD_NoMedia)
		res |= STA_NODISK;
	
	return res;
}

DSTATUS MMC_disk_status(BYTE drv)
{
	DSTATUS res = 0;
	uint8_t sd;
	
	sd = BSP_DetectSD();
	if (sd)
		BSP_Info.SD_NoMedia = 1;
	else
		BSP_Info.SD_NoMedia = 0;
	
	if (BSP_Info.SD_Protected)
		res |= STA_PROTECT;
	if (BSP_Info.SD_NoMedia)
		res |= STA_NODISK;
	
	return res;
}

DRESULT MMC_disk_read(BYTE drv, uint8_t *buff, uint32_t sector, uint8_t count)
{
#if !MULTI_BLOCK_ACCESS_ENABLE
	uint8_t remaining = count;	
	uint32_t block;
#endif
	SD_Error status = SD_OK;
	DRESULT res = RES_OK;
	
	if (BSP_Info.SD_NoMedia)
		return RES_ERROR;

#if MULTI_BLOCK_ACCESS_ENABLE	
	status = SD_ReadMultiBlocks(buff, sector, 512, count);
	if (status == SD_OK)
		res = RES_OK;
	else
		res = RES_ERROR;
#else
	block = sector;
	while (remaining--){
		
		status = SD_ReadMultiBlocks(buff, block, 512, 1);
		block++;
		if (status != SD_OK)
			return RES_ERROR;
	}
#endif
	
	return res;
}

DRESULT MMC_disk_write(BYTE drv, uint8_t *buff, uint32_t sector, uint8_t count)
{
#if !MULTI_BLOCK_ACCESS_ENABLE
	uint8_t remaining = count;	
	uint32_t block;
#endif
	SD_Error status = SD_OK;
	DRESULT res = RES_OK;
	
	if (BSP_Info.SD_NoMedia)
		return RES_ERROR;

#if MULTI_BLOCK_ACCESS_ENABLE	
	status = SD_WriteMultiBlocks(buff, sector, 512, count);
	if (status == SD_OK)
		res = RES_OK;
	else
		res = RES_ERROR;
#else
	block = sector;
	while (remaining--){
		
		status = SD_WriteMultiBlocks(buff, block, 512, 1);
		block++;
		if (status != SD_OK)
			return RES_ERROR;
	}
#endif
	
	return res;
}

DRESULT MMC_disk_ioctl(BYTE drv, uint8_t cmd, void *buff)
{
	DRESULT res = RES_OK;
	
	switch (cmd){
		
		case GET_SECTOR_COUNT:
			*(uint32_t *)buff = SDCardInfo.CardCapacity;
			break;
		case GET_SECTOR_SIZE:
			*(uint32_t *)buff = 512;
			break;
		case GET_BLOCK_SIZE:
			*(uint32_t *)buff = 32;
			break;
		default:
			res = RES_ERROR;
			break;
	}
	
	return res;
}






