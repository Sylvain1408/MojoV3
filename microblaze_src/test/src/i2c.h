/*
 * i2c.h
 *
 *  Created on: 21 avr. 2017
 *      Author: CAO-PCB
 */

#ifndef I2C_H_
#define I2C_H_

#include "xiomodule.h"
#include "Time.h"

//I2C Setup register macros considering 32 bits
#define I2C_ADDR_DATA_OFFSET 4
#define I2C_OFFSET_GO 0
#define I2C_OFFSET_RW 1
#define I2C_OFFSET_NB_BYTES 4
#define I2C_OFFSET_SLAVE_ADDR 8
#define I2C_OFFSET_RAM_POINTER 16
#define I2C_READ 1
#define I2C_WRITE 0
#define I2C_SET_GO(word) (word |= (0x1 << I2C_OFFSET_GO))
#define I2C_RESET_GO(word) (word ^= (0x1 << I2C_OFFSET_GO))
#define I2C_SET_READ(word) (word |= (0x1 << I2C_OFFSET_RW))
#define I2C_SET_WRITE(word) (word |= (0x0 << I2C_OFFSET_RW))
#define I2C_SET_NB_BYTES(word, nb_bytes) (word |= (nb_bytes << I2C_OFFSET_NB_BYTES))
#define I2C_SET_SLAVE_ADDR(word, slave_addr) (word |= (slave_addr << I2C_OFFSET_SLAVE_ADDR))
#define I2C_SET_RAM_POINTER(word, pointer) (word |= (pointer << I2C_OFFSET_RAM_POINTER))

//I2C Data macros considering 32 bits
#define I2C_SET_32B_DATA(word, byte0, byte1, byte2, byte3) (word |= (byte0 + (byte1 << 8) + (byte2 << 16) + (byte3 << 24)))
/*#define I2C_GET_8B_DATA_0 (word, byte0) (word|0x000000FF)
#define I2C_GET_8B_DATA_1 (word, byte1) (word|0x0000FF00)
#define I2C_GET_8B_DATA_2 (word, byte2) (word|0x00FF0000)
#define I2C_GET_8B_DATA_3 (word, byte3) (word|0xFF000000)*/

void I2C_Start(XIOModule* module, u32 I2C_C_BASEADDR);
void I2C_Setup(XIOModule* module, u32 I2C_C_BASEADDR, u8 rw, u8 nb_bytes, u8 i2c_slave_addr, u8 ram_pointer);
void I2C_Read_Data(XIOModule* module, u32 I2C_C_BASEADDR, u32* word);
void I2C_Write_Data(XIOModule* module, u32 I2C_C_BASEADDR, u32 word);

#endif /* I2C_H_ */
