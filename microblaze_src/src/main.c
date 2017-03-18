#include <stdio.h>
#include "xparameters.h"
#include "xil_types.h"
#include "xstatus.h"
#include "xil_testmem.h"
#include "xbram.h"
#include "xiomodule.h"

//#include "platform.h"

XIOModule gpo;
volatile u32 ct = 0;

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
		  if(result != 0xAB)
			  xil_printf("byte @0x%x : 0x%x test number %d\n\r", addr, result, i);
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
			  xil_printf("byte @0x%x : 0x%x test number %d\n\r", addr, result, i);
		  else
			  xil_printf("OK @%x %d\r",addr, i);
		}
	}
}

void Memory_print_8b(XIOModule gpo){
	u32 addr = 4;
	u32 result;
	int go;
	XIOModule_IoWriteByte(&gpo, 4, 0x11);
	XIOModule_IoWriteByte(&gpo, 5, 0x22);
	XIOModule_IoWriteByte(&gpo, 6, 0x33);
	XIOModule_IoWriteByte(&gpo, 7, 0x44);
	//XIOModule_IoWriteWord(&gpo, addr, 0x01106800);
	for(go=0;go<2;go++){
	  delay(10);
	  result = XIOModule_IoReadByte(&gpo, addr);
	  xil_printf("Register %d => 0x%x\t", addr, result);
	  delay(10);
	  result = XIOModule_IoReadByte(&gpo, addr+1);
	  xil_printf("Register %d => 0x%x\t", addr+1, result);
	  delay(10);
	  result = XIOModule_IoReadByte(&gpo, addr+2);
	  xil_printf("Register %d => 0x%x\t", addr+2, result);
	  delay(10);
	  result = XIOModule_IoReadByte(&gpo, addr+3);
	  xil_printf("Register %d => 0x%x\r\n", addr+3, result);

	  delay(10);
	  result = XIOModule_IoReadByte(&gpo, addr+4);
	  xil_printf("Register %d => 0x%x\t", addr+4, result);
	  delay(10);
	  result = XIOModule_IoReadByte(&gpo, addr+5);
	  xil_printf("Register %d => 0x%x\t", addr+5, result);
	  delay(10);
	  result = XIOModule_IoReadByte(&gpo, addr+6);
	  xil_printf("Register %d => 0x%x\t", addr+6, result);
	  delay(10);
	  result = XIOModule_IoReadByte(&gpo, addr+7);
	  xil_printf("Register %d => 0x%x\r\n", addr+7, result);

	  delay(10);
	  result = XIOModule_IoReadByte(&gpo, addr+8);
	  xil_printf("Register %d => 0x%x\t", addr+8, result);
	  delay(10);
	  result = XIOModule_IoReadByte(&gpo, addr+9);
	  xil_printf("Register %d => 0x%x\t", addr+9, result);
	  delay(10);
	  result = XIOModule_IoReadByte(&gpo, addr+10);
	  xil_printf("Register %d => 0x%x\t", addr+10, result);
	  delay(10);
	  result = XIOModule_IoReadByte(&gpo, addr+11);
	  xil_printf("Register %d => 0x%x\r\n", addr+11, result);
	}
}

void Memory_print_32b(XIOModule gpo){
	u32 addr = 0;
	u32 result;
	int go;
	XIOModule_IoWriteWord(&gpo, addr, 0x11111111);
	delay(100);
	XIOModule_IoWriteWord(&gpo, addr+4, 0x22222222);
	delay(100);
	XIOModule_IoWriteWord(&gpo, addr+8, 0x33333333);
	delay(100);
	//XIOModule_IoWriteWord(&gpo, addr+12, 0x44444444);
	//XIOModule_IoWriteWord(&gpo, addr, 0x01106800);
	for(go=0;go<2;go++){
		delay(10);
		result = XIOModule_IoReadWord(&gpo, addr);
		xil_printf("Register %d => 0x%x\t", addr, result);
		delay(10);
		result = XIOModule_IoReadWord(&gpo, addr+4);
		xil_printf("Register %d => 0x%x\t", addr+4, result);
		delay(10);
		result = XIOModule_IoReadWord(&gpo, addr+8);
		xil_printf("Register %d => 0x%x\t", addr+8, result);
		delay(10);
		result = XIOModule_IoReadWord(&gpo, addr+12);
		xil_printf("Register %d => 0x%x\r\n", addr+12, result);
	}
}

void timerTick(void* ref) {
  ct++; // increase ct every millisecond
}

void delay(u32 ms) {
  ct = 0; // set the counter to 0
  while (ct < ms) // wait for ms number of milliseconds
    ;
}

int main() {
  XIOModule_Initialize(&gpo, XPAR_IOMODULE_0_DEVICE_ID); // Initialize the GPO module

  microblaze_register_handler(XIOModule_DeviceInterruptHandler,
                              XPAR_IOMODULE_0_DEVICE_ID); // register the interrupt handler

  XIOModule_Start(&gpo); // start the GPO module

  XIOModule_Connect(&gpo, XIN_IOMODULE_FIT_1_INTERRUPT_INTR, timerTick,
                    NULL); // register timerTick() as our interrupt handler
  XIOModule_Enable(&gpo, XIN_IOMODULE_FIT_1_INTERRUPT_INTR); // enable the interrupt

  microblaze_enable_interrupts(); // enable global interrupts

  delay(5000);

  u32 offset = 0;
  u8 addr_ds1307 = 0x68;//1101000
  u8 read = 0x2;
  u8 null = 0;
  u8 go = 0x1;
  u32 result = 5;
  u8 addr = 4;
  int i;
    // write the LED value to port 1 (you can have up to 4 ports)
    //XIOModule_DiscreteWrite(&gpo, 1, leds++);
  	  XIOModule_IoWriteWord(&gpo, addr+4, 0x00000001);
	result = XIOModule_IoReadWord(&gpo, 4+4);
  while(1){
	  XIOModule_IoWriteWord(&gpo, addr, 0x00006803);
	  delay(50);
	  result = XIOModule_IoReadWord(&gpo, 4);
	  xil_printf("[0x%4x] = 0x%x\r\n", addr, result);
	  result = XIOModule_IoReadWord(&gpo, 4+4);
	  xil_printf("[0x%4x] = 0x%x\r\n", addr+4, result);
  }
}

