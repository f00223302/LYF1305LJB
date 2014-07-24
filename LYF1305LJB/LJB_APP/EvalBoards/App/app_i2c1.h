/*
	FileName : app_i2c1.h
	Description : 
		EEPROM FM24CL04B.
	
	Created on 2013.10.15 by ZZP.
	
	Revision History:
	
*/

#ifndef __APP_I2C_1_H__
#define __APP_I2C_1_H__



#include "core_cm3.h"


#define  MEM_SIZE  512
//Modifiled 20140318
#define  REC_SIZE  ((MEM_SIZE >> 4) - 1)
//#define  REC_SIZE  ((MEM_SIZE >> 5) - 1)

void  AppTaskI2C1 (void *p_arg);

#endif///EOF


