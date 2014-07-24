/*
	FileName : BSP_usart.c
	Description : 
		USART 硬件驱动程序。
	Created on 2013.07.30 by ZZP.

	Revision History:

*/

#include  <cpu.h>
#include "stm32f2xx.h"
#include "stm32f2xx_rcc.h"
#include "stm32f2xx_gpio.h"
#include "stm32f2xx_usart.h"

#include "bsp.h"


///需要使用 DMA 中断：因可能产生 FIFO 错误，必须清除其标志
#define USART_USE_DMA_INTERRUPT			1



//////////////////////////////////////////////////////////////////
//					USART ports
//////////////////////////////////////////////////////////////////


USART_TypeDef* COM_USART[COMn] = {PRD_COM1, PRD_COM2, PRD_COM3, PRD_COM4, PRD_COM5, PRD_COM6}; 

GPIO_TypeDef* COM_TX_PORT[COMn] = {	PRD_COM1_TX_GPIO_PORT,
									PRD_COM2_TX_GPIO_PORT,
									PRD_COM3_TX_GPIO_PORT,
									PRD_COM4_TX_GPIO_PORT,
									PRD_COM5_TX_GPIO_PORT,
									PRD_COM6_TX_GPIO_PORT,
									};
 
GPIO_TypeDef* COM_RX_PORT[COMn] = {	PRD_COM1_RX_GPIO_PORT, 
									PRD_COM2_RX_GPIO_PORT, 
									PRD_COM3_RX_GPIO_PORT, 
									PRD_COM4_RX_GPIO_PORT, 
									PRD_COM5_RX_GPIO_PORT, 
									PRD_COM6_RX_GPIO_PORT 
									};

const uint32_t COM_USART_CLK[COMn] = {	PRD_COM1_CLK,
										PRD_COM2_CLK,
										PRD_COM3_CLK,
										PRD_COM4_CLK,
										PRD_COM5_CLK,
										PRD_COM6_CLK
										};

const uint32_t COM_TX_PORT_CLK[COMn] = {PRD_COM1_TX_GPIO_CLK,
										PRD_COM2_TX_GPIO_CLK,
										PRD_COM3_TX_GPIO_CLK,
										PRD_COM4_TX_GPIO_CLK,
										PRD_COM5_TX_GPIO_CLK,
										PRD_COM6_TX_GPIO_CLK
										};
 
const uint32_t COM_RX_PORT_CLK[COMn] = {PRD_COM1_RX_GPIO_CLK,
										PRD_COM2_RX_GPIO_CLK,
										PRD_COM3_RX_GPIO_CLK,
										PRD_COM4_RX_GPIO_CLK,
										PRD_COM5_RX_GPIO_CLK,
										PRD_COM6_RX_GPIO_CLK
										};

const uint16_t COM_TX_PIN[COMn] = {	PRD_COM1_TX_PIN,
									PRD_COM2_TX_PIN,
									PRD_COM3_TX_PIN,
									PRD_COM4_TX_PIN,
									PRD_COM5_TX_PIN,
									PRD_COM6_TX_PIN
									};

const uint16_t COM_RX_PIN[COMn] = {	PRD_COM1_RX_PIN,
									PRD_COM2_RX_PIN,
									PRD_COM3_RX_PIN,
									PRD_COM4_RX_PIN,
									PRD_COM5_RX_PIN,
									PRD_COM6_RX_PIN
									};
 
const uint8_t COM_TX_PIN_SOURCE[COMn] = {	PRD_COM1_TX_SOURCE,
											PRD_COM2_TX_SOURCE,
											PRD_COM3_TX_SOURCE,
											PRD_COM4_TX_SOURCE,
											PRD_COM5_TX_SOURCE,
											PRD_COM6_TX_SOURCE
											};

const uint8_t COM_RX_PIN_SOURCE[COMn] = {	PRD_COM1_RX_SOURCE,
											PRD_COM2_RX_SOURCE,
											PRD_COM3_RX_SOURCE,
											PRD_COM4_RX_SOURCE,
											PRD_COM5_RX_SOURCE,
											PRD_COM6_RX_SOURCE
											};
 
const uint8_t COM_TX_AF[COMn] = {	PRD_COM1_TX_AF,
									PRD_COM2_TX_AF,
									PRD_COM3_TX_AF,
									PRD_COM4_TX_AF,
									PRD_COM5_TX_AF,
									PRD_COM6_TX_AF
									};
 
const uint8_t COM_RX_AF[COMn] = {	PRD_COM1_TX_AF,
									PRD_COM2_TX_AF,
									PRD_COM3_TX_AF,
									PRD_COM4_TX_AF,
									PRD_COM5_TX_AF,
									PRD_COM6_TX_AF
									};


const USART_DMA UsartDmaInfo[COMn] = {
				USART1_DMA_STREAM, USART1_DATA_REG_ADDR, USART1_DMA_CHANNEL, USART1_DMA_IT_TCIF, USART1_DMA_IT_TEIF, USART1_DMA_IT_FEIF, USART1_DMA_FLAG_TCIF, USART1_DMA_INT_ID, 
				USART2_DMA_STREAM, USART2_DATA_REG_ADDR, USART2_DMA_CHANNEL, USART2_DMA_IT_TCIF, USART2_DMA_IT_TEIF, USART2_DMA_IT_FEIF, USART2_DMA_FLAG_TCIF, USART2_DMA_INT_ID,
				USART3_DMA_STREAM, USART3_DATA_REG_ADDR, USART3_DMA_CHANNEL, USART3_DMA_IT_TCIF, USART3_DMA_IT_TEIF, USART3_DMA_IT_FEIF, USART3_DMA_FLAG_TCIF, USART3_DMA_INT_ID,
				USART4_DMA_STREAM, USART4_DATA_REG_ADDR, USART4_DMA_CHANNEL, USART4_DMA_IT_TCIF, USART4_DMA_IT_TEIF, USART4_DMA_IT_FEIF, USART4_DMA_FLAG_TCIF, USART4_DMA_INT_ID,
				USART5_DMA_STREAM, USART5_DATA_REG_ADDR, USART5_DMA_CHANNEL, USART5_DMA_IT_TCIF, USART5_DMA_IT_TEIF, USART5_DMA_IT_FEIF, USART5_DMA_FLAG_TCIF, USART5_DMA_INT_ID,
				USART6_DMA_STREAM, USART6_DATA_REG_ADDR, USART6_DMA_CHANNEL, USART6_DMA_IT_TCIF, USART6_DMA_IT_TEIF, USART6_DMA_IT_FEIF, USART6_DMA_FLAG_TCIF, USART6_DMA_INT_ID
			};

const uint32_t UsartIntID[COMn] = {	USART1_INT_ID,
									USART2_INT_ID,
									USART3_INT_ID,
									USART4_INT_ID,
									USART5_INT_ID,
									USART6_INT_ID
								};


////////////////////////////////////////////////////////////////////////
///					USART global variables
////////////////////////////////////////////////////////////////////////
OS_EVENT	*Sem_UsartTxRdy[COMn];






////////////////////////////////////////////////////////////////////////
///						Local function prototypes
////////////////////////////////////////////////////////////////////////
void USART_DMAConfig(COM_TypeDef COM);


#define MAX_DMA_ISR		COMn

void (*UsartDmaIsr[MAX_DMA_ISR])(void);
void Usart1_Dma_Isr(void);
void Usart2_Dma_Isr(void);
void Usart3_Dma_Isr(void);
void Usart4_Dma_Isr(void);
void Usart5_Dma_Isr(void);
void Usart6_Dma_Isr(void);

#define MAX_USART_ISR	COMn
								
void (*UsartIsr[MAX_USART_ISR])(void);
void Usart1_Isr(void);
void Usart2_Isr(void);
void Usart3_Isr(void);
void Usart4_Isr(void);
void Usart5_Isr(void);
void Usart6_Isr(void);


////////////////////////////////////////////////////////////////////////////////////////
///							Global functions realizations
////////////////////////////////////////////////////////////////////////////////////////
/**
  * @brief  Configures COM port.
  * @param  COM: Specifies the COM port to be configured.
  *   This parameter can be one of following parameters:    
  *     @arg COM1
  *     @arg COM2  
  * @param  USART_InitStruct: pointer to a USART_InitTypeDef structure that
  *   contains the configuration information for the specified USART peripheral.
  * @retval None
  */
void BSP_USART_Init(COM_TypeDef COM, USART_InitTypeDef* USART_InitStruct, uint8_t MultiMode, uint8_t Addr)
{
	GPIO_InitTypeDef GPIO_InitStructure;

	/* Enable GPIO clock */
	RCC_AHB1PeriphClockCmd(COM_TX_PORT_CLK[COM] | COM_RX_PORT_CLK[COM], ENABLE);

	if ((COM == COM1) || (COM == COM6)){
		/* Enable UART clock */
		RCC_APB2PeriphClockCmd(COM_USART_CLK[COM], ENABLE);
	}
	else
		RCC_APB1PeriphClockCmd(COM_USART_CLK[COM], ENABLE);

	/* Connect PXx to USARTx_Tx*/
	GPIO_PinAFConfig(COM_TX_PORT[COM], COM_TX_PIN_SOURCE[COM], COM_TX_AF[COM]);

	/* Connect PXx to USARTx_Rx*/
	GPIO_PinAFConfig(COM_RX_PORT[COM], COM_RX_PIN_SOURCE[COM], COM_RX_AF[COM]);

	/* Configure USART Tx as alternate function  */
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;

	GPIO_InitStructure.GPIO_Pin = COM_TX_PIN[COM];
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(COM_TX_PORT[COM], &GPIO_InitStructure);

	/* Configure USART Rx as alternate function  */
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_Pin = COM_RX_PIN[COM];
	GPIO_Init(COM_RX_PORT[COM], &GPIO_InitStructure);


	///L1205: 为得到高速率，需要8x采样
	///本应用中速率 57600BPS，采用 16x 采样即可
	USART_OverSampling8Cmd(COM_USART[COM], DISABLE);

	/* USART configuration */
	USART_Init(COM_USART[COM], USART_InitStruct);
	
	///
	if (MultiMode){
		USART_SetAddress(COM_USART[COM], Addr);
		USART_WakeUpConfig(COM_USART[COM], USART_WakeUp_AddressMark);
	}

  	///L1205: 允许发送完成中断和接收中断
  	USART_ITConfig(COM_USART[COM], USART_IT_TC, 	ENABLE);
	USART_ITConfig(COM_USART[COM], USART_IT_RXNE, 	ENABLE);
	USART_ITConfig(COM_USART[COM], USART_IT_ORE,	ENABLE);

  	///L1205：由于不确定接收长度，接收时不能采用 DMA 方式，发送时可采用 DMA 方式
  	USART_DMAConfig(COM);
#if (USART_USE_DMA_INTERRUPT)
	///允许发送DMA中断
	DMA_ITConfig(UsartDmaInfo[COM].stream, DMA_IT_TC, ENABLE);
	DMA_ClearFlag(UsartDmaInfo[COM].stream, UsartDmaInfo[COM].DMA_FlagTCIF);
	///
	BSP_IntVectSet(UsartDmaInfo[COM].DMA_Int_ID, *UsartDmaIsr[COM]);
    BSP_IntEn(UsartDmaInfo[COM].DMA_Int_ID);
#endif///USART_USE_DMA_INTERRUPT

	///串口接收中断设置
	BSP_IntVectSet(UsartIntID[COM], *UsartIsr[COM]);
    BSP_IntEn(UsartIntID[COM]);
    
  	/* Enable USART */
  	USART_Cmd(COM_USART[COM], ENABLE);	
	USART_ClearFlag(COM_USART[COM], USART_FLAG_TC);
	
	///
	if (MultiMode)
		USART_ReceiverWakeUpCmd(COM_USART[COM], ENABLE);

	///注意：此处不能开！
	/* DMA2_Stream7 disable here*/
  	DMA_Cmd(UsartDmaInfo[COM].stream, DISABLE);
}



///采用 DMA 方式发送数据
void BSP_USART_TxData(COM_TypeDef COM, uint16_t len)
{ 
	///设置 DMA 长度并启动 DMA 发送
	DMA_SetCurrDataCounter(UsartDmaInfo[COM].stream, len);
	/* DMA2_Stream7 enable */
  	DMA_Cmd(UsartDmaInfo[COM].stream, ENABLE);
}


///查询发送状态：
///0--DISABLE；1--ENABLE
uint8_t BSP_GetUsartTxStatus(COM_TypeDef COM)
{
	if (DMA_GetCmdStatus(UsartDmaInfo[COM].stream) == DISABLE)
		return ENABLE;

	return DISABLE;
}

//////////////////////////////////////////////////////////////////////////////////
///						Local functions realizations
//////////////////////////////////////////////////////////////////////////////////

///USART TX DMA设置
void USART_DMAConfig(COM_TypeDef COM)
{
  	DMA_InitTypeDef DMA_InitStructure;

	/* Enable peripheral clocks *************************************************/
	if ((COM == COM1) || (COM == COM6))
		RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA2, ENABLE); 
	else
		RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1, ENABLE); 

  	///USART : DMAX Channel Y, stream Z
  	DMA_InitStructure.DMA_Channel = UsartDmaInfo[COM].DMA_Channel;
  	DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)&(BSP_Info.UsartTxBuf[COM][0]);
  	DMA_InitStructure.DMA_PeripheralBaseAddr = UsartDmaInfo[COM].DataRegAddr;
  	DMA_InitStructure.DMA_DIR = DMA_DIR_MemoryToPeripheral;
  	DMA_InitStructure.DMA_BufferSize = 0;///此处初始化成0
  	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
  	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
  	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
  	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;

	///circular 方式下，数据长度会重新加载，但地址是否重新加载？需要确认
	///DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
	///Normal 方式下，数据长度每次需要设置，地址似乎自动保持：
  	DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;

  	DMA_InitStructure.DMA_Priority = DMA_Priority_High;
  	DMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Disable;         
  	DMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_Full;
  	DMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_Single;
  	DMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_Single;
  	DMA_Init(UsartDmaInfo[COM].stream, &DMA_InitStructure);

	USART_DMACmd(COM_USART[COM], USART_DMAReq_Tx, ENABLE);
}



////////////////////////////////////////////////////
///	USART 中断服务程序
////////////////////////////////////////////////////

void Usart1_Isr(void)
{
	CPU_REG32  status;
	uint16_t data;
	uint16_t Index;

	status = USART1->SR;

	///RX
	if (status & 0x28){
		
		if (DEF_BIT_IS_SET(status, DEF_BIT_03))
			USART_ClearITPendingBit(USART1, USART_IT_ORE);


		data = USART_ReceiveData(USART1);       			/* Read one byte from the receive data register.      */
		Index = BSP_Info.UsartRxIndex[COM1];
#if defined USART_1_MULTI_COMMUNICATION
		*((uint16_t *)&(BSP_Info.UsartRxBuf[COM1][Index])) = data;
#else
		BSP_Info.UsartRxBuf[COM1][Index] = data & 0xff;
#endif
		BSP_Info.UsartRxIndex[COM1]++;
		BSP_Info.UsartRxIndex[COM1] &= BSP_Info.UsartRxBufMask[COM1];
	}

	///TXC
	if (DEF_BIT_IS_SET(status, DEF_BIT_06)){

		USART_ClearITPendingBit(USART1, USART_IT_TC);         /* Clear the USART1 Transmit interrupt.                */
		///关闭发送控制
		BSP_EnableUsartTx(COM1, DISABLE);
		///允许下一帧发送
		OSSemPost(Sem_UsartTxRdy[COM1]);
	}
}


void Usart2_Isr(void)
{
	CPU_REG32  status;
	uint16_t data;
	uint16_t Index;

	status = USART2->SR;

	///RX
	if (status & 0x28){
		
		if (DEF_BIT_IS_SET(status, DEF_BIT_03))
			USART_ClearITPendingBit(USART2, USART_IT_ORE);


		data = USART_ReceiveData(USART2);       			/* Read one byte from the receive data register.      */
		Index = BSP_Info.UsartRxIndex[COM2];
#if defined USART_2_MULTI_COMMUNICATION
		*((uint16_t *)&(BSP_Info.UsartRxBuf[COM2][Index])) = data;
#else
		BSP_Info.UsartRxBuf[COM2][Index] = data & 0xff;
#endif
		BSP_Info.UsartRxIndex[COM2]++;
		BSP_Info.UsartRxIndex[COM2] &= BSP_Info.UsartRxBufMask[COM2];
	}

	///TXC
	if (DEF_BIT_IS_SET(status, DEF_BIT_06)){

		USART_ClearITPendingBit(USART2, USART_IT_TC);         /* Clear the USART1 Transmit interrupt.                */
		///关闭发送控制
		BSP_EnableUsartTx(COM2, DISABLE);
		///允许下一帧发送
		OSSemPost(Sem_UsartTxRdy[COM2]);
	}
}


void Usart3_Isr(void)
{
	CPU_REG32  status;
	uint16_t data;
	uint16_t Index;

	status = USART3->SR;

	///RX
	if (status & 0x28){
		
		if (DEF_BIT_IS_SET(status, DEF_BIT_03))
			USART_ClearITPendingBit(USART3, USART_IT_ORE);


		data = USART_ReceiveData(USART3);       			/* Read one byte from the receive data register.      */
		Index = BSP_Info.UsartRxIndex[COM3];
#if defined USART_3_MULTI_COMMUNICATION
		*((uint16_t *)&(BSP_Info.UsartRxBuf[COM3][Index])) = data;
#else
		BSP_Info.UsartRxBuf[COM3][Index] = data & 0xff;
#endif
		BSP_Info.UsartRxIndex[COM3]++;
		BSP_Info.UsartRxIndex[COM3] &= BSP_Info.UsartRxBufMask[COM3];
	}

	///TXC
	if (DEF_BIT_IS_SET(status, DEF_BIT_06)){

		USART_ClearITPendingBit(USART3, USART_IT_TC);         /* Clear the USART1 Transmit interrupt.                */
		///关闭发送控制
		BSP_EnableUsartTx(COM3, DISABLE);
		///允许下一帧发送
		OSSemPost(Sem_UsartTxRdy[COM3]);
	}
}


void Usart4_Isr(void)
{
	CPU_REG32  status;
	uint16_t data;
	uint16_t Index;

	status = UART4->SR;

	///RX
	if (status & 0x28){
		
		if (DEF_BIT_IS_SET(status, DEF_BIT_03))
			USART_ClearITPendingBit(UART4, USART_IT_ORE);


		data = USART_ReceiveData(UART4);       			/* Read one byte from the receive data register.      */
		Index = BSP_Info.UsartRxIndex[COM4];
#if defined USART_4_MULTI_COMMUNICATION
		*((uint16_t *)&(BSP_Info.UsartRxBuf[COM4][Index])) = data;
#else
		BSP_Info.UsartRxBuf[COM4][Index] = data & 0xff;
#endif
		BSP_Info.UsartRxIndex[COM4]++;
		BSP_Info.UsartRxIndex[COM4] &= BSP_Info.UsartRxBufMask[COM4];
	}

	///TXC
	if (DEF_BIT_IS_SET(status, DEF_BIT_06)){

		USART_ClearITPendingBit(UART4, USART_IT_TC);         /* Clear the USART1 Transmit interrupt.                */
		///关闭发送控制
		BSP_EnableUsartTx(COM4, DISABLE);
		///允许下一帧发送
		OSSemPost(Sem_UsartTxRdy[COM4]);
	}
}


void Usart5_Isr(void)
{
	CPU_REG32  status;
	uint16_t data;
	uint16_t Index;

	status = UART5->SR;

	///RX
	if (status & 0x28){
		
		if (DEF_BIT_IS_SET(status, DEF_BIT_03))
			USART_ClearITPendingBit(UART5, USART_IT_ORE);


		data = USART_ReceiveData(UART5);       			/* Read one byte from the receive data register.      */
		Index = BSP_Info.UsartRxIndex[COM5];
#if defined USART_5_MULTI_COMMUNICATION
		*((uint16_t *)&(BSP_Info.UsartRxBuf[COM5][Index])) = data;
#else
		BSP_Info.UsartRxBuf[COM5][Index] = data & 0xff;
#endif
		BSP_Info.UsartRxIndex[COM5]++;
		BSP_Info.UsartRxIndex[COM5] &= BSP_Info.UsartRxBufMask[COM5];
	}

	///TXC
	if (DEF_BIT_IS_SET(status, DEF_BIT_06)){

		USART_ClearITPendingBit(UART5, USART_IT_TC);         /* Clear the USART1 Transmit interrupt.                */
		///关闭发送控制
		BSP_EnableUsartTx(COM5, DISABLE);
		///允许下一帧发送
		OSSemPost(Sem_UsartTxRdy[COM5]);
	}
}


void Usart6_Isr(void)
{
	CPU_REG32  status;
	uint16_t data;
	uint16_t Index;

	status = USART6->SR;

	///RX
	if (status & 0x28){
		
		if (DEF_BIT_IS_SET(status, DEF_BIT_03))
			USART_ClearITPendingBit(USART6, USART_IT_ORE);


		data = USART_ReceiveData(USART6);       			/* Read one byte from the receive data register.      */
		Index = BSP_Info.UsartRxIndex[COM6];
#if defined USART_6_MULTI_COMMUNICATION
		*((uint16_t *)&(BSP_Info.UsartRxBuf[COM6][Index])) = data;
#else
		BSP_Info.UsartRxBuf[COM6][Index] = data & 0xff;
#endif
		BSP_Info.UsartRxIndex[COM6]++;
		BSP_Info.UsartRxIndex[COM6] &= BSP_Info.UsartRxBufMask[COM6];
	}

	///TXC
	if (DEF_BIT_IS_SET(status, DEF_BIT_06)){

		USART_ClearITPendingBit(USART6, USART_IT_TC);         /* Clear the USART1 Transmit interrupt.                */
		///关闭发送控制
		BSP_EnableUsartTx(COM6, DISABLE);
		///允许下一帧发送
		OSSemPost(Sem_UsartTxRdy[COM6]);
	}
}



////////////////////////////////////////////////////
///	USART DMA 中断服务程序
////////////////////////////////////////////////////
#if (USART_USE_DMA_INTERRUPT)

///DMA2, Stream7, channel 4
void Usart1_Dma_Isr(void)
{
	CPU_REG32  status;

	status = DMA2->HISR;

	///DMA 传送完成
	if (DEF_BIT_IS_SET(status, DEF_BIT_27)){
		DMA_ClearITPendingBit(UsartDmaInfo[COM1].stream, UsartDmaInfo[COM1].DMA_ItTCIF);
		
	}

	///DMA 传送错误
	if (DEF_BIT_IS_SET(status, DEF_BIT_25))
		DMA_ClearITPendingBit(UsartDmaInfo[COM1].stream, UsartDmaInfo[COM1].DMA_ItTEIF);	

	///DMA FIFO 错误
	if (DEF_BIT_IS_SET(status, DEF_BIT_22))
		DMA_ClearITPendingBit(UsartDmaInfo[COM1].stream, UsartDmaInfo[COM1].DMA_ItFEIF);	
}


///DMA1, Stream6, channel 4
void Usart2_Dma_Isr(void)
{
	CPU_REG32  status;

	status = DMA1->HISR;

	///DMA 传送完成
	if (DEF_BIT_IS_SET(status, DEF_BIT_21)){
		DMA_ClearITPendingBit(UsartDmaInfo[COM2].stream, UsartDmaInfo[COM2].DMA_ItTCIF);
		
	}

	///DMA 传送错误
	if (DEF_BIT_IS_SET(status, DEF_BIT_19))
		DMA_ClearITPendingBit(UsartDmaInfo[COM2].stream, UsartDmaInfo[COM2].DMA_ItTEIF);	

	///DMA FIFO 错误
	if (DEF_BIT_IS_SET(status, DEF_BIT_16))
		DMA_ClearITPendingBit(UsartDmaInfo[COM2].stream, UsartDmaInfo[COM2].DMA_ItFEIF);	
}


///DMA1, Stream3, channel 4
void Usart3_Dma_Isr(void)
{
	CPU_REG32  status;

	status = DMA1->LISR;

	///DMA 传送完成
	if (DEF_BIT_IS_SET(status, DEF_BIT_27)){
		DMA_ClearITPendingBit(UsartDmaInfo[COM3].stream, UsartDmaInfo[COM3].DMA_ItTCIF);
		
	}

	///DMA 传送错误
	if (DEF_BIT_IS_SET(status, DEF_BIT_25))
		DMA_ClearITPendingBit(UsartDmaInfo[COM3].stream, UsartDmaInfo[COM3].DMA_ItTEIF);	

	///DMA FIFO 错误
	if (DEF_BIT_IS_SET(status, DEF_BIT_22))
		DMA_ClearITPendingBit(UsartDmaInfo[COM3].stream, UsartDmaInfo[COM3].DMA_ItFEIF);	
}


///DMA1, Stream4, channel 4
void Usart4_Dma_Isr(void)
{
	CPU_REG32  status;

	status = DMA1->HISR;

	///DMA 传送完成
	if (DEF_BIT_IS_SET(status, DEF_BIT_05)){
		DMA_ClearITPendingBit(UsartDmaInfo[COM4].stream, UsartDmaInfo[COM4].DMA_ItTCIF);
		
	}

	///DMA 传送错误
	if (DEF_BIT_IS_SET(status, DEF_BIT_03))
		DMA_ClearITPendingBit(UsartDmaInfo[COM4].stream, UsartDmaInfo[COM4].DMA_ItTEIF);	

	///DMA FIFO 错误
	if (DEF_BIT_IS_SET(status, DEF_BIT_00))
		DMA_ClearITPendingBit(UsartDmaInfo[COM4].stream, UsartDmaInfo[COM4].DMA_ItFEIF);	
}


///DMA1, Stream7, channel 4
void Usart5_Dma_Isr(void)
{
	CPU_REG32  status;

	status = DMA1->HISR;

	///DMA 传送完成
	if (DEF_BIT_IS_SET(status, DEF_BIT_27)){
		DMA_ClearITPendingBit(UsartDmaInfo[COM5].stream, UsartDmaInfo[COM5].DMA_ItTCIF);
		
	}

	///DMA 传送错误
	if (DEF_BIT_IS_SET(status, DEF_BIT_25))
		DMA_ClearITPendingBit(UsartDmaInfo[COM5].stream, UsartDmaInfo[COM5].DMA_ItTEIF);	

	///DMA FIFO 错误
	if (DEF_BIT_IS_SET(status, DEF_BIT_22))
		DMA_ClearITPendingBit(UsartDmaInfo[COM5].stream, UsartDmaInfo[COM5].DMA_ItFEIF);	
}


///DMA2, Stream6, channel 5
void Usart6_Dma_Isr(void)
{
	CPU_REG32  status;

	status = DMA2->HISR;

	///DMA 传送完成
	if (DEF_BIT_IS_SET(status, DEF_BIT_21)){
		DMA_ClearITPendingBit(UsartDmaInfo[COM6].stream, UsartDmaInfo[COM6].DMA_ItTCIF);
		
	}

	///DMA 传送错误
	if (DEF_BIT_IS_SET(status, DEF_BIT_19))
		DMA_ClearITPendingBit(UsartDmaInfo[COM6].stream, UsartDmaInfo[COM6].DMA_ItTEIF);	

	///DMA FIFO 错误
	if (DEF_BIT_IS_SET(status, DEF_BIT_16))
		DMA_ClearITPendingBit(UsartDmaInfo[COM6].stream, UsartDmaInfo[COM6].DMA_ItFEIF);	
}
#endif ///(USART_USE_DMA_INTERRUPT==ENABLE)






void (*UsartDmaIsr[MAX_DMA_ISR])(void) = 
{
	Usart1_Dma_Isr,	
	Usart2_Dma_Isr,	
	Usart3_Dma_Isr,	
	Usart4_Dma_Isr,	
	Usart5_Dma_Isr,	
	Usart6_Dma_Isr
};

void (*UsartIsr[MAX_USART_ISR])(void) = 
{
	Usart1_Isr,	
	Usart2_Isr,	
	Usart3_Isr,	
	Usart4_Isr,	
	Usart5_Isr,	
	Usart6_Isr
};








