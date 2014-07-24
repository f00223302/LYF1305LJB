/*
	FileName : app_uart1.c
	Description : 

	Created on 2013.08.05 by ZZP.


	Revision History:
		2013.10.22: 机车信号记录板。CPU_SAMPLE 和 CPU_MAIN。
					采样板时，USART1 连接 RA/RB，主机方式读取其他板卡数据。向记录控制CPU传送状态数据。
					记录控制板时，USART1 连接 LAIS。

*/
#include  <app_cfg.h>
#include  <includes.h>
#include "app_usart1.h"
#include "app.h"
#include "miscfnx.h"
#include "bsp.h"
#include "Usart_Common.h"
#include "app_i2c1.h"
#include "app_adc.h"



//////////////////////////////////////////////
///		USART functions and variables
//////////////////////////////////////////////
uint8_t		Usart1RxBuf[USART1_RX_BUF_SIZE];
uint8_t		Usart1TxBuf[USART1_TX_BUF_SIZE];

uint8_t		_tmpRxBuf1[USART1_RX_BUF_SIZE];
uint8_t		_tmpTxBuf1[USART1_TX_BUF_SIZE];
DATA_STRUCT _RxInfo1;
DATA_STRUCT _TxInfo1;

__IO uint8_t _Order = 0;
__IO uint8_t _AckOrder = 0;



/////////////////////////////////////////////////////////////////////////////////////
///							Global Function Realizations
/////////////////////////////////////////////////////////////////////////////////////
void  AppTaskUsart1 (void *p_arg)
{
	(void)p_arg;
	
	///为帧缓冲区分配地址：
	_RxInfo1.data = _tmpRxBuf1;
	_TxInfo1.data = _tmpTxBuf1;

	while (DEF_TRUE){

		if (AppInfo.RdyFlag == 1){
			
			Usart_RxDataHandler(COM1, &_RxInfo1);
			AppInfo.TaskUsartCnt[COM1]++;
		}
		
		OSTimeDly(5);
	}
}

void Usart1_RxFrameHandler(DATA_STRUCT *Info)
{
    uint8_t *P; 	//Buf[128], Buf2[128];

	uint16_t i, *buffer, cnt; //*p16, WrCnt, cnt, Addr, Addr1, Addr2;

    uint8_t err1 = 0;
    uint8_t err2 = 0;
    uint8_t err3 = 0;
    uint8_t err4 = 0;

	uint8_t ReBuf[16];
    uint8_t WrBuf[8]= {25, 136, 6, 5, 6, 9, 1, 5};

	switch (Info->cmd){

/**************************************************************/
///此处是为了调试EEPROM而临时加的串口命令   0x0A 0x0B  0x0C
		case 0x0A:   /// 写EEPROM

		   	//ReCnt = sizeof(ReBuf);

			_TxInfo1.len[0] = 0;
			_TxInfo1.len[1] = 8 + 12;// 8
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_ACK_MISC;
			_TxInfo1.cmd = 0x0B;

#if 1
	
	cnt = 8;

	err1= BSP_WriteI2C1(WrBuf, 0, cnt);

	err2 = BSP_ReadI2C1(ReBuf, 0, &cnt);

	if (cnt != 0)
		err3 = 2;

	for (i = 0; i < 8; i++)
	{
		if (ReBuf[i] != WrBuf[i])
		{
			err4 = 1;
			break;
		}
	}

            _TxInfo1.data[0] = err1;

            _TxInfo1.data[1] = err2;

			_TxInfo1.data[2] = err3;

            _TxInfo1.data[3] = err4;

			for (i = 4; i < 12; i++)
			{
				_TxInfo1.data[i] = ReBuf[i-4];

			}

			Usart_TxDataHandler(COM1, &_TxInfo1);

#endif

		    break;

#if 1
		case 0x0C:   /// 读EEPROM里的标志数据

			_TxInfo1.len[0] = 0;
			_TxInfo1.len[1] = 8 + 16;
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_ACK_MISC;
			_TxInfo1.cmd = 0x0D;
	
        	cnt = 16;

			//sEE_ReadBuffer(ReBuf, 0x0, (uint16_t *)(&cnt)); 

			BSP_ReadI2C1(ReBuf, 0x0, (uint16_t *)(&cnt));

           //改写了指针，导致缓存地址异常
			//_TxInfo1.data = ReBuf;

		   //将上面的改写指针变为赋值，从而不改变指针指向，经验证没问题
			for (i = 0; i < 16; i++)
			{
				_TxInfo1.data[i] = ReBuf[i];
			}

			Usart_TxDataHandler(COM1, &_TxInfo1);

		    break;

		case 0xCC:   /// 读EEPROM里的标志数据

			//_TxInfo1.len在下面掉电判断中给出
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_TYPE_WORK_INFO;
			_TxInfo1.cmd = CMD_ACK_110V_INFO;

			if(RecInfo.TotNewRec)///有新的掉电记录
			{ 
			    if (g_I2C_RdyF == 1)								//I2C空闲
			    {  
				    ReportPowOffData(0);
			    }
			}
			else///无新 的掉电记录
			{	
				_TxInfo1.len[0] = 0;
				_TxInfo1.len[1] = 8 + 1;
				_TxInfo1.data[0] = 0;
			
				Usart_TxDataHandler(COM1, &_TxInfo1);
			}

		    break;
#endif

/****************************************************************/


		case CMD_RESET:        //不需要修改，已完善
			
			_TxInfo1.len[0] = 0;
			_TxInfo1.len[1] = 8 + 2;
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_TYPE_SELFTEST;
			_TxInfo1.cmd = CMD_ACK_MISC;

			_TxInfo1.data[0] = 8;
			_TxInfo1.data[1] = 0; 

/**********为了JSCSH而暂时去掉***************/
	//		Usart_TxDataHandler(COM1, &_TxInfo1);

			///Disable DOG feeding
			App_WaitForReset();

			break;

#if 0
		case CMD_WRITE_CONFIG:   /// 2 配置  写通道参数

			_TxInfo1.len[0] = 0;
			_TxInfo1.len[1] = 8 + 2;
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_ACK_MISC;
			_TxInfo1.cmd = CMD_ACK_MISC;

			_TxInfo1.data[0] = 2;
			_TxInfo1.data[1] = _RxInfo1.data[0];/// 写命令中的第一字节数据

			Usart_TxDataHandler(COM1, &_TxInfo1);
			
			WriteChInfo();

		    break;

		case CMD_INQUIRY_CONFIG:   ///3 读取配置  读通道参数

			_TxInfo1.len[0] = 0;
			_TxInfo1.len[1] = 8 + 20;
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_ACK_MISC;
			_TxInfo1.cmd = CMD_ACK_CONFIG;

			ReadChInfo();

			Usart_TxDataHandler(COM1, &_TxInfo1);

		    break;
#endif

		case CMD_SELF_TEST: ///待完善确认
			
			_TxInfo1.len[0] = 0;
			_TxInfo1.len[1] = 8 + 1;
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_TYPE_SELFTEST;    
			_TxInfo1.cmd = CMD_ACK_TEST_RESULT;

			_TxInfo1.data[0] = 0;         ///参照张工的，询问后说可根据自己的实际修改   最少一个数据


			Usart_TxDataHandler(COM1, &_TxInfo1);

			break;

		case CMD_INQUIRY_TEST_RESULT:

			_TxInfo1.len[0] = 0;
			_TxInfo1.len[1] = 8 + 1;
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_TYPE_SELFTEST;    
			_TxInfo1.cmd = CMD_ACK_TEST_RESULT;

			_TxInfo1.data[0] = 0 ;    ///自检状态(包括RA/RB和A/B)  根据设备（板卡）不同，字节数不同（最少一个数据）。

			Usart_TxDataHandler(COM1, &_TxInfo1);

			break;



		case CMD_INQUIRY_VERSION:               ///查询版本号：BIOS和APP
			
			_TxInfo1.len[0] = 0;
			_TxInfo1.len[1] = 8 + 14;
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_TYPE_FIRMWARE;
			_TxInfo1.cmd = CMD_ACK_VERSION;
			
			///BIOS
            _TxInfo1.data[0] = FIRM_BIOS;

			for (i = 0; i < 6; i++)
			{
				_TxInfo1.data[1 + i] = ParamBuf[4 + i];
			}

			///APP
			_TxInfo1.data[7] = FIRM_APPLICATION;

			for (i = 0; i < 6; i++)
            {
				_TxInfo1.data[8 + i] = ParamBuf[20 + i];
			}

			Usart_TxDataHandler(COM1, &_TxInfo1);
			break;

		case CMD_DOWN_FILE_DATA_FRAME:	 ///文件下载
		
		
			/// 确认需要保存的信息内容
		    break;
		
		
		///报告升级状态   0-OK	 1-正在升级    2-升级失败	 3-数据帧错误	4-未收到升级命令
		
			//BIOS 中升级，此处应用程序应答成功
		case CMD_INQUIRY_UPGRADE_STATUS:   
		
			_TxInfo1.len[0] = 0;
			_TxInfo1.len[1] = 8 + 1;
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_TYPE_FIRMWARE;
			_TxInfo1.cmd = CMD_ACK_UPGRADE_STATUS;
		
			_TxInfo1.data[0] = 0;	  /// OK 
		
			Usart_TxDataHandler(COM1, &_TxInfo1);

			break;

		case CMD_INQUIRY_WORK_INFO:   ///读板卡工作数据  110V通道电压

			_TxInfo1.len[0] = 0;
			_TxInfo1.len[1] = 8 + 18;
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_TYPE_WORK_INFO;
			_TxInfo1.cmd = CMD_ACK_WORK_INFO;

			ReadBoardWorkInfo();

			Usart_TxDataHandler(COM1, &_TxInfo1);

		    break;


		case CMD_INQUIRY_110V_INFO:   ///报告上次掉电信息

			//_TxInfo1.len在下面掉电判断中给出
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_TYPE_WORK_INFO;
			_TxInfo1.cmd = CMD_ACK_110V_INFO;

			if(RecInfo.TotNewRec)///有新的掉电记录
			{ 
			    if (g_I2C_RdyF == 1)								//I2C空闲
			    {  
				    ReportPowOffData(1);
			    }
			}
			else///无新 的掉电记录
			{	
				_TxInfo1.len[0] = 0;
				_TxInfo1.len[1] = 8 + 1;
				_TxInfo1.data[0] = 0;
			
				Usart_TxDataHandler(COM1, &_TxInfo1);
			}

		    break;


				case CMD_TIME_BROAD_CAST:	///时钟及里程广播

					P = (uint8_t *)&(LJBPosInfo.SysTime[0]);
							
					for (i = 0; i < 4; i++)
					{
						*P++ = _RxInfo1.data[i];
					}
							
					*P++;
							
				    for (i = 4; i < 7; i++)
					{
						*P++ = _RxInfo1.data[i];
					}

					///不应答
					break;


				case CMD_UPGRADE_FIRMWARE:	   ///应用程序不处理升级事项
					break;
		
				case CMD_UPGRADE_DATA_FRAME:   ///不处理
					break;

#if 0		
				case CMD_DEBUG_SET_PARAM:	   ///配置通道参数

					_TxInfo1.len[0] = 0;
					_TxInfo1.len[1] = 8 + 2;
					_TxInfo1.src = AppInfo.BdAddr;
					_TxInfo1.src_len = 0;
					_TxInfo1.dst = _RxInfo1.src;
					_TxInfo1.dst_len = 0;
					_TxInfo1.type = CMD_TYPE_DEBUG;
					_TxInfo1.cmd = CMD_ACK_MISC;	   ///应答
		
					Calibrate(); //待完善
		
					break;
#endif
		
				///读通道数据之直流偏置
		
				case CMD_DEBUG_READ_110V_ADC_OFFSET:	  ///读5个通道直流偏置

					_TxInfo1.len[0] = 0;
					_TxInfo1.len[1] = 8 + 10;
					_TxInfo1.src = AppInfo.BdAddr;
					_TxInfo1.src_len = 0;
					_TxInfo1.dst = _RxInfo1.src;
					_TxInfo1.dst_len = 0;
					_TxInfo1.type = CMD_TYPE_DEBUG;
					_TxInfo1.cmd = CMD_DEBUG_ACK_110V_ADC_OFFSET;		///应答
		
					///5个通道的直流偏置
					GetSampleOffset(buffer);
		
					_TxInfo1.data[0] = (buffer[0]) && 0xff; 		  
					_TxInfo1.data[1] = (buffer[0] >> 8) && 0xff; 
					
					_TxInfo1.data[2] = (buffer[1]) && 0xff;
					_TxInfo1.data[3] = (buffer[1] >> 8) && 0xff;
					
					_TxInfo1.data[4] = (buffer[2]) && 0xff;
					_TxInfo1.data[5] = (buffer[2] >> 8) && 0xff;
					
					_TxInfo1.data[6] = (buffer[3]) && 0xff;
					_TxInfo1.data[7] = (buffer[3] >> 8) && 0xff;
					
					_TxInfo1.data[8] = (buffer[4]) && 0xff;
					_TxInfo1.data[9] = (buffer[4] >> 8) && 0xff;
		
					Usart_TxDataHandler(COM6, &_TxInfo1);
		
					break;
		
				///读通道数据之直流电压
		
				case CMD_DEBUG_READ_110V_ADC_RES:	   ///读5个通道电压

					_TxInfo1.len[0] = 0;
					_TxInfo1.len[1] = 8 + 10;
					_TxInfo1.src = AppInfo.BdAddr;
					_TxInfo1.src_len = 0;
					_TxInfo1.dst = _RxInfo1.src;
					_TxInfo1.dst_len = 0;
					_TxInfo1.type = CMD_TYPE_DEBUG;
					_TxInfo1.cmd = CMD_DEBUG_ACK_110V_ADC_RES;		 ///应答
		
					///5个通道的直流电压值
					GetSampleValues(buffer);
		
					_TxInfo1.data[0] = (buffer[0]) && 0xff; 		  
					_TxInfo1.data[1] = (buffer[0] >> 8) && 0xff; 
					
					_TxInfo1.data[2] = (buffer[1]) && 0xff;
					_TxInfo1.data[3] = (buffer[1] >> 8) && 0xff;
					
					_TxInfo1.data[4] = (buffer[2]) && 0xff;
					_TxInfo1.data[5] = (buffer[2] >> 8) && 0xff;
					
					_TxInfo1.data[6] = (buffer[3]) && 0xff;
					_TxInfo1.data[7] = (buffer[3] >> 8) && 0xff;
					
					_TxInfo1.data[8] = (buffer[4]) && 0xff;
					_TxInfo1.data[9] = (buffer[4] >> 8) && 0xff;
		
					Usart_TxDataHandler(COM1, &_TxInfo1);
		
					break;

#if 0
		case CMD_WRITE_PROTECTION:     ///flash解锁/上锁    

			_TxInfo1.len[0] = 0;
			_TxInfo1.len[1] = 8 + 1;
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_TYPE_DEBUG;
			_TxInfo1.cmd = CMD_ACK_WRITE_PROTECTION;       ///应答			

			if(_RxInfo1.data[0] != _RxInfo1.data[6])
			{
				goto _errHandler;
			}

			if((_RxInfo1.data[0] == 0xAA)&&(((_RxInfo1.data[5]<<24)|(_RxInfo1.data[4]<<16)|\
			   (_RxInfo1.data[3]<<8)|(_RxInfo1.data[2])) == WRITE_PROTECTION_ENABLE_ID))
			{
			    F205_WriteProtection(_RxInfo1.data[1], ENABLE);
			}
			else if((_RxInfo1.data[0] == 0x55)&&(((_RxInfo1.data[5]<<24)|(_RxInfo1.data[4]<<16)|\
			   (_RxInfo1.data[3]<<8)|(_RxInfo1.data[2])) == WRITE_PROTECTION_DISABLE_ID))
			{
			    F205_WriteProtection(_RxInfo1.data[1], DISABLE);
			}
			else
			{
				goto _errHandler;
			}

			_TxInfo1.data[0] = 0;			         //OK
			Usart_TxDataHandler(COM1, &_TxInfo1);
		    break;	

		_errHandler:
			_TxInfo1.data[0] = 1;                    //ERR
			Usart_TxDataHandler(COM6, &_TxInfo1);
		    break;	
#endif

		default:
			break;
	}
}

/////////////////////////////////////////////////////////////////////////////////////
///							Local Function Realizations
/////////////////////////////////////////////////////////////////////////////////////
#if defined JLB_CPU_SAMPLE
void SendStsInfo(void)
{
	uint32_t i;
	uint8_t j, *ptr;
	
	i = AppInfo.StsIndex;
	if (AppInfo.StsHandleIndex != i){
		
		_TxInfo1.len[0] = 0;
		_TxInfo1.len[1] = 8 + 128;
		_TxInfo1.src = AppInfo.BdAddr;
		_TxInfo1.src_len = 0;
		_TxInfo1.dst = 0x20;
		_TxInfo1.dst_len = 0;
		_TxInfo1.type = 0x04;
		_TxInfo1.cmd = CMD_XFER_STATUS_INFO;
		
		while (AppInfo.StsHandleIndex != i){
			
			ptr = &(StsFrame[AppInfo.StsHandleIndex].ID[0]);
		
			///禁止任务调度
			///OSSchedLock();
			
				for (j = 0; j < 128; j++)
					_TxInfo1.data[j] = ptr[j];
		
			///重新开放任务调度
			///OSSchedUnlock();
		
			Usart_TxDataHandler(COM1, &_TxInfo1);
		
			AppInfo.StsHandleIndex++;
			AppInfo.StsHandleIndex &= STS_BUF_MASK;
		}
	}
}

#endif


#if 0
void WriteChInfo(void)
{
	uint8_t *ptr, i;
	uint16_t len;

	ptr = &(CalibrationInfo[0][0]);

    len = ((uint16_t)_RxInfo1.len[0] << 8) + _RxInfo1.len[1] - 8;

	for (i = 0; i < len; i++)
	{
		ptr[i] = _RxInfo1.data[i];
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
		_TxInfo1.data[i] = ptr[i];
	}
}


void Calibrate(void)
{
	uint8_t ch, i;
	uint16_t len, Offset, skew;
	float tmp, *p; 

#if OS_CRITICAL_METHOD == 3                     
		OS_CPU_SR  cpu_sr = 0;
#endif

    ch = _RxInfo1.data[0];

    if (ch >= AppInfo.AnalogChCnt)
	{
	    _TxInfo1.data[0] = 2;
	    goto _errHandler;
    }

    len = ((uint16_t)_RxInfo1.len[0] << 8) + _RxInfo1.len[1] - 8;

    if ((len > 20) || (len < 4))
	{
	    _TxInfo1.data[0] = 3;
	    goto _errHandler;
    }

    //接收的字节高低顺序是如何的，需要进一步调试得知，待确认
    Offset = ((uint16_t)_RxInfo1.data[1] << 8) + _RxInfo1.data[2];
    skew = ((uint16_t)_RxInfo1.data[3] << 8) + _RxInfo1.data[4];

    if ((skew > 40960) || (skew < 1024))
	{
        _TxInfo1.data[0] = 1;
	    goto _errHandler;
    }

    for (i = 0; i < len; i++)
    {
	    CalibrationInfo[ch][i] = _RxInfo1.data[1 + i];
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

	_TxInfo1.data[0] = CMD_DEBUG_READ_SIGNAL_AMP;
	_TxInfo1.data[1] = ch ;	  ///开始通道号
	
	Usart_TxDataHandler(COM1, &_TxInfo1);
	return;

_errHandler:  //协议中暂时没给出相应的答复，待确认修改
	//App_Usart_TxDataHandler(CMD_CALIBRATION, buf, 1, NULL, 0);
	Usart_TxDataHandler(COM1, &_TxInfo1);
	return;

}
#endif

void ReadBoardWorkInfo(void)
{
	uint8_t  i, j; //*max, *min;
	uint8_t  buf[4] = {0, 0, 0, 0};

	for (i = 0; i < 4; i++)
	{	
		if (_DigRes[i])
		{
			buf[i] = D110VADBuf[i][0];

		    for(j = 1; j < 10; j++)
	        {
		        if( buf[i] < D110VADBuf[i][D110VCnt[i]])
		        {
		            buf[i] = D110VADBuf[i][D110VCnt[i]];
		        }
		    }

		//	buf[i] = *max;
		}
		else
		{
        	buf[i] = D110VADBuf[i][0];

		    for(j = 1; j < 10; j++)
	        {
		        if( buf[i] > D110VADBuf[i][D110VCnt[i]])
		        {
		            buf[i] = D110VADBuf[i][D110VCnt[i]];
		        }
		    }
			
		//	buf[i] = *min;
		}
	}

	for(i = 0; i < 10; i++)
	{
		_TxInfo1.data[i] = D110VADBuf[4][i];//D110VCnt[4]
	}

	_TxInfo1.data[10] = buf[0];
	_TxInfo1.data[11] = D110VADBuf[0][D110VCnt[0]];//UserInf.ID110V; 		
	_TxInfo1.data[12] = buf[1];
	_TxInfo1.data[13] = D110VADBuf[1][D110VCnt[1]];//UserInf.IID110V;
	_TxInfo1.data[14] = buf[2];
	_TxInfo1.data[15] = D110VADBuf[2][D110VCnt[2]];//UserInf.CSID;
	_TxInfo1.data[16] = buf[3];
	_TxInfo1.data[17] = D110VADBuf[3][D110VCnt[3]];//UserInf.CSIID;
}

uint8_t I2CBuf[512];
///索引从0开始
void ReportPowOffData(int ClearData)
{
	#if OS_CRITICAL_METHOD == 3                     
			OS_CPU_SR  cpu_sr = 0;
#endif

	///用于 I2C 读取
	///uint8_t I2CBuf[512];
	
	int i,j;
	int cnt;
	int num1,num2;
	int index1,index2;
	uint16_t byteToRead=0;
	uint16_t readAddr=0;
	int totalCnt=0;
	int curIndex=0;

	OS_ENTER_CRITICAL();
	
	///全局变量，锁定 掉电串口关断操作：
	g_UsartRWPowOffComplete = 0;	
	
	///全局变量，锁定 I2C 操作：
	g_I2C_RdyF = 0;
	
	OS_EXIT_CRITICAL();

    totalCnt=RecInfo.TotNewRec>MAX_POW_DATA_CNT?MAX_POW_DATA_CNT:RecInfo.TotNewRec;
	curIndex=RecInfo.NextIndex<1?1:RecInfo.NextIndex;

	num1=totalCnt>curIndex-1?curIndex-1:totalCnt;
	index1=curIndex-num1;
	if(num1>0)
	{
		byteToRead=num1*16;
		readAddr= index1*16;
		BSP_ReadI2C1(I2CBuf,readAddr, &byteToRead);	

		for(i = 0; i < num1; i++)
		{
			for(j=0;j<16;j++)
			{
				_TxInfo1.data[i*16+j] = I2CBuf[(num1 - i - 1)*16+j];
			}		
		}
	}

	num2=totalCnt-num1;
	index2=MAX_POW_DATA_CNT+1-num2;
	if(num2>0)
	{
		byteToRead=num2*16;
		readAddr= index2*16;
		BSP_ReadI2C1(I2CBuf,readAddr, &byteToRead);

		for(i = 0; i < num2; i++)
		{
			for(j=0;j<16;j++)
			{
				_TxInfo1.data[num1*16+ i*16+j] = I2CBuf[(num2 - i - 1)*16+j];
			}
			
		}
	}

		cnt = 16 * totalCnt;

		_TxInfo1.len[0] = ((8 + cnt) >> 8) & 0xff;

		_TxInfo1.len[1] = (8 + cnt) & 0xff;

		Usart_TxDataHandler(COM1, &_TxInfo1);

		if(ClearData==1)
		{
		    RecInfo.NextIndex = 1;

		    RecInfo.TotNewRec = 0;
			   
		    RecInfo.Crc = Calc_CRCByte((uint8_t *)&(RecInfo.Flag[0]), 6);
			
		    RecInfo.Bk_NextIndex = RecInfo.NextIndex;
		    RecInfo.Bk_TotNewRec = RecInfo.TotNewRec;
		    RecInfo.Bk_Crc = RecInfo.Crc;
					
		    BSP_WriteI2C1((uint8_t *)&(RecInfo.Flag[0]), 0, sizeof(REC_INFO));			
		}				 

	    OS_ENTER_CRITICAL();

	    ///全局变量，解锁掉电串口关断操作：
        g_UsartRWPowOffComplete = 1;

	    ///全局变量，解锁 I2C 操作：
	    g_I2C_RdyF = 1;

	    OS_EXIT_CRITICAL();	
}





