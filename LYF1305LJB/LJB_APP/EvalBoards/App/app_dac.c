/*
	FileName : app_dac.c
	Description : 
		
		
	Created on 2013.07.30 by ZZP.
	
	Revision History:
	
*/
#include "app_cfg.h"
#include "app.h"
#include "bsp.h"
#include "app_dac.h"


uint16_t 		DacDataCnt = 0;
uint16_t		DacTotCnt = 0;
__IO uint8_t 	DacIndex = 0;
__IO uint8_t 	DacType = 0;
__IO uint8_t 	DacBufFull[2];
uint16_t 		DacBuf[2][DAC_BUF_SIZE];
uint16_t		DacBufLen[2];

uint16_t		*DacDataPtr;

void InitDacVar(void);
void PrepareDacDmaFrame(uint16_t *buf);
void Copy2DacBuf(uint16_t *buf, uint16_t len);


/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
///					Global function realizations
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////
///			DAC ������
//////////////////////////////////////
void  AppTaskDAC (void *p_arg)
{
	(void)p_arg;
	
	InitDacVar();

	while (DEF_TRUE){
		
		AppInfo.TaskDacCnt++;
				
		if ((DacType == DAC_OUT_FOREVER) || DacTotCnt){
			
			if (!DacBufFull[0]){
				
				PrepareDacDmaFrame(DacBuf[0]);
				DacBufFull[0] = 1;
			}
			else if (!DacBufFull[1]){
				
				PrepareDacDmaFrame(DacBuf[1]);
				DacBufFull[1] = 1;
			}
		}
	
		OSTimeDly(10);
	}
}


//////////////////////////////////////
///	��ʼ DAC ����
//////////////////////////////////////
/*
	���ڽ϶����ݣ�����׼�������� Data ����øú������䡣
	������ݺܳ�����׼����ǰ��֡���ݣ����øú�����ʼ������֡������Ҫ��������ú���
	PrepareDmaFrame ����
*/
uint8_t	StartDacXfer(uint8_t Type, uint16_t *Data, uint16_t DataCnt)
{
	uint8_t rep = 0;
	
	///Last xfer not completed.
	if (DacDataCnt)
		return 1;
	
	InitDacVar();
	
	DacType = Type;
	
	if (DacType == DAC_OUT_ONCE)
		DacTotCnt = DataCnt;
	else
		DacTotCnt = DAC_BUF_SIZE << 1;
	
	DacDataCnt = DacTotCnt;
	DacDataPtr = Data;
	
	if (DacTotCnt >= DAC_BUF_SIZE){
			
		Copy2DacBuf(DacBuf[0], DAC_BUF_SIZE);
		DacBufLen[0] = DAC_BUF_SIZE;
		DacBufFull[0] = 1;
		if (DacTotCnt >= DAC_BUF_SIZE){
				
			Copy2DacBuf(DacBuf[1], DAC_BUF_SIZE);
			DacBufLen[1] = DAC_BUF_SIZE;
			DacBufFull[1] = 1;
		}
		else if (DacTotCnt > 0){
				
			DacIndex = 1;
			rep = 1;
		}
	}
	else if (DacTotCnt > 0)
		rep = 1;
		
	if (rep){
		
		DacBufLen[DacIndex] = DacTotCnt;
		DacBufFull[DacIndex] = 1;
		Copy2DacBuf(DacBuf[DacIndex], DacTotCnt);
	}
	
	DacIndex = 0;
	
	///
	BSP_DAC_Start(DacBuf[0], DacBufLen[0]);
	
	return 0;
}

//////////////////////////////////////
///	��ֹ��ǰ DAC ����
//////////////////////////////////////
void StopDacXfer(void)
{
	DacBufFull[0] = 0;
	DacBufFull[1] = 0;
	
	InitDacVar();
}

//////////////////////////////////////
///DMA ����ж��е��ô˺���
//////////////////////////////////////
uint32_t DAC_CallBack(unsigned char Arg, void *ptr)
{
	DacBufFull[DacIndex] = 0;
	DacDataCnt -= DacBufLen[DacIndex];
	DacIndex++;
	DacIndex &= 0x01;
	if (DacBufFull[DacIndex])
		BSP_DAC_Start(DacBuf[DacIndex], DacBufLen[DacIndex]);
	else{
		
		///���ʱ���ر� TIM6		
		TIM_Cmd(TIM6, DISABLE);
		
		///δ�����꣬����δ׼��������
		if (DacType == DAC_OUT_FOREVER)
			return 1;
		if (DacDataCnt != 0)
			return 2;
	}
	
	return 0;
}



/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
///					Local function realizations
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////
///	��ʼ������
//////////////////////////////////////
void InitDacVar(void)
{
	DacTotCnt = 0;
	DacDataCnt = 0;
	DacIndex = 0;
	DacType = 0;
	DacBufFull[0] = 0;
	DacBufFull[1] = 0;
	DacBufLen[0] = 0;
	DacBufLen[1] = 0;
}

//////////////////////////////////////
///	׼������
//////////////////////////////////////
void PrepareDacDmaFrame(uint16_t *buf)
{
	uint16_t len;
	
	///ѭ�����ͻ�����̫��ʱ���ڴ˴�ͨ�����㡢���ȷ�����������֡��
	if (DacType == DAC_OUT_FOREVER){
		///Prepare data:
		///for (i = 0; i < DAC_BUF_SIZE; i++)
		///	buf[i] = ...
	}
	///
	else if (DacType == DAC_OUT_ONCE){
		
		///Prepare data:
		if (DacTotCnt >= DAC_BUF_SIZE)
			len = DAC_BUF_SIZE;
		else
			len = DacTotCnt;
		///for (i = 0; i < len; i++)
		///	buf[i] = ...
		
		DacTotCnt -= len;
	}
}


void Copy2DacBuf(uint16_t *buf, uint16_t len)
{
	memcpy(buf, DacDataPtr, len);
		
	DacTotCnt -= len;
	DacDataPtr += len;
}







