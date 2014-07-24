/*
	FileName : Usart_Common.h
	Description : 
		采用 1002...1003 协议的串口数据处理公共协议。
	
	Created on 2013.10.22 by ZZP.
	
	Revision History:
	
*/


#ifndef __USART_COMMON_H__
#define __USART_COMMON_H__

#include "core_cm3.h"



///////////////////////////////////////////////
///			板地址类型定义
///////////////////////////////////////////////
#define BD_ADDR_TESTER					0x00
#define BD_ADDR_TIME_BOX				0x10
#define BD_ADDR_JLB_MAIN				0x20
#define BD_ADDR_JLB_SAMPLE				0x21
#define BD_ADDR_ZJB_A_CTRL				0x30
#define BD_ADDR_ZJB_A_DECODE_1			0x31
#define BD_ADDR_ZJB_A_DECODE_2			0x32
#define BD_ADDR_ZJB_B_CTRL				0x40
#define BD_ADDR_ZJB_B_DECODE_1			0x41
#define BD_ADDR_ZJB_B_DECODE_2			0x42
#define BD_ADDR_LJB						0x50



///////////////////////////////////////////////
///			命令宏定义
///////////////////////////////////////////////
#define CMD_ACK_MISC					0x01
#define CMD_WRITE_CONFIG				0x02
#define CMD_INQUIRY_CONFIG				0x03
#define CMD_ACK_CONFIG					0x04
#define CMD_SELF_TEST					0x05
#define CMD_INQUIRY_TEST_RESULT			0x06
#define CMD_ACK_TEST_RESULT				0x07
#define CMD_RESET						0x08
#define CMD_INQUIRY_VERSION				0x09
#define CMD_ACK_VERSION					0x10
#define CMD_UPGRADE_FIRMWARE			0x11
#define CMD_UPGRADE_DATA_FRAME			0x12
#define CMD_DOWN_FILE_DATA_FRAME		0x13
#define CMD_INQUIRY_UPGRADE_STATUS		0x14
#define CMD_ACK_UPGRADE_STATUS			0x15
#define CMD_INQUIRY_WORK_INFO			0x16
#define CMD_ACK_WORK_INFO				0x17
#define CMD_INQUIRY_110V_INFO			0x18
#define CMD_ACK_110V_INFO				0x19
#define CMD_TIME_BROAD_CAST				0x20
#define CMD_ACK_AB_INFO					0x21
#define CMD_INQUIRY_TIME				0x22
#define CMD_ACK_TIME					0x23
#define CMD_CALIBRATE_TIME				0x24

//Started Added by me 20140718
#define CMD_INQUIRY_INTERNAL_VERSION	0x27
#define CMD_ACK_INTERNAL_VERSION		0x28
//End: Added by me 20140718


///根据张工的提议增加的
#define CMD_GET_BOARD_ID				0x30
#define CMD_ACK_GET_BOARD_ID			0x31
#define CMD_WRITE_BOARD_ID				0x32
#define CMD_ACK_WRITE_BOARD_ID			0x33
#define CMD_GET_MAINT_INFO				0x34
#define CMD_ACK_MAINT_INFO				0x35
#define CMD_WRITE_MAINT_INFO			0x36
#define CMD_ACK_WRITE_MAINT_INFO		0x37


#define CMD_ACK_UPGRADE_DATA_FRAME		0x82

///Communication between Sample CPU and Main CPU:
#define CMD_XFER_STATUS_INFO			0x3a
#define CMD_XFER_JW_INFO				0x3b
#define CMD_XFER_TEST_INFO				0x3c
#define CMD_XFER_BOARD_VERSION_INFO		0x3d

///Debug: 
#if 0
#define CMD_DEBUG_READ_50V_ADC_OFFSET	0xB0
#define CMD_DEBUG_ACK_50V_ADC_OFFSET	0xB1
#define CMD_DEBUG_READ_50V_ADC_RES		0xB2
#define CMD_DEBUG_ACK_50V_ADC_RES		0xB3
#endif
#define CMD_DEBUG_READ_110V_ADC_OFFSET	0xB0
#define CMD_DEBUG_ACK_110V_ADC_OFFSET	0xB1
#define CMD_DEBUG_READ_110V_ADC_RES		0xB2
#define CMD_DEBUG_ACK_110V_ADC_RES		0xB3
#define CMD_DEBUG_READ_SIGNAL_OFFSET	0xB4
#define CMD_DEBUG_ACK_SIGNAL_OFFSET		0xB5
#define CMD_DEBUG_READ_SIGNAL_AMP		0xB6
#define CMD_DEBUG_ACK_SIGNAL_AMP		0xB7
#define CMD_DEBUG_SET_PARAM				0xB8






/// ON chip FLASH
#define CMD_WRITE_PROTECTION			0xAA
#define CMD_ACK_WRITE_PROTECTION		0xAB 
#define WRITE_PROTECTION_ENABLE_ID		0x76546231L
#define WRITE_PROTECTION_DISABLE_ID		0x54763162L

/// USART command type
#define CMD_TYPE_CONFIG					1
#define CMD_TYPE_SELFTEST				2
#define CMD_TYPE_FIRMWARE				3
#define CMD_TYPE_WORK_INFO				4
#define CMD_TYPE_TIME					5
#define CMD_TYPE_DEBUG					0x0a

#define FIRM_TYPE_JLB_SAMPLE_APP		0x12
#define FIRM_TYPE_JLB_MAIN_APP			0x13



/// 各类记录的标志 ID 定义：
#define ANALOG_FILE_ID			0x41516182
#define VERSION_DATA_ID			0x8392a106
#define POSITION_DATA_ID		0x47726351
#define JW_DATA_ID				0x41618192
#define STATUS_DATA_ID			0xa1b155AA





typedef struct{
	uint8_t len[2];
	uint8_t src;
	uint8_t src_len;
	uint8_t dst;
	uint8_t dst_len;
	uint8_t type;
	uint8_t cmd;
	uint8_t *data;
	
	uint8_t BigEndding;
}DATA_STRUCT, *pDATA_STRUCT;


void Usart_InitInfo(void);

/*
	return value:
		0---OK
		2---Info 结构没有定义 data 缓冲区
*/
uint8_t Usart_RxDataHandler(uint8_t COM, DATA_STRUCT *Info);

/*
	return value:
		0---OK
		1---超时
		2---Info 结构没有定义 data 缓冲区
*/
uint8_t Usart_TxDataHandler(uint8_t COM, DATA_STRUCT *Info);


extern void (*Usart_RxFrameHandler[])(DATA_STRUCT *Info);
void Usart1_RxFrameHandler(DATA_STRUCT *Info);
void Usart2_RxFrameHandler(DATA_STRUCT *Info);
void Usart3_RxFrameHandler(DATA_STRUCT *Info);
void Usart4_RxFrameHandler(DATA_STRUCT *Info);
void Usart5_RxFrameHandler(DATA_STRUCT *Info);
void Usart6_RxFrameHandler(DATA_STRUCT *Info);




#endif///EOF









