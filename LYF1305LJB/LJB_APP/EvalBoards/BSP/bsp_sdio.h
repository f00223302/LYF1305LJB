/*
	FileName : bsp_sdio.h
	Description : 
	
	Created on 2103.10.18 by ZZP.
	
	Revision History:
	
*/


#ifndef __BSP_SDIO_H__
#define __BSP_SDIO_H__

#include "core_cm3.h"

/**
  * @brief  SD FLASH SDIO Interface
  */
#define SD_DETECT_PIN					GPIO_Pin_15                 /* PB.15 */
#define SD_DETECT_GPIO_PORT				GPIOB                       /* GPIOB */
#define SD_DETECT_GPIO_CLK				RCC_AHB1Periph_GPIOB
   
#define SDIO_FIFO_ADDRESS				((uint32_t)0x40012C80)
/** 
  * @brief  SDIO Intialization Frequency (400KHz max)
  */
#define SDIO_INIT_CLK_DIV				((uint8_t)0x76)
/** 
  * @brief  SDIO Data Transfer Frequency (25MHz max) 
  */
#define SDIO_TRANSFER_CLK_DIV				((uint8_t)0x0) 

#define SD_SDIO_DMA						DMA2
#define SD_SDIO_DMA_CLK					RCC_AHB1Periph_DMA2
 
#define SD_SDIO_DMA_STREAM				DMA2_Stream3
#define SD_SDIO_DMA_CHANNEL				DMA_Channel_4
#define SD_SDIO_DMA_FLAG_FEIF			DMA_FLAG_FEIF3
#define SD_SDIO_DMA_FLAG_DMEIF			DMA_FLAG_DMEIF3
#define SD_SDIO_DMA_FLAG_TEIF			DMA_FLAG_TEIF3
#define SD_SDIO_DMA_FLAG_HTIF			DMA_FLAG_HTIF3
#define SD_SDIO_DMA_FLAG_TCIF			DMA_FLAG_TCIF3 





void BSP_InitSD(void);
void BSP_EnableXferDMA(uint32_t *Buffer, uint32_t BufferSize, uint8_t Dir);


void SD_LowLevel_DeInit(void);
void SD_LowLevel_Init(void); 
void SD_LowLevel_DMA_TxConfig(uint32_t *BufferSRC, uint32_t BufferSize);
void SD_LowLevel_DMA_RxConfig(uint32_t *BufferDST, uint32_t BufferSize);
uint32_t SD_DMAEndOfTransferStatus(void);

void BSP_EnableXferDMA(uint32_t *Buffer, uint32_t BufferSize, uint8_t Dir);



#endif///EOF



