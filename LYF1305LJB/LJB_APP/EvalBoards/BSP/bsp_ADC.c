/*
	FileName : ADC.c
	Description :
		ADC Ӳ����������.
		1��˳�����
		2��ת�������Ҫ�ڶ�ʱ�� TIM3 �ж��ж�ȡ���Ѿ��� DMA ���䵽ָ���Ļ������У�������������� DMA ���ȣ����������
		
		��Ҫ��Ӳ���������²�����
		1---TOTAL_ADC_DMA_NBR
		2---ADC_CH_CLK
		3---ADC_GPIO_PORT
		4---ADC1_Channels
		
	Created on 2013.12.12 by FXS.

	Revision History:

*/

#include "stm32f2xx.h"
#include "stm32f2xx_adc.h"
#include "stm32f2xx_dma.h"
#include "bsp.h"


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///												��������
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///ADC1 ʹ�� DMA2 ͨ�� 0
#define ADC1_DMA_STREAM			DMA2_Stream0
#define ADC1_DMA_CHANNEL		DMA_Channel_0

///ADC1 DMA TCIF
#define ADC1_DMA_IT_TCIF		DMA_IT_TCIF0
//
#define ADC1_DMA_FLAG_TCIF		DMA_FLAG_TCIF0

///ADC1 interrupt ID
#define ADC1_DMA_INT_ID			BSP_INT_ID_DMA2_STREAM0

///DMA CLK
#define ADC_DMA_CLK				RCC_AHB1Periph_DMA2

///��ʹ�� ADC �жϣ��ɶ�ʱ���ж϶�ʱ��ȡADC���ݺ�������һ��ת��
#define ADC_USE_INTERRUPT		0

///��Ҫʹ�� DMA �ж�
#define ADC_DMA_USE_INTERRUPT	1

///ADC ���Է�ʽ��
#define ADC_DEBUG_ENABLE		0

///����ADC1��������Ĵ�����ַ
////////////////////////////////////////////////////////
/// regular data register
////////////////////////////////////////////////////////
///regular data reg: offset = 0x4C;
#define ADC_DR_ADDRESS    		(ADC1_BASE + 0x4C)

#define ADC_CDR_ADDRESS			(ADC1_BASE + 0x308)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///												���Ӱ�CPU����· ADC �ɼ�
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///���ݼĴ�����ַ
#define ADC_DATA_ADDR			ADC_DR_ADDRESS

///ADC DMA �����ݳ���
#define TOTAL_ADC_DMA_NBR		5

///��������
#define ADC_SAMPLE_NBR			TOTAL_ADC_DMA_NBR

///clk
#define ADC_CH_CLK		(RCC_AHB1Periph_GPIOC)
#define ADC_GPIO_PORT_CNT	    1
const GPIO_TypeDef *ADC_GPIO_PORT[] = {GPIOC};
const uint16_t ADC_GPIO_Pins[] = {GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3 | GPIO_Pin_4}; 
const uint8_t ADC1_Channels[] = {ADC_Channel_10, ADC_Channel_11, ADC_Channel_12, ADC_Channel_13, ADC_Channel_14};



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///												����ԭ��
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void ADC_DMAConfig(uint16_t *ResBuf);
void ADC_GPIOConfig(void);
void ADC1_Config(void);


#if (ADC_USE_INTERRUPT)	
void BSP_ADC1_ISRHandler(void);
#endif///

#if (ADC_DMA_USE_INTERRUPT)
void BSP_ADC1_DMA_ISRHandler(void);
#endif


///Test only
#if (ADC_DEBUG_ENABLE)
__IO uint32_t _TotCnt = 0;
__IO uint32_t _ErrCnt = 0;
__IO uint32_t _AdcFlag = 1;
__IO uint32_t _AdcErrCnt = 0;
#endif


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///													����ʵ��
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/**
  * @brief   ADC initialization program
  * @param  None
  * @retval None
  */
void BSP_ADC_Init(uint16_t *ResBuf)
{
	ADC_CommonInitTypeDef ADC_CommonInitStructure;
  
	/* Enable peripheral clocks *************************************************/
	
	RCC_AHB1PeriphClockCmd(ADC_DMA_CLK | ADC_CH_CLK, ENABLE); 

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, ENABLE);

     
  	/* ADCs configuration ------------------------------------------------------*/
  	/* Configure ADC Channels as analog input */
	
  	ADC_GPIOConfig();

  	/* DMA2 Stream0 channel0 configuration **************************************/
	
  	ADC_DMAConfig(ResBuf);

  	/* ADC Common Init */
  	ADC_CommonInitStructure.ADC_Mode = ADC_Mode_Independent;
  	ADC_CommonInitStructure.ADC_Prescaler = ADC_Prescaler_Div2;
  	ADC_CommonInitStructure.ADC_DMAAccessMode = ADC_DMAAccessMode_Disabled;
	ADC_CommonInitStructure.ADC_TwoSamplingDelay = ADC_TwoSamplingDelay_15Cycles;
	
	ADC_CommonInit(&ADC_CommonInitStructure);
	
  	/* ADC1 regular channels configuration */
  	ADC1_Config();

#if (ADC_USE_INTERRUPT)
	///�����ж�
  	ADC_ITConfig(ADC1, ADC_IT_EOC, ENABLE);
	///ADC �ж�����
	BSP_IntVectSet(BSP_INT_ID_ADC1_2, BSP_ADC1_ISRHandler);
    BSP_IntEn(BSP_INT_ID_ADC1_2);
#endif///ADC_USE_INTERRUPT

#if (ADC_DMA_USE_INTERRUPT)
	///����DMA�ж�
	DMA_ITConfig(ADC1_DMA_STREAM, DMA_IT_TC, ENABLE);
	DMA_ClearFlag(ADC1_DMA_STREAM, ADC1_DMA_FLAG_TCIF);
	///DMA�ж�����
	BSP_IntVectSet(ADC1_DMA_INT_ID, BSP_ADC1_DMA_ISRHandler);
    BSP_IntEn(ADC1_DMA_INT_ID);
#endif
	
  	ADC_DMARequestAfterLastTransferCmd(ADC1, ENABLE);	

	/* Enable ADC1 */
  	ADC_Cmd(ADC1, ENABLE);

	///�˴����ܴ� DMA stream��
	/* Disable ADC1 DMA stream since ADC1 is the Master*/
  	DMA_Cmd(ADC1_DMA_STREAM, DISABLE); 
}

///start adc by software
///�ú������ڶ�ʱ�ж��е���
void BSP_ADC_Start(void)
{

	if (!(BSP_Info.Error & BSP_ERROR_ADC_BUF_EMPTY))
	{
	
#if (ADC_DEBUG_ENABLE)		
		_TotCnt++;
#endif

		///����д�� DMA ��������������ȷ�ϵ�ǰ DMA �Ѿ����
		if (DMA_GetCmdStatus(ADC1_DMA_STREAM) == DISABLE)
		{

#if (ADC_DEBUG_ENABLE)		

			if (_AdcFlag != 1)
				_AdcErrCnt++;
			_AdcFlag = 0;

#endif
			
			///���� DMA ���Ȳ����� DMA ����
			DMA_SetCurrDataCounter(ADC1_DMA_STREAM, TOTAL_ADC_DMA_NBR);

			/* Enable ADC1 DMA stream since ADC1 is the Master*/
  			DMA_Cmd(ADC1_DMA_STREAM, ENABLE); 

			/* Start ADC1 Software Conversion */
  			ADC_SoftwareStartConv(ADC1);
		}

#if (ADC_DEBUG_ENABLE)

		else
		{
			///�д�������
			_ErrCnt++;
		}

#endif
	}
}


/* Private functions ---------------------------------------------------------*/
/**
  * @brief  ADC1 regular channels 10~14 configuration
  * @param  None
  * @retval None
  */
void ADC1_Config(void)
{
	uint8_t i;
  	ADC_InitTypeDef ADC_InitStructure;

  	ADC_InitStructure.ADC_Resolution = ADC_Resolution_12b;
  	ADC_InitStructure.ADC_ScanConvMode = ENABLE;
  	ADC_InitStructure.ADC_ContinuousConvMode = DISABLE;
  	ADC_InitStructure.ADC_ExternalTrigConvEdge = ADC_ExternalTrigConvEdge_None;
  	ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;
  	ADC_InitStructure.ADC_NbrOfConversion = ADC_SAMPLE_NBR;

  	ADC_Init(ADC1, &ADC_InitStructure);

  	/* ADC1 regular channels configuration */ 
	for (i = 0; i < ADC_SAMPLE_NBR; i++)
	{
		ADC_RegularChannelConfig(ADC1, ADC1_Channels[i], i + 1, ADC_SampleTime_144Cycles);
	}   	
}


/**
  * @brief  DMA Configuration
  * @param  ResBuf--���������ָ��
  * @retval None
  */
void ADC_DMAConfig(uint16_t *ResBuf)
{
  	DMA_InitTypeDef DMA_InitStructure;

  	///ADC1 : DMA2 Channel 0, stream 0
  	DMA_InitStructure.DMA_Channel = DMA_Channel_0; 
  	DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t)&(ResBuf[0]);
  	DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)ADC_DATA_ADDR;
  	DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralToMemory;
  	DMA_InitStructure.DMA_BufferSize = TOTAL_ADC_DMA_NBR;//0;///�˴�����������ADC�ܵ����ݻ�������С��������ADC1�ġ�
  	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
  	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
  	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
  	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord;

	///circular ��ʽ�£����ݳ��Ȼ����¼��أ�����ַ�Ƿ����¼��أ���Ҫȷ��
  	///DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
	///Normal ��ʽ�£����ݳ���ÿ����Ҫ���ã���ַ�ƺ��Զ����֣�
	DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
  	DMA_InitStructure.DMA_Priority = DMA_Priority_High;
  	DMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Disable;        
  	DMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_HalfFull;
  	DMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_Single;
  	DMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_Single;

  	DMA_Init(ADC1_DMA_STREAM, &DMA_InitStructure);
  	
	/* Enable ADC1 DMA since ADC1 is the Master*/
  	ADC_DMACmd(ADC1, ENABLE); 
}

/**
  * @brief Configure PC 0~4 pins as analog inputs
  * @param  None
  * @retval None
  */
void ADC_GPIOConfig(void)
{
  	GPIO_InitTypeDef GPIO_InitStructure;

	/* PC0-4: ADC */
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3 | GPIO_Pin_4;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AN;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL ;

	GPIO_Init(GPIOC, &GPIO_InitStructure);	
}


#if (ADC_DMA_USE_INTERRUPT)
void BSP_ADC1_DMA_ISRHandler(void)
{
	CPU_REG32  status;

	status = DMA2->LISR;

	///DMA �������
	if (DEF_BIT_IS_SET(status, DEF_BIT_05))
	{

		DMA_ClearITPendingBit(ADC1_DMA_STREAM, ADC1_DMA_IT_TCIF);
#if (ADC_DEBUG_ENABLE)
		_AdcFlag++;
#endif
		
	}

	///DMA ���ʹ���
	if (DEF_BIT_IS_SET(status, DEF_BIT_03))
		DMA_ClearITPendingBit(ADC1_DMA_STREAM, DMA_IT_TEIF0);	

	///DMA FIFO ����
	if (DEF_BIT_IS_SET(status, DEF_BIT_00))
		DMA_ClearITPendingBit(ADC1_DMA_STREAM, DMA_IT_FEIF0);	
}
#endif



#if (ADC_USE_INTERRUPT)
void BSP_ADC1_ISRHandler(void)
{
	CPU_REG32  status;

	status = ADC1->SR;

	///OVR
	if (DEF_BIT_IS_SET(status, DEF_BIT_05)) {
		
		ADC_ClearITPendingBit(ADC1, ADC_IT_OVR); 
	}
	
	///EOC
	if (DEF_BIT_IS_SET(status, DEF_BIT_01)) {
		
		ADC_ClearITPendingBit(ADC1, ADC_IT_EOC); 
	}   
}
#endif///ADC_USE_INTERRUPT

