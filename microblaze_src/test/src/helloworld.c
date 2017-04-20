/*
 * Copyright (c) 2009-2012 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "xparameters.h"
#include "xil_types.h"
#include "xstatus.h"
#include "xil_testmem.h"
#include "xbram.h"
#include "xiomodule.h"
#include "pthread.h"
#include "Time.h"
#include "ds1307.h"

#define I2C_BASEADDR 0x4
//I2C Setup register macros considering 32 bits
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


XIOModule gpo;

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
	*word = XIOModule_IoReadWord(module, I2C_C_BASEADDR+4);
}

void Memory_test_32b(XIOModule ioModule){
	u32 addr;
	u32 result;
	int i;
	for(addr = 0 ; addr < 0x2FF ; addr++)
	{
		XIOModule_IoWriteWord(&gpo, addr, 0xABCDABCD);
		for(i = 0;i<100;i++)
		{
		  result = XIOModule_IoReadWord(&gpo,addr);
		  if(result != 0xABCDABCD)
			  xil_printf("Error byte @0x%x : 0x%x test number %d\n\r", addr, result, i);
		  else
			  xil_printf("OK @%x %d\r",addr, i);
		}
	}
}
void Memory_test_8b(XIOModule ioModule){
	u32 addr;
	u8 result;
	int i;
	for(addr = 0 ; addr < 0x2FF ; addr++)
	{
		XIOModule_IoWriteByte(&gpo, addr, 0xAB);
		for(i = 0;i<100;i++)
		{
		  result = XIOModule_IoReadByte(&gpo,addr);
		  if(result != 0xAB)
			  xil_printf("Error byte @0x%x : 0x%x test number %d\n\r", addr, result, i);
		  else
			  xil_printf("OK @%x %d\r",addr, i);
		}
	}
}

int main()
{
    XIOModule_Initialize(&gpo, XPAR_IOMODULE_0_DEVICE_ID); // Initialize the GPO module

	microblaze_register_handler(XIOModule_DeviceInterruptHandler,
						  XPAR_IOMODULE_0_DEVICE_ID); // register the interrupt handler

	XIOModule_Start(&gpo); // start the GPO module

	XIOModule_Connect(&gpo, XIN_IOMODULE_FIT_1_INTERRUPT_INTR, timerTick,NULL); // register timerTick() as our interrupt handler
	XIOModule_Enable(&gpo, XIN_IOMODULE_FIT_1_INTERRUPT_INTR); // enable the interrupt

	microblaze_enable_interrupts(); // enable global interrupts

    delay(5000);//5s delay to let user time to connect console

    u8 slave_addr = 0x68;
    u8 slv_ram_pointer = 0;
    u8 nb_bytes = 4;
    u32 data = 10;
    /*I2C_Setup(&gpo, I2C_BASEADDR, I2C_WRITE, nb_bytes, slave_addr, slv_ram_pointer);
    XIOModule_IoWriteWord(&gpo, 0x8, 0x0);
    I2C_Start(&gpo, I2C_BASEADDR);*/


    while(1){
		I2C_Setup(&gpo, I2C_BASEADDR, I2C_READ, nb_bytes, slave_addr, slv_ram_pointer);
		I2C_Start(&gpo, I2C_BASEADDR);
		delay(100);
		//I2C_Read_Data(&gpo, I2C_BASEADDR, &data);
		data = XIOModule_IoReadWord(&gpo, 0x8);
		xil_printf("I2C read from 0x%d : 0x%x\r\n", slv_ram_pointer, data);

		xil_printf("    Seconds : %x\r\n", ds1307GetSeconds(data));
		xil_printf("    Minutes : %x\r\n", ds1307GetMinutes(data >> 8));
		xil_printf("    Hours : %x\r\n", ds1307GetHours(data>>16));
		xil_printf("    AM/PM : %x\r\n", DS1307_GET_AM_PM(data>>16));
		xil_printf("    12/24 : %x\r\n", DS1307_GET_12_24(data >> 16));
		xil_printf("    Day : %x\r\n", DS1307_GET_DAY(data >> 24));

		delay(2000);

		/*slv_ram_pointer = 2;
		I2C_Setup(&gpo, I2C_BASEADDR, I2C_READ, nb_bytes, slave_addr, slv_ram_pointer);
		I2C_Start(&gpo, I2C_BASEADDR);
		//I2C_Read_Data(&gpo, I2C_BASEADDR, &data);
		data = XIOModule_IoReadWord(&gpo, 0x8);
		xil_printf("I2C read : 0x%x\r\n", data);
		xil_printf("    Date : %x\r\n", DS1307_GET_DATE(data));*/

		delay(950);
    }

    return 0;
}
