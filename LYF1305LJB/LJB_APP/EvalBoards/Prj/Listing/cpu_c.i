#line 1 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu_c.c"



















 


















 






 

#line 1 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"



















 

















 









 




































 

#line 1 "..\\..\\uC-CPU\\cpu_def.h"



















 










 









 






























 




 


















 

                                                         






                                                         
















 

                                                         





 







































































 

                                                         






 






 



#line 88 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"
#line 1 "..\\App\\cpu_cfg.h"



















 













 






 



















 

                                                                 

                                                                 
                                                                 

                                                                 



 























 

                                                                 


                                                                 
                                                                 

                                                                 
                                                                 


























 





                                                                 



 






















 










 




 



#line 89 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"


 


























 

typedef            void        CPU_VOID;
typedef            char        CPU_CHAR;                         
typedef  unsigned  char        CPU_BOOLEAN;                      
typedef  unsigned  char        CPU_INT08U;                       
typedef    signed  char        CPU_INT08S;                       
typedef  unsigned  short       CPU_INT16U;                       
typedef    signed  short       CPU_INT16S;                       
typedef  unsigned  int         CPU_INT32U;                       
typedef    signed  int         CPU_INT32S;                       
typedef  unsigned  long  long  CPU_INT64U;                       
typedef    signed  long  long  CPU_INT64S;                       

typedef            float       CPU_FP32;                         
typedef            double      CPU_FP64;                         


typedef  volatile  CPU_INT08U  CPU_REG08;                        
typedef  volatile  CPU_INT16U  CPU_REG16;                        
typedef  volatile  CPU_INT32U  CPU_REG32;                        
typedef  volatile  CPU_INT64U  CPU_REG64;                        


typedef            void      (*CPU_FNCT_VOID)(void);             
typedef            void      (*CPU_FNCT_PTR )(void *p_obj);      


 



















 

                                                                 











 

                                                                 

typedef  CPU_INT32U  CPU_ADDR;






                                                                 

typedef  CPU_INT32U  CPU_DATA;







typedef  CPU_DATA    CPU_ALIGN;                                  
typedef  CPU_ADDR    CPU_SIZE_T;                                 













 



typedef  CPU_INT32U             CPU_STK;                         
typedef  CPU_ADDR               CPU_STK_SIZE;                    


 






































































 
 
                                                                 


typedef  CPU_INT32U                 CPU_SR;                      

                                                                 












#line 326 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"







 






















 

                                                                 


                                                                 



 




 

void        CPU_IntDis       (void);
void        CPU_IntEn        (void);

void        CPU_IntSrcDis    (CPU_INT08U  pos);
void        CPU_IntSrcEn     (CPU_INT08U  pos);
void        CPU_IntSrcPendClr(CPU_INT08U  pos);
CPU_INT16S  CPU_IntSrcPrioGet(CPU_INT08U  pos);
void        CPU_IntSrcPrioSet(CPU_INT08U  pos,
                              CPU_INT08U  prio);


CPU_SR      CPU_SR_Save      (void);
void        CPU_SR_Restore   (CPU_SR      cpu_sr);


void        CPU_WaitForInt   (void);
void        CPU_WaitForExcept(void);


CPU_DATA    CPU_RevBits      (CPU_DATA    val);

void        CPU_BitBandClr   (CPU_ADDR    addr,
                              CPU_INT08U  bit_nbr);
void        CPU_BitBandSet   (CPU_ADDR    addr,
                              CPU_INT08U  bit_nbr);


 




 

#line 423 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"






 







#line 443 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"

#line 460 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"

#line 475 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"













 




 

                                                                 






                                                                 



                                                                 
#line 515 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"

                                                                 


                                                                 





                                                                 




                                                                 
#line 537 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"

                                                                 
#line 553 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"

 
                                                                 
#line 573 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"

                                                                 




                                                                 











 




 




 

#line 620 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"


#line 639 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"


#line 658 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"











 
#line 681 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"




#line 696 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"




#line 714 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu.h"


 






 



#line 50 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu_c.c"
#line 1 "..\\..\\uC-CPU\\cpu_core.h"



















 
















 









 









 








 



































 

#line 105 "..\\..\\uC-CPU\\cpu_core.h"
#line 1 "..\\..\\uC-LIB\\lib_def.h"



















 
































 









 





 

























 
































 

#line 131 "..\\..\\uC-LIB\\lib_def.h"
#line 132 "..\\..\\uC-LIB\\lib_def.h"


 




 




                                                                 

























                                                                 


#line 181 "..\\..\\uC-LIB\\lib_def.h"

#line 190 "..\\..\\uC-LIB\\lib_def.h"

#line 199 "..\\..\\uC-LIB\\lib_def.h"

#line 208 "..\\..\\uC-LIB\\lib_def.h"
 
#line 217 "..\\..\\uC-LIB\\lib_def.h"

#line 226 "..\\..\\uC-LIB\\lib_def.h"

#line 235 "..\\..\\uC-LIB\\lib_def.h"

#line 244 "..\\..\\uC-LIB\\lib_def.h"


                                                                 



                                                                 












                                                                 






 
                                                                 
















































































 
                                                                 





#line 392 "..\\..\\uC-LIB\\lib_def.h"















#line 429 "..\\..\\uC-LIB\\lib_def.h"



 
                                                                 















#line 455 "..\\..\\uC-LIB\\lib_def.h"






 






 

typedef enum lib_err {

    LIB_ERR_NONE                            =         0u,

    LIB_MEM_ERR_NONE                        =     10000u,
    LIB_MEM_ERR_NULL_PTR                    =     10001u,        

    LIB_MEM_ERR_INVALID_MEM_SIZE            =     10100u,        
    LIB_MEM_ERR_INVALID_MEM_ALIGN           =     10101u,        
    LIB_MEM_ERR_INVALID_SEG_SIZE            =     10110u,        
    LIB_MEM_ERR_INVALID_SEG_OVERLAP         =     10111u,        
    LIB_MEM_ERR_INVALID_POOL                =     10120u,        
    LIB_MEM_ERR_INVALID_BLK_NBR             =     10130u,        
    LIB_MEM_ERR_INVALID_BLK_SIZE            =     10131u,        
    LIB_MEM_ERR_INVALID_BLK_ALIGN           =     10132u,        
    LIB_MEM_ERR_INVALID_BLK_IX              =     10133u,        
    LIB_MEM_ERR_INVALID_BLK_ADDR            =     10135u,        
    LIB_MEM_ERR_INVALID_BLK_ADDR_IN_POOL    =     10136u,        

    LIB_MEM_ERR_SEG_EMPTY                   =     10200u,        
    LIB_MEM_ERR_SEG_OVF                     =     10201u,        
    LIB_MEM_ERR_POOL_FULL                   =     10205u,        
    LIB_MEM_ERR_POOL_EMPTY                  =     10206u,        

    LIB_MEM_ERR_HEAP_EMPTY                  =     10210u,        
    LIB_MEM_ERR_HEAP_OVF                    =     10211u,        
    LIB_MEM_ERR_HEAP_NOT_FOUND              =     10215u         

} LIB_ERR;


 




 






 






 

                                                                 

















 




 


















 



























 










 





















 

























 










 































 




























 

















 
















 


























 

#line 806 "..\\..\\uC-LIB\\lib_def.h"






#line 818 "..\\..\\uC-LIB\\lib_def.h"


 
















 


























 

#line 885 "..\\..\\uC-LIB\\lib_def.h"






#line 897 "..\\..\\uC-LIB\\lib_def.h"


 




















 

























 





 




















 






















 




 




 











































 






 










































 






 














































 





 


















 

#line 1200 "..\\..\\uC-LIB\\lib_def.h"






#line 1212 "..\\..\\uC-LIB\\lib_def.h"


 










 

















 


















 




 














 




 




 






 






 

                                                                 











 



#line 106 "..\\..\\uC-CPU\\cpu_core.h"
#line 107 "..\\..\\uC-CPU\\cpu_core.h"

#line 1 "..\\..\\uC-LIB\\lib_mem.h"



















 































 









 





 



































 

#line 107 "..\\..\\uC-LIB\\lib_mem.h"
#line 1 "..\\..\\uC-CPU\\cpu_core.h"



















 
















 









 

#line 1018 "..\\..\\uC-CPU\\cpu_core.h"

#line 108 "..\\..\\uC-LIB\\lib_mem.h"

#line 110 "..\\..\\uC-LIB\\lib_mem.h"
#line 1 "..\\App\\lib_cfg.h"



















 
















 






 









 


                                                         
                                                         


                                                         
                                                         


                                                         
                                                         









 



#line 111 "..\\..\\uC-LIB\\lib_mem.h"






 








 




 














 

                                                         













 

                                                         













 

                                                         







 




 










 






 




 








 

typedef  CPU_INT32U  LIB_MEM_TYPE;






 

typedef  CPU_SIZE_T  MEM_POOL_BLK_QTY;






 

typedef  MEM_POOL_BLK_QTY  MEM_POOL_IX;


 










































 

typedef  struct  mem_pool  MEM_POOL;

                                                                 
struct  mem_pool {
    LIB_MEM_TYPE        Type;                                    

    MEM_POOL           *SegHeadPtr;                              
    MEM_POOL           *SegPrevPtr;                              
    MEM_POOL           *SegNextPtr;                              
    MEM_POOL           *PoolPrevPtr;                             
    MEM_POOL           *PoolNextPtr;                             

    void               *PoolAddrStart;                           
    void               *PoolAddrEnd;                             
    void              **PoolPtrs;                                
    MEM_POOL_IX         BlkIx;                                   
    CPU_SIZE_T          PoolSize;                                
    MEM_POOL_BLK_QTY    BlkNbr;                                  
    CPU_SIZE_T          BlkSize;                                 
    CPU_SIZE_T          BlkAlign;                                

                                                                 
    void               *SegAddr;                                 
    void               *SegAddrNextAvail;                        
    CPU_SIZE_T          SegSizeTot;                              
    CPU_SIZE_T          SegSizeRem;                              
};


 




 


 




 























 


 














































 
 












#line 439 "..\\..\\uC-LIB\\lib_mem.h"







#line 454 "..\\..\\uC-LIB\\lib_mem.h"






#line 466 "..\\..\\uC-LIB\\lib_mem.h"








 

















































 
 

























#line 558 "..\\..\\uC-LIB\\lib_mem.h"





#line 569 "..\\..\\uC-LIB\\lib_mem.h"


 


















































 
 

























#line 656 "..\\..\\uC-LIB\\lib_mem.h"





#line 667 "..\\..\\uC-LIB\\lib_mem.h"


 




























































 
 

#line 768 "..\\..\\uC-LIB\\lib_mem.h"

































#line 807 "..\\..\\uC-LIB\\lib_mem.h"


 






































































 
 

#line 915 "..\\..\\uC-LIB\\lib_mem.h"


#line 929 "..\\..\\uC-LIB\\lib_mem.h"


#line 938 "..\\..\\uC-LIB\\lib_mem.h"







#line 951 "..\\..\\uC-LIB\\lib_mem.h"


 






















































 

                                                                         














 

























































 

                                                                         





 














































 












#line 1158 "..\\..\\uC-LIB\\lib_mem.h"


 




 

void               Mem_Init              (       void);

                                                                     
void               Mem_Clr               (       void              *pmem,
                                                 CPU_SIZE_T         size);

void               Mem_Set               (       void              *pmem,
                                                 CPU_INT08U         data_val,
                                                 CPU_SIZE_T         size);

void               Mem_Copy              (       void              *pdest,
                                          const  void              *psrc,
                                                 CPU_SIZE_T         size);

void               Mem_Move              (       void              *pdest,
                                          const  void              *psrc,
                                                 CPU_SIZE_T         size);

CPU_BOOLEAN        Mem_Cmp               (const  void              *p1_mem,
                                          const  void              *p2_mem,
                                                 CPU_SIZE_T         size);



#line 1240 "..\\..\\uC-LIB\\lib_mem.h"


 




 

#line 1260 "..\\..\\uC-LIB\\lib_mem.h"



#line 1274 "..\\..\\uC-LIB\\lib_mem.h"




#line 1312 "..\\..\\uC-LIB\\lib_mem.h"






 

                                                                 





 






 



#line 110 "..\\..\\uC-CPU\\cpu_core.h"
#line 1 "..\\..\\uC-LIB\\lib_str.h"



















 


























 









 





 







 

































 






 








































 

#line 156 "..\\..\\uC-LIB\\lib_str.h"

#line 158 "..\\..\\uC-LIB\\lib_str.h"
#line 1 "..\\..\\uC-LIB\\lib_ascii.h"



















 

















































 









 





 






























 

#line 120 "..\\..\\uC-LIB\\lib_ascii.h"
#line 121 "..\\..\\uC-LIB\\lib_ascii.h"






 








 




 





 

                                                                 
#line 182 "..\\..\\uC-LIB\\lib_ascii.h"

#line 228 "..\\..\\uC-LIB\\lib_ascii.h"


 
                                                                 
#line 248 "..\\..\\uC-LIB\\lib_ascii.h"





                                                                 
#line 264 "..\\..\\uC-LIB\\lib_ascii.h"

#line 275 "..\\..\\uC-LIB\\lib_ascii.h"


                                                                 
#line 285 "..\\..\\uC-LIB\\lib_ascii.h"




 
                                                                 
#line 317 "..\\..\\uC-LIB\\lib_ascii.h"


                                                                 
#line 326 "..\\..\\uC-LIB\\lib_ascii.h"





                                                                 
#line 358 "..\\..\\uC-LIB\\lib_ascii.h"


                                                                 









                                                                 





 




 






 


 




 









 


















 




















 





















 






 

















 





















 




 

















 






















 





 




















 

























 






 





















 

























 




 

















 



























 





 




 


























 





























 




 




 

CPU_BOOLEAN  ASCII_IsAlpha   (CPU_CHAR  c);

CPU_BOOLEAN  ASCII_IsAlphaNum(CPU_CHAR  c);

CPU_BOOLEAN  ASCII_IsLower   (CPU_CHAR  c);

CPU_BOOLEAN  ASCII_IsUpper   (CPU_CHAR  c);

CPU_BOOLEAN  ASCII_IsDig     (CPU_CHAR  c);

CPU_BOOLEAN  ASCII_IsDigOct  (CPU_CHAR  c);

CPU_BOOLEAN  ASCII_IsDigHex  (CPU_CHAR  c);

CPU_BOOLEAN  ASCII_IsBlank   (CPU_CHAR  c);

CPU_BOOLEAN  ASCII_IsSpace   (CPU_CHAR  c);

CPU_BOOLEAN  ASCII_IsPrint   (CPU_CHAR  c);

CPU_BOOLEAN  ASCII_IsGraph   (CPU_CHAR  c);

CPU_BOOLEAN  ASCII_IsPunct   (CPU_CHAR  c);

CPU_BOOLEAN  ASCII_IsCtrl    (CPU_CHAR  c);


CPU_CHAR     ASCII_ToLower   (CPU_CHAR  c);

CPU_CHAR     ASCII_ToUpper   (CPU_CHAR  c);


CPU_BOOLEAN  ASCII_Cmp       (CPU_CHAR  c1,
                              CPU_CHAR  c2);


 




 








 



#line 159 "..\\..\\uC-LIB\\lib_str.h"

#line 161 "..\\..\\uC-LIB\\lib_str.h"










 








 




 












 

                                                                 


                                                                 
                                                                 


                                                                 
                                                                 









 
















 






 


 




 












 

                                                                 




 




 

                                                                 
CPU_SIZE_T   Str_Len            (const  CPU_CHAR      *pstr);

CPU_SIZE_T   Str_Len_N          (const  CPU_CHAR      *pstr,
                                        CPU_SIZE_T     len_max);


                                                                        
CPU_CHAR    *Str_Copy           (       CPU_CHAR      *pstr_dest,
                                 const  CPU_CHAR      *pstr_src);

CPU_CHAR    *Str_Copy_N         (       CPU_CHAR      *pstr_dest,
                                 const  CPU_CHAR      *pstr_src,
                                        CPU_SIZE_T     len_max);


CPU_CHAR    *Str_Cat            (       CPU_CHAR      *pstr_dest,
                                 const  CPU_CHAR      *pstr_cat);

CPU_CHAR    *Str_Cat_N          (       CPU_CHAR      *pstr_dest,
                                 const  CPU_CHAR      *pstr_cat,
                                        CPU_SIZE_T     len_max);


                                                                        
CPU_INT16S   Str_Cmp            (const  CPU_CHAR      *p1_str,
                                 const  CPU_CHAR      *p2_str);

CPU_INT16S   Str_Cmp_N          (const  CPU_CHAR      *p1_str,
                                 const  CPU_CHAR      *p2_str,
                                        CPU_SIZE_T     len_max);

CPU_INT16S   Str_CmpIgnoreCase  (const  CPU_CHAR      *p1_str,
                                 const  CPU_CHAR      *p2_str);

CPU_INT16S   Str_CmpIgnoreCase_N(const  CPU_CHAR      *p1_str,
                                 const  CPU_CHAR      *p2_str,
                                        CPU_SIZE_T     len_max);


                                                                        
CPU_CHAR    *Str_Char           (const  CPU_CHAR      *pstr,
                                        CPU_CHAR       srch_char);

CPU_CHAR    *Str_Char_N         (const  CPU_CHAR      *pstr,
                                        CPU_SIZE_T     len_max,
                                        CPU_CHAR       srch_char);

CPU_CHAR    *Str_Char_Last      (const  CPU_CHAR      *pstr,
                                        CPU_CHAR       srch_char);

CPU_CHAR    *Str_Char_Last_N    (const  CPU_CHAR      *pstr,
                                        CPU_SIZE_T     len_max,
                                        CPU_CHAR       srch_char);

CPU_CHAR    *Str_Char_Replace   (       CPU_CHAR      *pstr,
                                        CPU_CHAR       char_srch,
                                        CPU_CHAR       char_replace);

CPU_CHAR    *Str_Char_Replace_N (       CPU_CHAR      *pstr,
                                        CPU_CHAR       char_srch,
                                        CPU_CHAR       char_replace,
                                        CPU_SIZE_T     len_max);

CPU_CHAR    *Str_Str            (const  CPU_CHAR      *pstr,
                                 const  CPU_CHAR      *pstr_srch);

CPU_CHAR    *Str_Str_N          (const  CPU_CHAR      *pstr,
                                 const  CPU_CHAR      *pstr_srch,
                                        CPU_SIZE_T     len_max);


 
                                                                        
CPU_CHAR    *Str_FmtNbr_Int32U  (       CPU_INT32U     nbr,
                                        CPU_INT08U     nbr_dig,
                                        CPU_INT08U     nbr_base,
                                        CPU_CHAR       lead_char,
                                        CPU_BOOLEAN    lower_case,
                                        CPU_BOOLEAN    nul,
                                        CPU_CHAR      *pstr);

CPU_CHAR    *Str_FmtNbr_Int32S  (       CPU_INT32S     nbr,
                                        CPU_INT08U     nbr_dig,
                                        CPU_INT08U     nbr_base,
                                        CPU_CHAR       lead_char,
                                        CPU_BOOLEAN    lower_case,
                                        CPU_BOOLEAN    nul,
                                        CPU_CHAR      *pstr);

#line 375 "..\\..\\uC-LIB\\lib_str.h"


                                                                        
CPU_INT32U   Str_ParseNbr_Int32U(const  CPU_CHAR      *pstr,
                                        CPU_CHAR     **pstr_next,
                                        CPU_INT08U     nbr_base);

CPU_INT32S   Str_ParseNbr_Int32S(const  CPU_CHAR      *pstr,
                                        CPU_CHAR     **pstr_next,
                                        CPU_INT08U     nbr_base);


 




 

#line 422 "..\\..\\uC-LIB\\lib_str.h"








 



#line 111 "..\\..\\uC-CPU\\cpu_core.h"



 














 






#line 142 "..\\..\\uC-CPU\\cpu_core.h"

#line 149 "..\\..\\uC-CPU\\cpu_core.h"






 





 




 






 

typedef enum cpu_err {

    CPU_ERR_NONE                            =         0u,
    CPU_ERR_NULL_PTR                        =        10u,

    CPU_ERR_NAME_SIZE                       =      1000u,

    CPU_ERR_TS_FREQ_INVALID                 =      2000u

} CPU_ERR;









 

typedef  CPU_INT32U  CPU_TS32;
typedef  CPU_INT64U  CPU_TS64;

typedef  CPU_TS32    CPU_TS;                                     


#line 210 "..\\..\\uC-CPU\\cpu_core.h"
typedef  CPU_INT32U  CPU_TS_TMR;








 

typedef  CPU_INT32U  CPU_TS_TMR_FREQ;






 


extern  CPU_CHAR         CPU_Name[16];      
















extern  CPU_TS_TMR_FREQ  CPU_TS_TmrFreq_Hz;                



#line 262 "..\\..\\uC-CPU\\cpu_core.h"


 




 













































































































 








 














 








 






































 

#line 460 "..\\..\\uC-CPU\\cpu_core.h"

#line 467 "..\\..\\uC-CPU\\cpu_core.h"


#line 482 "..\\..\\uC-CPU\\cpu_core.h"


 























 

void             CPU_Init                 (void);

void             CPU_SW_Exception         (void);




void             CPU_NameClr              (void);

void             CPU_NameGet              (       CPU_CHAR  *p_name,
                                                  CPU_ERR   *p_err);

void             CPU_NameSet              (const  CPU_CHAR  *p_name,
                                                  CPU_ERR   *p_err);




                                                                         

CPU_TS32         CPU_TS_Get32             (void);







void             CPU_TS_Update            (void);




CPU_TS_TMR_FREQ  CPU_TS_TmrFreqGet        (CPU_ERR          *p_err);

void             CPU_TS_TmrFreqSet        (CPU_TS_TMR_FREQ   freq_hz);




#line 563 "..\\..\\uC-CPU\\cpu_core.h"



                                                                         
CPU_DATA         CPU_CntLeadZeros         (CPU_DATA    val);


CPU_DATA         CPU_CntLeadZeros08       (CPU_INT08U  val);


CPU_DATA         CPU_CntLeadZeros16       (CPU_INT16U  val);


CPU_DATA         CPU_CntLeadZeros32       (CPU_INT32U  val);


CPU_DATA         CPU_CntLeadZeros64       (CPU_INT64U  val);



CPU_DATA         CPU_CntTrailZeros        (CPU_DATA    val);


CPU_DATA         CPU_CntTrailZeros08      (CPU_INT08U  val);


CPU_DATA         CPU_CntTrailZeros16      (CPU_INT16U  val);


CPU_DATA         CPU_CntTrailZeros32      (CPU_INT32U  val);


CPU_DATA         CPU_CntTrailZeros64      (CPU_INT64U  val);



 





 



















































 


void  CPU_TS_TmrInit(void);



 
















































































 


CPU_TS_TMR  CPU_TS_TmrRd(void);



 






















































 


CPU_INT64U  CPU_TS32_to_uSec(CPU_TS32  ts_cnts);







 




 

#line 838 "..\\..\\uC-CPU\\cpu_core.h"

#line 851 "..\\..\\uC-CPU\\cpu_core.h"






#line 869 "..\\..\\uC-CPU\\cpu_core.h"


#line 883 "..\\..\\uC-CPU\\cpu_core.h"

                                                                 
#line 897 "..\\..\\uC-CPU\\cpu_core.h"


 
                                                                 
#line 914 "..\\..\\uC-CPU\\cpu_core.h"

#line 932 "..\\..\\uC-CPU\\cpu_core.h"










#line 959 "..\\..\\uC-CPU\\cpu_core.h"


















 




 


















 

                                                                 











 



#line 51 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu_c.c"

#line 53 "..\\..\\uC-CPU\\ARM-Cortex-M3\\cpu_c.c"


 




 

















 






 






 






 






 






 


 
















 

void  CPU_BitBandClr (CPU_ADDR    addr,
                      CPU_INT08U  bit_nbr)
{
    CPU_ADDR  bit_word_off;
    CPU_ADDR  bit_word_addr;


    if ((addr >= 0x20000000) &&
        (addr <= 0x200FFFFF)) {
        bit_word_off  = ((addr - 0x20000000  ) * 32) + (bit_nbr * 4);
        bit_word_addr = 0x22000000   + bit_word_off;

      *(volatile CPU_INT32U *)(bit_word_addr) = 0;

    } else if ((addr >= 0x40000000) &&
               (addr <= 0x400FFFFF)) {
        bit_word_off  = ((addr - 0x40000000) * 32) + (bit_nbr * 4);
        bit_word_addr = 0x42000000 + bit_word_off;

      *(volatile CPU_INT32U *)(bit_word_addr) = 0;
    }
}


 
















 

void  CPU_BitBandSet (CPU_ADDR    addr,
                      CPU_INT08U  bit_nbr)
{
    CPU_ADDR  bit_word_off;
    CPU_ADDR  bit_word_addr;


    if ((addr >= 0x20000000) &&
        (addr <= 0x200FFFFF)) {
        bit_word_off  = ((addr - 0x20000000  ) * 32) + (bit_nbr * 4);
        bit_word_addr = 0x22000000   + bit_word_off;

      *(volatile CPU_INT32U *)(bit_word_addr) = 1;

    } else if ((addr >= 0x40000000) &&
               (addr <= 0x400FFFFF)) {
        bit_word_off  = ((addr - 0x40000000) * 32) + (bit_nbr * 4);
        bit_word_addr = 0x42000000 + bit_word_off;

      *(volatile CPU_INT32U *)(bit_word_addr) = 1;
    }
}


 















































 
 
void  CPU_IntSrcDis (CPU_INT08U  pos)
{
    CPU_INT08U  group;
    CPU_INT08U  pos_max;
    CPU_INT08U  nbr;
    CPU_SR cpu_sr = (CPU_SR)0;


    switch (pos) {
        case 0u:                                    
        case 7u:
        case 8u:
        case 9u:
        case 10u:
        case 13u:
             break;


                                                                 
        case 1u:                                      
        case 2u:                                        
        case 3u:                                     
        case 11u:                                     
        case 12u:                                     
        case 14u:                                     
             break;

        case 4u:                                        
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             (*((CPU_REG32 *)(0xE000ED24))) &= ~0x00010000;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 5u:                                   
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             (*((CPU_REG32 *)(0xE000ED24))) &= ~0x00020000;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 6u:                                 
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             (*((CPU_REG32 *)(0xE000ED24))) &= ~0x00040000;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 15u:                                    
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             (*((CPU_REG32 *)(0xE000E010))) &= ~0x00000001;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;


                                                                 
        default:
            pos_max = (((((*((CPU_REG32 *)(0xE000E004))) + 1) & 0x1F) * 32) + 16);
            if (pos < pos_max) {                                 
                 group = (pos - 16) / 32;
                 nbr   = (pos - 16) % 32;

                 do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
                 (*((CPU_REG32 *)(0xE000E180 + (group) * 4u))) = (1u << (nbr));
                 do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             }
             break;
    }
}


 


















 

void  CPU_IntSrcEn (CPU_INT08U  pos)
{
    CPU_INT08U  group;
    CPU_INT08U  nbr;
    CPU_INT08U  pos_max;
    CPU_SR cpu_sr = (CPU_SR)0;


    switch (pos) {
        case 0u:                                    
        case 7u:
        case 8u:
        case 9u:
        case 10u:
        case 13u:
             break;


                                                                 
        case 1u:                                      
        case 2u:                                        
        case 3u:                                     
        case 11u:                                     
        case 12u:                                     
        case 14u:                                     
             break;

        case 4u:                                        
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             (*((CPU_REG32 *)(0xE000ED24))) |= 0x00010000;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 5u:                                   
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             (*((CPU_REG32 *)(0xE000ED24))) |= 0x00020000;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 6u:                                 
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             (*((CPU_REG32 *)(0xE000ED24))) |= 0x00040000;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 15u:                                    
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             (*((CPU_REG32 *)(0xE000E010))) |= 0x00000001;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;


                                                                 
        default:
            pos_max = (((((*((CPU_REG32 *)(0xE000E004))) + 1) & 0x1F) * 32) + 16);
            if (pos < pos_max) {                                 
                 group = (pos - 16) / 32;
                 nbr   = (pos - 16) % 32;

                 do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
                 (*((CPU_REG32 *)(0xE000E100 + (group) * 4u))) = (1u << (nbr));
                 do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             }
             break;
    }
}

 





























 

void  CPU_IntSrcPendClr (CPU_INT08U  pos)

{
    CPU_INT08U  group;
    CPU_INT08U  nbr;
    CPU_INT08U  pos_max;
    CPU_SR cpu_sr = (CPU_SR)0;


    switch (pos) {
        case 0u:                                    
        case 7u:
        case 8u:
        case 9u:
        case 10u:
        case 13u:
             break;
                                                                 
        case 1u:                                      
        case 2u:                                        
        case 3u:                                     
        case 4u:                                        
        case 11u:                                     
        case 12u:                                     
        case 14u:                                     
        case 5u:                                   
        case 6u:                                 
        case 15u:                                    
             break;
                                                                 
        default:
            pos_max = (((((*((CPU_REG32 *)(0xE000E004))) + 1) & 0x1F) * 32) + 16);
            if (pos < pos_max) {                                 
                 group = (pos - 16) / 32;
                 nbr   = (pos - 16) % 32;

                 do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
                 (*((CPU_REG32 *)(0xE000E280 + (group) * 4u))) = (1u << (nbr));
                 do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             }
             break;
    }
}


 
























 

void  CPU_IntSrcPrioSet (CPU_INT08U  pos,
                         CPU_INT08U  prio)
{
    CPU_INT08U  group;
    CPU_INT08U  nbr;
    CPU_INT08U  pos_max;
    CPU_INT32U  prio_32;
    CPU_INT32U  temp;
    CPU_SR cpu_sr = (CPU_SR)0;


    prio_32 = CPU_RevBits((CPU_INT08U)prio);
    prio    = (CPU_INT08U)(prio_32 >> (3 * 8u));

    switch (pos) {
        case 0u:                                    
        case 7u:
        case 8u:
        case 9u:
        case 10u:
        case 13u:
             break;


                                                                 
        case 1u:                                      
        case 2u:                                        
        case 3u:                                     
             break;

        case 4u:                                        
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             temp                 = (*((CPU_REG32 *)(0xE000ED18)));
             temp                &= ~(0xFFu << (0 * 8u));
             temp                |=  (prio           << (0 * 8u));
             (*((CPU_REG32 *)(0xE000ED18)))  = temp;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 5u:                                   
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             temp                 = (*((CPU_REG32 *)(0xE000ED18)));
             temp                &= ~(0xFFu << (1 * 8u));
             temp                |=  (prio           << (1 * 8u));
             (*((CPU_REG32 *)(0xE000ED18)))  = temp;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 6u:                                 
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             temp                 = (*((CPU_REG32 *)(0xE000ED18)));
             temp                &= ~(0xFFu << (2 * 8u));
             temp                |=  (prio           << (2 * 8u));
             (*((CPU_REG32 *)(0xE000ED18)))  = temp;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 11u:                                     
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             temp                 = (*((CPU_REG32 *)(0xE000ED1C)));
             temp                &= ~((CPU_INT32U)0xFFu << (3 * 8u));
             temp                |=  (prio                       << (3 * 8u));
             (*((CPU_REG32 *)(0xE000ED1C)))  = temp;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 12u:                                     
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             temp                = (*((CPU_REG32 *)(0xE000ED20)));
             temp                &= ~(0xFFu << (0 * 8u));
             temp                |=  (prio           << (0 * 8u));
             (*((CPU_REG32 *)(0xE000ED20)))  = temp;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 14u:                                     
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             temp                 = (*((CPU_REG32 *)(0xE000ED20)));
             temp                &= ~(0xFFu << (2 * 8u));
             temp                |=  (prio           << (2 * 8u));
             (*((CPU_REG32 *)(0xE000ED20)))  = temp;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 15u:                                    
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             temp                 = (*((CPU_REG32 *)(0xE000ED20)));
             temp                &= ~((CPU_INT32U)0xFFu << (3 * 8u));
             temp                |=  (prio                       << (3 * 8u));
             (*((CPU_REG32 *)(0xE000ED20)))  = temp;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;


                                                                 
        default:
            pos_max = (((((*((CPU_REG32 *)(0xE000E004))) + 1) & 0x1F) * 32) + 16);
            if (pos < pos_max) {                                 
                 group                    = (pos - 16) / 4;
                 nbr                      = (pos - 16) % 4;

                 do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
                 temp                     = (*((CPU_REG32 *)(0xE000E400 + (group) * 4u)));
                 temp                    &= ~(0xFFu << (nbr * 8u));
                 temp                    |=  (prio           << (nbr * 8u));
                 (*((CPU_REG32 *)(0xE000E400 + (group) * 4u))) = temp;
                 do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             }
             break;
    }
}


 



















 

CPU_INT16S  CPU_IntSrcPrioGet (CPU_INT08U  pos)
{
    CPU_INT08U  group;
    CPU_INT08U  nbr;
    CPU_INT08U  pos_max;
    CPU_INT16S  prio;
    CPU_INT32U  prio_32;
    CPU_INT32U  temp;
    CPU_SR cpu_sr = (CPU_SR)0;


    switch (pos) {
        case 0u:                                    
        case 7u:
        case 8u:
        case 9u:
        case 10u:
        case 13u:
             prio = ((-32767) - 1);
             break;


                                                                 
        case 1u:                                      
             prio = -3;
             break;

        case 2u:                                        
             prio = -2;
             break;

        case 3u:                                     
             prio = -1;
             break;


        case 4u:                                        
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             temp = (*((CPU_REG32 *)(0xE000ED18)));
             prio = (temp >> (0 * 8u)) & 0xFFu;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;


        case 5u:                                   
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             temp = (*((CPU_REG32 *)(0xE000ED18)));
             prio = (temp >> (1 * 8u)) & 0xFFu;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;


        case 6u:                                 
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             temp = (*((CPU_REG32 *)(0xE000ED18)));
             prio = (temp >> (2 * 8u)) & 0xFFu;
             break;

        case 11u:                                     
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             temp = (*((CPU_REG32 *)(0xE000ED1C)));
             prio = (temp >> (3 * 8u)) & 0xFFu;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 12u:                                     
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             temp = (*((CPU_REG32 *)(0xE000ED20)));
             prio = (temp >> (0 * 8u)) & 0xFFu;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 14u:                                     
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             temp = (*((CPU_REG32 *)(0xE000ED20)));
             prio = (temp >> (2 * 8u)) & 0xFFu;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;

        case 15u:                                    
             do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
             temp = (*((CPU_REG32 *)(0xE000ED20)));
             prio = (temp >> (3 * 8u)) & 0xFFu;
             do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);
             break;


                                                                 
        default:
            pos_max = (((((*((CPU_REG32 *)(0xE000E004))) + 1) & 0x1F) * 32) + 16);
            if (pos < pos_max) {                                 
                 group = (pos - 16) / 4;
                 nbr   = (pos - 16) % 4;

                 do { do { cpu_sr = CPU_SR_Save(); } while (0); } while (0);
                 temp  = (*((CPU_REG32 *)(0xE000E400 + (group) * 4u)));
                 do { do { CPU_SR_Restore(cpu_sr); } while (0); } while (0);

                 prio  = (temp >> (nbr * 8u)) & 0xFFu;
             } else {
                 prio  = ((-32767) - 1);
             }
             break;
    }

    if (prio >= 0) {
        prio_32 = CPU_RevBits((CPU_INT32U)prio);
        prio    = (CPU_INT16S)(prio_32 >> (3 * 8u));
    }

    return (prio);
}

