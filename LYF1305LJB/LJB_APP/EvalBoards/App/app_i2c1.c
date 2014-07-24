/*
	FileName : app_i2c1.c
	Description : 
		EEPROM FM24CL04B.
	
	Created on 2013.10.15 by ZZP.
	
	Revision History:
	
*/

#include "bsp.h"
#include "app.h"
#include "app_i2c1.h"

void Test_I2C1(void);


void  AppTaskI2C1 (void *p_arg)
{

	(void)p_arg;
	
	while (DEF_TRUE)
	{
		if (AppInfo.RdyFlag == 1)
		{
			///
			//Test_I2C1();
		}
		
		OSTimeDly(10);
	}
}


void Test_I2C1(void)
{
	uint8_t i, err = 0;
	uint8_t buf[80];
	uint16_t cnt;
	
	for (i = 0; i < 80; i++){
		buf[i] = i << 1;
	}
	cnt = 80;
	err = BSP_WriteI2C1(buf, 0, cnt);
	if (err)
		cnt = 0;
	else{
	
		err = BSP_ReadI2C1(buf, 0, &cnt);
		if (err)
			cnt = 0;
		else{
			
			for (i = 0; i < 80; i++){
				
				if (buf[i] != (i << 1)){
					
					err = 1;
					break;
				}
			}
		}
	}
}


#if 0
void Test_I2C1(void)
{
	uint8_t i, err = 0;
	uint8_t buf[80];
	uint16_t cnt;
	
	for (i = 0; i < 80; i++){
		buf[i] = i << 1;
	}
	cnt = 80;
	sEE_WriteBuffer(buf, 0, cnt);
	sEE_ReadBuffer(buf, 0, &cnt);
	if (cnt != 0)
		err = 2;
	for (i = 0; i < 80; i++){
		if (buf[i] != (i << 1)){
			err = 1;
			break;
		}
	}
	if (err)
		;
}

#endif

