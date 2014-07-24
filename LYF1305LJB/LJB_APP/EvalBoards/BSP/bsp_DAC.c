/*
	FileName : BSP_DAC.c
	Description :
	
		DAC �÷�1��DMA��ֻ��DAC1������ TIM6 ��Ϊ��ʱ����ʱ�ӡ�
			�ٶ�DAC���ݲ�̫����С��64K byte��
			1��Ӧ�ó���׼�������ݣ�д��ָ���Ļ�������
			2������BSP_DAC_Start��������������������DMA����������DMA�Լ���TIM6��
			3��DMA������ϣ��Զ��ر�TIM6���Ӷ��ر�DAC���
			
			���ںܳ������ݣ�DAC ���Ӧ����ƹ�һ�������
			1��Ӧ�ó���ʵ�� DAC_CallBack���������������ʱ�ر� TIM6 ���� DAC �Լ��� DMA ���һ���������Ĵ���ʱ��
				�л�����һ����������
			2��Ӧ�ó���׼�����������������ݣ����� BSP_DAC_Start������ʼ DAC ��
			3���� DMA �ж�ʱ��DAC ����׼����һ�����������ݡ�
			ע�⣺DAC ����������Ӧ�㹻�����Ա�֤ DAC �����ܼ�ʱ�������׼����
			
		DAC �÷�2������DMA��ʽ����δʵ��

	Created on 2013.07.30 by ZZP.

	Revision History:

*/


#include "bsp.h"



////////////////////////////////////////////////////////////////////////////////
///					Local defines
////////////////////////////////////////////////////////////////////////////////
///ֻʹ��DAC1�����������ʽ
///#define DAC_METHOD_SINGLE		1
///ʹ��DAC1��DAC2�����������ʽ
///#define DAC_METHOD_DUAL			2
///ֻʹ��DAC1��DMA��Ӳ��������ʽ
#define DAC_METHOD_DMA			3
///DAC�������ַ�ʽ��
#define DAC_METHOD				(DAC_METHOD_DMA)


///�Ƿ�ʹ��DMA������
#define DAC_USE_DMA				1

///DAC�Ƿ��ж�
#define DAC_USE_INTERRUPT		0
///DAC DMA�Ƿ��ж�
#define DAC_DMA_USE_INTERRUPT	1

///DAC1 12λ���Ҷ���
#define DAC1_DHR12R1_ADDRESS	(DAC_BASE + 0x08)
///DAC2 12λ���Ҷ���
#define DAC2_DHR12R2_ADDRESS	(DAC_BASE + 0x14)


///DAC1 ʹ�� DMA1 STREAM5, CHANNEL7
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
///ֻ�õ� DAC1
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
	///�����ж�
  	DAC_ITConfig(DAC_Channel_1, DAC_IT_DMAUDR, ENABLE);
	///dac�ж�����
	BSP_IntVectSet(BSP_INT_ID_TIM6, BSP_DAC1_ISRHandler);
    BSP_IntEn(BSP_INT_ID_DAC1);
#endif///ADC_USE_INTERRUPT

#if (DAC_USE_DMA)
#if (DAC_DMA_USE_INTERRUPT)
	///����DMA�ж�
	DMA_ITConfig(DAC1_DMA_STREAM, DMA_IT_TC, ENABLE);
	DMA_ClearFlag(DAC1_DMA_STREAM, DAC1_DMA_FLAG_TCIF);
	///DMA�ж�����
	BSP_IntVectSet(DAC1_DMA_INT_ID, BSP_DAC1_DMA_ISRHandler);
    BSP_IntEn(DAC1_DMA_INT_ID);
#endif///
#endif///

  	/* Enable DAC1 Channel */
	DAC_Cmd(DAC_Channel_1, ENABLE);

#if (DAC_USE_DMA)
	///��ʱ������
	DMA_Cmd(DAC1_DMA_STREAM, DISABLE);
	
#endif///
}


void BSP_DAC_Start(uint16_t *buf, uint16_t len)
{
	if (BSP_Info.Error & BSP_ERROR_DAC_BUF_EMPTY)
		return;
	
#if (DAC_USE_DMA)
	//����д�� DMA ��������������ȷ�ϵ�ǰ DMA �Ѿ����
	if (DMA_GetCmdStatus(DAC1_DMA_STREAM) == DISABLE){
		/*
		///���³�ʼ��DMA
		BSP_DAC_DMAConfig(DAC_Channel_1, DAC1_DMA_STREAM, DAC1_DMA_CHANNEL, (uint32_t)DAC1_DHR12R1_ADDRESS, buf);
		///���� DMA ���Ȳ����� DMA ����
		DMA_SetCurrDataCounter(DAC1_DMA_STREAM, len);*/
		
		DAC_DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)&(buf[0]);
		DAC_DMA_InitStructure.DMA_BufferSize = len;
		DMA_Init(DAC1_DMA_STREAM, &DAC_DMA_InitStructure);
		/* Enable DMA for DAC Channel */
		DAC_DMACmd(DAC_Channel_1, ENABLE);		
		
		DMA_Cmd(DAC1_DMA_STREAM, ENABLE); 

		///��Ҫ�ȴ�TIM6��
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

	///DMA �������
	if (DEF_BIT_IS_SET(status, DEF_BIT_11)){

		DMA_ClearITPendingBit(DAC1_DMA_STREAM, DAC1_DMA_IT_TCIF);
		
		if (BSP_Info.DACCallBack)
			BSP_Info.DACCallBack(0, NULL);
	}

	///DMA ���ʹ���
	if (DEF_BIT_IS_SET(status, DEF_BIT_09))
		DMA_ClearITPendingBit(DAC1_DMA_STREAM, DMA_IT_TEIF5);	

	///DMA FIFO ����
	if (DEF_BIT_IS_SET(status, DEF_BIT_06))
		DMA_ClearITPendingBit(DAC1_DMA_STREAM, DMA_IT_FEIF5);	
}

#endif
#endif///











