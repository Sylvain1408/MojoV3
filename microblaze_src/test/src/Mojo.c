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

/***
 *
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
#include "xuartlite.h"
#include <xuartlite_l.h>
#include <xil_testmem.h>
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

void ExtInt(void* ref){
	xil_printf("ok\n");
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
	XIOModule_Enable(&gpo, XIN_IOMODULE_FIT_1_INTERRUPT_INTR); // enable the FIT interrupt

	XIOModule_Connect(&gpo, XIN_IOMODULE_EXTERNAL_INTERRUPT_INTR, ExtInt, NULL);
	XIOModule_Enable(&gpo, XIN_IOMODULE_EXTERNAL_INTERRUPT_INTR);// enable External Interrupt

	microblaze_enable_interrupts(); // enable global interrupts

    //5s delay to let user time to connect console
	int i;
	for(i=5 ; i>0 ; i--)
	{
		xil_printf("Starting in %d seconds\r\n", i);
		delay(1000);
	}

	u8 slave_addr = 0x68;
	u8 slvRamPointer = 0;
	u8 nb_bytes = 4;
	u32 data = 0, data1 = 0;
	u8 tmp = 0;



	ds1307SetSeconds(&tmp, 0);
	data += (tmp << 24);
	tmp = 0;
	ds1307SetMinutes(&tmp, 10);
	data += (tmp << 16);
	tmp = 0;
	ds1307SetHours(&tmp, 17);
	//ds1307Set24Mode(&tmp);
	data += (tmp << 8);
	tmp = 0;
	ds1307SetDay(&tmp, 6);
	data += tmp;

	xil_printf("0x%x\n", data);
	xil_printf("    Seconds : %d\r\n", ds1307GetSeconds(data >> 24));
	xil_printf("    Minutes : %d\r\n", ds1307GetMinutes(data >> 16));
	xil_printf("    Hours : %d\r\n", ds1307GetHours(data >> 8));

	I2cSetup(&gpo, I2C_BASEADDR, I2C_WRITE, nb_bytes, slave_addr, slvRamPointer);
	I2cWriteWord(&gpo, I2C_BASEADDR, data);
	I2cStart(&gpo, I2C_BASEADDR);

	tmp = 0;
	ds1307SetDate(&tmp, 5);
	data1 += (tmp << 24);
	tmp = 0;
	ds1307SetMonth(&tmp, 5);
	data1 += (tmp << 16);
	tmp = 0;
	ds1307SetYear(&tmp, 18);
	data1 += (tmp << 8);
	DS1307_SET_SQWE(data1);

	xil_printf("Writting %d:%d:%d %d/%d/20%d\n",
					ds1307GetHours(data>>8),
					ds1307GetMinutes(data >> 16),
					ds1307GetSeconds(data >> 24),
					ds1307GetDate(data1 >> 24),
					ds1307GetMonth(data1 >> 16),
					ds1307GetYear(data1 >> 8) );

	I2cSetup(&gpo, I2C_BASEADDR, I2C_WRITE, nb_bytes, slave_addr, slvRamPointer + 4);
	I2cWriteWord(&gpo, I2C_BASEADDR, data1);
	I2cStart(&gpo, I2C_BASEADDR);

	/*I2cSetup(&gpo, I2C_BASEADDR, I2C_READ, nb_bytes, slave_addr, slvRamPointer);
	I2cStart(&gpo, I2C_BASEADDR);
	delay(100);
	I2cReadWord(&gpo, I2C_BASEADDR, &data);
	xil_printf("I2C addr : 0x%X\n0x%d : 0x%x\r\n", slave_addr, slv_ram_pointer, data);

	xil_printf("    Seconds : %d\r\n", ds1307GetSeconds(data));
	xil_printf("    Minutes : %d\r\n", ds1307GetMinutes(data >> 8));
	xil_printf("    Hours : %d\r\n", ds1307GetHours(data>>16));
	xil_printf("    AM/PM : %x\r\n", DS1307_GET_AM_PM(data>>16));
	xil_printf("    12/24 : %x\r\n", DS1307_GET_12_24(data >> 16));
	xil_printf("    Day : %d\r\n", DS1307_GET_DAY(data >> 24));*/


	while(1){
		slvRamPointer = 0x0;
		I2cSetup(&gpo, I2C_BASEADDR, I2C_READ, nb_bytes, slave_addr, slvRamPointer);
		I2cStart(&gpo, I2C_BASEADDR);
		delay(100);
		I2cReadWord(&gpo, I2C_BASEADDR, &data);

		slvRamPointer = 0x4;
		I2cSetup(&gpo, I2C_BASEADDR, I2C_READ, nb_bytes, slave_addr, slvRamPointer);
		I2cStart(&gpo, I2C_BASEADDR);
		delay(100);
		I2cReadWord(&gpo, I2C_BASEADDR, &data1);

		xil_printf("%d:%d:%d %d/%d/20%d\r",
				ds1307GetHours(data>>8),
				ds1307GetMinutes(data >> 16),
				ds1307GetSeconds(data >> 24),
				ds1307GetDay(data1 >> 24),
				ds1307GetMonth(data1 >> 16),
				ds1307GetYear(data1 >> 8)	);
		/*I2cSetup(&gpo, I2C_BASEADDR, I2C_READ, nb_bytes, slave_addr, slvRamPointer);
		I2cStart(&gpo, I2C_BASEADDR);
		delay(100);
		int i;
		for(i=0; i<100; i++)
			I2cReadWord(&gpo, I2C_BASEADDR, &data);
		xil_printf("I2C addr : 0x%X\n0x%d : 0x%x\r\n", slave_addr, slvRamPointer, data);
		data = 0;
		I2cWriteWord(&gpo, I2C_BASEADDR, 0x0);
		delay(890);*/
	}


    return 0;
}
