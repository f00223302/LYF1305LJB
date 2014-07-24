/*
	FileName : app_uart1.c
	Description : 

	Created on 2013.08.05 by ZZP.


	Revision History:
		2013.10.22: �����źż�¼�塣CPU_SAMPLE �� CPU_MAIN��
					������ʱ��USART1 ���� RA/RB��������ʽ��ȡ�����忨���ݡ����¼����CPU����״̬���ݡ�
					��¼���ư�ʱ��USART1 ���� LAIS��

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
	
	///Ϊ֡�����������ַ��
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
///�˴���Ϊ�˵���EEPROM����ʱ�ӵĴ�������   0x0A 0x0B  0x0C
		case 0x0A:   /// дEEPROM

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
		case 0x0C:   /// ��EEPROM��ı�־����

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

           //��д��ָ�룬���»����ַ�쳣
			//_TxInfo1.data = ReBuf;

		   //������ĸ�дָ���Ϊ��ֵ���Ӷ����ı�ָ��ָ�򣬾���֤û����
			for (i = 0; i < 16; i++)
			{
				_TxInfo1.data[i] = ReBuf[i];
			}

			Usart_TxDataHandler(COM1, &_TxInfo1);

		    break;

		case 0xCC:   /// ��EEPROM��ı�־����

			//_TxInfo1.len����������ж��и���
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_TYPE_WORK_INFO;
			_TxInfo1.cmd = CMD_ACK_110V_INFO;

			if(RecInfo.TotNewRec)///���µĵ����¼
			{ 
			    if (g_I2C_RdyF == 1)								//I2C����
			    {  
				    ReportPowOffData(0);
			    }
			}
			else///���� �ĵ����¼
			{	
				_TxInfo1.len[0] = 0;
				_TxInfo1.len[1] = 8 + 1;
				_TxInfo1.data[0] = 0;
			
				Usart_TxDataHandler(COM1, &_TxInfo1);
			}

		    break;
#endif

/****************************************************************/


		case CMD_RESET:        //����Ҫ�޸ģ�������
			
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

/**********Ϊ��JSCSH����ʱȥ��***************/
	//		Usart_TxDataHandler(COM1, &_TxInfo1);

			///Disable DOG feeding
			App_WaitForReset();

			break;

#if 0
		case CMD_WRITE_CONFIG:   /// 2 ����  дͨ������

			_TxInfo1.len[0] = 0;
			_TxInfo1.len[1] = 8 + 2;
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_ACK_MISC;
			_TxInfo1.cmd = CMD_ACK_MISC;

			_TxInfo1.data[0] = 2;
			_TxInfo1.data[1] = _RxInfo1.data[0];/// д�����еĵ�һ�ֽ�����

			Usart_TxDataHandler(COM1, &_TxInfo1);
			
			WriteChInfo();

		    break;

		case CMD_INQUIRY_CONFIG:   ///3 ��ȡ����  ��ͨ������

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

		case CMD_SELF_TEST: ///������ȷ��
			
			_TxInfo1.len[0] = 0;
			_TxInfo1.len[1] = 8 + 1;
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_TYPE_SELFTEST;    
			_TxInfo1.cmd = CMD_ACK_TEST_RESULT;

			_TxInfo1.data[0] = 0;         ///�����Ź��ģ�ѯ�ʺ�˵�ɸ����Լ���ʵ���޸�   ����һ������


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

			_TxInfo1.data[0] = 0 ;    ///�Լ�״̬(����RA/RB��A/B)  �����豸���忨����ͬ���ֽ�����ͬ������һ�����ݣ���

			Usart_TxDataHandler(COM1, &_TxInfo1);

			break;



		case CMD_INQUIRY_VERSION:               ///��ѯ�汾�ţ�BIOS��APP
			
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

		case CMD_DOWN_FILE_DATA_FRAME:	 ///�ļ�����
		
		
			/// ȷ����Ҫ�������Ϣ����
		    break;
		
		
		///��������״̬   0-OK	 1-��������    2-����ʧ��	 3-����֡����	4-δ�յ���������
		
			//BIOS ���������˴�Ӧ�ó���Ӧ��ɹ�
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

		case CMD_INQUIRY_WORK_INFO:   ///���忨��������  110Vͨ����ѹ

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


		case CMD_INQUIRY_110V_INFO:   ///�����ϴε�����Ϣ

			//_TxInfo1.len����������ж��и���
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_TYPE_WORK_INFO;
			_TxInfo1.cmd = CMD_ACK_110V_INFO;

			if(RecInfo.TotNewRec)///���µĵ����¼
			{ 
			    if (g_I2C_RdyF == 1)								//I2C����
			    {  
				    ReportPowOffData(1);
			    }
			}
			else///���� �ĵ����¼
			{	
				_TxInfo1.len[0] = 0;
				_TxInfo1.len[1] = 8 + 1;
				_TxInfo1.data[0] = 0;
			
				Usart_TxDataHandler(COM1, &_TxInfo1);
			}

		    break;


				case CMD_TIME_BROAD_CAST:	///ʱ�Ӽ���̹㲥

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

					///��Ӧ��
					break;


				case CMD_UPGRADE_FIRMWARE:	   ///Ӧ�ó��򲻴�����������
					break;
		
				case CMD_UPGRADE_DATA_FRAME:   ///������
					break;

#if 0		
				case CMD_DEBUG_SET_PARAM:	   ///����ͨ������

					_TxInfo1.len[0] = 0;
					_TxInfo1.len[1] = 8 + 2;
					_TxInfo1.src = AppInfo.BdAddr;
					_TxInfo1.src_len = 0;
					_TxInfo1.dst = _RxInfo1.src;
					_TxInfo1.dst_len = 0;
					_TxInfo1.type = CMD_TYPE_DEBUG;
					_TxInfo1.cmd = CMD_ACK_MISC;	   ///Ӧ��
		
					Calibrate(); //������
		
					break;
#endif
		
				///��ͨ������ֱ֮��ƫ��
		
				case CMD_DEBUG_READ_110V_ADC_OFFSET:	  ///��5��ͨ��ֱ��ƫ��

					_TxInfo1.len[0] = 0;
					_TxInfo1.len[1] = 8 + 10;
					_TxInfo1.src = AppInfo.BdAddr;
					_TxInfo1.src_len = 0;
					_TxInfo1.dst = _RxInfo1.src;
					_TxInfo1.dst_len = 0;
					_TxInfo1.type = CMD_TYPE_DEBUG;
					_TxInfo1.cmd = CMD_DEBUG_ACK_110V_ADC_OFFSET;		///Ӧ��
		
					///5��ͨ����ֱ��ƫ��
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
		
				///��ͨ������ֱ֮����ѹ
		
				case CMD_DEBUG_READ_110V_ADC_RES:	   ///��5��ͨ����ѹ

					_TxInfo1.len[0] = 0;
					_TxInfo1.len[1] = 8 + 10;
					_TxInfo1.src = AppInfo.BdAddr;
					_TxInfo1.src_len = 0;
					_TxInfo1.dst = _RxInfo1.src;
					_TxInfo1.dst_len = 0;
					_TxInfo1.type = CMD_TYPE_DEBUG;
					_TxInfo1.cmd = CMD_DEBUG_ACK_110V_ADC_RES;		 ///Ӧ��
		
					///5��ͨ����ֱ����ѹֵ
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
		case CMD_WRITE_PROTECTION:     ///flash����/����    

			_TxInfo1.len[0] = 0;
			_TxInfo1.len[1] = 8 + 1;
			_TxInfo1.src = AppInfo.BdAddr;
			_TxInfo1.src_len = 0;
			_TxInfo1.dst = _RxInfo1.src;
			_TxInfo1.dst_len = 0;
			_TxInfo1.type = CMD_TYPE_DEBUG;
			_TxInfo1.cmd = CMD_ACK_WRITE_PROTECTION;       ///Ӧ��			

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
		
			///��ֹ�������
			///OSSchedLock();
			
				for (j = 0; j < 128; j++)
					_TxInfo1.data[j] = ptr[j];
		
			///���¿����������
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

    //���յ��ֽڸߵ�˳������εģ���Ҫ��һ�����Ե�֪����ȷ��
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
	_TxInfo1.data[1] = ch ;	  ///��ʼͨ����
	
	Usart_TxDataHandler(COM1, &_TxInfo1);
	return;

_errHandler:  //Э������ʱû������Ӧ�Ĵ𸴣���ȷ���޸�
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
///������0��ʼ
void ReportPowOffData(int ClearData)
{
	#if OS_CRITICAL_METHOD == 3                     
			OS_CPU_SR  cpu_sr = 0;
#endif

	///���� I2C ��ȡ
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
	
	///ȫ�ֱ��������� ���紮�ڹضϲ�����
	g_UsartRWPowOffComplete = 0;	
	
	///ȫ�ֱ��������� I2C ������
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

	    ///ȫ�ֱ������������紮�ڹضϲ�����
        g_UsartRWPowOffComplete = 1;

	    ///ȫ�ֱ��������� I2C ������
	    g_I2C_RdyF = 1;

	    OS_EXIT_CRITICAL();	
}





