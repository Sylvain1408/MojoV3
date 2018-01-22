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
#include "i2c.h"

#define I2C_BASEADDR 0x4

XIOModule gpo;

volatile u32 ct = 0;

void timerTick(void* ref) {
  ct++; // increase ct every millisecond
}

void delay(u32 ms) {
  ct = 0; // set the counter to 0
  while (ct < ms) // wait for ms number of milliseconds
    ;
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

    //5s delay to let user time to connect console
	int i;
	for(i=5 ; i>0 ; i--)
	{
		xil_printf("Starting in %d seconds\r\n", i);
		delay(1000);
	}

    u8 slave_addr = 0x6B;
    u8 slv_ram_pointer = 0x02;
    u8 nb_bytes = 1;
    u32 data = 10;
    I2C_Setup(&gpo, I2C_BASEADDR, I2C_WRITE, nb_bytes, slave_addr, slv_ram_pointer);
    I2C_Write_Data(&gpo, I2C_BASEADDR, 0x00000080);
    I2C_Start(&gpo, I2C_BASEADDR);
    delay(2000);

    slv_ram_pointer = 0x04;
    I2C_Setup(&gpo, I2C_BASEADDR, I2C_WRITE, nb_bytes, slave_addr, slv_ram_pointer);
	I2C_Write_Data(&gpo, I2C_BASEADDR, 0x000000D6);
	I2C_Start(&gpo, I2C_BASEADDR);
	delay(2000);

    while(1){
    	XIOModule_IoWriteWord(&gpo, 0x8, 0);
		I2C_Setup(&gpo, I2C_BASEADDR, I2C_READ, nb_bytes, slave_addr, slv_ram_pointer);
		I2C_Start(&gpo, I2C_BASEADDR);
		delay(1000);
		I2C_Read_Data(&gpo, I2C_BASEADDR, &data);
		xil_printf("0x%x\r\n", data);

		if(data != 0xD6000000)
		{
			slv_ram_pointer = 0x02;
			I2C_Setup(&gpo, I2C_BASEADDR, I2C_WRITE, nb_bytes, slave_addr, slv_ram_pointer);
			I2C_Write_Data(&gpo, I2C_BASEADDR, 0x000000A0);
			I2C_Start(&gpo, I2C_BASEADDR);
			delay(2000);

			slv_ram_pointer = 0x04;
			I2C_Setup(&gpo, I2C_BASEADDR, I2C_WRITE, nb_bytes, slave_addr, slv_ram_pointer);
			I2C_Write_Data(&gpo, I2C_BASEADDR, 0x000000D6);
			I2C_Start(&gpo, I2C_BASEADDR);
		}

		/*I2C_Setup(&gpo, I2C_BASEADDR, I2C_WRITE, nb_bytes, slave_addr, slv_ram_pointer);
		XIOModule_IoWriteWord(&gpo, 0x8, 0xB2B2B2B2);
		I2C_Start(&gpo, I2C_BASEADDR);*/
		/*xil_printf("I2C read from 0x%d : 0x%x\r\n", slv_ram_pointer, data);

		xil_printf("    Seconds : %x\r\n", ds1307GetSeconds(data));
		xil_printf("    Minutes : %x\r\n", ds1307GetMinutes(data >> 8));
		xil_printf("    Hours : %x\r\n", ds1307GetHours(data>>16));
		xil_printf("    AM/PM : %x\r\n", DS1307_GET_AM_PM(data>>16));
		xil_printf("    12/24 : %x\r\n", DS1307_GET_12_24(data >> 16));
		xil_printf("    Day : %x\r\n", DS1307_GET_DAY(data >> 24));*/

		delay(1000);

		/*slv_ram_pointer = 2;
		I2C_Setup(&gpo, I2C_BASEADDR, I2C_READ, nb_bytes, slave_addr, slv_ram_pointer);
		I2C_Start(&gpo, I2C_BASEADDR);
		//I2C_Read_Data(&gpo, I2C_BASEADDR, &data);
		data = XIOModule_IoReadWord(&gpo, 0x8);
		xil_printf("I2C read : 0x%x\r\n", data);
		xil_printf("    Date : %x\r\n", DS1307_GET_DATE(data));*/
    }

    return 0;
}
