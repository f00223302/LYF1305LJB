/*
    FileName : app.c
    Description :
            L1305 机车信号连接板应用软件
    Created on 2013.10.11 by ZZP.

    Revision History:


*/




/*
*********************************************************************************************************
*                                             INCLUDE FILES
*********************************************************************************************************
*/
#include  <app_cfg.h>
#include  <includes.h>
#include  <string.h>

#include  "bsp.h"
#include  "app.h"
#include  "MiscFnx.h"
#include "Usart_Common.h"
#include "F205_Flash.h"
#include "app_led.h"

//#include "app_hpi.h"


#if 1
#include  "app_usart1.h"
//#include  "app_usart1.c"
#endif

#if 0
#include  "app_usart2.h"
#include  "app_usart2.c"
#endif

#if 0
#include  "app_usart3.h"
#include  "app_usart3.c"
#endif

#if 0
#include  "app_usart4.h"
#include  "app_usart4.c"
#endif

#if 0
#include  "app_usart5.h"
#include  "app_usart5.c"
#endif

#if APP_USART_6_ENABLE
#include  "app_usart6.h"
//#include  "app_usart6.c"
#endif


#if APP_I2C_1_ENABLE
#include  "app_i2c1.h"
//#include  "app_i2c1.c"
#endif

#if 0
#include  "app_spi1.h"
#include  "app.spi1.c"
#endif

#if 0
#include  "app_can.h"
#include  "app_can.c"
#endif


#if APP_ADC_ENABLE
#include  "app_adc.h"
//#include  "app_adc.c"
#endif

#if 0
#include "app_dac.h"
#include "app_dac.c"
#endif

#if 0
#include "app_sd.h"
#include "app_sd.c"
#endif

#if 0
#include "app_rtc.h"
#include "app_rtc.c"
#endif

#if 0
#include "app_usb.c"
#endif




/*
*********************************************************************************************************
*                                            LOCAL DEFINES
*********************************************************************************************************
*/
#define TIME_5MINUTE_CNT        300000L



/*
*********************************************************************************************************
*                                       LOCAL GLOBAL VARIABLES
*********************************************************************************************************
*/

/* ----------------- APPLICATION GLOBALS ------------------ */
static  OS_STK          AppTaskStartStk[APP_TASK_START_STK_SIZE];

////////////////////////////////////////////////////////////////////////////
///                             USART 任务堆栈
////////////////////////////////////////////////////////////////////////////
#if APP_USART_1_ENABLE
static  OS_STK          AppTaskUsartStk_1[APP_TASK_USART_1_STK_SIZE];
#endif

#if APP_USART_2_ENABLE
static  OS_STK          AppTaskUsartStk_2[APP_TASK_USART_2_STK_SIZE];
#endif

#if APP_USART_3_ENABLE
static  OS_STK          AppTaskUsartStk_3[APP_TASK_USART_3_STK_SIZE];
#endif

#if APP_USART_4_ENABLE
static  OS_STK          AppTaskUsartStk_4[APP_TASK_USART_4_STK_SIZE];
#endif

#if APP_USART_5_ENABLE
static  OS_STK          AppTaskUsartStk_5[APP_TASK_USART_5_STK_SIZE];
#endif

#if APP_USART_6_ENABLE
static  OS_STK          AppTaskUsartStk_6[APP_TASK_USART_6_STK_SIZE];
#endif

////////////////////////////////////////////////////////////////////////////
///                         ADC数据处理任务堆栈
////////////////////////////////////////////////////////////////////////////
#if APP_ADC_ENABLE
static  OS_STK          AppTaskADCStk[APP_TASK_ADC_STK_SIZE];
#endif


////////////////////////////////////////////////////////////////////////////
///                         DAC 数据处理任务堆栈
////////////////////////////////////////////////////////////////////////////
#if APP_DAC_ENABLE
static  OS_STK          AppTaskDACStk[APP_TASK_DAC_STK_SIZE];
#endif

////////////////////////////////////////////////////////////////////////////
///                         I2C1 数据处理任务堆栈
////////////////////////////////////////////////////////////////////////////
#if APP_I2C_1_ENABLE
static  OS_STK          AppTaskI2C1Stk[APP_TASK_I2C_1_STK_SIZE];
#endif

////////////////////////////////////////////////////////////////////////////
///                         I2C2 数据处理任务堆栈
////////////////////////////////////////////////////////////////////////////
#if APP_I2C_2_ENABLE
static  OS_STK          AppTaskI2C2Stk[APP_TASK_I2C_2_STK_SIZE];
#endif

////////////////////////////////////////////////////////////////////////////
///                         I2C3 数据处理任务堆栈
////////////////////////////////////////////////////////////////////////////
#if APP_I2C_3_ENABLE
static  OS_STK          AppTaskI2C3Stk[APP_TASK_I2C_3_STK_SIZE];
#endif

////////////////////////////////////////////////////////////////////////////
///                         SPI1 数据处理任务堆栈
////////////////////////////////////////////////////////////////////////////
#if APP_SPI_1_ENABLE
static  OS_STK          AppTaskSPI1Stk[APP_TASK_SPI_1_STK_SIZE];
#endif

////////////////////////////////////////////////////////////////////////////
///                         SPI2 数据处理任务堆栈
////////////////////////////////////////////////////////////////////////////
#if APP_SPI_2_ENABLE
static  OS_STK          AppTaskSPI2Stk[APP_TASK_SPI_2_STK_SIZE];
#endif

////////////////////////////////////////////////////////////////////////////
///                         SPI3 数据处理任务堆栈
////////////////////////////////////////////////////////////////////////////
#if APP_SPI_3_ENABLE
static  OS_STK          AppTaskSPI3Stk[APP_TASK_SPI_3_STK_SIZE];
#endif

////////////////////////////////////////////////////////////////////////////
///                         CAN1 数据处理任务堆栈
////////////////////////////////////////////////////////////////////////////
#if APP_CAN_1_ENABLE
static  OS_STK          AppTaskCAN1Stk[APP_TASK_CAN_1_STK_SIZE];
#endif

////////////////////////////////////////////////////////////////////////////
///                         CAN2 数据处理任务堆栈
////////////////////////////////////////////////////////////////////////////
#if APP_CAN_2_ENABLE
static  OS_STK          AppTaskCAN2Stk[APP_TASK_CAN_2_STK_SIZE];
#endif

////////////////////////////////////////////////////////////////////////////
///                         RTC 数据处理任务堆栈
////////////////////////////////////////////////////////////////////////////
#if APP_RTC_ENABLE
static  OS_STK          AppTaskRTCStk[APP_TASK_RTC_STK_SIZE];
#endif

////////////////////////////////////////////////////////////////////////////
///                         USB 数据处理任务堆栈
////////////////////////////////////////////////////////////////////////////
#if APP_USB_ENABLE
static  OS_STK          AppTaskUSBStk[APP_TASK_USB_STK_SIZE];
#endif

////////////////////////////////////////////////////////////////////////////
///                         SD 数据处理任务堆栈
////////////////////////////////////////////////////////////////////////////
#if APP_SD_ENABLE
static  OS_STK          AppTaskSDStk[APP_TASK_SD_STK_SIZE];
#endif




////////////////////////////////////////////////////////////////////////////
///         应用程序用到的 SEM 定义：
////////////////////////////////////////////////////////////////////////////
#if APP_SD_ENABLE
OS_EVENT    *Sem_SD;
#if defined JLB_CPU_MAIN
OS_EVENT    *Sem_WriteSD;
#endif
#endif

#if APP_RTC_ENABLE
OS_EVENT    *Sem_RtcAlarm;
#endif


/*
*********************************************************************************************************
*                                         FUNCTION PROTOTYPES
*********************************************************************************************************
*/
//////////////////////////////////////////////
///     General functions and variables
//////////////////////////////////////////////
static  void  AppEventCreate            (void);
static  void  AppTaskStart              (void        *p_arg);
static  void  AppTaskCreate             (void);

void SetBSPInfo(void);

void TaskMonitor(void);

void GetParams(void);

APP_INFO    AppInfo;
LJBPOS_INFO    LJBPosInfo;//LJBPosInfo[2];
REC_INFO    RecInfo;

///my own definition

//定义掉电处理辅助相关变量
__IO uint8_t CompexInCnt;
__IO uint16_t PowOffTm;
__IO uint8_t CompCnt;
__IO uint8_t V110Ready;
__IO uint8_t TimeUsed;
__IO uint8_t PowF;
__IO uint8_t PosIndex = 0;

__IO uint8_t g_changed;

__IO uint8_t XferRecIndex; ///表示掉电数据读取位置

uint8_t CalibrationInfo[CHANNEL_COUNT_LIMIT][PARAMETER_BYTE_COUNT];



USER_INF   UserInf;   // 用户 信息



uint8_t LJBNowTime[6];


uint8_t ParamBuf[256];

__IO uint16_t Tm10ms = 0;
__IO uint16_t WkTime = 0;

__IO uint8_t  D110VADBuf[5][10]; //= {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
uint8_t       D110VCnt[10] = {0, 0, 0, 0, 0};

///全局变量，锁定 I2C 操作，避免掉电写数据和串口读写掉电信息发生冲突
uint8_t g_I2C_RdyF = 1;

///全局变量，用于 掉电 串口关断操作，避免串口任务因被迫强制关断而失败
uint8_t g_UsartRWPowOffComplete = 1;





/////////////////////////////////////////////////////////////////////////////////////////////
///                         Global function realizations
/////////////////////////////////////////////////////////////////////////////////////////////

///TICK: 1ms
///Tick 调用函数
void App_TimeTickFunc(void)
{
    if (AppInfo.RdyFlag)
    {

#if APP_USART_1_ENABLE
        AppInfo.UsartNoDataCnt[COM1]++;
#endif
#if APP_USART_2_ENABLE
        AppInfo.UsartNoDataCnt[COM2]++;
#endif
#if APP_USART_3_ENABLE
        AppInfo.UsartNoDataCnt[COM3]++;
#endif
#if APP_USART_4_ENABLE
        AppInfo.UsartNoDataCnt[COM4]++;
#endif
#if APP_USART_5_ENABLE
        AppInfo.UsartNoDataCnt[COM5]++;
#endif
#if APP_USART_6_ENABLE
        AppInfo.UsartNoDataCnt[COM6]++;
#endif

        Tm10ms++;


        //掉电处理

#if 0
        PowOffTm++;

        if (UserInf.PowOffFlag)       // 掉电
        {
            CompexInCnt = 0;
            CompCnt++;

            if (CompCnt >= 5)
            {
                CompCnt = 0;
                //   ADC10Data = ADC10Temp >> 2;

                if (V110Ready)
                {
                    V110Ready = 0;

                    if (!PowF) ///if (TimeUsed && (!PowF))  //TimeUsed待确认是否删除
                    {
                        PowF = 1;
                        PowOffTm = 0;
                    }
                }
            }
        }
        else
        {
            CompCnt = 0;
            CompexInCnt++;

            if (CompexInCnt >= 5)//100)
            {
                //   ADC10Data = ADC10Temp >> 2;
                CompexInCnt = 0;
                V110Ready = 1;
            }
        }


        //5ms定时处理

        if (Tm10ms == 5)
        {
            if(UserInf.PowOffFlag)
            {
                //PowOffHandler();          // 掉电数据处理
            }

            //Usart6_TxDeal();     //待修改完善
        }
#endif

        /*************************************************************/
//此处参照智能传感器

        if (Tm10ms == 10)
        {
            if (AppInfo.NowTime[0] == 0xffffffff)
            {
                AppInfo.NowTime[0] = 0;
                AppInfo.NowTime[1]++;
            }
            else
            {
                AppInfo.NowTime[0]++;
            }
        }

        /*************************************************************/

        if (Tm10ms == 50)
        {
            Tm10ms = 0;  //这里清零对掉电计时是否有影响，待确认

            D110VADBuf[4][D110VCnt[4]] = UserInf.D110V;


            if(UserInf.PowOffFlag)// 进入掉电处理
            {
                D110VADBuf[4][D110VCnt[4]] = UserInf.D110V;

                PowOffHandler();
            }


            if(D110VCnt[4] > 8)
            {
                D110VCnt[4] = 0;
            }
            else
            {
                D110VCnt[4] ++;
            }


            D110VADBuf[0][D110VCnt[0]] = UserInf.ID110V;

            if(D110VCnt[0] > 8)
            {
                D110VCnt[0] = 0;
            }
            else
            {
                D110VCnt[0] ++;
            }

            D110VADBuf[1][D110VCnt[1]] = UserInf.IID110V;

            if(D110VCnt[1] > 8)
            {
                D110VCnt[1] = 0;
            }
            else
            {
                D110VCnt[1] ++;
            }

            D110VADBuf[2][D110VCnt[2]] = UserInf.CSID;

            if(D110VCnt[2] > 8)
            {
                D110VCnt[2] = 0;
            }
            else
            {
                D110VCnt[2] ++;
            }

            D110VADBuf[3][D110VCnt[3]] = UserInf.CSIID;

            if(D110VCnt[3] > 8)
            {
                D110VCnt[3] = 0;
            }
            else
            {
                D110VCnt[3] ++;
            }

        }

        LedHandler();
    }
}

void App_WaitForReset(void)
{
    AppInfo.ResetF = 1;
}



/*
*********************************************************************************************************
*                                                main()
*
* Description : This is the standard entry point for C code.  It is assumed that your code will call
*               main() once you have performed all necessary initialization.
*
* Arguments   : none
*
* Returns     : none
*********************************************************************************************************
*/

int main(void)
{
#if (OS_TASK_NAME_EN > 0)
    CPU_INT08U  err;
#endif

 int size=sizeof(REC_INFO);
 if(size!=16)
 	{
 	
 	}
    BSP_IntDisAll();                                            /* Disable all interrupts.                              */

    ///初始化应用程序变量
    App_InitInfo();

    ///初始化串口通用变量
    Usart_InitInfo();

    ///初始化 CAN 变量
#if APP_CAN_1_ENABLE
    InitCanParams();
#endif

    ///初始化硬件结构：
    BSP_InitInfo();

    ///设置硬件结构对应的缓冲区：
    SetBSPInfo();

    BSP_FeedDog();
    BSP_FeedDog();

    CPU_Init();                                                 /* Initialize uC/CPU services.                          */

    OSInit();                                                   /* Initialize "uC/OS-II, The Real-Time Kernel"          */

    ///硬件初始化
    BSP_Init();                                                 /* Init BSP fncts.                                      */

#if APP_CAN_1_ENABLE
    BSP_InitCan(CAN_1, &CanInit[0], &CanFilterInit[0]);
#endif

    OSTaskCreateExt((void (*)(void *)) AppTaskStart,            /* Create the start task                                */
                    (void           *) 0,
                    (OS_STK         *)&AppTaskStartStk[APP_TASK_START_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_START_PRIO,
                    (INT16U          ) APP_TASK_START_PRIO,
                    (OS_STK         *)&AppTaskStartStk[0],
                    (INT32U          ) APP_TASK_START_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_START_PRIO, (uint8_t *)"Start", &err);
#endif

    BSP_FeedDog();

    OSStart();                                                  /* Start multitasking (i.e. give control to uC/OS-II)   */

    return (1);
}

/*
*********************************************************************************************************
*                                          STARTUP TASK
*
* Description : This is an example of a startup task.  As mentioned in the book's text, you MUST
*               initialize the ticker only once multitasking has started.
*
* Arguments   : p_arg   is the argument passed to 'AppTaskStart()' by 'OSTaskCreate()'.
*
* Returns     : none
*
* Notes       : 1) The first line of code is used to prevent a compiler warning because 'p_arg' is not
*                  used.  The compiler should not generate any code for this statement.
*********************************************************************************************************
*/

static  void  AppTaskStart (void *p_arg)
{

    (void)p_arg;

    BSP_FeedDog();

    ///点亮所有灯：
    BSP_LED_On(LED_ALL);

    SetAppParams();

    ///Modifiled 20140328
    SetChParams();

    BSP_FeedDog();


    CPU_Init();                                                 /* Init CPU name & int. dis. time measuring fncts.          */

    Mem_Init();                                                 /* Initialize Memory managment                              */

    BSP_CPU_TickInit();                                         /* Start Tick Initialization                                */


#if (OS_TASK_STAT_EN > 0)
    OSStatInit();                                               /* Determine CPU capacity                                   */
#endif

#if (APP_CFG_SERIAL_EN == DEF_ENABLED)

#endif

    APP_TRACE_INFO(("Creating Application Events...\n\r"));
    AppEventCreate();                                           /* Create Application Events                                */

    APP_TRACE_INFO(("Creating Application Tasks...\n\r"));
    AppTaskCreate();                                            /* Create application Tasks                                 */

    BSP_FeedDog();

    ///延时1s：
    OSTimeDly(1000);
	
    BSP_FeedDog();

    ///熄灭所有灯：
    BSP_LED_Off(LED_ALL);

    ///延时1s：
    OSTimeDly(1000);

    BSP_FeedDog();

#if defined JLB_CPU_SAMPLE
    ///
#elif defined JLB_CPU_MAIN
    ///点亮工作灯：
    BSP_LED_On(LED_WORK);
    ///
    GetSdInfo();
#endif

    GetParams();

    //检测通过I2C记录在EEPROM里的标志数据
    CheckRecInfo();

    ///
    AppInfo.RdyFlag = 1;

    ///Test only
    //  TestWriteInfo();

    while (DEF_TRUE)
    {
        /* Task body, always written as an infinite loop.           */
        TaskMonitor();

#if APP_USART_1_ENABLE
        if (AppInfo.UsartNoDataCnt[COM1] >= TIME_5MINUTE_CNT)
        {
            AppInfo.ResetF = 1;
            AppInfo.UsartNoDataCnt[COM1] = 0;
        }
#endif

#if APP_USART_2_ENABLE
        if (AppInfo.UsartNoDataCnt[COM2] >= TIME_5MINUTE_CNT)
        {
            AppInfo.ResetF = 1;
            AppInfo.UsartNoDataCnt[COM2] = 0;
        }
#endif

#if APP_USART_3_ENABLE
        if (AppInfo.UsartNoDataCnt[COM3] >= TIME_5MINUTE_CNT)
        {
            AppInfo.ResetF = 1;
            AppInfo.UsartNoDataCnt[COM3] = 0;
        }
#endif

#if APP_USART_4_ENABLE
        if (AppInfo.UsartNoDataCnt[COM4] >= TIME_5MINUTE_CNT)
        {
            AppInfo.ResetF = 1;
            AppInfo.UsartNoDataCnt[COM4] = 0;
        }
#endif

#if APP_USART_5_ENABLE
        if (AppInfo.UsartNoDataCnt[COM5] >= TIME_5MINUTE_CNT)
        {
            AppInfo.ResetF = 1;
            AppInfo.UsartNoDataCnt[COM5] = 0;
        }
#endif

///Modifiled by me 20140327
#if 0
#if APP_USART_6_ENABLE
        if (AppInfo.UsartNoDataCnt[COM6] >= TIME_5MINUTE_CNT)
        {
            AppInfo.ResetF = 1;
            AppInfo.UsartNoDataCnt[COM6] = 0;
        }
#endif
#endif


        ///Feed Dog
        if (!AppInfo.ResetF)
        {
            BSP_FeedDog();
        }

#if 0
        if (AppInfo.WriteFlag)
        {
            App_Usart_WriteInfo();//待完善

            //   SetChParams();

            AppInfo.WriteFlag = 0;
        }
#endif

        AppInfo.CpuUsage = OSCPUUsage;

        OSTimeDly(10);
    }
}

/*
*********************************************************************************************************
*                                      AppTaskEventCreate()
*
* Description : Create the application Events
*
* Argument(s) : none.
*
* Return(s)   : none.
*
* Caller(s)   : App_TasStart()
*
* Note(s)     : none.
*********************************************************************************************************
*/

static  void  AppEventCreate (void)
{
#if APP_SD_ENABLE
#if defined JLB_CPU_MAIN
    Sem_WriteSD = OSSemCreate(0);
#endif
    Sem_SD = OSSemCreate(0);
#endif

#if APP_RTC_ENABLE
    Sem_RtcAlarm = OSSemCreate(0);
#endif
}


/*
*********************************************************************************************************
*                                      AppTaskCreate()
*
* Description : Create the application tasks.
*
* Argument(s) : none.
*
* Return(s)   : none.
*
* Caller(s)   : App_TasStart()
*
* Note(s)     : none.
*********************************************************************************************************
*/

static  void  AppTaskCreate (void)
{
#if (OS_TASK_NAME_EN > 0)
    CPU_INT08U  err;
#endif

    ///////////////////////////////////////////////////////////////////////////////////////////
    ///                             Create USART TASK
    ///////////////////////////////////////////////////////////////////////////////////////////
#if APP_USART_1_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskUsart1,            ///Create the Usart task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskUsartStk_1[APP_TASK_USART_1_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_USART_1_PRIO,
                    (INT16U          ) APP_TASK_USART_1_PRIO,
                    (OS_STK         *)&AppTaskUsartStk_1[0],
                    (INT32U          ) APP_TASK_USART_1_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_USART_1_PRIO, (unsigned char *)"Usart1", &err);
#endif
#endif

#if APP_USART_2_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskUsart2,            ///Create the Usart task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskUsartStk_1[APP_TASK_USART_2_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_USART_2_PRIO,
                    (INT16U          ) APP_TASK_USART_2_PRIO,
                    (OS_STK         *)&AppTaskUsartStk_2[0],
                    (INT32U          ) APP_TASK_USART_2_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_USART_2_PRIO, (unsigned char *)"Usart2", &err);
#endif
#endif

#if APP_USART_3_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskUsart3,            ///Create the Usart task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskUsartStk_3[APP_TASK_USART_3_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_USART_3_PRIO,
                    (INT16U          ) APP_TASK_USART_3_PRIO,
                    (OS_STK         *)&AppTaskUsartStk_3[0],
                    (INT32U          ) APP_TASK_USART_3_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_USART_3_PRIO, (unsigned char *)"Usart3", &err);
#endif
#endif

#if APP_USART_4_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskUsart4,            ///Create the Usart task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskUsartStk_4[APP_TASK_USART_4_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_USART_4_PRIO,
                    (INT16U          ) APP_TASK_USART_4_PRIO,
                    (OS_STK         *)&AppTaskUsartStk_4[0],
                    (INT32U          ) APP_TASK_USART_4_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_USART_4_PRIO, (unsigned char *)"Usart4", &err);
#endif
#endif

#if APP_USART_5_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskUsart5,            ///Create the Usart task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskUsartStk_5[APP_TASK_USART_5_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_USART_5_PRIO,
                    (INT16U          ) APP_TASK_USART_5_PRIO,
                    (OS_STK         *)&AppTaskUsartStk_5[0],
                    (INT32U          ) APP_TASK_USART_5_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_USART_5_PRIO, (unsigned char *)"Usart5", &err);
#endif
#endif

#if APP_USART_6_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskUsart6,            ///Create the Usart task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskUsartStk_6[APP_TASK_USART_6_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_USART_6_PRIO,
                    (INT16U          ) APP_TASK_USART_6_PRIO,
                    (OS_STK         *)&AppTaskUsartStk_6[0],
                    (INT32U          ) APP_TASK_USART_6_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_USART_6_PRIO, (unsigned char *)"Usart6", &err);
#endif
#endif


///////////////////////////////////////////////////////////////////////////////////////////
///                             Create ADC TASK
///////////////////////////////////////////////////////////////////////////////////////////
#if APP_ADC_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskADC,            ///Create the ADC task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskADCStk[APP_TASK_ADC_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_ADC_PRIO,
                    (INT16U          ) APP_TASK_ADC_PRIO,
                    (OS_STK         *)&AppTaskADCStk[0],
                    (INT32U          ) APP_TASK_ADC_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_ADC_PRIO, (unsigned char *)"ADC", &err);
#endif
#endif

///////////////////////////////////////////////////////////////////////////////////////////
///                             Create DAC TASK
///////////////////////////////////////////////////////////////////////////////////////////
#if APP_DAC_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskDAC,            ///Create the DAC task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskDACStk[APP_TASK_DAC_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_DAC_PRIO,
                    (INT16U          ) APP_TASK_DAC_PRIO,
                    (OS_STK         *)&AppTaskDACStk[0],
                    (INT32U          ) APP_TASK_DAC_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_DAC_PRIO, (unsigned char *)"DAC", &err);
#endif
#endif

///////////////////////////////////////////////////////////////////////////////////////////
///                             Create RTC TASK
///////////////////////////////////////////////////////////////////////////////////////////
#if APP_RTC_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskRTC,            ///Create the RTC task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskADCStk[APP_TASK_RTC_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_RTC_PRIO,
                    (INT16U          ) APP_TASK_RTC_PRIO,
                    (OS_STK         *)&AppTaskRTCStk[0],
                    (INT32U          ) APP_TASK_RTC_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_RTC_PRIO, (unsigned char *)"RTC", &err);
#endif
#endif

///////////////////////////////////////////////////////////////////////////////////////////
///                             Create I2C TASK
///////////////////////////////////////////////////////////////////////////////////////////
#if APP_I2C_1_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskI2C1,            ///Create the I2C_1 task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskI2C1Stk[APP_TASK_I2C_1_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_I2C_1_PRIO,
                    (INT16U          ) APP_TASK_I2C_1_PRIO,
                    (OS_STK         *)&AppTaskI2C1Stk[0],
                    (INT32U          ) APP_TASK_I2C_1_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_I2C_1_PRIO, (unsigned char *)"I2C_1", &err);
#endif
#endif

///////////////////////////////////////////////////////////////////////////////////////////
///                             Create SPI TASK
///////////////////////////////////////////////////////////////////////////////////////////
#if APP_SPI_1_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskSPI1,            ///Create the SPI_1 task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskSPI1Stk[APP_TASK_SPI_1_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_SPI_1_PRIO,
                    (INT16U          ) APP_TASK_SPI_1_PRIO,
                    (OS_STK         *)&AppTaskSPI1Stk[0],
                    (INT32U          ) APP_TASK_SPI_1_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_SPI_1_PRIO, (unsigned char *)"SPI_1", &err);
#endif
#endif

///////////////////////////////////////////////////////////////////////////////////////////
///                             Create CAN TASK
///////////////////////////////////////////////////////////////////////////////////////////
#if APP_CAN_1_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskCAN1,            ///Create the CAN_1 task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskCAN1Stk[APP_TASK_CAN_1_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_CAN_1_PRIO,
                    (INT16U          ) APP_TASK_CAN_1_PRIO,
                    (OS_STK         *)&AppTaskCAN1Stk[0],
                    (INT32U          ) APP_TASK_CAN_1_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_CAN_1_PRIO, (unsigned char *)"CAN_1", &err);
#endif
#endif


#if APP_CAN_2_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskCAN2,            ///Create the CAN_2 task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskCAN2Stk[APP_TASK_CAN_2_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_CAN_2_PRIO,
                    (INT16U          ) APP_TASK_CAN_2_PRIO,
                    (OS_STK         *)&AppTaskCAN2Stk[0],
                    (INT32U          ) APP_TASK_CAN_2_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_CAN_2_PRIO, (unsigned char *)"CAN_2", &err);
#endif
#endif

///////////////////////////////////////////////////////////////////////////////////////////
///                             Create USB TASK
///////////////////////////////////////////////////////////////////////////////////////////
#if APP_USB_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskUSB,            ///Create the USB task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskUSBStk[APP_TASK_USB_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_USB_PRIO,
                    (INT16U          ) APP_TASK_USB_PRIO,
                    (OS_STK         *)&AppTaskUSBStk[0],
                    (INT32U          ) APP_TASK_USB_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_USB_PRIO, (unsigned char *)"USB", &err);
#endif
#endif

///////////////////////////////////////////////////////////////////////////////////////////
///                             Create SD TASK
///////////////////////////////////////////////////////////////////////////////////////////
#if APP_SD_ENABLE
    OSTaskCreateExt((void (*)(void *)) AppTaskSD,            ///Create the SD task
                    (void           *) 0,
                    (OS_STK         *)&AppTaskADCStk[APP_TASK_SD_STK_SIZE - 1],
                    (INT8U           ) APP_TASK_SD_PRIO,
                    (INT16U          ) APP_TASK_SD_PRIO,
                    (OS_STK         *)&AppTaskSDStk[0],
                    (INT32U          ) APP_TASK_SD_STK_SIZE,
                    (void           *) 0,
                    (INT16U          )(OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR));

#if (OS_TASK_NAME_EN > 0)
    OSTaskNameSet(APP_TASK_SD_PRIO, (unsigned char *)"SD", &err);
#endif
#endif
}







/*
*********************************************************************************************************
                                设置驱动程序结构变量：缓冲区分配
*********************************************************************************************************
*/
void SetBSPInfo(void)
{

    ////////////////////////////////////////////////////////////
    ///                 设置 ADC 缓冲区参数
    ////////////////////////////////////////////////////////////
#if APP_ADC_ENABLE
    BSP_Info.ADCBuf[0] = AdcBuf;
    ///ADC中断由 TIM3 触发：
    BSP_Info.Tm3CallBack = &Adc_Tm3CallBack;
#endif

    ////////////////////////////////////////////////////////////
    ///                 设置 DAC 缓冲区参数
    ////////////////////////////////////////////////////////////
#if APP_DAC_ENABLE
    ///DAC 1
    BSP_Info.DACBuf[0] = &(DacBuf[0][0]);
    BSP_Info.DACCallBack = &DAC_CallBack;
#endif


    ////////////////////////////////////////////////////////////
    ///                 设置串口缓冲区参数
    ////////////////////////////////////////////////////////////

#if APP_USART_1_ENABLE
    BSP_Info.UsartRxBuf[COM1] = Usart1RxBuf;
    BSP_Info.UsartTxBuf[COM1] = Usart1TxBuf;
    BSP_Info.UsartRxBufMask[COM1] = USART1_RX_BUF_MASK;
    BSP_Info.UsartTxBufMask[COM1] = USART1_TX_BUF_MASK;
#endif

#if APP_USART_2_ENABLE
    BSP_Info.UsartRxBuf[COM2] = Usart2RxBuf;
    BSP_Info.UsartTxBuf[COM2] = Usart2TxBuf;
    BSP_Info.UsartRxBufMask[COM2] = USART2_RX_BUF_MASK;
    BSP_Info.UsartTxBufMask[COM2] = USART2_TX_BUF_MASK;
#endif

#if APP_USART_3_ENABLE
    BSP_Info.UsartRxBuf[COM3] = Usart3RxBuf;
    BSP_Info.UsartTxBuf[COM3] = Usart3TxBuf;
    BSP_Info.UsartRxBufMask[COM3] = USART3_RX_BUF_MASK;
    BSP_Info.UsartTxBufMask[COM3] = USART3_TX_BUF_MASK;
#endif

#if APP_USART_4_ENABLE
    BSP_Info.UsartRxBuf[COM4] = Usart4RxBuf;
    BSP_Info.UsartRxBufMask[COM4] = USART4_RX_BUF_MASK;

    BSP_Info.UsartTxBuf[COM4] = Usart4TxBuf;
    BSP_Info.UsartTxBufMask[COM4] = USART4_TX_BUF_MASK;
#endif

#if APP_USART_5_ENABLE
    BSP_Info.UsartRxBuf[COM5] = Usart5RxBuf;
    BSP_Info.UsartTxBuf[COM5] = Usart5TxBuf;
    BSP_Info.UsartRxBufMask[COM5] = USART5_RX_BUF_MASK;
    BSP_Info.UsartTxBufMask[COM5] = USART5_TX_BUF_MASK;
#endif

#if APP_USART_6_ENABLE
    BSP_Info.UsartRxBuf[COM6] = Usart6RxBuf;
    BSP_Info.UsartTxBuf[COM6] = Usart6TxBuf;
    BSP_Info.UsartRxBufMask[COM6] = USART6_RX_BUF_MASK;
    BSP_Info.UsartTxBufMask[COM6] = USART6_TX_BUF_MASK;
#endif



    ////////////////////////////////////////////////////////////
    ///                 设置 I2C 缓冲区参数
    ////////////////////////////////////////////////////////////
#if APP_I2C_1_ENABLE
#endif

#if APP_I2C_2_ENABLE
#endif

#if APP_I2C_3_ENABLE
#endif

    ////////////////////////////////////////////////////////////
    ///                 设置 SPI 缓冲区参数
    ////////////////////////////////////////////////////////////
#if APP_SPI_1_ENABLE
#endif

#if APP_SPI_2_ENABLE
#endif

#if APP_SPI_3_ENABLE
#endif

    ////////////////////////////////////////////////////////////
    ///                 设置 CAN 缓冲区参数
    ////////////////////////////////////////////////////////////
#if APP_CAN_1_ENABLE
    BSP_Info.CanInit[0] = &CanInit[0];
    BSP_Info.FilterInit[0] = &CanFilterInit[0];

    BSP_Info.CanRxMsgPtr[0] = CanRxFrame[0];
    BSP_Info.CanTxMsgPtr[0] = CanTxFrame[0];
    BSP_Info.CanRxMsgMask[0] = CAN_RX_FRAME_MASK;
    BSP_Info.CanTxMsgMask[0] = CAN_TX_FRAME_MASK;

    BSP_Info.CANCallBack = &CAN_CallBack;
#endif

#if APP_CAN_2_ENABLE
    BSP_Info.CanInit[1] = &CanInit[1];
    BSP_Info.FilterInit[1] = &CanFilterInit[1];

    BSP_Info.CanRxMsgPtr[1] = CanRxFrame[1];
    BSP_Info.CanTxMsgPrt[1] = CanTxFrame[1];
    BSP_Info.CanRxMsgMask[1] = CAN_RX_FRAME_MASK;
    BSP_Info.CanTxMsgMask[1] = CAN_TX_FRAME_MASK;
    if (!BSP_Info.CANCallBack)
        BSP_Info.CANCallBack = &CAN_CallBack;
#endif

    ////////////////////////////////////////////////////////////
    ///                 设置 RTC 参数
    ////////////////////////////////////////////////////////////
#if APP_RTC_ENABLE
    BSP_Info.RTCCalBack = &App_RTC_Callback;
#endif

    ////////////////////////////////////////////////////////////
    ///                 设置 USB 参数
    ////////////////////////////////////////////////////////////
#if APP_USB_ENABL
#endif

    ////////////////////////////////////////////////////////////
    ///                 设置 SDIO 参数
    ////////////////////////////////////////////////////////////
#if APP_SDIO_ENABLE
    BSP_Info.SDCallBack = &SD_CallBack;
#endif

    ////////////////////////////////////////////////////////////
    ///                 设置 EXTI9_5 参数
    ////////////////////////////////////////////////////////////
#if APP_EXTI9_5_ENABLE
    BSP_Info.EXTI9_5_CallBack = &HPI_CallBack;
#endif
}



/*
*********************************************************************************************************
                                任务监控
*********************************************************************************************************
*/
void TaskMonitor(void)
{
    ///判断其他任务运行状态
    WkTime++;
    if (WkTime >= 250) ///5s
    {

#if APP_USART_1_ENABLE
        if (AppInfo.TaskUsartCnt[COM1] < 10)
        {
            AppInfo.ResetF = 1;
        }
#endif

#if APP_USART_2_ENABLE
        if (AppInfo.TaskUsartCnt[COM2] < 10)
            AppInfo.ResetF = 1;
#endif

#if APP_USART_3_ENABLE

        if (AppInfo.TaskUsartCnt[COM3] < 10)
            AppInfo.ResetF = 1;
#endif

#if APP_USART_4_ENABLE
        if (AppInfo.TaskUsartCnt[COM4] < 10)
            AppInfo.ResetF = 1;
#endif

#if APP_USART_5_ENABLE
        if (AppInfo.TaskUsartCnt[COM5] < 10)
            AppInfo.ResetF = 1;
#endif

#if APP_USART_6_ENABLE
        if (AppInfo.TaskUsartCnt[COM6] < 10)
        {
            AppInfo.ResetF = 1;
        }
#endif

        AppInfo.TaskUsartCnt[COM1] = 0;

#if 0
        AppInfo.TaskUsartCnt[COM2] = 0;
        AppInfo.TaskUsartCnt[COM3] = 0;
        AppInfo.TaskUsartCnt[COM4] = 0;
        AppInfo.TaskUsartCnt[COM5] = 0;
#endif

        AppInfo.TaskUsartCnt[COM6] = 0;

        WkTime = 0;
    }
}

/*
*********************************************************************************************************
                                读参数
*********************************************************************************************************
*/
void GetParams(void)
{
    uint8_t err = 0;
    uint16_t crc, tmp;
    uint32_t addr;

    F205_ReadParams(PARAMS_ADDRESS, &(ParamBuf[0]), sizeof(ParamBuf));
    crc = Calc_CRCByte(ParamBuf + 16, 14);
    tmp = ((uint16_t)ParamBuf[30] << 8) + ParamBuf[31];
    if ((crc != tmp) || (ParamBuf[16] != 0x71) || (ParamBuf[17] != 0x61) || \
        (ParamBuf[18] != 0x42) || (ParamBuf[19] != 0x55)|| \
        (ParamBuf[20] != APP_SOFT_VER_MAIN) || (ParamBuf[21] != APP_SOFT_VER_SUB) || \
        (ParamBuf[22] != 0x20) || (ParamBuf[23] != APP_SOFT_VER_YEAR) || \
        (ParamBuf[24] != APP_SOFT_VER_MONTH) || (ParamBuf[25] != APP_SOFT_VER_DATE))
    {

        ParamBuf[16] = 0x71;
        ParamBuf[17] = 0x61;
        ParamBuf[18] = 0x42;
        ParamBuf[19] = 0x55;

        ParamBuf[20] = APP_SOFT_VER_MAIN;
        ParamBuf[21] = APP_SOFT_VER_SUB;
        ParamBuf[22] = 0x20;
        ParamBuf[23] = APP_SOFT_VER_YEAR;
        ParamBuf[24] = APP_SOFT_VER_MONTH;
        ParamBuf[25] = APP_SOFT_VER_DATE;

        ParamBuf[26] = 0;
        ParamBuf[27] = 0;
        ParamBuf[28] = 0;
        ParamBuf[29] = 0;
        crc = Calc_CRCByte(ParamBuf + 16, 14);
        ParamBuf[30] = crc >> 8;
        ParamBuf[31] = crc & 0xff;

        err = 1;
    }

    if (err)
    {

        err = F205_EraseSectors(PARAMS_START_SECTOR, PARAMS_END_SECTOR);

        if (!err)
        {

            addr = PARAMS_ADDRESS;
            err = F205_WriteParams(addr, &(ParamBuf[0]), sizeof(ParamBuf));
            if (err)
            {
            }
        }
    }
}

#if 0
void GetParams(void)
{
    uint8_t err = 0;
    uint16_t crc, tmp;
    uint32_t addr;

    addr = PARAMS_ADDRESS + 16;

    F205_ReadParams(addr, &(ParamBuf[0]), 16);

    crc = Calc_CRCByte(ParamBuf, 14);

    tmp = ((uint16_t)ParamBuf[14] << 8) + ParamBuf[15];

    if ((crc != tmp) || (ParamBuf[0] != 0x71) || (ParamBuf[1] != 0x61) || \
        (ParamBuf[2] != 0x42) || (ParamBuf[3] != 0x55)|| \
        (ParamBuf[4] != APP_SOFT_VER_MAIN) || (ParamBuf[5] != APP_SOFT_VER_SUB) || \
        (ParamBuf[6] != 0x20) || (ParamBuf[7] != APP_SOFT_VER_YEAR) || \
        (ParamBuf[8] != APP_SOFT_VER_MONTH) || (ParamBuf[9] != APP_SOFT_VER_DATE))
    {

        ParamBuf[0] = 0x71;
        ParamBuf[1] = 0x61;
        ParamBuf[2] = 0x42;
        ParamBuf[3] = 0x55;

        ParamBuf[4] = APP_SOFT_VER_MAIN;
        ParamBuf[5] = APP_SOFT_VER_SUB;
        ParamBuf[6] = 0x20;
        ParamBuf[7] = APP_SOFT_VER_YEAR;
        ParamBuf[8] = APP_SOFT_VER_MONTH;
        ParamBuf[9] = APP_SOFT_VER_DATE;

        ParamBuf[10] = 0;
        ParamBuf[11] = 0;
        ParamBuf[12] = 0;
        ParamBuf[13] = 0;

        crc = Calc_CRCByte(ParamBuf, 14);
        ParamBuf[14] = crc >> 8;
        ParamBuf[15] = crc & 0xff;

        err = 1;
    }

///Modifiled 20140305 refrence to LIB_BIOS
//#if 1

    if (err)
    {
        err = F205_WriteParams(addr, &(ParamBuf[0]), 16);

        if (err)
        {

        }
    }

#if 0//#else

    if (err)
    {

        err = F205_EraseSectors(PARAMS_START_SECTOR, PARAMS_END_SECTOR);

        if (!err)
        {

            addr = PARAMS_ADDRESS;
            err = F205_WriteParams(addr, &(ParamBuf[0]), sizeof(ParamBuf));
            if (err)
            {
            }
        }
    }

#endif

}

#endif

/*
*********************************************************************************************************
                                初始化 AppInfo 结构
*********************************************************************************************************
*/
void App_InitInfo(void)
{
    memset((uint8_t *)&(AppInfo.BdAddr), 0, sizeof(APP_INFO));

///Start Added 20140311
    memset((uint8_t *)&(D110VADBuf[0][0]), 0, sizeof(D110VADBuf));
///End Added 20140311
}

/*
*********************************************************************************************************
                                设置板参数
*********************************************************************************************************
*/
void SetAppParams(void)
{
    AppInfo.BdAddr = 0x50;      ///板地址
    AppInfo.AnalogChCnt = 5;    ///模拟通道数
}

/*
*********************************************************************************************************
                                设置AD  采集通道参数
*********************************************************************************************************
*/
void SetChParams(void)
{
    uint8_t i;
//    uint8_t err = 0;
    uint16_t crc, tmp; //data
    uint16_t cnt = 30;
    //uint32_t addr;

    F205_ReadParams(PARAMS_ADDRESS, &(ParamBuf[0]), sizeof(ParamBuf));

    crc = Calc_CRCByte(ParamBuf + 32, cnt);

    tmp = ((uint16_t)ParamBuf[32 + cnt] << 8) + ParamBuf[33 + cnt];

    if (crc != tmp)
    {
        for (i = 0; i < CHANNEL_COUNT_LIMIT; i++)
        {
            ///设置通道偏置
            AppInfo.AdcOffset[i] = 0;

            ///设置通道系数
            AppInfo.AdcRatio[i] = (float)ANALOG_CHANNEL_RATIO_110V_DEFAULT / SAMPLE_RATIO_CONSTANT;
        }
    }
    else
    {
        for (i = 0; i < CHANNEL_COUNT_LIMIT; i++)
        {
            AppInfo.AdcOffset[i] = ((uint16_t)ParamBuf[36 + (i << 2) + 1] << 8) + ParamBuf[36 + (i << 2) + 0];

	    tmp = (((uint16_t)ParamBuf[36 + (i << 2) + 3] << 8) + ParamBuf[36 + (i << 2) + 2]) ;
					
            if ((tmp > 1200) || (tmp < 900))
            {
                AppInfo.AdcRatio[i] = (float)ANALOG_CHANNEL_RATIO_110V_DEFAULT / SAMPLE_RATIO_CONSTANT;
            }
            else
            {
	         AppInfo.AdcRatio[i] = (float)(((uint16_t)ParamBuf[36 + (i << 2) + 3] << 8) + ParamBuf[36 + (i << 2) + 2]) / SAMPLE_RATIO_CONSTANT;
            }
        }
    }

#if 0
    uint8_t i;
    //int16_t *p;
//  uint16_t tmp;
    uint16_t data;

    ///设置通道偏置
    for (i = 0; i < CHANNEL_COUNT_LIMIT; i++)
    {
        data = CalibrationInfo[i][1];
        data <<= 8;
        data |= CalibrationInfo[i][0];

        if (data > 2000)
        {
            data = 0;
        }

        AppInfo.AdcOffset[i] = data;
    }

    ///设置通道系数
    for (i = 0; i < CHANNEL_COUNT_LIMIT; i++)
    {
        data = CalibrationInfo[i][3];
        data <<= 8;
        data |= CalibrationInfo[i][2];

        if ((data > 40960) || (data < 1024))
        {
            data = ANALOG_CHANNEL_RATIO_110V_DEFAULT;
        }

        AppInfo.AdcRatio[i] = (float)data / 256;
    }
#endif

}

///Deleted 20140429
#if 0
void App_Usart_WriteInfo(void)
{
    uint32_t addr;

    uint8_t err;

    //addr = PARAMS_ADDRESS + sizeof(ParamBuf);

    FLASH_Unlock();

    F205_WriteProtection(ADChPARAM_FLASH_SECTORS, DISABLE);

    err = F205_EraseSectors(ADChPARAMS_START_SECTOR, ADChPARAMS_END_SECTOR);

    if (!err)
    {

        addr = ADChPARAMS_ADDRESS;

        err = F205_WriteParams(addr, &(CalibrationInfo[0][0]), sizeof(CalibrationInfo));

        if (err)
        {

        }
    }

    if (!err)
    {
        AppInfo.WriteErr = 0;///OK
    }
    else
    {
        AppInfo.WriteErr = 2;///失败
    }

///暂时先不写保护，出厂再添加
#if 0
    F205_WriteProtection(ADChPARAM_FLASH_SECTORS, ENABLE);

    FLASH_Lock();
#endif
}


///Test only
void TestWriteInfo(void)
{
    uint8_t err, i;
    uint16_t offset, ratio;
    uint32_t addr;

    offset = 0;
    ratio = 15782;

    for (i = 0; i < 5; i++)
    {
        CalibrationInfo[i][0] = offset & 0xff;
        CalibrationInfo[i][1] = offset >> 8;
        CalibrationInfo[i][2] = ratio & 0xff;
        CalibrationInfo[i][3] = ratio >> 8;
    }

    for (i = 0; i < 5; i++)
    {
        AppInfo.AdcRatio[i] = (double)ratio / 256;
    }

    addr = PARAMS_ADDRESS + sizeof(ParamBuf);

    err = F205_WriteParams(addr, &(CalibrationInfo[0][0]), sizeof(CalibrationInfo));

    if (!err)
    {
        AppInfo.WriteErr = 0;///OK
    }
    else
    {
        AppInfo.WriteErr = 2;///失败
    }
}
#endif


/////////////////////////////////////////////////////////////////////////////////////////////
///                         掉电相关函数实现
/////////////////////////////////////////////////////////////////////////////////////////////


void CheckRecInfo(void)
{
    uint16_t  cnt, temp;
    uint8_t i, *ptr, OK1 = 0, OK2 = 0, *P1, *P2;

    cnt = sizeof(RecInfo);

    ptr = (uint8_t *)&(RecInfo.Flag[0]);

    //读取通过I2C记录在EEPROM里的标志数据
    //sEE_ReadBuffer(ptr, 0, &cnt);

    BSP_ReadI2C1(ptr, 0, &cnt);

    if ((RecInfo.Flag[0] == 0x61) && (RecInfo.Flag[1] == 0x62) && \
        (RecInfo.Flag[2] == 0x52) && (RecInfo.Flag[3] == 0x51))
    {
        if ((RecInfo.NextIndex < REC_SIZE + 1) && (RecInfo.NextIndex > 0))
        {
            temp = Calc_CRCByte((uint8_t *)&(RecInfo.Flag[0]), 6);

            if (temp == RecInfo.Crc)
            {
                OK1 = 1;
            }
        }
    }
    if ((RecInfo.Bk_Flag[0] == 0x61) && (RecInfo.Bk_Flag[1] == 0x62) && \
        (RecInfo.Bk_Flag[2] == 0x52) && (RecInfo.Bk_Flag[3] == 0x51))
    {
        if ((RecInfo.Bk_NextIndex < REC_SIZE + 1) && (RecInfo.Bk_NextIndex > 0))
        {
            temp = Calc_CRCByte((uint8_t *)&(RecInfo.Bk_Flag[0]), 6);

            if (temp == RecInfo.Bk_Crc)
            {
                OK2 = 1;
            }
        }
    }

    P1 = (uint8_t *)&(RecInfo.Flag[0]);
    P2 = (uint8_t *)&(RecInfo.Bk_Flag[0]);

    if (OK1)
    {
        for (i = 0; i < 8; i++)
        {
            *P2++ = *P1++;
        }

        //FLASH_WP_DISABLE;
        //sEE_WriteBuffer((uint8_t *)&(RecInfo.Bk_Flag[0]), 8, 8);

        BSP_WriteI2C1((uint8_t *)&(RecInfo.Bk_Flag[0]), 8, 8);

        //FLASH_WP_ENABLE;
    }
    else if (OK2)
    {
        for (i = 0; i < 8; i++)
        {
            *P1++ = *P2++;
        }

        //FLASH_WP_DISABLE;
        //sEE_WriteBuffer((uint8_t *)&(RecInfo.Flag[0]), 0, 8);
        BSP_WriteI2C1((uint8_t *)&(RecInfo.Bk_Flag[0]), 0, 8);
        //FLASH_WP_ENABLE;
    }
    else
    {
        RecInfo.Flag[0] = 0x61;
        RecInfo.Flag[1] = 0x62;
        RecInfo.Flag[2] = 0x52;
        RecInfo.Flag[3] = 0x51;

        RecInfo.NextIndex = 1;
        RecInfo.TotNewRec = 0;

        RecInfo.Crc = Calc_CRCByte((uint8_t *)&(RecInfo.Flag[0]), 6);

        for (i = 0; i < 8; i++)
        {
            *P2++ = *P1++;
        }

        //FLASH_WP_DISABLE;
        //sEE_WriteBuffer((uint8_t *)&(RecInfo.Flag[0]), 0, 16);
        //FLASH_WP_ENABLE;

        BSP_WriteI2C1((uint8_t *)&(RecInfo.Flag[0]), 0, 16);
    }
}


//掉电信息数据无校验

void SavePowOffData()
{
#if OS_CRITICAL_METHOD == 3
    OS_CPU_SR  cpu_sr = 0;
#endif

    uint8_t Buf[16], i;
    uint16_t Addr; //Crc;

    OS_ENTER_CRITICAL();

    ///全局变量，锁定 I2C 操作：
    g_I2C_RdyF = 0;

    OS_EXIT_CRITICAL();

    for (i = 0; i < 4; i++)
    {
        Buf[i] = LJBPosInfo.SysTime[i];
    }

    for (i = 0; i < 3; i++)
    {
        Buf[4 + i] = LJBPosInfo.Dist[i];
    }

    for (i = 0; i < 9; i++)
    {
        Buf[7 + i]  = LJBPosInfo.D110V[i];
    }

    Addr = (uint16_t)RecInfo.NextIndex << 4;

    //FLASH_WP_DISABLE;
    //sEE_WriteBuffer((uint8_t *)&(Buf[0]), Addr, sizeof(Buf));
    //FLASH_WP_ENABLE;

    BSP_WriteI2C1((uint8_t *)&(Buf[0]), Addr, sizeof(Buf));


    RecInfo.NextIndex++;

    if (RecInfo.NextIndex > REC_SIZE)
    {
        RecInfo.NextIndex = 1;
    }

    RecInfo.TotNewRec++;

    if (RecInfo.TotNewRec > REC_SIZE)
    {
        RecInfo.TotNewRec = REC_SIZE;
    }

    RecInfo.Crc = Calc_CRCByte((uint8_t *)&(RecInfo.Flag[0]), 6);

    RecInfo.Bk_NextIndex = RecInfo.NextIndex;
    RecInfo.Bk_TotNewRec = RecInfo.TotNewRec;
    RecInfo.Bk_Crc = RecInfo.Crc;

    Addr = 0;

    //FLASH_WP_DISABLE;
    //sEE_WriteBuffer((uint8_t *)&(RecInfo.Flag[0]), Addr, sizeof(REC_INFO));
    //FLASH_WP_ENABLE;

    BSP_WriteI2C1((uint8_t *)&(RecInfo.Flag[0]), Addr, sizeof(REC_INFO));


    OS_ENTER_CRITICAL();

    ///全局变量，解锁 I2C 操作：
    g_I2C_RdyF = 1;

    OS_EXIT_CRITICAL();

}



//Added by me 20140318
//掉电后总共记录1秒钟数据。其中，每隔100ms多记录1条数据。
void PowOffHandler(void)
{
#if OS_CRITICAL_METHOD == 3
    OS_CPU_SR  cpu_sr = 0;
#endif

    uint8_t D110VIndex;

    D110VIndex = D110VCnt[4];

    //LJBPosInfo.D110V[PosIndex] = D110VADBuf[4][PosIndex];//D110VADBuf[4][D110VCnt[4]];

    //LJBPosInfo.D110V[PosIndex] = D110VADBuf[4][D110VCnt[4]];//UserInf.D110V

    PosIndex++;

    if (PosIndex == 9)                              //掉电1s计时到
    {
        // 清110V电源掉电计数

#if 0
        for (PosIndex = 0; PosIndex < 10; PosIndex ++)
        {
            LJBPosInfo.D110V[PosIndex] = D110VADBuf[4][PosIndex];
        }
#endif

#if 1
        OS_ENTER_CRITICAL();

        for (PosIndex = 10; PosIndex > 0; PosIndex --)
        {
            LJBPosInfo.D110V[PosIndex - 1] = D110VADBuf[4][(PosIndex + D110VIndex) % 10];
        }

        OS_EXIT_CRITICAL();

#endif


        PosIndex = 0;

        if ((g_I2C_RdyF == 1)&&(g_changed == 1))                            //I2C空闲
        {
            SavePowOffData();                       //记录1s内每隔100ms采集的掉电数，共10帧数据
        }

        g_changed = 0;                                // 不再记录掉电信息
        UserInf.PowOffFlag &= (~POW_OFF_FLG);       // 清110V电源掉电标志
    }
}





