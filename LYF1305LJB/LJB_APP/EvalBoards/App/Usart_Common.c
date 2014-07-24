/*
	FileName : Usart_Common.c
	Description : 
		采用 1002...1003 协议的串口数据处理公共协议。
		源地址长度、目的地址长度必须为 0.
	
	Created on 2013.10.22 by ZZP.
	
	Revision History:
	
*/

#include <string.h>
#include "app_cfg.h"
#include "bsp.h"
#include "Usart_Common.h"
#include "app.h"
#include "miscfnx.h"

#if APP_USART_1_ENABLE
#include "app_usart1.h"
#endif

#if APP_USART_2_ENABLE
#include "app_usart2.h"
#endif

#if APP_USART_3_ENABLE
#include "app_usart3.h"
#endif

#if APP_USART_4_ENABLE
#include "app_usart4.h"
#endif

#if APP_USART_5_ENABLE
#include "app_usart5.h"
#endif

#if APP_USART_6_ENABLE
#include "app_usart6.h"
#endif


////////////////////////////////////////////////////////////////////////
///				Local variables and function prototypes
////////////////////////////////////////////////////////////////////////
uint8_t __StartF[COMn];
uint8_t __DLE[COMn];
uint16_t __RxLen[COMn];

const uint32_t _USART_TIME_OUT[COMn] = {500, 500, 500, 500, 500, 500};

__inline void _InitRx(uint8_t COM, uint8_t start, DATA_STRUCT *Info);
uint8_t _CheckRxFrame(uint8_t COM, DATA_STRUCT *Info);
__inline void _SetRxData(uint8_t COM, uint8_t Data, DATA_STRUCT *Info);
void _RxDataHandler(uint8_t COM, DATA_STRUCT *Info);
void _ErrHandler(uint8_t COM, uint8_t Err, DATA_STRUCT *Info);

uint16_t _PrepareTxData(uint8_t COM, DATA_STRUCT *Info);


////////////////////////////////////////////////////////////////////////
///				Global function realizations
////////////////////////////////////////////////////////////////////////
void Usart_InitInfo(void)
{
	uint8_t i;
	
	for (i = 0; i < COMn; i++){
		
		__StartF[i] = 0;
		__DLE[i] = 0;
		__RxLen[i] = 0;
	}
}

uint8_t Usart_RxDataHandler(uint8_t COM, DATA_STRUCT *Info)
{
	uint16_t Index1, Index2;
	uint8_t ch, err, *p;

	Index1 = BSP_Info.UsartRxIndex[COM];
	Index2 = AppInfo.UsartRxHandleIndex[COM];

	if (Index1 == Index2)
		return 0;
	
	if (Info->data == NULL)
		return 2;
	
	p = BSP_Info.UsartRxBuf[COM];
	
	while (Index1 != Index2){

  		AppInfo.UsartNoDataCnt[COM] = 0;

		ch = p[Index2++];
		Index2 &= BSP_Info.UsartRxBufMask[COM];

		if (__StartF[COM]){

			if (ch == 0x10){

				if (!__DLE[COM])
					__DLE[COM] = 0x10;
				else{

					_SetRxData(COM, ch, Info);
					__DLE[COM] = 0;
				}
			}
			else if (__DLE[COM] == 0x10){

				switch (ch){

					case 0x02:
						_InitRx(COM, 1, Info);
						break;

					case 0x03:
						//接收完整帧
						err = _CheckRxFrame(COM, Info);
						if (!err){

							if (AppInfo.UsartRxFlag[COM] < 2)
								AppInfo.UsartRxFlag[COM]++;
							///处理数据帧
							(*Usart_RxFrameHandler[COM])(Info);
							_InitRx(COM, 0, Info);
							goto _Final_Handle;
						}
						else
							_ErrHandler(COM, err, Info);

						_InitRx(COM, 0, Info);
						break;
					default:
						_SetRxData(COM, ch, Info);
						break;
				}
					
				__DLE[COM] = 0;
			}
			else
				_SetRxData(COM, ch, Info);
		}
		else{
			if (ch == 0x10)
				__DLE[COM] = 0x10;
			else{
				if ((ch == 0x02) && (__DLE[COM] == 0x10))
					_InitRx(COM, 1, Info);
				else
					__DLE[COM] = 0;
			}
		}
	}

_Final_Handle:	
	AppInfo.UsartRxHandleIndex[COM] = Index2;
	
	return 0;
}


uint8_t Usart_TxDataHandler(uint8_t COM, DATA_STRUCT *Info)
{
	uint16_t DataLen;
	uint8_t err;
	
	OSSemPend(Sem_UsartTxRdy[COM], _USART_TIME_OUT[COM], &err);

	///错误发生：
	if (err)
		return 1;
	
	if (Info->data == NULL)
		return 2;

	///允许发送：为减少等待时间，提前允许
	BSP_EnableUsartTx((COM_TypeDef)COM, ENABLE);

	///Added by zhanggong 20140324
	OSTimeDly(2);

	if (AppInfo.UsartTxFlag[COM] < 2)
	{
		AppInfo.UsartTxFlag[COM]++;
	}

	DataLen = _PrepareTxData(COM, Info);

	///Enable USART Tx DMA:
	BSP_USART_TxData((COM_TypeDef)COM, DataLen);
	
	return 0;
}


////////////////////////////////////////////////////////////////////////////////////
///							Local function realizations
////////////////////////////////////////////////////////////////////////////////////
//收到的数据处理：从DataLen域开始存储数据
__inline void _SetRxData(uint8_t COM, uint8_t Data, DATA_STRUCT *Info)
{
	uint16_t len;

	switch (__RxLen[COM]){

		case 0:
			Info->len[0] = Data;
			break;
		case 1:
			Info->len[1] = Data;
			len = Info->len[1] + ((uint16_t)Info->len[0] << 8);
			if ((len > BSP_Info.UsartRxBufMask[COM] + 1 + 6) || (len < 8)){

				_InitRx(COM, 0, Info);
				return;
			}
			break;
		case 2:	///源地址：
			
			Info->src = Data;
			break;
		case 3: ///源地址长度：
			if (Data != 0){

				_InitRx(COM, 0, Info);
				return;
			}
			Info->src_len = Data;
			break;
		case 4:	///目的地址：必须是本板地址
			if (Data != AppInfo.BdAddr){

				_InitRx(COM, 0, Info);
				return;
			}
			Info->dst = Data;
			break;
		case 5:///目的地址长度
			if (Data != 0){

				_InitRx(COM, 0, Info);
				return;
			}
			Info->dst_len = Data;
			break;
		case 6:///业务类型
			Info->type = Data;
			break;
		case 7:
			
			Info->cmd = Data;
			break;
		default://赋值
			Info->data[__RxLen[COM] - 8] = Data;
			break;
	}

	__RxLen[COM]++;
	if (__RxLen[COM] > BSP_Info.UsartRxBufMask[COM] + 1)
		_InitRx(COM, 0, Info);

	if (__RxLen[COM] > 1){

		if (__RxLen[COM] > Info->len[1] + ((uint16_t)Info->len[0] << 8) + 2)//数据太多，帧还未结束：丢弃
			_InitRx(COM, 0, Info);
	}
}

uint8_t _CheckRxFrame(uint8_t COM, DATA_STRUCT *Info)
{
	uint16_t crc, len;
	uint8_t *p;

	len = Info->len[1] + ((uint16_t)Info->len[0] << 8);
	if (__RxLen[COM] != len + 2)
		return 3;
	
	p = &(Info->len[0]);
	crc = Calc_CRCByte(p, 8);
	p = Info->data;
	crc = Calc_CRCByte_Continue(p, len - 8, crc);
	if ((p[len - 8] != (crc >> 8)) || (p[len - 8 + 1] != (crc & 0xff)))
		return 4;

	return 0;
}


__inline void _InitRx(uint8_t COM, uint8_t start, DATA_STRUCT *Info)
{
	__DLE[COM] = 0;
	__RxLen[COM] = 0;
	
	Info->len[0] = 0;
	Info->len[1] = 0;
	
	if (start)
		__StartF[COM] = 1;
	else
		__StartF[COM] = 0;
}


void _ErrHandler(uint8_t COM, uint8_t Err, DATA_STRUCT *Info)
{
	
}



uint16_t _PrepareTxData(uint8_t COM, DATA_STRUCT *Info)
{
	uint16_t i, j, crc, len;
	uint8_t *p, *p2;

	p = BSP_Info.UsartTxBuf[COM];
	
	p2 = (uint8_t *)&(Info->len[0]);
	len = Info->len[1] + ((uint16_t)Info->len[0] << 8);
	crc = Calc_CRCByte(p2, 8);
	p2 = Info->data;
	crc = Calc_CRCByte_Continue(p2, len - 8, crc);
	Info->data[len - 8] = crc >> 8;
	Info->data[len - 8 + 1] = crc & 0xff;

	p[0] = 0x10;
	p[1] = 0x02;
	j = 2;
	p2 = (uint8_t *)&(Info->len[0]);
	for (i = 0; i < 8; i++){

		p[j++] = p2[i];
		if (p2[i] == 0x10)
			p[j++] = 0x10;
	}
	p2 = Info->data;
	for (i = 0; i < len - 8 + 2; i++){

		p[j++] = p2[i];
		if (p2[i] == 0x10)
			p[j++] = 0x10;
	}

	p[j++] = 0x10;
	p[j++] = 0x03;

	return j;
}


void NULL_RxHandler(DATA_STRUCT *Info)
{
	///Nothing todo here
}



void (*Usart_RxFrameHandler[COMn])(DATA_STRUCT *Info) = {

#if (APP_USART_1_ENABLE)     //(APP_USART_1_ENABLE	&& (!defined USART_1_MULTI_COMMUNICATION))
	Usart1_RxFrameHandler,
#else
	NULL_RxHandler,
#endif
	
#if (APP_USART_2_ENABLE && (!defined USART_2_MULTI_COMMUNICATION))
	Usart2_RxFrameHandler,
#else
	NULL_RxHandler,
#endif
	
#if (APP_USART_3_ENABLE)    // (APP_USART_3_ENABLE	&& (!defined USART_3_MULTI_COMMUNICATION))
	Usart3_RxFrameHandler,
#else
	NULL_RxHandler,
#endif
	
#if (APP_USART_4_ENABLE	&& (!defined USART_4_MULTI_COMMUNICATION))
	Usart4_RxFrameHandler,
#else
	NULL_RxHandler,
#endif
	
#if (APP_USART_5_ENABLE	&& (!defined USART_5_MULTI_COMMUNICATION))
	Usart5_RxFrameHandler,
#else
	NULL_RxHandler,
#endif
	
#if (APP_USART_6_ENABLE) //(APP_USART_6_ENABLE	&& (!defined USART_6_MULTI_COMMUNICATION))
	Usart6_RxFrameHandler,
#else
	NULL_RxHandler,
#endif
};












