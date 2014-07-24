/*
	FileName : HexFile.h
	Description : 
	Created on 2013.01.31 by ZZP.

	Revision History:

*/


#ifndef __HEX_FILE_H__
#define __HEX_FILE_H__

#include <core_cm3.h>


#define HEX_MASK		(3<<6)

#define HEX_ERR_NONE	(0<<6)
#define HEX_ERR_DATA	(1<<6)
#define HEX_ERR_EOF		(2<<6)
#define HEX_VALID_DATA	(3<<6)


typedef struct{
	volatile uint8_t colon;///:
	volatile uint8_t line_len;
	volatile uint16_t addr;
	volatile uint8_t type;
	volatile uint8_t sum;
	volatile uint8_t D;
	volatile uint8_t A;

	volatile uint8_t data[4];
	volatile uint8_t data_cnt;
	volatile uint32_t seg_addr;
	volatile uint8_t actual_len;
	volatile uint8_t actual_sum;
}HEX_FILE, *pHEX_FILE;

uint8_t GetDataFromHexFile(HEX_FILE *HexBuf, uint8_t *buf, uint16_t len);
void InitHexVar(HEX_FILE *HexBuf);



#endif///
