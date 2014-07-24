/*
	FileName : bsp_sdio.c
	Description : 
	
	Created on 2103.10.18 by ZZP.
	
	Revision History:
	
*/

#include "bsp.h"
#include "bsp_sdio.h"
#include "bsp_sd.h"



///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
///					Local variables and function prototypes
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
DMA_InitTypeDef SDDMA_InitStructure;
uint32_t __TmpBuf;

void BSP_SDIO_ISRHandler(void);

///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
///						Global function realizations
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

void BSP_InitSD(void)
{
	SD_Error res;
	uint8_t sd;
	
	///GPIO 及时钟初始化：
	///SD_LowLevel_Init();
	res = SD_Init();
	if (res != SD_OK){
		
		BSP_Info.SD_Err = res;
		return;
	}
	
	sd = BSP_DetectSD();
	if (sd)
		BSP_Info.SD_NoMedia = 1;
	else
		BSP_Info.SD_NoMedia = 0;
	
	///设置 DMA：
	SD_LowLevel_DMA_TxConfig(&__TmpBuf, 0);
	SD_LowLevel_DMA_RxConfig(&__TmpBuf, 0);
	
	///允许 SDIO DMA：
	SDIO_DMACmd(ENABLE);

	///设置中断：
	SDIO_ClearITPendingBit(SDIO_IT_DATAEND);
	SDIO_ITConfig(SDIO_IT_DATAEND, ENABLE);
	BSP_IntVectSet(BSP_INT_ID_SDIO, BSP_SDIO_ISRHandler);
    BSP_IntEn(BSP_INT_ID_SDIO);
}


void BSP_EnableXferDMA(uint32_t *Buffer, uint32_t BufferSize, uint8_t Dir)
{
	SDDMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)Buffer;
	if (!Dir)
		SDDMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralToMemory;
	else
		SDDMA_InitStructure.DMA_DIR = DMA_DIR_MemoryToPeripheral;
	
	SDDMA_InitStructure.DMA_BufferSize = BufferSize;
	DMA_Init(SD_SDIO_DMA_STREAM, &SDDMA_InitStructure);

	/* DMA2 Stream3  or Stream6 enable */
	DMA_Cmd(SD_SDIO_DMA_STREAM, ENABLE);
}

/**
  * @brief  DeInitializes the SDIO interface.
  * @param  None
  * @retval None
  */
void SD_LowLevel_DeInit(void)
{
	GPIO_InitTypeDef  GPIO_InitStructure;
  
	/*!< Disable SDIO Clock */
	SDIO_ClockCmd(DISABLE);
  
	/*!< Set Power State to OFF */
	SDIO_SetPowerState(SDIO_PowerState_OFF);

	/*!< DeInitializes the SDIO peripheral */
	SDIO_DeInit();
  
	/* Disable the SDIO APB2 Clock */
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SDIO, DISABLE);

	GPIO_PinAFConfig(GPIOC, GPIO_PinSource8,	GPIO_AF_MCO);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource9,	GPIO_AF_MCO);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource10,	GPIO_AF_MCO);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource11,	GPIO_AF_MCO);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource12,	GPIO_AF_MCO);
	GPIO_PinAFConfig(GPIOD, GPIO_PinSource2,	GPIO_AF_MCO);

	/* Configure PC.08, PC.09, PC.10, PC.11 pins: D0, D1, D2, D3 pins */
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8 | GPIO_Pin_9 | GPIO_Pin_10 | GPIO_Pin_11;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOC, &GPIO_InitStructure);

	/* Configure PD.02 CMD line */
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2;
	GPIO_Init(GPIOD, &GPIO_InitStructure);

	/* Configure PC.12 pin: CLK pin */
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12;
	GPIO_Init(GPIOC, &GPIO_InitStructure);
}

/**
  * @brief  Initializes the SD Card and put it into StandBy State (Ready for 
  *         data transfer).
  * @param  None
  * @retval None
  */
void SD_LowLevel_Init(void)
{
	GPIO_InitTypeDef  GPIO_InitStructure;

	/* GPIOC and GPIOD Periph clock enable */
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC | RCC_AHB1Periph_GPIOD | SD_DETECT_GPIO_CLK, ENABLE);

	GPIO_PinAFConfig(GPIOC, GPIO_PinSource8,	GPIO_AF_SDIO);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource9,	GPIO_AF_SDIO);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource10,	GPIO_AF_SDIO);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource11,	GPIO_AF_SDIO);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource12,	GPIO_AF_SDIO);
	GPIO_PinAFConfig(GPIOD, GPIO_PinSource2,	GPIO_AF_SDIO);

	/* Configure PC.08, PC.09, PC.10, PC.11 pins: D0, D1, D2, D3 pins */
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8 | GPIO_Pin_9 | GPIO_Pin_10 | GPIO_Pin_11;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_25MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOC, &GPIO_InitStructure);

	/* Configure PD.02 CMD line */
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2;
	GPIO_Init(GPIOD, &GPIO_InitStructure);

	/* Configure PC.12 pin: CLK pin */
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOC, &GPIO_InitStructure);
  
	/*!< Configure SD_SPI_DETECT_PIN pin: SD Card detect pin */
	GPIO_InitStructure.GPIO_Pin = SD_DETECT_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(SD_DETECT_GPIO_PORT, &GPIO_InitStructure);

	/* Enable the SDIO APB2 Clock */
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SDIO, ENABLE);

	/* Enable the DMA2 Clock */
	RCC_AHB1PeriphClockCmd(SD_SDIO_DMA_CLK, ENABLE);
}

/**
  * @brief  Configures the DMA2 Channel4 for SDIO Tx request.
  * @param  BufferSRC: pointer to the source buffer
  * @param  BufferSize: buffer size
  * @retval None
  */
void SD_LowLevel_DMA_TxConfig(uint32_t *BufferSRC, uint32_t BufferSize)
{
	DMA_ClearFlag(SD_SDIO_DMA_STREAM, SD_SDIO_DMA_FLAG_FEIF | SD_SDIO_DMA_FLAG_DMEIF | SD_SDIO_DMA_FLAG_TEIF | 
					SD_SDIO_DMA_FLAG_HTIF | SD_SDIO_DMA_FLAG_TCIF);

	/* DMA2 Stream3  or Stream6 disable */
	DMA_Cmd(SD_SDIO_DMA_STREAM, DISABLE);

	/* DMA2 Stream3  or Stream6 Config */
	DMA_DeInit(SD_SDIO_DMA_STREAM);

	SDDMA_InitStructure.DMA_Channel = SD_SDIO_DMA_CHANNEL;
	SDDMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)SDIO_FIFO_ADDRESS;
	SDDMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)BufferSRC;
	SDDMA_InitStructure.DMA_DIR = DMA_DIR_MemoryToPeripheral;
	//SDDMA_InitStructure.DMA_BufferSize = 0;
	SDDMA_InitStructure.DMA_BufferSize = BufferSize;
	SDDMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
	SDDMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
	SDDMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Word;
	SDDMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Word;
	SDDMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
	SDDMA_InitStructure.DMA_Priority = DMA_Priority_VeryHigh;
	SDDMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Enable;
	SDDMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_Full;
	SDDMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_INC4;
	SDDMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_INC4;
	DMA_Init(SD_SDIO_DMA_STREAM, &SDDMA_InitStructure);

	DMA_FlowControllerConfig(SD_SDIO_DMA_STREAM, DMA_FlowCtrl_Peripheral);

	///此时保持关闭
	/* DMA2 Stream3  or Stream6 enable */
	///DMA_Cmd(SD_SDIO_DMA_STREAM, ENABLE);
	DMA_Cmd(SD_SDIO_DMA_STREAM, DISABLE);    
}

/**
  * @brief  Configures the DMA2 Channel4 for SDIO Rx request.
  * @param  BufferDST: pointer to the destination buffer
  * @param  BufferSize: buffer size
  * @retval None
  */
void SD_LowLevel_DMA_RxConfig(uint32_t *BufferDST, uint32_t BufferSize)
{

	DMA_ClearFlag(SD_SDIO_DMA_STREAM, SD_SDIO_DMA_FLAG_FEIF | SD_SDIO_DMA_FLAG_DMEIF | SD_SDIO_DMA_FLAG_TEIF | 
					SD_SDIO_DMA_FLAG_HTIF | SD_SDIO_DMA_FLAG_TCIF);
	
	/* DMA2 Stream3  or Stream6 disable */
	DMA_Cmd(SD_SDIO_DMA_STREAM, DISABLE);

	/* DMA2 Stream3 or Stream6 Config */
	DMA_DeInit(SD_SDIO_DMA_STREAM);

	SDDMA_InitStructure.DMA_Channel = SD_SDIO_DMA_CHANNEL;
	SDDMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)SDIO_FIFO_ADDRESS;
	SDDMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)BufferDST;
	SDDMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralToMemory;
	//SDDMA_InitStructure.DMA_BufferSize = 0;
	SDDMA_InitStructure.DMA_BufferSize = BufferSize;
	SDDMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
	SDDMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
	SDDMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Word;
	SDDMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Word;
	SDDMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
	SDDMA_InitStructure.DMA_Priority = DMA_Priority_VeryHigh;
	SDDMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Enable;
	SDDMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_Full;
	SDDMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_INC4;
	SDDMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_INC4;
	DMA_Init(SD_SDIO_DMA_STREAM, &SDDMA_InitStructure);

	DMA_FlowControllerConfig(SD_SDIO_DMA_STREAM, DMA_FlowCtrl_Peripheral);

	///此时保持关闭
	/* DMA2 Stream3  or Stream6 enable */
	///DMA_Cmd(SD_SDIO_DMA_STREAM, ENABLE);
	DMA_Cmd(SD_SDIO_DMA_STREAM, DISABLE);
}

/**
  * @brief  Returns the DMA End Of Transfer Status.
  * @param  None
  * @retval DMA SDIO Stream Status.
  */
uint32_t SD_DMAEndOfTransferStatus(void)
{
	return (uint32_t)DMA_GetFlagStatus(SD_SDIO_DMA_STREAM, SD_SDIO_DMA_FLAG_TCIF);
}




///
void BSP_SDIO_ISRHandler(void)
{
	if (StopCondition == 1)
	{
		SDIO->ARG = 0x0;
		SDIO->CMD = 0x44C;
		TransferError = CmdResp1Error(SD_CMD_STOP_TRANSMISSION);
	}
	else
	{
		TransferError = SD_OK;
	}
	SDIO_ClearITPendingBit(SDIO_IT_DATAEND);
	TransferEnd = 1;
	
	if (BSP_Info.SDCallBack)
		BSP_Info.SDCallBack(0, NULL);
}









