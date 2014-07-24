/*
	FileName : main.c
	Description : 
		This is the main unit of F205ZDC bios.
	Created on 2013.01.18 by ZZP.

	Revision History:
	
	2013.10.15: 
		修改为机车信号中 STM32F205RC、STM32F205ZE 系统 BIOS 程序。
		用法说明：
		1、根据 CPU 类型，在项目属性中选择 Device；
		2、在项目属性-C/C++页中，在 Define：栏中添加 CPU 名和板名称，
			CPU名称：USE_CPU_F205RC、USE_CPU_F205ZE
			板名称： 自定义
		3、根据需要更改 F205_Gpio.c, F205_Led.c, stm322xg_eval.h 中的定义；
		4、采用串口 6 传送数据，1帧最多接收 16KB 数据；
		5、FLASH 分配如下：
			SECTOR0-1: BIOS
			SECTOR2:   PARAMS（前 16 字节为 BIOS 版本号数据，其后 16 字节为 APP 版本号数据，其余留给应用程序）
			SECTOR3:   RSVD
			SECTOR4--: APP

*/
#include "stm32f2xx.h"
#include "core_cm3.h"
#include "string.h"

#include "F205_SysTick.h"
#include "F205_Led.h"
#include "F205_Gpio.h"
#include "F205_USART.h"
#include "stm322xg_eval.h"

#include "F205_Flash.h"


#define LJB_CPU

////////////////////////////////////////////////////////////////
///						Local variables
////////////////////////////////////////////////////////////////
pFunction Jump_To_Application;
uint32_t JumpAddress;

MY_INFO MyInfo;

uint8_t ParamBuf[16384];

///控制信号电子开关: LJB CPU
///////////////////////////////////////////////////
///串口断电
#define USART_CTRL_DISABLE			    	{GPIOA->BSRRL = GPIO_Pin_11; GPIOB->BSRRL = GPIO_Pin_9;}
///串口供电
#define USART_CTRL_ENABLE					{GPIOA->BSRRH = GPIO_Pin_11; GPIOB->BSRRH = GPIO_Pin_9;}

////////////////////////////////////////////////////////////////
///					Local function prototypes
////////////////////////////////////////////////////////////////
void InitInfo(void);
void GetParams(void);

////////////////////////////////////////////////////////////////
///					Functions realizations
////////////////////////////////////////////////////////////////
int main()
{
	__IO uint16_t i, DlyTm;
	uint8_t res;

	///1ms(1000 tick per second)
	F205_ConfigSysTick(1000);

	InitInfo();

	///不允许写/擦除 FLASH:
	FLASH_Lock();
	
	GetParams();
	
	F205_InitGpio();

	if (*(__IO uint32_t*)UPGRADE_FLAG_ADDRESS == UPGRADE_FLAG_DATA)
	{
		*(__IO uint32_t*)UPGRADE_FLAG_ADDRESS = 0x00000000;
		res = 1;
	}
	else
	{
	    res = F205_GetCapStatus();
	}
	
	if (res)
	{	
     	    ///串口供电
	    USART_CTRL_ENABLE;

	    ///需要将 USART 控制端设置成允许接收，禁止发送
	    F205_DisableUsartTx();

		F205_GetBdAddr();

	    //BIOS升级APP时指示灯
		F205_InitLED();
		F205_PowOnLedFlash();

		F205_InitUSART();

        //调试用
	    //printf("\n\rUSART Printf Example: retarget the C library printf function to the USART\n\r");

		MyInfo.RdyFlag = 1;
		MyInfo.DlyTm = 30000;

		MyInfo.SysTm = 0;
		while (MyInfo.SysTm < MyInfo.DlyTm)
		{
			F205_UsartRxData();
			res = F205_RxDataHandler();
			if (res == ACK_FLAG_EOF)       ///升级文件完成，退出
			{
				///等待最后字节发送完毕
				for (i = 0; i < 32768; i++)
					__NOP();

				break;
			}
		}			
		
		///恢复初始设置：关中断；
		F205_DisableUSART();
		//F205_DisableUSART1();

	}
    else	//BIOS不升级APP时指示灯
	{
	    STM_EVAL_LEDInit(LED12);
		      
	  	STM_EVAL_LEDOn(LED12);

  	    MyInfo.SysTm = 0;
	    //while (MyInfo.SysTm < 500){}

  	    STM_EVAL_LEDOff(LED12);

	    MyInfo.SysTm = 0;
	    //while (MyInfo.SysTm < 300){}


    	STM_EVAL_LEDInit(LED12);
		      
	  	STM_EVAL_LEDOn(LED12);

  	    MyInfo.SysTm = 0;
	    //while (MyInfo.SysTm < 500){}

  	    STM_EVAL_LEDOff(LED12);

	    MyInfo.SysTm = 0;
	    //while (MyInfo.SysTm < 300){}
	}

  	 USART_CTRL_DISABLE;

	///写保护：
	///F205_WriteProtection(BIOS_FLASH_SECTORS | APP_FLASH_SECTORS | PARAM_FLASH_SECTORS, 1);
	
	///不允许写/擦除 FLASH:
	FLASH_Lock();

	if (((*(__IO uint32_t*)APPLICATION_ADDRESS) & 0x2FFE0000) == 0x20000000)
	{
		///跳转到应用程序
    	JumpAddress = *(__IO uint32_t*) (APPLICATION_ADDRESS + 4);
    	Jump_To_Application = (pFunction) JumpAddress;

    	/* Initialize user application's Stack Pointer */
    	__set_MSP(*(__IO uint32_t*) APPLICATION_ADDRESS);

		///Jump to application
    	Jump_To_Application();
	}
}


void InitInfo(void)
{
	memset(&MyInfo, 0, sizeof(MyInfo));

	MyInfo.FirmType = APP_FIRM_TYPE;
	MyInfo.AckFlag = ACK_FLAG_NONE;
	MyInfo.TxRdy = 1;
}


void GetParams(void)
{
	uint8_t err = 0;
	uint16_t crc, tmp;
	uint32_t addr;

	addr = PARAMS_ADDRESS;
	
	F205_ReadParams(addr, &(ParamBuf[0]), 16);

	crc = Calc_CRCByte(ParamBuf, 14);

	tmp = ((uint16_t)ParamBuf[14] << 8) + ParamBuf[15];

	if ((crc != tmp) || (ParamBuf[0] != 0x61) || (ParamBuf[1] != 0x41) || \
		(ParamBuf[2] != 0x73) || (ParamBuf[3] != 0x86) || \
		(ParamBuf[4] != F205_BIOS_MAIN_VER) || (ParamBuf[5] != F205_BIOS_SUB_VER) || \
		(ParamBuf[6] != 0x20) || (ParamBuf[7] != F205_BIOS_YEAR) || \
		(ParamBuf[8] != F205_BIOS_MONTH) || (ParamBuf[9] != F205_BIOS_DATE))
	{	
		ParamBuf[0] = 0x61;
		ParamBuf[1] = 0x41;
		ParamBuf[2] = 0x73;
		ParamBuf[3] = 0x86;
	
		ParamBuf[4] = F205_BIOS_MAIN_VER;
		ParamBuf[5] = F205_BIOS_SUB_VER;
		ParamBuf[6] = 0x20;
		ParamBuf[7] = F205_BIOS_YEAR;
		ParamBuf[8] = F205_BIOS_MONTH;
		ParamBuf[9] = F205_BIOS_DATE;
	
		ParamBuf[10] = 0;
		ParamBuf[11] = 0;
		ParamBuf[12] = 0;
		ParamBuf[13] = 0;
		
		crc = Calc_CRCByte(ParamBuf, 14);
		ParamBuf[14] = crc >> 8;
		ParamBuf[15] = crc & 0xff;
	
		err = 1;
	}
	
	if (err)
	{		
		err = F205_WriteParams(addr, &(ParamBuf[0]), 16);

		if (err)
		{

		}
	}
#if 0
    if (err){
		
		err = F205_EraseSectors(PARAMS_START_SECTOR, PARAMS_END_SECTOR);

		if (!err){
			
			addr = PARAMS_ADDRESS;
			err = F205_WriteParams(addr, &(ParamBuf[0]), sizeof(ParamBuf));
			if (err){
			}
		}
	}
#endif
}

