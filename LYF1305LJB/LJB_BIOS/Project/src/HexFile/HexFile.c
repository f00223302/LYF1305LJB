/*
	FileName : HexFile.c
	Description : 
	Created on 2013.01.31 by ZZP.

	Revision History:

*/
#include "stm32f2xx.h"
#include "core_cm3.h"
#include "HexFile.h"
#include "stm322xg_eval.h"




uint8_t Hex2Bin(uint8_t Hex);





uint8_t GetDataFromHexFile(HEX_FILE *HexBuf, uint8_t *buf, uint16_t len)
{
	uint16_t i;
	uint8_t data, ret;

	ret = 0;
	for (i = 0; i < len; i++){

		data = *buf++;
		ret++;
		switch (data){

			case ':':
				if (HexBuf->colon || HexBuf->D || HexBuf->A)
					return (ret | HEX_ERR_DATA);
				if (HexBuf->type != 0xff)
					return (ret | HEX_ERR_DATA);
				InitHexVar(HexBuf);
				HexBuf->colon = 1;
				break;
			case 0x0D:
				if (!HexBuf->colon)
					return (ret | HEX_ERR_DATA);
				if (HexBuf->D)
					return (ret | HEX_ERR_DATA);
				HexBuf->D = 1;
				break;
			case 0x0A:
				if (!HexBuf->colon)
					return (ret | HEX_ERR_DATA);
				if (!HexBuf->D)
					return (ret | HEX_ERR_DATA);
				if ((HexBuf->line_len << 1) + 10 != HexBuf->actual_len)
					return (ret | HEX_ERR_DATA);
				if (HexBuf->type == 0xff)
					return (ret | HEX_ERR_DATA);
				InitHexVar(HexBuf);
				break;
			default:
				if ((!HexBuf->colon) || HexBuf->D || HexBuf->A)
					return (ret | HEX_ERR_DATA);
				data = Hex2Bin(data);
				if (data == 0xff)
					return (ret | HEX_ERR_DATA);

				switch (HexBuf->actual_len){

					case 0:///接收长度值1
						HexBuf->line_len = data << 4;
						break;
					case 1:///接收长度值2：
						HexBuf->line_len |= data;
						if (HexBuf->line_len > 0x10)
							return (ret | HEX_ERR_DATA); 
						HexBuf->actual_sum = HexBuf->line_len;						
						break;
					case 2:///地址1
						HexBuf->addr = (uint16_t)data << 12;
						break;
					case 3:///地址2
						HexBuf->addr |= ((uint16_t)data << 8);
						break;
					case 4:///地址3
						HexBuf->addr |= ((uint8_t)data << 4);
						break;
					case 5:///地址4
						HexBuf->addr |= data; 
						HexBuf->actual_sum += (HexBuf->addr & 0xff);
						HexBuf->actual_sum += (HexBuf->addr >> 8);						
						break;
					case 6:///type1
						HexBuf->type = data << 4;
						break;
					case 7:///type2
						HexBuf->type |= data;
						HexBuf->actual_sum += HexBuf->type;
						switch (HexBuf->type){

							case 0x00:///data record
								break;
							case 0x01:///EOF
								if (HexBuf->line_len != 0)
									return (ret | HEX_ERR_DATA);
								break;
							case 0x02:///extended segment address record								
								if (HexBuf->line_len != 2)
									return (ret | HEX_ERR_DATA);
								break;
							case 0x04:///extened linear address record
								if (HexBuf->line_len != 2)
									return (ret | HEX_ERR_DATA);
								break;
							case 0x05:///start Linear Address Record
								break; 
							default:///错误数据
								return (ret | HEX_ERR_DATA);
						}
						break;
					default:
						if (HexBuf->actual_len >= (HexBuf->line_len << 1) + 10)
							return (ret | HEX_ERR_DATA);
						else if (HexBuf->actual_len == (HexBuf->line_len << 1) + 8)///sum1
							HexBuf->sum = (data << 4);
						else if (HexBuf->actual_len == (HexBuf->line_len << 1) + 9){///sum2

							HexBuf->sum |= data;
							HexBuf->sum += HexBuf->actual_sum;
							if (HexBuf->sum != 0)
								return (ret | HEX_ERR_DATA);
							///最后一行可能没有换行符，用结束标志：
							if (HexBuf->type == 0x01)///EOF
								return (ret | HEX_ERR_EOF);
						}
						else{

							if (HexBuf->type == 0x04){

								if (HexBuf->actual_len == 8)
									HexBuf->seg_addr = (data << 28);
								else if (HexBuf->actual_len == 9)
									HexBuf->seg_addr |= (data << 24);
								else if (HexBuf->actual_len == 10)
									HexBuf->seg_addr |= (data << 20);
								else if (HexBuf->actual_len == 11){

									HexBuf->seg_addr |= (data << 16);
									HexBuf->actual_sum += ((HexBuf->seg_addr >> 16) & 0xff);
									HexBuf->actual_sum += ((HexBuf->seg_addr >> 24) & 0xff);
								}
							}
							else if (HexBuf->type == 0x05){///No meaning

								if (!(HexBuf->actual_len & 0x01))
									HexBuf->actual_sum += (data << 4);
								else
									HexBuf->actual_sum += data;
							}
							else if (HexBuf->type == 0x00){//Data

								if (!(HexBuf->actual_len & 0x01)){
								
									HexBuf->data[HexBuf->data_cnt] = data << 4;								
									HexBuf->actual_sum += (data << 4);
								}
								else{
								
									HexBuf->actual_sum += data;
									HexBuf->data[HexBuf->data_cnt] |= data;
									HexBuf->data_cnt++;
									HexBuf->data_cnt &= 0x03;
									if (HexBuf->data_cnt == 0){

										HexBuf->actual_len++;
										///每 4 个字节组成 1 个程序数据：
										return (ret | HEX_VALID_DATA);
									}
								}
							}
							else
								return (ret | HEX_ERR_DATA);
						}
						
						break;
				}
				HexBuf->actual_len++;
				break;
		}
	}

	return (ret | HEX_ERR_NONE);
}


__inline uint8_t Hex2Bin(uint8_t Hex)
{
  if ((Hex < 0x3A) && (Hex > 0x2F))
    return (Hex - 0x30);
  if ((Hex < 0x47) && (Hex > 0x40))
    return (Hex - 0x41 + 0x0A);
  return (0xFF);
}

void InitHexVar(HEX_FILE *HexBuf)
{
	HexBuf->A = 0;
	HexBuf->D = 0;
	HexBuf->colon = 0;
	HexBuf->line_len = 0;
	HexBuf->actual_len = 0;
	HexBuf->type = 0xff;
	HexBuf->actual_sum = 0;
	HexBuf->data_cnt = 0;
}









