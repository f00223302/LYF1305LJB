/*
	FileName : app_sd.c
	Description :
			-----------例程中都是操作 1 个扇区，要特别试验多个扇区的情况。
			
	Created on 2013.10.18 by ZZP.
	
	Revision History:
	
*/
#include <string.h>
#include "ucos_ii.h"
#include "bsp.h"
#include "app.h"
#include "app_sd.h"
#include "diskio.h"
#include "ff.h"
#include "MiscFnx.h"




#define DEBUG_SD_ENABLE		1



/////////////////////////////////////////////////////////////////////////////////////
///						Local variables 
/////////////////////////////////////////////////////////////////////////////////////


///因 DMA 传输限制在 64K，一次读写扇区数应小于 128：
#define MAX_XFER_SECTOR_CNT		126


#define ANALOG_FILE_ID			0x41516182

#define VERSION_DATA_ID			0x8392a106

#define POSITION_DATA_ID		0x47726351

#define V110_DATA_ID			0x41618192

#define STATUS_DATA_ID			0xa1b155AA




#if DEBUG_SD_ENABLE
#include <math.h>
#define _BUF_SIZE	8192
SD_Error _Sd_Err;
uint32_t _Tot_Cnt = 0;
uint32_t _Err_Cnt = 0;
uint8_t _Sd_Buf[_BUF_SIZE];
void TestSD(void);
#endif

uint8_t  _SD_NeedFormat = 0;

uint16_t _SdErrCnt = 0;

uint8_t _TempSD_Buf[512];

uint32_t _tmpTime;


POS_INFO PosInfo;

NVRAM_INFO FsramInfo;


BPB_INFO bpb;

FATFS fatfs_SD;




/////////////////////////////////////////////////////////////////////////////////////
///						Local function prototypes
/////////////////////////////////////////////////////////////////////////////////////
void InitSdInfo(void);
void SaveStsToSD(void);
void SavePosToFRam(void);
void SaveAnalogToSD(uint8_t Index);
uint32_t SaveHeadSec(uint8_t Index, uint32_t *pos);
void SavePosToSD(void);
void SavePosToNVRam(void);
void SaveJwToSD(void);

void GetVerInfo(void);
void GetPosInfo(void);
void GetNVRamInfo(void);
uint8_t GetFatInfo(void);
void CheckPosInfo(void);

void FormatSD(void);

void FormatSec0(void);
void FormatVerSectors(void);
void FormatJwSectors(void);
void FormatPosSectors(void);
void FormatTestSectors(void);
void FormatStsSectors(void);
void FormatAnaSectors(void);



/////////////////////////////////////////////////////////////////////////////////////
///					Global function realizations
/////////////////////////////////////////////////////////////////////////////////////
void  AppTaskSD (void *p_arg)
{
	#if OS_CRITICAL_METHOD == 3                     
	OS_CPU_SR  cpu_sr = 0;
#endif
	uint8_t res = 0;
	
	(void)p_arg;

	InitSdInfo();
		
	while (DEF_TRUE){

		AppInfo.TaskSdCnt++;
		
		if (AppInfo.RdyFlag == 1){
				
			if (AppInfo.StsIndex >= AppInfo.StsHandleIndex + 4){
				res = 1;
				SaveStsToSD();
			}
			
			if (AppInfo.RecordMethod == RECORD_METHOD_CONTINOUS){
				
				if (!AppInfo.StartRecord){
					
					OS_ENTER_CRITICAL();
					
						AppInfo.AnalogSampleCnt = 0;
						AppInfo.StartRecord = 1;
						AppInfo.AnalogTime[AppInfo.RecordIndex] = AppInfo.NowTime;
						AppInfo.AnalogStartIndex[AppInfo.RecordIndex] = AppInfo.SampleIndex;
					
					OS_EXIT_CRITICAL();
				}
			}
			
			if (AppInfo.AnalogValid[0]){
				res++;
				SaveAnalogToSD(0);
			}
			else if (AppInfo.AnalogValid[1]){
				res++;
				SaveAnalogToSD(1);
			}
			
			if (res){
				
				res = 0;
				SavePosToFRam();
				SavePosToSD();
			}
			
			AppInfo.TaskSdCnt++;
			
#if DEBUG_SD_ENABLE
			if (_Tot_Cnt < 100000){
				_Sd_Err = SD_OK;
				TestSD();
				if (_Sd_Err != SD_OK)
					_Err_Cnt++;
				_Tot_Cnt++;
			}
#endif
		}
		
		OSTimeDly(10);
	}
}

///当 SD 传输完成中断时调用：
uint32_t	SD_CallBack(unsigned char Arg, void *ptr)
{
	
	return 0;
}


void GetSdInfo(void)
{
	uint8_t err;
	
	_tmpTime = AppInfo.NowTime;
	
	err = GetFatInfo();
	if (err)
		_SD_NeedFormat = 1;
	else{
		GetNVRamInfo();
		GetVerInfo();
		GetPosInfo();
	}
	
	if (_SD_NeedFormat)///Need format SD
		FormatSD();
	else
		CheckPosInfo();
}









/////////////////////////////////////////////////////////////////////////////////////
///					 Local function realizations
/////////////////////////////////////////////////////////////////////////////////////
void InitSdInfo(void)
{
	memset((uint8_t *)&(PosInfo.ID), 0, sizeof(POS_INFO));
	
	PosInfo.ID = POSITION_DATA_ID;
}





void SaveStsToSD(void)
{
	SD_Error status;
	
	///由于帧缓冲区长度为 2^n，此处无需考虑折返问题
	status = SD_WriteBlock(&(StsFrame[AppInfo.StsHandleIndex & STS_BUF_MASK].ID[0]), AppInfo.SD_StsSec, 512);
	if (status != SD_OK)
		_SdErrCnt++;
	AppInfo.StsHandleIndex += 4;
	AppInfo.SD_StsSec++;
	if (AppInfo.SD_StsSec >= bpb.SigSecStartNo)
		AppInfo.SD_StsSec = bpb.StsSecStartNo;
}



void SaveAnalogToSD(uint8_t Index)
{
	uint32_t sec, tmp, start, length;
	uint16_t i, cnt, sec_cnt[3] = {0, 0, 0}, remain = 0;
	uint8_t j, *ptr[3];
	SD_Error status = SD_OK;
	
	///Header:
	sec = SaveHeadSec(Index, &start);
	if (sec == 0)
		return;
	
	length = ANALOG_FILE_LEN - 512;
	ptr[0] = &SampleBuf[start];
	if (SAMPLE_BUF_SIZE >= start + length)
		sec_cnt[0] = length / 512;
	else{
		
		tmp = SAMPLE_BUF_SIZE - start;
		sec_cnt[0] = tmp / 512;
		remain = tmp % 512;
		if (remain){
			
			tmp = (sec_cnt[0] << 9);
			for (i = 0; i < remain; i++)
				_TempSD_Buf[i] = ptr[0][tmp + i];
			for (i = remain; i < 512; i++)
				_TempSD_Buf[i] = SampleBuf[i - remain];
			ptr[1] = _TempSD_Buf;
			sec_cnt[1] = 1;
			
			tmp = length - (sec_cnt[0] << 9) - 512;
			ptr[2] = &SampleBuf[512 - remain];
			sec_cnt[2] = tmp / 512;
		}
		else{
			
			tmp = length - (sec_cnt[0] << 9);
			ptr[1] = &SampleBuf[0];
			sec_cnt[1] = tmp / 512;
		}
	}	
		
	for (i = 0; i < 3; i++){
			
		if (sec_cnt[i]){
				
			cnt = sec_cnt[i] / MAX_XFER_SECTOR_CNT;
			remain = sec_cnt[i] % MAX_XFER_SECTOR_CNT;
			for (j = 0; j < cnt; j++){
					
				status = SD_WriteMultiBlocks(ptr[i], sec, 512, MAX_XFER_SECTOR_CNT);
				if (status != SD_OK){
					
					_SdErrCnt++;
					goto last_handle;
				}
				sec += MAX_XFER_SECTOR_CNT;
				ptr[i] += ((uint32_t)MAX_XFER_SECTOR_CNT << 9);
			}
			if (remain){
					
				status = SD_WriteMultiBlocks(ptr[i], sec, 512, remain);
				if (status != SD_OK){
					
					_SdErrCnt++;
					break;
				}
				sec += remain;
			}
		}
	}

last_handle:
	AppInfo.AnalogFileIndex++;
	if (AppInfo.AnalogFileIndex >= bpb.MaxSigFileCnt)
		AppInfo.AnalogFileIndex = 0;
	
	AppInfo.AnalogValid[Index] = 0;
}


uint32_t SaveHeadSec(uint8_t Index, uint32_t *pos)
{
	uint32_t i, sec, start, len;
	uint8_t *ptr;
	SD_Error status = SD_OK;
	
	///Header:
	_TempSD_Buf[0] = 0;
	_TempSD_Buf[1] = 0;
	_TempSD_Buf[2] = ANALOG_FILE_ID & 0xff;
	_TempSD_Buf[3] = (ANALOG_FILE_ID >> 8) & 0xff;
	_TempSD_Buf[4] = (ANALOG_FILE_ID >> 16) & 0xff;
	_TempSD_Buf[5] = ANALOG_FILE_ID >> 24;
	_TempSD_Buf[6] = AppInfo.AnalogFileTime & 0xff;
	_TempSD_Buf[7] = (AppInfo.AnalogFileTime >> 8) & 0xff;
	_TempSD_Buf[8] = (AppInfo.AnalogFileTime >> 16) & 0xff;
	_TempSD_Buf[9] = AppInfo.AnalogFileTime >> 24;
	if (AppInfo.RecordMethod == RECORD_METHOD_CONTINOUS){
		
		_TempSD_Buf[10] = AppInfo.AnalogContinousIndex & 0xff;
		_TempSD_Buf[11] = AppInfo.AnalogContinousIndex >> 8;
		
		AppInfo.AnalogContinousIndex++;
	}
	else{
		
		_TempSD_Buf[10] = 0;
		_TempSD_Buf[11] = 0;
	}
	_TempSD_Buf[12] = AppInfo.RecordMethod;
	_TempSD_Buf[13] = 0;
	_TempSD_Buf[14] = TIM3_FREQ / 100;
	_TempSD_Buf[15] = 0;
	
	ptr = &(SampleBuf[AppInfo.AnalogStartIndex[Index]]);
	len = SAMPLE_BUF_SIZE - AppInfo.AnalogStartIndex[Index];
	if (len >= 512 - 16){
		
		for (i = 16; i < 512; i++)
			_TempSD_Buf[i] = ptr[i - 16];
		start = AppInfo.AnalogStartIndex[Index] + 512 - 16;
	}
	else{
		
		for (i = 0; i < len; i++)
			_TempSD_Buf[i + 16] = ptr[i];
		for (i = len; i < 512 - 16; i++)
			_TempSD_Buf[i + 16] = SampleBuf[i - len];
		start = 512 - 16 - len;
	}
	sec = AppInfo.AnalogFileIndex * ANALOG_FILE_SEC_CNT + bpb.SigSecStartNo;
	status = SD_WriteBlock(_TempSD_Buf, sec, 512);
	if (status != SD_OK){
		
		_SdErrCnt++;
		return 0;
	}
	
	*pos = start;
	sec++;
	
	return sec;
}


void SavePosToSD(void)
{
	uint32_t sec;
	
	PosInfo.ID = POSITION_DATA_ID;
	PosInfo.Index++;
	PosInfo.PosData.Time = AppInfo.NowTime;
	PosInfo.PosData.StsSec = AppInfo.SD_StsSec;
	PosInfo.PosData.AnaIndex = AppInfo.AnalogFileIndex;
	PosInfo.PosData.JwSec = AppInfo.SD_JwSec;
	PosInfo.PosData.JwIndex = AppInfo.SD_JwIndex;
	
	sec = AppInfo.SD_PosSec++;
	if (AppInfo.SD_PosSec >= bpb.TestSecStartNo)
		AppInfo.SD_PosSec = bpb.PosSecStartNo;
	
	PosInfo.crc = Calc_CRCByte((uint8_t *)&(PosInfo.ID), 510);
	
	SD_WriteBlock((uint8_t *)&(PosInfo.ID), sec, 512);
	
	OSTimeDly(5);
	
	SD_WriteBlock((uint8_t *)&(PosInfo.ID), sec + 128, 512);
}


void SavePosToFRam(void)
{
	uint8_t i, n, k, *ptr, *ptr2;
	
	n = sizeof(FsramInfo);
	k = n - 2;
	
	ptr = (uint8_t *)&(FsramInfo.PosData.Time);
	ptr2 = (uint8_t *)&(PosInfo.PosData.Time);
	for (i = 0; i < n; i++)
		ptr[i] = ptr2[i];
	
	FsramInfo.crc = Calc_CRCByte(ptr, k);
	
	sEE_WriteBuffer(ptr, 0, n);
	
	OSTimeDly(5);
	
	sEE_WriteBuffer(ptr, 128, n);
}


void SaveJwToSD(void)
{
	
}



void GetVerInfo(void)
{
	uint32_t sec;
	SD_Error err;
	uint8_t flag[2] = {0, 0};
	uint16_t crc;
	
	sec = bpb.VersSecNo;
	err = SD_ReadBlock(_TempSD_Buf, sec, 512);
	if (err != SD_OK)
		flag[0] = 1;
	else{
		
		crc = Calc_CRCByte(_TempSD_Buf, 510);
		if (crc != (*(uint16_t *)&(_TempSD_Buf[510])))
			flag[0] = 1;
		if (*(uint32_t *)&(_TempSD_Buf[0]) != VERSION_DATA_ID)
			flag[0] = 1;
	}
	
	err = SD_ReadBlock(_TempSD_Buf, sec + 1, 512);
	if (err != SD_OK)
		flag[1] = 1;
	else{
		
		crc = Calc_CRCByte(_TempSD_Buf, 510);
		if (crc != (*(uint16_t *)&(_TempSD_Buf[510])))
			flag[1] = 1;
		if (*(uint32_t *)&(_TempSD_Buf[0]) != VERSION_DATA_ID)
			flag[1] = 1;
	}
	
	if (flag[0] && flag[1])
		_SD_NeedFormat++;
	else{
		
		if (flag[0])
			err = SD_WriteBlock(_TempSD_Buf, sec, 512);
		else{
			
			err = SD_ReadBlock(_TempSD_Buf, sec, 512);
			err = SD_WriteBlock(_TempSD_Buf, sec + 1, 512);
		}
	}
}


void GetPosInfo(void)
{
	uint16_t i, crc;
	uint32_t sec, id = 0;
	SD_Error err;
	uint16_t index = 0xffff;
	
	for (i = 0; i < 128; i++){
		
		sec = bpb.PosSecStartNo + i;
		err = SD_ReadBlock(_TempSD_Buf, sec, 512);
		if (err == SD_OK){
			
			crc = Calc_CRCByte(_TempSD_Buf, 510);
			if (crc == PosInfo.crc){
				
				if (PosInfo.ID == POSITION_DATA_ID){
					
					if (PosInfo.Index >= id)
						index = i;
				
					err = SD_WriteBlock(_TempSD_Buf, sec + 128, 512);
				}
			}
		}
		else{
			
			err = SD_ReadBlock(_TempSD_Buf, sec + 128, 512);
			if (err == SD_OK){
				
				crc = Calc_CRCByte(_TempSD_Buf, 510);
				if (crc == PosInfo.crc){
					
					if (PosInfo.ID == POSITION_DATA_ID){
						
						if (PosInfo.Index >= id)
							index = i;
					
						err = SD_WriteBlock(_TempSD_Buf, sec, 512);
					}
				}
			}
		}
	}
	
	if (index == 0xffff)
		_SD_NeedFormat++;
	else{
		
		err = SD_ReadBlock((uint8_t *)&(PosInfo.ID), bpb.PosSecStartNo + index, 512);
		if (err == SD_OK){
		}
	}
}

void GetNVRamInfo(void)
{
	uint8_t *ptr, err[2] = {0, 0};
	uint16_t crc, cnt, n, k;
	uint32_t tm1 = 0, tm2 = 0;
	
	ptr = (uint8_t *)&(FsramInfo.PosData.Time);
	
	n = sizeof(FsramInfo);
	k = n - 2;

	cnt = n;
	sEE_ReadBuffer(ptr, 0, &cnt);
	crc = Calc_CRCByte(ptr, k);
	if (crc != (*(uint16_t *)&(ptr[k])))
		err[0] = 0;
	else
		tm1 = FsramInfo.PosData.Time;
	
	cnt = n;
	sEE_ReadBuffer(ptr, 128, &cnt);
	crc = Calc_CRCByte(ptr, k);
	if (crc != (*(uint16_t *)&(ptr[k])))
		err[1] = 0;
	else
		tm2 = FsramInfo.PosData.Time;
	
	if (err[0] || err[1]){
		
		if (err[0] && err[1])
			_SD_NeedFormat = 1;
		else if (err[0])
			sEE_WriteBuffer(ptr, 0, n);
		else{
			
			cnt = n;
			sEE_ReadBuffer(ptr, 0, &cnt);
			sEE_WriteBuffer(ptr, 128, n);
		}
	}
	else{
		
		if (tm1 >= tm2){
			
			cnt = n;
			sEE_ReadBuffer(ptr, 0, &cnt);
		}
	}
}


void FormatSD(void)
{
	FRESULT res;
	
	///Format SD: File system, all of Version-sec, position-sec and digital-sec, every analog head-sec
	FormatSec0();
	
	/// Setup FAT32
	res = f_mount(MMC, &fatfs_SD);
	if (res != FR_OK){
		
		AppInfo.SD_Error = 1;
		return;
	}
	
	res = f_mkfs(MMC, 0, 512);
	if (res != FR_OK){
		
		AppInfo.SD_Error = 2;
		return;
	}
	
	///Initialize Version sectors:
	FormatVerSectors();
	
	///Initialize JW sectors:
	FormatJwSectors();
	
	///Initialize Test sectors:
	FormatTestSectors();
	
	///Initialize Status sectors:
	FormatStsSectors();
	
	///Initialize Analog sectors:
	FormatAnaSectors();
	
	/// Initialize PosInfo:
	FormatPosSectors();
}


uint8_t GetFatInfo(void)
{
	SD_Error err;
	uint32_t sec;
	uint8_t temp1, temp2;
	uint16_t Formated, /*FATType,*/ *P;
	uint32_t temp, DataSec;
	
	sec = 0;
	err = SD_ReadBlock(_TempSD_Buf, sec, 512);
	if (err == ERROR)
		return 4;
  
	P = (uint16_t *)_TempSD_Buf;
	// Remember CF_Buf is Interger and MBR is Byte,also remember that CF card Data is arranged 
	// in such a way that the preceding byte is the LSB7..0 and the following byte is the MSB 15..8
	temp1 = (P[0] & 0xFF);
	temp2 = (P[1] & 0xFF);
	if (((temp1 == 0xEB) && (temp2 == 0x90)) || (temp1 == 0xE9))
		Formated = 1;
	else 
		Formated = 0;
	if (P[255] != 0xAA55)
		Formated = 0;    
	temp = (P[9] >> 8) + ((P[10] & 0xFF) << 8);  
	if (temp != 0)
		Formated = 0;
	temp = P[11];
	if (temp != 0)
		Formated = 0;
    
	bpb.TotSec32 = P[16] + ((uint32_t)P[17] << 16); 
	if ((bpb.TotSec32 != SDCardInfo.CardCapacity) && (bpb.TotSec32 != SDCardInfo.CardCapacity - 1))
		Formated = 0;
	if ((P[10] >> 8) != 0xF8)
		Formated = 0;
  
	bpb.BytesPerSec = (P[5] >> 8) + ((P[6] & 0xFF) << 8);
	if (bpb.BytesPerSec != 512)
		Formated = 0;

	bpb.RsvdSecCnt = P[7];   
	if ((bpb.RsvdSecCnt != 32) && (bpb.RsvdSecCnt != 38))  
		Formated = 0;
	bpb.NumFATs = (P[8] & 0xFF);
	if (bpb.NumFATs != 2)
		Formated = 0;
    
	bpb.SecPerClus = (P[6] >> 8);
	if ((bpb.SecPerClus > 8) || (bpb.SecPerClus < 2))
		Formated = 0;
  
	if (SDCardInfo.CardCapacity < 1064960UL)
		return 2;
	
	if (SDCardInfo.CardCapacity < 2129920UL)//1040M
	{
		if (bpb.SecPerClus != 8)
			Formated = 0;
		bpb.CF_Type = CF_1G;
	}
	else if (SDCardInfo.CardCapacity < 4259840UL)
	{
		if (bpb.SecPerClus != 8)
			Formated = 0;
		bpb.CF_Type = CF_2G;
	}
	else if (SDCardInfo.CardCapacity < 8519680UL)
	{
		if (bpb.SecPerClus != 16)
			Formated = 0;
		bpb.CF_Type = CF_4G;
	}
	else if (SDCardInfo.CardCapacity < 17039360UL)
		{
		if (bpb.SecPerClus != 16)
			Formated = 0;
		bpb.CF_Type = CF_8G;
	}
	else if (SDCardInfo.CardCapacity < 34078720UL)
		{
		if (bpb.SecPerClus != 32)
			Formated = 0;
		bpb.CF_Type = CF_16G;
	}
	else if (SDCardInfo.CardCapacity < 68157440UL)
	{
		if (bpb.SecPerClus != 32)
			Formated = 0;
		bpb.CF_Type = CF_32G;
	}
	else
		return 3;
  
	if (Formated == 0)
		return 1;
    
	bpb.RootClus = ((uint32_t)P[23] << 16) + P[22];  
	//bpb.RsvdSecCnt = P[7];  
	bpb.RootEntCnt = (P[8] >> 8) + ((P[9] & 0xFF) << 8);  
	bpb.FATSz32 = P[18] + ((uint32_t)P[19] << 16);  
        
	bpb.RootDirSectors = ((bpb.RootEntCnt * 32) + 
                        (bpb.BytesPerSec - 1)) / bpb.BytesPerSec;
	DataSec = bpb.TotSec32 - 
				(bpb.RsvdSecCnt + (bpb.NumFATs * bpb.FATSz32) + bpb.RootDirSectors);
	bpb.CountOfClusters = DataSec / bpb.SecPerClus;
  
	if (bpb.CountOfClusters < 4085) 
	{
		//FATType = FAT12;
		return 1;
	} 
	else if(bpb.CountOfClusters < 65525) 
	{
		///FATType = FAT16;
		return 1;
	}
  
	///FATType = FAT32;
  
	bpb.FirstDataSector = bpb.RsvdSecCnt + (bpb.NumFATs * bpb.FATSz32) + 
                            bpb.RootDirSectors;
	bpb.FirstFATSector = bpb.RsvdSecCnt + bpb.RootDirSectors;
	bpb.FATCntOfPerSector = bpb.BytesPerSec / 4;  // = 128.One FAT data is 32Bits or 4_bytes.
	bpb.TotBytesPerClus = (bpb.BytesPerSec * bpb.SecPerClus);
  
	bpb.VersSecNo = bpb.FirstDataSector + bpb.SecPerClus;
	bpb.JwSecStartNo = bpb.VersSecNo + 2;
	bpb.PosSecStartNo = bpb.JwSecStartNo + 286;
	bpb.TestSecStartNo = bpb.PosSecStartNo + 256;
	bpb.StsSecStartNo = bpb.TestSecStartNo + 64;
	
	bpb.SigSecStartNo = bpb.StsSecStartNo + STS_SECTOR_COUNT;
	bpb.MaxSigFileCnt = (bpb.TotSec32 - 1 - bpb.SigSecStartNo) / ANALOG_FILE_SEC_CNT;
	  
	return 0;
}


void CheckPosInfo(void)
{
	uint8_t tmBuf[4], dtBuf[4];
	uint32_t tm1, tm2;
	
	tm1 = PosInfo.PosData.Time;
	tmBuf[2] = tm1 & 0x3f;
	tmBuf[1] = (tm1 >> 6) & 0x3f;
	tmBuf[0] = (tm1 >> 12) & 0x1f;
	dtBuf[2] = (tm1 >> 17) & 0x1f;
	dtBuf[1] = (tm1 >> 22) & 0x0f;
	dtBuf[3] = (tm1 >> 26);
	tm1 = GetTimeToSeconds(tmBuf, dtBuf);
	
	tm2 = FsramInfo.PosData.Time;
	tmBuf[2] = tm2 & 0x3f;
	tmBuf[1] = (tm2 >> 6) & 0x3f;
	tmBuf[0] = (tm2 >> 12) & 0x1f;
	dtBuf[2] = (tm2 >> 17) & 0x1f;
	dtBuf[1] = (tm2 >> 22) & 0x0f;
	dtBuf[3] = (tm2 >> 26);
	tm2 = GetTimeToSeconds(tmBuf, dtBuf);
	
	///NVRAM and SD last position record time difference > 1h
	if ((tm1 > tm2 + 3600) || (tm2 > tm1 + 3600)){
		_SD_NeedFormat++;
		return;
	}
	
	///using NVRAM position data:
	memcpy((uint8_t *)&(PosInfo.PosData.Time), (uint8_t *)&(FsramInfo.PosData.Time), sizeof(POS_DATA));
	
	///AppInfo.PosSec = FsramInfo.PosData.
}



void FormatSec0(void)
{
	SD_Error err;
	uint32_t tmpVal1,tmpVal2;
	uint32_t i;
	uint16_t *P;
	uint32_t FATSz, DataSec, DskSz;
	uint32_t temp;
  
	bpb.RootEntCnt = 0;
	bpb.RsvdSecCnt = 32;
	bpb.BytesPerSec = 512;
	bpb.FATCntOfPerSector = bpb.BytesPerSec >> 2;  // = 128.One FAT data is 32Bits or 4_bytes. 
	bpb.RootClus = 0x02;
	bpb.NumFATs = 2;
  
	bpb.RootDirSectors = ((bpb.RootEntCnt << 5) + 
                         (bpb.BytesPerSec - 1)) / bpb.BytesPerSec;
	bpb.FirstFATSector = bpb.RsvdSecCnt + bpb.RootDirSectors;
  
	//TotSec = DiskSz;
	DskSz = SDCardInfo.CardCapacity;
	bpb.TotSec32 = DskSz;// + 1;
	// Microsoft deals 32.5MB to 260MB disk with only one BPB_SecPerClus = 1.
	// To format CF under 130MB to FAT32, this value must be under 4. Here chose 2.     
	bpb.RsvdSecCnt = 38;
	if (DskSz < 2129920)//1040M
	{
		bpb.SecPerClus = 8;
		bpb.CF_Type = CF_1G;
	}
	else if (DskSz < 4259840)//2080M
	{
		bpb.SecPerClus = 8;
		bpb.CF_Type = CF_2G;
	}
	else if (DskSz < 8519680)//4160M
	{
		bpb.SecPerClus = 16;
		bpb.CF_Type = CF_4G;
	}
	else if (DskSz < 17039360UL)
	{
		bpb.SecPerClus = 16;
		bpb.CF_Type = CF_8G;
	}
	else if (DskSz < 34078720UL)
	{
		bpb.SecPerClus = 32;
		bpb.CF_Type = CF_16G;
	}
	else if (DskSz < 68157440UL)
	{
		bpb.SecPerClus = 3;
		bpb.CF_Type = CF_32G;
	}
    
	//Calculate FAT Size : Step 1
	tmpVal1 = DskSz - (bpb.RsvdSecCnt + bpb.RootDirSectors);
	tmpVal2 = ((256U * bpb.SecPerClus) + bpb.NumFATs) >> 1;// / 2;
	FATSz = (tmpVal1 + (tmpVal2 - 1)) / tmpVal2; // For SAMSUNG 128MB(250080 sectors) CF card,this is 974
	//Calculate FAT Size : Step 2
	DataSec = DskSz - 
            (bpb.RsvdSecCnt + (uint32_t)bpb.NumFATs * FATSz + bpb.RootDirSectors);
	bpb.CountOfClusters = DataSec / bpb.SecPerClus;
	bpb.TotBytesPerClus = (bpb.BytesPerSec * bpb.SecPerClus);
	//Calculate FAT Size : Step 3
	tmpVal1 = ((bpb.CountOfClusters + 2) >> 7); // divided by FATCntOfPerSector,128
	if (((bpb.CountOfClusters + 2) % 128) != 0)
		tmpVal1++;
	FATSz = tmpVal1;
	bpb.FATSz32 = FATSz;
  
	DataSec = DskSz - 
            (bpb.RsvdSecCnt + (bpb.NumFATs * FATSz) + bpb.RootDirSectors);
	bpb.CountOfClusters = DataSec / bpb.SecPerClus;
  
	bpb.FirstDataSector = bpb.RsvdSecCnt + 
                        (bpb.NumFATs * FATSz) + bpb.RootDirSectors;
	bpb.FirstFATSector = bpb.RsvdSecCnt + bpb.RootDirSectors;
  
  
	bpb.VersSecNo = bpb.FirstDataSector + bpb.SecPerClus;
	bpb.JwSecStartNo = bpb.VersSecNo + 2;
	bpb.PosSecStartNo = bpb.JwSecStartNo + 286;
	bpb.TestSecStartNo = bpb.PosSecStartNo + 256;
	bpb.StsSecStartNo = bpb.TestSecStartNo + 64;
  
	bpb.SigSecStartNo = bpb.StsSecStartNo + STS_SECTOR_COUNT;
	bpb.MaxSigFileCnt = 
						(bpb.TotSec32 - 1 - bpb.SigSecStartNo) / ANALOG_FILE_SEC_CNT;
	// Combine now time to 4 bytes-BS_VolID : 
	// LSB Year(7 bits) + Month(4 bits) + Date(5 bits) + Hour(5 bits) + Minute(6 bits) + Second(5 bits)
	temp = _tmpTime;
	tmpVal1 = (temp >> 26) + (((temp >> 22) & 0x0F) << 7) + (((temp >> 17) & 0x1F) << 11);
	tmpVal2 = ((temp >> 12) & 0x1F) + (((temp >> 7) & 0x3F) << 5) + (((temp >> 1) & 0x1F) << 11);
  
	P = (uint16_t *)&_TempSD_Buf;
	// Here set MBR bytes
	P[0] = 0x00EB;
	P[1] = 0x90 + 0x4D00;
	P[2] = 0x4453;
	P[3] = 0x534F;
	P[4] = 0x2E35;
	P[5] = 0x30 + ((bpb.BytesPerSec & 0xFF) << 8);
	P[6] = (bpb.BytesPerSec >> 8) + (bpb.SecPerClus << 8);
	P[7] = bpb.RsvdSecCnt;
	P[8] = bpb.NumFATs + ((bpb.RootEntCnt & 0xFF) << 8);
	P[9] = (bpb.RootEntCnt >> 8) + 0;
	P[10] = 0 + (0xF800);
	P[11] = 0;
	P[12] = 0x003F;
	P[13] = 0x00FF;
	P[14] = 0x0020;
	P[15] = 0x0000;
	P[16] = (bpb.TotSec32 & 0x0000FFFF);
	P[17] = ((bpb.TotSec32 & 0xFFFF0000) >> 16);
	P[18] = (bpb.FATSz32 & 0x0000FFFF);
	P[19] = ((bpb.FATSz32 & 0xFFFF0000) >> 16);
	P[20] = 0x0000;
	P[21] = 0x0000;
	P[22] = (bpb.RootClus & 0x0000FFFF);
	P[23] = ((bpb.RootClus & 0xFFFF0000) >> 16);
	P[24] = 1;
	P[25] = 6;
	//BPB_Reserved
	P[26] = 0x0000;
	P[27] = 0x0000;
	P[28] = 0x0000;
	P[29] = 0x0000;
	P[30] = 0x0000;
	P[31] = 0x0000;
	//BS_DrvNum + BS_Reserved1
	P[32] = 0x0080;
	//BS_BootSig + BS_VolID
	P[33] = 0x29 + (tmpVal2 << 8);
	P[34] = (tmpVal2 >> 8) + (tmpVal1 << 8);
	P[35] = (tmpVal1 >> 8) + ('N' << 8); // 'NO NAME    '
	P[36] = 0x2000 + 'O';
	P[37] = 'N' + ('A' << 8);
	P[38] = 'M' + ('E' << 8);
	P[39] = ' ' + (' ' << 8);
	P[40] = ' ' + (' ' << 8);
	P[41] = 'F' + ('A' << 8);
	P[42] = 'T' + ('3' << 8);
	P[43] = '2' + (' ' << 8);
	P[44] = ' ' + (' ' << 8);
	for (i = 45; i < 255; i++)
	{
		P[i] = 0x0000;
	}
	P[255] = 0xAA55;
  
	err = SD_WriteBlock(_TempSD_Buf, 0, 512);
	if (err == ERROR)
		return;
	err = SD_WriteBlock(_TempSD_Buf, 6, 512);
	
}


void FormatVerSectors(void)
{
	uint16_t crc;
	SD_Error err;
	
	memset(_TempSD_Buf, 0, 512);
	
	_TempSD_Buf[0] = VERSION_DATA_ID & 0xff;
	_TempSD_Buf[1] = (VERSION_DATA_ID >> 8) & 0xff;
	_TempSD_Buf[2] = (VERSION_DATA_ID >> 16) & 0xff;
	_TempSD_Buf[3] = (VERSION_DATA_ID >> 24) & 0xff;
	_TempSD_Buf[4] = 'V';
	_TempSD_Buf[5] = 'e';
	_TempSD_Buf[6] = 'r';
	_TempSD_Buf[7] = '4';
	_TempSD_Buf[8] = '0';
	_TempSD_Buf[9] = '0';
	_TempSD_Buf[10] = '0';
	_TempSD_Buf[11] = '0';
	_TempSD_Buf[12] = _tmpTime & 0xff;
	_TempSD_Buf[13] = (_tmpTime >> 8) & 0xff;
	_TempSD_Buf[14] = (_tmpTime >> 16) & 0xff;
	_TempSD_Buf[15] = (_tmpTime >> 24) & 0xff;
	/// 机车号
	_TempSD_Buf[16] = 0;
	_TempSD_Buf[17] = 0;
	
	crc = Calc_CRCByte(_TempSD_Buf, 510);
	_TempSD_Buf[510] = crc & 0xff;
	_TempSD_Buf[511] = crc >> 8;
	
	err = SD_WriteBlock(_TempSD_Buf, 0, 512);
	if (err == ERROR)
		return;
	err = SD_WriteBlock(_TempSD_Buf, 0, 512);
}


void FormatJwSectors(void)
{
	uint16_t cnt;
	uint32_t i;
	SD_Error err;
	
	for (i = 0; i < 131072u; i++)
		SampleBuf[i] = 0x00;
	cnt = 4;
	for (i = 0; i < cnt; i++){
		
		err = SD_WriteMultiBlocks(&SampleBuf[i << 15], bpb.JwSecStartNo + (i << 6), 512, 64);
		if (err == ERROR)
			return;
	}
}


void FormatPosSectors(void)
{
	uint16_t i;
	SD_Error err;
	
	memset((uint8_t *)&(PosInfo.ID), 0, sizeof(PosInfo));
	
	PosInfo.ID = POSITION_DATA_ID;
	PosInfo.Index = 0;
	PosInfo.PosData.Time = _tmpTime;
	PosInfo.PosData.JwSec = bpb.JwSecStartNo;
	PosInfo.PosData.JwIndex = 0;
	PosInfo.PosData.JwSec_CopyStart = bpb.JwSecStartNo;
	PosInfo.PosData.JwSec_CopyEnd = bpb.JwSecStartNo;
	PosInfo.PosData.JwSec_CopyTm = 0;
	
	PosInfo.PosData.TestSec = bpb.TestSecStartNo;
	PosInfo.PosData.TestIndex = 0;
	PosInfo.PosData.TestSec_CopyStart  = bpb.TestSecStartNo;
	PosInfo.PosData.TestSec_CopyEnd  = bpb.TestSecStartNo;
	PosInfo.PosData.TestSec_CopyTm = 0;
	
	PosInfo.PosData.StsSec = bpb.StsSecStartNo;
	PosInfo.PosData.StsSec_CopyStart  = bpb.StsSecStartNo;
	PosInfo.PosData.StsSec_CopyEnd  = bpb.StsSecStartNo;
	PosInfo.PosData.StsSec_CopyTm = 0;
	
	PosInfo.PosData.AnaIndex = 0;
	PosInfo.PosData.AnaFile_CopyStart = bpb.SigSecStartNo;
	PosInfo.PosData.AnaFile_CopyEnd  = bpb.SigSecStartNo;
	PosInfo.PosData.AnaFile_CopyTm = 0;
	
	PosInfo.crc = Calc_CRCByte((uint8_t *)&(PosInfo.ID), 510);
	
	for (i = 0; i < 256; i++){
		err = SD_WriteBlock((uint8_t *)&(PosInfo.ID), bpb.PosSecStartNo + i, 512);
		if (err == ERROR)
			return;
	}
	
	/// Initialize FsramInfo:
	memset((uint8_t *)&(FsramInfo.PosData.Time), 0, sizeof(FsramInfo));
	FsramInfo.PosData.Time = _tmpTime;
	FsramInfo.PosData.JwSec = bpb.JwSecStartNo;
	FsramInfo.PosData.JwIndex = 0;
	FsramInfo.PosData.JwSec_CopyStart = bpb.JwSecStartNo;
	FsramInfo.PosData.JwSec_CopyEnd = bpb.JwSecStartNo;
	FsramInfo.PosData.JwSec_CopyTm = 0;
	
	FsramInfo.PosData.TestSec = bpb.TestSecStartNo;
	FsramInfo.PosData.TestIndex = 0;
	FsramInfo.PosData.TestSec_CopyStart  = bpb.TestSecStartNo;
	FsramInfo.PosData.TestSec_CopyEnd  = bpb.TestSecStartNo;
	FsramInfo.PosData.TestSec_CopyTm = 0;
	
	FsramInfo.PosData.StsSec = bpb.StsSecStartNo;
	FsramInfo.PosData.StsSec_CopyStart  = bpb.StsSecStartNo;
	FsramInfo.PosData.StsSec_CopyEnd  = bpb.StsSecStartNo;
	FsramInfo.PosData.StsSec_CopyTm = 0;
	
	FsramInfo.PosData.AnaIndex = 0;
	FsramInfo.PosData.AnaFile_CopyStart = bpb.SigSecStartNo;
	FsramInfo.PosData.AnaFile_CopyEnd  = bpb.SigSecStartNo;
	FsramInfo.PosData.AnaFile_CopyTm = 0;
	
	FsramInfo.crc = Calc_CRCByte((uint8_t *)&(FsramInfo.PosData.Time), sizeof(FsramInfo) - 2);
	
	sEE_WriteBuffer((uint8_t *)&(FsramInfo.PosData.Time), 0, sizeof(FsramInfo));
}


void FormatTestSectors(void)
{
	uint32_t i;
	SD_Error err;
	
	for (i = 0; i < 131072; i++)
		SampleBuf[i] = 0x00;
			
	err = SD_WriteMultiBlocks(&SampleBuf[0], bpb.TestSecStartNo, 512, 64);
	if (err == ERROR)
		;
}


void FormatStsSectors(void)
{
	uint16_t cnt;
	uint32_t i;
	SD_Error err;
	
	for (i = 0; i < 131072; i++)
		SampleBuf[i] = 0x00;
	cnt = STS_SECTOR_COUNT / 64;
	for (i = 0; i < cnt; i++){
		
		err = SD_WriteMultiBlocks(&SampleBuf[i << 15], bpb.StsSecStartNo + (i << 6), 512, 64);
		if (err == ERROR)
			return;
	}
}
		
void FormatAnaSectors(void)
{
	uint32_t i;
	SD_Error err;
	
	for (i = 0; i < 512; i++)
		_TempSD_Buf[i] = 0x00;
	for (i = 0; i < bpb.MaxSigFileCnt; i++){
		
		err = SD_WriteBlock(&SampleBuf[0], bpb.SigSecStartNo + (i * ANALOG_FILE_SEC_CNT), 512);
		if (err == ERROR)
			return;
	}
}




#if DEBUG_SD_ENABLE
void TestSD(void)
{
	uint16_t i, *ptr;
	uint32_t Sec;
	///SD_Error status;
	uint8_t err;
	
	Sec = 0;
	_Sd_Err = SD_ReadBlock(_Sd_Buf, Sec, 512);
	if (_Sd_Err != SD_OK)
		goto Err;
	/* Check if the Transfer is finished */
    /*status =  SD_WaitReadOperation();
    while(SD_GetStatus() != SD_TRANSFER_OK);
    if (status != SD_OK)
		goto Err;*/
	OSSemPend(Sem_SD, 100, &err);
	if (err)
		goto Err;
	
	ptr = (uint16_t *)&(_Sd_Buf[0]);
	for (i = 0; i < (_BUF_SIZE >> 1); i++)
		ptr[i] = i << 1;
	
	Sec = 333000 + rand();
	_Sd_Err = SD_WriteMultiBlocks(_Sd_Buf, Sec, 512, 16);
	if (_Sd_Err != SD_OK)
		goto Err;
	/* Check if the Transfer is finished */
    /*status = SD_WaitWriteOperation();
    while(SD_GetStatus() != SD_TRANSFER_OK);
    if (status != SD_OK)
		goto Err;*/
	OSSemPend(Sem_SD, 100, &err);
	if (err)
		goto Err;
				
	for (i = 0; i < (_BUF_SIZE >> 1); i++)
		ptr[i] = 0;
	_Sd_Err = SD_ReadMultiBlocks(_Sd_Buf, Sec, 512, 16);
	if (_Sd_Err != SD_OK)
		goto Err;
	/* Check if the Transfer is finished */
    /*status =  SD_WaitReadOperation();
    while(SD_GetStatus() != SD_TRANSFER_OK);
    if (status != SD_OK)
		goto Err;*/
	OSSemPend(Sem_SD, 100, &err);
	if (err)
		goto Err;
	
	ptr = (uint16_t *)&(_Sd_Buf[0]);
	for (i = 0; i < (_BUF_SIZE >> 1); i++){
				
		if (ptr[i] != (i << 1))
			goto Err;
	}
	
	return;
	
Err:
	_Sd_Err = SD_ERROR;
}
#endif



