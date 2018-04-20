/*
 * as3935.h
 *
 *  Created on: Feb 15, 2018
 *      Author: Sylvain
 */

#ifndef AS3935_H_
#define AS3935_H_

#include "xiomodule.h"
#include "i2c.h"

//AS3935 macros
#define AS3935_AFE_MASK 0x7E
#define AS3935_AFE_OFFSET 1
#define AS3935_PWD_MASK 0x01
#define AS3935_PWD_OFFSET 0
#define AS3935_NF_LEVEL_MASK 0x70
#define AS3935_NF_LEVEL_OFFSET 4
#define AS3935_WDTH_MASK 0x0F
#define AS3935_WDTH_OFFSET 0
#define AS3935_CL_STAT_MASK 0x01
#define AS3935_CL_STAT_OFFSET 6
#define AS3935_MIN_NUM_LIGH_MASK 0x03
#define AS3935_MIN_NUM_LIGH_OFFSET 4
#define AS3935_SREJ_MASK 0x0F
#define AS3935_SREJ_OFFSET 0
#define AS3935_LCO_FDIV_MASK 0x01
#define AS3935_LCO_FDIV_OFFSET 6
#define AS3935_MASK_DIST_MASK 0x01
#define AS3935_MASK_DIST_OFFSET 5
#define AS3935_INT_MASK 0x0F
#define AS3935_INT_OFFSET 0
#define AS3935_S_LIG_L_MASK 0xFF
#define AS3935_S_LIG_L_OFFSET 0
#define AS3935_S_LIG_H_MASK 0xFF
#define AS3935_S_LIG_H_OFFSET 0
#define AS3935_S_LIG_MM_MASK 0x0F
#define AS3935_S_LIG_MM_OFFSET 0
#define AS3935_DISTANCE_MASK 0x3F
#define AS3935_DISTANCE_OFFSET 0
#define AS3935_DISP_LCO_MASK 0x01
#define AS3935_DISP_LCO_OFFSET 7
#define AS3935_DISP_SRCO_MASK 0x01
#define AS3935_DISP_SRCO_OFFSET 6
#define AS3935_DISP_TRCO_MASK 0x01
#define AS3935_DISP_TRCO_OFFSET 5
#define AS3935_TUN_CAP_MASK 0x0F
#define AS3935_TUN_CAP_OFFSET 0




#define AS3935_GET_AFE_GAIN(word) ( (word) & AS3935_AFE_MASK)
#define AS3935_SET_AFE_GAIN(word, gain) ( (word) ^= (gain & 0x1F) << AS3935_AFE_OFFSET)
#define AS3935_GET_PWD(word) ( (word) & AS3935_PWD_MASK)
#define AS3935_SET_PWD(word) ( (word) ^= (0x01) << AS3935_PWD_OFFSET)
#define AS3935_CLEAR_PWD(word) ( (word) &= 0xFE)
#define AS3935_GET_NF_LEVEL(word) ( (word) &= AS3935_NF_LEVEL_MASK)
#define AS3935_SET_NF_LEVEL(word, nf_level) ( (word) ^= (nf_level & 0x7) << AS3935_NF_LEVEL_OFFSET)
#define AS3935_GET_WDTH(word) ( (word) & AS3935_WDTH_MASK)
#define AS3935_SET_WDTH(word, threshold) ( (word) ^= (threshold & 0x0F) << AS3935_WDTH_OFFSET)


#endif /* AS3935_H_ */
