/*
 * i2c.c
 *
 *  Created on: 21 avr. 2017
 *      Author: CAO-PCB
 */
#include "i2c.h"

void I2C_Start(XIOModule* module, u32 I2C_C_BASEADDR){
	u32 tmp;
	tmp = XIOModule_IoReadWord(module, I2C_C_BASEADDR);
	//xil_printf("Reading 0x%x : 0x%x\r\n", I2C_C_BASEADDR, tmp);
	XIOModule_IoWriteWord(module, I2C_C_BASEADDR, I2C_SET_GO(tmp) );
	//xil_printf("Setting go 0x%x : 0x%x\r\n", I2C_C_BASEADDR, tmp);
	delay(1);//may be useless, need to test
	XIOModule_IoWriteWord(module, I2C_C_BASEADDR, I2C_RESET_GO(tmp) );
	//xil_printf("Reset go 0x%x : 0x%x\r\n", I2C_C_BASEADDR, tmp);
}

void I2C_Setup(XIOModule* module, u32 I2C_C_BASEADDR, u8 rw, u8 nb_bytes, u8 i2c_slave_addr, u8 ram_pointer){
	u32 word = 0;
	if(nb_bytes > 4)
		nb_bytes = 4;
	if(rw == 0){
		I2C_SET_WRITE(word);
	}
	else if(rw == 1){
		I2C_SET_READ(word);
	}
	I2C_SET_NB_BYTES(word, nb_bytes);
	I2C_SET_SLAVE_ADDR(word, i2c_slave_addr);
	I2C_SET_RAM_POINTER(word, ram_pointer);
	//xil_printf("I2C module configuration : writting 0x%x\r\n", word);
	XIOModule_IoWriteWord(module, I2C_C_BASEADDR, word);
}

void I2C_Read_Data(XIOModule* module, u32 I2C_C_BASEADDR, u32* word){
	*word = XIOModule_IoReadWord(module, I2C_C_BASEADDR+I2C_ADDR_DATA_OFFSET);
}

void I2C_Write_Data(XIOModule* module, u32 I2C_C_BASEADDR, u32 word){
	XIOModule_IoWriteWord(module, I2C_C_BASEADDR+I2C_ADDR_DATA_OFFSET, word);
}
