/*
	FileName : BSP_DAC.c
	Description :
	
		DAC 用法1：DMA，只有DAC1。采用 TIM6 作为定时触发时钟。
			假定DAC数据不太长（小于64K byte）
			1、应用程序准备好数据，写入指定的缓冲区；
			2、调用BSP_DAC_Start（）函数；（包括设置DMA参数、允许DMA以及打开TIM6）
			3、DMA传送完毕，自动关闭TIM6，从而关闭DAC输出
			
			对于很长的数据，DAC 输出应采用乒乓缓冲区。
			1、应用程序实现 DAC_CallBack（）函数，处理何时关闭 TIM6 结束 DAC 以及当 DMA 完成一个缓冲区的传送时，
				切换到下一个缓冲区。
			2、应用程序准备好两个缓冲区数据，调用 BSP_DAC_Start（）开始 DAC ；
			3、当 DMA 中断时，DAC 任务准备下一个缓冲区数据。
			注意：DAC 缓冲区长度应足够长，以保证 DAC 任务能及时完成数据准备。
			
		DAC 用法2：不用DMA方式：暂未实现

	Created on 2013.07.30 by ZZP.

	Revision History:

*/


#include "bsp.h"



////////////////////////////////////////////////////////////////////////////////
///					Local defines
////////////////////////////////////////////////////////////////////////////////
///只使用DAC1，软件触发方式
///#define DAC_METHOD_SINGLE		1
///使用DAC1，DAC2，软件出发方式
///#define DAC_METHOD_DUAL			2
///只使用DAC1，DMA，硬件触发方式
#define DAC_METHOD_DMA			3
///DAC采用哪种方式：
#define DAC_METHOD				(DAC_METHOD_DMA)


///是否使用DMA传数据
#define DAC_USE_DMA				1

///DAC是否中断
#define DAC_USE_INTERRUPT		0
///DAC DMA是否中断
#define DAC_DMA_USE_INTERRUPT	1

///DAC1 12位，右对齐
#define DAC1_DHR12R1_ADDRESS	(DAC_BASE + 0x08)
///DAC2 12位，右对齐
#define DAC2_DHR12R2_ADDRESS	(DAC_BASE + 0x14)


///DAC1 使用 DMA1 STREAM5, CHANNEL7
#define DAC1_DMA_STREAM			DMA1_Stream5
#define DAC1_DMA_CHANNEL		DMA_Channel_7
///DAC1 DMA TCIF
#define DAC1_DMA_IT_TCIF		DMA_IT_TCIF5
//
#define DAC1_DMA_FLAG_TCIF		DMA_FLAG_TCIF5

///
#define DAC1_DMA_INT_ID			BSP_INT_ID_DMA1_STREAM5



void BSP_DAC1_ISRHandler(void);
void BSP_DAC1_DMA_ISRHandler(void);

void BSP_DAC_GPIOConfig(uint16_t pins);
void BSP_DAC_Config(uint32_t dac_ch);
void BSP_DAC_DMAConfig(uint32_t dac_ch, DMA_Stream_TypeDef *stream, uint32_t dma_ch, uint32_t data_addr, uint16_t *buf);

DMA_InitTypeDef DAC_DMA_InitStructure; 

////////////////////////////////////////////////////////////////////////////////
///				Global functions
////////////////////////////////////////////////////////////////////////////////
///只用到 DAC1
void BSP_DAC_Init(uint16_t *buf)
{

	///trigger : TM6TRO
	BSP_Tm6_Init();
	
	DAC_DeInit();
	
	BSP_DAC_GPIOConfig(GPIO_Pin_4);/// | GPIO_Pin_5);
	BSP_DAC_Config(DAC_Channel_1);

#if (DAC_USE_DMA)
	BSP_DAC_DMAConfig(DAC_Channel_1, DAC1_DMA_STREAM, DAC1_DMA_CHANNEL, (uint32_t)DAC1_DHR12R1_ADDRESS, buf);
#endif///

#if (DAC_USE_INTERRUPT)
	///允许中断
  	DAC_ITConfig(DAC_Channel_1, DAC_IT_DMAUDR, ENABLE);
	///dac中断设置
	BSP_IntVectSet(BSP_INT_ID_TIM6, BSP_DAC1_ISRHandler);
    BSP_IntEn(BSP_INT_ID_DAC1);
#endif///ADC_USE_INTERRUPT

#if (DAC_USE_DMA)
#if (DAC_DMA_USE_INTERRUPT)
	///允许DMA中断
	DMA_ITConfig(DAC1_DMA_STREAM, DMA_IT_TC, ENABLE);
	DMA_ClearFlag(DAC1_DMA_STREAM, DAC1_DMA_FLAG_TCIF);
	///DMA中断设置
	BSP_IntVectSet(DAC1_DMA_INT_ID, BSP_DAC1_DMA_ISRHandler);
    BSP_IntEn(DAC1_DMA_INT_ID);
#endif///
#endif///

  	/* Enable DAC1 Channel */
	DAC_Cmd(DAC_Channel_1, ENABLE);

#if (DAC_USE_DMA)
	///暂时不允许
	DMA_Cmd(DAC1_DMA_STREAM, DISABLE);
	
#endif///
}


void BSP_DAC_Start(uint16_t *buf, uint16_t len)
{
	if (BSP_Info.Error & BSP_ERROR_DAC_BUF_EMPTY)
		return;
	
#if (DAC_USE_DMA)
	//重新写入 DMA 传输数量：必须确认当前 DMA 已经完成
	if (DMA_GetCmdStatus(DAC1_DMA_STREAM) == DISABLE){
		/*
		///重新初始化DMA
		BSP_DAC_DMAConfig(DAC_Channel_1, DAC1_DMA_STREAM, DAC1_DMA_CHANNEL, (uint32_t)DAC1_DHR12R1_ADDRESS, buf);
		///设置 DMA 长度并启动 DMA 发送
		DMA_SetCurrDataCounter(DAC1_DMA_STREAM, len);*/
		
		DAC_DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)&(buf[0]);
		DAC_DMA_InitStructure.DMA_BufferSize = len;
		DMA_Init(DAC1_DMA_STREAM, &DAC_DMA_InitStructure);
		/* Enable DMA for DAC Channel */
		DAC_DMACmd(DAC_Channel_1, ENABLE);		
		
		DMA_Cmd(DAC1_DMA_STREAM, ENABLE); 

		///需要先打开TIM6：
		TIM_Cmd(TIM6, ENABLE);
	}
#else
	;
#endif
}




////////////////////////////////////////////////////////////////////////////////
///				Local functions
////////////////////////////////////////////////////////////////////////////////
void BSP_DAC_GPIOConfig(uint16_t pins)
{
	GPIO_InitTypeDef GPIO_InitStructure;
  
  	/* DMA1 clock and GPIOA clock enable (to be used with DAC) */
  	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1 | RCC_AHB1Periph_GPIOA, ENABLE);

  	/* DAC Periph clock enable */
  	RCC_APB1PeriphClockCmd(RCC_APB1Periph_DAC, ENABLE);

  	/* DAC channel 1 & 2 (DAC_OUT1 = PA.4)(DAC_OUT2 = PA.5) configuration */
	GPIO_InitStructure.GPIO_Pin = pins;///GPIO_Pin_4 | GPIO_Pin_5;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AN;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOA, &GPIO_InitStructure);
}

void BSP_DAC_Config(uint32_t dac_ch)
{
	DAC_InitTypeDef  DAC_InitStructure;

	/* DAC channel2 Configuration */
	DAC_InitStructure.DAC_Trigger = DAC_Trigger_T6_TRGO;
	DAC_InitStructure.DAC_WaveGeneration = DAC_WaveGeneration_None;
	DAC_InitStructure.DAC_OutputBuffer = DAC_OutputBuffer_Enable;
	DAC_InitStructure.DAC_LFSRUnmask_TriangleAmplitude = DAC_TriangleAmplitude_1023;
	DAC_Init(dac_ch, &DAC_InitStructure);
}


#if (DAC_USE_DMA)
void BSP_DAC_DMAConfig(uint32_t dac_ch, DMA_Stream_TypeDef *stream, uint32_t dma_ch, uint32_t data_addr, uint16_t *buf)
{

	/* DMA1_Stream5 channel7 configuration **************************************/
	DMA_DeInit(stream);
	
	DAC_DMA_InitStructure.DMA_Channel = dma_ch;  
	DAC_DMA_InitStructure.DMA_PeripheralBaseAddr = data_addr;
	DAC_DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)&(buf[0]);
	DAC_DMA_InitStructure.DMA_DIR = DMA_DIR_MemoryToPeripheral;
	DAC_DMA_InitStructure.DMA_BufferSize = 0;
	DAC_DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
	DAC_DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
	DAC_DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
	DAC_DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord;
	DAC_DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
	DAC_DMA_InitStructure.DMA_Priority = DMA_Priority_High;
	DAC_DMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Disable;         
	DAC_DMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_HalfFull;
	DAC_DMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_Single;
	DAC_DMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_Single;
	DMA_Init(stream, &DAC_DMA_InitStructure);
	

	/* Enable DMA for DAC Channel */
	DAC_DMACmd(dac_ch, ENABLE);	
}
#endif///




#if (DAC_USE_INTERRUPT)
void BSP_DAC1_ISRHandler(void)
{
	CPU_REG32  status;

	status = DAC->SR;

	///DAC channel 1 DMA under run
	if (DEF_BIT_IS_SET(status, DEF_BIT_13))
		DAC_ClearITPendingBit(DAC_Channel_1, DAC_IT_DMAUDR);

	///DAC channel 2 DMA under run
	if (DEF_BIT_IS_SET(status, DEF_BIT_29))
		DAC_ClearITPendingBit(DAC_Channel_2, DAC_IT_DMAUDR);
		
}

#endif

#if (DAC_USE_DMA)
#if (DAC_DMA_USE_INTERRUPT)
void BSP_DAC1_DMA_ISRHandler(void)
{
	CPU_REG32  status;

	status = DMA1->HISR;

	///DMA 传送完成
	if (DEF_BIT_IS_SET(status, DEF_BIT_11)){

		DMA_ClearITPendingBit(DAC1_DMA_STREAM, DAC1_DMA_IT_TCIF);
		
		if (BSP_Info.DACCallBack)
			BSP_Info.DACCallBack(0, NULL);
	}

	///DMA 传送错误
	if (DEF_BIT_IS_SET(status, DEF_BIT_09))
		DMA_ClearITPendingBit(DAC1_DMA_STREAM, DMA_IT_TEIF5);	

	///DMA FIFO 错误
	if (DEF_BIT_IS_SET(status, DEF_BIT_06))
		DMA_ClearITPendingBit(DAC1_DMA_STREAM, DMA_IT_FEIF5);	
}

#endif
#endif///











