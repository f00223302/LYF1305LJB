/*
	FileName : app_sd.h
	Description :
	
	Created on 2013.10.18 by ZZP.
	
	Revision History:
	
*/

#ifndef __APP_SD_H__
#define __APP_SD_H__

#include "core_cm3.h"
#include "app.h"


///////////////////////////////////////////////////////////////////////////////////////
///									DEFINES
///////////////////////////////////////////////////////////////////////////////////////

#define STS_SECTOR_COUNT		262144u


typedef struct {
	/////////////////////////////////////////////////
	///	以下项目必须与 NVRAM_INFO 结构对应项对齐：
	/////////////////////////////////////////////////
	uint32_t Time;
	uint32_t JwSec;
	uint32_t JwIndex;
	uint32_t JwSec_CopyStart;
	uint32_t JwSec_CopyEnd;
	uint32_t JwSec_CopyTm;
	
	uint32_t TestSec;
	uint32_t TestIndex;
	uint32_t TestSec_CopyStart;
	uint32_t TestSec_CopyEnd;
	uint32_t TestSec_CopyTm;
	
	uint32_t StsSec;
	uint32_t StsSec_CopyStart;
	uint32_t StsSec_CopyEnd;
	uint32_t StsSec_CopyTm;
	
	uint32_t AnaIndex;
	uint32_t AnaFile_CopyStart;
	uint32_t AnaFile_CopyEnd;
	uint32_t AnaFile_CopyTm;
	/////////////////////////////////////////////////
	///	以上项目必须与 NVRAM_INFO 结构对应项对齐
	/////////////////////////////////////////////////
}POS_DATA, *pPOS_DATA;

typedef struct{
	
	uint32_t ID;
	uint32_t Index;
	uint32_t rsvd1;
	
	POS_DATA PosData;
	
	uint8_t rsvd2[422];
	uint16_t crc;
	
}POS_INFO, *pPOS_INFO;


extern POS_INFO PosInfo;



typedef struct{
	
	POS_DATA PosData;
	
	uint16_t rsvd;
	uint16_t crc;
	
}NVRAM_INFO, *pNVRAM_INFO;


extern NVRAM_INFO FsramInfo;


//FAT32 information structure define 
#define CF_1G		1
#define CF_2G		2
#define CF_4G		3
#define CF_8G		4
#define CF_16G		5
#define CF_32G		6

typedef struct
{
  uint16_t BytesPerSec;
  uint16_t SecPerClus;
  uint16_t RsvdSecCnt;
  uint16_t RootDirSectors;
  uint16_t NumFATs;
  uint16_t FATSz32;
  uint16_t RootEntCnt;
  uint32_t TotSec32;
  uint16_t RootClus;
  
  uint32_t CountOfClusters;
  uint32_t FirstDataSector;
  uint16_t FirstFATSector;
  uint16_t FATCntOfPerSector;
  uint16_t TotBytesPerClus;

  uint16_t CF_Type;
  
  uint32_t VersSecNo;
  uint32_t JwSecStartNo;
  uint32_t PosSecStartNo;
  uint32_t TestSecStartNo;
  uint32_t StsSecStartNo;
  uint32_t SigSecStartNo;
  uint32_t MaxSigFileCnt;
  
}BPB_INFO, *pBPB_INFO;

extern BPB_INFO bpb;



///////////////////////////////////////////////////////////////////////////////////////
///									Function ptototypes
///////////////////////////////////////////////////////////////////////////////////////
void  AppTaskSD (void *p_arg);
uint32_t	SD_CallBack(unsigned char Arg, void *ptr);

void GetSdInfo(void);




#endif///EOF







