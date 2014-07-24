/*
	FileName : F205_USART.c
	Description :
	Created on 2013.01.21 by ZZP.

	Revision History:

*/


/* Includes ------------------------------------------------------------------*/
#include "stm32f2xx.h"
#include "stm322xg_eval.h"
#include "F205_Gpio.h"
#include "HexFile.h"
#include "F205_Flash.h"
#include <stdio.h>
#include <string.h>
#include "F205_USART.h"

///收到串口命令后BIOS时间延长
#define BIOS_DELAY_TIME		10000




const uint16_t CRCTable[] = 
      {
        0x0000,0x1021,0x2042,0x3063,0x4084,0x50A5,0x60C6,0x70E7,0x8108,0x9129,0xA14A,0xB16B,0xC18C,0xD1AD,0xE1CE,0xF1EF,
        0x1231,0x0210,0x3273,0x2252,0x52B5,0x4294,0x72F7,0x62D6,0x9339,0x8318,0xB37B,0xA35A,0xD3BD,0xC39C,0xF3FF,0xE3DE,
        0x2462,0x3443,0x0420,0x1401,0x64E6,0x74C7,0x44A4,0x5485,0xA56A,0xB54B,0x8528,0x9509,0xE5EE,0xF5CF,0xC5AC,0xD58D,
        0x3653,0x2672,0x1611,0x0630,0x76D7,0x66F6,0x5695,0x46B4,0xB75B,0xA77A,0x9719,0x8738,0xF7DF,0xE7FE,0xD79D,0xC7BC,
        0x48C4,0x58E5,0x6886,0x78A7,0x0840,0x1861,0x2802,0x3823,0xC9CC,0xD9ED,0xE98E,0xF9AF,0x8948,0x9969,0xA90A,0xB92B,
        0x5AF5,0x4AD4,0x7AB7,0x6A96,0x1A71,0x0A50,0x3A33,0x2A12,0xDBFD,0xCBDC,0xFBBF,0xEB9E,0x9B79,0x8B58,0xBB3B,0xAB1A,
        0x6CA6,0x7C87,0x4CE4,0x5CC5,0x2C22,0x3C03,0x0C60,0x1C41,0xEDAE,0xFD8F,0xCDEC,0xDDCD,0xAD2A,0xBD0B,0x8D68,0x9D49,
        0x7E97,0x6EB6,0x5ED5,0x4EF4,0x3E13,0x2E32,0x1E51,0x0E70,0xFF9F,0xEFBE,0xDFDD,0xCFFC,0xBF1B,0xAF3A,0x9F59,0x8F78,
        0x9188,0x81A9,0xB1CA,0xA1EB,0xD10C,0xC12D,0xF14E,0xE16F,0x1080,0x00A1,0x30C2,0x20E3,0x5004,0x4025,0x7046,0x6067,
        0x83B9,0x9398,0xA3FB,0xB3DA,0xC33D,0xD31C,0xE37F,0xF35E,0x02B1,0x1290,0x22F3,0x32D2,0x4235,0x5214,0x6277,0x7256,
        0xB5EA,0xA5CB,0x95A8,0x8589,0xF56E,0xE54F,0xD52C,0xC50D,0x34E2,0x24C3,0x14A0,0x0481,0x7466,0x6447,0x5424,0x4405,
        0xA7DB,0xB7FA,0x8799,0x97B8,0xE75F,0xF77E,0xC71D,0xD73C,0x26D3,0x36F2,0x0691,0x16B0,0x6657,0x7676,0x4615,0x5634,
        0xD94C,0xC96D,0xF90E,0xE92F,0x99C8,0x89E9,0xB98A,0xA9AB,0x5844,0x4865,0x7806,0x6827,0x18C0,0x08E1,0x3882,0x28A3,
        0xCB7D,0xDB5C,0xEB3F,0xFB1E,0x8BF9,0x9BD8,0xABBB,0xBB9A,0x4A75,0x5A54,0x6A37,0x7A16,0x0AF1,0x1AD0,0x2AB3,0x3A92,
        0xFD2E,0xED0F,0xDD6C,0xCD4D,0xBDAA,0xAD8B,0x9DE8,0x8DC9,0x7C26,0x6C07,0x5C64,0x4C45,0x3CA2,0x2C83,0x1CE0,0x0CC1,
        0xEF1F,0xFF3E,0xCF5D,0xDF7C,0xAF9B,0xBFBA,0x8FD9,0x9FF8,0x6E17,0x7E36,0x4E55,0x5E74,0x2E93,0x3EB2,0x0ED1,0x1EF0
      };



/* Private variables ---------------------------------------------------------*/
USART_InitTypeDef USART_InitStructure;

USART_BufDef USART_BufStruct;


uint8_t USART_RxBuf[USART_RX_BUF_SIZE >> 1];
uint8_t USART_TxBuf[USART_TX_BUF_SIZE];


uint8_t USART_tmpRxBuf[USART_RX_BUF_SIZE];


uint16_t TxHandleIndex = 0;
uint16_t RxHandleIndex = 0;

__IO uint16_t RxLen = 0;
__IO uint8_t StartF = 0;
__IO uint8_t DLE = 0;
__IO uint16_t CalcCheck = 0;
uint8_t CheckUp[4];
__IO uint8_t CheckUpIndex = 0;



DATA_STRUCT _Info;


HEX_FILE HexInfo;

  
__inline void _InitRx(uint8_t start);
uint8_t _CheckRxFrame(void);
__inline void _SetRxData(uint8_t Data);
void _RxDataHandler(void);
void _ErrHandler(uint8_t Err);
void _CpyRxData(void);
uint8_t _CheckFirmData(void);
uint8_t _CheckProtectData(void);
void _SetUpgradeErr(uint8_t err);
void _AckRdyToUpgrade(uint8_t err);
      
      
      
uint16_t Calc_CRCByte(uint8_t *Buf, uint32_t Len)
{
  uint16_t crc = 0,value;
  
  do 
  {
    value = *Buf++;
    crc = ((crc << 8) ^ CRCTable[((crc >> 8) ^ value) & 0xFF]);
  }while (--Len);
  
  return (crc);
}

uint16_t Calc_CRCByte_Continue(uint8_t *Buf, uint16_t Len, uint16_t last_crc)
{
	uint16_t crc = last_crc, value;
  
	do 
	{
		value = *Buf++;
		crc = ((crc << 8) ^ CRCTable[((crc >> 8) ^ value) & 0xFF]);
	}while (--Len);
  
	return (crc);
}

/**
  * @brief  Main program
  * @param  None
  * @retval None
  */
void F205_InitUSART(void)
{
	memset(&_Info, 0, sizeof(_Info));
	HexInfo.type = 0xff;


	USART_InitStructure.USART_BaudRate = USART_BAUD_RATE;
	USART_InitStructure.USART_WordLength = USART_WordLength_8b;
	USART_InitStructure.USART_StopBits = USART_StopBits_1;
	USART_InitStructure.USART_Parity = USART_Parity_No;
	USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;

	USART_BufStruct.TxBuf = (uint8_t *)&(USART_TxBuf[0]);
	USART_BufStruct.RxBuf = (uint8_t *)&(USART_RxBuf[0]);
	
	STM_EVAL_COMInit(COM1, &USART_InitStructure, &USART_BufStruct);
	//STM_EVAL_COMInit(COM2, &USART_InitStructure, &USART_BufStruct);
}

void F205_DisableUSART(void)
{
	F205_DisablePeripherals(COM1);
}

void F205_DisableUSART1(void)
{
	F205_DisablePeripherals(COM2);
}

///返回值：
///0--无错误
///1--类型不匹配
///3--数据错误
///4--CRC错误
///5--解除写保护错误
///6--擦除错误
///7--编程错误
///8--EOF
uint8_t F205_RxDataHandler(void)
{
	__IO uint8_t err = 0, res, val, ret, OK;
	uint8_t *p;
	__IO uint32_t addr, data;

	ret = 0;
	if (MyInfo.AckFlag != ACK_FLAG_NONE){

		if (MyInfo.AckFlag == ACK_FLAG_ERASE_APP_SECTORS){

			err = F205_WriteProtection(APP_FLASH_SECTORS, 0);
			if (err){///解除写保护错误

				_SetUpgradeErr(ACK_FLAG_PROTECT_ERR);
				ret = ACK_FLAG_PROTECT_ERR;
			}
			else{

				///Erase all app flash area for firm data: 
				err = F205_EraseSectors(APPLICATION_START_SECTOR, APPLICATION_END_SECTOR);
				if (err){///擦除错误

					_SetUpgradeErr(ACK_FLAG_ERASE_ERR);
					ret = ACK_FLAG_ERASE_ERR;
				}
				else{
					
					InitHexVar(&HexInfo);
					MyInfo.WorkSts = WORK_STATUS_UPGRADE;
					_AckRdyToUpgrade(0);
				}
			}
		}
		if (MyInfo.AckFlag == ACK_FLAG_UPGRADE_OK){
			
			if (!err){

				///check firm data address:
				p = &USART_RxBuf[2];
				OK = 1;
				while (_Info.remain && OK){

					res = GetDataFromHexFile(&HexInfo, p, _Info.remain);
					val = res & HEX_MASK;
					switch (val){

						case HEX_ERR_DATA:///Error
							_SetUpgradeErr(ACK_FLAG_DATA_ERR);
							ret = ACK_FLAG_DATA_ERR;
							OK = 0;
							break;
						case HEX_ERR_NONE:
							_Info.remain -= (res & 0x3f);
							p += (res & 0x3f);
							break;
						case HEX_VALID_DATA:///valid data to be written to flash
							///write to flash: Usart_RxBuf[3]开始
							addr = HexInfo.seg_addr + HexInfo.addr;
							if ((addr < APPLICATION_ADDRESS) || (addr > USER_FLASH_END_ADDRESS)){
							
								_SetUpgradeErr(ACK_FLAG_DATA_ERR);
								ret = ACK_FLAG_DATA_ERR;
								OK = 0;
							}
							else{

								data = HexInfo.data[0] + ((uint16_t)HexInfo.data[1] << 8) + ((uint32_t)HexInfo.data[2] << 16) + ((uint32_t)HexInfo.data[3] << 24);
								if (F205_ProgramFlash(addr, data)){///Error

									_SetUpgradeErr(ACK_FLAG_PROGRAM_FAIL);
									ret = ACK_FLAG_PROGRAM_FAIL;
									OK = 0;
								}
								else{

									p += (res & 0x3f);
									_Info.remain -= (res & 0x3f);
									HexInfo.addr += 4;
								}
							}
							break;
						case HEX_ERR_EOF:///EOF
							_SetUpgradeErr(ACK_FLAG_UPGRADE_OK);
							ret = ACK_FLAG_EOF;
							OK = 0;
						default:
							OK = 0;
							break;
					}
				}
			}
		}

		/// ack :
		F205_PrepareTxData(_Info.type, _Info.cmd, _Info.dst, _Info.src, _Info.ack_len, &(_Info.ack_data[0]));
		/// 定时时间清0：
		MyInfo.SysTm = 0;
		///清除发送标志：
		MyInfo.AckFlag = ACK_FLAG_NONE;
	}

	return ret;
}


void F205_PrepareTxData(uint8_t type, uint8_t cmd, uint8_t src, uint8_t dst, uint16_t len, uint8_t *data)
{
	uint16_t i, j, crc;
	uint8_t buf[8], *p;
//	uint32_t status;

	///采用 DMA 发送数据：
	///等待前次 DMA 完成：两种方法
	//while (DMA_GetCmdStatus(DMA2_Stream7) != DISABLE){}
	while (!MyInfo.TxRdy){}
	//允许 TX：最少应等待100us 
	F205_EnableUsartTx();

	p = &USART_TxBuf[0];
	buf[0] = (len + 8) >> 8;
	buf[1] = (len + 8) & 0xff;
	buf[2] = src;
	buf[3] = 0;
	buf[4] = dst;
	buf[5] = 0;
	buf[6] = type;
	buf[7] = cmd;
	crc = Calc_CRCByte(buf, 8);
	crc = Calc_CRCByte_Continue(data, len, crc);
	p[0] = 0x10;
	p[1] = 0x02;
	j = 2;
	for (i = 0; i < 8; i++){

		p[j] = buf[i];
		if (p[j] == 0x10){

			j++;
			p[j] = 0x10;
		}
		j++;
	}

	for (i = 0; i < len; i++){

		p[j] = data[i];
		if (p[j] == 0x10){

			j++;
			p[j] = 0x10;
		}
		j++;
	}

	p[j] = crc >> 8;
	if (p[j] == 0x10){
		
		j++;
		p[j] = 0x10;
	}
	j++;
	p[j] = crc & 0xff;
	if (p[j] == 0x10){
		
		j++;
		p[j] = 0x10;
	}
	j++;
	p[j++] = 0x10;
	p[j++] = 0x03;

	if (MyInfo.TxFlag < 2)
		MyInfo.TxFlag++;

	///等待100us
	Delay(2000);	

#if (USART_TX_USE_DMA)	
	///设置 DMA 长度并启动 DMA 发送
	DMA_SetCurrDataCounter(DMA_Stream, j);
	/* DMA2_Stream7 enable */
  	DMA_Cmd(DMA_Stream, ENABLE);
#else
	for (i = 0; i < j; i++){

		MyInfo.TxRdy = 0;
		USART_SendData(COM_USART[COM1], p[i]);  //原来为 COM2
		while (!MyInfo.TxRdy){}
	}
	///关闭发送控制
	F205_DisableUsartTx();	
#endif	
}



void F205_UsartRxData(void)
{
	uint8_t ch, err;
	uint16_t Index;

	Index = USART_RxIndex;
	while (RxHandleIndex != Index ){

  		ch = USART_tmpRxBuf[RxHandleIndex++];
		RxHandleIndex &= USART_RX_BUF_MASK;

		if (StartF){

			if (ch == 0x10){

				if (!DLE)
					DLE = 0x10;
				else{

					_SetRxData(ch);
					DLE = 0;
				}
			}
			else if (DLE == 0x10){

				switch (ch){

					case 0x02:
						_InitRx(1);
						break;

					case 0x03:
						//接收完整帧
						err = _CheckRxFrame();
						if (!err){

							if (MyInfo.RxFlag < 2)
								MyInfo.RxFlag++;
							_RxDataHandler();
						}
						else
							_ErrHandler(err);

						_InitRx(0);
						break;
					default:
						_SetRxData(ch);
						break;
				}
					
				DLE = 0;
			}
			else
				_SetRxData(ch);
		}
		else{
			if (ch == 0x10)
				DLE = 0x10;
			else{
				if ((ch == 0x02) && (DLE == 0x10))
					_InitRx(1);
				else
					DLE = 0;
			}
		}
	}
}






////////////////////////////////////////////////////////////////////////////////////////
///								Local function realizations
////////////////////////////////////////////////////////////////////////////////////////
//收到的数据处理：从DataLen域开始存储数据
__inline void _SetRxData(unsigned char Data)
{
	switch (RxLen){

		case 0:
			_Info.len = (uint16_t)Data << 8;
			break;
		case 1:
			_Info.len += Data;
			
			//Modifiled by me 20140507 referenced to zg
			//if ((_Info.len > (USART_RX_BUF_SIZE >> 1) + 8) || (_Info.len < 8))
			if ((_Info.len > (USART_RX_BUF_SIZE >> 1) + 32) || (_Info.len < 8))
			{
				_InitRx(0);
				return;
			}
			break;
		case 2:	///源地址：
			_Info.src = Data;
			break;
		case 3:///src addr len			
			if (Data != 0){
				_InitRx(0);
				return;
			}
			_Info.src_len = Data;
			break;
		case 4:	///目的地址：必须是本板地址或广播地址
			if ((Data != MyInfo.BdAddr) && (Data != 0xff)){
				_InitRx(0);
				return;
			}
			_Info.dst = MyInfo.BdAddr;
			break;
		case 5:///Dst len
			if (Data != 0){
				_InitRx(0);
				return;
			}
			_Info.dst_len = Data;
			break;
		case 6:///type
			_Info.type = Data;
			break;
		case 7:
			_Info.cmd = Data;
			break;
		default://赋值
			USART_RxBuf[RxLen - 8] = Data;
			break;
	}

	RxLen++;

	if ((_Info.len > 0) && (RxLen > _Info.len + 2))//数据太多，帧还未结束：丢弃
		_InitRx(0);
}

uint8_t _CheckRxFrame(void)
{
	uint16_t crc, tmp, len;
	uint8_t  *p;
	
	if (RxLen != _Info.len + 2)
		return 3;
	len = _Info.len;
	_Info.len = (len >> 8) + (len << 8);
	p = (uint8_t *)&(_Info.len);
	crc = Calc_CRCByte(p, 8);
	p = USART_RxBuf;
	crc = Calc_CRCByte_Continue(p, len - 8, crc);
	tmp = ((uint16_t)USART_RxBuf[len - 8] << 8) + USART_RxBuf[len - 8 + 1];
	if (crc != tmp)
		return 4;
	_Info.len = len;
	return 0;
}


__inline void _InitRx(uint8_t start)
{
	DLE = 0;
	RxLen = 0;
	_Info.len = 0;
	CalcCheck = 0;
	CheckUpIndex = 0;
	StartF = 0;

	if (start)
		StartF = 1;
}

void _RxDataHandler(void)
{
	uint8_t err, i;

	switch (_Info.cmd){

		case CMD_UPGRADE_FIRMWARE:
			
			if ((USART_RxBuf[3] & 0x7f) != MyInfo.FirmType){
	
				MyInfo.AckFlag = ACK_FLAG_TYPE_MISMATCH;
				_AckRdyToUpgrade(MyInfo.AckFlag);
				return;
			}
			MyInfo.AckFlag = ACK_FLAG_ERASE_APP_SECTORS;
			///MyInfo.DlyTm = BIOS_DELAY_TIME + BIOS_DELAY_TIME;
			break;
		
		case CMD_UPGRADE_DATA_FRAME:
			err = _CheckFirmData();	
			_SetUpgradeErr(MyInfo.AckFlag);
			break;

		case CMD_INQUIRY_UPGRADE_STATUS: 
			///升级后的应用程序应答查询命令，BIOS 不能应答
			break;


//Deleted 20140430 BIOS下不应答版本查询
#if 0
		case CMD_INQUIRY_VERSION:
			///BIOS 应答
			_Info.type = CMD_TYPE_FIRMWARE;
			_Info.cmd = CMD_ACK_VERSION;
			_Info.ack_len = 14;

			_Info.ack_data[0] = FIRM_BIOS;
			for (i = 0; i < 6; i++)
				_Info.ack_data[1 + i] = ParamBuf[4 + i];
#if 0
			_Info.ack_data[0] = FIRM_BIOS;
			_Info.ack_data[1] = F205_BIOS_MAIN_VER;
			_Info.ack_data[2] = F205_BIOS_SUB_VER;
			_Info.ack_data[3] = 0x20;
			_Info.ack_data[4] = F205_BIOS_YEAR;
			_Info.ack_data[5] = F205_BIOS_MONTH;
			_Info.ack_data[6] = F205_BIOS_DATE;
#endif		
			///APPLICATION:
			_Info.ack_data[7] = FIRM_APPLICATION;
			for (i = 0; i < 6; i++)
				_Info.ack_data[8 + i] = ParamBuf[20 + i];
			MyInfo.AckFlag = ACK_FLAG_NORMAL;
			///MyInfo.DlyTm = BIOS_DELAY_TIME;
			break;
#endif

		case CMD_RESET:

		        *(__IO uint32_t*)UPGRADE_FLAG_ADDRESS = UPGRADE_FLAG_DATA;

#if 1
			///不应答，直接复位
			///写保护：
			F205_WriteProtection(APP_FLASH_SECTORS, ENABLE);
			///不允许写/擦除 FLASH:
			FLASH_Lock();
#endif

			///关闭打狗程序：
			SysTick->CTRL  = 0; /// Disable SysTick IRQ and SysTick Time
			while (1)
			{

			}
			//break;

		case CMD_WRITE_INFO:
			///不应答
			break;

		case CMD_READ_INFO:
			///不应答
			break;

		case CMD_WRITE_PROTECTION:///写保护

			err = _CheckProtectData();
			if (err & 0x0f){
				
				_Info.type = CMD_TYPE_DEBUG;
				_Info.cmd = CMD_ACK_WRITE_PROTECTION;
				_Info.ack_len = 1;
				_Info.ack_data[0] = err;
				MyInfo.AckFlag = ACK_FLAG_WRONG_CMD;
			}
			else{

				err = F205_WriteProtection(USART_RxBuf[1], (err>>4));
				
				_Info.type = CMD_TYPE_DEBUG;
				_Info.cmd = CMD_ACK_WRITE_PROTECTION;
				_Info.ack_len = 1;
				_Info.ack_data[0] = err;
				MyInfo.AckFlag = ACK_FLAG_NORMAL;
			}
			///MyInfo.DlyTm = BIOS_DELAY_TIME;

			break;

		default:
			break;
	}
}

///帧错误：暂不处理
void _ErrHandler(uint8_t Err)
{
	
}



uint8_t _CheckFirmData(void)
{
	uint16_t Index;///, crc, len;
	
	/*if ((USART_RxBuf[2] & 0x7f) != MyInfo.FirmType){
	
		MyInfo.AckFlag = ACK_FLAG_TYPE_MISMATCH;
		return 1;
	}*/
	/*	
	len = _Info.len - 5;
	crc = Calc_CRCByte(USART_RxBuf, len - 2);
	if (crc != (USART_RxBuf[len - 2] + ((uint16_t)USART_RxBuf[len - 1] << 8))){

		MyInfo.AckFlag = ACK_FLAG_CRC_ERR;
		return 1;
	}	
*/
	Index = USART_RxBuf[0] + ((uint16_t)USART_RxBuf[1] << 8);

	/*if ((Index & 0x7fff) == 0){

		MyInfo.WorkSts = WORK_STATUS_UPGRADE;
	}
	else*/{

		if (MyInfo.WorkSts != WORK_STATUS_UPGRADE){

			MyInfo.AckFlag = ACK_FLAG_DATA_ERR;
			return 1;
		}
	}

	
	///_Info.remain = len - 7;
	_Info.remain = _Info.len - 10;

	MyInfo.FirmFrameIndex = Index;
	MyInfo.AckFlag = ACK_FLAG_UPGRADE_OK;
	return 0;
}

uint8_t _CheckProtectData(void)
{
	uint32_t *p;
	uint8_t en;

	if (_Info.len != 15)  // 原来为12 + 2 modifiled by me 
		return 1;

	if (_Info.src != 0x80)
		return 2;
	
	if ((USART_RxBuf[0] != 0xAA) && (USART_RxBuf[0] != 0x55))
		return 3;

	if (USART_RxBuf[6] != USART_RxBuf[0])
		return 4;
	
#if defined USE_CPU_F205RC		
	if (USART_RxBuf[1] > 0x3f)
		return 5;
#endif
	
	p = (uint32_t*)&(USART_RxBuf[2]);
	if (USART_RxBuf[0] == 0xaa){///写保护
	
		if (*p != WRITE_PROTECTION_ENABLE_ID)
			return 6;
		en = 0x10;
	}
	else if (USART_RxBuf[0] == 0x55){

		if (*p != WRITE_PROTECTION_DISABLE_ID)
			return 7;
		en = 0x00;
	}

	return en;
}


void _SetUpgradeErr(uint8_t err)
{
	_Info.cmd = CMD_ACK_UPGRADE_FIRMWARE;
	_Info.ack_len = 3;
	_Info.ack_data[0] = USART_RxBuf[0];
	_Info.ack_data[1] = USART_RxBuf[1];
	_Info.ack_data[2] = err;
}

void _AckRdyToUpgrade(uint8_t err)
{
	_Info.ack_len = 2;
	_Info.ack_data[0] = _Info.cmd;
	_Info.ack_data[1] = USART_RxBuf[0];
	
	_Info.cmd = CMD_ACK_MISC;
}




 



/******************* (C) COPYRIGHT 2013 SHENZHEN CHANGLONG RAILWAY ELECTRONICS CO, LTD *****END OF FILE****/
