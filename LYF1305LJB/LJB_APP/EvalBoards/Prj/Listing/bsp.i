#line 1 "..\\BSP\\bsp.c"














































 














 

















 






 



#line 1 "..\\App\\app_cfg.h"









 





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



 
#line 17 "..\\App\\app_cfg.h"
#line 1 "..\\..\\uC-CPU\\cpu_core.h"



















 
















 









 









 








 



































 

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


















 




 


















 

                                                                 











 



#line 18 "..\\App\\app_cfg.h"





 













































































































#line 142 "..\\App\\app_cfg.h"

  

#line 151 "..\\App\\app_cfg.h"


















#line 176 "..\\App\\app_cfg.h"




















 



























#line 230 "..\\App\\app_cfg.h"




























 




#line 269 "..\\App\\app_cfg.h"








































 










 



















#line 92 "..\\BSP\\bsp.c"

#line 1 "..\\BSP\\bsp.h"










 











 

















 











 









 












 

#line 79 "..\\BSP\\bsp.h"
#line 1 "D:\\Keil\\ARM\\RV31\\INC\\stdarg.h"
 
 
 





 









#line 26 "D:\\Keil\\ARM\\RV31\\INC\\stdarg.h"








 

 
 
  typedef struct __va_list { void *__ap; } va_list;

   






 


   










 


   















 




   

 


   




 



   





 






#line 118 "D:\\Keil\\ARM\\RV31\\INC\\stdarg.h"











 
#line 80 "..\\BSP\\bsp.h"

#line 82 "..\\BSP\\bsp.h"
#line 83 "..\\BSP\\bsp.h"

#line 85 "..\\BSP\\bsp.h"
#line 86 "..\\BSP\\bsp.h"

#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_gpio.h"




















 

 







 
#line 1 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"




































 



 



 










 



 







 





#line 82 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"







 





 





 
#line 110 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"



 



 



 







 
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



 

#line 1 "..\\BSP\\CMSIS\\core_cm3.h"
 




















 























  







 




 






 

 











#line 93 "..\\BSP\\CMSIS\\core_cm3.h"

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



 


#line 95 "..\\BSP\\CMSIS\\core_cm3.h"
#line 1 "..\\BSP\\CMSIS\\core_cmInstr.h"
 




















 





 



 


 




 







 







 






 








 







 







 









 









 



static __inline __asm uint32_t __REV16(uint32_t value)
{
  rev16 r0, r0
  bx lr
}









 



static __inline __asm int32_t __REVSH(int32_t value)
{
  revsh r0, r0
  bx lr
}











 









 









 









 











 











 











 







 














 










 









 






#line 589 "..\\BSP\\CMSIS\\core_cmInstr.h"

   

#line 96 "..\\BSP\\CMSIS\\core_cm3.h"
#line 1 "..\\BSP\\CMSIS\\core_cmFunc.h"
 




















 




 



 
   

 

 
 
   






 



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








 



static __inline uint32_t __get_IPSR(void)
{
  register uint32_t __regIPSR          __asm("ipsr");
  return(__regIPSR);
}








 



static __inline uint32_t __get_APSR(void)
{
  register uint32_t __regAPSR          __asm("apsr");
  return(__regAPSR);
}








 



static __inline uint32_t __get_xPSR(void)
{
  register uint32_t __regXPSR          __asm("xpsr");
  return(__regXPSR);
}








 



static __inline uint32_t __get_PSP(void)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  return(__regProcessStackPointer);
}








 



static __inline void __set_PSP(uint32_t topOfProcStack)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  __regProcessStackPointer = topOfProcStack;
}








 



static __inline uint32_t __get_MSP(void)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  return(__regMainStackPointer);
}








 



static __inline void __set_MSP(uint32_t topOfMainStack)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  __regMainStackPointer = topOfMainStack;
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





#line 349 "..\\BSP\\CMSIS\\core_cmFunc.h"


#line 661 "..\\BSP\\CMSIS\\core_cmFunc.h"

 


#line 97 "..\\BSP\\CMSIS\\core_cm3.h"









 
#line 114 "..\\BSP\\CMSIS\\core_cm3.h"

 





 








 





 


 
typedef union
{
  struct
  {

    uint32_t _reserved0:27;               





    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                              
} APSR_Type;



 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       
    uint32_t _reserved0:23;               
  } b;                                    
  uint32_t w;                             
} IPSR_Type;



 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       

    uint32_t _reserved0:15;               





    uint32_t T:1;                         
    uint32_t IT:2;                        
    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} xPSR_Type;



 
typedef union
{
  struct
  {
    uint32_t nPRIV:1;                     
    uint32_t SPSEL:1;                     
    uint32_t FPCA:1;                      
    uint32_t _reserved0:29;               
  } b;                                    
  uint32_t w;                             
} CONTROL_Type;

 






 


 
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

 




































 






 







































 




 
 
 
#line 848 "..\\BSP\\CMSIS\\core_cm3.h"

#line 855 "..\\BSP\\CMSIS\\core_cm3.h"






 





 






 



 



 










 
static __inline void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);                          
  
  reg_value  =  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL))->AIRCR;                                                    
  reg_value &= ~((0xFFFFUL << 16) | (7UL << 8));              
  reg_value  =  (reg_value                       |
                (0x5FA << 16) | 
                (PriorityGroupTmp << 8));                                      
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL))->AIRCR =  reg_value;
}








 
static __inline uint32_t NVIC_GetPriorityGrouping(void)
{
  return ((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL))->AIRCR & (7UL << 8)) >> 8);    
}








 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL))->ISER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}








 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL))->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}










 
static __inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t) ((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL))->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}








 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL))->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}








 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL))->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}








 
static __inline uint32_t NVIC_GetActive(IRQn_Type IRQn)
{
  return((uint32_t)((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL))->IABR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}












 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL))->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 - 4)) & 0xff); }  
  else {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL))->IP[(uint32_t)(IRQn)] = ((priority << (8 - 4)) & 0xff);    }         
}













 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)(((SCB_Type *) ((0xE000E000UL) + 0x0D00UL))->SHP[((uint32_t)(IRQn) & 0xF)-4] >> (8 - 4)));  }  
  else {
    return((uint32_t)(((NVIC_Type *) ((0xE000E000UL) + 0x0100UL))->IP[(uint32_t)(IRQn)]           >> (8 - 4)));  }  
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





 
static __inline void NVIC_SystemReset(void)
{
  __dsb(0xF);                                                     
               
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL))->AIRCR  = ((0x5FA << 16)      | 
                 (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL))->AIRCR & (7UL << 8)) | 
                 (1UL << 2));                    
  __dsb(0xF);                                                                    
  while(1);                                                     
}

 



 



 











 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{ 
  if (ticks > (0xFFFFFFUL << 0))  return (1);             
                                                               
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL))->LOAD  = (ticks & (0xFFFFFFUL << 0)) - 1;       
  NVIC_SetPriority (SysTick_IRQn, (1<<4) - 1);   
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL))->VAL   = 0;                                           
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL))->CTRL  = (1UL << 2) | 
                   (1UL << 1)   | 
                   (1UL << 0);                     
  return (0);                                                   
}



 



 



 

extern volatile int32_t ITM_RxBuffer;                     











 
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if ((((CoreDebug_Type *) (0xE000EDF0UL))->DEMCR & (1UL << 24))  &&       
      (((ITM_Type *) (0xE0000000UL))->TCR & (1UL << 0))                  &&       
      (((ITM_Type *) (0xE0000000UL))->TER & (1UL << 0)        )                    )      
  {
    while (((ITM_Type *) (0xE0000000UL))->PORT[0].u32 == 0);
    ((ITM_Type *) (0xE0000000UL))->PORT[0].u8 = (uint8_t) ch;
  }  
  return (ch);
}










 
static __inline int32_t ITM_ReceiveChar (void) {
  int32_t ch = -1;                            

  if (ITM_RxBuffer != 0x5AA55AA5) {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = 0x5AA55AA5;        
  }
  
  return (ch); 
}









 
static __inline int32_t ITM_CheckChar (void) {

  if (ITM_RxBuffer == 0x5AA55AA5) {
    return (0);                                  
  } else {
    return (1);                                  
  }
}

 









 
#line 230 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"
#line 1 "..\\BSP\\CMSIS\\Device_Support\\system_stm32f2xx.h"



















  



 



   
  


 









 



 




 

extern uint32_t SystemCoreClock;           




 



 



 



 



 



 
  
extern void SystemInit(void);
extern void SystemCoreClockUpdate(void);


 









 
  


   
 
#line 231 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"
#line 232 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"



 
 
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



 



 










 





 
#line 1034 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1051 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1089 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 





 






 




 



 
#line 1194 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"



 



 

  

 

 
 
 

 
 
 
 
 
 
#line 1223 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1249 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1275 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1313 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1355 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 


 


 


 


 


 
#line 1404 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1442 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1480 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1509 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 


 


 


 



 
#line 1545 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1567 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 



 
 
 
 
 
 
 
#line 1588 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1599 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1617 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"











 





 





 
#line 1655 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 












 
#line 1676 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
 






 




 





 





 






 




 





 





 






 




 





 





 





 




 





 





 





 




 





 





 
 


 
#line 1816 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1833 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1850 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1867 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1901 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1935 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 1969 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2003 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2037 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2071 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2105 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2139 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2173 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2207 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2241 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2275 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2309 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2343 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2377 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2411 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2445 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2479 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2513 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2547 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2581 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2615 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2649 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2683 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2717 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2751 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2785 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 2819 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
 
 
 
 
 



 



 


 
 
 
 
 
 


#line 2856 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 2865 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"
 





 


 


 


 



 
 
 
 
 
 









































 



 


 


 


 


 


 


 



 



 



 


 


 



 
 
 
 
 

 
 
 
 
 
 
#line 3001 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 




 






 






 






 






 
 
 
 
 
 
#line 3076 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3095 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3106 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3128 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3150 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3172 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3194 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
 
 
 
 
 
#line 3221 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3243 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3265 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3287 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3309 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3331 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
 
 
 
 
 
#line 3347 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 3355 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3364 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3378 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3408 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
 
 
 
 
 











#line 3436 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 











#line 3459 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 











#line 3482 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 











#line 3505 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 








































 








































 








































 








































 


































 


































 


































 


































 



























 



























 



























 
#line 3902 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3911 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3920 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3931 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 3941 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 3951 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 3961 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 3972 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 3982 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 3992 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4002 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 4013 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4023 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4033 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4043 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 4054 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4064 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4074 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4084 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 4095 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4105 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4115 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4125 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 4136 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4146 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4156 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4166 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 4177 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4187 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4197 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4207 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 


 
 
 
 
 
 
































































 
#line 4301 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
































































 
































































 
#line 4449 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 4467 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 4501 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
 
 
 
 
 
#line 4522 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 4531 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 



 





 
 
 
 
 
 
#line 4562 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 4571 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"







 



#line 4592 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"



 



 


 
#line 4617 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 4627 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 




 


 
 
 
 
 
 


 





 


 



 
 
 
 
 
 











 
#line 4683 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"





 
#line 4695 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
 
 
 
 
 



#line 4711 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4721 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4730 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 4739 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 4750 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"















 
 








 








 






#line 4800 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 











 











 
#line 4832 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 




















 
#line 4875 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 4891 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 






 


 
#line 4926 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 4939 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 4960 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 






 


 
#line 4995 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 5010 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 5034 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 






 


 
#line 5069 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 5084 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 











 
#line 5108 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 





 



 
 
 
 
 
 



 






 
 
 
 
 
 
#line 5168 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 5198 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 5224 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 5239 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 



 


 



 
#line 5292 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 5334 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 
#line 5366 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 5386 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 5394 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 
 
 
 
 
 




 












 


 






#line 5495 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 


 


 


 


 


 


 


 
















 


 
#line 5565 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 5580 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 5606 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 


 
 
 
 
 
 









#line 5638 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 5646 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 5656 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 


 


 


 





















 




 
 
 
 
 
 




 


 






 
#line 5726 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"


 
#line 5738 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"


 
#line 5750 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"


 
#line 5762 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 






 
#line 5780 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"


 
#line 5792 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"


 
#line 5804 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"


 
#line 5816 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 







 
#line 5835 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"


 
#line 5847 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"


 
#line 5859 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"


 
#line 5871 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 






 
#line 5888 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"


 
#line 5899 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"


 
#line 5910 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"


 
#line 5921 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 



 
 
 
 
 
 
















 









#line 5966 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 

























 
#line 6009 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 6023 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 6033 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 




























 





















 




























 





















 
#line 6152 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 


 


 


 


 


 


 


 
#line 6187 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"





#line 6198 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 6206 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 6213 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 
#line 6224 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"


 
 
 
 
 
 
#line 6242 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 



 
#line 6266 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 6275 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"







 
#line 6295 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 6306 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"



 
 
 
 
 
 
#line 6323 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"



 
#line 6335 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"







 



 
 
 
 
 
 



 









 
#line 6383 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 






 
 
 
 
 
 
#line 6425 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 6441 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 


 
#line 6458 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 
#line 6474 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 



 


 








 

 
#line 6501 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 






 



 


 


 
#line 6530 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 
#line 6545 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 
#line 6560 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 
 
 

 
#line 6575 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 




 




 




 




 


 


 


 


 


 


 
 
 

 
#line 6628 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

#line 6635 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 


 



 


 



 


 


 


 



 
 
 

 
#line 6710 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 


 


 


 


 




   
#line 6761 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 6787 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 
#line 6804 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"

 





 


 


 


 




 

 

 

#line 1 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "



















  

 



 
 
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"




















 

 







 
#line 1 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"




































 



 



 

#line 6862 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"



 

  

 

 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"



 



  

 



  
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


 



  






  
#line 135 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"


  




  
#line 151 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"


  




  
#line 167 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"
                                     


  




  
#line 208 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"
                                     


  




  
#line 225 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"
                                      


  




  
#line 242 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"


  




  
#line 282 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"


  




  






  




  
#line 321 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"





#line 345 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"


  




  
#line 369 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"


  




  
#line 385 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"
                                            


  




  
#line 426 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"


  




  
#line 442 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"


  




  
#line 464 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"


  




  
#line 478 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"


  




  
#line 492 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"
  
#line 500 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_adc.h"


  




  



  




  



  




  



  




  



  




  



  




  



  




  



  




  

 
   

   
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









  



  

 
#line 29 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_can.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_can.h"



 



 

 






 
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

 



 



 





 




 



 












 


 


   










 
  



   





 



 









 



 
#line 283 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_can.h"




 



 
#line 300 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_can.h"




 



 



 



 



 



 







 



 







 



 





 




 



 



 



 






 



 





 




 



 




 




 



 





 	






 



 






 



 



 	




 



 



 




 




                                                          
#line 475 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_can.h"


 



 

 

 

 




 
#line 499 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_can.h"

 



 

 





#line 520 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_can.h"








 

  


  


 
#line 543 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_can.h"

 



 






 





#line 568 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_can.h"

#line 575 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_can.h"


 



 

 
   

  
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









 



 

 
#line 30 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_crc.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_crc.h"



 



 

 
 



 



 

 
   

void CRC_ResetDR(void);
uint32_t CRC_CalcCRC(uint32_t Data);
uint32_t CRC_CalcBlockCRC(uint32_t pBuffer[], uint32_t BufferLength);
uint32_t CRC_GetCRC(void);
void CRC_SetIDRegister(uint8_t IDValue);
uint8_t CRC_GetIDRegister(void);









 



 

 
#line 31 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_cryp.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_cryp.h"



 



  

 



  
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


 



 



 







  
 


 

 



 



 





#line 154 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_cryp.h"


  
 


 
#line 169 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_cryp.h"


 
                                     


 
#line 182 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_cryp.h"


 



 
#line 201 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_cryp.h"

#line 209 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_cryp.h"


 



 







 



 





 



 





  



  

 
 

 
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









 



  

 
#line 32 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dac.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dac.h"



 



 

 



 

typedef struct
{
  uint32_t DAC_Trigger;                      
 

  uint32_t DAC_WaveGeneration;               

 

  uint32_t DAC_LFSRUnmask_TriangleAmplitude; 

 

  uint32_t DAC_OutputBuffer;                 
 
}DAC_InitTypeDef;

 



 



 

#line 83 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dac.h"




#line 96 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dac.h"



 



 

#line 111 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dac.h"


 



 

#line 143 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dac.h"

#line 168 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dac.h"


 



 







 



 







 



 

#line 206 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dac.h"


 



 







 



 




 
  


    





  



  
  





 



 

 
   

   
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









 



 

 
#line 33 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dbgmcu.h"



















 

 







 
#line 32 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dbgmcu.h"



 



  

 
 



  





#line 70 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dbgmcu.h"

#line 77 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dbgmcu.h"


  

 
  
uint32_t DBGMCU_GetREVID(void);
uint32_t DBGMCU_GetDEVID(void);
void DBGMCU_Config(uint32_t DBGMCU_Periph, FunctionalState NewState);
void DBGMCU_APB1PeriphConfig(uint32_t DBGMCU_Periph, FunctionalState NewState);
void DBGMCU_APB2PeriphConfig(uint32_t DBGMCU_Periph, FunctionalState NewState);









  



  

 
#line 34 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dcmi.h"



















 

 







 
#line 32 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dcmi.h"



 



  

 


  
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

 



 



  
#line 114 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dcmi.h"


  




  
#line 128 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dcmi.h"


  




  






  




  






  




  






  




  
#line 178 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dcmi.h"


  




  
#line 194 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dcmi.h"


  




  
#line 213 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dcmi.h"


  




  


  





  







  
#line 256 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dcmi.h"
                                



  



  

 
  

  
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









  



  

 
#line 35 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dma.h"




















  

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dma.h"



 



 

 



 

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

 



 

#line 128 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dma.h"






  
#line 143 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dma.h"

#line 152 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dma.h"


  




  









  




  



  




  







  




  







  




  









  




  









  




  







  




  











  




  







  




  











  




  











  




  











  




 
#line 340 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dma.h"

#line 347 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dma.h"


  



 
#line 394 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dma.h"




#line 418 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dma.h"


  




  









  




  
#line 481 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dma.h"





#line 506 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_dma.h"


  




  







  




  







  




  






  



  

 
  

  
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









 



 


 
#line 36 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_exti.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_exti.h"



 



 

 



 

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

 



 



 

#line 122 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_exti.h"
                                          


#line 137 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_exti.h"
                    


 



 

 
 

 
void EXTI_DeInit(void);

 
void EXTI_Init(EXTI_InitTypeDef* EXTI_InitStruct);
void EXTI_StructInit(EXTI_InitTypeDef* EXTI_InitStruct);
void EXTI_GenerateSWInterrupt(uint32_t EXTI_Line);

 
FlagStatus EXTI_GetFlagStatus(uint32_t EXTI_Line);
void EXTI_ClearFlag(uint32_t EXTI_Line);
ITStatus EXTI_GetITStatus(uint32_t EXTI_Line);
void EXTI_ClearITPendingBit(uint32_t EXTI_Line);









 



 

 
#line 37 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_flash.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_flash.h"



 



  

 


  
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

 



   



  
#line 75 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_flash.h"

#line 84 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_flash.h"


  



  











  



  
#line 127 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_flash.h"


  



  
#line 147 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_flash.h"




 



 


  
 





  



  





  



  





  




  





 
  


   
#line 207 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_flash.h"


 



  





  



  
#line 236 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_flash.h"


 



 







  



  







  



  



  






  

 
  
 
 
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









  



  

 
#line 38 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_fsmc.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_fsmc.h"



 



 

 



 
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

 



 



 






 



   




 



     



 



















 



 







 



 

#line 308 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_fsmc.h"


 



 







 



 







 
    


 






 



 






 



 






 



 






 



 






 



 






 



 







 



 







 



 



 



 



 



 



 



 



 



 



 



 



 



 
#line 485 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_fsmc.h"


 



 
  


 



 






 




 






 



 
#line 535 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_fsmc.h"


 



 



 



 



 



 



 



 



 



 



 



 



 



 
#line 597 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_fsmc.h"


 



 
#line 612 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_fsmc.h"




 



 



 

 
  

 
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








 



  

 
#line 39 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_hash.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_hash.h"



 



  

 



  
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









  



  

 
#line 40 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_gpio.h"




















 

 
#line 396 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_gpio.h"



  



  

 
#line 41 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_i2c.h"




















  

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_i2c.h"



 



 

 



 

typedef struct
{
  uint32_t I2C_ClockSpeed;          
 

  uint16_t I2C_Mode;                
 

  uint16_t I2C_DutyCycle;           
 

  uint16_t I2C_OwnAddress1;         
 

  uint16_t I2C_Ack;                 
 

  uint16_t I2C_AcknowledgedAddress; 
 
}I2C_InitTypeDef;

 




 





 

#line 88 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_i2c.h"


 



 







  



 







 



 







 



 







  



 

#line 162 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_i2c.h"


 



 







  



 







 



 







  



 







  



 

#line 232 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_i2c.h"



#line 242 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_i2c.h"


 



 



 

#line 261 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_i2c.h"



 

#line 280 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_i2c.h"



#line 294 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_i2c.h"


 



 





 








 
 

























 

 


 





























 

  
 


 
 

 







 

























 

    
 



 



 



























 

  
 

 


 
 


 






 

#line 500 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_i2c.h"


 



 




 



 




 



 

 
  

 
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









  



  

 
#line 42 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_iwdg.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_iwdg.h"



 



 

 
 



 
  


 






 



 
#line 77 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_iwdg.h"


 



 






 



 

 
 

 
void IWDG_WriteAccessCmd(uint16_t IWDG_WriteAccess);
void IWDG_SetPrescaler(uint8_t IWDG_Prescaler);
void IWDG_SetReload(uint16_t Reload);
void IWDG_ReloadCounter(void);

 
void IWDG_Enable(void);

 
FlagStatus IWDG_GetFlagStatus(uint16_t IWDG_FLAG);









 



 

 
#line 43 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_pwr.h"




















  

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_pwr.h"



 



  

 
 



  



  

#line 61 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_pwr.h"







 

  


 







 



 




 


 



 












 



 

 
  

  
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









 



 

 
#line 44 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"



















 

 







 
#line 32 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"



 



  

 
typedef struct
{
  uint32_t SYSCLK_Frequency;  
  uint32_t HCLK_Frequency;    
  uint32_t PCLK1_Frequency;   
  uint32_t PCLK2_Frequency;   
}RCC_ClocksTypeDef;

 



 
  


 







  
  


 
#line 79 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"
 




  
  


 
#line 95 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"


  
  


 
#line 116 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"


  
  


 
#line 131 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"


  
  


 
#line 151 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"


  
  


 







  
  


 
#line 234 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"


  
  


 






  
  


  
#line 277 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"


  
  


   
#line 290 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"


  
  


  




  
  


  
#line 330 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"


  
  


  
#line 353 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"


  
  


 
#line 371 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"
                                   





  
  


 
#line 393 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"
                                   





  
  


 
#line 425 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rcc.h"


  



  

 
  

 
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









  



  

 
#line 45 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rng.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rng.h"



 



  

 
  



 
  


  











  



   







  



  

 
  

  
void RNG_DeInit(void);

 
void RNG_Cmd(FunctionalState NewState);

 
uint32_t RNG_GetRandomNumber(void);

 
void RNG_ITConfig(FunctionalState NewState);
FlagStatus RNG_GetFlagStatus(uint8_t RNG_FLAG);
void RNG_ClearFlag(uint8_t RNG_FLAG);
ITStatus RNG_GetITStatus(uint8_t RNG_IT);
void RNG_ClearITPendingBit(uint8_t RNG_IT);









  



  

 
#line 46 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rtc.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rtc.h"



 



  

 



  
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

 



  




  






  



  

 


  




  




  



  







  



  






  



  




  



  

 
#line 205 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rtc.h"



  



  
  
#line 228 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rtc.h"


  




  
#line 244 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rtc.h"



  




  








  




  
#line 274 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rtc.h"



  



  







  



  
#line 307 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rtc.h"


  



  






  



  




 







  



  






  




  








  




  











  



  







  



  





 



  






  



  






  



  







  



 

#line 481 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rtc.h"


  



  






  



  
#line 518 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rtc.h"



  



  
#line 532 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_rtc.h"









  



  





  



  

 
  

 
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


ErrorStatus RTC_SetDateTime(uint32_t RTC_Format, RTC_DateTypeDef* RTC_DateStruct, RTC_TimeTypeDef* RTC_TimeStruct);

 
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









  



  

 
#line 47 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_sdio.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_sdio.h"



 



 

 

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


 



 



 







 



 







  



 







 



 









 



 







 



 






  




 

#line 219 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_sdio.h"


  



 




 



 

#line 242 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_sdio.h"


 



 








 



 






  



 

#line 280 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_sdio.h"


 



 




 



 

#line 327 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_sdio.h"


 



 







 



 







 



 






 



 

#line 418 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_sdio.h"



#line 445 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_sdio.h"





 



 







 



 

 
 
 
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









 



 

 
#line 48 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_spi.h"




















  

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_spi.h"



 



  

 



 

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

 



 










 
  
#line 132 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_spi.h"


 



 







 



 







  



 







 



 







 



 







  



 

#line 216 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_spi.h"


  



 







 



 

#line 244 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_spi.h"


 
  



 

#line 263 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_spi.h"


 
  


 

#line 279 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_spi.h"


 



 







 



 

#line 309 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_spi.h"






 
            


 







 



 






 



 







 



 






 



 







 



 























 



 

#line 416 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_spi.h"

#line 423 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_spi.h"


 



 




 



 

#line 459 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_spi.h"


 
  


 

 
  

  
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









 



 

 
#line 49 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_syscfg.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_syscfg.h"



 



  

 
 
  


  



  
#line 61 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_syscfg.h"
                                      
#line 71 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_syscfg.h"


  




  
#line 111 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_syscfg.h"


  




  




   






  




  







  



  

 
  
 
void SYSCFG_DeInit(void);
void SYSCFG_MemoryRemapConfig(uint8_t SYSCFG_MemoryRemap);
void SYSCFG_EXTILineConfig(uint8_t EXTI_PortSourceGPIOx, uint8_t EXTI_PinSourcex);
void SYSCFG_ETH_MediaInterfaceConfig(uint32_t SYSCFG_ETH_MediaInterface); 
void SYSCFG_CompensationCellCmd(FunctionalState NewState); 
FlagStatus SYSCFG_GetCompensationCellStatus(void);









  



  

 
#line 50 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"



 



  

 




 

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

 



 

#line 183 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"
                                          
#line 196 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"
                                     
 
#line 206 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"
 
#line 213 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"
 


 
#line 225 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"
                                






 

#line 254 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


 



 







  



 





                                 




                                 







  



 

#line 303 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


 



 

#line 321 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


  



 







 



 
  






 



 







  



 







  



 







  



 







  



 







  



 







  



 







  



 

#line 445 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


  



 







 



 







  



 







  



 







  



 

#line 507 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


  



 

#line 523 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


  



 

#line 539 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


  



 

#line 556 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"

#line 565 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


  



 

#line 613 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


  



 

#line 657 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


  



 

#line 673 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"



  



 

#line 690 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


  



 

#line 718 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


  



 







  



  






 



 







  



 







  



 

#line 779 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


  




 

#line 797 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"
  


  



 

#line 812 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


  



 







  



 





                                     


  



 







  



 

#line 873 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


  



 

#line 889 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


  



 







  


 














#line 931 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"



  


 

#line 963 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"



  



 




  



 




  



 

#line 1008 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_tim.h"


 



 

 
  

 
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









  



 

 
#line 51 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_usart.h"




















  

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_usart.h"



 



  

  



  
  
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

 



  
  
#line 110 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_usart.h"








  
  


                                    




  



  
  
#line 141 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_usart.h"


  



  
  
#line 155 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_usart.h"


  



  
  





  



  
#line 182 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_usart.h"


  



  






  



 
  






  



 







 



 







  



 
  
#line 259 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_usart.h"


 



 







  



 







 



 
  







 



 







  



 

#line 331 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_usart.h"
                              








  



  

 
   

  
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









  



  

 
#line 52 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_wwdg.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_wwdg.h"



 



  

 
 



  
  


 
  
#line 63 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_wwdg.h"



  



  

 
 
  
   
void WWDG_DeInit(void);

 
void WWDG_SetPrescaler(uint32_t WWDG_Prescaler);
void WWDG_SetWindowValue(uint8_t WindowValue);
void WWDG_EnableIT(void);
void WWDG_SetCounter(uint8_t Counter);

 
void WWDG_Enable(uint8_t Counter);

 
FlagStatus WWDG_GetFlagStatus(void);
void WWDG_ClearFlag(void);









  



  

 
#line 53 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "
#line 1 "..\\BSP\\STM32F2xx\\inc\\misc.h"




















 

 







 
#line 33 "..\\BSP\\STM32F2xx\\inc\\misc.h"



 



 

 



 

typedef struct
{
  uint8_t NVIC_IRQChannel;                    


 

  uint8_t NVIC_IRQChannelPreemptionPriority;  


 

  uint8_t NVIC_IRQChannelSubPriority;         


 

  FunctionalState NVIC_IRQChannelCmd;         

    
} NVIC_InitTypeDef;
 
 



 



 







 



 

#line 98 "..\\BSP\\STM32F2xx\\inc\\misc.h"


 



 

#line 116 "..\\BSP\\STM32F2xx\\inc\\misc.h"















 



 







 



 

 
 

void NVIC_PriorityGroupConfig(uint32_t NVIC_PriorityGroup);
void NVIC_Init(NVIC_InitTypeDef* NVIC_InitStruct);
void NVIC_SetVectorTable(uint32_t NVIC_VectTab, uint32_t Offset);
void NVIC_SystemLPConfig(uint8_t LowPowerMode, FunctionalState NewState);
void SysTick_CLKSourceConfig(uint32_t SysTick_CLKSource);









 



 

 
#line 54 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "

 
 



 
   



 
 

 
#line 85 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx_conf.h "



 
#line 6833 "..\\BSP\\CMSIS\\Device_Support\\stm32f2xx.h"




 

















 









 

  

 

 
#line 33 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_gpio.h"



 



  

 

#line 53 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_gpio.h"
                                                                


    
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

 



  



  
#line 161 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_gpio.h"

#line 179 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_gpio.h"


  




  
#line 203 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_gpio.h"

#line 220 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_gpio.h"


  



  


  








  





  






  







  






  





  




  






  






  








  





  




  






  




  


#line 344 "..\\BSP\\STM32F2xx\\inc\\stm32f2xx_gpio.h"


  



 
    








 



 

 
  

 
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









  



  

 
#line 88 "..\\BSP\\bsp.h"
#line 89 "..\\BSP\\bsp.h"
#line 90 "..\\BSP\\bsp.h"
#line 91 "..\\BSP\\bsp.h"
#line 92 "..\\BSP\\bsp.h"
#line 93 "..\\BSP\\bsp.h"
#line 94 "..\\BSP\\bsp.h"
#line 95 "..\\BSP\\bsp.h"

#line 1 "..\\BSP\\bsp_ser.h"











 

















 








 









 












 





 

#line 71 "..\\BSP\\bsp_ser.h"






 











 






 






 






 






 

#line 125 "..\\BSP\\bsp_ser.h"






 


void         BSP_Ser_Init   (CPU_INT32U  baud_rate);

CPU_INT08U   BSP_Ser_RdByte (void);
void         BSP_Ser_RdStr  (CPU_CHAR    *p_str,
                             CPU_INT16U   len);

void         BSP_Ser_WrByte (CPU_INT08U   c);
void         BSP_Ser_WrStr  (CPU_CHAR    *p_str);

void         BSP_Ser_Printf (CPU_CHAR     *format,
                             ...);







 

#line 97 "..\\BSP\\bsp.h"
#line 1 "..\\BSP\\UCOS-II\\bsp_os.h"











 











 








 









 

#line 1 "..\\..\\uCOS-II\\Source\\ucos_ii.h"




















 












 







 

#line 45 "..\\..\\uCOS-II\\Source\\ucos_ii.h"
#line 1 "..\\App\\os_cfg.h"






















 





                                        










                                        













                                        





                                        
#line 73 "..\\App\\os_cfg.h"


                                        
#line 83 "..\\App\\os_cfg.h"


                                        
#line 93 "..\\App\\os_cfg.h"


                                        





                                        






                                        
#line 118 "..\\App\\os_cfg.h"


                                        
#line 127 "..\\App\\os_cfg.h"


                                        






                                        






#line 46 "..\\..\\uCOS-II\\Source\\ucos_ii.h"
#line 1 "..\\..\\uCOS-II\\Ports\\ARM-Cortex-M3\\os_cpu.h"























 




















 

typedef unsigned char  BOOLEAN;
typedef unsigned char  INT8U;                     
typedef signed   char  INT8S;                     
typedef unsigned short INT16U;                    
typedef signed   short INT16S;                    
typedef unsigned int   INT32U;                    
typedef signed   int   INT32S;                    
typedef float          FP32;                      
typedef double         FP64;                      

typedef unsigned int   OS_STK;                    
typedef unsigned int   OS_CPU_SR;                 





















 












 









 

extern  OS_STK   OS_CPU_ExceptStk[128u];
extern  OS_STK  *OS_CPU_ExceptStkBase;





 


OS_CPU_SR  OS_CPU_SR_Save(void);
void       OS_CPU_SR_Restore(OS_CPU_SR cpu_sr);


void       OSCtxSw(void);
void       OSIntCtxSw(void);
void       OSStartHighRdy(void);

void       OS_CPU_PendSVHandler(void);

                                                   
void       OS_CPU_SysTickHandler(void);
void       OS_CPU_SysTickInit(INT32U  cnts);
#line 47 "..\\..\\uCOS-II\\Source\\ucos_ii.h"





 





























#line 89 "..\\..\\uCOS-II\\Source\\ucos_ii.h"









 




 
#line 112 "..\\..\\uCOS-II\\Source\\ucos_ii.h"







 








 
#line 135 "..\\..\\uCOS-II\\Source\\ucos_ii.h"


                                             





 

























 











 









 









 









 









 












 









 


#line 256 "..\\..\\uCOS-II\\Source\\ucos_ii.h"

#line 267 "..\\..\\uCOS-II\\Source\\ucos_ii.h"













#line 294 "..\\..\\uCOS-II\\Source\\ucos_ii.h"

#line 301 "..\\..\\uCOS-II\\Source\\ucos_ii.h"

#line 312 "..\\..\\uCOS-II\\Source\\ucos_ii.h"



#line 321 "..\\..\\uCOS-II\\Source\\ucos_ii.h"



#line 338 "..\\..\\uCOS-II\\Source\\ucos_ii.h"



 




 


typedef  INT8U    OS_PRIO;





typedef struct os_event {
    INT8U    OSEventType;                     
    void    *OSEventPtr;                      
    INT16U   OSEventCnt;                      
    OS_PRIO  OSEventGrp;                      
    OS_PRIO  OSEventTbl[((63u) / 8u + 1u)];   


    INT8U   *OSEventName;

} OS_EVENT;







 








typedef  INT16U   OS_FLAGS;







typedef struct os_flag_grp {                 
    INT8U         OSFlagType;                
    void         *OSFlagWaitList;            
    OS_FLAGS      OSFlagFlags;               

    INT8U        *OSFlagName;

} OS_FLAG_GRP;



typedef struct os_flag_node {                
    void         *OSFlagNodeNext;            
    void         *OSFlagNodePrev;            
    void         *OSFlagNodeTCB;             
    void         *OSFlagNodeFlagGrp;         
    OS_FLAGS      OSFlagNodeFlags;           
    INT8U         OSFlagNodeWaitType;        
                                             
                                             
                                             
                                             
} OS_FLAG_NODE;


 




 


typedef struct os_mbox_data {
    void   *OSMsg;                          
    OS_PRIO OSEventTbl[((63u) / 8u + 1u)];  
    OS_PRIO OSEventGrp;                     
} OS_MBOX_DATA;






 


typedef struct os_mem {                    
    void   *OSMemAddr;                     
    void   *OSMemFreeList;                 
    INT32U  OSMemBlkSize;                  
    INT32U  OSMemNBlks;                    
    INT32U  OSMemNFree;                    

    INT8U  *OSMemName;                     

} OS_MEM;


typedef struct os_mem_data {
    void   *OSAddr;                     
    void   *OSFreeList;                 
    INT32U  OSBlkSize;                  
    INT32U  OSNBlks;                    
    INT32U  OSNFree;                    
    INT32U  OSNUsed;                    
} OS_MEM_DATA;


 




 


typedef struct os_mutex_data {
    OS_PRIO OSEventTbl[((63u) / 8u + 1u)];   
    OS_PRIO OSEventGrp;                      
    BOOLEAN OSValue;                         
    INT8U   OSOwnerPrio;                     
    INT8U   OSMutexPCP;                      
} OS_MUTEX_DATA;






 


typedef struct os_q {                    
    struct os_q   *OSQPtr;               
    void         **OSQStart;             
    void         **OSQEnd;               
    void         **OSQIn;                
    void         **OSQOut;               
    INT16U         OSQSize;              
    INT16U         OSQEntries;           
} OS_Q;


typedef struct os_q_data {
    void          *OSMsg;                
    INT16U         OSNMsgs;              
    INT16U         OSQSize;              
    OS_PRIO        OSEventTbl[((63u) / 8u + 1u)];   
    OS_PRIO        OSEventGrp;           
} OS_Q_DATA;






 


typedef struct os_sem_data {
    INT16U  OSCnt;                           
    OS_PRIO OSEventTbl[((63u) / 8u + 1u)];   
    OS_PRIO OSEventGrp;                      
} OS_SEM_DATA;






 


typedef struct os_stk_data {
    INT32U  OSFree;                     
    INT32U  OSUsed;                     
} OS_STK_DATA;


 




 

typedef struct os_tcb {
    OS_STK          *OSTCBStkPtr;            


    void            *OSTCBExtPtr;            
    OS_STK          *OSTCBStkBottom;         
    INT32U           OSTCBStkSize;           
    INT16U           OSTCBOpt;               
    INT16U           OSTCBId;                


    struct os_tcb   *OSTCBNext;              
    struct os_tcb   *OSTCBPrev;              


    OS_EVENT        *OSTCBEventPtr;          



    OS_EVENT       **OSTCBEventMultiPtr;     



    void            *OSTCBMsg;               




    OS_FLAG_NODE    *OSTCBFlagNode;          

    OS_FLAGS         OSTCBFlagsRdy;          


    INT32U           OSTCBDly;               
    INT8U            OSTCBStat;              
    INT8U            OSTCBStatPend;          
    INT8U            OSTCBPrio;              

    INT8U            OSTCBX;                 
    INT8U            OSTCBY;                 
    OS_PRIO          OSTCBBitX;              
    OS_PRIO          OSTCBBitY;              


    INT8U            OSTCBDelReq;            



    INT32U           OSTCBCtxSwCtr;          
    INT32U           OSTCBCyclesTot;         
    INT32U           OSTCBCyclesStart;       
    OS_STK          *OSTCBStkBase;           
    INT32U           OSTCBStkUsed;           



    INT8U           *OSTCBTaskName;



    INT32U           OSTCBRegTbl[1u];

} OS_TCB;

 




 


typedef  void (*OS_TMR_CALLBACK)(void *ptmr, void *parg);



typedef  struct  os_tmr {
    INT8U            OSTmrType;                        
    OS_TMR_CALLBACK  OSTmrCallback;                    
    void            *OSTmrCallbackArg;                 
    void            *OSTmrNext;                        
    void            *OSTmrPrev;
    INT32U           OSTmrMatch;                       
    INT32U           OSTmrDly;                         
    INT32U           OSTmrPeriod;                      

    INT8U           *OSTmrName;                        

    INT8U            OSTmrOpt;                         
    INT8U            OSTmrState;                       
                                                       
                                                       
                                                       
} OS_TMR;



typedef  struct  os_tmr_wheel {
    OS_TMR          *OSTmrFirst;                       
    INT16U           OSTmrEntries;
} OS_TMR_WHEEL;


 




 

extern  INT32U            OSCtxSwCtr;                


extern  OS_EVENT         *OSEventFreeList;           
extern  OS_EVENT          OSEventTbl[80u]; 



extern  OS_FLAG_GRP       OSFlagTbl[5u];   
extern  OS_FLAG_GRP      *OSFlagFreeList;            



extern  INT8U             OSCPUUsage;                
extern  INT32U            OSIdleCtrMax;              
extern  INT32U            OSIdleCtrRun;              
extern  BOOLEAN           OSStatRdy;                 
extern  OS_STK            OSTaskStatStk[128u];       


extern  INT8U             OSIntNesting;              

extern  INT8U             OSLockNesting;             

extern  INT8U             OSPrioCur;                 
extern  INT8U             OSPrioHighRdy;             

extern  OS_PRIO           OSRdyGrp;                         
extern  OS_PRIO           OSRdyTbl[((63u) / 8u + 1u)];        

extern  BOOLEAN           OSRunning;                        

extern  INT8U             OSTaskCtr;                        

extern  volatile  INT32U  OSIdleCtr;                                  





extern  OS_STK            OSTaskIdleStk[128u];       


extern  OS_TCB           *OSTCBCur;                         
extern  OS_TCB           *OSTCBFreeList;                    
extern  OS_TCB           *OSTCBHighRdy;                     
extern  OS_TCB           *OSTCBList;                        
extern  OS_TCB           *OSTCBPrioTbl[63u + 1u];     
extern  OS_TCB            OSTCBTbl[20u + 2u];    


extern  INT8U             OSTickStepState;           



extern  OS_MEM           *OSMemFreeList;             
extern  OS_MEM            OSMemTbl[5u]; 



extern  OS_Q             *OSQFreeList;               
extern  OS_Q              OSQTbl[4u];         



extern  INT8U             OSTaskRegNextAvailID;      



extern  volatile  INT32U  OSTime;                    



extern  INT16U            OSTmrFree;                 
extern  INT16U            OSTmrUsed;                 
extern  INT32U            OSTmrTime;                 

extern  OS_EVENT         *OSTmrSem;                  
extern  OS_EVENT         *OSTmrSemSignal;            

extern  OS_TMR            OSTmrTbl[16u];  
extern  OS_TMR           *OSTmrFreeList;             
extern  OS_STK            OSTmrTaskStk[128u];

extern  OS_TMR_WHEEL      OSTmrWheelTbl[8u];


extern  INT8U   const     OSUnMapTbl[256];           

 





 





 




INT8U         OSEventNameGet          (OS_EVENT        *pevent,
                                       INT8U          **pname,
                                       INT8U           *perr);

void          OSEventNameSet          (OS_EVENT        *pevent,
                                       INT8U           *pname,
                                       INT8U           *perr);



INT16U        OSEventPendMulti        (OS_EVENT       **pevents_pend,
                                       OS_EVENT       **pevents_rdy,
                                       void           **pmsgs_rdy,
                                       INT32U           timeout,
                                       INT8U           *perr);








 




OS_FLAGS      OSFlagAccept            (OS_FLAG_GRP     *pgrp,
                                       OS_FLAGS         flags,
                                       INT8U            wait_type,
                                       INT8U           *perr);


OS_FLAG_GRP  *OSFlagCreate            (OS_FLAGS         flags,
                                       INT8U           *perr);


OS_FLAG_GRP  *OSFlagDel               (OS_FLAG_GRP     *pgrp,
                                       INT8U            opt,
                                       INT8U           *perr);



INT8U         OSFlagNameGet           (OS_FLAG_GRP     *pgrp,
                                       INT8U          **pname,
                                       INT8U           *perr);

void          OSFlagNameSet           (OS_FLAG_GRP     *pgrp,
                                       INT8U           *pname,
                                       INT8U           *perr);


OS_FLAGS      OSFlagPend              (OS_FLAG_GRP     *pgrp,
                                       OS_FLAGS         flags,
                                       INT8U            wait_type,
                                       INT32U           timeout,
                                       INT8U           *perr);

OS_FLAGS      OSFlagPendGetFlagsRdy   (void);
OS_FLAGS      OSFlagPost              (OS_FLAG_GRP     *pgrp,
                                       OS_FLAGS         flags,
                                       INT8U            opt,
                                       INT8U           *perr);


OS_FLAGS      OSFlagQuery             (OS_FLAG_GRP     *pgrp,
                                       INT8U           *perr);







 




void         *OSMboxAccept            (OS_EVENT        *pevent);


OS_EVENT     *OSMboxCreate            (void            *pmsg);


OS_EVENT     *OSMboxDel               (OS_EVENT        *pevent,
                                       INT8U            opt,
                                       INT8U           *perr);


void         *OSMboxPend              (OS_EVENT        *pevent,
                                       INT32U           timeout,
                                       INT8U           *perr);


INT8U         OSMboxPendAbort         (OS_EVENT        *pevent,
                                       INT8U            opt,
                                       INT8U           *perr);



INT8U         OSMboxPost              (OS_EVENT        *pevent,
                                       void            *pmsg);



INT8U         OSMboxPostOpt           (OS_EVENT        *pevent,
                                       void            *pmsg,
                                       INT8U            opt);



INT8U         OSMboxQuery             (OS_EVENT        *pevent,
                                       OS_MBOX_DATA    *p_mbox_data);







 



OS_MEM       *OSMemCreate             (void            *addr,
                                       INT32U           nblks,
                                       INT32U           blksize,
                                       INT8U           *perr);

void         *OSMemGet                (OS_MEM          *pmem,
                                       INT8U           *perr);

INT8U         OSMemNameGet            (OS_MEM          *pmem,
                                       INT8U          **pname,
                                       INT8U           *perr);

void          OSMemNameSet            (OS_MEM          *pmem,
                                       INT8U           *pname,
                                       INT8U           *perr);

INT8U         OSMemPut                (OS_MEM          *pmem,
                                       void            *pblk);


INT8U         OSMemQuery              (OS_MEM          *pmem,
                                       OS_MEM_DATA     *p_mem_data);








 




BOOLEAN       OSMutexAccept           (OS_EVENT        *pevent,
                                       INT8U           *perr);


OS_EVENT     *OSMutexCreate           (INT8U            prio,
                                       INT8U           *perr);


OS_EVENT     *OSMutexDel              (OS_EVENT        *pevent,
                                       INT8U            opt,
                                       INT8U           *perr);


void          OSMutexPend             (OS_EVENT        *pevent,
                                       INT32U           timeout,
                                       INT8U           *perr);

INT8U         OSMutexPost             (OS_EVENT        *pevent);


INT8U         OSMutexQuery            (OS_EVENT        *pevent,
                                       OS_MUTEX_DATA   *p_mutex_data);




 




 




void         *OSQAccept               (OS_EVENT        *pevent,
                                       INT8U           *perr);


OS_EVENT     *OSQCreate               (void           **start,
                                       INT16U           size);


OS_EVENT     *OSQDel                  (OS_EVENT        *pevent,
                                       INT8U            opt,
                                       INT8U           *perr);



INT8U         OSQFlush                (OS_EVENT        *pevent);


void         *OSQPend                 (OS_EVENT        *pevent,
                                       INT32U           timeout,
                                       INT8U           *perr);


INT8U         OSQPendAbort            (OS_EVENT        *pevent,
                                       INT8U            opt,
                                       INT8U           *perr);



INT8U         OSQPost                 (OS_EVENT        *pevent,
                                       void            *pmsg);



INT8U         OSQPostFront            (OS_EVENT        *pevent,
                                       void            *pmsg);



INT8U         OSQPostOpt              (OS_EVENT        *pevent,
                                       void            *pmsg,
                                       INT8U            opt);



INT8U         OSQQuery                (OS_EVENT        *pevent,
                                       OS_Q_DATA       *p_q_data);




 




 



INT16U        OSSemAccept             (OS_EVENT        *pevent);


OS_EVENT     *OSSemCreate             (INT16U           cnt);


OS_EVENT     *OSSemDel                (OS_EVENT        *pevent,
                                       INT8U            opt,
                                       INT8U           *perr);


void          OSSemPend               (OS_EVENT        *pevent,
                                       INT32U           timeout,
                                       INT8U           *perr);


INT8U         OSSemPendAbort          (OS_EVENT        *pevent,
                                       INT8U            opt,
                                       INT8U           *perr);


INT8U         OSSemPost               (OS_EVENT        *pevent);


INT8U         OSSemQuery              (OS_EVENT        *pevent,
                                       OS_SEM_DATA     *p_sem_data);



void          OSSemSet                (OS_EVENT        *pevent,
                                       INT16U           cnt,
                                       INT8U           *perr);




 




 

INT8U         OSTaskChangePrio        (INT8U            oldprio,
                                       INT8U            newprio);



INT8U         OSTaskCreate            (void           (*task)(void *p_arg),
                                       void            *p_arg,
                                       OS_STK          *ptos,
                                       INT8U            prio);



INT8U         OSTaskCreateExt         (void           (*task)(void *p_arg),
                                       void            *p_arg,
                                       OS_STK          *ptos,
                                       INT8U            prio,
                                       INT16U           id,
                                       OS_STK          *pbos,
                                       INT32U           stk_size,
                                       void            *pext,
                                       INT16U           opt);



INT8U         OSTaskDel               (INT8U            prio);
INT8U         OSTaskDelReq            (INT8U            prio);



INT8U         OSTaskNameGet           (INT8U            prio,
                                       INT8U          **pname,
                                       INT8U           *perr);

void          OSTaskNameSet           (INT8U            prio,
                                       INT8U           *pname,
                                       INT8U           *perr);



INT8U         OSTaskResume            (INT8U            prio);
INT8U         OSTaskSuspend           (INT8U            prio);



INT8U         OSTaskStkChk            (INT8U            prio,
                                       OS_STK_DATA     *p_stk_data);



INT8U         OSTaskQuery             (INT8U            prio,
                                       OS_TCB          *p_task_data);





INT32U        OSTaskRegGet            (INT8U            prio,
                                       INT8U            id,
                                       INT8U           *perr);

INT8U         OSTaskRegGetID          (INT8U           *perr);

void          OSTaskRegSet            (INT8U            prio,
                                       INT8U            id,
                                       INT32U           value,
                                       INT8U           *perr);


 




 

void          OSTimeDly               (INT32U           ticks);


INT8U         OSTimeDlyHMSM           (INT8U            hours,
                                       INT8U            minutes,
                                       INT8U            seconds,
                                       INT16U           ms);



INT8U         OSTimeDlyResume         (INT8U            prio);



INT32U        OSTimeGet               (void);
void          OSTimeSet               (INT32U           ticks);


void          OSTimeTick              (void);





 


OS_TMR      *OSTmrCreate              (INT32U           dly,
                                       INT32U           period,
                                       INT8U            opt,
                                       OS_TMR_CALLBACK  callback,
                                       void            *callback_arg,
                                       INT8U           *pname,
                                       INT8U           *perr);

BOOLEAN      OSTmrDel                 (OS_TMR          *ptmr,
                                       INT8U           *perr);


INT8U        OSTmrNameGet             (OS_TMR          *ptmr,
                                       INT8U          **pdest,
                                       INT8U           *perr);

INT32U       OSTmrRemainGet           (OS_TMR          *ptmr,
                                       INT8U           *perr);

INT8U        OSTmrStateGet            (OS_TMR          *ptmr,
                                       INT8U           *perr);

BOOLEAN      OSTmrStart               (OS_TMR          *ptmr,
                                       INT8U           *perr);

BOOLEAN      OSTmrStop                (OS_TMR          *ptmr,
                                       INT8U            opt,
                                       void            *callback_arg,
                                       INT8U           *perr);

INT8U        OSTmrSignal              (void);






 

void          OSInit                  (void);

void          OSIntEnter              (void);
void          OSIntExit               (void);






void          OSSchedLock             (void);
void          OSSchedUnlock           (void);


void          OSStart                 (void);

void          OSStatInit              (void);

INT16U        OSVersion               (void);

 





 


void          OS_Dummy                (void);



INT8U         OS_EventTaskRdy         (OS_EVENT        *pevent,
                                       void            *pmsg,
                                       INT8U            msk,
                                       INT8U            pend_stat);

void          OS_EventTaskWait        (OS_EVENT        *pevent);

void          OS_EventTaskRemove      (OS_TCB          *ptcb,
                                       OS_EVENT        *pevent);


void          OS_EventTaskWaitMulti   (OS_EVENT       **pevents_wait);

void          OS_EventTaskRemoveMulti (OS_TCB          *ptcb,
                                       OS_EVENT       **pevents_multi);


void          OS_EventWaitListInit    (OS_EVENT        *pevent);



void          OS_FlagInit             (void);
void          OS_FlagUnlink           (OS_FLAG_NODE    *pnode);


void          OS_MemClr               (INT8U           *pdest,
                                       INT16U           size);

void          OS_MemCopy              (INT8U           *pdest,
                                       INT8U           *psrc,
                                       INT16U           size);


void          OS_MemInit              (void);



void          OS_QInit                (void);


void          OS_Sched                (void);


INT8U         OS_StrLen               (INT8U           *psrc);


void          OS_TaskIdle             (void            *p_arg);

void          OS_TaskReturn           (void);


void          OS_TaskStat             (void            *p_arg);



void          OS_TaskStkClr           (OS_STK          *pbos,
                                       INT32U           size,
                                       INT16U           opt);



void          OS_TaskStatStkChk       (void);


INT8U         OS_TCBInit              (INT8U            prio,
                                       OS_STK          *ptos,
                                       OS_STK          *pbos,
                                       INT16U           id,
                                       INT32U           stk_size,
                                       void            *pext,
                                       INT16U           opt);


void          OSTmr_Init              (void);


 





 


void          OSDebugInit             (void);


void          OSInitHookBegin         (void);
void          OSInitHookEnd           (void);

void          OSTaskCreateHook        (OS_TCB          *ptcb);
void          OSTaskDelHook           (OS_TCB          *ptcb);

void          OSTaskIdleHook          (void);

void          OSTaskReturnHook        (OS_TCB          *ptcb);

void          OSTaskStatHook          (void);
OS_STK       *OSTaskStkInit           (void           (*task)(void *p_arg),
                                       void            *p_arg,
                                       OS_STK          *ptos,
                                       INT16U           opt);


void          OSTaskSwHook            (void);


void          OSTCBInitHook           (OS_TCB          *ptcb);


void          OSTimeTickHook          (void);


 





 


void          App_TaskCreateHook      (OS_TCB          *ptcb);
void          App_TaskDelHook         (OS_TCB          *ptcb);
void          App_TaskIdleHook        (void);

void          App_TaskReturnHook      (OS_TCB          *ptcb);

void          App_TaskStatHook        (void);


void          App_TaskSwHook          (void);


void          App_TCBInitHook         (OS_TCB          *ptcb);


void          App_TimeTickHook        (void);









 







 










 





 

#line 1411 "..\\..\\uCOS-II\\Source\\ucos_ii.h"






























 

#line 1449 "..\\..\\uCOS-II\\Source\\ucos_ii.h"


























 

#line 1487 "..\\..\\uCOS-II\\Source\\ucos_ii.h"














 

#line 1509 "..\\..\\uCOS-II\\Source\\ucos_ii.h"














 

#line 1535 "..\\..\\uCOS-II\\Source\\ucos_ii.h"






































 

#line 1581 "..\\..\\uCOS-II\\Source\\ucos_ii.h"






















 

#line 1611 "..\\..\\uCOS-II\\Source\\ucos_ii.h"



































#line 1653 "..\\..\\uCOS-II\\Source\\ucos_ii.h"

















#line 1677 "..\\..\\uCOS-II\\Source\\ucos_ii.h"





 





















 

#line 1713 "..\\..\\uCOS-II\\Source\\ucos_ii.h"

#line 1720 "..\\..\\uCOS-II\\Source\\ucos_ii.h"






#line 1732 "..\\..\\uCOS-II\\Source\\ucos_ii.h"
























 


























#line 1790 "..\\..\\uCOS-II\\Source\\ucos_ii.h"



































 

#line 1900 "..\\..\\uCOS-II\\Source\\ucos_ii.h"





#line 46 "..\\BSP\\UCOS-II\\bsp_os.h"






 












 






 

typedef   OS_EVENT    *BSP_OS_SEM;
typedef   CPU_INT16U   BSP_OS_SEM_VAL;






 






 






 

CPU_BOOLEAN  BSP_OS_SemCreate          (BSP_OS_SEM     *p_sem,
                                        BSP_OS_SEM_VAL  sem_val,
                                        CPU_CHAR       *p_sem_name);

CPU_BOOLEAN  BSP_OS_SemWait            (BSP_OS_SEM     *p_sem,
                                        CPU_INT32U      dly_ms);

CPU_BOOLEAN  BSP_OS_SemPost            (BSP_OS_SEM     *p_sem);

void         BSP_OS_TimeDlyMs          (CPU_INT32U      dly_ms);






 






 

#line 98 "..\\BSP\\bsp.h"

#line 1 "..\\BSP\\bsp_adc.h"








 




#line 1 "..\\BSP\\CMSIS\\core_cm3.h"
 




















 








#line 99 "..\\BSP\\CMSIS\\core_cm3.h"




#line 1229 "..\\BSP\\CMSIS\\core_cm3.h"







 
#line 15 "..\\BSP\\bsp_adc.h"









	

void BSP_ADC_Init(uint16_t *ResBuf);
void BSP_ADC_Start(void);






#line 100 "..\\BSP\\bsp.h"
#line 1 "..\\BSP\\bsp_dac.h"








 





void BSP_DAC_Init(uint16_t *buf);

void BSP_DAC_Start(uint16_t *buf, uint16_t len);


#line 101 "..\\BSP\\bsp.h"
#line 1 "..\\BSP\\bsp_led.h"








 





#line 1 "..\\BSP\\CMSIS\\core_cm3.h"
 




















 








#line 99 "..\\BSP\\CMSIS\\core_cm3.h"




#line 1229 "..\\BSP\\CMSIS\\core_cm3.h"







 
#line 16 "..\\BSP\\bsp_led.h"





#line 124 "..\\BSP\\bsp_led.h"




































void  BSP_LED_Init (void);
void  BSP_LED_On (uint8_t led);
void  BSP_LED_Off (uint8_t led);
void  BSP_LED_Toggle (uint8_t led);

#line 102 "..\\BSP\\bsp.h"
#line 1 "..\\BSP\\bsp_usart.h"








 




#line 1 "..\\BSP\\CMSIS\\core_cm3.h"
 




















 








#line 99 "..\\BSP\\CMSIS\\core_cm3.h"




#line 1229 "..\\BSP\\CMSIS\\core_cm3.h"







 
#line 15 "..\\BSP\\bsp_usart.h"
#line 16 "..\\BSP\\bsp_usart.h"
#line 17 "..\\BSP\\bsp_usart.h"



















typedef enum  {
	COM1 = 0,
	COM2,
	COM3,
	COM4,
	COM5,
	COM6
} COM_TypeDef;




typedef struct{
	DMA_Stream_TypeDef *stream;
	uint32_t	DataRegAddr;
	uint32_t	DMA_Channel;
	uint32_t	DMA_ItTCIF;
	uint32_t	DMA_ItTEIF;
	uint32_t	DMA_ItFEIF;
	uint32_t	DMA_FlagTCIF;
	uint16_t	DMA_Int_ID;
}USART_DMA, *pUSART_DMA;









#line 79 "..\\BSP\\bsp_usart.h"



























#line 118 "..\\BSP\\bsp_usart.h"


























#line 156 "..\\BSP\\bsp_usart.h"



























#line 195 "..\\BSP\\bsp_usart.h"


























#line 233 "..\\BSP\\bsp_usart.h"


























#line 271 "..\\BSP\\bsp_usart.h"



























extern USART_TypeDef* 	COM_USART[6];
extern OS_EVENT*		Sem_UsartTxRdy[6];







void BSP_USART_Init(COM_TypeDef COM, USART_InitTypeDef* USART_InitStruct, uint8_t MultiMode, uint8_t Addr);
void BSP_USART_TxData(COM_TypeDef COM, uint16_t len);
uint8_t BSP_GetUsartTxStatus(COM_TypeDef COM);


#line 103 "..\\BSP\\bsp.h"
#line 1 "..\\BSP\\bsp_tm3.h"








 






void BSP_Tm3_Init(void);

#line 104 "..\\BSP\\bsp.h"
#line 1 "..\\BSP\\bsp_tm6.h"








 






void BSP_Tm6_Init(void);

#line 105 "..\\BSP\\bsp.h"
#line 1 "..\\BSP\\bsp_gpio.h"









 




#line 1 "..\\BSP\\CMSIS\\core_cm3.h"
 




















 








#line 99 "..\\BSP\\CMSIS\\core_cm3.h"




#line 1229 "..\\BSP\\CMSIS\\core_cm3.h"







 
#line 16 "..\\BSP\\bsp_gpio.h"
#line 17 "..\\BSP\\bsp_gpio.h"






























#line 93 "..\\BSP\\bsp_gpio.h"




void 		BSP_GPIO_Init(void);
void		BSP_FeedDog(void);
void 		BSP_EnableUsartTx(COM_TypeDef com, uint8_t enable);







uint8_t		BSP_DetectSD(void);





#line 106 "..\\BSP\\bsp.h"
#line 1 "..\\BSP\\bsp_rtc.h"








 






#line 1 "..\\BSP\\CMSIS\\core_cm3.h"
 




















 








#line 99 "..\\BSP\\CMSIS\\core_cm3.h"




#line 1229 "..\\BSP\\CMSIS\\core_cm3.h"







 
#line 17 "..\\BSP\\bsp_rtc.h"
#line 18 "..\\BSP\\bsp_rtc.h"


extern RTC_TimeTypeDef RTC_TimeStructure;
extern RTC_DateTypeDef RTC_DateStructure;

void BSP_InitRTC(void);
void BSP_SetDateTime(RTC_TimeTypeDef *Time, RTC_DateTypeDef *Date);

void RTC_Callback(void);










#line 107 "..\\BSP\\bsp.h"
#line 1 "..\\BSP\\bsp_i2c.h"










 





#line 1 "..\\BSP\\CMSIS\\core_cm3.h"
 




















 








#line 99 "..\\BSP\\CMSIS\\core_cm3.h"




#line 1229 "..\\BSP\\CMSIS\\core_cm3.h"







 
#line 18 "..\\BSP\\bsp_i2c.h"











   
#line 42 "..\\BSP\\bsp_i2c.h"



#line 52 "..\\BSP\\bsp_i2c.h"
   




   
#line 68 "..\\BSP\\bsp_i2c.h"
   





 



#line 86 "..\\BSP\\bsp_i2c.h"

#line 104 "..\\BSP\\bsp_i2c.h"




 
#line 116 "..\\BSP\\bsp_i2c.h"





#line 130 "..\\BSP\\bsp_i2c.h"
   




    



 

   
    



   



  
void BSP_InitI2C1(void);


uint8_t BSP_ReadI2C1(uint8_t *buf, uint16_t ReadAddr, uint16_t *NumByteToRead);
uint8_t BSP_WriteI2C1(uint8_t *buf, uint16_t WriteAddr, uint16_t NumByteToWrite);




void     	sEE_DeInit(void);
void     	sEE_Init(void);
uint32_t 	sEE_ReadBuffer(uint8_t* pBuffer, uint16_t ReadAddr, uint16_t* NumByteToRead);
uint32_t 	sEE_WritePage(uint8_t* pBuffer, uint16_t WriteAddr, uint16_t* NumByteToWrite);
void     	sEE_WriteBuffer(uint8_t* pBuffer, uint16_t WriteAddr, uint16_t NumByteToWrite);
uint32_t 	sEE_WaitEepromStandbyState(void);

void 		sEE_LowLevel_DeInit(void);
void 		sEE_LowLevel_Init(void); 
void 		sEE_LowLevel_DMAConfig(uint32_t pBuffer, uint32_t BufferSize, uint32_t Direction);


   






 
uint32_t sEE_TIMEOUT_UserCallback(void);






#line 108 "..\\BSP\\bsp.h"
#line 1 "..\\BSP\\bsp_fsmc_sram.h"








 
























  






 
#line 43 "..\\BSP\\bsp_fsmc_sram.h"

	 
	 
	 
void BSP_RAM_Init(void);
void BSP_SRAM_WriteBuffer(uint16_t* pBuffer, uint32_t WriteAddr, uint32_t NumHalfwordToWrite);
void BSP_SRAM_ReadBuffer(uint16_t* pBuffer, uint32_t ReadAddr, uint32_t NumHalfwordToRead);







 
#line 109 "..\\BSP\\bsp.h"
#line 1 "..\\BSP\\bsp_can.h"









 






#line 1 "..\\BSP\\CMSIS\\core_cm3.h"
 




















 








#line 99 "..\\BSP\\CMSIS\\core_cm3.h"




#line 1229 "..\\BSP\\CMSIS\\core_cm3.h"







 
#line 18 "..\\BSP\\bsp_can.h"






#line 35 "..\\BSP\\bsp_can.h"




#line 50 "..\\BSP\\bsp_can.h"




void BSP_InitCan(CAN_TypeDef* CANx, CAN_InitTypeDef *CanInit, CAN_FilterInitTypeDef *FilterInit);








#line 110 "..\\BSP\\bsp.h"
#line 1 "..\\BSP\\bsp_sd.h"








 

 



#line 1 "..\\BSP\\CMSIS\\core_cm3.h"
 




















 








#line 99 "..\\BSP\\CMSIS\\core_cm3.h"




#line 1229 "..\\BSP\\CMSIS\\core_cm3.h"







 
#line 16 "..\\BSP\\bsp_sd.h"

























  










  
typedef enum
{


    
  SD_CMD_CRC_FAIL                    = (1),  
  SD_DATA_CRC_FAIL                   = (2),  
  SD_CMD_RSP_TIMEOUT                 = (3),  
  SD_DATA_TIMEOUT                    = (4),  
  SD_TX_UNDERRUN                     = (5),  
  SD_RX_OVERRUN                      = (6),  
  SD_START_BIT_ERR                   = (7),  
  SD_CMD_OUT_OF_RANGE                = (8),  
  SD_ADDR_MISALIGNED                 = (9),  
  SD_BLOCK_LEN_ERR                   = (10),  
  SD_ERASE_SEQ_ERR                   = (11),  
  SD_BAD_ERASE_PARAM                 = (12),  
  SD_WRITE_PROT_VIOLATION            = (13),  
  SD_LOCK_UNLOCK_FAILED              = (14),  
  SD_COM_CRC_FAILED                  = (15),  
  SD_ILLEGAL_CMD                     = (16),  
  SD_CARD_ECC_FAILED                 = (17),  
  SD_CC_ERROR                        = (18),  
  SD_GENERAL_UNKNOWN_ERROR           = (19),  
  SD_STREAM_READ_UNDERRUN            = (20),  
  SD_STREAM_WRITE_OVERRUN            = (21),  
  SD_CID_CSD_OVERWRITE               = (22),  
  SD_WP_ERASE_SKIP                   = (23),  
  SD_CARD_ECC_DISABLED               = (24),  
  SD_ERASE_RESET                     = (25),  
  SD_AKE_SEQ_ERROR                   = (26),  
  SD_INVALID_VOLTRANGE               = (27),
  SD_ADDR_OUT_OF_RANGE               = (28),
  SD_SWITCH_ERROR                    = (29),
  SD_SDIO_DISABLED                   = (30),
  SD_SDIO_FUNCTION_BUSY              = (31),
  SD_SDIO_FUNCTION_FAILED            = (32),
  SD_SDIO_UNKNOWN_FUNCTION           = (33),



  
  SD_INTERNAL_ERROR, 
  SD_NOT_CONFIGURED,
  SD_REQUEST_PENDING, 
  SD_REQUEST_NOT_APPLICABLE, 
  SD_INVALID_PARAMETER,  
  SD_UNSUPPORTED_FEATURE,  
  SD_UNSUPPORTED_HW,  
  SD_ERROR,  
  SD_OK = 0 
} SD_Error;



    
typedef enum
{
  SD_TRANSFER_OK  = 0,
  SD_TRANSFER_BUSY = 1,
  SD_TRANSFER_ERROR
} SDTransferState;



    
typedef enum
{
  SD_CARD_READY                  = ((uint32_t)0x00000001),
  SD_CARD_IDENTIFICATION         = ((uint32_t)0x00000002),
  SD_CARD_STANDBY                = ((uint32_t)0x00000003),
  SD_CARD_TRANSFER               = ((uint32_t)0x00000004),
  SD_CARD_SENDING                = ((uint32_t)0x00000005),
  SD_CARD_RECEIVING              = ((uint32_t)0x00000006),
  SD_CARD_PROGRAMMING            = ((uint32_t)0x00000007),
  SD_CARD_DISCONNECTED           = ((uint32_t)0x00000008),
  SD_CARD_ERROR                  = ((uint32_t)0x000000FF)
}SDCardState;




  
typedef struct
{
  volatile uint8_t  CSDStruct;             
  volatile uint8_t  SysSpecVersion;        
  volatile uint8_t  Reserved1;             
  volatile uint8_t  TAAC;                  
  volatile uint8_t  NSAC;                  
  volatile uint8_t  MaxBusClkFrec;         
  volatile uint16_t CardComdClasses;       
  volatile uint8_t  RdBlockLen;            
  volatile uint8_t  PartBlockRead;         
  volatile uint8_t  WrBlockMisalign;       
  volatile uint8_t  RdBlockMisalign;       
  volatile uint8_t  DSRImpl;               
  volatile uint8_t  Reserved2;             
  volatile uint32_t DeviceSize;            
  volatile uint8_t  MaxRdCurrentVDDMin;    
  volatile uint8_t  MaxRdCurrentVDDMax;    
  volatile uint8_t  MaxWrCurrentVDDMin;    
  volatile uint8_t  MaxWrCurrentVDDMax;    
  volatile uint8_t  DeviceSizeMul;         
  volatile uint8_t  EraseGrSize;           
  volatile uint8_t  EraseGrMul;            
  volatile uint8_t  WrProtectGrSize;       
  volatile uint8_t  WrProtectGrEnable;     
  volatile uint8_t  ManDeflECC;            
  volatile uint8_t  WrSpeedFact;           
  volatile uint8_t  MaxWrBlockLen;         
  volatile uint8_t  WriteBlockPaPartial;   
  volatile uint8_t  Reserved3;             
  volatile uint8_t  ContentProtectAppli;   
  volatile uint8_t  FileFormatGrouop;      
  volatile uint8_t  CopyFlag;              
  volatile uint8_t  PermWrProtect;         
  volatile uint8_t  TempWrProtect;         
  volatile uint8_t  FileFormat;            
  volatile uint8_t  ECC;                   
  volatile uint8_t  CSD_CRC;               
  volatile uint8_t  Reserved4;             
} SD_CSD;



 
typedef struct
{
  volatile uint8_t  ManufacturerID;        
  volatile uint16_t OEM_AppliID;           
  volatile uint32_t ProdName1;             
  volatile uint8_t  ProdName2;             
  volatile uint8_t  ProdRev;               
  volatile uint32_t ProdSN;                
  volatile uint8_t  Reserved1;             
  volatile uint16_t ManufactDate;          
  volatile uint8_t  CID_CRC;               
  volatile uint8_t  Reserved2;             
} SD_CID;



 
typedef struct
{
  volatile uint8_t DAT_BUS_WIDTH;
  volatile uint8_t SECURED_MODE;
  volatile uint16_t SD_CARD_TYPE;
  volatile uint32_t SIZE_OF_PROTECTED_AREA;
  volatile uint8_t SPEED_CLASS;
  volatile uint8_t PERFORMANCE_MOVE;
  volatile uint8_t AU_SIZE;
  volatile uint16_t ERASE_SIZE;
  volatile uint8_t ERASE_TIMEOUT;
  volatile uint8_t ERASE_OFFSET;
} SD_CardStatus;




 
typedef struct
{
  SD_CSD SD_csd;
  SD_CID SD_cid;
  uint32_t CardCapacity;   
  uint32_t CardBlockSize;  
  uint16_t RCA;
  uint8_t CardType;
} SD_CardInfo;


extern SD_CardInfo SDCardInfo;



 
  


  



 
#line 274 "..\\BSP\\bsp_sd.h"




#line 285 "..\\BSP\\bsp_sd.h"




 
#line 298 "..\\BSP\\bsp_sd.h"




 
#line 314 "..\\BSP\\bsp_sd.h"
  
   

 



 





 
#line 336 "..\\BSP\\bsp_sd.h"




extern volatile uint32_t StopCondition;
extern volatile SD_Error TransferError;
extern volatile uint32_t TransferEnd;

extern SD_Error CmdResp1Error(uint8_t cmd);



  
  


  


  



  
void SD_DeInit(void);
SD_Error SD_Init(void);
SDTransferState SD_GetStatus(void);
SDCardState SD_GetState(void);
uint8_t SD_Detect(void);
SD_Error SD_PowerON(void);
SD_Error SD_PowerOFF(void);
SD_Error SD_InitializeCards(void);
SD_Error SD_GetCardInfo(SD_CardInfo *cardinfo);
SD_Error SD_GetCardStatus(SD_CardStatus *cardstatus);
SD_Error SD_EnableWideBusOperation(uint32_t WideMode);
SD_Error SD_SelectDeselect(uint32_t addr);
SD_Error SD_ReadBlock(uint8_t *readbuff, uint32_t ReadAddr, uint16_t BlockSize);
SD_Error SD_ReadMultiBlocks(uint8_t *readbuff, uint32_t ReadAddr, uint16_t BlockSize, uint32_t NumberOfBlocks);
SD_Error SD_WriteBlock(uint8_t *writebuff, uint32_t WriteAddr, uint16_t BlockSize);
SD_Error SD_WriteMultiBlocks(uint8_t *writebuff, uint32_t WriteAddr, uint16_t BlockSize, uint32_t NumberOfBlocks);
SDTransferState SD_GetTransferState(void);
SD_Error SD_StopTransfer(void);
SD_Error SD_Erase(uint32_t startaddr, uint32_t endaddr);
SD_Error SD_SendStatus(uint32_t *pcardstatus);
SD_Error SD_SendSDStatus(uint32_t *psdstatus);
SD_Error SD_ProcessIRQSrc(void);
SD_Error SD_WaitReadOperation(void);
SD_Error SD_WaitWriteOperation(void);








 



 



 



  



  

 
#line 111 "..\\BSP\\bsp.h"
#line 1 "..\\BSP\\bsp_sdio.h"








 





#line 1 "..\\BSP\\CMSIS\\core_cm3.h"
 




















 








#line 99 "..\\BSP\\CMSIS\\core_cm3.h"




#line 1229 "..\\BSP\\CMSIS\\core_cm3.h"







 
#line 16 "..\\BSP\\bsp_sdio.h"



 



   



 



 




 
#line 44 "..\\BSP\\bsp_sdio.h"





void BSP_InitSD(void);
void BSP_EnableXferDMA(uint32_t *Buffer, uint32_t BufferSize, uint8_t Dir);


void SD_LowLevel_DeInit(void);
void SD_LowLevel_Init(void); 
void SD_LowLevel_DMA_TxConfig(uint32_t *BufferSRC, uint32_t BufferSize);
void SD_LowLevel_DMA_RxConfig(uint32_t *BufferDST, uint32_t BufferSize);
uint32_t SD_DMAEndOfTransferStatus(void);

void BSP_EnableXferDMA(uint32_t *Buffer, uint32_t BufferSize, uint8_t Dir);







#line 112 "..\\BSP\\bsp.h"







 






 






 






 
typedef uint32_t (*BSPCallback )(unsigned char Arg, void *ptr);


typedef struct{
	uint32_t	Error;

	
	uint16_t 	*ADCBuf[3];

	
	uint16_t	*DACBuf[2];
	
   	
	uint8_t  	*UsartRxBuf[6];
	uint8_t  	*UsartTxBuf[6];
	uint16_t 	UsartRxIndex[6];
	uint16_t	UsartTxIndex[6];
	uint16_t	UsartRxBufMask[6];
	uint16_t	UsartTxBufMask[6];
	uint8_t		UsartRxStatus[6];

   	
	uint8_t		*SPIRxBuf[3];
	uint8_t		*SPITxBuf[3];
	uint16_t	SPIRxIndex[3];
	uint16_t	SPITxIndex[3];
	uint16_t	SPIRxBufMask[3];
	uint16_t	SPITxBufMask[3];
	uint8_t		SPIRxStatus[3];

	
	uint8_t		*I2CRxBuf[3];
	uint8_t		*I2CTxBuf[3];
	uint16_t	I2CRxIndex[3];
	uint16_t	I2CTxIndex[3];
	uint16_t	I2CRxBufMask[3];
	uint16_t	I2CTxBufMask[3];
	uint8_t		I2CRxStatus[3];
	
	
	CAN_InitTypeDef *CanInit[2];
	CAN_FilterInitTypeDef *FilterInit[2];
	CanRxMsg 	*CanRxMsgPtr[2];
	CanTxMsg	*CanTxMsgPtr[2];
	uint16_t	CanRxMsgIndex[2];
	uint16_t	CanTxMsgIndex[2];
	uint16_t	CanRxMsgMask[2];
	uint16_t	CanTxMsgMask[2];
	
	
	
	SD_Error	SD_Err;
	uint8_t 	SD_Protected;
	uint8_t		SD_NoMedia;
	

	BSPCallback	Tm3CallBack;
	BSPCallback	DACCallBack;
	BSPCallback RTCCalBack;
	BSPCallback SDCallBack;
	BSPCallback CANCallBack;
	
	BSPCallback EXTI9_5_CallBack;

}BSP_INFO, *pBSP_INFO;







 
extern BSP_INFO BSP_Info;





 












 

#line 246 "..\\BSP\\bsp.h"









#line 262 "..\\BSP\\bsp.h"

#line 288 "..\\BSP\\bsp.h"

#line 296 "..\\BSP\\bsp.h"

#line 303 "..\\BSP\\bsp.h"













#line 323 "..\\BSP\\bsp.h"










#line 343 "..\\BSP\\bsp.h"






 

void        BSP_Init                (void);
void        BSP_CPU_TickInit        (void);
CPU_INT32U  BSP_CPU_ClkFreq         (void);

void        BSP_IntEnAll            (void);
void        BSP_IntDisAll           (void);


void        BSP_IntEn      (CPU_DATA       int_id);
void        BSP_IntInit    (void);
void        BSP_IntDis     (CPU_DATA       int_id);
void        BSP_IntClr     (CPU_DATA       int_id);
void        BSP_IntVectSet (CPU_DATA       int_id,
                            CPU_FNCT_VOID  isr);

void        BSP_LED_On     (CPU_INT08U     led);
void        BSP_LED_Off    (CPU_INT08U     led);
void        BSP_LED_Toggle (CPU_INT08U     led);

CPU_INT32U  BSP_RNG_Read   (void);

void        BSP_IntPrioSet (CPU_DATA       int_id,
                            CPU_INT08U     prio);

void        BSP_PSRAM_Init (void);
void        BSP_SRAM_Init  (void);

void		BSP_InitInfo(void);

void		Delay(uint32_t dLyTm);






 

void         BSP_IntHandlerWWDG               (void);
void         BSP_IntHandlerPVD                (void);
void         BSP_IntHandlerTAMPER             (void);
void         BSP_IntHandlerRTC                (void);
void         BSP_IntHandlerFLASH              (void);
void         BSP_IntHandlerRCC                (void);
void         BSP_IntHandlerEXTI0              (void);
void         BSP_IntHandlerEXTI1              (void);
void         BSP_IntHandlerEXTI2              (void);
void         BSP_IntHandlerEXTI3              (void);
void         BSP_IntHandlerEXTI4              (void);








 
void         BSP_IntHandlerDMA1_STREAM0		  (void);
void         BSP_IntHandlerDMA1_STREAM1		  (void);
void         BSP_IntHandlerDMA1_STREAM2		  (void);
void         BSP_IntHandlerDMA1_STREAM3		  (void);
void         BSP_IntHandlerDMA1_STREAM4		  (void);
void         BSP_IntHandlerDMA1_STREAM5		  (void);
void         BSP_IntHandlerDMA1_STREAM6		  (void);


void         BSP_IntHandlerADC1_2             (void);
void         BSP_IntHandlerCAN1_TX            (void);
void         BSP_IntHandlerCAN1_RX0           (void);
void         BSP_IntHandlerCAN1_RX1           (void);
void         BSP_IntHandlerCAN1_SCE           (void);
void         BSP_IntHandlerEXTI9_5            (void);
void         BSP_IntHandlerTIM1_BRK           (void);
void         BSP_IntHandlerTIM1_UP            (void);
void         BSP_IntHandlerTIM1_TRG_COM       (void);
void         BSP_IntHandlerTIM1_CC            (void);
void         BSP_IntHandlerTIM2               (void);
void         BSP_IntHandlerTIM3               (void);
void         BSP_IntHandlerTIM4               (void);
void         BSP_IntHandlerI2C1_EV            (void);
void         BSP_IntHandlerI2C1_ER            (void);
void         BSP_IntHandlerI2C2_EV            (void);
void         BSP_IntHandlerI2C2_ER            (void);
void         BSP_IntHandlerSPI1               (void);
void         BSP_IntHandlerSPI2               (void);
void         BSP_IntHandlerUSART1             (void);
void         BSP_IntHandlerUSART2             (void);
void         BSP_IntHandlerUSART3             (void);
void         BSP_IntHandlerEXTI15_10          (void);
void         BSP_IntHandlerRTCAlarm           (void);
void         BSP_IntHandlerUSBWakeUp          (void);
void         BSP_IntHandlerTIM8_BRK_TIM12     (void);
void         BSP_IntHandlerTIM8_UP_TIM13      (void);
void         BSP_IntHandlerTIM8_TRG_COM_TIM14 (void);
void         BSP_IntHandlerTIM8_CC            (void);
void         BSP_IntHandlerDMA1_STREAM7       (void);
void         BSP_IntHandlerFSMC               (void);
void         BSP_IntHandlerSDIO               (void);
void         BSP_IntHandlerTIM5               (void);
void         BSP_IntHandlerSPI3               (void);
void         BSP_IntHandlerUSART4             (void);
void         BSP_IntHandlerUSART5             (void);
void         BSP_IntHandlerTIM6               (void);
void         BSP_IntHandlerTIM7               (void);






 
void         BSP_IntHandlerDMA2_STREAM0       (void);
void         BSP_IntHandlerDMA2_STREAM1       (void);
void         BSP_IntHandlerDMA2_STREAM2       (void);
void         BSP_IntHandlerDMA2_STREAM3       (void);
void         BSP_IntHandlerDMA2_STREAM4       (void);


void         BSP_IntHandlerETH                (void);
void         BSP_IntHandlerETHWakeup          (void);
void         BSP_IntHandlerCAN2_TX            (void);
void         BSP_IntHandlerCAN2_RX0           (void);
void         BSP_IntHandlerCAN2_RX1           (void);
void         BSP_IntHandlerCAN2_SCE           (void);
void         BSP_IntHandlerOTG                (void);




 
void         BSP_IntHandlerDMA2_STREAM5       (void);
void         BSP_IntHandlerDMA2_STREAM6       (void);
void         BSP_IntHandlerDMA2_STREAM7       (void);

void         BSP_IntHandlerUSART6             (void);
void         BSP_IntHandlerI2C3_EV            (void);
void         BSP_IntHandlerI2C3_ER            (void);
void         BSP_IntHandlerOTG_HS_EP1_OUT     (void);
void         BSP_IntHandlerOTG_HS_EP1_IN      (void);
void         BSP_IntHandlerOTG_HS_WKUP        (void);
void         BSP_IntHandlerOTG_HS             (void);
void         BSP_IntHandlerDCMI               (void);
void         BSP_IntHandlerCRYP               (void);
void         BSP_IntHandlerHASH_RNG           (void);




#line 94 "..\\BSP\\bsp.c"
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



 
#line 95 "..\\BSP\\bsp.c"






 







 
const uint32_t USART_BaudRate[] = {	
									115200L,
									115200L,
									115200L,
									115200L,
									115200L,
									115200L
								};





 






 






 
BSP_INFO BSP_Info;








 










 










 
void BSP_InitUsart(COM_TypeDef COM, uint8_t MultiMode, uint8_t Addr);



















 

void BSP_InitInfo(void)
{
	memset(&BSP_Info, 0, sizeof(BSP_INFO));
}

























 

void  BSP_Init (void)
{

    




 	



	
	
	BSP_IntInit();

	
  	BSP_GPIO_Init();

	 
	BSP_LED_Init();


	
	if (BSP_Info.ADCBuf[0] != 0)
		BSP_ADC_Init(BSP_Info.ADCBuf[0]);
	else
		BSP_Info.Error |= 0x00000001; 

	
#line 260 "..\\BSP\\bsp.c"


	Sem_UsartTxRdy[COM1] = OSSemCreate(1);



		BSP_InitUsart(COM1, 0, 0);



#line 278 "..\\BSP\\bsp.c"

#line 287 "..\\BSP\\bsp.c"

#line 296 "..\\BSP\\bsp.c"
	
#line 305 "..\\BSP\\bsp.c"


	Sem_UsartTxRdy[COM6] = OSSemCreate(1);



		BSP_InitUsart(COM6, 0, 0);


	

	BSP_InitI2C1();




























	
	BSP_Tm3_Init();	

}

















 

CPU_INT32U  BSP_RNG_Read (void)
{
    CPU_INT32U  rng_val;


    RCC_AHB2PeriphClockCmd(((uint32_t)0x00000040), ENABLE);          

    ((RNG_TypeDef *) ((((uint32_t)0x40000000) + 0x10000000) + 0x60800))->CR |= ((uint32_t)0x00000008);                                    
    ((RNG_TypeDef *) ((((uint32_t)0x40000000) + 0x10000000) + 0x60800))->CR |= ((uint32_t)0x00000004);                                 

    while ((((RNG_TypeDef *) ((((uint32_t)0x40000000) + 0x10000000) + 0x60800))->SR & ((uint32_t)0x00000001)) == 0) {
            ;
    }
    rng_val = (CPU_INT32U)((RNG_TypeDef *) ((((uint32_t)0x40000000) + 0x10000000) + 0x60800))->DR;                           

    ((RNG_TypeDef *) ((((uint32_t)0x40000000) + 0x10000000) + 0x60800))->CR &= ~((uint32_t)0x00000008);                                   
    ((RNG_TypeDef *) ((((uint32_t)0x40000000) + 0x10000000) + 0x60800))->CR &= ~((uint32_t)0x00000004);                                
    RCC_AHB2PeriphClockCmd(((uint32_t)0x00000040), DISABLE);         

    return (rng_val);                                            
}
















 

CPU_INT32U  BSP_CPU_ClkFreq (void)
{
    RCC_ClocksTypeDef  rcc_clocks;


    RCC_GetClocksFreq(&rcc_clocks);
    return ((CPU_INT32U)rcc_clocks.HCLK_Frequency);
}
















 

void  BSP_CPU_TickInit  (void)
{
    CPU_INT32U  cpu_clk_freq;
    CPU_INT32U  cnts;


    cpu_clk_freq = BSP_CPU_ClkFreq();                            



    cnts         = (cpu_clk_freq / 1000u);

    OS_CPU_SysTickInit(cnts);                                    
}



void Delay(uint32_t dlyTm)
{
	uint32_t i;

	for (i = 0; i < dlyTm; i++){
		__nop();
	}
}





void BSP_InitUsart(COM_TypeDef COM, uint8_t MultiMode, uint8_t Addr)
{
	USART_InitTypeDef USART_InitStructure;
		
	USART_InitStructure.USART_BaudRate = USART_BaudRate[COM];
	if (MultiMode)
		USART_InitStructure.USART_WordLength = ((uint16_t)0x1000);
	else
		USART_InitStructure.USART_WordLength = ((uint16_t)0x0000);
	USART_InitStructure.USART_StopBits = ((uint16_t)0x0000);
	USART_InitStructure.USART_Parity = ((uint16_t)0x0000);
	USART_InitStructure.USART_HardwareFlowControl = ((uint16_t)0x0000);
	USART_InitStructure.USART_Mode = ((uint16_t)0x0004) | ((uint16_t)0x0008);
	
	USART_DeInit(COM_USART[COM]);
	
  	BSP_USART_Init(COM, &USART_InitStructure, MultiMode, Addr);
}





 


















































 


void  CPU_TS_TmrInit (void)
{
    CPU_INT32U  cpu_clk_freq_hz;


    *(CPU_REG32 *)0xE000EDFC         |= (CPU_INT32U)(1 << 24);                 
    *(CPU_REG32 *)0xE0001004      = (CPU_INT32U)0u;
    *(CPU_REG32 *)0xE0001000         |= (CPU_INT32U)(1 << 0);

    cpu_clk_freq_hz = BSP_CPU_ClkFreq();
    CPU_TS_TmrFreqSet(cpu_clk_freq_hz);
}



 
















































































 


CPU_TS_TMR  CPU_TS_TmrRd (void)
{
    return ((CPU_TS_TMR)*(CPU_REG32 *)0xE0001004);
}


