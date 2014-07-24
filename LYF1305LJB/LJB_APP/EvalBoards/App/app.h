/*
	FileName : app.h
	Description : 
		L1205ZDC 智能传感器应用软件头文件。
	Created on 2013.03.02 by ZZP.

	Revision History:

*/

#ifndef __APP_H__
#define __APP_H__

#include <core_cm3.h>
#include <ucos_ii.h>
#include "app_cfg.h"

///////////////////////////////////////////////////////////////////////////////////////
///									DEFINES
///////////////////////////////////////////////////////////////////////////////////////
///软件类型
///BIOS
#define FIRM_BIOS						(0<<0)
///APP
#define FIRM_APPLICATION				(1<<0)

///软件版本号
///BIOS版本号在BIOS下定义
#if 0
///BIOS
#define BIOS_SOFT_VER_MAIN				0x01
#define BIOS_SOFT_VER_SUB				0x00
#define BIOS_SOFT_VER_YEAR				0x13
#define BIOS_SOFT_VER_MONTH				0x10
#define BIOS_SOFT_VER_DATE				0x15
#endif 
///APP
#define APP_SOFT_VER_MAIN				0x10
#define APP_SOFT_VER_SUB				0x00
#define APP_SOFT_VER_YEAR				0x13//0x14
#define APP_SOFT_VER_MONTH			    0x10//0x05
#define APP_SOFT_VER_DATE				0x10//0x07

//Started Added by me 20140718
///内部软件版本定义
///BIOS
#define INTERNAL_BIOS_SOFT_VER_MAIN				0x01
#define INTERNAL_BIOS_SOFT_VER_SUB				0x00
#define INTERNAL_BIOS_SOFT_VER_YEAR				0x14
#define INTERNAL_BIOS_SOFT_VER_MONTH			0x07
#define INTERNAL_BIOS_SOFT_VER_DATE				0x18
 
///APP
#define INTERNAL_APP_SOFT_VER_MAIN				0x10
#define INTERNAL_APP_SOFT_VER_SUB				0x00
#define INTERNAL_APP_SOFT_VER_YEAR				0x14
#define INTERNAL_APP_SOFT_VER_MONTH			    0x07
#define INTERNAL_APP_SOFT_VER_DATE				0x18
//End Added by me 20140718

/* Added by me 2014/02/25 */
///Used by CalibrationInfo
#define CHANNEL_COUNT_LIMIT		       5
#define PARAMETER_BYTE_COUNT		       4


#define WORK_STATUS_NORMAL			0

///系统错误状态位定义
#define STATUS_ADC_BIT				(0)
#define STATUS_ADC_DMA_BIT			(1)
#define STATUS_ADC_INTERRUPT_BIT	(2)
#define STATUS_USART_BIT			(3)
#define STATUS_USART_DMA_BIT		(4)
#define STATUS_USART_INTERRUPT_BIT	(5)
#define STATUS_TASK_SIGNAL_BIT		(6)
#define STATUS_TASK_USART_BIT		(7)
#define STATUS_TM3_INTERRUPT_BIT	(8)


#if defined JLB_CPU_MAIN
#define RECORD_METHOD_NORMAL		0
#define RECORD_METHOD_CONTINOUS		1

#define ANALOG_FILE_SEC_CNT			366u
#define ANALOG_FILE_LEN				((uint32_t)ANALOG_FILE_SEC_CNT << 9)

#define ANALOG_BEGIN_10S_CNT		125000u
#endif

#define 	BOARD_COUNT				3
#define	BOARD_MAX_DATA_COUNT	       64


///L,		LU,		U,		U2,		HU,		UU,		H,		B
#define LED_OFF						0
#define LED_L						       1
#define LED_LU						2
#define LED_U						3
#define LED_U2						4
#define LED_HU						5
#define LED_UU						6
#define LED_H						7
#define LED_B						8

typedef struct{
	
	uint8_t		BdAddr;		///板地址
	uint8_t		BdType;		///交流转辙机、直流转辙机、ZD7转辙机
	uint8_t		SoftType;	///固件类型	
	
	uint8_t		ResetF;		///是否需要复位	
	
	///Lais or other functon board err status
	uint16_t	FuncErrCnt[8];
	uint8_t		FuncSts[8];

	uint8_t		RdyFlag;		///
	uint8_t		ErrFlag;
	uint8_t		rsvd1[2];
	uint8_t		UsartRxFlag[6];
	uint8_t		UsartTxFlag[6];
	
	uint8_t		WorkLedFlag;	///
	uint8_t		ErrLedFlag;
	uint8_t		CopyLedFlag;
	uint8_t		LaisLedFlag;
	uint8_t		MiscLedFlag;
	uint8_t		RxLedFlag;  // ComLedFlag;
	uint8_t		CanLedFlag;
	uint8_t		TaxLedFlag;
	
	uint8_t		OneSecAlarmFlag;	/// 1s
	uint8_t		OrderOf1Sec;		/// Index between two seconds
	uint8_t		TaxTimeValid;		/// Tax Time OK or not
	uint8_t		UserTimeValid;		/// User calibrate time
	uint8_t		TaxDataValid38;	/// Frame 38 OK or not
	uint8_t		TaxDataValid39;	/// Frame 39 OK or not
	
	uint8_t		SramErr;
	uint8_t		rsvd2;

	uint16_t	UsartRxLedTm[6];
	uint16_t	UsartTxLedTm[6];
//	uint16_t	ADDlyTm;
	uint16_t	WorkLedTm;
	uint16_t	ErrLedTm;
	uint16_t	CopyLedTm;
	uint16_t	LaisLedTm;
	uint16_t	MiscLedTm;
	uint16_t	RxLedTm;   // ComLedTm;
	uint16_t	TxLedTm;  // CanLedTm;
	uint16_t	TaxLedTm;
	
	uint16_t	ErrLedTmConst1;
	uint16_t	ErrLedTmConst2;
	
	uint16_t	TaxCnt;			/// Tax data valid count
	uint16_t	TaxErrCnt;			/// Tax data invalid count
	uint16_t	TaxTimeIncCnt;		/// Tax time count 
	
	uint16_t	rsvd3;

	uint16_t	UsartRxHandleIndex[6];

//	uint32_t	NowTime;			/// Clock time
	uint32_t	TaxTime;			/// Tax time
	uint32_t	UserTime;			/// User calibrate time
	uint32_t	TimeBeforeCalibrate;
	uint32_t	CalibrateTimeF;

	uint32_t	Det12V_Total;
	uint16_t	Det12V_Cnt;
	uint16_t	Det12V;


	uint16_t	TaskUsartCnt[6];		/// Usart tasks run count
	uint32_t	UsartNoDataCnt[6];		/// Usarts no data time count
	
	uint16_t	TaskDacCnt;			/// DAC task runs count
	uint16_t	TaskAdcCnt;
	uint16_t	TaskRtcCnt;
	uint16_t	TaskUsbCnt;
	uint16_t	TaskSdCnt;
	uint16_t	TaskI2cCnt[3];
	uint16_t	TaskSpiCnt[3];
	uint16_t	TaskCanCnt[3];

	uint32_t	IntAdcDmaCnt;			/// ADC DMA interrupt runs count
	uint32_t	IntUsartCnt;
	uint32_t	IntUsartDmaCnt;
	uint32_t	IntTm3Cnt;
	
	///RA/RB/LAIS数据读取周期：
	uint16_t	GetDeviceDataTm;
	uint16_t	DeviceDataPrd;
	uint8_t		GetDeviceDataFlag;
	uint8_t		XferRecToDeviceF;
	uint16_t	DeviceWaitTm;

	uint32_t	SysStatus;
	uint32_t	CpuUsage;
	
	///JLB_CPU_MAIN: 需要 32 位
	uint32_t	StsHandleIndex;		/// Status frame handle index
	uint32_t	StsIndex;				/// Status frame index

#if defined JLB_CPU_MAIN

	uint8_t		TrBenBu;
	uint8_t		TrNo[2];					///Train number
	uint8_t		LocomotiveNo[2];
	uint8_t		LocomotiveType;
	uint8_t		exLocomotiveType;
	uint8_t		TrNoTypeID[4];
	uint8_t		exTrNo[3];
	uint8_t		rsvd4;
	
	uint16_t	LaisID;					///Lais ID
	
	uint8_t		SwStatus;				///
	uint8_t		SD_Error;				///SD error status
	uint8_t		SD_OpReleased;			///In usb mode, detect if SD in use
	
	uint8_t		CoilIndex;				///Coil in use
	uint8_t		AtHomeFlag;				///是否在库内：在库内时，不记录波形
	
	uint8_t		JwDataRdy;				///110V data ready
	uint8_t		TestDataRdy;
	
	uint8_t 	LaisStsIndex;			///Index of Status to xfer to LAIS server
	uint8_t 	LaisStsHandleIndex;		///Handled index of Status 
	
	uint8_t		LaisReadStsFlag;		///Need SD task to read status
	uint8_t		LaisReadAnaFlag;		///Need SD task to read analog file data
	uint8_t		LaisReadAnaHeadFlag;	///Need SD task to read analog file head only
	
	uint8_t  	LaisStsDataRdy;			///Status data has been read by SD task
	uint8_t  	LaisAnaDataRdy;			///Analog data has been read by SD task
	uint8_t		LaisAnaHeadRdy;			///Analog head ready
	
	uint8_t		rsvd5;
	
	uint16_t	LaisReadAnaHeadCnt;		///Analog file head count in the buff
	uint16_t	rsvd6;
	
	uint32_t	LaisReadAnaFileIndex;	///Index of analog file to read by SD task
		
	
	uint16_t	LaisSendTrNoTm;
	uint16_t	LaisSendStsTm;
	uint16_t	LaisTm;
	uint16_t	LaisDelay_AfterLastT_R;
	
	uint16_t	NoCodeTime;
	uint16_t	SameLedTime;
	uint16_t	JYJTime;
	
	///analog file params:
	uint8_t		rsvd7;
	uint8_t		RecordIndex;	///Analog file : ping-pang
	uint8_t		RecordMethod;	///0--Normal; 1--Continous
	uint8_t		RecordStart;	///
	uint8_t		AnaFileValid[2];
	uint32_t	AnaFileTime[2];
	uint32_t	AnaSampleStartIndex[2];///
	uint32_t	AnaFileSampleCnt;
	uint32_t	AnaFile2Time;
	uint32_t	AnaFile2StartIndex;
	///Sample params:
	uint32_t	SampleIndex;
	uint32_t	AnaFileContinousIndex;
		
	///when USB device attached, read SD sectors to Buf to transfer to USB
	uint8_t		USB_Status;
	uint8_t		USB_IsAnaFile;
	uint8_t		SdPingPang;
	uint8_t		USB_UsbPingPang;
	uint8_t		USB_SdBufSts[2];
	uint8_t		USB_SdBufSecCnt[2];
	uint32_t	USB_SdStartSec;
	uint32_t	USB_SdTotSecCnt;
	uint32_t	USB_RemainXferSecCnt;
	uint32_t	USB_SdMaxSecNo;
	uint32_t	USB_SdMinSecNo;
	uint32_t	USB_RemainXferAnaFileCnt;
	uint32_t	USB_AnaFileSecCnt;
	
	uint16_t	AdcOffset[2];
	float 		AdcRatio[2];
	
#elif defined JLB_CPU_SAMPLE
	uint16_t	AdcOffset[26];
	float		AdcRatio[26];

#elif defined LJB_CPU_MAIN
	uint16_t	AdcOffset[5];
	float		AdcRatio[5];
    uint8_t 	AnalogChCnt;
	uint32_t    NowTime[2]; ///系统时间: 10ms 计数
    uint8_t     D110V;  //volatile


	uint8_t     WriteErr;	///写信息状态
	uint8_t     WriteFlag;	///需要写信息

#endif
}APP_INFO, *pAPP_INFO;

typedef struct{
    uint8_t SysTime[4];//Coded date_time 0~3
    uint8_t TimeOrder; //
    uint8_t Dist[3];   //
    //uint8_t Led;       //
    uint8_t D110V[10];
    //uint8_t ID110V;
    //uint8_t IID110V;
    //uint8_t CSID;
    //uint8_t CSIID; 
	uint8_t rsvd[12]; 
    uint8_t Crc[2]; 
}LJBPOS_INFO, *pLJBPOS_INFO;

typedef struct{
  uint8_t Flag[4];
  uint8_t NextIndex;//下一个存储位置序号: 从1开始（0用来保存记录参数）
  uint8_t TotNewRec;//从上一次传送后增加了多少条记录
  uint16_t Crc;
  
  uint8_t Bk_Flag[4];
  uint8_t Bk_NextIndex;
  uint8_t Bk_TotNewRec;
  uint16_t Bk_Crc;
}REC_INFO, *pREC_INFO;

extern APP_INFO AppInfo;
extern REC_INFO RecInfo;
//extern LJBPOS_INFO LJBPosInfo[2];
extern LJBPOS_INFO LJBPosInfo;


extern __IO  uint8_t PowF;
extern __IO  uint8_t PosIndex;

extern uint8_t CalibrationInfo[CHANNEL_COUNT_LIMIT][PARAMETER_BYTE_COUNT];


extern __IO uint8_t  D110VADBuf[5][10];
extern      uint8_t  D110VCnt[10];
extern      uint8_t  g_I2C_RdyF;
extern __IO uint8_t  g_changed;
extern      uint8_t  g_UsartRWPowOffComplete;

/////////////////////////////////////////////////////////////////
///			状态量宏定义及结构
/////////////////////////////////////////////////////////////////
#define STATUS_BITS						8
#define STATUS_DATA_COUNT				((uint16_t)1<<STATUS_BITS)
#define STATUS_CNT_PER_SECTOR			(512/STATUS_DATA_COUNT)


#define STATUS_RECORD_TYPE_NORMAL		0
#define STATUS_RECORD_TYPE_POWER_ON		1
#define STATUS_RECORD_TYPE_USB_START	2
#define STATUS_RECORD_TYPE_USB_END		3
#define STATUS_RECORD_TYPE_CALIBRATE	4

typedef struct{
	
	uint8_t		ID[4];
	uint8_t		Time[4];
	uint8_t 	OrderOf1Sec;
	uint8_t		RecType;
	uint8_t		BdDataValid;
	///50V 采样值: 27
	uint8_t 	SX;
	uint8_t 	XX;
	uint8_t 	JE;
	uint8_t 	JY;
	uint8_t 	ZS;
	uint8_t 	SD1;
	uint8_t 	SD2;
	uint8_t 	SD3;
	uint8_t 	AWK;
	uint8_t 	BWK;
	uint8_t 	SXBS;
	uint8_t 	XXBS;
	uint8_t 	L;
	uint8_t 	LU;
	uint8_t 	U;
	uint8_t 	U2;
	uint8_t 	HU;
	uint8_t 	UU;
	uint8_t 	H;
	uint8_t 	B;
	uint8_t 	CSAGA;
	uint8_t 	CSBGA;
	uint8_t 	CSKEY;
	uint8_t 	V50;
	uint8_t 	A50;
	uint8_t 	B50;
	uint8_t 	Temperature;
		
	///Oher board info:
	uint8_t 	CtrlABuf[64];
	uint8_t 	CtrlBBuf[64];
	///连接板采集的 110V
	uint8_t 	V110[10];
	uint8_t 	V110_I[2];
	uint8_t 	V110_II[2];	
	
	///Tax 39 frame: 36bytes
	uint8_t 	TaxTime[4];
	uint8_t 	T39_Spd[3];
	uint8_t 	T39_Led;
	uint8_t 	T39_TrSts;
	uint8_t 	T39_SigNo[2];
	uint8_t 	T39_SigType;
	uint8_t 	T39_Dist[3];
	uint8_t 	T39_GrossWt[2];
	uint8_t 	T39_Len[2];
	uint8_t 	T39_Cnt;
	uint8_t 	T39_BenBu;
	uint8_t 	T39_TrNo[2];
	uint8_t 	T39_JiaoLu;
	uint8_t 	T39_StNo;
	uint8_t 	T39_DriverNo[2];
	uint8_t 	T39_ViceDriverNo[2];
	uint8_t 	T39_LocomotiveNo[2];
	uint8_t 	T39_LocomotiveType;
	uint8_t 	T39_Pressure[2];
	uint8_t 	T39_UintSts;
	uint8_t 	T39_rsvd;
	
	///Tax 38 frame: 26bytes
	uint8_t 	T38_exStNo;
	uint8_t 	T38_exTrTypeID[4];
	uint8_t		T38_exDriverNo;
	uint8_t		T38_exViceDriverNo;
	uint8_t		T38_rsvd2[2];
	uint8_t		T38_exTrModel;
	uint8_t		T38_exJiaoLu;
	uint8_t		T38_rsvd3[11];
	uint8_t		T38_exBenBu;
	uint8_t		T38_exTrNo[3];
		
	uint32_t	TimeBeforeCalibrate;
	
	uint8_t 	rsvd[8];
	
	uint16_t	crc;
	
	///////////////////////////////////////////////////
	///					非记录内容
	///////////////////////////////////////////////////
	///此标志为添加量，标志是否需要启动记录模拟量
	uint8_t 	Changed;
	uint8_t 	Led;
	uint16_t 	Hx;
	uint8_t		CoilIndex;
	uint8_t		Sd;
	uint8_t		JYJ;
	uint8_t		rsvd2;
	
}STS_FRAME, *pSTS_FRAME;

typedef struct{
    uint8_t   SysTime[4];//时间编码
    uint8_t   Dist[3];	 //里程
	uint8_t   D110V;
	uint8_t   ID110V;
	uint8_t   IID110V;
	uint8_t   CSID;
	uint8_t   CSIID;

	uint8_t   PowOffFlag;  
 //   uint16_t  PowOffTm;

}USER_INF,  *pUSER_INF;

extern USER_INF   UserInf;   // 用户 信息 

extern volatile uint8_t XferRecIndex;

#define 	STS_BUF_SIZE		(1 << 6)
#define 	STS_BUF_MASK		(STS_BUF_SIZE - 1)

extern STS_FRAME 	StsFrame[STS_BUF_SIZE];

#if defined JLB_CPU_MAIN
#define 		LAIS_STS_INDEX_SIZE		8
#define 		LAIS_STS_INDEX_MASK		(LAIS_STS_INDEX_SIZE - 1)
extern uint32_t LaisStsIndexBuf[LAIS_STS_INDEX_SIZE];
#endif


#if defined JLB_CPU_SAMPLE

#define		TAX38_FRAME_LEN			32
#define 	TAX39_FRAME_LEN			40
extern uint8_t Tax38_Buf[TAX38_FRAME_LEN];
extern uint8_t Tax39_Buf[TAX39_FRAME_LEN];

extern uint8_t	BdWorkBuf[BOARD_COUNT][BOARD_MAX_DATA_COUNT];

#endif





extern uint8_t ParamBuf[256];


#if APP_SD_ENABLE
extern OS_EVENT *Sem_SD;
#if defined JLB_CPU_MAIN
extern OS_EVENT	*Sem_WriteSD;
#endif
#endif

#if defined JLB_CPU_SAMPLE
extern OS_EVENT	*Sem_RtcAlarm;
#endif
	
///////////////////////////////////////////////////////////////////////////////////////
///									Function ptototypes
///////////////////////////////////////////////////////////////////////////////////////

void App_WaitForReset(void);

void App_InitInfo(void);

void SetAppParams(void);

void SetChParams(void);

void App_Usart_WriteInfo(void);

///Test only
void TestWriteInfo(void);

#if defined LJB_CPU_MAIN

void CheckRecInfo(void);

#if 0
void EncodeTime(unsigned char *Dest, unsigned char *Src);

void IncTime(unsigned char *TimeBuf);

void DecodeTime(unsigned char *Dest, unsigned char *Src);

void SetStsData(unsigned char Type);
#endif

//void SavePowOffData(unsigned char Index);
void SavePowOffData(void);

void PowOffHandler(void);

#endif


#if defined JLB_CPU_MAIN
extern void TestSram(void);
#endif

///////////////////////////////////////////////////////////////////////////////////////
///									Global variables
///////////////////////////////////////////////////////////////////////////////////////



#endif///EOF

