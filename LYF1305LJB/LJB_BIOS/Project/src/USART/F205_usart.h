/*
	FileName : F205_USART.h
	Description :
	Created on 2013.01.21 by ZZP.

	Revision History:

*/


#ifndef __F205_USART_H__
#define __F205_USART_H__

#include <core_cm3.h>


/// RAM 最高地址处用来表示需要 BIOS 升级
#define UPGRADE_FLAG_DATA			0x73625593
#define UPGRADE_FLAG_ADDRESS	       ((uint32_t)0x20017FFC)


///USARTx 波特率
#define USART_BAUD_RATE	115200L  //57600L

#define USART_RX_BUF_SIZE		0x8000
#define USART_RX_BUF_MASK		(USART_RX_BUF_SIZE - 1)

#define USART_TX_BUF_SIZE		0x0800
#define USART_TX_BUF_MASK		(USART_TX_BUF_SIZE - 1)

extern uint8_t USART_tmpRxBuf[USART_RX_BUF_SIZE];
extern __IO uint16_t USART_RxIndex;
extern uint8_t ParamBuf[16384];

typedef struct{
	uint8_t *TxBuf;
	uint8_t *RxBuf;
}USART_BufDef;

typedef struct{
	uint16_t len;
	uint8_t src;
	uint8_t src_len;
	uint8_t dst;
	uint8_t dst_len;
	uint8_t type;
	uint8_t cmd;

	uint8_t ack_len;
	uint8_t ack_data[128];
	uint16_t remain;
}DATA_STRUCT, *pDATA_STRUCT;

#define WORK_STATUS_NORMAL				0
#define WORK_STATUS_UPGRADE				1

///////////////////////////////////////////////////////////
/// command defines
///////////////////////////////////////////////////////////

#define CMD_ACK_MISC					0x01
#define CMD_WRITE_INFO					0x02
#define CMD_READ_INFO					0x03
#define CMD_ACK_INFO					0x04

#define CMD_RESET						0x08
#define CMD_INQUIRY_VERSION				0x09
#define CMD_ACK_VERSION					0x10

#define CMD_UPGRADE_FIRMWARE			0x11
#define CMD_UPGRADE_DATA_FRAME			0x12
#define CMD_ACK_UPGRADE_FIRMWARE		0x82
#define CMD_INQUIRY_UPGRADE_STATUS		0x14
#define CMD_ACK_UPGRADE_STATUS			0x15


///#define CMD_DEBUG_ADDRESS				0xF1

///用于 FLASH 写保护
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


#define ACK_FLAG_UPGRADE_OK				0
#define ACK_FLAG_TYPE_MISMATCH			1
#define ACK_FLAG_DATA_ERR				3
#define ACK_FLAG_CRC_ERR				4
#define ACK_FLAG_PROTECT_ERR			5
#define ACK_FLAG_ERASE_ERR				6
#define ACK_FLAG_PROGRAM_FAIL			7
#define ACK_FLAG_EOF					8
#define ACK_FLAG_WRONG_CMD				9
#define ACK_FLAG_ERASE_APP_SECTORS		10



#define ACK_FLAG_NORMAL					0xcc

#define ACK_FLAG_NONE					0xff

//Added by fxs 2013.12.13
#define APP_FIRM_TYPE                   0x16



#define FIRM_BIOS						(0<<0)
#define FIRM_APPLICATION				(1<<0)


void F205_InitUSART(void);
void F205_UsartRxData(void);
uint8_t F205_RxDataHandler(void);
void F205_PrepareTxData(uint8_t type, uint8_t cmd, uint8_t src, uint8_t dst, uint16_t len, uint8_t *data);
void F205_DisableUSART(void);
void F205_DisableUSART1(void);    //Added by me 2014 02 28


uint16_t Calc_CRCByte(uint8_t *Buf, uint32_t Len);


#endif//
