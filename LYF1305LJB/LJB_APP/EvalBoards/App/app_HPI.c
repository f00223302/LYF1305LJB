/*
	FileName: app_HPI.c
	Description : 
	
	Created on 2013-11-12 by ZZP.
	
	Revision History:
	
*/

#include "ucos_ii.h"
#include "bsp.h"
#include "app.h"
#include "app_hpi.h"

///PF6, PF7 �жϳ����е���
uint32_t HPI_CallBack(unsigned char Arg, void *ptr)
{
	if (Arg & 0x01){
	}
	
	if (Arg & 0x02){
	}
	
	return 0;
}


///HPI ����ȶ��壺


