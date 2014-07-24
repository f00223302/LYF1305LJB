#line 1 "..\\src\\USART\\F205_usart.c"







 


 
#line 1 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"




































  



 



 
    






  


 
  


 







 





#line 82 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"







            





 





 
#line 110 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"
                                             


 



 



 







 
typedef enum IRQn
{
 
  NonMaskableInt_IRQn         = -14,     
  MemoryManagement_IRQn       = -12,     
  BusFault_IRQn               = -11,     
  UsageFault_IRQn             = -10,     
  SVCall_IRQn                 = -5,      
  DebugMonitor_IRQn           = -4,      
  PendSV_IRQn                 = -2,      
  SysTick_IRQn                = -1,      
 
  WWDG_IRQn                   = 0,       
  PVD_IRQn                    = 1,       
  TAMP_STAMP_IRQn             = 2,       
  RTC_WKUP_IRQn               = 3,       
  FLASH_IRQn                  = 4,       
  RCC_IRQn                    = 5,       
  EXTI0_IRQn                  = 6,       
  EXTI1_IRQn                  = 7,       
  EXTI2_IRQn                  = 8,       
  EXTI3_IRQn                  = 9,       
  EXTI4_IRQn                  = 10,      
  DMA1_Stream0_IRQn           = 11,      
  DMA1_Stream1_IRQn           = 12,      
  DMA1_Stream2_IRQn           = 13,      
  DMA1_Stream3_IRQn           = 14,      
  DMA1_Stream4_IRQn           = 15,      
  DMA1_Stream5_IRQn           = 16,      
  DMA1_Stream6_IRQn           = 17,      
  ADC_IRQn                    = 18,      
  CAN1_TX_IRQn                = 19,      
  CAN1_RX0_IRQn               = 20,      
  CAN1_RX1_IRQn               = 21,      
  CAN1_SCE_IRQn               = 22,      
  EXTI9_5_IRQn                = 23,      
  TIM1_BRK_TIM9_IRQn          = 24,      
  TIM1_UP_TIM10_IRQn          = 25,      
  TIM1_TRG_COM_TIM11_IRQn     = 26,      
  TIM1_CC_IRQn                = 27,      
  TIM2_IRQn                   = 28,      
  TIM3_IRQn                   = 29,      
  TIM4_IRQn                   = 30,      
  I2C1_EV_IRQn                = 31,      
  I2C1_ER_IRQn                = 32,      
  I2C2_EV_IRQn                = 33,      
  I2C2_ER_IRQn                = 34,        
  SPI1_IRQn                   = 35,      
  SPI2_IRQn                   = 36,      
  USART1_IRQn                 = 37,      
  USART2_IRQn                 = 38,      
  USART3_IRQn                 = 39,      
  EXTI15_10_IRQn              = 40,      
  RTC_Alarm_IRQn              = 41,      
  OTG_FS_WKUP_IRQn            = 42,          
  TIM8_BRK_TIM12_IRQn         = 43,      
  TIM8_UP_TIM13_IRQn          = 44,      
  TIM8_TRG_COM_TIM14_IRQn     = 45,      
  TIM8_CC_IRQn                = 46,      
  DMA1_Stream7_IRQn           = 47,      
  FSMC_IRQn                   = 48,      
  SDIO_IRQn                   = 49,      
  TIM5_IRQn                   = 50,      
  SPI3_IRQn                   = 51,      
  UART4_IRQn                  = 52,      
  UART5_IRQn                  = 53,      
  TIM6_DAC_IRQn               = 54,      
  TIM7_IRQn                   = 55,      
  DMA2_Stream0_IRQn           = 56,      
  DMA2_Stream1_IRQn           = 57,      
  DMA2_Stream2_IRQn           = 58,      
  DMA2_Stream3_IRQn           = 59,      
  DMA2_Stream4_IRQn           = 60,      
  ETH_IRQn                    = 61,      
  ETH_WKUP_IRQn               = 62,      
  CAN2_TX_IRQn                = 63,      
  CAN2_RX0_IRQn               = 64,      
  CAN2_RX1_IRQn               = 65,      
  CAN2_SCE_IRQn               = 66,      
  OTG_FS_IRQn                 = 67,      
  DMA2_Stream5_IRQn           = 68,      
  DMA2_Stream6_IRQn           = 69,      
  DMA2_Stream7_IRQn           = 70,      
  USART6_IRQn                 = 71,       
  I2C3_EV_IRQn                = 72,      
  I2C3_ER_IRQn                = 73,      
  OTG_HS_EP1_OUT_IRQn         = 74,      
  OTG_HS_EP1_IN_IRQn          = 75,      
  OTG_HS_WKUP_IRQn            = 76,      
  OTG_HS_IRQn                 = 77,      
  DCMI_IRQn                   = 78,      
  CRYP_IRQn                   = 79,      
  HASH_RNG_IRQn               = 80       
} IRQn_Type;



 

#line 1 "..\\..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"
 




















 





































 

 
 
 
 
 
 
 
 








 











#line 1 "D:\\Keil\\ARM\\RV31\\INC\\stdint.h"
 
 





 









#line 25 "D:\\Keil\\ARM\\RV31\\INC\\stdint.h"







 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     
typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;

     
typedef   signed       __int64 intmax_t;
typedef unsigned       __int64 uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     


     


     


     

     


     


     


     

     



     



     


     
    
 



#line 196 "D:\\Keil\\ARM\\RV31\\INC\\stdint.h"

     







     










     











#line 260 "D:\\Keil\\ARM\\RV31\\INC\\stdint.h"



 


#line 91 "..\\..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"

















 

#line 117 "..\\..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"





 


 





 
typedef struct
{
  volatile uint32_t ISER[8];                       
       uint32_t RESERVED0[24];                                   
  volatile uint32_t ICER[8];                       
       uint32_t RSERVED1[24];                                    
  volatile uint32_t ISPR[8];                       
       uint32_t RESERVED2[24];                                   
  volatile uint32_t ICPR[8];                       
       uint32_t RESERVED3[24];                                   
  volatile uint32_t IABR[8];                       
       uint32_t RESERVED4[56];                                   
  volatile uint8_t  IP[240];                       
       uint32_t RESERVED5[644];                                  
  volatile  uint32_t STIR;                          
}  NVIC_Type;                                               
   





 
typedef struct
{
  volatile const  uint32_t CPUID;                         
  volatile uint32_t ICSR;                          
  volatile uint32_t VTOR;                          
  volatile uint32_t AIRCR;                         
  volatile uint32_t SCR;                           
  volatile uint32_t CCR;                           
  volatile uint8_t  SHP[12];                       
  volatile uint32_t SHCSR;                         
  volatile uint32_t CFSR;                          
  volatile uint32_t HFSR;                          
  volatile uint32_t DFSR;                          
  volatile uint32_t MMFAR;                         
  volatile uint32_t BFAR;                          
  volatile uint32_t AFSR;                          
  volatile const  uint32_t PFR[2];                        
  volatile const  uint32_t DFR;                           
  volatile const  uint32_t ADR;                           
  volatile const  uint32_t MMFR[4];                       
  volatile const  uint32_t ISAR[5];                       
} SCB_Type;                                                

 












 






























 






 





















 









 


















 
































                                     









 









 









 














   





 
typedef struct
{
  volatile uint32_t CTRL;                          
  volatile uint32_t LOAD;                          
  volatile uint32_t VAL;                           
  volatile const  uint32_t CALIB;                         
} SysTick_Type;

 












 



 



 








   





 
typedef struct
{
  volatile  union  
  {
    volatile  uint8_t    u8;                        
    volatile  uint16_t   u16;                       
    volatile  uint32_t   u32;                       
  }  PORT [32];                                
       uint32_t RESERVED0[864];                                 
  volatile uint32_t TER;                           
       uint32_t RESERVED1[15];                                  
  volatile uint32_t TPR;                           
       uint32_t RESERVED2[15];                                  
  volatile uint32_t TCR;                           
       uint32_t RESERVED3[29];                                  
  volatile uint32_t IWR;                           
  volatile uint32_t IRR;                           
  volatile uint32_t IMCR;                          
       uint32_t RESERVED4[43];                                  
  volatile uint32_t LAR;                           
  volatile uint32_t LSR;                           
       uint32_t RESERVED5[6];                                   
  volatile const  uint32_t PID4;                          
  volatile const  uint32_t PID5;                          
  volatile const  uint32_t PID6;                          
  volatile const  uint32_t PID7;                          
  volatile const  uint32_t PID0;                          
  volatile const  uint32_t PID1;                          
  volatile const  uint32_t PID2;                          
  volatile const  uint32_t PID3;                          
  volatile const  uint32_t CID0;                          
  volatile const  uint32_t CID1;                          
  volatile const  uint32_t CID2;                          
  volatile const  uint32_t CID3;                          
} ITM_Type;                                                

 



 
























 



 



 



 








   





 
typedef struct
{
       uint32_t RESERVED0;
  volatile const  uint32_t ICTR;                          



       uint32_t RESERVED1;

} InterruptType_Type;

 



 








   






 
typedef struct
{
  volatile const  uint32_t TYPE;                          
  volatile uint32_t CTRL;                          
  volatile uint32_t RNR;                           
  volatile uint32_t RBAR;                          
  volatile uint32_t RASR;                          
  volatile uint32_t RBAR_A1;                       
  volatile uint32_t RASR_A1;                       
  volatile uint32_t RBAR_A2;                       
  volatile uint32_t RASR_A2;                       
  volatile uint32_t RBAR_A3;                       
  volatile uint32_t RASR_A3;                       
} MPU_Type;                                                

 









 









 



 









 



























   






 
typedef struct
{
  volatile uint32_t DHCSR;                         
  volatile  uint32_t DCRSR;                         
  volatile uint32_t DCRDR;                         
  volatile uint32_t DEMCR;                         
} CoreDebug_Type;

 




































 






 






































   


 
#line 721 "..\\..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"

#line 728 "..\\..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"






   




 





#line 758 "..\\..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"


 


 




#line 783 "..\\..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"


 
 
 
 








 
extern uint32_t __get_PSP(void);








 
extern void __set_PSP(uint32_t topOfProcStack);








 
extern uint32_t __get_MSP(void);








 
extern void __set_MSP(uint32_t topOfMainStack);








 
extern uint32_t __REV16(uint16_t value);








 
extern int32_t __REVSH(int16_t value);


#line 933 "..\\..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"





 








 
static __inline uint32_t  __get_BASEPRI(void)
{
  register uint32_t __regBasePri         __asm("basepri");
  return(__regBasePri);
}







 
static __inline void __set_BASEPRI(uint32_t basePri)
{
  register uint32_t __regBasePri         __asm("basepri");
  __regBasePri = (basePri & 0xff);
}







 
static __inline uint32_t __get_PRIMASK(void)
{
  register uint32_t __regPriMask         __asm("primask");
  return(__regPriMask);
}







 
static __inline void __set_PRIMASK(uint32_t priMask)
{
  register uint32_t __regPriMask         __asm("primask");
  __regPriMask = (priMask);
}







 
static __inline uint32_t __get_FAULTMASK(void)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  return(__regFaultMask);
}







 
static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  __regFaultMask = (faultMask & 1);
}







 
static __inline uint32_t __get_CONTROL(void)
{
  register uint32_t __regControl         __asm("control");
  return(__regControl);
}







 
static __inline void __set_CONTROL(uint32_t control)
{
  register uint32_t __regControl         __asm("control");
  __regControl = control;
}





#line 1445 "..\\..\\Libraries\\CMSIS\\CM3\\CoreSupport\\core_cm3.h"







 
 

 











 
static __inline void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);                          
  
  reg_value  =  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR;                                                    
  reg_value &= ~((0xFFFFul << 16) | (7ul << 8));              
  reg_value  =  (reg_value                       |
                (0x5FA << 16) | 
                (PriorityGroupTmp << 8));                                      
  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR =  reg_value;
}








 
static __inline uint32_t NVIC_GetPriorityGrouping(void)
{
  return ((((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR & (7ul << 8)) >> 8);    
}








 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}








 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}









 
static __inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t) ((((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}








 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}








 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}









 
static __inline uint32_t NVIC_GetActive(IRQn_Type IRQn)
{
  return((uint32_t)((((NVIC_Type *) ((0xE000E000) + 0x0100))->IABR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}












 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 - 4)) & 0xff); }  
  else {
    ((NVIC_Type *) ((0xE000E000) + 0x0100))->IP[(uint32_t)(IRQn)] = ((priority << (8 - 4)) & 0xff);    }         
}















 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)(((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[((uint32_t)(IRQn) & 0xF)-4] >> (8 - 4)));  }  
  else {
    return((uint32_t)(((NVIC_Type *) ((0xE000E000) + 0x0100))->IP[(uint32_t)(IRQn)]           >> (8 - 4)));  }  
}
















 
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);           
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > 4) ? 4 : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + 4) < 7) ? 0 : PriorityGroupTmp - 7 + 4;
 
  return (
           ((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
           ((SubPriority     & ((1 << (SubPriorityBits    )) - 1)))
         );
}
















 
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);           
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > 4) ? 4 : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + 4) < 7) ? 0 : PriorityGroupTmp - 7 + 4;
  
  *pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
  *pSubPriority     = (Priority                   ) & ((1 << (SubPriorityBits    )) - 1);
}



 












 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{ 
  if (ticks > (0xFFFFFFul << 0))  return (1);             
                                                               
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->LOAD  = (ticks & (0xFFFFFFul << 0)) - 1;       
  NVIC_SetPriority (SysTick_IRQn, (1<<4) - 1);   
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->VAL   = 0;                                           
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL  = (1ul << 2) | 
                   (1ul << 1)   | 
                   (1ul << 0);                     
  return (0);                                                   
}






 





 
static __inline void NVIC_SystemReset(void)
{
  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR  = ((0x5FA << 16)      | 
                 (((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR & (7ul << 8)) | 
                 (1ul << 2));                    
  __dsb(0);                                                                    
  while(1);                                                     
}

   



 






 
 

extern volatile int ITM_RxBuffer;                     












 
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if ((((CoreDebug_Type *) (0xE000EDF0))->DEMCR & (1ul << 24))  &&       
      (((ITM_Type *) (0xE0000000))->TCR & (1ul << 0))                  &&       
      (((ITM_Type *) (0xE0000000))->TER & (1ul << 0)        )                    )      
  {
    while (((ITM_Type *) (0xE0000000))->PORT[0].u32 == 0);
    ((ITM_Type *) (0xE0000000))->PORT[0].u8 = (uint8_t) ch;
  }  
  return (ch);
}










 
static __inline int ITM_ReceiveChar (void) {
  int ch = -1;                                

  if (ITM_RxBuffer != 0x5AA55AA5) {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = 0x5AA55AA5;        
  }
  
  return (ch); 
}









 
static __inline int ITM_CheckChar (void) {

  if (ITM_RxBuffer == 0x5AA55AA5) {
    return (0);                                  
  } else {
    return (1);                                  
  }
}

   






   



 
#line 230 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"
#line 1 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\system_stm32f2xx.h"



















  



 



   
  


 









 



 




 

extern uint32_t SystemCoreClock;           




 



 



 



 



 



 
  
extern void SystemInit(void);
extern void SystemCoreClockUpdate(void);


 









 
  


   
 
#line 231 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"
#line 232 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"



   
 
typedef int32_t  s32;
typedef int16_t s16;
typedef int8_t  s8;

typedef const int32_t sc32;   
typedef const int16_t sc16;   
typedef const int8_t sc8;    

typedef volatile int32_t  vs32;
typedef volatile int16_t  vs16;
typedef volatile int8_t   vs8;

typedef volatile const int32_t vsc32;   
typedef volatile const int16_t vsc16;   
typedef volatile const int8_t vsc8;    

typedef uint32_t  u32;
typedef uint16_t u16;
typedef uint8_t  u8;

typedef const uint32_t uc32;   
typedef const uint16_t uc16;   
typedef const uint8_t uc8;    

typedef volatile uint32_t  vu32;
typedef volatile uint16_t vu16;
typedef volatile uint8_t  vu8;

typedef volatile const uint32_t vuc32;   
typedef volatile const uint16_t vuc16;   
typedef volatile const uint8_t vuc8;    

typedef enum {RESET = 0, SET = !RESET} FlagStatus, ITStatus;

typedef enum {DISABLE = 0, ENABLE = !DISABLE} FunctionalState;


typedef enum {ERROR = 0, SUCCESS = !ERROR} ErrorStatus;



 



    



 

typedef struct
{
  volatile uint32_t SR;      
  volatile uint32_t CR1;           
  volatile uint32_t CR2;     
  volatile uint32_t SMPR1;   
  volatile uint32_t SMPR2;   
  volatile uint32_t JOFR1;   
  volatile uint32_t JOFR2;   
  volatile uint32_t JOFR3;   
  volatile uint32_t JOFR4;   
  volatile uint32_t HTR;     
  volatile uint32_t LTR;     
  volatile uint32_t SQR1;    
  volatile uint32_t SQR2;    
  volatile uint32_t SQR3;    
  volatile uint32_t JSQR;    
  volatile uint32_t JDR1;    
  volatile uint32_t JDR2;    
  volatile uint32_t JDR3;    
  volatile uint32_t JDR4;    
  volatile uint32_t DR;      
} ADC_TypeDef;

typedef struct
{
  volatile uint32_t CSR;     
  volatile uint32_t CCR;     
  volatile uint32_t CDR;    
 
} ADC_Common_TypeDef;




 

typedef struct
{
  volatile uint32_t TIR;   
  volatile uint32_t TDTR;  
  volatile uint32_t TDLR;  
  volatile uint32_t TDHR;  
} CAN_TxMailBox_TypeDef;



 
  
typedef struct
{
  volatile uint32_t RIR;   
  volatile uint32_t RDTR;  
  volatile uint32_t RDLR;  
  volatile uint32_t RDHR;  
} CAN_FIFOMailBox_TypeDef;



 
  
typedef struct
{
  volatile uint32_t FR1;  
  volatile uint32_t FR2;  
} CAN_FilterRegister_TypeDef;



 
  
typedef struct
{
  volatile uint32_t              MCR;                  
  volatile uint32_t              MSR;                  
  volatile uint32_t              TSR;                  
  volatile uint32_t              RF0R;                 
  volatile uint32_t              RF1R;                 
  volatile uint32_t              IER;                  
  volatile uint32_t              ESR;                  
  volatile uint32_t              BTR;                  
  uint32_t                   RESERVED0[88];        
  CAN_TxMailBox_TypeDef      sTxMailBox[3];        
  CAN_FIFOMailBox_TypeDef    sFIFOMailBox[2];      
  uint32_t                   RESERVED1[12];        
  volatile uint32_t              FMR;                  
  volatile uint32_t              FM1R;                 
  uint32_t                   RESERVED2;            
  volatile uint32_t              FS1R;                 
  uint32_t                   RESERVED3;            
  volatile uint32_t              FFA1R;                
  uint32_t                   RESERVED4;            
  volatile uint32_t              FA1R;                 
  uint32_t                   RESERVED5[8];          
  CAN_FilterRegister_TypeDef sFilterRegister[28];  
} CAN_TypeDef;



 

typedef struct
{
  volatile uint32_t DR;          
  volatile uint8_t  IDR;         
  uint8_t       RESERVED0;   
  uint16_t      RESERVED1;   
  volatile uint32_t CR;          
} CRC_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;        
  volatile uint32_t SWTRIGR;   
  volatile uint32_t DHR12R1;   
  volatile uint32_t DHR12L1;   
  volatile uint32_t DHR8R1;    
  volatile uint32_t DHR12R2;   
  volatile uint32_t DHR12L2;   
  volatile uint32_t DHR8R2;    
  volatile uint32_t DHR12RD;   
  volatile uint32_t DHR12LD;   
  volatile uint32_t DHR8RD;    
  volatile uint32_t DOR1;      
  volatile uint32_t DOR2;      
  volatile uint32_t SR;        
} DAC_TypeDef;



 

typedef struct
{
  volatile uint32_t IDCODE;   
  volatile uint32_t CR;       
  volatile uint32_t APB1FZ;   
  volatile uint32_t APB2FZ;   
}DBGMCU_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;        
  volatile uint32_t SR;        
  volatile uint32_t RISR;      
  volatile uint32_t IER;       
  volatile uint32_t MISR;      
  volatile uint32_t ICR;       
  volatile uint32_t ESCR;      
  volatile uint32_t ESUR;      
  volatile uint32_t CWSTRTR;   
  volatile uint32_t CWSIZER;   
  volatile uint32_t DR;        
} DCMI_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;      
  volatile uint32_t NDTR;    
  volatile uint32_t PAR;     
  volatile uint32_t M0AR;    
  volatile uint32_t M1AR;    
  volatile uint32_t FCR;     
} DMA_Stream_TypeDef;

typedef struct
{
  volatile uint32_t LISR;    
  volatile uint32_t HISR;    
  volatile uint32_t LIFCR;   
  volatile uint32_t HIFCR;   
} DMA_TypeDef;



 

typedef struct
{
  volatile uint32_t MACCR;
  volatile uint32_t MACFFR;
  volatile uint32_t MACHTHR;
  volatile uint32_t MACHTLR;
  volatile uint32_t MACMIIAR;
  volatile uint32_t MACMIIDR;
  volatile uint32_t MACFCR;
  volatile uint32_t MACVLANTR;              
  uint32_t      RESERVED0[2];
  volatile uint32_t MACRWUFFR;              
  volatile uint32_t MACPMTCSR;
  uint32_t      RESERVED1[2];
  volatile uint32_t MACSR;                  
  volatile uint32_t MACIMR;
  volatile uint32_t MACA0HR;
  volatile uint32_t MACA0LR;
  volatile uint32_t MACA1HR;
  volatile uint32_t MACA1LR;
  volatile uint32_t MACA2HR;
  volatile uint32_t MACA2LR;
  volatile uint32_t MACA3HR;
  volatile uint32_t MACA3LR;                
  uint32_t      RESERVED2[40];
  volatile uint32_t MMCCR;                  
  volatile uint32_t MMCRIR;
  volatile uint32_t MMCTIR;
  volatile uint32_t MMCRIMR;
  volatile uint32_t MMCTIMR;                
  uint32_t      RESERVED3[14];
  volatile uint32_t MMCTGFSCCR;             
  volatile uint32_t MMCTGFMSCCR;
  uint32_t      RESERVED4[5];
  volatile uint32_t MMCTGFCR;
  uint32_t      RESERVED5[10];
  volatile uint32_t MMCRFCECR;
  volatile uint32_t MMCRFAECR;
  uint32_t      RESERVED6[10];
  volatile uint32_t MMCRGUFCR;
  uint32_t      RESERVED7[334];
  volatile uint32_t PTPTSCR;
  volatile uint32_t PTPSSIR;
  volatile uint32_t PTPTSHR;
  volatile uint32_t PTPTSLR;
  volatile uint32_t PTPTSHUR;
  volatile uint32_t PTPTSLUR;
  volatile uint32_t PTPTSAR;
  volatile uint32_t PTPTTHR;
  volatile uint32_t PTPTTLR;
  volatile uint32_t RESERVED8;
  volatile uint32_t PTPTSSR;   
  uint32_t      RESERVED9[565];
  volatile uint32_t DMABMR;
  volatile uint32_t DMATPDR;
  volatile uint32_t DMARPDR;
  volatile uint32_t DMARDLAR;
  volatile uint32_t DMATDLAR;
  volatile uint32_t DMASR;
  volatile uint32_t DMAOMR;
  volatile uint32_t DMAIER;
  volatile uint32_t DMAMFBOCR;
  volatile uint32_t DMARSWTR;   
  uint32_t      RESERVED10[8];
  volatile uint32_t DMACHTDR;
  volatile uint32_t DMACHRDR;
  volatile uint32_t DMACHTBAR;
  volatile uint32_t DMACHRBAR;
} ETH_TypeDef;



 

typedef struct
{
  volatile uint32_t IMR;     
  volatile uint32_t EMR;     
  volatile uint32_t RTSR;    
  volatile uint32_t FTSR;    
  volatile uint32_t SWIER;   
  volatile uint32_t PR;      
} EXTI_TypeDef;



 

typedef struct
{
  volatile uint32_t ACR;       
  volatile uint32_t KEYR;      
  volatile uint32_t OPTKEYR;   
  volatile uint32_t SR;        
  volatile uint32_t CR;        
  volatile uint32_t OPTCR;     
} FLASH_TypeDef;



 

typedef struct
{
  volatile uint32_t BTCR[8];        
} FSMC_Bank1_TypeDef; 



 
  
typedef struct
{
  volatile uint32_t BWTR[7];     
} FSMC_Bank1E_TypeDef;



 
  
typedef struct
{
  volatile uint32_t PCR2;        
  volatile uint32_t SR2;         
  volatile uint32_t PMEM2;       
  volatile uint32_t PATT2;       
  uint32_t      RESERVED0;   
  volatile uint32_t ECCR2;       
} FSMC_Bank2_TypeDef;



 
  
typedef struct
{
  volatile uint32_t PCR3;        
  volatile uint32_t SR3;         
  volatile uint32_t PMEM3;       
  volatile uint32_t PATT3;       
  uint32_t      RESERVED0;   
  volatile uint32_t ECCR3;       
} FSMC_Bank3_TypeDef;



 
  
typedef struct
{
  volatile uint32_t PCR4;        
  volatile uint32_t SR4;         
  volatile uint32_t PMEM4;       
  volatile uint32_t PATT4;       
  volatile uint32_t PIO4;        
} FSMC_Bank4_TypeDef; 



 

typedef struct
{
  volatile uint32_t MODER;     
  volatile uint32_t OTYPER;    
  volatile uint32_t OSPEEDR;   
  volatile uint32_t PUPDR;     
  volatile uint32_t IDR;       
  volatile uint32_t ODR;       
  volatile uint16_t BSRRL;     
  volatile uint16_t BSRRH;     
  volatile uint32_t LCKR;      
  volatile uint32_t AFR[2];    
} GPIO_TypeDef;



 
  
typedef struct
{
  volatile uint32_t MEMRMP;        
  volatile uint32_t PMC;           
  volatile uint32_t EXTICR[4];     
  uint32_t      RESERVED[2];    
  volatile uint32_t CMPCR;         
} SYSCFG_TypeDef;



 

typedef struct
{
  volatile uint16_t CR1;         
  uint16_t      RESERVED0;   
  volatile uint16_t CR2;         
  uint16_t      RESERVED1;   
  volatile uint16_t OAR1;        
  uint16_t      RESERVED2;   
  volatile uint16_t OAR2;        
  uint16_t      RESERVED3;   
  volatile uint16_t DR;          
  uint16_t      RESERVED4;   
  volatile uint16_t SR1;         
  uint16_t      RESERVED5;   
  volatile uint16_t SR2;         
  uint16_t      RESERVED6;   
  volatile uint16_t CCR;         
  uint16_t      RESERVED7;   
  volatile uint16_t TRISE;       
  uint16_t      RESERVED8;   
} I2C_TypeDef;



 

typedef struct
{
  volatile uint32_t KR;    
  volatile uint32_t PR;    
  volatile uint32_t RLR;   
  volatile uint32_t SR;    
} IWDG_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;    
  volatile uint32_t CSR;   
} PWR_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;             
  volatile uint32_t PLLCFGR;        
  volatile uint32_t CFGR;           
  volatile uint32_t CIR;            
  volatile uint32_t AHB1RSTR;       
  volatile uint32_t AHB2RSTR;       
  volatile uint32_t AHB3RSTR;       
  uint32_t      RESERVED0;      
  volatile uint32_t APB1RSTR;       
  volatile uint32_t APB2RSTR;       
  uint32_t      RESERVED1[2];   
  volatile uint32_t AHB1ENR;        
  volatile uint32_t AHB2ENR;        
  volatile uint32_t AHB3ENR;        
  uint32_t      RESERVED2;      
  volatile uint32_t APB1ENR;        
  volatile uint32_t APB2ENR;        
  uint32_t      RESERVED3[2];   
  volatile uint32_t AHB1LPENR;      
  volatile uint32_t AHB2LPENR;      
  volatile uint32_t AHB3LPENR;      
  uint32_t      RESERVED4;      
  volatile uint32_t APB1LPENR;      
  volatile uint32_t APB2LPENR;      
  uint32_t      RESERVED5[2];   
  volatile uint32_t BDCR;           
  volatile uint32_t CSR;            
  uint32_t      RESERVED6[2];   
  volatile uint32_t SSCGR;          
  volatile uint32_t PLLI2SCFGR;     
} RCC_TypeDef;



 

typedef struct
{
  volatile uint32_t TR;       
  volatile uint32_t DR;       
  volatile uint32_t CR;       
  volatile uint32_t ISR;      
  volatile uint32_t PRER;     
  volatile uint32_t WUTR;     
  volatile uint32_t CALIBR;   
  volatile uint32_t ALRMAR;   
  volatile uint32_t ALRMBR;   
  volatile uint32_t WPR;      
  uint32_t RESERVED1;     
  uint32_t RESERVED2;     
  volatile uint32_t TSTR;     
  volatile uint32_t TSDR;     
  uint32_t RESERVED3;     
  uint32_t RESERVED4;     
  volatile uint32_t TAFCR;    
  uint32_t RESERVED5;     
  uint32_t RESERVED6;     
  uint32_t RESERVED7;     
  volatile uint32_t BKP0R;    
  volatile uint32_t BKP1R;    
  volatile uint32_t BKP2R;    
  volatile uint32_t BKP3R;    
  volatile uint32_t BKP4R;    
  volatile uint32_t BKP5R;    
  volatile uint32_t BKP6R;    
  volatile uint32_t BKP7R;    
  volatile uint32_t BKP8R;    
  volatile uint32_t BKP9R;    
  volatile uint32_t BKP10R;   
  volatile uint32_t BKP11R;   
  volatile uint32_t BKP12R;   
  volatile uint32_t BKP13R;   
  volatile uint32_t BKP14R;   
  volatile uint32_t BKP15R;   
  volatile uint32_t BKP16R;   
  volatile uint32_t BKP17R;   
  volatile uint32_t BKP18R;   
  volatile uint32_t BKP19R;   
} RTC_TypeDef;



 

typedef struct
{
  volatile uint32_t POWER;           
  volatile uint32_t CLKCR;           
  volatile uint32_t ARG;             
  volatile uint32_t CMD;             
  volatile const uint32_t  RESPCMD;         
  volatile const uint32_t  RESP1;           
  volatile const uint32_t  RESP2;           
  volatile const uint32_t  RESP3;           
  volatile const uint32_t  RESP4;           
  volatile uint32_t DTIMER;          
  volatile uint32_t DLEN;            
  volatile uint32_t DCTRL;           
  volatile const uint32_t  DCOUNT;          
  volatile const uint32_t  STA;             
  volatile uint32_t ICR;             
  volatile uint32_t MASK;            
  uint32_t      RESERVED0[2];    
  volatile const uint32_t  FIFOCNT;         
  uint32_t      RESERVED1[13];   
  volatile uint32_t FIFO;            
} SDIO_TypeDef;



 

typedef struct
{
  volatile uint16_t CR1;         
  uint16_t      RESERVED0;   
  volatile uint16_t CR2;         
  uint16_t      RESERVED1;   
  volatile uint16_t SR;          
  uint16_t      RESERVED2;   
  volatile uint16_t DR;          
  uint16_t      RESERVED3;   
  volatile uint16_t CRCPR;       
  uint16_t      RESERVED4;   
  volatile uint16_t RXCRCR;      
  uint16_t      RESERVED5;   
  volatile uint16_t TXCRCR;      
  uint16_t      RESERVED6;   
  volatile uint16_t I2SCFGR;     
  uint16_t      RESERVED7;   
  volatile uint16_t I2SPR;       
  uint16_t      RESERVED8;   
} SPI_TypeDef;



 

typedef struct
{
  volatile uint16_t CR1;          
  uint16_t      RESERVED0;    
  volatile uint16_t CR2;          
  uint16_t      RESERVED1;    
  volatile uint16_t SMCR;         
  uint16_t      RESERVED2;    
  volatile uint16_t DIER;         
  uint16_t      RESERVED3;    
  volatile uint16_t SR;           
  uint16_t      RESERVED4;    
  volatile uint16_t EGR;          
  uint16_t      RESERVED5;    
  volatile uint16_t CCMR1;        
  uint16_t      RESERVED6;    
  volatile uint16_t CCMR2;        
  uint16_t      RESERVED7;    
  volatile uint16_t CCER;         
  uint16_t      RESERVED8;    
  volatile uint32_t CNT;          
  volatile uint16_t PSC;          
  uint16_t      RESERVED9;    
  volatile uint32_t ARR;          
  volatile uint16_t RCR;          
  uint16_t      RESERVED10;   
  volatile uint32_t CCR1;         
  volatile uint32_t CCR2;         
  volatile uint32_t CCR3;         
  volatile uint32_t CCR4;         
  volatile uint16_t BDTR;         
  uint16_t      RESERVED11;   
  volatile uint16_t DCR;          
  uint16_t      RESERVED12;   
  volatile uint16_t DMAR;         
  uint16_t      RESERVED13;   
  volatile uint16_t OR;           
  uint16_t      RESERVED14;   
} TIM_TypeDef;



 
 
typedef struct
{
  volatile uint16_t SR;          
  uint16_t      RESERVED0;   
  volatile uint16_t DR;          
  uint16_t      RESERVED1;   
  volatile uint16_t BRR;         
  uint16_t      RESERVED2;   
  volatile uint16_t CR1;         
  uint16_t      RESERVED3;   
  volatile uint16_t CR2;         
  uint16_t      RESERVED4;   
  volatile uint16_t CR3;         
  uint16_t      RESERVED5;   
  volatile uint16_t GTPR;        
  uint16_t      RESERVED6;   
} USART_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;    
  volatile uint32_t CFR;   
  volatile uint32_t SR;    
} WWDG_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;      
  volatile uint32_t SR;      
  volatile uint32_t DR;      
  volatile uint32_t DOUT;    
  volatile uint32_t DMACR;   
  volatile uint32_t IMSCR;   
  volatile uint32_t RISR;    
  volatile uint32_t MISR;    
  volatile uint32_t K0LR;    
  volatile uint32_t K0RR;    
  volatile uint32_t K1LR;    
  volatile uint32_t K1RR;    
  volatile uint32_t K2LR;    
  volatile uint32_t K2RR;    
  volatile uint32_t K3LR;    
  volatile uint32_t K3RR;    
  volatile uint32_t IV0LR;   
  volatile uint32_t IV0RR;   
  volatile uint32_t IV1LR;   
  volatile uint32_t IV1RR;   
} CRYP_TypeDef;



 
  
typedef struct 
{
  volatile uint32_t CR;         
  volatile uint32_t DIN;        
  volatile uint32_t STR;        
  volatile uint32_t HR[5];      
  volatile uint32_t IMR;        
  volatile uint32_t SR;         
  uint32_t  RESERVED[52];   
  volatile uint32_t CSR[51];      
} HASH_TypeDef;



 
  
typedef struct 
{
  volatile uint32_t CR;   
  volatile uint32_t SR;   
  volatile uint32_t DR;   
} RNG_TypeDef;



 
  


 










 





 
#line 1034 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1051 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1089 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 





 






 




 
  


   
#line 1194 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"



 



 
  
  

 
    
 
 
 

 
 
 
 
 
 
#line 1223 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1249 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"
  
 
#line 1275 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1313 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1355 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 


 


 


 


 


 
#line 1404 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1442 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1480 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1509 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 


 


 


 



 
#line 1545 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1567 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 



 
 
 
 
 
 
 
#line 1588 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1599 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1617 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"











 





 





 
#line 1655 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 












 
#line 1676 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
 






 




 





 





 






 




 





 





 






   




 





 





 





 




 





 





 





 




 





 





 
 


 
#line 1816 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1833 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1850 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1867 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1901 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1935 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 1969 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2003 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2037 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2071 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2105 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2139 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2173 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2207 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2241 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2275 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2309 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2343 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2377 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2411 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2445 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2479 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2513 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2547 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2581 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2615 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2649 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2683 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2717 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2751 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2785 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 2819 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
 
 
 
 
 



 



 


 
 
 
 
 
 


#line 2856 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 2865 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"
 





 


 


 


 



 
 
 
 
 
 









































 



 


 


 


 


 


 


 



 



 



 


 


 



 
 
 
 
 

 
 
 
 
 
 
#line 3001 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 




 






 






 






 






 
 
 
 
 
  
#line 3076 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 3095 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

  
#line 3106 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

  
#line 3128 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

  
#line 3150 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

  
#line 3172 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

  
#line 3194 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
 
 
 
 
 
#line 3221 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 3243 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 3265 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 3287 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 3309 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 3331 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
 
 
 
 
 
#line 3347 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 3355 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 3364 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 3378 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 3408 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
 
 
 
 
 











#line 3436 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 











#line 3459 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 











#line 3482 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 











#line 3505 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 








































 








































 








































 








































 


































 


































 


































 


































 



























 



























 



























 
#line 3902 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 3911 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 3920 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 3931 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 3941 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 3951 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 3961 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 3972 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 3982 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 3992 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4002 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 4013 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4023 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4033 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4043 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 4054 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4064 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4074 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4084 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 4095 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4105 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4115 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4125 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 4136 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4146 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4156 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4166 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 4177 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4187 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4197 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4207 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 


 
 
 
 
 
 
































































 
#line 4301 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
































































 
































































 
#line 4449 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 4467 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 4501 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
 
 
 
 
 
#line 4522 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 4531 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 



 





 
 
 
 
 
 
#line 4562 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 4571 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"







 



#line 4592 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"



 



 


 
#line 4617 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 4627 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 




 


 
 
 
 
 
 


 





 


 



 
 
 
 
 
 











 
#line 4683 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"





 
#line 4695 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
 
 
 
 
 



#line 4711 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4721 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4730 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 4739 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 4750 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"















 
 








 








 






#line 4800 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 











 











 
#line 4832 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 




















 
#line 4875 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 4891 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 






 


 
#line 4926 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 4939 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 4960 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 






 


 
#line 4995 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 5010 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 5034 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 






 


 
#line 5069 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 5084 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 











 
#line 5108 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 





 



 
 
 
 
 
 



 






 
 
 
 
 
 
#line 5168 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 5198 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 5224 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 5239 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 



 


 



 
#line 5292 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 5334 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 
#line 5366 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 5386 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 5394 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 
 
 
 
 
 




 












 


 






#line 5495 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 


 


 


 


 


 


 


 
















 


 
#line 5565 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 5580 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 5606 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 


 
 
 
 
 
 









#line 5638 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 5646 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 5656 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 


 


 


 





















 




 
 
 
 
 
   




 


 






  
#line 5726 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"


  
#line 5738 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"


  
#line 5750 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"


  
#line 5762 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 






  
#line 5780 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"


  
#line 5792 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"


  
#line 5804 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"


  
#line 5816 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 




           


  
#line 5835 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"


  
#line 5847 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"


  
#line 5859 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"


  
#line 5871 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 






  
#line 5888 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"


  
#line 5899 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"


  
#line 5910 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"


  
#line 5921 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

   



 
 
 
 
 
 
















 









#line 5966 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 

























 
#line 6009 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 6023 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 6033 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 




























 





















 




























 





















 
#line 6152 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 


 


 


 


 


 


 


 
#line 6187 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"





#line 6198 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 6206 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 6213 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 
#line 6224 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"


 
 
 
 
 
 
#line 6242 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 



 
#line 6266 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 6275 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"







 
#line 6295 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 6306 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"



 
 
 
 
 
 
#line 6323 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"



 
#line 6335 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"







 



 
 
 
 
 
 



 









 
#line 6383 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 






 
 
 
 
 
 
#line 6425 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 6441 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 


 
#line 6458 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"
  
 


 
#line 6474 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 



  


 








 

  
#line 6501 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 






 



 


 


 
#line 6530 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 
#line 6545 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 
#line 6560 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 
 
 

 
#line 6575 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 




 




 




 




 


 


 


 


 


 


 
 
 

 
#line 6628 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

#line 6635 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 


 



 


 



 


 


 


 



 
 
 

 
#line 6710 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 


 


 


 


 




   
#line 6761 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 6787 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 
#line 6804 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"

 





 


 


 


 




 

 

  

#line 1 "..\\src\\stm32f2xx_conf.h "



















  

 



 
 
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"




















 

 







 
#line 1 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"




































  



 



 
    
#line 6862 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"



 

  

 

 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"



 



  

 



  
typedef struct
{
  uint32_t ADC_Resolution;                
                                    
  FunctionalState ADC_ScanConvMode;       


  
  FunctionalState ADC_ContinuousConvMode; 

 
  uint32_t ADC_ExternalTrigConvEdge;      


 
  uint32_t ADC_ExternalTrigConv;          


 
  uint32_t ADC_DataAlign;                 

 
  uint8_t  ADC_NbrOfConversion;           


 
}ADC_InitTypeDef;
  


  
typedef struct 
{
  uint32_t ADC_Mode;                      

                                               
  uint32_t ADC_Prescaler;                 

 
  uint32_t ADC_DMAAccessMode;             


 
  uint32_t ADC_TwoSamplingDelay;          

 
  
}ADC_CommonInitTypeDef;


 



  






  
#line 135 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"


  




  
#line 151 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"


  




  
#line 167 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"
                                     


  




  
#line 208 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"
                                     


  




  
#line 225 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"
                                      


  




  
#line 242 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"


  




  
#line 282 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"


  




  






  




  
#line 321 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"





#line 345 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"


  




  
#line 369 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"


  




  
#line 385 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"
                                            


  




  
#line 426 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"


  




  
#line 442 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"


  




  
#line 464 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"


  




  
#line 478 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"


  




  
#line 492 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"
  
#line 500 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_adc.h"


  




  



  




  



  




  



  




  



  




  



  




  



  




  



  




  

 
   

   
void ADC_DeInit(void);

 
void ADC_Init(ADC_TypeDef* ADCx, ADC_InitTypeDef* ADC_InitStruct);
void ADC_StructInit(ADC_InitTypeDef* ADC_InitStruct);
void ADC_CommonInit(ADC_CommonInitTypeDef* ADC_CommonInitStruct);
void ADC_CommonStructInit(ADC_CommonInitTypeDef* ADC_CommonInitStruct);
void ADC_Cmd(ADC_TypeDef* ADCx, FunctionalState NewState);

 
void ADC_AnalogWatchdogCmd(ADC_TypeDef* ADCx, uint32_t ADC_AnalogWatchdog);
void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold,uint16_t LowThreshold);
void ADC_AnalogWatchdogSingleChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel);

 
void ADC_TempSensorVrefintCmd(FunctionalState NewState);
void ADC_VBATCmd(FunctionalState NewState);

 
void ADC_RegularChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel, uint8_t Rank, uint8_t ADC_SampleTime);
void ADC_SoftwareStartConv(ADC_TypeDef* ADCx);
FlagStatus ADC_GetSoftwareStartConvStatus(ADC_TypeDef* ADCx);
void ADC_EOCOnEachRegularChannelCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_ContinuousModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_DiscModeChannelCountConfig(ADC_TypeDef* ADCx, uint8_t Number);
void ADC_DiscModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx);
uint32_t ADC_GetMultiModeConversionValue(void);

 
void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_DMARequestAfterLastTransferCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_MultiModeDMARequestAfterLastTransferCmd(FunctionalState NewState);

 
void ADC_InjectedChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel, uint8_t Rank, uint8_t ADC_SampleTime);
void ADC_InjectedSequencerLengthConfig(ADC_TypeDef* ADCx, uint8_t Length);
void ADC_SetInjectedOffset(ADC_TypeDef* ADCx, uint8_t ADC_InjectedChannel, uint16_t Offset);
void ADC_ExternalTrigInjectedConvConfig(ADC_TypeDef* ADCx, uint32_t ADC_ExternalTrigInjecConv);
void ADC_ExternalTrigInjectedConvEdgeConfig(ADC_TypeDef* ADCx, uint32_t ADC_ExternalTrigInjecConvEdge);
void ADC_SoftwareStartInjectedConv(ADC_TypeDef* ADCx);
FlagStatus ADC_GetSoftwareStartInjectedConvCmdStatus(ADC_TypeDef* ADCx);
void ADC_AutoInjectedConvCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_InjectedDiscModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
uint16_t ADC_GetInjectedConversionValue(ADC_TypeDef* ADCx, uint8_t ADC_InjectedChannel);

 
void ADC_ITConfig(ADC_TypeDef* ADCx, uint16_t ADC_IT, FunctionalState NewState);
FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, uint8_t ADC_FLAG);
void ADC_ClearFlag(ADC_TypeDef* ADCx, uint8_t ADC_FLAG);
ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx, uint16_t ADC_IT);
void ADC_ClearITPendingBit(ADC_TypeDef* ADCx, uint16_t ADC_IT);









  



  

 
#line 29 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_can.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_can.h"



 



 

 






 
typedef struct
{
  uint16_t CAN_Prescaler;   
 
  
  uint8_t CAN_Mode;         
 

  uint8_t CAN_SJW;          


 

  uint8_t CAN_BS1;          

 

  uint8_t CAN_BS2;          
 
  
  FunctionalState CAN_TTCM; 
 
  
  FunctionalState CAN_ABOM;  
 

  FunctionalState CAN_AWUM;  
 

  FunctionalState CAN_NART;  
 

  FunctionalState CAN_RFLM;  
 

  FunctionalState CAN_TXFP;  
 
} CAN_InitTypeDef;



 
typedef struct
{
  uint16_t CAN_FilterIdHigh;         

 

  uint16_t CAN_FilterIdLow;          

 

  uint16_t CAN_FilterMaskIdHigh;     


 

  uint16_t CAN_FilterMaskIdLow;      


 

  uint16_t CAN_FilterFIFOAssignment; 
 
  
  uint8_t CAN_FilterNumber;           

  uint8_t CAN_FilterMode;            
 

  uint8_t CAN_FilterScale;           
 

  FunctionalState CAN_FilterActivation; 
 
} CAN_FilterInitTypeDef;



 
typedef struct
{
  uint32_t StdId;  
 

  uint32_t ExtId;  
 

  uint8_t IDE;     

 

  uint8_t RTR;     

 

  uint8_t DLC;     

 

  uint8_t Data[8]; 
 
} CanTxMsg;



 
typedef struct
{
  uint32_t StdId;  
 

  uint32_t ExtId;  
 

  uint8_t IDE;     

 

  uint8_t RTR;     

 

  uint8_t DLC;     
 

  uint8_t Data[8]; 
 

  uint8_t FMI;     

 
} CanRxMsg;

 



 



 





 




 



 












 


 


   










 
  



   





 



 









 



 
#line 283 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_can.h"




 



 
#line 300 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_can.h"




 



 



 



 



 



 







 



 







 



 





 




 



 



 



 






 



 





 




 



 




 




 



 





 	






 



 






 



 



 	




 



 



 




 




                                                          
#line 475 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_can.h"


 



 

 

 

 




 
#line 499 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_can.h"

 



 

 





#line 520 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_can.h"








 

  


  


 
#line 543 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_can.h"

 



 






 





#line 568 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_can.h"

#line 575 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_can.h"


 



 

 
   

  
void CAN_DeInit(CAN_TypeDef* CANx);

  
uint8_t CAN_Init(CAN_TypeDef* CANx, CAN_InitTypeDef* CAN_InitStruct);
void CAN_FilterInit(CAN_FilterInitTypeDef* CAN_FilterInitStruct);
void CAN_StructInit(CAN_InitTypeDef* CAN_InitStruct);
void CAN_SlaveStartBank(uint8_t CAN_BankNumber); 
void CAN_DBGFreeze(CAN_TypeDef* CANx, FunctionalState NewState);
void CAN_TTComModeCmd(CAN_TypeDef* CANx, FunctionalState NewState);

 
uint8_t CAN_Transmit(CAN_TypeDef* CANx, CanTxMsg* TxMessage);
uint8_t CAN_TransmitStatus(CAN_TypeDef* CANx, uint8_t TransmitMailbox);
void CAN_CancelTransmit(CAN_TypeDef* CANx, uint8_t Mailbox);

 
void CAN_Receive(CAN_TypeDef* CANx, uint8_t FIFONumber, CanRxMsg* RxMessage);
void CAN_FIFORelease(CAN_TypeDef* CANx, uint8_t FIFONumber);
uint8_t CAN_MessagePending(CAN_TypeDef* CANx, uint8_t FIFONumber);

 
uint8_t CAN_OperatingModeRequest(CAN_TypeDef* CANx, uint8_t CAN_OperatingMode);
uint8_t CAN_Sleep(CAN_TypeDef* CANx);
uint8_t CAN_WakeUp(CAN_TypeDef* CANx);

 
uint8_t CAN_GetLastErrorCode(CAN_TypeDef* CANx);
uint8_t CAN_GetReceiveErrorCounter(CAN_TypeDef* CANx);
uint8_t CAN_GetLSBTransmitErrorCounter(CAN_TypeDef* CANx);

 
void CAN_ITConfig(CAN_TypeDef* CANx, uint32_t CAN_IT, FunctionalState NewState);
FlagStatus CAN_GetFlagStatus(CAN_TypeDef* CANx, uint32_t CAN_FLAG);
void CAN_ClearFlag(CAN_TypeDef* CANx, uint32_t CAN_FLAG);
ITStatus CAN_GetITStatus(CAN_TypeDef* CANx, uint32_t CAN_IT);
void CAN_ClearITPendingBit(CAN_TypeDef* CANx, uint32_t CAN_IT);









 



 

 
#line 30 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_crc.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_crc.h"



 



 

 
 



 



 

 
   

void CRC_ResetDR(void);
uint32_t CRC_CalcCRC(uint32_t Data);
uint32_t CRC_CalcBlockCRC(uint32_t pBuffer[], uint32_t BufferLength);
uint32_t CRC_GetCRC(void);
void CRC_SetIDRegister(uint8_t IDValue);
uint8_t CRC_GetIDRegister(void);









 



 

 
#line 31 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_cryp.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_cryp.h"



 



  

 



  
typedef struct
{
  uint16_t CRYP_AlgoDir;   
 
  uint16_t CRYP_AlgoMode;  

 
  uint16_t CRYP_DataType;  
  
  uint16_t CRYP_KeySize;   

 
}CRYP_InitTypeDef;



  
typedef struct
{
  uint32_t CRYP_Key0Left;   
  uint32_t CRYP_Key0Right;  
  uint32_t CRYP_Key1Left;   
  uint32_t CRYP_Key1Right;  
  uint32_t CRYP_Key2Left;   
  uint32_t CRYP_Key2Right;  
  uint32_t CRYP_Key3Left;   
  uint32_t CRYP_Key3Right;  
}CRYP_KeyInitTypeDef;


  
typedef struct
{
  uint32_t CRYP_IV0Left;   
  uint32_t CRYP_IV0Right;  
  uint32_t CRYP_IV1Left;   
  uint32_t CRYP_IV1Right;  
}CRYP_IVInitTypeDef;



  
typedef struct
{
   
  uint32_t CR_bits9to2;
   
  uint32_t CRYP_IV0LR;
  uint32_t CRYP_IV0RR;
  uint32_t CRYP_IV1LR;
  uint32_t CRYP_IV1RR;
   
  uint32_t CRYP_K0LR;
  uint32_t CRYP_K0RR;
  uint32_t CRYP_K1LR;
  uint32_t CRYP_K1RR;
  uint32_t CRYP_K2LR;
  uint32_t CRYP_K2RR;
  uint32_t CRYP_K3LR;
  uint32_t CRYP_K3RR;
}CRYP_Context;


 



 



 







  
 


 

 



 



 





#line 154 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_cryp.h"


  
 


 
#line 169 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_cryp.h"


 
                                     


 
#line 182 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_cryp.h"


 



 
#line 201 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_cryp.h"

#line 209 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_cryp.h"


 



 







 



 





 



 





  



  

 
 

 
void CRYP_DeInit(void);

 
void CRYP_Init(CRYP_InitTypeDef* CRYP_InitStruct);
void CRYP_StructInit(CRYP_InitTypeDef* CRYP_InitStruct);
void CRYP_KeyInit(CRYP_KeyInitTypeDef* CRYP_KeyInitStruct);
void CRYP_KeyStructInit(CRYP_KeyInitTypeDef* CRYP_KeyInitStruct);
void CRYP_IVInit(CRYP_IVInitTypeDef* CRYP_IVInitStruct);
void CRYP_IVStructInit(CRYP_IVInitTypeDef* CRYP_IVInitStruct);
void CRYP_Cmd(FunctionalState NewState);

 
void CRYP_DataIn(uint32_t Data);
uint32_t CRYP_DataOut(void);
void CRYP_FIFOFlush(void);

 
ErrorStatus CRYP_SaveContext(CRYP_Context* CRYP_ContextSave,
                             CRYP_KeyInitTypeDef* CRYP_KeyInitStruct);
void CRYP_RestoreContext(CRYP_Context* CRYP_ContextRestore);

 
void CRYP_DMACmd(uint8_t CRYP_DMAReq, FunctionalState NewState);

 
void CRYP_ITConfig(uint8_t CRYP_IT, FunctionalState NewState);
ITStatus CRYP_GetITStatus(uint8_t CRYP_IT);
FlagStatus CRYP_GetFlagStatus(uint8_t CRYP_FLAG);

 
ErrorStatus CRYP_AES_ECB(uint8_t Mode,
                         uint8_t *Key, uint16_t Keysize,
                         uint8_t *Input, uint32_t Ilength,
                         uint8_t *Output);

ErrorStatus CRYP_AES_CBC(uint8_t Mode,
                         uint8_t InitVectors[16],
                         uint8_t *Key, uint16_t Keysize,
                         uint8_t *Input, uint32_t Ilength,
                         uint8_t *Output);

ErrorStatus CRYP_AES_CTR(uint8_t Mode,
                         uint8_t InitVectors[16],
                         uint8_t *Key, uint16_t Keysize,
                         uint8_t *Input, uint32_t Ilength,
                         uint8_t *Output);

 
ErrorStatus CRYP_TDES_ECB(uint8_t Mode,
                           uint8_t Key[24], 
                           uint8_t *Input, uint32_t Ilength,
                           uint8_t *Output);

ErrorStatus CRYP_TDES_CBC(uint8_t Mode,
                          uint8_t Key[24],
                          uint8_t InitVectors[8],
                          uint8_t *Input, uint32_t Ilength,
                          uint8_t *Output);

 
ErrorStatus CRYP_DES_ECB(uint8_t Mode,
                         uint8_t Key[8],
                         uint8_t *Input, uint32_t Ilength,
                         uint8_t *Output);

ErrorStatus CRYP_DES_CBC(uint8_t Mode,
                         uint8_t Key[8],
                         uint8_t InitVectors[8],
                         uint8_t *Input,uint32_t Ilength,
                         uint8_t *Output);









 



  

 
#line 32 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dac.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dac.h"



 



 

 



 

typedef struct
{
  uint32_t DAC_Trigger;                      
 

  uint32_t DAC_WaveGeneration;               

 

  uint32_t DAC_LFSRUnmask_TriangleAmplitude; 

 

  uint32_t DAC_OutputBuffer;                 
 
}DAC_InitTypeDef;

 



 



 

#line 83 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dac.h"




#line 96 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dac.h"



 



 

#line 111 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dac.h"


 



 

#line 143 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dac.h"

#line 168 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dac.h"


 



 







 



 







 



 

#line 206 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dac.h"


 



 







 



 




 
  


    





  



  
  





 



 

 
   

   
void DAC_DeInit(void);

 
void DAC_Init(uint32_t DAC_Channel, DAC_InitTypeDef* DAC_InitStruct);
void DAC_StructInit(DAC_InitTypeDef* DAC_InitStruct);
void DAC_Cmd(uint32_t DAC_Channel, FunctionalState NewState);
void DAC_SoftwareTriggerCmd(uint32_t DAC_Channel, FunctionalState NewState);
void DAC_DualSoftwareTriggerCmd(FunctionalState NewState);
void DAC_WaveGenerationCmd(uint32_t DAC_Channel, uint32_t DAC_Wave, FunctionalState NewState);
void DAC_SetChannel1Data(uint32_t DAC_Align, uint16_t Data);
void DAC_SetChannel2Data(uint32_t DAC_Align, uint16_t Data);
void DAC_SetDualChannelData(uint32_t DAC_Align, uint16_t Data2, uint16_t Data1);
uint16_t DAC_GetDataOutputValue(uint32_t DAC_Channel);

 
void DAC_DMACmd(uint32_t DAC_Channel, FunctionalState NewState);

 
void DAC_ITConfig(uint32_t DAC_Channel, uint32_t DAC_IT, FunctionalState NewState);
FlagStatus DAC_GetFlagStatus(uint32_t DAC_Channel, uint32_t DAC_FLAG);
void DAC_ClearFlag(uint32_t DAC_Channel, uint32_t DAC_FLAG);
ITStatus DAC_GetITStatus(uint32_t DAC_Channel, uint32_t DAC_IT);
void DAC_ClearITPendingBit(uint32_t DAC_Channel, uint32_t DAC_IT);









 



 

 
#line 33 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dbgmcu.h"



















 

 







 
#line 32 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dbgmcu.h"



 



  

 
 



  





#line 70 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dbgmcu.h"

#line 77 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dbgmcu.h"


  

 
  
uint32_t DBGMCU_GetREVID(void);
uint32_t DBGMCU_GetDEVID(void);
void DBGMCU_Config(uint32_t DBGMCU_Periph, FunctionalState NewState);
void DBGMCU_APB1PeriphConfig(uint32_t DBGMCU_Periph, FunctionalState NewState);
void DBGMCU_APB2PeriphConfig(uint32_t DBGMCU_Periph, FunctionalState NewState);









  



  

 
#line 34 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dcmi.h"



















 

 







 
#line 32 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dcmi.h"



 



  

 


  
typedef struct
{
  uint16_t DCMI_CaptureMode;      
 

  uint16_t DCMI_SynchroMode;      
 

  uint16_t DCMI_PCKPolarity;      
 

  uint16_t DCMI_VSPolarity;       
 

  uint16_t DCMI_HSPolarity;       
 

  uint16_t DCMI_CaptureRate;      
 

  uint16_t DCMI_ExtendedDataMode; 
 
} DCMI_InitTypeDef;



  
typedef struct
{
  uint16_t DCMI_VerticalStartLine;      
 

  uint16_t DCMI_HorizontalOffsetCount;  
 

  uint16_t DCMI_VerticalLineCount;      
 

  uint16_t DCMI_CaptureCount;           

 
} DCMI_CROPInitTypeDef;



  
typedef struct
{
  uint8_t DCMI_FrameStartCode;  
  uint8_t DCMI_LineStartCode;   
  uint8_t DCMI_LineEndCode;     
  uint8_t DCMI_FrameEndCode;    
} DCMI_CodesInitTypeDef;

 



 



  
#line 114 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dcmi.h"


  




  
#line 128 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dcmi.h"


  




  






  




  






  




  






  




  
#line 178 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dcmi.h"


  




  
#line 194 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dcmi.h"


  




  
#line 213 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dcmi.h"


  




  


  





  







  
#line 256 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dcmi.h"
                                



  



  

 
  

  
void DCMI_DeInit(void);

 
void DCMI_Init(DCMI_InitTypeDef* DCMI_InitStruct);
void DCMI_StructInit(DCMI_InitTypeDef* DCMI_InitStruct);
void DCMI_CROPConfig(DCMI_CROPInitTypeDef* DCMI_CROPInitStruct);
void DCMI_CROPCmd(FunctionalState NewState);
void DCMI_SetEmbeddedSynchroCodes(DCMI_CodesInitTypeDef* DCMI_CodesInitStruct);
void DCMI_JPEGCmd(FunctionalState NewState);

 
void DCMI_Cmd(FunctionalState NewState);
void DCMI_CaptureCmd(FunctionalState NewState);
uint32_t DCMI_ReadData(void);

 
void DCMI_ITConfig(uint16_t DCMI_IT, FunctionalState NewState);
FlagStatus DCMI_GetFlagStatus(uint16_t DCMI_FLAG);
void DCMI_ClearFlag(uint16_t DCMI_FLAG);
ITStatus DCMI_GetITStatus(uint16_t DCMI_IT);
void DCMI_ClearITPendingBit(uint16_t DCMI_IT);









  



  

 
#line 35 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dma.h"




















  

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dma.h"



 



 

 



 

typedef struct
{
  uint32_t DMA_Channel;            
 
 
  uint32_t DMA_PeripheralBaseAddr;  

  uint32_t DMA_Memory0BaseAddr;    

 

  uint32_t DMA_DIR;                

 

  uint32_t DMA_BufferSize;         

 

  uint32_t DMA_PeripheralInc;      
 

  uint32_t DMA_MemoryInc;          
 

  uint32_t DMA_PeripheralDataSize; 
 

  uint32_t DMA_MemoryDataSize;     
 

  uint32_t DMA_Mode;               


 

  uint32_t DMA_Priority;           
 

  uint32_t DMA_FIFOMode;          


 

  uint32_t DMA_FIFOThreshold;      
 

  uint32_t DMA_MemoryBurst;        


 

  uint32_t DMA_PeripheralBurst;    


   
}DMA_InitTypeDef;

 



 

#line 128 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dma.h"






  
#line 143 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dma.h"

#line 152 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dma.h"


  




  









  




  



  




  







  




  







  




  









  




  









  




  







  




  











  




  







  




  











  




  











  




  











  




 
#line 340 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dma.h"

#line 347 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dma.h"


  



 
#line 394 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dma.h"




#line 418 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dma.h"


  




  









  




  
#line 481 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dma.h"





#line 506 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_dma.h"


  




  







  




  







  




  






  



  

 
  

  
void DMA_DeInit(DMA_Stream_TypeDef* DMAy_Streamx);

 
void DMA_Init(DMA_Stream_TypeDef* DMAy_Streamx, DMA_InitTypeDef* DMA_InitStruct);
void DMA_StructInit(DMA_InitTypeDef* DMA_InitStruct);
void DMA_Cmd(DMA_Stream_TypeDef* DMAy_Streamx, FunctionalState NewState);

 
void DMA_PeriphIncOffsetSizeConfig(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t DMA_Pincos);
void DMA_FlowControllerConfig(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t DMA_FlowCtrl);

 
void DMA_SetCurrDataCounter(DMA_Stream_TypeDef* DMAy_Streamx, uint16_t Counter);
uint16_t DMA_GetCurrDataCounter(DMA_Stream_TypeDef* DMAy_Streamx);

 
void DMA_DoubleBufferModeConfig(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t Memory1BaseAddr,
                                uint32_t DMA_CurrentMemory);
void DMA_DoubleBufferModeCmd(DMA_Stream_TypeDef* DMAy_Streamx, FunctionalState NewState);
void DMA_MemoryTargetConfig(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t MemoryBaseAddr,
                            uint32_t DMA_MemoryTarget);
uint32_t DMA_GetCurrentMemoryTarget(DMA_Stream_TypeDef* DMAy_Streamx);

 
FunctionalState DMA_GetCmdStatus(DMA_Stream_TypeDef* DMAy_Streamx);
uint32_t DMA_GetFIFOStatus(DMA_Stream_TypeDef* DMAy_Streamx);
FlagStatus DMA_GetFlagStatus(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t DMA_FLAG);
void DMA_ClearFlag(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t DMA_FLAG);
void DMA_ITConfig(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t DMA_IT, FunctionalState NewState);
ITStatus DMA_GetITStatus(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t DMA_IT);
void DMA_ClearITPendingBit(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t DMA_IT);









 



 


 
#line 36 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_exti.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_exti.h"



 



 

 



 

typedef enum
{
  EXTI_Mode_Interrupt = 0x00,
  EXTI_Mode_Event = 0x04
}EXTIMode_TypeDef;





 

typedef enum
{
  EXTI_Trigger_Rising = 0x08,
  EXTI_Trigger_Falling = 0x0C,  
  EXTI_Trigger_Rising_Falling = 0x10
}EXTITrigger_TypeDef;






 

typedef struct
{
  uint32_t EXTI_Line;               
 
   
  EXTIMode_TypeDef EXTI_Mode;       
 

  EXTITrigger_TypeDef EXTI_Trigger; 
 

  FunctionalState EXTI_LineCmd;     
  
}EXTI_InitTypeDef;

 



 



 

#line 122 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_exti.h"
                                          


#line 137 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_exti.h"
                    


 



 

 
 

 
void EXTI_DeInit(void);

 
void EXTI_Init(EXTI_InitTypeDef* EXTI_InitStruct);
void EXTI_StructInit(EXTI_InitTypeDef* EXTI_InitStruct);
void EXTI_GenerateSWInterrupt(uint32_t EXTI_Line);

 
FlagStatus EXTI_GetFlagStatus(uint32_t EXTI_Line);
void EXTI_ClearFlag(uint32_t EXTI_Line);
ITStatus EXTI_GetITStatus(uint32_t EXTI_Line);
void EXTI_ClearITPendingBit(uint32_t EXTI_Line);









 



 

 
#line 37 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_flash.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_flash.h"



 



  

 


  
typedef enum
{ 
  FLASH_BUSY = 1,
  FLASH_ERROR_PGS,
  FLASH_ERROR_PGP,
  FLASH_ERROR_PGA,
  FLASH_ERROR_WRP,
  FLASH_ERROR_PROGRAM,
  FLASH_ERROR_OPERATION,
  FLASH_COMPLETE
}FLASH_Status;

 



   



  
#line 75 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_flash.h"

#line 84 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_flash.h"


  



  











  



  
#line 127 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_flash.h"


  



  
#line 147 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_flash.h"




 



 


  
 





  



  





  



  





  




  





 
  


   
#line 207 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_flash.h"


 



  





  



  
#line 236 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_flash.h"


 



 







  



  







  



  



  






  

 
  
 
 
void FLASH_SetLatency(uint32_t FLASH_Latency);
void FLASH_PrefetchBufferCmd(FunctionalState NewState);
void FLASH_InstructionCacheCmd(FunctionalState NewState);
void FLASH_DataCacheCmd(FunctionalState NewState);
void FLASH_InstructionCacheReset(void);
void FLASH_DataCacheReset(void);

    
void FLASH_Unlock(void);
void FLASH_Lock(void);
FLASH_Status FLASH_EraseSector(uint32_t FLASH_Sector, uint8_t VoltageRange);
FLASH_Status FLASH_EraseAllSectors(uint8_t VoltageRange);
FLASH_Status FLASH_ProgramDoubleWord(uint32_t Address, uint64_t Data);
FLASH_Status FLASH_ProgramWord(uint32_t Address, uint32_t Data);
FLASH_Status FLASH_ProgramHalfWord(uint32_t Address, uint16_t Data);
FLASH_Status FLASH_ProgramByte(uint32_t Address, uint8_t Data);

  
void FLASH_OB_Unlock(void);
void FLASH_OB_Lock(void);
void FLASH_OB_WRPConfig(uint32_t OB_WRP, FunctionalState NewState);
void FLASH_OB_RDPConfig(uint8_t OB_RDP);
void FLASH_OB_UserConfig(uint8_t OB_IWDG, uint8_t OB_STOP, uint8_t OB_STDBY);
void FLASH_OB_BORConfig(uint8_t OB_BOR);
FLASH_Status FLASH_OB_Launch(void);
uint8_t FLASH_OB_GetUser(void);
uint16_t FLASH_OB_GetWRP(void);
FlagStatus FLASH_OB_GetRDP(void);
uint8_t FLASH_OB_GetBOR(void);

 
void FLASH_ITConfig(uint32_t FLASH_IT, FunctionalState NewState);
FlagStatus FLASH_GetFlagStatus(uint32_t FLASH_FLAG);
void FLASH_ClearFlag(uint32_t FLASH_FLAG);
FLASH_Status FLASH_GetStatus(void);
FLASH_Status FLASH_WaitForLastOperation(void);









  



  

 
#line 38 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_fsmc.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_fsmc.h"



 



 

 



 
typedef struct
{
  uint32_t FSMC_AddressSetupTime;       


 

  uint32_t FSMC_AddressHoldTime;        


 

  uint32_t FSMC_DataSetupTime;          


 

  uint32_t FSMC_BusTurnAroundDuration;  


 

  uint32_t FSMC_CLKDivision;            

 

  uint32_t FSMC_DataLatency;            





 

  uint32_t FSMC_AccessMode;             
 
}FSMC_NORSRAMTimingInitTypeDef;



 
typedef struct
{
  uint32_t FSMC_Bank;                
 

  uint32_t FSMC_DataAddressMux;      

 

  uint32_t FSMC_MemoryType;          

 

  uint32_t FSMC_MemoryDataWidth;     
 

  uint32_t FSMC_BurstAccessMode;     

 

  uint32_t FSMC_AsynchronousWait;     

                                           

  uint32_t FSMC_WaitSignalPolarity;  

 

  uint32_t FSMC_WrapMode;            

 

  uint32_t FSMC_WaitSignalActive;    


 

  uint32_t FSMC_WriteOperation;      
 

  uint32_t FSMC_WaitSignal;          

 

  uint32_t FSMC_ExtendedMode;        
 

  uint32_t FSMC_WriteBurst;          
  

  FSMC_NORSRAMTimingInitTypeDef* FSMC_ReadWriteTimingStruct;    

  FSMC_NORSRAMTimingInitTypeDef* FSMC_WriteTimingStruct;            
}FSMC_NORSRAMInitTypeDef;



 
typedef struct
{
  uint32_t FSMC_SetupTime;      



 

  uint32_t FSMC_WaitSetupTime;  



 

  uint32_t FSMC_HoldSetupTime;  




 

  uint32_t FSMC_HiZSetupTime;   



 
}FSMC_NAND_PCCARDTimingInitTypeDef;



 
typedef struct
{
  uint32_t FSMC_Bank;              
 

  uint32_t FSMC_Waitfeature;      
 

  uint32_t FSMC_MemoryDataWidth;  
 

  uint32_t FSMC_ECC;              
 

  uint32_t FSMC_ECCPageSize;      
 

  uint32_t FSMC_TCLRSetupTime;    

 

  uint32_t FSMC_TARSetupTime;     

  

  FSMC_NAND_PCCARDTimingInitTypeDef*  FSMC_CommonSpaceTimingStruct;     

  FSMC_NAND_PCCARDTimingInitTypeDef*  FSMC_AttributeSpaceTimingStruct;  
}FSMC_NANDInitTypeDef;



 

typedef struct
{
  uint32_t FSMC_Waitfeature;    
 

  uint32_t FSMC_TCLRSetupTime;  

 

  uint32_t FSMC_TARSetupTime;   

  

  
  FSMC_NAND_PCCARDTimingInitTypeDef*  FSMC_CommonSpaceTimingStruct;  

  FSMC_NAND_PCCARDTimingInitTypeDef*  FSMC_AttributeSpaceTimingStruct;    
  
  FSMC_NAND_PCCARDTimingInitTypeDef*  FSMC_IOSpaceTimingStruct;    
}FSMC_PCCARDInitTypeDef;

 



 



 






 



   




 



     



 



















 



 







 



 

#line 308 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_fsmc.h"


 



 







 



 







 
    


 






 



 






 



 






 



 






 



 






 



 






 



 







 



 







 



 



 



 



 



 



 



 



 



 



 



 



 



 
#line 485 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_fsmc.h"


 



 
  


 



 






 




 






 



 
#line 535 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_fsmc.h"


 



 



 



 



 



 



 



 



 



 



 



 



 



 
#line 597 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_fsmc.h"


 



 
#line 612 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_fsmc.h"




 



 



 

 
  

 
void FSMC_NORSRAMDeInit(uint32_t FSMC_Bank);
void FSMC_NORSRAMInit(FSMC_NORSRAMInitTypeDef* FSMC_NORSRAMInitStruct);
void FSMC_NORSRAMStructInit(FSMC_NORSRAMInitTypeDef* FSMC_NORSRAMInitStruct);
void FSMC_NORSRAMCmd(uint32_t FSMC_Bank, FunctionalState NewState);

 
void FSMC_NANDDeInit(uint32_t FSMC_Bank);
void FSMC_NANDInit(FSMC_NANDInitTypeDef* FSMC_NANDInitStruct);
void FSMC_NANDStructInit(FSMC_NANDInitTypeDef* FSMC_NANDInitStruct);
void FSMC_NANDCmd(uint32_t FSMC_Bank, FunctionalState NewState);
void FSMC_NANDECCCmd(uint32_t FSMC_Bank, FunctionalState NewState);
uint32_t FSMC_GetECC(uint32_t FSMC_Bank);

 
void FSMC_PCCARDDeInit(void);
void FSMC_PCCARDInit(FSMC_PCCARDInitTypeDef* FSMC_PCCARDInitStruct);
void FSMC_PCCARDStructInit(FSMC_PCCARDInitTypeDef* FSMC_PCCARDInitStruct);
void FSMC_PCCARDCmd(FunctionalState NewState);

 
void FSMC_ITConfig(uint32_t FSMC_Bank, uint32_t FSMC_IT, FunctionalState NewState);
FlagStatus FSMC_GetFlagStatus(uint32_t FSMC_Bank, uint32_t FSMC_FLAG);
void FSMC_ClearFlag(uint32_t FSMC_Bank, uint32_t FSMC_FLAG);
ITStatus FSMC_GetITStatus(uint32_t FSMC_Bank, uint32_t FSMC_IT);
void FSMC_ClearITPendingBit(uint32_t FSMC_Bank, uint32_t FSMC_IT);








 



  

 
#line 39 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_hash.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_hash.h"



 



  

 



  
typedef struct
{
  uint32_t HASH_AlgoSelection; 
 
  uint32_t HASH_AlgoMode;      
 
  uint32_t HASH_DataType;      

 
  uint32_t HASH_HMACKeyType;   
 
}HASH_InitTypeDef;



  
typedef struct
{
  uint32_t Data[5];      
 
} HASH_MsgDigest; 



  
typedef struct
{
  uint32_t HASH_IMR; 
  uint32_t HASH_STR;      
  uint32_t HASH_CR;     
  uint32_t HASH_CSR[51];       
}HASH_Context;

 



  



  







 



  







 



   











 



  







 



   




 



   





				   


 



   

















  



  

 
  
  
 
void HASH_DeInit(void);

 
void HASH_Init(HASH_InitTypeDef* HASH_InitStruct);
void HASH_StructInit(HASH_InitTypeDef* HASH_InitStruct);
void HASH_Reset(void);

 
void HASH_DataIn(uint32_t Data);
uint8_t HASH_GetInFIFOWordsNbr(void);
void HASH_SetLastWordValidBitsNbr(uint16_t ValidNumber);
void HASH_StartDigest(void);
void HASH_GetDigest(HASH_MsgDigest* HASH_MessageDigest);

 
void HASH_SaveContext(HASH_Context* HASH_ContextSave);
void HASH_RestoreContext(HASH_Context* HASH_ContextRestore);

 
void HASH_DMACmd(FunctionalState NewState);

 
void HASH_ITConfig(uint8_t HASH_IT, FunctionalState NewState);
FlagStatus HASH_GetFlagStatus(uint16_t HASH_FLAG);
void HASH_ClearFlag(uint16_t HASH_FLAG);
ITStatus HASH_GetITStatus(uint8_t HASH_IT);
void HASH_ClearITPendingBit(uint8_t HASH_IT);

 
ErrorStatus HASH_SHA1(uint8_t *Input, uint32_t Ilen, uint8_t Output[20]);
ErrorStatus HMAC_SHA1(uint8_t *Key, uint32_t Keylen,
                      uint8_t *Input, uint32_t Ilen,
                      uint8_t Output[20]);

 
ErrorStatus HASH_MD5(uint8_t *Input, uint32_t Ilen, uint8_t Output[16]);
ErrorStatus HMAC_MD5(uint8_t *Key, uint32_t Keylen,
                     uint8_t *Input, uint32_t Ilen,
                     uint8_t Output[16]);









  



  

 
#line 40 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_gpio.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_gpio.h"



 



  

 

#line 53 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_gpio.h"
                                                                


    
typedef enum
{ 
  GPIO_Mode_IN   = 0x00,  
  GPIO_Mode_OUT  = 0x01,  
  GPIO_Mode_AF   = 0x02,  
  GPIO_Mode_AN   = 0x03   
}GPIOMode_TypeDef;





   
typedef enum
{ 
  GPIO_OType_PP = 0x00,
  GPIO_OType_OD = 0x01
}GPIOOType_TypeDef;





   
typedef enum
{ 
  GPIO_Speed_2MHz   = 0x00,  
  GPIO_Speed_25MHz  = 0x01,  
  GPIO_Speed_50MHz  = 0x02,  
  GPIO_Speed_100MHz = 0x03   
}GPIOSpeed_TypeDef;





  
typedef enum
{ 
  GPIO_PuPd_NOPULL = 0x00,
  GPIO_PuPd_UP     = 0x01,
  GPIO_PuPd_DOWN   = 0x02
}GPIOPuPd_TypeDef;





  
typedef enum
{ 
  Bit_RESET = 0,
  Bit_SET
}BitAction;





  
typedef struct
{
  uint32_t GPIO_Pin;              
 

  GPIOMode_TypeDef GPIO_Mode;     
 

  GPIOSpeed_TypeDef GPIO_Speed;   
 

  GPIOOType_TypeDef GPIO_OType;   
 

  GPIOPuPd_TypeDef GPIO_PuPd;     
 
}GPIO_InitTypeDef;

 



  



  
#line 161 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_gpio.h"

#line 179 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_gpio.h"


  




  
#line 203 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_gpio.h"

#line 220 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_gpio.h"


  



  


  








  





  






  







  






  





  




  






  






  








  





  




  






  




  


#line 344 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_gpio.h"


  



 
    








 



 

 
  

 
void GPIO_DeInit(GPIO_TypeDef* GPIOx);

 
void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_InitTypeDef* GPIO_InitStruct);
void GPIO_StructInit(GPIO_InitTypeDef* GPIO_InitStruct);
void GPIO_PinLockConfig(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);

 
uint8_t GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
uint16_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx);
uint8_t GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
uint16_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx);
void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void GPIO_WriteBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, BitAction BitVal);
void GPIO_Write(GPIO_TypeDef* GPIOx, uint16_t PortVal);
void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);

 
void GPIO_PinAFConfig(GPIO_TypeDef* GPIOx, uint16_t GPIO_PinSource, uint8_t GPIO_AF);









  



  

 
#line 41 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_i2c.h"




















  

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_i2c.h"



 



 

 



 

typedef struct
{
  uint32_t I2C_ClockSpeed;          
 

  uint16_t I2C_Mode;                
 

  uint16_t I2C_DutyCycle;           
 

  uint16_t I2C_OwnAddress1;         
 

  uint16_t I2C_Ack;                 
 

  uint16_t I2C_AcknowledgedAddress; 
 
}I2C_InitTypeDef;

 




 





 

#line 88 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_i2c.h"


 



 







  



 







 



 







 



 







  



 

#line 162 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_i2c.h"


 



 







  



 







 



 







  



 







  



 

#line 232 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_i2c.h"



#line 242 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_i2c.h"


 



 



 

#line 261 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_i2c.h"



 

#line 280 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_i2c.h"



#line 294 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_i2c.h"


 



 





 








 
 

























 

 


 





























 

  
 


 
 

 







 

























 

    
 



 



 



























 

  
 

 


 
 


 






 

#line 500 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_i2c.h"


 



 




 



 




 



 

 
  

 
void I2C_DeInit(I2C_TypeDef* I2Cx);

 
void I2C_Init(I2C_TypeDef* I2Cx, I2C_InitTypeDef* I2C_InitStruct);
void I2C_StructInit(I2C_InitTypeDef* I2C_InitStruct);
void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, uint8_t I2C_Direction);
void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address);
void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, uint16_t I2C_DutyCycle);
void I2C_NACKPositionConfig(I2C_TypeDef* I2Cx, uint16_t I2C_NACKPosition);
void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, uint16_t I2C_SMBusAlert);
void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);

  
void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data);
uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx);

  
void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, uint16_t I2C_PECPosition);
void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState);
uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx);

 
void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);

 
uint16_t I2C_ReadRegister(I2C_TypeDef* I2Cx, uint8_t I2C_Register);
void I2C_ITConfig(I2C_TypeDef* I2Cx, uint16_t I2C_IT, FunctionalState NewState);




















































































 





 
ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, uint32_t I2C_EVENT);




 
uint32_t I2C_GetLastEvent(I2C_TypeDef* I2Cx);




 
FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, uint32_t I2C_FLAG);


void I2C_ClearFlag(I2C_TypeDef* I2Cx, uint32_t I2C_FLAG);
ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, uint32_t I2C_IT);
void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, uint32_t I2C_IT);









  



  

 
#line 42 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_iwdg.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_iwdg.h"



 



 

 
 



 
  


 






 



 
#line 77 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_iwdg.h"


 



 






 



 

 
 

 
void IWDG_WriteAccessCmd(uint16_t IWDG_WriteAccess);
void IWDG_SetPrescaler(uint8_t IWDG_Prescaler);
void IWDG_SetReload(uint16_t Reload);
void IWDG_ReloadCounter(void);

 
void IWDG_Enable(void);

 
FlagStatus IWDG_GetFlagStatus(uint16_t IWDG_FLAG);









 



 

 
#line 43 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_pwr.h"




















  

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_pwr.h"



 



  

 
 



  



  

#line 61 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_pwr.h"







 

  


 







 



 




 


 



 












 



 

 
  

  
void PWR_DeInit(void);

  
void PWR_BackupAccessCmd(FunctionalState NewState);

  
void PWR_PVDLevelConfig(uint32_t PWR_PVDLevel);
void PWR_PVDCmd(FunctionalState NewState);

  
void PWR_WakeUpPinCmd(FunctionalState NewState);

  
void PWR_BackupRegulatorCmd(FunctionalState NewState);

  
void PWR_FlashPowerDownCmd(FunctionalState NewState);

  
void PWR_EnterSTOPMode(uint32_t PWR_Regulator, uint8_t PWR_STOPEntry);
void PWR_EnterSTANDBYMode(void);

  
FlagStatus PWR_GetFlagStatus(uint32_t PWR_FLAG);
void PWR_ClearFlag(uint32_t PWR_FLAG);









 



 

 
#line 44 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"



















 

 







 
#line 32 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"



 



  

 
typedef struct
{
  uint32_t SYSCLK_Frequency;  
  uint32_t HCLK_Frequency;    
  uint32_t PCLK1_Frequency;   
  uint32_t PCLK2_Frequency;   
}RCC_ClocksTypeDef;

 



 
  


 







  
  


 
#line 79 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"
 




  
  


 
#line 95 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"


  
  


 
#line 116 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"


  
  


 
#line 131 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"


  
  


 
#line 151 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"


  
  


 







  
  


 
#line 234 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"


  
  


 






  
  


  
#line 277 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"


  
  


   
#line 290 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"


  
  


  




  
  


  
#line 330 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"


  
  


  
#line 353 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"


  
  


 
#line 371 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"
                                   





  
  


 
#line 393 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"
                                   





  
  


 
#line 425 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rcc.h"


  



  

 
  

 
void RCC_DeInit(void);

 
void RCC_HSEConfig(uint8_t RCC_HSE);
ErrorStatus RCC_WaitForHSEStartUp(void);
void RCC_AdjustHSICalibrationValue(uint8_t HSICalibrationValue);
void RCC_HSICmd(FunctionalState NewState);
void RCC_LSEConfig(uint8_t RCC_LSE);
void RCC_LSICmd(FunctionalState NewState);

void RCC_PLLConfig(uint32_t RCC_PLLSource, uint32_t PLLM, uint32_t PLLN, uint32_t PLLP, uint32_t PLLQ);
void RCC_PLLCmd(FunctionalState NewState);
void RCC_PLLI2SConfig(uint32_t PLLI2SN, uint32_t PLLI2SR);
void RCC_PLLI2SCmd(FunctionalState NewState);

void RCC_ClockSecuritySystemCmd(FunctionalState NewState);
void RCC_MCO1Config(uint32_t RCC_MCO1Source, uint32_t RCC_MCO1Div);
void RCC_MCO2Config(uint32_t RCC_MCO2Source, uint32_t RCC_MCO2Div);

 
void RCC_SYSCLKConfig(uint32_t RCC_SYSCLKSource);
uint8_t RCC_GetSYSCLKSource(void);
void RCC_HCLKConfig(uint32_t RCC_SYSCLK);
void RCC_PCLK1Config(uint32_t RCC_HCLK);
void RCC_PCLK2Config(uint32_t RCC_HCLK);
void RCC_GetClocksFreq(RCC_ClocksTypeDef* RCC_Clocks);

 
void RCC_RTCCLKConfig(uint32_t RCC_RTCCLKSource);
void RCC_RTCCLKCmd(FunctionalState NewState);
void RCC_BackupResetCmd(FunctionalState NewState);
void RCC_I2SCLKConfig(uint32_t RCC_I2SCLKSource); 

void RCC_AHB1PeriphClockCmd(uint32_t RCC_AHB1Periph, FunctionalState NewState);
void RCC_AHB2PeriphClockCmd(uint32_t RCC_AHB2Periph, FunctionalState NewState);
void RCC_AHB3PeriphClockCmd(uint32_t RCC_AHB3Periph, FunctionalState NewState);
void RCC_APB1PeriphClockCmd(uint32_t RCC_APB1Periph, FunctionalState NewState);
void RCC_APB2PeriphClockCmd(uint32_t RCC_APB2Periph, FunctionalState NewState);

void RCC_AHB1PeriphResetCmd(uint32_t RCC_AHB1Periph, FunctionalState NewState);
void RCC_AHB2PeriphResetCmd(uint32_t RCC_AHB2Periph, FunctionalState NewState);
void RCC_AHB3PeriphResetCmd(uint32_t RCC_AHB3Periph, FunctionalState NewState);
void RCC_APB1PeriphResetCmd(uint32_t RCC_APB1Periph, FunctionalState NewState);
void RCC_APB2PeriphResetCmd(uint32_t RCC_APB2Periph, FunctionalState NewState);

void RCC_AHB1PeriphClockLPModeCmd(uint32_t RCC_AHB1Periph, FunctionalState NewState);
void RCC_AHB2PeriphClockLPModeCmd(uint32_t RCC_AHB2Periph, FunctionalState NewState);
void RCC_AHB3PeriphClockLPModeCmd(uint32_t RCC_AHB3Periph, FunctionalState NewState);
void RCC_APB1PeriphClockLPModeCmd(uint32_t RCC_APB1Periph, FunctionalState NewState);
void RCC_APB2PeriphClockLPModeCmd(uint32_t RCC_APB2Periph, FunctionalState NewState);

 
void RCC_ITConfig(uint8_t RCC_IT, FunctionalState NewState);
FlagStatus RCC_GetFlagStatus(uint8_t RCC_FLAG);
void RCC_ClearFlag(void);
ITStatus RCC_GetITStatus(uint8_t RCC_IT);
void RCC_ClearITPendingBit(uint8_t RCC_IT);









  



  

 
#line 45 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rng.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rng.h"



 



  

 
  



 
  


  











  



   







  



  

 
  

  
void RNG_DeInit(void);

 
void RNG_Cmd(FunctionalState NewState);

 
uint32_t RNG_GetRandomNumber(void);

 
void RNG_ITConfig(FunctionalState NewState);
FlagStatus RNG_GetFlagStatus(uint8_t RNG_FLAG);
void RNG_ClearFlag(uint8_t RNG_FLAG);
ITStatus RNG_GetITStatus(uint8_t RNG_IT);
void RNG_ClearITPendingBit(uint8_t RNG_IT);









  



  

 
#line 46 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rtc.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rtc.h"



 



  

 



  
typedef struct
{
  uint32_t RTC_HourFormat;   
 
  
  uint32_t RTC_AsynchPrediv; 
 
  
  uint32_t RTC_SynchPrediv;  
 
}RTC_InitTypeDef;



 
typedef struct
{
  uint8_t RTC_Hours;    


 

  uint8_t RTC_Minutes;  
 
  
  uint8_t RTC_Seconds;  
 

  uint8_t RTC_H12;      
 
}RTC_TimeTypeDef; 



 
typedef struct
{
  uint8_t RTC_WeekDay; 
 
  
  uint8_t RTC_Month;   
 

  uint8_t RTC_Date;     
 
  
  uint8_t RTC_Year;     
 
}RTC_DateTypeDef;



 
typedef struct
{
  RTC_TimeTypeDef RTC_AlarmTime;      

  uint32_t RTC_AlarmMask;            
 

  uint32_t RTC_AlarmDateWeekDaySel;  
 
  
  uint8_t RTC_AlarmDateWeekDay;      



 
}RTC_AlarmTypeDef;

 



  




  






  



  

 


  




  




  



  







  



  






  



  




  



  

 
#line 205 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rtc.h"



  



  
  
#line 228 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rtc.h"


  




  
#line 244 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rtc.h"



  




  








  




  
#line 274 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rtc.h"



  



  







  



  
#line 307 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rtc.h"


  



  






  



  




 







  



  






  




  








  




  











  



  







  



  





 



  






  



  






  



  







  



 

#line 481 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rtc.h"


  



  






  



  
#line 518 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rtc.h"



  



  
#line 532 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_rtc.h"









  



  





  



  

 
  

 
ErrorStatus RTC_DeInit(void);

 
ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct);
void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct);
void RTC_WriteProtectionCmd(FunctionalState NewState);
ErrorStatus RTC_EnterInitMode(void);
void RTC_ExitInitMode(void);
ErrorStatus RTC_WaitForSynchro(void);
ErrorStatus RTC_RefClockCmd(FunctionalState NewState);

 
ErrorStatus RTC_SetTime(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_TimeStruct);
void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct);
void RTC_GetTime(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_TimeStruct);
ErrorStatus RTC_SetDate(uint32_t RTC_Format, RTC_DateTypeDef* RTC_DateStruct);
void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct);
void RTC_GetDate(uint32_t RTC_Format, RTC_DateTypeDef* RTC_DateStruct);

 
void RTC_SetAlarm(uint32_t RTC_Format, uint32_t RTC_Alarm, RTC_AlarmTypeDef* RTC_AlarmStruct);
void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct);
void RTC_GetAlarm(uint32_t RTC_Format, uint32_t RTC_Alarm, RTC_AlarmTypeDef* RTC_AlarmStruct);
ErrorStatus RTC_AlarmCmd(uint32_t RTC_Alarm, FunctionalState NewState);

 
void RTC_WakeUpClockConfig(uint32_t RTC_WakeUpClock);
void RTC_SetWakeUpCounter(uint32_t RTC_WakeUpCounter);
uint32_t RTC_GetWakeUpCounter(void);
ErrorStatus RTC_WakeUpCmd(FunctionalState NewState);

 
void RTC_DayLightSavingConfig(uint32_t RTC_DayLightSaving, uint32_t RTC_StoreOperation);
uint32_t RTC_GetStoreOperation(void);

 
void RTC_OutputConfig(uint32_t RTC_Output, uint32_t RTC_OutputPolarity);

 
ErrorStatus RTC_CoarseCalibConfig(uint32_t RTC_CalibSign, uint32_t Value);
ErrorStatus RTC_CoarseCalibCmd(FunctionalState NewState);
void RTC_CalibOutputCmd(FunctionalState NewState);

 
void RTC_TimeStampCmd(uint32_t RTC_TimeStampEdge, FunctionalState NewState);
void RTC_GetTimeStamp(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_StampTimeStruct,
                                      RTC_DateTypeDef* RTC_StampDateStruct);                                  

 
void RTC_TamperTriggerConfig(uint32_t RTC_Tamper, uint32_t RTC_TamperTrigger);
void RTC_TamperCmd(uint32_t RTC_Tamper, FunctionalState NewState);

 
void RTC_WriteBackupRegister(uint32_t RTC_BKP_DR, uint32_t Data);
uint32_t RTC_ReadBackupRegister(uint32_t RTC_BKP_DR);


 
void RTC_TamperPinSelection(uint32_t RTC_TamperPin);
void RTC_TimeStampPinSelection(uint32_t RTC_TimeStampPin);
void RTC_OutputTypeConfig(uint32_t RTC_OutputType);

 
void RTC_ITConfig(uint32_t RTC_IT, FunctionalState NewState);
FlagStatus RTC_GetFlagStatus(uint32_t RTC_FLAG);
void RTC_ClearFlag(uint32_t RTC_FLAG);
ITStatus RTC_GetITStatus(uint32_t RTC_IT);
void RTC_ClearITPendingBit(uint32_t RTC_IT);









  



  

 
#line 47 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_sdio.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_sdio.h"



 



 

 

typedef struct
{
  uint32_t SDIO_ClockEdge;            
 

  uint32_t SDIO_ClockBypass;          

 

  uint32_t SDIO_ClockPowerSave;       

 

  uint32_t SDIO_BusWide;              
 

  uint32_t SDIO_HardwareFlowControl;  
 

  uint8_t SDIO_ClockDiv;              
 
                                           
} SDIO_InitTypeDef;

typedef struct
{
  uint32_t SDIO_Argument;  


 

  uint32_t SDIO_CmdIndex;   

  uint32_t SDIO_Response;  
 

  uint32_t SDIO_Wait;      
 

  uint32_t SDIO_CPSM;      

 
} SDIO_CmdInitTypeDef;

typedef struct
{
  uint32_t SDIO_DataTimeOut;     

  uint32_t SDIO_DataLength;      
 
  uint32_t SDIO_DataBlockSize;  
 
 
  uint32_t SDIO_TransferDir;    

 
 
  uint32_t SDIO_TransferMode;   
 
 
  uint32_t SDIO_DPSM;           

 
} SDIO_DataInitTypeDef;


 



 



 







 



 







  



 







 



 









 



 







 



 






  




 

#line 219 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_sdio.h"


  



 




 



 

#line 242 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_sdio.h"


 



 








 



 






  



 

#line 280 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_sdio.h"


 



 




 



 

#line 327 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_sdio.h"


 



 







 



 







 



 






 



 

#line 418 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_sdio.h"



#line 445 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_sdio.h"





 



 







 



 

 
 
 
void SDIO_DeInit(void);

 
void SDIO_Init(SDIO_InitTypeDef* SDIO_InitStruct);
void SDIO_StructInit(SDIO_InitTypeDef* SDIO_InitStruct);
void SDIO_ClockCmd(FunctionalState NewState);
void SDIO_SetPowerState(uint32_t SDIO_PowerState);
uint32_t SDIO_GetPowerState(void);

 
void SDIO_SendCommand(SDIO_CmdInitTypeDef *SDIO_CmdInitStruct);
void SDIO_CmdStructInit(SDIO_CmdInitTypeDef* SDIO_CmdInitStruct);
uint8_t SDIO_GetCommandResponse(void);
uint32_t SDIO_GetResponse(uint32_t SDIO_RESP);

 
void SDIO_DataConfig(SDIO_DataInitTypeDef* SDIO_DataInitStruct);
void SDIO_DataStructInit(SDIO_DataInitTypeDef* SDIO_DataInitStruct);
uint32_t SDIO_GetDataCounter(void);
uint32_t SDIO_ReadData(void);
void SDIO_WriteData(uint32_t Data);
uint32_t SDIO_GetFIFOCount(void);

 
void SDIO_StartSDIOReadWait(FunctionalState NewState);
void SDIO_StopSDIOReadWait(FunctionalState NewState);
void SDIO_SetSDIOReadWaitMode(uint32_t SDIO_ReadWaitMode);
void SDIO_SetSDIOOperation(FunctionalState NewState);
void SDIO_SendSDIOSuspendCmd(FunctionalState NewState);

 
void SDIO_CommandCompletionCmd(FunctionalState NewState);
void SDIO_CEATAITCmd(FunctionalState NewState);
void SDIO_SendCEATACmd(FunctionalState NewState);

 
void SDIO_DMACmd(FunctionalState NewState);

 
void SDIO_ITConfig(uint32_t SDIO_IT, FunctionalState NewState);
FlagStatus SDIO_GetFlagStatus(uint32_t SDIO_FLAG);
void SDIO_ClearFlag(uint32_t SDIO_FLAG);
ITStatus SDIO_GetITStatus(uint32_t SDIO_IT);
void SDIO_ClearITPendingBit(uint32_t SDIO_IT);









 



 

 
#line 48 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_spi.h"




















  

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_spi.h"



 



  

 



 

typedef struct
{
  uint16_t SPI_Direction;           
 

  uint16_t SPI_Mode;                
 

  uint16_t SPI_DataSize;            
 

  uint16_t SPI_CPOL;                
 

  uint16_t SPI_CPHA;                
 

  uint16_t SPI_NSS;                 

 
 
  uint16_t SPI_BaudRatePrescaler;   



 

  uint16_t SPI_FirstBit;            
 

  uint16_t SPI_CRCPolynomial;        
}SPI_InitTypeDef;



 

typedef struct
{

  uint16_t I2S_Mode;         
 

  uint16_t I2S_Standard;     
 

  uint16_t I2S_DataFormat;   
 

  uint16_t I2S_MCLKOutput;   
 

  uint32_t I2S_AudioFreq;    
 

  uint16_t I2S_CPOL;         
 
}I2S_InitTypeDef;

 



 










 
  
#line 132 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_spi.h"


 



 







 



 







  



 







 



 







 



 







  



 

#line 216 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_spi.h"


  



 







 



 

#line 244 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_spi.h"


 
  



 

#line 263 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_spi.h"


 
  


 

#line 279 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_spi.h"


 



 







 



 

#line 309 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_spi.h"






 
            


 







 



 






 



 







 



 






 



 







 



 























 



 

#line 416 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_spi.h"

#line 423 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_spi.h"


 



 




 



 

#line 459 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_spi.h"


 
  


 

 
  

  
void SPI_I2S_DeInit(SPI_TypeDef* SPIx);

 
void SPI_Init(SPI_TypeDef* SPIx, SPI_InitTypeDef* SPI_InitStruct);
void I2S_Init(SPI_TypeDef* SPIx, I2S_InitTypeDef* I2S_InitStruct);
void SPI_StructInit(SPI_InitTypeDef* SPI_InitStruct);
void I2S_StructInit(I2S_InitTypeDef* I2S_InitStruct);
void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState);
void I2S_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState);
void SPI_DataSizeConfig(SPI_TypeDef* SPIx, uint16_t SPI_DataSize);
void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, uint16_t SPI_Direction);
void SPI_NSSInternalSoftwareConfig(SPI_TypeDef* SPIx, uint16_t SPI_NSSInternalSoft);
void SPI_SSOutputCmd(SPI_TypeDef* SPIx, FunctionalState NewState);
void SPI_TIModeCmd(SPI_TypeDef* SPIx, FunctionalState NewState);

  
void SPI_I2S_SendData(SPI_TypeDef* SPIx, uint16_t Data);
uint16_t SPI_I2S_ReceiveData(SPI_TypeDef* SPIx);

 
void SPI_CalculateCRC(SPI_TypeDef* SPIx, FunctionalState NewState);
void SPI_TransmitCRC(SPI_TypeDef* SPIx);
uint16_t SPI_GetCRC(SPI_TypeDef* SPIx, uint8_t SPI_CRC);
uint16_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx);

 
void SPI_I2S_DMACmd(SPI_TypeDef* SPIx, uint16_t SPI_I2S_DMAReq, FunctionalState NewState);

 
void SPI_I2S_ITConfig(SPI_TypeDef* SPIx, uint8_t SPI_I2S_IT, FunctionalState NewState);
FlagStatus SPI_I2S_GetFlagStatus(SPI_TypeDef* SPIx, uint16_t SPI_I2S_FLAG);
void SPI_I2S_ClearFlag(SPI_TypeDef* SPIx, uint16_t SPI_I2S_FLAG);
ITStatus SPI_I2S_GetITStatus(SPI_TypeDef* SPIx, uint8_t SPI_I2S_IT);
void SPI_I2S_ClearITPendingBit(SPI_TypeDef* SPIx, uint8_t SPI_I2S_IT);









 



 

 
#line 49 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_syscfg.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_syscfg.h"



 



  

 
 
  


  



  
#line 61 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_syscfg.h"
                                      
#line 71 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_syscfg.h"


  




  
#line 111 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_syscfg.h"


  




  




   






  




  







  



  

 
  
 
void SYSCFG_DeInit(void);
void SYSCFG_MemoryRemapConfig(uint8_t SYSCFG_MemoryRemap);
void SYSCFG_EXTILineConfig(uint8_t EXTI_PortSourceGPIOx, uint8_t EXTI_PinSourcex);
void SYSCFG_ETH_MediaInterfaceConfig(uint32_t SYSCFG_ETH_MediaInterface); 
void SYSCFG_CompensationCellCmd(FunctionalState NewState); 
FlagStatus SYSCFG_GetCompensationCellStatus(void);









  



  

 
#line 50 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"



 



  

 




 

typedef struct
{
  uint16_t TIM_Prescaler;         
 

  uint16_t TIM_CounterMode;       
 

  uint32_t TIM_Period;            

  

  uint16_t TIM_ClockDivision;     
 

  uint8_t TIM_RepetitionCounter;  






 
} TIM_TimeBaseInitTypeDef; 



 

typedef struct
{
  uint16_t TIM_OCMode;        
 

  uint16_t TIM_OutputState;   
 

  uint16_t TIM_OutputNState;  

 

  uint32_t TIM_Pulse;         
 

  uint16_t TIM_OCPolarity;    
 

  uint16_t TIM_OCNPolarity;   

 

  uint16_t TIM_OCIdleState;   

 

  uint16_t TIM_OCNIdleState;  

 
} TIM_OCInitTypeDef;



 

typedef struct
{

  uint16_t TIM_Channel;      
 

  uint16_t TIM_ICPolarity;   
 

  uint16_t TIM_ICSelection;  
 

  uint16_t TIM_ICPrescaler;  
 

  uint16_t TIM_ICFilter;     
 
} TIM_ICInitTypeDef;




 

typedef struct
{

  uint16_t TIM_OSSRState;        
 

  uint16_t TIM_OSSIState;        
 

  uint16_t TIM_LOCKLevel;        
  

  uint16_t TIM_DeadTime;         

 

  uint16_t TIM_Break;            
 

  uint16_t TIM_BreakPolarity;    
 

  uint16_t TIM_AutomaticOutput;  
 
} TIM_BDTRInitTypeDef;

 



 

#line 183 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"
                                          
#line 196 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"
                                     
 
#line 206 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"
 
#line 213 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"
 


 
#line 225 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"
                                






 

#line 254 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


 



 







  



 





                                 




                                 







  



 

#line 303 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


 



 

#line 321 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


  



 







 



 
  






 



 







  



 







  



 







  



 







  



 







  



 







  



 







  



 

#line 445 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


  



 







 



 







  



 







  



 







  



 

#line 507 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


  



 

#line 523 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


  



 

#line 539 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


  



 

#line 556 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"

#line 565 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


  



 

#line 613 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


  



 

#line 657 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


  



 

#line 673 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"



  



 

#line 690 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


  



 

#line 718 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


  



 







  



  






 



 







  



 







  



 

#line 779 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


  




 

#line 797 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"
  


  



 

#line 812 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


  



 







  



 





                                     


  



 







  



 

#line 873 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


  



 

#line 889 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


  



 







  


 














#line 931 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"



  


 

#line 963 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"



  



 




  



 




  



 

#line 1008 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_tim.h"


 



 

 
  

 
void TIM_DeInit(TIM_TypeDef* TIMx);
void TIM_TimeBaseInit(TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct);
void TIM_TimeBaseStructInit(TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct);
void TIM_PrescalerConfig(TIM_TypeDef* TIMx, uint16_t Prescaler, uint16_t TIM_PSCReloadMode);
void TIM_CounterModeConfig(TIM_TypeDef* TIMx, uint16_t TIM_CounterMode);
void TIM_SetCounter(TIM_TypeDef* TIMx, uint32_t Counter);
void TIM_SetAutoreload(TIM_TypeDef* TIMx, uint32_t Autoreload);
uint32_t TIM_GetCounter(TIM_TypeDef* TIMx);
uint16_t TIM_GetPrescaler(TIM_TypeDef* TIMx);
void TIM_UpdateDisableConfig(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_UpdateRequestConfig(TIM_TypeDef* TIMx, uint16_t TIM_UpdateSource);
void TIM_ARRPreloadConfig(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_SelectOnePulseMode(TIM_TypeDef* TIMx, uint16_t TIM_OPMode);
void TIM_SetClockDivision(TIM_TypeDef* TIMx, uint16_t TIM_CKD);
void TIM_Cmd(TIM_TypeDef* TIMx, FunctionalState NewState);

 
void TIM_OC1Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC2Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC3Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC4Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OCStructInit(TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_SelectOCxM(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_OCMode);
void TIM_SetCompare1(TIM_TypeDef* TIMx, uint32_t Compare1);
void TIM_SetCompare2(TIM_TypeDef* TIMx, uint32_t Compare2);
void TIM_SetCompare3(TIM_TypeDef* TIMx, uint32_t Compare3);
void TIM_SetCompare4(TIM_TypeDef* TIMx, uint32_t Compare4);
void TIM_ForcedOC1Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_ForcedOC2Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_ForcedOC3Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_ForcedOC4Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_OC1PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC2PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC3PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC4PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC1FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_OC2FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_OC3FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_OC4FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_ClearOC1Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_ClearOC2Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_ClearOC3Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_ClearOC4Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_OC1PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_OC1NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity);
void TIM_OC2PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_OC2NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity);
void TIM_OC3PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_OC3NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity);
void TIM_OC4PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_CCxCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCx);
void TIM_CCxNCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCxN);

 
void TIM_ICInit(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct);
void TIM_ICStructInit(TIM_ICInitTypeDef* TIM_ICInitStruct);
void TIM_PWMIConfig(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct);
uint32_t TIM_GetCapture1(TIM_TypeDef* TIMx);
uint32_t TIM_GetCapture2(TIM_TypeDef* TIMx);
uint32_t TIM_GetCapture3(TIM_TypeDef* TIMx);
uint32_t TIM_GetCapture4(TIM_TypeDef* TIMx);
void TIM_SetIC1Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);
void TIM_SetIC2Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);
void TIM_SetIC3Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);
void TIM_SetIC4Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);

 
void TIM_BDTRConfig(TIM_TypeDef* TIMx, TIM_BDTRInitTypeDef *TIM_BDTRInitStruct);
void TIM_BDTRStructInit(TIM_BDTRInitTypeDef* TIM_BDTRInitStruct);
void TIM_CtrlPWMOutputs(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_SelectCOM(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_CCPreloadControl(TIM_TypeDef* TIMx, FunctionalState NewState);

 
void TIM_ITConfig(TIM_TypeDef* TIMx, uint16_t TIM_IT, FunctionalState NewState);
void TIM_GenerateEvent(TIM_TypeDef* TIMx, uint16_t TIM_EventSource);
FlagStatus TIM_GetFlagStatus(TIM_TypeDef* TIMx, uint16_t TIM_FLAG);
void TIM_ClearFlag(TIM_TypeDef* TIMx, uint16_t TIM_FLAG);
ITStatus TIM_GetITStatus(TIM_TypeDef* TIMx, uint16_t TIM_IT);
void TIM_ClearITPendingBit(TIM_TypeDef* TIMx, uint16_t TIM_IT);
void TIM_DMAConfig(TIM_TypeDef* TIMx, uint16_t TIM_DMABase, uint16_t TIM_DMABurstLength);
void TIM_DMACmd(TIM_TypeDef* TIMx, uint16_t TIM_DMASource, FunctionalState NewState);
void TIM_SelectCCDMA(TIM_TypeDef* TIMx, FunctionalState NewState);

 
void TIM_InternalClockConfig(TIM_TypeDef* TIMx);
void TIM_ITRxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource);
void TIM_TIxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_TIxExternalCLKSource,
                                uint16_t TIM_ICPolarity, uint16_t ICFilter);
void TIM_ETRClockMode1Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
                             uint16_t ExtTRGFilter);
void TIM_ETRClockMode2Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, 
                             uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter);

 
void TIM_SelectInputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource);
void TIM_SelectOutputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_TRGOSource);
void TIM_SelectSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_SlaveMode);
void TIM_SelectMasterSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_MasterSlaveMode);
void TIM_ETRConfig(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
                   uint16_t ExtTRGFilter);

    
void TIM_EncoderInterfaceConfig(TIM_TypeDef* TIMx, uint16_t TIM_EncoderMode,
                                uint16_t TIM_IC1Polarity, uint16_t TIM_IC2Polarity);
void TIM_SelectHallSensor(TIM_TypeDef* TIMx, FunctionalState NewState);

 
void TIM_RemapConfig(TIM_TypeDef* TIMx, uint16_t TIM_Remap);









  



 

 
#line 51 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_usart.h"




















  

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_usart.h"



 



  

  



  
  
typedef struct
{
  uint32_t USART_BaudRate;            



 

  uint16_t USART_WordLength;          
 

  uint16_t USART_StopBits;            
 

  uint16_t USART_Parity;              




 
 
  uint16_t USART_Mode;                
 

  uint16_t USART_HardwareFlowControl; 

 
} USART_InitTypeDef;



  
  
typedef struct
{

  uint16_t USART_Clock;   
 

  uint16_t USART_CPOL;    
 

  uint16_t USART_CPHA;    
 

  uint16_t USART_LastBit; 

 
} USART_ClockInitTypeDef;

 



  
  
#line 110 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_usart.h"








  
  


                                    




  



  
  
#line 141 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_usart.h"


  



  
  
#line 155 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_usart.h"


  



  
  





  



  
#line 182 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_usart.h"


  



  






  



 
  






  



 







 



 







  



 
  
#line 259 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_usart.h"


 



 







  



 







 



 
  







 



 







  



 

#line 331 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_usart.h"
                              








  



  

 
   

  
void USART_DeInit(USART_TypeDef* USARTx);

 
void USART_Init(USART_TypeDef* USARTx, USART_InitTypeDef* USART_InitStruct);
void USART_StructInit(USART_InitTypeDef* USART_InitStruct);
void USART_ClockInit(USART_TypeDef* USARTx, USART_ClockInitTypeDef* USART_ClockInitStruct);
void USART_ClockStructInit(USART_ClockInitTypeDef* USART_ClockInitStruct);
void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler);
void USART_OverSampling8Cmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_OneBitMethodCmd(USART_TypeDef* USARTx, FunctionalState NewState);

  
void USART_SendData(USART_TypeDef* USARTx, uint16_t Data);
uint16_t USART_ReceiveData(USART_TypeDef* USARTx);

 
void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address);
void USART_WakeUpConfig(USART_TypeDef* USARTx, uint16_t USART_WakeUp);
void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState);

 
void USART_LINBreakDetectLengthConfig(USART_TypeDef* USARTx, uint16_t USART_LINBreakDetectLength);
void USART_LINCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_SendBreak(USART_TypeDef* USARTx);

 
void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState);

 
void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime);

 
void USART_IrDAConfig(USART_TypeDef* USARTx, uint16_t USART_IrDAMode);
void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState);

 
void USART_DMACmd(USART_TypeDef* USARTx, uint16_t USART_DMAReq, FunctionalState NewState);

 
void USART_ITConfig(USART_TypeDef* USARTx, uint16_t USART_IT, FunctionalState NewState);
FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, uint16_t USART_FLAG);
void USART_ClearFlag(USART_TypeDef* USARTx, uint16_t USART_FLAG);
ITStatus USART_GetITStatus(USART_TypeDef* USARTx, uint16_t USART_IT);
void USART_ClearITPendingBit(USART_TypeDef* USARTx, uint16_t USART_IT);









  



  

 
#line 52 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_wwdg.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_wwdg.h"



 



  

 
 



  
  


 
  
#line 63 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\stm32f2xx_wwdg.h"



  



  

 
 
  
   
void WWDG_DeInit(void);

 
void WWDG_SetPrescaler(uint32_t WWDG_Prescaler);
void WWDG_SetWindowValue(uint8_t WindowValue);
void WWDG_EnableIT(void);
void WWDG_SetCounter(uint8_t Counter);

 
void WWDG_Enable(uint8_t Counter);

 
FlagStatus WWDG_GetFlagStatus(void);
void WWDG_ClearFlag(void);









  



  

 
#line 53 "..\\src\\stm32f2xx_conf.h "
#line 1 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\misc.h"




















 

 







 
#line 33 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\misc.h"



 



 

 



 

typedef struct
{
  uint8_t NVIC_IRQChannel;                    


 

  uint8_t NVIC_IRQChannelPreemptionPriority;  


 

  uint8_t NVIC_IRQChannelSubPriority;         


 

  FunctionalState NVIC_IRQChannelCmd;         

    
} NVIC_InitTypeDef;
 
 



 



 







 



 

#line 98 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\misc.h"


 



 

#line 116 "..\\..\\Libraries\\STM32F2xx_StdPeriph_Driver\\inc\\misc.h"















 



 







 



 

 
 

void NVIC_PriorityGroupConfig(uint32_t NVIC_PriorityGroup);
void NVIC_Init(NVIC_InitTypeDef* NVIC_InitStruct);
void NVIC_SetVectorTable(uint32_t NVIC_VectTab, uint32_t Offset);
void NVIC_SystemLPConfig(uint8_t LowPowerMode, FunctionalState NewState);
void SysTick_CLKSourceConfig(uint32_t SysTick_CLKSource);









 



 

 
#line 54 "..\\src\\stm32f2xx_conf.h "

 
 



 
   



 
 

 
#line 85 "..\\src\\stm32f2xx_conf.h "



 
#line 6833 "..\\..\\Libraries\\CMSIS\\CM3\\DeviceSupport\\STM32F2xx\\stm32f2xx.h"




 

















 









 

  

 

 
#line 13 "..\\src\\USART\\F205_usart.c"
#line 1 "..\\..\\Utilities\\STM32_EVAL\\stm322xg_eval.h"




















  
  
 







 
#line 33 "..\\..\\Utilities\\STM32_EVAL\\stm322xg_eval.h"
#line 34 "..\\..\\Utilities\\STM32_EVAL\\stm322xg_eval.h"
#line 35 "..\\..\\Utilities\\STM32_EVAL\\stm322xg_eval.h"

#line 1 "..\\src\\USART\\F205_USART.h"







 





#line 15 "..\\src\\USART\\F205_USART.h"
















extern uint8_t USART_tmpRxBuf[0x8000];
extern volatile uint16_t USART_RxIndex;
extern uint8_t ParamBuf[16384];

typedef struct{
	uint8_t *TxBuf;
	uint8_t *RxBuf;
}USART_BufDef;

typedef struct{
	uint16_t len;
	uint8_t src;
	uint8_t src_len;
	uint8_t dst;
	uint8_t dst_len;
	uint8_t type;
	uint8_t cmd;

	uint8_t ack_len;
	uint8_t ack_data[128];
	uint16_t remain;
}DATA_STRUCT, *pDATA_STRUCT;

































#line 92 "..\\src\\USART\\F205_USART.h"


#line 104 "..\\src\\USART\\F205_USART.h"
















void F205_InitUSART(void);
void F205_UsartRxData(void);
uint8_t F205_RxDataHandler(void);
void F205_PrepareTxData(uint8_t type, uint8_t cmd, uint8_t src, uint8_t dst, uint16_t len, uint8_t *data);
void F205_DisableUSART(void);
void F205_DisableUSART1(void);    


uint16_t Calc_CRCByte(uint8_t *Buf, uint32_t Len);


#line 37 "..\\..\\Utilities\\STM32_EVAL\\stm322xg_eval.h"
	 

#line 50 "..\\..\\Utilities\\STM32_EVAL\\stm322xg_eval.h"









   









 









 








































































  



 




  
#line 175 "..\\..\\Utilities\\STM32_EVAL\\stm322xg_eval.h"














		 


  
#line 206 "..\\..\\Utilities\\STM32_EVAL\\stm322xg_eval.h"








#line 220 "..\\..\\Utilities\\STM32_EVAL\\stm322xg_eval.h"



typedef enum 
{
	LED1 = 0,
	LED2 = 1,
	LED3 = 2,
	LED4 = 3,
	LED5 = 4,
	LED6 = 5,
	LED7 = 6,
	LED8 = 7,
	LED9 = 8,
	LED10 = 9,
	LED11 = 10,
    LED12
} Led_TypeDef;


typedef enum 
{
	COM1 = 0,
	COM2
} COM_TypeDef;  


typedef struct{
	uint8_t BdAddr;
	uint8_t BdType;
	uint8_t FirmType;
	uint8_t RxFlag;
	uint8_t TxFlag;
	uint8_t RdyFlag;
	uint8_t WorkSts;
	uint8_t AckFlag;
	uint8_t TxRdy;

	uint32_t SysTm;
	uint32_t DlyTm;

	uint16_t FirmFrameIndex;
}MY_INFO, *pMY_INFO;

extern MY_INFO MyInfo;



   


  
  


   


  




 
void STM_EVAL_LEDInit(Led_TypeDef Led);
void STM_EVAL_LEDOn(Led_TypeDef Led);
void STM_EVAL_LEDOff(Led_TypeDef Led);
void STM_EVAL_LEDToggle(Led_TypeDef Led);
void STM_EVAL_COMInit(COM_TypeDef COM, USART_InitTypeDef* USART_InitStruct, USART_BufDef *USART_BufStruct); 

void F205_UsartDMAConfig(COM_TypeDef COM, USART_BufDef *USART_BufStruct);

void F205_DisablePeripherals(COM_TypeDef COM);


void Delay(uint32_t dlyTm);





 
  







  



  



 



   

 
#line 14 "..\\src\\USART\\F205_usart.c"
#line 1 "..\\src\\GPIO\\F205_Gpio.h"







 





#line 15 "..\\src\\GPIO\\F205_Gpio.h"

extern void F205_InitGpio(void);
extern uint8_t F205_GetBdAddr(void);
extern uint8_t F205_GetBdType(void);
extern void F205_EnableUsartTx(void);
extern void F205_DisableUsartTx(void);
extern void F205_FeedDog(void);
extern uint8_t F205_GetCapStatus(void);




#line 15 "..\\src\\USART\\F205_usart.c"
#line 1 "..\\src\\HexFile\\HexFile.h"







 





#line 15 "..\\src\\HexFile\\HexFile.h"










typedef struct{
	volatile uint8_t colon;
	volatile uint8_t line_len;
	volatile uint16_t addr;
	volatile uint8_t type;
	volatile uint8_t sum;
	volatile uint8_t D;
	volatile uint8_t A;

	volatile uint8_t data[4];
	volatile uint8_t data_cnt;
	volatile uint32_t seg_addr;
	volatile uint8_t actual_len;
	volatile uint8_t actual_sum;
}HEX_FILE, *pHEX_FILE;

uint8_t GetDataFromHexFile(HEX_FILE *HexBuf, uint8_t *buf, uint16_t len);
void InitHexVar(HEX_FILE *HexBuf);



#line 16 "..\\src\\USART\\F205_usart.c"
#line 1 "..\\src\\FLASH\\F205_Flash.h"







 





















  

 



#line 37 "..\\src\\FLASH\\F205_Flash.h"

 
#line 40 "..\\src\\FLASH\\F205_Flash.h"





#line 52 "..\\src\\FLASH\\F205_Flash.h"


 
 
 
#line 63 "..\\src\\FLASH\\F205_Flash.h"


#line 71 "..\\src\\FLASH\\F205_Flash.h"

 















 






 











 



typedef  void (*pFunction)(void); 

 
 

uint8_t F205_EraseSectors(uint32_t StartSec, uint32_t EndSec);
uint8_t F205_ProgramFlash(uint32_t addr, uint32_t data);
uint8_t F205_WriteParams(uint32_t addr, uint8_t *data, uint16_t len);
void F205_ReadParams(uint32_t addr, uint8_t *data, uint16_t len);
uint8_t F205_WriteProtection(uint32_t WRPSec, uint8_t Enable);



 





#line 17 "..\\src\\USART\\F205_usart.c"
#line 1 "D:\\Keil\\ARM\\RV31\\INC\\stdio.h"
 
 
 





 






 









#line 34 "D:\\Keil\\ARM\\RV31\\INC\\stdio.h"


  
  typedef unsigned int size_t;    








 
 

 
  typedef struct __va_list __va_list;





   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 125 "D:\\Keil\\ARM\\RV31\\INC\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






extern __declspec(__nothrow) int remove(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int rename(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) FILE *tmpfile(void);
   




 
extern __declspec(__nothrow) char *tmpnam(char *  );
   











 

extern __declspec(__nothrow) int fclose(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) int fflush(FILE *  );
   







 
extern __declspec(__nothrow) FILE *fopen(const char * __restrict  ,
                           const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   








































 
extern __declspec(__nothrow) FILE *freopen(const char * __restrict  ,
                    const char * __restrict  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(2,3)));
   








 
extern __declspec(__nothrow) void setbuf(FILE * __restrict  ,
                    char * __restrict  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) int setvbuf(FILE * __restrict  ,
                   char * __restrict  ,
                   int  , size_t  ) __attribute__((__nonnull__(1)));
   















 
#pragma __printf_args
extern __declspec(__nothrow) int fprintf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   


















 
#pragma __printf_args
extern __declspec(__nothrow) int _fprintf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   




 
#pragma __printf_args
extern __declspec(__nothrow) int _printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






 
#pragma __printf_args
extern __declspec(__nothrow) int _sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   















 

#pragma __printf_args
extern __declspec(__nothrow) int _snprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int fscanf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






























 
#pragma __scanf_args
extern __declspec(__nothrow) int _fscanf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   






 
#pragma __scanf_args
extern __declspec(__nothrow) int _scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int sscanf(const char * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   








 
#pragma __scanf_args
extern __declspec(__nothrow) int _sscanf(const char * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

 
extern __declspec(__nothrow) int vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int _vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int _vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int _vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 
extern __declspec(__nothrow) int fgetc(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) char *fgets(char * __restrict  , int  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   










 
extern __declspec(__nothrow) int fputc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   







 
extern __declspec(__nothrow) int fputs(const char * __restrict  , FILE * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int getc(FILE *  ) __attribute__((__nonnull__(1)));
   







 




    extern __declspec(__nothrow) int (getchar)(void);

   





 
extern __declspec(__nothrow) char *gets(char *  ) __attribute__((__nonnull__(1)));
   









 
extern __declspec(__nothrow) int putc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   





 




    extern __declspec(__nothrow) int (putchar)(int  );

   



 
extern __declspec(__nothrow) int puts(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int ungetc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   






















 

extern __declspec(__nothrow) size_t fread(void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   











 

extern __declspec(__nothrow) size_t __fread_bytes_avail(void * __restrict  ,
                    size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   











 

extern __declspec(__nothrow) size_t fwrite(const void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   







 

extern __declspec(__nothrow) int fgetpos(FILE * __restrict  , fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) int fseek(FILE *  , long int  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) int fsetpos(FILE * __restrict  , const fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   










 
extern __declspec(__nothrow) long int ftell(FILE *  ) __attribute__((__nonnull__(1)));
   











 
extern __declspec(__nothrow) void rewind(FILE *  ) __attribute__((__nonnull__(1)));
   





 

extern __declspec(__nothrow) void clearerr(FILE *  ) __attribute__((__nonnull__(1)));
   




 

extern __declspec(__nothrow) int feof(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) int ferror(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) void perror(const char *  );
   









 

extern __declspec(__nothrow) int _fisatty(FILE *   ) __attribute__((__nonnull__(1)));
    
 

extern __declspec(__nothrow) void __use_no_semihosting_swi(void);
extern __declspec(__nothrow) void __use_no_semihosting(void);
    





 











#line 944 "D:\\Keil\\ARM\\RV31\\INC\\stdio.h"



 
#line 18 "..\\src\\USART\\F205_usart.c"
#line 1 "D:\\Keil\\ARM\\RV31\\INC\\string.h"
 
 
 
 




 








 











#line 37 "D:\\Keil\\ARM\\RV31\\INC\\string.h"


  
  typedef unsigned int size_t;








extern __declspec(__nothrow) void *memcpy(void * __restrict  ,
                    const void * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) void *memmove(void *  ,
                    const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   







 
extern __declspec(__nothrow) char *strcpy(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncpy(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 

extern __declspec(__nothrow) char *strcat(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncat(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 






 

extern __declspec(__nothrow) int memcmp(const void *  , const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strcmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int strncmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcasecmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strncasecmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcoll(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   







 

extern __declspec(__nothrow) size_t strxfrm(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   













 


#line 184 "D:\\Keil\\ARM\\RV31\\INC\\string.h"
extern __declspec(__nothrow) void *memchr(const void *  , int  , size_t  ) __attribute__((__nonnull__(1)));

   





 

#line 200 "D:\\Keil\\ARM\\RV31\\INC\\string.h"
extern __declspec(__nothrow) char *strchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   




 

extern __declspec(__nothrow) size_t strcspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 

#line 223 "D:\\Keil\\ARM\\RV31\\INC\\string.h"
extern __declspec(__nothrow) char *strpbrk(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   




 

#line 238 "D:\\Keil\\ARM\\RV31\\INC\\string.h"
extern __declspec(__nothrow) char *strrchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   





 

extern __declspec(__nothrow) size_t strspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   



 

#line 261 "D:\\Keil\\ARM\\RV31\\INC\\string.h"
extern __declspec(__nothrow) char *strstr(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   





 

extern __declspec(__nothrow) char *strtok(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) char *_strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

extern __declspec(__nothrow) char *strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

   

































 

extern __declspec(__nothrow) void *memset(void *  , int  , size_t  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) char *strerror(int  );
   





 
extern __declspec(__nothrow) size_t strlen(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) size_t strlcpy(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   
















 

extern __declspec(__nothrow) size_t strlcat(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






















 

extern __declspec(__nothrow) void _membitcpybl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpybb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
    














































 







#line 493 "D:\\Keil\\ARM\\RV31\\INC\\string.h"



 
#line 19 "..\\src\\USART\\F205_usart.c"
#line 20 "..\\src\\USART\\F205_usart.c"







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



 
USART_InitTypeDef USART_InitStructure;

USART_BufDef USART_BufStruct;


uint8_t USART_RxBuf[0x8000 >> 1];
uint8_t USART_TxBuf[0x0800];


uint8_t USART_tmpRxBuf[0x8000];


uint16_t TxHandleIndex = 0;
uint16_t RxHandleIndex = 0;

volatile uint16_t RxLen = 0;
volatile uint8_t StartF = 0;
volatile uint8_t DLE = 0;
volatile uint16_t CalcCheck = 0;
uint8_t CheckUp[4];
volatile uint8_t CheckUpIndex = 0;



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





 
void F205_InitUSART(void)
{
	memset(&_Info, 0, sizeof(_Info));
	HexInfo.type = 0xff;


	USART_InitStructure.USART_BaudRate = 115200L;
	USART_InitStructure.USART_WordLength = ((uint16_t)0x0000);
	USART_InitStructure.USART_StopBits = ((uint16_t)0x0000);
	USART_InitStructure.USART_Parity = ((uint16_t)0x0000);
	USART_InitStructure.USART_HardwareFlowControl = ((uint16_t)0x0000);
	USART_InitStructure.USART_Mode = ((uint16_t)0x0004) | ((uint16_t)0x0008);

	USART_BufStruct.TxBuf = (uint8_t *)&(USART_TxBuf[0]);
	USART_BufStruct.RxBuf = (uint8_t *)&(USART_RxBuf[0]);
	
	STM_EVAL_COMInit(COM1, &USART_InitStructure, &USART_BufStruct);
	
}

void F205_DisableUSART(void)
{
	F205_DisablePeripherals(COM1);
}

void F205_DisableUSART1(void)
{
	F205_DisablePeripherals(COM2);
}










uint8_t F205_RxDataHandler(void)
{
	volatile uint8_t err = 0, res, val, ret, OK;
	uint8_t *p;
	volatile uint32_t addr, data;

	ret = 0;
	if (MyInfo.AckFlag != 0xff){

		if (MyInfo.AckFlag == 10){

			err = F205_WriteProtection((((uint32_t)0x00000010) | ((uint32_t)0x00000020)), 0);
			if (err){

				_SetUpgradeErr(5);
				ret = 5;
			}
			else{

				
				err = F205_EraseSectors(((uint16_t)0x0020), ((uint16_t)0x0028));
				if (err){

					_SetUpgradeErr(6);
					ret = 6;
				}
				else{
					
					InitHexVar(&HexInfo);
					MyInfo.WorkSts = 1;
					_AckRdyToUpgrade(0);
				}
			}
		}
		if (MyInfo.AckFlag == 0){
			
			if (!err){

				
				p = &USART_RxBuf[2];
				OK = 1;
				while (_Info.remain && OK){

					res = GetDataFromHexFile(&HexInfo, p, _Info.remain);
					val = res & (3<<6);
					switch (val){

						case (1<<6):
							_SetUpgradeErr(3);
							ret = 3;
							OK = 0;
							break;
						case (0<<6):
							_Info.remain -= (res & 0x3f);
							p += (res & 0x3f);
							break;
						case (3<<6):
							
							addr = HexInfo.seg_addr + HexInfo.addr;
							if ((addr < (uint32_t)0x08010000) || (addr > 0x0803FFFF)){
							
								_SetUpgradeErr(3);
								ret = 3;
								OK = 0;
							}
							else{

								data = HexInfo.data[0] + ((uint16_t)HexInfo.data[1] << 8) + ((uint32_t)HexInfo.data[2] << 16) + ((uint32_t)HexInfo.data[3] << 24);
								if (F205_ProgramFlash(addr, data)){

									_SetUpgradeErr(7);
									ret = 7;
									OK = 0;
								}
								else{

									p += (res & 0x3f);
									_Info.remain -= (res & 0x3f);
									HexInfo.addr += 4;
								}
							}
							break;
						case (2<<6):
							_SetUpgradeErr(0);
							ret = 8;
							OK = 0;
						default:
							OK = 0;
							break;
					}
				}
			}
		}

		
		F205_PrepareTxData(_Info.type, _Info.cmd, _Info.dst, _Info.src, _Info.ack_len, &(_Info.ack_data[0]));
		
		MyInfo.SysTm = 0;
		
		MyInfo.AckFlag = 0xff;
	}

	return ret;
}


void F205_PrepareTxData(uint8_t type, uint8_t cmd, uint8_t src, uint8_t dst, uint16_t len, uint8_t *data)
{
	uint16_t i, j, crc;
	uint8_t buf[8], *p;


	
	
	
	while (!MyInfo.TxRdy){}
	
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

	
	Delay(2000);	


	
	DMA_SetCurrDataCounter(((DMA_Stream_TypeDef *) (((((uint32_t)0x40000000) + 0x00020000) + 0x6400) + 0x0B8)), j);
	 
  	DMA_Cmd(((DMA_Stream_TypeDef *) (((((uint32_t)0x40000000) + 0x00020000) + 0x6400) + 0x0B8)), ENABLE);
#line 356 "..\\src\\USART\\F205_usart.c"
}



void F205_UsartRxData(void)
{
	uint8_t ch, err;
	uint16_t Index;

	Index = USART_RxIndex;
	while (RxHandleIndex != Index ){

  		ch = USART_tmpRxBuf[RxHandleIndex++];
		RxHandleIndex &= (0x8000 - 1);

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










__inline void _SetRxData(unsigned char Data)
{
	switch (RxLen){

		case 0:
			_Info.len = (uint16_t)Data << 8;
			break;
		case 1:
			_Info.len += Data;
			
			
			
			if ((_Info.len > (0x8000 >> 1) + 32) || (_Info.len < 8))
			{
				_InitRx(0);
				return;
			}
			break;
		case 2:	
			_Info.src = Data;
			break;
		case 3:
			if (Data != 0){
				_InitRx(0);
				return;
			}
			_Info.src_len = Data;
			break;
		case 4:	
			if ((Data != MyInfo.BdAddr) && (Data != 0xff)){
				_InitRx(0);
				return;
			}
			_Info.dst = MyInfo.BdAddr;
			break;
		case 5:
			if (Data != 0){
				_InitRx(0);
				return;
			}
			_Info.dst_len = Data;
			break;
		case 6:
			_Info.type = Data;
			break;
		case 7:
			_Info.cmd = Data;
			break;
		default:
			USART_RxBuf[RxLen - 8] = Data;
			break;
	}

	RxLen++;

	if ((_Info.len > 0) && (RxLen > _Info.len + 2))
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

		case 0x11:
			
			if ((USART_RxBuf[3] & 0x7f) != MyInfo.FirmType){
	
				MyInfo.AckFlag = 1;
				_AckRdyToUpgrade(MyInfo.AckFlag);
				return;
			}
			MyInfo.AckFlag = 10;
			
			break;
		
		case 0x12:
			err = _CheckFirmData();	
			_SetUpgradeErr(MyInfo.AckFlag);
			break;

		case 0x14: 
			
			break;



#line 586 "..\\src\\USART\\F205_usart.c"

		case 0x08:

		        *(volatile uint32_t*)((uint32_t)0x20017FFC) = 0x73625593;


			
			
			F205_WriteProtection((((uint32_t)0x00000010) | ((uint32_t)0x00000020)), ENABLE);
			
			FLASH_Lock();


			
			((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL  = 0; 
			while (1)
			{

			}
			

		case 0x02:
			
			break;

		case 0x03:
			
			break;

		case 0xAA:

			err = _CheckProtectData();
			if (err & 0x0f){
				
				_Info.type = 0x0a;
				_Info.cmd = 0xAB;
				_Info.ack_len = 1;
				_Info.ack_data[0] = err;
				MyInfo.AckFlag = 9;
			}
			else{

				err = F205_WriteProtection(USART_RxBuf[1], (err>>4));
				
				_Info.type = 0x0a;
				_Info.cmd = 0xAB;
				_Info.ack_len = 1;
				_Info.ack_data[0] = err;
				MyInfo.AckFlag = 0xcc;
			}
			

			break;

		default:
			break;
	}
}


void _ErrHandler(uint8_t Err)
{
	
}



uint8_t _CheckFirmData(void)
{
	uint16_t Index;
	
	



 
	







 
	Index = USART_RxBuf[0] + ((uint16_t)USART_RxBuf[1] << 8);

	



 {

		if (MyInfo.WorkSts != 1){

			MyInfo.AckFlag = 3;
			return 1;
		}
	}

	
	
	_Info.remain = _Info.len - 10;

	MyInfo.FirmFrameIndex = Index;
	MyInfo.AckFlag = 0;
	return 0;
}

uint8_t _CheckProtectData(void)
{
	uint32_t *p;
	uint8_t en;

	if (_Info.len != 15)  
		return 1;

	if (_Info.src != 0x80)
		return 2;
	
	if ((USART_RxBuf[0] != 0xAA) && (USART_RxBuf[0] != 0x55))
		return 3;

	if (USART_RxBuf[6] != USART_RxBuf[0])
		return 4;
	

	if (USART_RxBuf[1] > 0x3f)
		return 5;

	
	p = (uint32_t*)&(USART_RxBuf[2]);
	if (USART_RxBuf[0] == 0xaa){
	
		if (*p != 0x76546231L)
			return 6;
		en = 0x10;
	}
	else if (USART_RxBuf[0] == 0x55){

		if (*p != 0x54763162L)
			return 7;
		en = 0x00;
	}

	return en;
}


void _SetUpgradeErr(uint8_t err)
{
	_Info.cmd = 0x82;
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
	
	_Info.cmd = 0x01;
}




 



 
