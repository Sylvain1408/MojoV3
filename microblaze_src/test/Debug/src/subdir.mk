################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/Mojo.c \
../src/ds1307.c \
../src/i2c.c \
../src/platform.c 

LD_SRCS += \
../src/lscript.ld 

OBJS += \
./src/Mojo.o \
./src/ds1307.o \
./src/i2c.o \
./src/platform.o 

C_DEPS += \
./src/Mojo.d \
./src/ds1307.d \
./src/i2c.d \
./src/platform.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -I../../test_bsp/microblaze_mcs/include -I"C:\Xilinx_ISE\14.7\ISE_DS\EDK\sw\XilinxProcessorIPLib\drivers\uartlite_v2_01_a\src" -c -fmessage-length=0 -I../../standalone_bsp_0/microblaze_mcs/include -mno-xl-reorder -mlittle-endian -mcpu=v8.40.a -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


