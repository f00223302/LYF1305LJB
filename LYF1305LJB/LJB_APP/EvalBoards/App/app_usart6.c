/*
	FileName : app_uart6.c
	Description : 

		UART6 is used as A/B device.

	Created on 2013.10.11 by ZZP.


	Revision History:


*/
#include  <app_cfg.h>
#include  <includes.h>
#include "app_usart6.h"
#include "app.h"
#include "miscfnx.h"
#include "bsp.h"
#include "app_i2c1.h"
#include "app_adc.h"
#include "F205_Flash.h"


/// RAM 最高地址处用来表示需要 BIOS 升级
#define UPGRADE_FLAG_DATA			0x73625593
#define UPGRADE_FLAG_ADDRESS	       ((uint32_t)0x20017FFC)


////////////////////////////////////////////////////////////////////////////////////
///							Global variables
////////////////////////////////////////////////////////////////////////////////////
uint8_t		Usart6RxBuf[USART6_RX_BUF_SIZE];
uint8_t		Usart6TxBuf[USART6_TX_BUF_SIZE];

////////////////////////////////////////////////////////////////////////////////////
///							Local variables
////////////////////////////////////////////////////////////////////////////////////
uint8_t		_tmpRxBuf6[USART6_RX_BUF_SIZE];
uint8_t		_tmpTxBuf6[USART6_TX_BUF_SIZE];
DATA_STRUCT _RxInfo6;
DATA_STRUCT _TxInfo6;


U6_TXFRMBUF U6_TxFrmBuf; // transmit frame buf 

#if 0
void Calibrate(void)
{
	uint8_t ch, i;
	uint16_t len, Offset, skew;
	float tmp, *p; 

#if OS_CRITICAL_METHOD == 3                     
		OS_CPU_SR  cpu_sr = 0;
#endif

    ch = _RxInfo6.data[0];

    if (ch >= AppInfo.AnalogChCnt)
	{
	    _TxInfo6.data[0] = 2;
	    goto _errHandler;
    }

    len = ((uint16_t)_RxInfo6.len[0] << 8) + _RxInfo6.len[1] - 8;

    if ((len > 20) || (len < 4))
	{
	    _TxInfo6.data[0] = 3;
	    goto _errHandler;
    }

    //接收的字节高低顺序是如何的，需要进一步调试得知，待确认
    Offset = ((uint16_t)_RxInfo6.data[1] << 8) + _RxInfo6.data[2];
    skew = ((uint16_t)_RxInfo6.data[3] << 8) + _RxInfo6.data[4];

    if ((skew > 40960) || (skew < 1024))
	{
        _TxInfo6.data[0] = 1;
	    goto _errHandler;
    }

    for (i = 0; i < len; i++)
    {
	    CalibrationInfo[ch][i] = _RxInfo6.data[1 + i];
    }

	tmp = skew;
	tmp /= 256;

	p = &(AppInfo.AdcRatio[ch]);
	
	OS_ENTER_CRITICAL();

		AppInfo.AdcOffset[ch] = Offset;

		if (p != NULL)
		{
		    *p = tmp;
		}

	OS_EXIT_CRITICAL();

	_TxInfo6.data[0] = CMD_DEBUG_READ_SIGNAL_AMP;
	_TxInfo6.data[1] = ch ;	  ///开始通道号
	
	Usart_TxDataHandler(COM6, &_TxInfo6);
	return;

_errHandler:  //协议中暂时没给出相应的答复，待确认修改
	//App_Usart_TxDataHandler(CMD_CALIBRATION, buf, 1, NULL, 0);
	Usart_TxDataHandler(COM6, &_TxInfo6);
	return;

}

void WriteChInfo(void)
{
	uint8_t *ptr, i;
	uint16_t len;

	ptr = &(CalibrationInfo[0][0]);

    len = ((uint16_t)_RxInfo6.len[0] << 8) + _RxInfo6.len[1] - 8;

	for (i = 0; i < len; i++)
	{
		ptr[i] = _RxInfo6.data[i];
	}

    AppInfo.WriteFlag = 1;
}
	
void ReadChInfo(void)
{
	uint8_t *ptr, i;
	uint16_t len;
	
	ptr = &(CalibrationInfo[0][0]);
	
	len = CHANNEL_COUNT_LIMIT * PARAMETER_BYTE_COUNT;
	
	for (i = 0; i < len; i++)
	{
		_TxInfo6.data[i] = ptr[i];
	}
}

#endif

/////////////////////////////////////////////////////////////////////////////////////
///							Global Function Realizations
/////////////////////////////////////////////////////////////////////////////////////
void  AppTaskUsart6 (void *p_arg)
{
	(void)p_arg;
	
	///为帧缓冲区分配地址：
	_RxInfo6.data = _tmpRxBuf6;
	_TxInfo6.data = _tmpTxBuf6;

	while (DEF_TRUE)
	{
	    //AppInfo.RdyFlag = 1;

		if (AppInfo.RdyFlag == 1)
		{	
			Usart_RxDataHandler(COM6, &_RxInfo6);
			AppInfo.TaskUsartCnt[COM6]++;
		}
		OSTimeDly(10);
	}
}


///
void Usart6_RxFrameHandler(DATA_STRUCT *Info)
{   
    int N = 0;  //当做临时代替的，待删除和替换
//	uint8_t *ptr, buf[10];

	uint8_t  i, err, Buf[16]; //*P
	uint16_t  cnt;	//*buffer

#if OS_CRITICAL_METHOD == 3                     
		OS_CPU_SR  cpu_sr = 0;
#endif

	switch (Info->cmd)
	{	
		case CMD_ACK_MISC:

			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 2;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_UPGRADE_FIRMWARE  ;     ///经张工确认，根据原业务类型返回，因此需要先获取原来的命令类型
			_TxInfo6.cmd = CMD_ACK_MISC;

			_TxInfo6.data[0] = CMD_UPGRADE_FIRMWARE ;    ///主机命令字字节
			_TxInfo6.data[1] = 0 ;    ///原数据第一字节

			Usart_TxDataHandler(COM6, &_TxInfo6);

			break;


		case CMD_WRITE_CONFIG:   /// 2 配置  写通道参数

#if 0
			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 2;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_CONFIG;
			_TxInfo6.cmd = CMD_ACK_MISC;

			_TxInfo6.data[0] = 2;
			_TxInfo6.data[1] = _RxInfo6.data[0];/// 写命令中的第一字节数据

			Usart_TxDataHandler(COM6, &_TxInfo6);

			WriteChInfo();
#endif

			WriteChParams(Info);

		    break;


		case CMD_INQUIRY_CONFIG:   ///3 读取配置  读通道参数

#if 0

			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 20;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_ACK_MISC;
			_TxInfo6.cmd = CMD_ACK_CONFIG;

			//ReadChInfo();

			Usart_TxDataHandler(COM6, &_TxInfo6);
#endif

			AckParams();

		    break;

		case CMD_SELF_TEST: ///待完善确认
			
			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 1;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_SELFTEST;    
			_TxInfo6.cmd = CMD_ACK_TEST_RESULT;

			_TxInfo6.data[0] = 0;         ///参照张工的，询问后说可根据自己的实际修改   最少一个数据


			Usart_TxDataHandler(COM6, &_TxInfo6);

			break;

		case CMD_INQUIRY_TEST_RESULT:

			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 1;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_SELFTEST;    
			_TxInfo6.cmd = CMD_ACK_TEST_RESULT;

			_TxInfo6.data[0] = N ;    ///自检状态(包括RA/RB和A/B)  根据设备（板卡）不同，字节数不同（最少一个数据）。

			Usart_TxDataHandler(COM6, &_TxInfo6);

			break;


		case CMD_RESET:       

			*(__IO uint32_t*)UPGRADE_FLAG_ADDRESS = UPGRADE_FLAG_DATA;	

			//为了JSCSH的需求而暂时删除，待改
#if 0
			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 2;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_SELFTEST;
			_TxInfo6.cmd = CMD_ACK_MISC;

			_TxInfo6.data[0] = 8;
			_TxInfo6.data[1] = 0; 
			Usart_TxDataHandler(COM6, &_TxInfo6);
#endif

			///Disable DOG feeding
			App_WaitForReset();

			break;
		
		case CMD_INQUIRY_VERSION:               ///查询版本号：BIOS和APP
			
			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 14;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_FIRMWARE;
			_TxInfo6.cmd = CMD_ACK_VERSION;
			
			///BIOS
                       _TxInfo6.data[0] = FIRM_BIOS;

			for (i = 0; i < 6; i++)
			{
				_TxInfo6.data[1 + i] = ParamBuf[4 + i];
			}

			///APP
			_TxInfo6.data[7] = FIRM_APPLICATION;

			for (i = 0; i < 6; i++)
                      {
				_TxInfo6.data[8 + i] = ParamBuf[20 + i];
			}

			Usart_TxDataHandler(COM6, &_TxInfo6);
			break;


//Started Added by me 20140718

		case CMD_INQUIRY_INTERNAL_VERSION:         ///查询内部版本号：BIOS和APP
			
			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 14;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_FIRMWARE;
			_TxInfo6.cmd = CMD_ACK_INTERNAL_VERSION;
			
			///BIOS
            _TxInfo6.data[0] = FIRM_BIOS;

			_TxInfo6.data[1] = INTERNAL_BIOS_SOFT_VER_MAIN;
			_TxInfo6.data[2] = INTERNAL_BIOS_SOFT_VER_SUB;
 			_TxInfo6.data[3] = 0x20;
			_TxInfo6.data[4] = INTERNAL_BIOS_SOFT_VER_YEAR;
			_TxInfo6.data[5] = INTERNAL_BIOS_SOFT_VER_MONTH;
			_TxInfo6.data[6] = INTERNAL_BIOS_SOFT_VER_DATE;

			///APP
			_TxInfo6.data[7] = FIRM_APPLICATION;

			_TxInfo6.data[8] = INTERNAL_APP_SOFT_VER_MAIN;
			_TxInfo6.data[9] = INTERNAL_APP_SOFT_VER_SUB;
 			_TxInfo6.data[10] = 0x20;
			_TxInfo6.data[11] = INTERNAL_APP_SOFT_VER_YEAR;
			_TxInfo6.data[12] = INTERNAL_APP_SOFT_VER_MONTH;
			_TxInfo6.data[13] = INTERNAL_APP_SOFT_VER_DATE;

			Usart_TxDataHandler(COM6, &_TxInfo6);
			break;

//End Added by me 20140718


		case CMD_DOWN_FILE_DATA_FRAME:   ///文件下载


            /// 确认需要保存的信息内容
		    break;


///报告升级状态   0-OK   1-正在升级    2-升级失败    3-数据帧错误   4-未收到升级命令

		//BIOS 中升级，此处应用程序应答成功
		case CMD_INQUIRY_UPGRADE_STATUS:   

			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 1;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_FIRMWARE;
			_TxInfo6.cmd = CMD_ACK_UPGRADE_STATUS;

			_TxInfo6.data[0] = 0;	  /// OK 

			Usart_TxDataHandler(COM6, &_TxInfo6);
			break;

		case CMD_INQUIRY_WORK_INFO:   ///读板卡工作数据

			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + N;  ///最少一个数据，待定
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_WORK_INFO;
			_TxInfo6.cmd = CMD_ACK_WORK_INFO;

			_TxInfo6.data[0] = 2;     /// 待定
			_TxInfo6.data[N-1] = ParamBuf[4];

			Usart_TxDataHandler(COM6, &_TxInfo6);
		       break;

		case CMD_INQUIRY_110V_INFO:   ///报告上次掉电信息

			_TxInfo6.len[0] = 0;
			//_TxInfo6.len[1]在下面掉电判断中给出
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_WORK_INFO;
			_TxInfo6.cmd = CMD_ACK_110V_INFO;

		    if(RecInfo.TotNewRec)  			///有新的掉电记录
		    {
				_TxInfo6.len[1] = 8 + 16;

			    if(RecInfo.NextIndex == 1)
			    {
			        XferRecIndex = REC_SIZE;
			    }
			    else
			    {
			        XferRecIndex = RecInfo.NextIndex - 1;
			    }

			  //断电10  秒后不再记录
			  //  NoDataTm = 0;

			    cnt = sizeof(Buf);

                while(RecInfo.TotNewRec)
                {
                    //这种方式是否不妥，待确认修改
					OS_ENTER_CRITICAL();
					RecInfo.TotNewRec--;
					OS_EXIT_CRITICAL();

					sEE_ReadBuffer(Buf, XferRecIndex, &cnt);
				
					if (XferRecIndex == 1)
					{
						XferRecIndex = REC_SIZE;
					}
					else
					{
						XferRecIndex--;
					}	
				
				    _TxInfo6.data = Buf;
				
				    Usart_TxDataHandler(COM6, &_TxInfo6);
				}
		    }
		    else                               ///无新 的掉电记录
		    {
			    _TxInfo6.len[1] = 8 + 1;

			    _TxInfo6.data[0] = 0; 

			    Usart_TxDataHandler(COM6, &_TxInfo6);
	    	}
		    break;

#if 0
		case CMD_TIME_BROAD_CAST:   ///时钟及里程广播

		    ///保存时间

			P = (uint8_t *)&(AppInfo.NowTime[0]);
			
			OS_ENTER_CRITICAL();
			
			for (i = 0; i < 4; i++)
			{
				*P++ = _RxInfo6.data[i];
			}

			OS_EXIT_CRITICAL();

			if (!PowF)
			{
			    P = (uint8_t *)&(LJBPosInfo[0].SysTime[0]);

			    for (i = 0; i < 4; i++)
			    {
			        *P++ = _RxInfo6.data[i];
			    }

			    *P++;

			    for (i = 4; i < 7; i++)
			    {
				    *P++ = _RxInfo6.data[i];
			    }

			    //LJBPosInfo[0].D110V = ADC10Data;
			    PosIndex = 0;
			}

///暂时不加，待确认加进来
#if 0
			NoDataTm = 0;
			TimeUsed = 1;
#endif 
			///不应答
		    break;
#endif

///Deleted by me 2014/02/24
#if 0
			UserInf.SysTime[0] = _RxInfo6.data[0];
			UserInf.SysTime[1] = _RxInfo6.data[1];
			UserInf.SysTime[2] = _RxInfo6.data[2];
			UserInf.SysTime[3] = _RxInfo6.data[3];

			///保存里程
		    UserInf.Dist[0] = _RxInfo6.data[4];
			UserInf.Dist[1] = _RxInfo6.data[5];
			UserInf.Dist[2] = _RxInfo6.data[6];

			///无须应答
            ///debug
			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 7;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_WORK_INFO;
			_TxInfo6.cmd = CMD_TIME_BROAD_CAST; 

			_TxInfo6.data[0] = _RxInfo6.data[0];     
			_TxInfo6.data[1] = _RxInfo6.data[1];       
			_TxInfo6.data[2] = _RxInfo6.data[2];      
			_TxInfo6.data[3] = _RxInfo6.data[3];      
			_TxInfo6.data[4] = _RxInfo6.data[4];     
			_TxInfo6.data[5] = _RxInfo6.data[5];
			_TxInfo6.data[6] = _RxInfo6.data[6];

			Usart_TxDataHandler(COM6, &_TxInfo6);
#endif

///Deleted by me 2014/04/15
#if 0
		case CMD_INQUIRY_TIME:      ///查询时钟

			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 6;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_TIME;
			_TxInfo6.cmd = CMD_ACK_TIME;     ///时钟查询应答

            ///从串口接收到的时钟和里程广播里获取时间信息，可能还得递增时间，待定
			_TxInfo6.data[0] = 2;       ///年  当前年减去2000
			_TxInfo6.data[1] = 2;       ///月
			_TxInfo6.data[2] = 2;       ///日
			_TxInfo6.data[3] = 2;       ///时
			_TxInfo6.data[4] = 2;       ///分
			_TxInfo6.data[5] = 2;       ///秒

			Usart_TxDataHandler(COM6, &_TxInfo6);
		    break;

		case CMD_CALIBRATE_TIME:      ///时钟校准

			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 2;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_TIME;
			_TxInfo6.cmd = CMD_ACK_MISC;      ///应答			

		    _TxInfo6.data[0] = 0x24;		     
		    _TxInfo6.data[1] = 2;             ///年  确认是否要减去2000
			Usart_TxDataHandler(COM6, &_TxInfo6);
		    break;
#endif

/********************根据张工的提议增加的**************************/

		case CMD_GET_BOARD_ID:
			
			if (Info->type == CMD_TYPE_CONFIG)
			{
				AckBoardID();
			}
			break;

    	case CMD_WRITE_BOARD_ID:
		
		    if (Info->type == CMD_TYPE_CONFIG)
		    {
			    WriteBoardID(Info);
		    }
		    break;

        case CMD_GET_MAINT_INFO:
	
	        if (Info->type == CMD_TYPE_CONFIG)
	        {
		        AckMaintInfo();
	        }
	        break;


        case CMD_WRITE_MAINT_INFO:
	
	        if (Info->type == CMD_TYPE_CONFIG)
	        {
		        WriteMaintInfo(Info);
	        }
	        break;


/********************根据张工的提议增加的**************************/


		case CMD_UPGRADE_FIRMWARE:     ///应用程序不处理升级事项
		    break;

		case CMD_UPGRADE_DATA_FRAME:   ///不处理
		    break;

		case CMD_DEBUG_SET_PARAM:      ///配置通道参数

#if 0
			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 2;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_DEBUG;
			_TxInfo6.cmd = CMD_ACK_MISC;       ///应答


			Calibrate(); //待完善
#endif

			UpdateParams(Info);

			break;

		///读通道数据之直流偏置

		case CMD_DEBUG_READ_110V_ADC_OFFSET:      ///读5个通道直流偏置
#if 0

			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 10;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_DEBUG;
			_TxInfo6.cmd = CMD_DEBUG_ACK_110V_ADC_OFFSET;       ///应答

			///5个通道的直流偏置
			GetSampleOffset(buffer);

			_TxInfo6.data[0] = (buffer[0]) & 0xff;		      
		    _TxInfo6.data[1] = (buffer[0] >> 8) & 0xff; 
			
		    _TxInfo6.data[2] = (buffer[1]) & 0xff;
		    _TxInfo6.data[3] = (buffer[1] >> 8) & 0xff;
			
		    _TxInfo6.data[4] = (buffer[2]) & 0xff;
		    _TxInfo6.data[5] = (buffer[2] >> 8) & 0xff;
			
		    _TxInfo6.data[6] = (buffer[3]) & 0xff;
		    _TxInfo6.data[7] = (buffer[3] >> 8) & 0xff;
			
		    _TxInfo6.data[8] = (buffer[4]) & 0xff;
		    _TxInfo6.data[9] = (buffer[4] >> 8) & 0xff;

			Usart_TxDataHandler(COM6, &_TxInfo6);
#endif

			Ack110VOffset();

			break;

		///读通道数据之直流电压

		case CMD_DEBUG_READ_110V_ADC_RES:      ///读5个通道电压

#if 0
			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 10;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_DEBUG;
			_TxInfo6.cmd = CMD_DEBUG_ACK_110V_ADC_RES;       ///应答

			///5个通道的直流电压值
			GetSampleValues(buffer);

			_TxInfo6.data[0] = (buffer[0]) & 0xff;		      
		    _TxInfo6.data[1] = (buffer[0] >> 8) & 0xff; 
			
		    _TxInfo6.data[2] = (buffer[1]) & 0xff;
		    _TxInfo6.data[3] = (buffer[1] >> 8) & 0xff;
			
		    _TxInfo6.data[4] = (buffer[2]) & 0xff;
		    _TxInfo6.data[5] = (buffer[2] >> 8) & 0xff;
			
		    _TxInfo6.data[6] = (buffer[3]) & 0xff;
		    _TxInfo6.data[7] = (buffer[3] >> 8) & 0xff;
			
		    _TxInfo6.data[8] = (buffer[4]) & 0xff;
		    _TxInfo6.data[9] = (buffer[4] >> 8) & 0xff;

			Usart_TxDataHandler(COM6, &_TxInfo6);

#endif
			Ack110VRes();

		    break;


		case CMD_WRITE_PROTECTION:     ///flash解锁/上锁    

            err = CheckProtectData(Info);

            if (err & 0x0f)
            {
	            AckWriteProtection(err);
            }
            else
		    {
	            err = F205_WriteProtection(Info->data[1], err >> 4);
				
	            AckWriteProtection(err);
            }

            break;
#if 0
			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 1;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_DEBUG;
			_TxInfo6.cmd = CMD_ACK_WRITE_PROTECTION;       ///应答			

			if(_RxInfo6.data[0] != _RxInfo6.data[6])
			{
				goto _errHandler;
			}

			if((_RxInfo6.data[0] == 0xAA)&&(((_RxInfo6.data[5]<<24)|(_RxInfo6.data[4]<<16)|\
			   (_RxInfo6.data[3]<<8)|(_RxInfo6.data[2])) == WRITE_PROTECTION_ENABLE_ID))
			{
			    F205_WriteProtection(_RxInfo6.data[1], ENABLE);
			}
			else if((_RxInfo6.data[0] == 0x55)&&(((_RxInfo6.data[5]<<24)|(_RxInfo6.data[4]<<16)|\
			   (_RxInfo6.data[3]<<8)|(_RxInfo6.data[2])) == WRITE_PROTECTION_DISABLE_ID))
			{
			    F205_WriteProtection(_RxInfo6.data[1], DISABLE);
			}
			else
			{
				goto _errHandler;
			}

			_TxInfo6.data[0] = 0;			         //OK
			Usart_TxDataHandler(COM6, &_TxInfo6);
		    break;	

		_errHandler:
			_TxInfo6.data[0] = 1;                    //ERR
			Usart_TxDataHandler(COM6, &_TxInfo6);
		    break;			
#endif


		default:
			break;
	}
}

/*
void Usart6_TxDeal(void)
{

	Usart_RxDataHandler(uint8_t COM6, DATA_STRUCT *Info);

	if((U6_TxFrmBuf.rIndex!=U6_TxFrmBuf.wIndex)&&(BSP_Info.UsartTxStatus[COM6]==0))
	{
//		App_Usart6_TxDataHandler2(&U6_TxFrmBuf.fdBuf[U6_TxFrmBuf.rIndex][0],U6_TxFrmBuf.flenBuf[U6_TxFrmBuf.rIndex]);
		Usart_TxDataHandler(COM6, &_TxInfo6);

		U6_TxFrmBuf.rIndex++;
    U6_TxFrmBuf.rIndex &=U6TXFRAME_MASK;  	
	}	
}	

*/


//Added by me 20140328
/********************根据张工的50V 修改为110V 通道的**************************/

void AckParams(void)
{
	uint8_t i;
	uint16_t temp;
	
	_TxInfo6.len[0] = 0;
	_TxInfo6.len[1] = 8 + 20;			
	_TxInfo6.src = AppInfo.BdAddr;
	_TxInfo6.src_len = 0;
	_TxInfo6.dst = _RxInfo6.src;
	_TxInfo6.dst_len = 0;
	_TxInfo6.type = CMD_TYPE_CONFIG;
	_TxInfo6.cmd = CMD_ACK_CONFIG;		

	for (i = 0; i < 5; i++)
	{			
		temp = AppInfo.AdcOffset[i];
		
		_TxInfo6.data[i << 2] = temp & 0xff;
		
		_TxInfo6.data[(i << 2) + 1] = temp >> 8;
		
		temp = AppInfo.AdcRatio[i] * SAMPLE_RATIO_CONSTANT;
		
		_TxInfo6.data[(i << 2) + 2] = temp & 0xff;
		
		_TxInfo6.data[(i << 2) + 3] = temp >> 8;
	}

	Usart_TxDataHandler(COM6, &_TxInfo6);
}



void WriteChParams(DATA_STRUCT *Info)
{
	uint32_t addr;
	uint16_t i, len, temp, cnt = 0;
	uint8_t err = 1;
		
	len = ((uint16_t)Info->len[0] << 8) + Info->len[1] - 8;

	if (len == 20)
	{	
		len >>= 2;
		
		for (i = 0; i < len; i++)
		{
			temp = ((uint16_t)Info->data[(i << 2) + 1] << 8) + Info->data[(i << 2) + 0];
#if 0			
			if (i == 0x17)
			{
				temp = 0;
			}
#endif
			ParamBuf[36 + (i << 2) + 0] = temp & 0xff;
			ParamBuf[36 + (i << 2) + 1] = temp >> 8;

			AppInfo.AdcOffset[i] = temp;
			
			temp = ((uint16_t)Info->data[(i << 2) + 3] << 8) + Info->data[(i << 2) + 2];

			ParamBuf[36 + (i << 2) + 2] = temp & 0xff;
			ParamBuf[36 + (i << 2) + 3] = temp >> 8;

			AppInfo.AdcRatio[i] = (float)temp / SAMPLE_RATIO_CONSTANT;
		}
			
		cnt = 30;//126 - 104 = 22  14 - 8 = 6
		err = 0;
	}
			
	if (!err)
	{
		temp = Calc_CRCByte(ParamBuf + 32, cnt);
		
		ParamBuf[32 + cnt] = temp >> 8;
		ParamBuf[33 + cnt] = temp & 0xff;
					
		addr = PARAMS_ADDRESS;
		
		err = F205_WriteParams(addr, &(ParamBuf[0]), sizeof(ParamBuf));
		
		if (!err)
		{		
			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 2;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_CONFIG;
			_TxInfo6.cmd = CMD_ACK_MISC;
			_TxInfo6.data[0] = CMD_WRITE_CONFIG;
			_TxInfo6.data[1] = _RxInfo6.data[0];
			
			Usart_TxDataHandler(COM6, &_TxInfo6);
		}
	}
}


void UpdateParams(DATA_STRUCT *Info)
{
	uint16_t i, len, temp;
	uint8_t err = 1;
	
	if (Info->data[0] < 5)///start channel
	{		
		len = ((uint16_t)Info->len[0] << 8) + Info->len[1] - 8;
		
		if (len & 0x01)
		{			
			len--;
			
			if ((len & 0x03) == 0)///4 的倍数
			{
				len >>= 2;///channel cnt

				if (Info->data[0] + len < 6)
				{
					for (i = 0; i < len; i++)
					{	
						temp = ((uint16_t)Info->data[1 + (i << 2) + 1] << 8) + Info->data[1 + (i << 2)];
						
						AppInfo.AdcOffset[i + Info->data[0]] = temp;
						
						temp = ((uint16_t)Info->data[1 + (i << 2) + 3] << 8) + Info->data[1 + (i << 2) + 2];
						
						AppInfo.AdcRatio[i + Info->data[0]] = (float)temp / SAMPLE_RATIO_CONSTANT;
					}
					err = 0;
				}
			}
		}
	}
	
	if (!err)
	{	
		_TxInfo6.len[0] = 0;
		_TxInfo6.len[1] = 8 + 2;
		_TxInfo6.src = AppInfo.BdAddr;
		_TxInfo6.src_len = 0;
		_TxInfo6.dst = _RxInfo6.src;
		_TxInfo6.dst_len = 0;
		_TxInfo6.type = CMD_TYPE_DEBUG;
		_TxInfo6.cmd = CMD_ACK_MISC;

		_TxInfo6.data[0] = CMD_DEBUG_SET_PARAM;
		_TxInfo6.data[1] = _RxInfo6.data[0];
			
		Usart_TxDataHandler(COM6, &_TxInfo6);
	}
}


void Ack110VOffset(void)
{
	uint8_t i;
	uint16_t buf[10];
	
	GetSampleOffset(buf);
		
	_TxInfo6.len[0] = 0;
	_TxInfo6.len[1] = 8 + 10;
	_TxInfo6.src = AppInfo.BdAddr;
	_TxInfo6.src_len = 0;
	_TxInfo6.dst = _RxInfo6.src;
	_TxInfo6.dst_len = 0;
	_TxInfo6.type = CMD_TYPE_DEBUG;
	_TxInfo6.cmd = CMD_DEBUG_ACK_110V_ADC_OFFSET;
	///
	for (i = 0; i < 5; i++)
	{	
		_TxInfo6.data[i << 1] = buf[i] & 0xff;
		_TxInfo6.data[(i << 1) + 1] = buf[i] >> 8;
	}
			
	Usart_TxDataHandler(COM6, &_TxInfo6);
}


void Ack110VRes(void)
{
	uint8_t i;
	uint16_t buf[5];
	
	GetSampleValues(buf);
		
	_TxInfo6.len[0] = 0;
	_TxInfo6.len[1] = 8 + 10;
	_TxInfo6.src = AppInfo.BdAddr;
	_TxInfo6.src_len = 0;
	_TxInfo6.dst = _RxInfo6.src;
	_TxInfo6.dst_len = 0;
	_TxInfo6.type = CMD_TYPE_DEBUG;
	_TxInfo6.cmd = CMD_DEBUG_ACK_110V_ADC_RES;
	///
	for (i = 0; i < 5; i++)
	{
		_TxInfo6.data[i << 1] = buf[i] & 0xff;
		_TxInfo6.data[(i << 1) + 1] = buf[i] >> 8;
	}
			
	Usart_TxDataHandler(COM6, &_TxInfo6);
}


/********************根据张工的50V 修改为110V 通道的**************************/



//Added by me 20140326
/********************根据张工的提议增加的**************************/

void AckBoardID(void)
{
	uint8_t i;
	
	_TxInfo6.len[0] = 0;
	_TxInfo6.len[1] = 8 + 8;
	_TxInfo6.src = AppInfo.BdAddr;
	_TxInfo6.src_len = 0;
	_TxInfo6.dst = _RxInfo6.src;
	_TxInfo6.dst_len = 0;
	_TxInfo6.type = CMD_TYPE_CONFIG;
	_TxInfo6.cmd = CMD_ACK_GET_BOARD_ID;

	for (i = 0; i < 8; i++)
	{
		_TxInfo6.data[i] = ParamBuf[50 + i];
	}
			
	Usart_TxDataHandler(COM6, &_TxInfo6);
}


void WriteBoardID(DATA_STRUCT *Info)
{
	uint16_t i, len, crc;
	uint32_t addr;
	uint8_t err;
	
	len = ((uint16_t)Info->len[0] << 8) + Info->len[1] - 8;
	if (len == 8)
	{	
		for (i = 0; i < 8; i++)
	    {
	        ParamBuf[50 + i] = Info->data[i];
		}
		
		crc = Calc_CRCByte(ParamBuf + 32, 126);
		ParamBuf[158] = crc >> 8;
		ParamBuf[159] = crc & 0xff;
					
		addr = PARAMS_ADDRESS;
		err = F205_WriteParams(addr, &(ParamBuf[0]), sizeof(ParamBuf));
		if (!err)
		{				
			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 2;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_CONFIG;
			_TxInfo6.cmd = CMD_ACK_MISC;
			_TxInfo6.data[0] = CMD_WRITE_BOARD_ID;
			_TxInfo6.data[1] = _RxInfo6.data[0];
			
			Usart_TxDataHandler(COM6, &_TxInfo6);
		}
	}
}


void AckMaintInfo(void)
{
	uint8_t i, n;
	
	n = ParamBuf[44];

	_TxInfo6.len[0] = 0;
	_TxInfo6.len[1] = 8 + n * 20;
	_TxInfo6.src = AppInfo.BdAddr;
	_TxInfo6.src_len = 0;
	_TxInfo6.dst = _RxInfo6.src;
	_TxInfo6.dst_len = 0;
	_TxInfo6.type = CMD_TYPE_CONFIG;
	_TxInfo6.cmd = CMD_ACK_MAINT_INFO;

	for (i = 0; i < n; i++)
	{
		_TxInfo6.data[i] = ParamBuf[58 + i];
	}
			
	Usart_TxDataHandler(COM6, &_TxInfo6);
}


void WriteMaintInfo(DATA_STRUCT *Info)
{
	uint16_t i, len, crc;
	uint32_t addr;
	uint8_t err;
	
	len = ((uint16_t)Info->len[0] << 8) + Info->len[1] - 8;
	if (len == 20)
	{	
		if (ParamBuf[45] > 4)
		{
			ParamBuf[45] = 0;
		}

		len = ParamBuf[45] * 20 + 58;
		for (i = 0; i < 20; i++)
		{
			ParamBuf[len + i] = Info->data[i];
		}
		
		ParamBuf[44]++;
		if (ParamBuf[44] > 4)
		{
			ParamBuf[44] = 4;
		}
		
		ParamBuf[45]++;
		if (ParamBuf[45] > 4)
		{
			ParamBuf[45] = 0;
		}

		crc = Calc_CRCByte(ParamBuf + 32, 126);
		ParamBuf[158] = crc >> 8;
		ParamBuf[159] = crc & 0xff;
					
		addr = PARAMS_ADDRESS;
		err = F205_WriteParams(addr, &(ParamBuf[0]), sizeof(ParamBuf));
		if (!err)
		{		
			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 2;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_TYPE_CONFIG;
			_TxInfo6.cmd = CMD_ACK_MISC;
			_TxInfo6.data[0] = CMD_WRITE_MAINT_INFO;
			_TxInfo6.data[1] = _RxInfo6.data[0];
			
			Usart_TxDataHandler(COM6, &_TxInfo6);
		}
	}
		
}


/********************根据张工的提议增加的**************************/

/********************根据张工的增加的**************************/


uint8_t CheckProtectData(DATA_STRUCT *Info)
{
	uint32_t *p;
	uint16_t len;
	uint8_t en = 1;

	len = ((uint16_t)Info->len[0] << 8) + Info->len[1];
	if (len != 15)
		return 1;

	if (Info->src != 0x80)
		return 3;
	
	if ((Info->data[0] != 0xAA) && (Info->data[0] != 0x55))
		return 4;

	if (Info->data[6] != Info->data[0])
		return 5;

#if USE_CPU_F205RC	
	if (Info->data[1] > 0x3f)
		return 6;

	if (Info->data[1] == 0)
		return 6;
#endif
	
	p = (uint32_t*)&(Info->data[2]);
	if (Info->data[0] == 0xaa){///写保护
	
		if (*p != WRITE_PROTECTION_ENABLE_ID)
			return 7;
		en = 0x10;
	}
	else if (Info->data[0] == 0x55){

		if (*p != WRITE_PROTECTION_DISABLE_ID)
			return 8;
		en = 0x00;
	}

	return en;
}


void AckWriteProtection(uint8_t err)
{
	_TxInfo6.len[0] = 0;
	_TxInfo6.len[1] = 8 + 1;
	_TxInfo6.src = AppInfo.BdAddr;
	_TxInfo6.src_len = 0;
	_TxInfo6.dst = _RxInfo6.src;
	_TxInfo6.dst_len = 0;
	_TxInfo6.type = CMD_TYPE_DEBUG;
	_TxInfo6.cmd = CMD_ACK_WRITE_PROTECTION;
	_TxInfo6.data[0] = err;
			
	Usart_TxDataHandler(COM6, &_TxInfo6);
}

/********************根据张工的增加的**************************/



