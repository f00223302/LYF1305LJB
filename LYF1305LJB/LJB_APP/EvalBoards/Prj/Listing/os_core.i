#line 1 "..\\..\\uCOS-II\\Source\\os_core.c"





















 



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


 




 

  INT32U            OSCtxSwCtr;                


  OS_EVENT         *OSEventFreeList;           
  OS_EVENT          OSEventTbl[80u]; 



  OS_FLAG_GRP       OSFlagTbl[5u];   
  OS_FLAG_GRP      *OSFlagFreeList;            



  INT8U             OSCPUUsage;                
  INT32U            OSIdleCtrMax;              
  INT32U            OSIdleCtrRun;              
  BOOLEAN           OSStatRdy;                 
  OS_STK            OSTaskStatStk[128u];       


  INT8U             OSIntNesting;              

  INT8U             OSLockNesting;             

  INT8U             OSPrioCur;                 
  INT8U             OSPrioHighRdy;             

  OS_PRIO           OSRdyGrp;                         
  OS_PRIO           OSRdyTbl[((63u) / 8u + 1u)];        

  BOOLEAN           OSRunning;                        

  INT8U             OSTaskCtr;                        

  volatile  INT32U  OSIdleCtr;                                  





  OS_STK            OSTaskIdleStk[128u];       


  OS_TCB           *OSTCBCur;                         
  OS_TCB           *OSTCBFreeList;                    
  OS_TCB           *OSTCBHighRdy;                     
  OS_TCB           *OSTCBList;                        
  OS_TCB           *OSTCBPrioTbl[63u + 1u];     
  OS_TCB            OSTCBTbl[20u + 2u];    


  INT8U             OSTickStepState;           



  OS_MEM           *OSMemFreeList;             
  OS_MEM            OSMemTbl[5u]; 



  OS_Q             *OSQFreeList;               
  OS_Q              OSQTbl[4u];         



  INT8U             OSTaskRegNextAvailID;      



  volatile  INT32U  OSTime;                    



  INT16U            OSTmrFree;                 
  INT16U            OSTmrUsed;                 
  INT32U            OSTmrTime;                 

  OS_EVENT         *OSTmrSem;                  
  OS_EVENT         *OSTmrSemSignal;            

  OS_TMR            OSTmrTbl[16u];  
  OS_TMR           *OSTmrFreeList;             
  OS_STK            OSTmrTaskStk[128u];

  OS_TMR_WHEEL      OSTmrWheelTbl[8u];


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





#line 29 "..\\..\\uCOS-II\\Source\\os_core.c"









 

INT8U  const  OSUnMapTbl[256] = {
    0u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    4u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    5u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    4u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    6u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    4u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    5u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    4u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    7u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    4u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    5u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    4u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    6u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    4u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    5u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u,  
    4u, 0u, 1u, 0u, 2u, 0u, 1u, 0u, 3u, 0u, 1u, 0u, 2u, 0u, 1u, 0u   
};

 




 

static  void  OS_InitEventList(void);

static  void  OS_InitMisc(void);

static  void  OS_InitRdyList(void);

static  void  OS_InitTaskIdle(void);


static  void  OS_InitTaskStat(void);


static  void  OS_InitTCBList(void);

static  void  OS_SchedNew(void);

 
























 


INT8U  OSEventNameGet (OS_EVENT   *pevent,
                       INT8U     **pname,
                       INT8U      *perr)
{
    INT8U      len;

    OS_CPU_SR  cpu_sr = 0u;




#line 127 "..\\..\\uCOS-II\\Source\\os_core.c"

#line 138 "..\\..\\uCOS-II\\Source\\os_core.c"
    if (OSIntNesting > 0u) {                      
        *perr  = 17u;
        return (0u);
    }
    switch (pevent->OSEventType) {
        case 3u:
        case 4u:
        case 1u:
        case 2u:
             break;

        default:
             *perr = 1u;
             return (0u);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    *pname = pevent->OSEventName;
    len    = OS_StrLen(*pname);
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr  = 0u;
    return (len);
}


 
























 


void  OSEventNameSet (OS_EVENT  *pevent,
                      INT8U     *pname,
                      INT8U     *perr)
{

    OS_CPU_SR  cpu_sr = 0u;




#line 206 "..\\..\\uCOS-II\\Source\\os_core.c"

#line 217 "..\\..\\uCOS-II\\Source\\os_core.c"
    if (OSIntNesting > 0u) {                      
        *perr = 18u;
        return;
    }
    switch (pevent->OSEventType) {
        case 3u:
        case 4u:
        case 1u:
        case 2u:
             break;

        default:
             *perr = 1u;
             return;
    }
    {cpu_sr = OS_CPU_SR_Save();};
    pevent->OSEventName = pname;
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;
}


 





































































 
 

INT16U  OSEventPendMulti (OS_EVENT  **pevents_pend,
                          OS_EVENT  **pevents_rdy,
                          void      **pmsgs_rdy,
                          INT32U      timeout,
                          INT8U      *perr)
{
    OS_EVENT  **pevents;
    OS_EVENT   *pevent;

    OS_Q       *pq;

    BOOLEAN     events_rdy;
    INT16U      events_rdy_nbr;
    INT8U       events_stat;

    OS_CPU_SR   cpu_sr = 0u;




#line 338 "..\\..\\uCOS-II\\Source\\os_core.c"

#line 357 "..\\..\\uCOS-II\\Source\\os_core.c"

   *pevents_rdy = (OS_EVENT *)0;                         

    pevents     =  pevents_pend;
    pevent      = *pevents;
    while  (pevent != (OS_EVENT *)0) {
        switch (pevent->OSEventType) {                   

            case 3u:
                 break;


            case 1u:
                 break;


            case 2u:
                 break;


            case 4u:
            case 5u:
            default:
                *perr = 1u;
                 return (0u);
        }
        pevents++;
        pevent = *pevents;
    }

    if (OSIntNesting  > 0u) {                            
       *perr =  2u;                         
        return (0u);
    }
    if (OSLockNesting > 0u) {                            
       *perr =  13u;                      
        return (0u);
    }

 
    events_rdy     =  0u;
    events_rdy_nbr =  0u;
    events_stat    =  0x00u;
    pevents        =  pevents_pend;
    pevent         = *pevents;
    {cpu_sr = OS_CPU_SR_Save();};
    while (pevent != (OS_EVENT *)0) {                    
        switch (pevent->OSEventType) {

            case 3u:
                 if (pevent->OSEventCnt > 0u) {          
                     pevent->OSEventCnt--;               
                    *pevents_rdy++ =  pevent;            
                      events_rdy   =  1u;
                    *pmsgs_rdy++   = (void *)0;          
                      events_rdy_nbr++;

                 } else {
                      events_stat |=  0x01u;       
                 }
                 break;



            case 1u:
                 if (pevent->OSEventPtr != (void *)0) {  
                                                         
                    *pmsgs_rdy++         = (void *)pevent->OSEventPtr;
                     pevent->OSEventPtr  = (void *)0;
                    *pevents_rdy++       =  pevent;      
                      events_rdy         =  1u;
                      events_rdy_nbr++;

                 } else {
                      events_stat |= 0x02u;       
                 }
                 break;



            case 2u:
                 pq = (OS_Q *)pevent->OSEventPtr;
                 if (pq->OSQEntries > 0u) {              
                                                         
                    *pmsgs_rdy++ = (void *)*pq->OSQOut++;
                     if (pq->OSQOut == pq->OSQEnd) {     
                         pq->OSQOut  = pq->OSQStart;     
                     }
                     pq->OSQEntries--;                   
                    *pevents_rdy++ = pevent;             
                      events_rdy   = 1u;
                      events_rdy_nbr++;

                 } else {
                      events_stat |= 0x04u;          
                 }
                 break;


            case 4u:
            case 5u:
            default:
                 {OS_CPU_SR_Restore(cpu_sr);};
                *pevents_rdy = (OS_EVENT *)0;            
                *perr        =  1u;
                 return (events_rdy_nbr);
        }
        pevents++;
        pevent = *pevents;
    }

    if ( events_rdy == 1u) {                        
       *pevents_rdy = (OS_EVENT *)0;                     
        {OS_CPU_SR_Restore(cpu_sr);};
       *perr        =  0u;
        return (events_rdy_nbr);
    }
 
                                                         
    OSTCBCur->OSTCBStat     |= events_stat  |            
                               0x80u;            
    OSTCBCur->OSTCBStatPend  = 0u;
    OSTCBCur->OSTCBDly       = timeout;                  
    OS_EventTaskWaitMulti(pevents_pend);                 

    {OS_CPU_SR_Restore(cpu_sr);};
    OS_Sched();                                          
    {cpu_sr = OS_CPU_SR_Save();};

    switch (OSTCBCur->OSTCBStatPend) {                   
        case 0u:
        case 2u:
             pevent = OSTCBCur->OSTCBEventPtr;
             if (pevent != (OS_EVENT *)0) {              
                *pevents_rdy++   =  pevent;              
                *pevents_rdy     = (OS_EVENT *)0;        
                  events_rdy_nbr =  1;

             } else {                                    
                 OSTCBCur->OSTCBStatPend = 1u;
                 OS_EventTaskRemoveMulti(OSTCBCur, pevents_pend);
             }
             break;

        case 1u:                            
        default:                                         
             OS_EventTaskRemoveMulti(OSTCBCur, pevents_pend);
             break;
    }

    switch (OSTCBCur->OSTCBStatPend) {
        case 0u:
             switch (pevent->OSEventType) {              

                 case 3u:
                     *pmsgs_rdy++ = (void *)0;           
                      break;




                 case 1u:
                 case 2u:
                     *pmsgs_rdy++ = (void *)OSTCBCur->OSTCBMsg;      
                      break;


                 case 4u:
                 case 5u:
                 default:
                      {OS_CPU_SR_Restore(cpu_sr);};
                     *pevents_rdy = (OS_EVENT *)0;       
                     *perr        =  1u;
                      return (events_rdy_nbr);
             }
            *perr = 0u;
             break;

        case 2u:
            *pmsgs_rdy++ = (void *)0;                    
            *perr        =  14u;           
             break;

        case 1u:
        default:
            *pmsgs_rdy++ = (void *)0;                    
            *perr        =  10u;              
             break;
    }

    OSTCBCur->OSTCBStat          =  0x00u;         
    OSTCBCur->OSTCBStatPend      =  0u;     
    OSTCBCur->OSTCBEventPtr      = (OS_EVENT  *)0;       
    OSTCBCur->OSTCBEventMultiPtr = (OS_EVENT **)0;


    OSTCBCur->OSTCBMsg           = (void      *)0;       

    {OS_CPU_SR_Restore(cpu_sr);};

    return (events_rdy_nbr);
}


 











 

void  OSInit (void)
{
    OSInitHookBegin();                                            

    OS_InitMisc();                                                

    OS_InitRdyList();                                             

    OS_InitTCBList();                                             

    OS_InitEventList();                                           


    OS_FlagInit();                                                



    OS_MemInit();                                                 



    OS_QInit();                                                   


    OS_InitTaskIdle();                                            

    OS_InitTaskStat();                                            



    OSTmr_Init();                                                 


    OSInitHookEnd();                                              


    OSDebugInit();

}
 























 

void  OSIntEnter (void)
{
    if (OSRunning == 1u) {
        if (OSIntNesting < 255u) {
            OSIntNesting++;                       
        }
    }
}
 

















 

void  OSIntExit (void)
{

    OS_CPU_SR  cpu_sr = 0u;




    if (OSRunning == 1u) {
        {cpu_sr = OS_CPU_SR_Save();};
        if (OSIntNesting > 0u) {                            
            OSIntNesting--;
        }
        if (OSIntNesting == 0u) {                           
            if (OSLockNesting == 0u) {                      
                OS_SchedNew();
                OSTCBHighRdy = OSTCBPrioTbl[OSPrioHighRdy];
                if (OSPrioHighRdy != OSPrioCur) {           

                    OSTCBHighRdy->OSTCBCtxSwCtr++;          

                    OSCtxSwCtr++;                           
                    OSIntCtxSw();                           
                }
            }
        }
        {OS_CPU_SR_Restore(cpu_sr);};
    }
}
 















 

#line 722 "..\\..\\uCOS-II\\Source\\os_core.c"

 














 


void  OSSchedLock (void)
{

    OS_CPU_SR  cpu_sr = 0u;




    if (OSRunning == 1u) {                   
        {cpu_sr = OS_CPU_SR_Save();};
        if (OSIntNesting == 0u) {                 
            if (OSLockNesting < 255u) {           
                OSLockNesting++;                  
            }
        }
        {OS_CPU_SR_Restore(cpu_sr);};
    }
}


 













 


void  OSSchedUnlock (void)
{

    OS_CPU_SR  cpu_sr = 0u;




    if (OSRunning == 1u) {                             
        {cpu_sr = OS_CPU_SR_Save();};
        if (OSIntNesting == 0u) {                           
            if (OSLockNesting > 0u) {                       
                OSLockNesting--;                            
                if (OSLockNesting == 0u) {                  
                    {OS_CPU_SR_Restore(cpu_sr);};
                    OS_Sched();                             
                } else {
                    {OS_CPU_SR_Restore(cpu_sr);};
                }
            } else {
                {OS_CPU_SR_Restore(cpu_sr);};
            }
        } else {
            {OS_CPU_SR_Restore(cpu_sr);};
        }
    }
}


 


















 

void  OSStart (void)
{
    if (OSRunning == 0u) {
        OS_SchedNew();                                
        OSPrioCur     = OSPrioHighRdy;
        OSTCBHighRdy  = OSTCBPrioTbl[OSPrioHighRdy];  
        OSTCBCur      = OSTCBHighRdy;
        OSStartHighRdy();                             
    }
}
 


















 


void  OSStatInit (void)
{

    OS_CPU_SR  cpu_sr = 0u;




    OSTimeDly(2u);                                
    {cpu_sr = OS_CPU_SR_Save();};
    OSIdleCtr    = 0uL;                           
    {OS_CPU_SR_Restore(cpu_sr);};
    OSTimeDly(1000u / 10u);            
    {cpu_sr = OS_CPU_SR_Save();};
    OSIdleCtrMax = OSIdleCtr;                     
    OSStatRdy    = 1u;
    {OS_CPU_SR_Restore(cpu_sr);};
}

 












 

void  OSTimeTick (void)
{
    OS_TCB    *ptcb;

    BOOLEAN    step;


    OS_CPU_SR  cpu_sr = 0u;





    OSTimeTickHook();                                       


    {cpu_sr = OS_CPU_SR_Save();};                                    
    OSTime++;
    {OS_CPU_SR_Restore(cpu_sr);};

    if (OSRunning == 1u) {

        switch (OSTickStepState) {                          
            case 0u:                          
                 step = 1u;
                 break;

            case 1u:                         
                 step = 0u;                           
                 break;

            case 2u:                         
                 step            = 1u;                 
                 OSTickStepState = 1u;
                 break;

            default:                                        
                 step            = 1u;
                 OSTickStepState = 0u;
                 break;
        }
        if (step == 0u) {                             
            return;
        }

        ptcb = OSTCBList;                                   
        while (ptcb->OSTCBPrio != (63u)) {      
            {cpu_sr = OS_CPU_SR_Save();};
            if (ptcb->OSTCBDly != 0u) {                     
                ptcb->OSTCBDly--;                           
                if (ptcb->OSTCBDly == 0u) {                 

                    if ((ptcb->OSTCBStat & (0x01u | 0x02u | 0x04u | 0x10u | 0x20u)) != 0x00u) {
                        ptcb->OSTCBStat  &= (INT8U)~(INT8U)(0x01u | 0x02u | 0x04u | 0x10u | 0x20u);           
                        ptcb->OSTCBStatPend = 1u;                  
                    } else {
                        ptcb->OSTCBStatPend = 0u;
                    }

                    if ((ptcb->OSTCBStat & 0x08u) == 0x00u) {   
                        OSRdyGrp               |= ptcb->OSTCBBitY;              
                        OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
                    }
                }
            }
            ptcb = ptcb->OSTCBNext;                         
            {OS_CPU_SR_Restore(cpu_sr);};
        }
    }
}

 












 

INT16U  OSVersion (void)
{
    return (29207u);
}

 










 


void  OS_Dummy (void)
{
}


 


























 

INT8U  OS_EventTaskRdy (OS_EVENT  *pevent,
                        void      *pmsg,
                        INT8U      msk,
                        INT8U      pend_stat)
{
    OS_TCB   *ptcb;
    INT8U     y;
    INT8U     x;
    INT8U     prio;






    y    = OSUnMapTbl[pevent->OSEventGrp];               
    x    = OSUnMapTbl[pevent->OSEventTbl[y]];
    prio = (INT8U)((y << 3u) + x);                       
#line 1065 "..\\..\\uCOS-II\\Source\\os_core.c"

    ptcb                  =  OSTCBPrioTbl[prio];         
    ptcb->OSTCBDly        =  0u;                         

    ptcb->OSTCBMsg        =  pmsg;                       



    ptcb->OSTCBStat      &= (INT8U)~msk;                 
    ptcb->OSTCBStatPend   =  pend_stat;                  
                                                         
    if ((ptcb->OSTCBStat &   0x08u) == 0x00u) {
        OSRdyGrp         |=  ptcb->OSTCBBitY;            
        OSRdyTbl[y]      |=  ptcb->OSTCBBitX;
    }

    OS_EventTaskRemove(ptcb, pevent);                    

    if (ptcb->OSTCBEventMultiPtr != (OS_EVENT **)0) {    
        OS_EventTaskRemoveMulti(ptcb, ptcb->OSTCBEventMultiPtr);
        ptcb->OSTCBEventPtr       = (OS_EVENT  *)pevent; 
    }


    return (prio);
}

 













 

void  OS_EventTaskWait (OS_EVENT *pevent)
{
    INT8U  y;


    OSTCBCur->OSTCBEventPtr               = pevent;                  

    pevent->OSEventTbl[OSTCBCur->OSTCBY] |= OSTCBCur->OSTCBBitX;     
    pevent->OSEventGrp                   |= OSTCBCur->OSTCBBitY;

    y             =  OSTCBCur->OSTCBY;             
    OSRdyTbl[y]  &= (OS_PRIO)~OSTCBCur->OSTCBBitX;
    if (OSRdyTbl[y] == 0u) {                       
        OSRdyGrp &= (OS_PRIO)~OSTCBCur->OSTCBBitY;
    }
}

 














 

void  OS_EventTaskWaitMulti (OS_EVENT **pevents_wait)
{
    OS_EVENT **pevents;
    OS_EVENT  *pevent;
    INT8U      y;


    OSTCBCur->OSTCBEventPtr      = (OS_EVENT  *)0;
    OSTCBCur->OSTCBEventMultiPtr = (OS_EVENT **)pevents_wait;        

    pevents =  pevents_wait;
    pevent  = *pevents;
    while (pevent != (OS_EVENT *)0) {                                
        pevent->OSEventTbl[OSTCBCur->OSTCBY] |= OSTCBCur->OSTCBBitX;
        pevent->OSEventGrp                   |= OSTCBCur->OSTCBBitY;
        pevents++;
        pevent = *pevents;
    }

    y             =  OSTCBCur->OSTCBY;             
    OSRdyTbl[y]  &= (OS_PRIO)~OSTCBCur->OSTCBBitX;
    if (OSRdyTbl[y] == 0u) {                       
        OSRdyGrp &= (OS_PRIO)~OSTCBCur->OSTCBBitY;
    }
}

 














 

void  OS_EventTaskRemove (OS_TCB   *ptcb,
                          OS_EVENT *pevent)
{
    INT8U  y;


    y                       =  ptcb->OSTCBY;
    pevent->OSEventTbl[y]  &= (OS_PRIO)~ptcb->OSTCBBitX;     
    if (pevent->OSEventTbl[y] == 0u) {
        pevent->OSEventGrp &= (OS_PRIO)~ptcb->OSTCBBitY;
    }
}

 














 

void  OS_EventTaskRemoveMulti (OS_TCB    *ptcb,
                               OS_EVENT **pevents_multi)
{
    OS_EVENT **pevents;
    OS_EVENT  *pevent;
    INT8U      y;
    OS_PRIO    bity;
    OS_PRIO    bitx;


    y       =  ptcb->OSTCBY;
    bity    =  ptcb->OSTCBBitY;
    bitx    =  ptcb->OSTCBBitX;
    pevents =  pevents_multi;
    pevent  = *pevents;
    while (pevent != (OS_EVENT *)0) {                    
        pevent->OSEventTbl[y]  &= (OS_PRIO)~bitx;
        if (pevent->OSEventTbl[y] == 0u) {
            pevent->OSEventGrp &= (OS_PRIO)~bity;
        }
        pevents++;
        pevent = *pevents;
    }
}

 












 

void  OS_EventWaitListInit (OS_EVENT *pevent)
{
    INT8U  i;


    pevent->OSEventGrp = 0u;                      
    for (i = 0u; i < ((63u) / 8u + 1u); i++) {
        pevent->OSEventTbl[i] = 0u;
    }
}

 











 

static  void  OS_InitEventList (void)
{


    INT16U     ix;
    INT16U     ix_next;
    OS_EVENT  *pevent1;
    OS_EVENT  *pevent2;


    OS_MemClr((INT8U *)&OSEventTbl[0], sizeof(OSEventTbl));  
    for (ix = 0u; ix < (80u - 1u); ix++) {         
        ix_next = ix + 1u;
        pevent1 = &OSEventTbl[ix];
        pevent2 = &OSEventTbl[ix_next];
        pevent1->OSEventType    = 0u;
        pevent1->OSEventPtr     = pevent2;

        pevent1->OSEventName    = (INT8U *)(void *)"?";      

    }
    pevent1                         = &OSEventTbl[ix];
    pevent1->OSEventType            = 0u;
    pevent1->OSEventPtr             = (OS_EVENT *)0;

    pevent1->OSEventName            = (INT8U *)(void *)"?";  

    OSEventFreeList                 = &OSEventTbl[0];
#line 1317 "..\\..\\uCOS-II\\Source\\os_core.c"
}
 











 

static  void  OS_InitMisc (void)
{

    OSTime                    = 0uL;                        


    OSIntNesting              = 0u;                         
    OSLockNesting             = 0u;                         

    OSTaskCtr                 = 0u;                         

    OSRunning                 = 0u;                   

    OSCtxSwCtr                = 0u;                         
    OSIdleCtr                 = 0uL;                        


    OSIdleCtrRun              = 0uL;
    OSIdleCtrMax              = 0uL;
    OSStatRdy                 = 0u;                   







    OSTaskRegNextAvailID      = 0u;                         

}
 











 

static  void  OS_InitRdyList (void)
{
    INT8U  i;


    OSRdyGrp      = 0u;                                     
    for (i = 0u; i < ((63u) / 8u + 1u); i++) {
        OSRdyTbl[i] = 0u;
    }

    OSPrioCur     = 0u;
    OSPrioHighRdy = 0u;

    OSTCBHighRdy  = (OS_TCB *)0;
    OSTCBCur      = (OS_TCB *)0;
}

 











 

static  void  OS_InitTaskIdle (void)
{

    INT8U  err;





    (void)OSTaskCreateExt(OS_TaskIdle,
                          (void *)0,                                  
                          &OSTaskIdleStk[128u - 1u], 
                          (63u),                          
                          65535u,
                          &OSTaskIdleStk[0],                          
                          128u,
                          (void *)0,                                  
                          0x0001u | 0x0002u); 
#line 1449 "..\\..\\uCOS-II\\Source\\os_core.c"


    OSTaskNameSet((63u), (INT8U *)(void *)"uC/OS-II Idle", &err);

}
 











 


static  void  OS_InitTaskStat (void)
{

    INT8U  err;





    (void)OSTaskCreateExt(OS_TaskStat,
                          (void *)0,                                    
                          &OSTaskStatStk[128u - 1u],   
                          (63u - 1u),                            
                          65534u,
                          &OSTaskStatStk[0],                            
                          128u,
                          (void *)0,                                    
                          0x0001u | 0x0002u);   
#line 1511 "..\\..\\uCOS-II\\Source\\os_core.c"


    OSTaskNameSet((63u - 1u), (INT8U *)(void *)"uC/OS-II Stat", &err);

}

 











 

static  void  OS_InitTCBList (void)
{
    INT8U    ix;
    INT8U    ix_next;
    OS_TCB  *ptcb1;
    OS_TCB  *ptcb2;


    OS_MemClr((INT8U *)&OSTCBTbl[0],     sizeof(OSTCBTbl));       
    OS_MemClr((INT8U *)&OSTCBPrioTbl[0], sizeof(OSTCBPrioTbl));   
    for (ix = 0u; ix < (20u + 2u - 1u); ix++) {     
        ix_next =  ix + 1u;
        ptcb1   = &OSTCBTbl[ix];
        ptcb2   = &OSTCBTbl[ix_next];
        ptcb1->OSTCBNext = ptcb2;

        ptcb1->OSTCBTaskName = (INT8U *)(void *)"?";              

    }
    ptcb1                   = &OSTCBTbl[ix];
    ptcb1->OSTCBNext        = (OS_TCB *)0;                        

    ptcb1->OSTCBTaskName    = (INT8U *)(void *)"?";               

    OSTCBList               = (OS_TCB *)0;                        
    OSTCBFreeList           = &OSTCBTbl[0];
}
 


















 

void  OS_MemClr (INT8U  *pdest,
                 INT16U  size)
{
    while (size > 0u) {
        *pdest++ = (INT8U)0;
        size--;
    }
}
 






















 

void  OS_MemCopy (INT8U  *pdest,
                  INT8U  *psrc,
                  INT16U  size)
{
    while (size > 0u) {
        *pdest++ = *psrc++;
        size--;
    }
}
 















 

void  OS_Sched (void)
{

    OS_CPU_SR  cpu_sr = 0u;




    {cpu_sr = OS_CPU_SR_Save();};
    if (OSIntNesting == 0u) {                           
        if (OSLockNesting == 0u) {                      
            OS_SchedNew();
            OSTCBHighRdy = OSTCBPrioTbl[OSPrioHighRdy];
            if (OSPrioHighRdy != OSPrioCur) {           

                OSTCBHighRdy->OSTCBCtxSwCtr++;          

                OSCtxSwCtr++;                           
                OSCtxSw();                           
            }
        }
    }
    {OS_CPU_SR_Restore(cpu_sr);};
}
















 

static  void  OS_SchedNew (void)
{

    INT8U   y;


    y             = OSUnMapTbl[OSRdyGrp];
    OSPrioHighRdy = (INT8U)((y << 3u) + OSUnMapTbl[OSRdyTbl[y]]);
#line 1706 "..\\..\\uCOS-II\\Source\\os_core.c"
}

 














 


INT8U  OS_StrLen (INT8U *psrc)
{
    INT8U  len;








    len = 0u;
    while (*psrc != (INT8U)0) {
        psrc++;
        len++;
    }
    return (len);
}

 



















 

void  OS_TaskIdle (void *p_arg)
{

    OS_CPU_SR  cpu_sr = 0u;




    p_arg = p_arg;                                
    for (;;) {
        {cpu_sr = OS_CPU_SR_Save();};
        OSIdleCtr++;
        {OS_CPU_SR_Restore(cpu_sr);};
        OSTaskIdleHook();                         
    }
}
 






















 


void  OS_TaskStat (void *p_arg)
{

    OS_CPU_SR  cpu_sr = 0u;




    p_arg = p_arg;                                
    while (OSStatRdy == 0u) {
        OSTimeDly(2u * 1000u / 10u);   
    }
    OSIdleCtrMax /= 100uL;
    if (OSIdleCtrMax == 0uL) {
        OSCPUUsage = 0u;

        (void)OSTaskSuspend(0xFFu);





    }
    {cpu_sr = OS_CPU_SR_Save();};
    OSIdleCtr = OSIdleCtrMax * 100uL;             
    {OS_CPU_SR_Restore(cpu_sr);};
    for (;;) {
        {cpu_sr = OS_CPU_SR_Save();};
        OSIdleCtrRun = OSIdleCtr;                 
        OSIdleCtr    = 0uL;                       
        {OS_CPU_SR_Restore(cpu_sr);};
        OSCPUUsage   = (INT8U)(100uL - OSIdleCtrRun / OSIdleCtrMax);
        OSTaskStatHook();                         

        OS_TaskStatStkChk();                      

        OSTimeDly(1000u / 10u);        
    }
}

 










 


void  OS_TaskStatStkChk (void)
{
    OS_TCB      *ptcb;
    OS_STK_DATA  stk_data;
    INT8U        err;
    INT8U        prio;


    for (prio = 0u; prio <= (63u); prio++) {
        err = OSTaskStkChk(prio, &stk_data);
        if (err == 0u) {
            ptcb = OSTCBPrioTbl[prio];
            if (ptcb != (OS_TCB *)0) {                                
                if (ptcb != ((OS_TCB *)1)) {                        


                    ptcb->OSTCBStkBase = ptcb->OSTCBStkBottom + ptcb->OSTCBStkSize;



                    ptcb->OSTCBStkUsed = stk_data.OSUsed;             

                }
            }
        }
    }
}

 









































 

INT8U  OS_TCBInit (INT8U    prio,
                   OS_STK  *ptos,
                   OS_STK  *pbos,
                   INT16U   id,
                   INT32U   stk_size,
                   void    *pext,
                   INT16U   opt)
{
    OS_TCB    *ptcb;

    OS_CPU_SR  cpu_sr = 0u;


    INT8U      i;



    {cpu_sr = OS_CPU_SR_Save();};
    ptcb = OSTCBFreeList;                                   
    if (ptcb != (OS_TCB *)0) {
        OSTCBFreeList            = ptcb->OSTCBNext;         
        {OS_CPU_SR_Restore(cpu_sr);};
        ptcb->OSTCBStkPtr        = ptos;                    
        ptcb->OSTCBPrio          = prio;                    
        ptcb->OSTCBStat          = 0x00u;             
        ptcb->OSTCBStatPend      = 0u;         
        ptcb->OSTCBDly           = 0u;                      


        ptcb->OSTCBExtPtr        = pext;                    
        ptcb->OSTCBStkSize       = stk_size;                
        ptcb->OSTCBStkBottom     = pbos;                    
        ptcb->OSTCBOpt           = opt;                     
        ptcb->OSTCBId            = id;                      
#line 1976 "..\\..\\uCOS-II\\Source\\os_core.c"


        ptcb->OSTCBDelReq        = 0u;



        ptcb->OSTCBY             = (INT8U)(prio >> 3u);
        ptcb->OSTCBX             = (INT8U)(prio & 0x07u);




                                                                   
        ptcb->OSTCBBitY          = (OS_PRIO)(1uL << ptcb->OSTCBY);
        ptcb->OSTCBBitX          = (OS_PRIO)(1uL << ptcb->OSTCBX);


        ptcb->OSTCBEventPtr      = (OS_EVENT  *)0;          

        ptcb->OSTCBEventMultiPtr = (OS_EVENT **)0;          




        ptcb->OSTCBFlagNode  = (OS_FLAG_NODE *)0;           



        ptcb->OSTCBMsg       = (void *)0;                   



        ptcb->OSTCBCtxSwCtr    = 0uL;                       
        ptcb->OSTCBCyclesStart = 0uL;
        ptcb->OSTCBCyclesTot   = 0uL;
        ptcb->OSTCBStkBase     = (OS_STK *)0;
        ptcb->OSTCBStkUsed     = 0uL;



        ptcb->OSTCBTaskName    = (INT8U *)(void *)"?";



        for (i = 0u; i < 1u; i++) {
            ptcb->OSTCBRegTbl[i] = 0u;
        }


        OSTCBInitHook(ptcb);

        {cpu_sr = OS_CPU_SR_Save();};
        OSTCBPrioTbl[prio] = ptcb;
        {OS_CPU_SR_Restore(cpu_sr);};

        OSTaskCreateHook(ptcb);                             

        {cpu_sr = OS_CPU_SR_Save();};
        ptcb->OSTCBNext    = OSTCBList;                     
        ptcb->OSTCBPrev    = (OS_TCB *)0;
        if (OSTCBList != (OS_TCB *)0) {
            OSTCBList->OSTCBPrev = ptcb;
        }
        OSTCBList               = ptcb;
        OSRdyGrp               |= ptcb->OSTCBBitY;          
        OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
        OSTaskCtr++;                                        
        {OS_CPU_SR_Restore(cpu_sr);};
        return (0u);
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    return (66u);
}
