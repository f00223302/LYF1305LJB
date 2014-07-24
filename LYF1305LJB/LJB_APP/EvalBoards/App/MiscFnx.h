/*
	FileName : MiscFnx.h
	Description:
  	Created on 2006.12.23 by ZZP

	Revision History:

*/

#ifndef __MISC_FNX_H__
#define __MISC_FNX_H__

#include "Includes.h"

uint16_t Calc_CRCByte(uint8_t *Buf, uint16_t Len);
uint16_t Calc_CRCByte_Continue(uint8_t *Buf, uint16_t Len, uint16_t last_crc);

uint16_t Calc_CRCWord(uint16_t *Data, uint16_t DataBits, uint16_t TotBytes);

__inline void IncIndex(uint16_t *Index, uint16_t Step, uint16_t Mask);

uint32_t GetTimeToMinutes(uint8_t *Tm, uint8_t *Date);
uint32_t GetTimeToSeconds(uint8_t *Tm, uint8_t *Date);



#endif //MISC_FNX_H
//----EOF---
