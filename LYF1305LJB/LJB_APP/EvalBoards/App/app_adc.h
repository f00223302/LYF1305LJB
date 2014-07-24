/*
	FileName : app_adc.h
	Description : 
		采样处理
	Created on 2013.08.05 by ZZP.

	Revision History:

*/


#ifndef __APP_ADC_H__
#define __APP_ADC_H__


#include <includes.h>



//////////////////////////////////////////////
///		ADC	functions and variables
//////////////////////////////////////////////
void AppTaskADC(void *p_arg);

uint32_t	Adc_Tm3CallBack(unsigned char Arg, void *ptr);

extern uint16_t 	AdcBuf[5];

extern uint8_t      _DigRes[5];

///**************************************
///			   连接板
///**************************************
#if defined LJB_CPU_MAIN

#define  POWER_SAMPLE_CHANNEL_COUNT		5
#define  SAMPLE_BUF_SIZE		        ((uint32_t)1 << 4)
#define  SAMPLE_BUF_MASK                (SAMPLE_BUF_SIZE-1)
#define  SAMPLE_VALUE_MASK              (0x00000fff)
#define  TOT_RIGHT_SHIFT_CNT	        4
#define  POW_HIGH_THRESHOLD             15000       //150V as powerover threshold(10mV)
#define  POW_LOW_THRESHOLD              6000        //60V as poweroff threshold(10mV)
#define  POW_OFF_FLG   	                1	   



#define _RES_FRAME_SIZE 	SAMPLE_BUF_SIZE//大小保持一致，防止访问AD采样缓存越界
#define _RES_FRAME_MASK 	(_RES_FRAME_SIZE - 1)

#define SAMPLE_RESULT_MAGIC			4





#define _TOT_BITS	4//5  根据张工的建议修改的，将AD 采样由2^5ms降为2^4ms ，为掉电处理更快
#define _TOT_CNT	((uint16_t)1 << _TOT_BITS)


///采样电阻2K和200K，参考电压2.5V
///模拟量通道输出比例系数：电压单位 1mV
///电压通道：	 110V * 0.0099 = 1.089V --->>  2.5/4096*110V/1.089*1000  = 61.65 --->> 61.65 * 256  = 15782   #1
///20140320--采样电阻3.3K和200K，参考电压2.5V
///模拟量通道输出比例系数：电压单位 10mV
///电压通道：	 110V * 0.0162 = 1.786V --->>  2.5/4096*110V/1.786*100  = 3.759 --->> 3.759 * 256  = 962   #2


#define ANALOG_CHANNEL_RATIO_110V				3.759f//61.65f

#define ANALOG_CHANNEL_RATIO_110V_DEFAULT		962//15782

#define SAMPLE_RATIO_CONSTANT		            256


void GetSampleOffset(uint16_t *buf);
void GetSampleValues(uint16_t *buf);

#endif


///*********************************
///			记录板控制CPU
///*********************************
#if defined JLB_CPU_MAIN

///压缩后存入 SRAM
///模拟文件数据缓冲区：外部 SRAM，占用 256K BYTE--->
#define SAMPLE_BUF_SIZE		((uint32_t)1 << 18)
#define SAMPLE_BUF_MASK		(SAMPLE_BUF_SIZE - 1)

///采样结果放大倍数
/// 因要采用 A 率压缩，原始数据需要限定在 4096 以内，而当前采样信号最大值为 5000mV
#define SIGNAL_RESULT_MAGIC			((float)4095/5000)

/// 5V sample = 5*1.5/(1 + 1.5)/3.3*4095 = 3722.727
/// Ratio = V/Sample = 5000/3722.727 = 1.343 ---对应 mV
/// Let magic = 32768, so Ratio = 1.343 * 32768 = 44010.74
#define DEFAULT_SIGNAL_RATIO		44011u

///= 32768 / SIGNAL_RESULT_MAGIC
#define SIGNAL_RATIO_CONSTANT		40010u

///Dc offset = 1.5V--->Sample = 1861.36
#define DEFAULT_SIGNAL_OFFSET		1861

///
#define CALC_SIGNAL_SAMPLE_BITS		15
#define CALC_SIGNAL_SAMPLE_COUNT	((uint32_t)1 << CALC_SIGNAL_SAMPLE_BITS)


extern uint8_t SampleBuf[SAMPLE_BUF_SIZE];


extern uint32_t 	GetSignalVrms(void);
extern uint32_t	    GetSignalOffset(void);

///*********************************
///			Sample CPU
///*********************************
#elif defined JLB_CPU_SAMPLE

///采样结果放大倍数
#define SAMPLE_RESULT_MAGIC			4

/// 50V sample = 50*12/(221 + 12)/3.3*4095 = 3195.474
/// Ratio = V/Sample = 50/3195.474 = 0.015647
/// Let magic = 2048000, so Ratio = 15.647 * 2048 = 32045.3
#define DEFAULT_SAMPLE_RATIO		32045u

/// = 2048000 / SAMPLE_RESULT_MAGIC
#define SAMPLE_RATIO_CONSTANT		(512u * 1000)

///
#define DC50V_HIGH_OFFSET			((float)SAMPLE_RESULT_MAGIC*35)
///
#define DC50V_LOW_OFFSET			((float)SAMPLE_RESULT_MAGIC*10)

///
///#define CALC_50V_SAMPLE_BITS		10
///#define CALC_50V_SAMPLE_COUNT		((uint32_t)1 << CALC_50V_SAMPLE_BITS)

void GetSampleOffset(uint16_t *buf);
void GetSampleValues(uint16_t *buf);

#endif///JLB_CPU_MAIN

#endif///EOF


