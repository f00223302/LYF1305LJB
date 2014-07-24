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
///					USART2 ������
/////////////////////////////////////////////////////////////////////////////////////
void  AppTaskUsart3 (void *p_arg)
{
	(void)p_arg;
	
	///Ϊ֡�����������ַ��
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
    int N = 0;  //������ʱ����ģ���ɾ�����滻
	switch (Info->cmd)
	{	
		case CMD_ACK_MISC:

			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 2;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type =  N  ;     ///���Ź�ȷ�ϣ�����ԭҵ�����ͷ��أ������Ҫ�Ȼ�ȡԭ������������
			_TxInfo3.cmd = CMD_ACK_MISC;

			_TxInfo3.data[0] = N ;    ///�����������ֽ�
			_TxInfo3.data[1] = N ;    ///ԭ���ݵ�һ�ֽ�

			Usart_TxDataHandler(COM3, &_TxInfo3);

			break;

        ///��ʱ����Ҫ
        /**************************************
		case CMD_WRITE_CONFIG:   ///����  дͨ������

			_TxInfo6.len[0] = 0;
			_TxInfo6.len[1] = 8 + 2;
			_TxInfo6.src = AppInfo.BdAddr;
			_TxInfo6.src_len = 0;
			_TxInfo6.dst = _RxInfo6.src;
			_TxInfo6.dst_len = 0;
			_TxInfo6.type = CMD_ACK_MISC;
			_TxInfo6.cmd = CMD_ACK_MISC;

			_TxInfo6.data[0] = 2;
			_TxInfo6.data[1] = ParamBuf[4];/// ����

			Usart_TxDataHandler(COM6, &_TxInfo6);
		    break;
           *************************************/

		case CMD_INQUIRY_CONFIG:   ///��ȡ����  ��ͨ������

			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 20;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_ACK_MISC;
			_TxInfo3.cmd = CMD_ACK_CONFIG;

            ///110V
			_TxInfo3.data[0] = 0;             /// ��������ͬ  5��ͨ����ֱ��ƫ�ú�ϵ��
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

			_TxInfo3.data[0] = 0;         ///�����Ź��ģ�ѯ�ʺ�˵�ɸ����Լ���ʵ���޸�   ����һ������


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

			_TxInfo3.data[0] = N ;    ///�Լ�״̬(����RA/RB��A/B)  �����豸���忨����ͬ���ֽ�����ͬ������һ�����ݣ���

			Usart_TxDataHandler(COM3, &_TxInfo3);

			break;

		case CMD_RESET:        //����Ҫ�޸ģ�������

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
		
		case CMD_INQUIRY_VERSION:               ///��ѯ�汾�ţ�BIOS��APP
			
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

		case CMD_DOWN_FILE_DATA_FRAME:   ///�ļ�����


            /// ȷ����Ҫ�������Ϣ����
		    break;

		case CMD_INQUIRY_UPGRADE_STATUS:   ///��������״̬   0~4

			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 1;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_FIRMWARE;
			_TxInfo3.cmd = CMD_ACK_UPGRADE_STATUS;

            if(  1  ) ///�˴���"1"�����µ�"N"�����޸�
            {
			    _TxInfo3.data[0] = 0;     /// OK 
            }
			else if(  N  )
			{
				_TxInfo3.data[0] = 1;     /// ��������
			}
			else if(  N  )
			{
				_TxInfo3.data[0] = 2;     /// ����ʧ�� 
			}
			else if(  N  )
			{
				_TxInfo3.data[0] = 3;     /// ����֡����
			}
			else
		    {
				_TxInfo3.data[0] = 4;     /// δ�յ���������
		    }

			Usart_TxDataHandler(COM3, &_TxInfo3);

			break;

		case CMD_INQUIRY_WORK_INFO:   ///���忨��������

			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + N;  ///����һ�����ݣ�����
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_WORK_INFO;
			_TxInfo3.cmd = CMD_ACK_WORK_INFO;

			_TxInfo3.data[0] = 2;     /// ����
			_TxInfo3.data[N-1] = ParamBuf[4];

			Usart_TxDataHandler(COM3, &_TxInfo3);

		    break;

		case CMD_INQUIRY_110V_INFO:   ///�����ϴε�����Ϣ

			_TxInfo3.len[0] = 0;

			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_WORK_INFO;
			_TxInfo3.cmd = CMD_ACK_110V_INFO;

		    if(UserInf.PowOffFlag)  			///����
		    {
			    _TxInfo3.len[1] = 8 + 16 * N;   //N����
			
                ///0~15:��һ����¼
			    ///ʱ�����
			    _TxInfo3.data[0] = 2;          
			    _TxInfo3.data[1] = 2;          
			    _TxInfo3.data[2] = 2;
			    _TxInfo3.data[3] = 2;

			    ///�����
 			    _TxInfo3.data[4] = 2;          
			    _TxInfo3.data[5] = 2;
			    _TxInfo3.data[6] = 2;

			    ///���翪ʼ��Ĳ���ֵ
			    _TxInfo3.data[7] = 2;          
			    _TxInfo3.data[8] = 2;          
			    _TxInfo3.data[9] = 2;
			    _TxInfo3.data[10] = 2;
 			    _TxInfo3.data[11] = 2;          
			    _TxInfo3.data[12] = 2;
			    _TxInfo3.data[13] = 2;
			    _TxInfo3.data[14] = 2;
			    _TxInfo3.data[15] = 2;

                ///16~ N:�ڶ�����¼

		    }
		    else                               ///�޵���
		    {
			    _TxInfo3.len[1] = 8 + 1;
			    _TxInfo3.data[0] = 0; 
		    }

			Usart_TxDataHandler(COM3, &_TxInfo3);

		    break;

		case CMD_TIME_BROAD_CAST:   ///ʱ�Ӽ���̹㲥

		///����ʱ��������̣�������Ӧ��
		    break;

		case CMD_INQUIRY_TIME:      ///��ѯʱ��

			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 6;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_TIME;
			_TxInfo3.cmd = CMD_ACK_TIME;     ///ʱ�Ӳ�ѯӦ��

            ///�Ӵ��ڽ��յ���ʱ�Ӻ���̹㲥���ȡʱ����Ϣ�����ܻ��õ���ʱ�䣬����
			_TxInfo3.data[0] = 2;       ///��  ��ǰ���ȥ2000
			_TxInfo3.data[1] = 2;       ///��
			_TxInfo3.data[2] = 2;       ///��
			_TxInfo3.data[3] = 2;       ///ʱ
			_TxInfo3.data[4] = 2;       ///��
			_TxInfo3.data[5] = 2;       ///��

			Usart_TxDataHandler(COM3, &_TxInfo3);

		    break;

		case CMD_CALIBRATE_TIME:      ///ʱ��У׼

			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 2;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_TIME;
			_TxInfo3.cmd = CMD_ACK_MISC;      ///Ӧ��			

		    _TxInfo3.data[0] = 0x24;		     
		    _TxInfo3.data[1] = 2;             ///��  ȷ���Ƿ�Ҫ��ȥ2000

			Usart_TxDataHandler(COM3, &_TxInfo3);

		    break;

		case CMD_UPGRADE_FIRMWARE:     ///Ӧ�ó��򲻴�����������
		    break;

		case CMD_UPGRADE_DATA_FRAME:   ///������
		    break;

		case CMD_WRITE_PROTECTION:     ///flash����/����    
			_TxInfo3.len[0] = 0;
			_TxInfo3.len[1] = 8 + 1;
			_TxInfo3.src = AppInfo.BdAddr;
			_TxInfo3.src_len = 0;
			_TxInfo3.dst = _RxInfo3.src;
			_TxInfo3.dst_len = 0;
			_TxInfo3.type = CMD_TYPE_DEBUG;
			_TxInfo3.cmd = CMD_ACK_WRITE_PROTECTION;       ///Ӧ��			

			if(  1  )		///�˴���"1"���޸�		/// 0-OK   ����-���ϴ���
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

///�������� USART1
///����������













