/*
	FileName : app_fs.c
	Description : 
		FAT file system files.
		
	Created on 2013.10.19 by ZZP.
	
	Revision History:
	
*/

#include "app_cfg.h"

#if APP_FILE_SYSTEM_ENABLE

#include <stm32f2xx.h>

#include "ff.c"
#include "cc936.c"
#include "diskio.c"
#include "syscall.c"
#include "fattime.c"

#if APP_SD_ENABLE
#include "sd_disk.c"
#endif

#if APP_USB_HOST_ENABLE
#include "usb_disk.c"
#endif


#if ((!APP_SD_ENABLE) && (!APP_USB_HOST_ENABLE))

	#error "No media file(SD or USB)"

#endif
	
#endif///







