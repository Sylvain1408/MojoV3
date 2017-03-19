################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
Mojo_I2C.elf.size \

ELFCHECK += \
Mojo_I2C.elf.elfcheck \


# All Target
all: Mojo_I2C.elf secondary-outputs

# Tool invocations
Mojo_I2C.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L../../Mojo_I2C_bsp/microblaze_mcs/lib -mlittle-endian -mcpu=v8.40.a -mxl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "Mojo_I2C.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

Mojo_I2C.elf.size: Mojo_I2C.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size Mojo_I2C.elf  |tee "Mojo_I2C.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

Mojo_I2C.elf.elfcheck: Mojo_I2C.elf
	@echo 'Invoking: Xilinx ELF Check'
	elfcheck Mojo_I2C.elf -hw ../../Mojo_HW/system.xml -pe microblaze_mcs  |tee "Mojo_I2C.elf.elfcheck"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) Mojo_I2C.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
