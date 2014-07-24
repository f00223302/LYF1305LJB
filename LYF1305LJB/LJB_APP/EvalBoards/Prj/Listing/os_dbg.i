#line 1 "..\\..\\uCOS-II\\Ports\\ARM-Cortex-M3\\os_dbg.c"






















 

#line 1 "..\\..\\uCOS-II\\Source\\ucos_ii.h"




















 












 







 

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





#line 26 "..\\..\\uCOS-II\\Ports\\ARM-Cortex-M3\\os_dbg.c"







 

  INT16U  const  OSDebugEn           = 1u;                



  INT32U  const  OSEndiannessTest    = 0x12345678L;                

  INT16U  const  OSEventEn           = (((1u > 0u) && (4u > 0u)) || (1u > 0u) || (1u > 0u) || (1u > 0u));
  INT16U  const  OSEventMax          = 80u;              
  INT16U  const  OSEventNameEn       = 1u;

  INT16U  const  OSEventSize         = sizeof(OS_EVENT);           
  INT16U  const  OSEventTblSize      = sizeof(OSEventTbl);         




  INT16U  const  OSEventMultiEn      = 1u;


  INT16U  const  OSFlagEn            = 1u;

  INT16U  const  OSFlagGrpSize       = sizeof(OS_FLAG_GRP);        
  INT16U  const  OSFlagNodeSize      = sizeof(OS_FLAG_NODE);       
  INT16U  const  OSFlagWidth         = sizeof(OS_FLAGS);           





  INT16U  const  OSFlagMax           = 5u;
  INT16U  const  OSFlagNameEn        = 1u;

  INT16U  const  OSLowestPrio        = 63u;

  INT16U  const  OSMboxEn            = 1u;

  INT16U  const  OSMemEn             = 1u;
  INT16U  const  OSMemMax            = 5u;            
  INT16U  const  OSMemNameEn         = 1u;

  INT16U  const  OSMemSize           = sizeof(OS_MEM);             
  INT16U  const  OSMemTblSize        = sizeof(OSMemTbl);




  INT16U  const  OSMutexEn           = 1u;

  INT16U  const  OSPtrSize           = sizeof(void *);             

  INT16U  const  OSQEn               = 1u;
  INT16U  const  OSQMax              = 4u;                  

  INT16U  const  OSQSize             = sizeof(OS_Q);               




  INT16U  const  OSRdyTblSize        = ((63u) / 8u + 1u);            

  INT16U  const  OSSemEn             = 1u;

  INT16U  const  OSStkWidth          = sizeof(OS_STK);             

  INT16U  const  OSTaskCreateEn      = 1u;
  INT16U  const  OSTaskCreateExtEn   = 1u;
  INT16U  const  OSTaskDelEn         = 1u;
  INT16U  const  OSTaskIdleStkSize   = 128u;
  INT16U  const  OSTaskProfileEn     = 1u;
  INT16U  const  OSTaskMax           = 20u + 2u;  
  INT16U  const  OSTaskNameEn        = 1u;
  INT16U  const  OSTaskStatEn        = 1u;
  INT16U  const  OSTaskStatStkSize   = 128u;
  INT16U  const  OSTaskStatStkChkEn  = 1u;
  INT16U  const  OSTaskSwHookEn      = 1u;

  INT16U  const  OSTCBPrioTblMax     = 63u + 1u;        
  INT16U  const  OSTCBSize           = sizeof(OS_TCB);             
  INT16U  const  OSTicksPerSec       = 1000u;
  INT16U  const  OSTimeTickHookEn    = 1u;
  INT16U  const  OSVersionNbr        = 29207u;

  INT16U  const  OSTmrEn             = 1u;
  INT16U  const  OSTmrCfgMax         = 16u;
  INT16U  const  OSTmrCfgNameEn      = 1u;
  INT16U  const  OSTmrCfgWheelSize   = 8u;
  INT16U  const  OSTmrCfgTicksPerSec = 10u;


  INT16U  const  OSTmrSize           = sizeof(OS_TMR);
  INT16U  const  OSTmrTblSize        = sizeof(OSTmrTbl);
  INT16U  const  OSTmrWheelSize      = sizeof(OS_TMR_WHEEL);
  INT16U  const  OSTmrWheelTblSize   = sizeof(OSTmrWheelTbl);
#line 134 "..\\..\\uCOS-II\\Ports\\ARM-Cortex-M3\\os_dbg.c"



 





 


  INT16U  const  OSDataSize = sizeof(OSCtxSwCtr)

                                           + sizeof(OSEventFreeList)
                                           + sizeof(OSEventTbl)


                                           + sizeof(OSFlagTbl)
                                           + sizeof(OSFlagFreeList)


                                           + sizeof(OSCPUUsage)
                                           + sizeof(OSIdleCtrMax)
                                           + sizeof(OSIdleCtrRun)
                                           + sizeof(OSStatRdy)
                                           + sizeof(OSTaskStatStk)


                                           + sizeof(OSTickStepState)


                                           + sizeof(OSMemFreeList)
                                           + sizeof(OSMemTbl)


                                           + sizeof(OSQFreeList)
                                           + sizeof(OSQTbl)


                                           + sizeof(OSTime)


                                           + sizeof(OSTmrFree)
                                           + sizeof(OSTmrUsed)
                                           + sizeof(OSTmrTime)
                                           + sizeof(OSTmrSem)
                                           + sizeof(OSTmrSemSignal)
                                           + sizeof(OSTmrFreeList)
                                           + sizeof(OSTmrTbl)
                                           + sizeof(OSTmrWheelTbl)

                                           + sizeof(OSIntNesting)
                                           + sizeof(OSLockNesting)
                                           + sizeof(OSPrioCur)
                                           + sizeof(OSPrioHighRdy)
                                           + sizeof(OSRdyGrp)
                                           + sizeof(OSRdyTbl)
                                           + sizeof(OSRunning)
                                           + sizeof(OSTaskCtr)
                                           + sizeof(OSIdleCtr)
                                           + sizeof(OSTaskIdleStk)
                                           + sizeof(OSTCBCur)
                                           + sizeof(OSTCBFreeList)
                                           + sizeof(OSTCBHighRdy)
                                           + sizeof(OSTCBList)
                                           + sizeof(OSTCBPrioTbl)
                                           + sizeof(OSTCBTbl);



 
















 


void  OSDebugInit (void)
{
    void  *ptemp;


    ptemp = (void *)&OSDebugEn;

    ptemp = (void *)&OSEndiannessTest;

    ptemp = (void *)&OSEventMax;
    ptemp = (void *)&OSEventNameEn;
    ptemp = (void *)&OSEventEn;
    ptemp = (void *)&OSEventSize;
    ptemp = (void *)&OSEventTblSize;
    ptemp = (void *)&OSEventMultiEn;

    ptemp = (void *)&OSFlagEn;
    ptemp = (void *)&OSFlagGrpSize;
    ptemp = (void *)&OSFlagNodeSize;
    ptemp = (void *)&OSFlagWidth;
    ptemp = (void *)&OSFlagMax;
    ptemp = (void *)&OSFlagNameEn;

    ptemp = (void *)&OSLowestPrio;

    ptemp = (void *)&OSMboxEn;

    ptemp = (void *)&OSMemEn;
    ptemp = (void *)&OSMemMax;
    ptemp = (void *)&OSMemNameEn;
    ptemp = (void *)&OSMemSize;
    ptemp = (void *)&OSMemTblSize;

    ptemp = (void *)&OSMutexEn;

    ptemp = (void *)&OSPtrSize;

    ptemp = (void *)&OSQEn;
    ptemp = (void *)&OSQMax;
    ptemp = (void *)&OSQSize;

    ptemp = (void *)&OSRdyTblSize;

    ptemp = (void *)&OSSemEn;

    ptemp = (void *)&OSStkWidth;

    ptemp = (void *)&OSTaskCreateEn;
    ptemp = (void *)&OSTaskCreateExtEn;
    ptemp = (void *)&OSTaskDelEn;
    ptemp = (void *)&OSTaskIdleStkSize;
    ptemp = (void *)&OSTaskProfileEn;
    ptemp = (void *)&OSTaskMax;
    ptemp = (void *)&OSTaskNameEn;
    ptemp = (void *)&OSTaskStatEn;
    ptemp = (void *)&OSTaskStatStkSize;
    ptemp = (void *)&OSTaskStatStkChkEn;
    ptemp = (void *)&OSTaskSwHookEn;

    ptemp = (void *)&OSTCBPrioTblMax;
    ptemp = (void *)&OSTCBSize;

    ptemp = (void *)&OSTicksPerSec;
    ptemp = (void *)&OSTimeTickHookEn;


    ptemp = (void *)&OSTmrTbl[0];
    ptemp = (void *)&OSTmrWheelTbl[0];

    ptemp = (void *)&OSTmrEn;
    ptemp = (void *)&OSTmrCfgMax;
    ptemp = (void *)&OSTmrCfgNameEn;
    ptemp = (void *)&OSTmrCfgWheelSize;
    ptemp = (void *)&OSTmrCfgTicksPerSec;
    ptemp = (void *)&OSTmrSize;
    ptemp = (void *)&OSTmrTblSize;

    ptemp = (void *)&OSTmrWheelSize;
    ptemp = (void *)&OSTmrWheelTblSize;


    ptemp = (void *)&OSVersionNbr;

    ptemp = (void *)&OSDataSize;

    ptemp = ptemp;                              
}
