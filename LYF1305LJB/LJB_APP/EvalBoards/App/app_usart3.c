/*
	FileName : app_uart3.c
	Description : 

		UART3 is used as TAX frame 0x39 receiver .

	Created on 2013.10.11 by ZZP.


	Revision History:


*/
#include  <app_cfg.h>
#include  <includes.h>
#include "ucos_ii.h"
#include "app_usart3.h"
#include "app.h"
#include "miscfnx.h"
#include "bsp.h"



//////////////////////////////////////////////
///		USART functions and variables
//////////////////////////////////////////////
uint8_t		Usart3RxBuf[USART3_RX_BUF_SIZE];
uint8_t		Usart3TxBuf[USART3_TX_BUF_SIZE];

uint8_t		_tmpRxBuf3[USART3_RX_BUF_SIZE];
uint8_t		_tmpTxBuf3[USART3_TX_BUF_SIZE];
DATA_STRUCT _RxInfo3;
DATA_STRUCT _TxInfo3;


/////////////////////////////////////////////////////////////////////////////////////
///					USART2 任务函数
/////////////////////////////////////////////////////////////////////////////////////
void  AppTaskUsart3 (void *p_arg)
{
	(void)p_arg;
	
	///为帧缓冲区分配地址：
	_RxInfo3.data = _tmpRxBuf3;
	_TxInfo3.data = _tmpTxBuf3;

	while (DEF_TRUE){

		if (AppInfo.RdyFlag){
			
			Usart_RxDataHandler(COM3, &_RxInfo3);
			AppInfo.TaskUsartCnt[COM3]++;
		}
		OSTimeDly(10);
	}
}

void Usart3_RxFrameHandler(DATA_STRUCT *Info)
{
    int N = 0;  //当做临时代替的，待删除和替换
	switch (Info->cmd)
	{	
		case CMD_ACK_MISC:

			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 2;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type =  N  ;     ///经张工确认，根据原业务类型返回，因此需要先获取原来的命令类型
			_TxInfo3.cmd = CMD_ACK_MISC;

			_TxInfo3.data[0] = N ;    ///主机命令字字节
			_TxInfo3.data[1] = N ;    ///原数据第一字节

			Usart_TxDataHandler(COM3, &_TxInfo3);

			break;

        ///暂时不需要
        /**************************************
		case CMD_WRITE_CONFIG:   ///配置  写通道参数

			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 2;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_ACK_MISC;
			_TxInfo6.cmd = CMD_ACK_MISC;

			_TxInfo6.data[0] = 2;
			_TxInfo6.data[1] = ParamBuf[4];/// 待定

			Usart_TxDataHandler(COM6, &_TxInfo6);
		    break;
           *************************************/

		case CMD_INQUIRY_CONFIG:   ///读取配置  读通道参数

			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 20;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_ACK_MISC;
			_TxInfo3.cmd = CMD_ACK_CONFIG;

            ///110V
			_TxInfo3.data[0] = 0;             /// 待定，下同  5个通道的直流偏置和系数
			_TxInfo3.data[1] = ParamBuf[4];
			_TxInfo3.data[2] = ParamBuf[5];
			_TxInfo3.data[3] = ParamBuf[6];
			///ID110V
			_TxInfo3.data[4] = ParamBuf[7];
			_TxInfo3.data[5] = ParamBuf[8];
			_TxInfo3.data[6] = ParamBuf[9];
			_TxInfo3.data[7] = 1;
			///IID110V
			_TxInfo3.data[8] = ParamBuf[20];
			_TxInfo3.data[9] = ParamBuf[21];
			_TxInfo3.data[10] = ParamBuf[22];
			_TxInfo3.data[11] = ParamBuf[23];
			///CSID
			_TxInfo3.data[12] = ParamBuf[24];
			_TxInfo3.data[13] = ParamBuf[25];
			_TxInfo3.data[14] = ParamBuf[24];
			_TxInfo3.data[15] = ParamBuf[25];
			///CSIID
			_TxInfo3.data[16] = ParamBuf[24];
			_TxInfo3.data[17] = ParamBuf[25];
			_TxInfo3.data[18] = ParamBuf[24];
			_TxInfo3.data[19] = ParamBuf[25];

			Usart_TxDataHandler(COM3, &_TxInfo3);
		    break;

		case CMD_SELF_TEST: 
			
			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 1;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_SELFTEST;    
			_TxInfo3.cmd = CMD_ACK_TEST_RESULT;

			_TxInfo3.data[0] = 0;         ///参照张工的，询问后说可根据自己的实际修改   最少一个数据


			Usart_TxDataHandler(COM3, &_TxInfo3);

			break;

		case CMD_INQUIRY_TEST_RESULT:

			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 1;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_SELFTEST;    
			_TxInfo3.cmd = CMD_ACK_TEST_RESULT;

			_TxInfo3.data[0] = N ;    ///自检状态(包括RA/RB和A/B)  根据设备（板卡）不同，字节数不同（最少一个数据）。

			Usart_TxDataHandler(COM3, &_TxInfo3);

			break;

		case CMD_RESET:        //不需要修改，已完善

			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 2;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_SELFTEST;
			_TxInfo3.cmd = CMD_ACK_MISC;

			_TxInfo3.data[0] = 8;
			_TxInfo3.data[1] = 0; 
			Usart_TxDataHandler(COM3, &_TxInfo3);

			///Disable DOG feeding
			App_WaitForReset();

			break;
		
		case CMD_INQUIRY_VERSION:               ///查询版本号：BIOS和APP
			
			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 14;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_FIRMWARE;
			_TxInfo3.cmd = CMD_ACK_VERSION;
			///BIOS
			_TxInfo3.data[0] = 0;///
			_TxInfo3.data[1] = BIOS_SOFT_VER_MAIN;
			_TxInfo3.data[2] = BIOS_SOFT_VER_SUB;
			_TxInfo3.data[3] = 0x20;
			_TxInfo3.data[4] = BIOS_SOFT_VER_YEAR;
			_TxInfo3.data[5] = BIOS_SOFT_VER_MONTH;
			_TxInfo3.data[6] = BIOS_SOFT_VER_DATE;
			///APP
			_TxInfo3.data[7] = 1;
			_TxInfo3.data[8] = APP_SOFT_VER_MAIN;
			_TxInfo3.data[9] = APP_SOFT_VER_SUB;
			_TxInfo3.data[10] = 0x20;
			_TxInfo3.data[11] = APP_SOFT_VER_YEAR;
			_TxInfo3.data[12] = APP_SOFT_VER_MONTH;
			_TxInfo3.data[13] = APP_SOFT_VER_DATE;

			Usart_TxDataHandler(COM3, &_TxInfo3);

			break;

		case CMD_DOWN_FILE_DATA_FRAME:   ///文件下载


            /// 确认需要保存的信息内容
		    break;

		case CMD_INQUIRY_UPGRADE_STATUS:   ///报告升级状态   0~4

			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 1;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_FIRMWARE;
			_TxInfo3.cmd = CMD_ACK_UPGRADE_STATUS;

            if(  1  ) ///此处的"1"和以下的"N"均待修改
            {
			    _TxInfo3.data[0] = 0;     /// OK 
            }
			else if(  N  )
			{
				_TxInfo3.data[0] = 1;     /// 正在升级
			}
			else if(  N  )
			{
				_TxInfo3.data[0] = 2;     /// 升级失败 
			}
			else if(  N  )
			{
				_TxInfo3.data[0] = 3;     /// 数据帧错误
			}
			else
		    {
				_TxInfo3.data[0] = 4;     /// 未收到升级命令
		    }

			Usart_TxDataHandler(COM3, &_TxInfo3);

			break;

		case CMD_INQUIRY_WORK_INFO:   ///读板卡工作数据

			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + N;  ///最少一个数据，待定
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_WORK_INFO;
			_TxInfo3.cmd = CMD_ACK_WORK_INFO;

			_TxInfo3.data[0] = 2;     /// 待定
			_TxInfo3.data[N-1] = ParamBuf[4];

			Usart_TxDataHandler(COM3, &_TxInfo3);

		    break;

		case CMD_INQUIRY_110V_INFO:   ///报告上次掉电信息

			_TxInfo3.len[0] = 0;

			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_WORK_INFO;
			_TxInfo3.cmd = CMD_ACK_110V_INFO;

		    if(UserInf.PowOffFlag)  			///掉电
		    {
			    _TxInfo3.len[1] = 8 + 16 * N;   //N待定
			
                ///0~15:第一条记录
			    ///时间编码
			    _TxInfo3.data[0] = 2;          
			    _TxInfo3.data[1] = 2;          
			    _TxInfo3.data[2] = 2;
			    _TxInfo3.data[3] = 2;

			    ///公里标
 			    _TxInfo3.data[4] = 2;          
			    _TxInfo3.data[5] = 2;
			    _TxInfo3.data[6] = 2;

			    ///掉电开始后的采样值
			    _TxInfo3.data[7] = 2;          
			    _TxInfo3.data[8] = 2;          
			    _TxInfo3.data[9] = 2;
			    _TxInfo3.data[10] = 2;
 			    _TxInfo3.data[11] = 2;          
			    _TxInfo3.data[12] = 2;
			    _TxInfo3.data[13] = 2;
			    _TxInfo3.data[14] = 2;
			    _TxInfo3.data[15] = 2;

                ///16~ N:第二条记录

		    }
		    else                               ///无掉电
		    {
			    _TxInfo3.len[1] = 8 + 1;
			    _TxInfo3.data[0] = 0; 
		    }

			Usart_TxDataHandler(COM3, &_TxInfo3);

		    break;

		case CMD_TIME_BROAD_CAST:   ///时钟及里程广播

		///保存时间编码和里程，但无需应答
		    break;

		case CMD_INQUIRY_TIME:      ///查询时钟

			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 6;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_TIME;
			_TxInfo3.cmd = CMD_ACK_TIME;     ///时钟查询应答

            ///从串口接收到的时钟和里程广播里获取时间信息，可能还得递增时间，待定
			_TxInfo3.data[0] = 2;       ///年  当前年减去2000
			_TxInfo3.data[1] = 2;       ///月
			_TxInfo3.data[2] = 2;       ///日
			_TxInfo3.data[3] = 2;       ///时
			_TxInfo3.data[4] = 2;       ///分
			_TxInfo3.data[5] = 2;       ///秒

			Usart_TxDataHandler(COM3, &_TxInfo3);

		    break;

		case CMD_CALIBRATE_TIME:      ///时钟校准

			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 2;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_TIME;
			_TxInfo3.cmd = CMD_ACK_MISC;      ///应答			

		    _TxInfo3.data[0] = 0x24;		     
		    _TxInfo3.data[1] = 2;             ///年  确认是否要减去2000

			Usart_TxDataHandler(COM3, &_TxInfo3);

		    break;

		case CMD_UPGRADE_FIRMWARE:     ///应用程序不处理升级事项
		    break;

		case CMD_UPGRADE_DATA_FRAME:   ///不处理
		    break;

		case CMD_WRITE_PROTECTION:     ///flash解锁/上锁    
			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 1;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_DEBUG;
			_TxInfo3.cmd = CMD_ACK_WRITE_PROTECTION;       ///应答			

			if(  1  )		///此处的"1"待修改		/// 0-OK   其它-故障代码
			{
				_TxInfo3.data[0] = 0;
			}
			else               
			{
				_TxInfo3.data[0] = N;
			}
			
			Usart_TxDataHandler(COM3, &_TxInfo3);

		    break;			

		default:
			break;
	}
}

///发送例见 USART1
///。。。。。













