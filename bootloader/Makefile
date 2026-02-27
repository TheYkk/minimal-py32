# Makefile for PY32F030 IAP Bootloader
# Compiles the bootloader firmware and generates binary for disassembly

TARGET = py32f030_bootloader
BUILD_DIR = build

# ARM GCC Toolchain
CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy
OBJDUMP = arm-none-eabi-objdump
SIZE = arm-none-eabi-size

# MCU settings - PY32F030x6 (Cortex-M0+)
MCU = -mcpu=cortex-m0plus -mthumb

# Source directories
IAP_DIR = /tmp/IAP_APP_Fireware/PY32F0xx_IAP_APP_Firmware
PROJ_DIR = $(IAP_DIR)/Projects/PY32F030xx_IAP_LL
DRIVERS_DIR = $(IAP_DIR)/Drivers

# Source files
C_SOURCES = \
  $(PROJ_DIR)/Src/main.c \
  $(PROJ_DIR)/Src/bootloader.c \
  $(PROJ_DIR)/Src/flash.c \
  $(PROJ_DIR)/Src/usart.c \
  $(PROJ_DIR)/Src/wdg.c \
  $(PROJ_DIR)/Src/py32f0xx_it.c \
  $(PROJ_DIR)/Src/system_py32f0xx.c \
  $(DRIVERS_DIR)/BSP/PY32F030xx_Start_Kit/py32f030xx_ll_Start_Kit.c \
  $(DRIVERS_DIR)/PY32F0xx_HAL_Driver/Src/py32f0xx_ll_rcc.c \
  $(DRIVERS_DIR)/PY32F0xx_HAL_Driver/Src/py32f0xx_ll_utils.c

# Assembly sources
ASM_SOURCES = \
  $(DRIVERS_DIR)/CMSIS/Device/PY32F0xx/Source/arm/startup_py32f030x6.s

# Include paths
C_INCLUDES = \
  -I$(PROJ_DIR)/Inc \
  -I$(DRIVERS_DIR)/CMSIS/Include \
  -I$(DRIVERS_DIR)/CMSIS/Device/PY32F0xx/Include \
  -I$(DRIVERS_DIR)/PY32F0xx_HAL_Driver/Inc \
  -I$(DRIVERS_DIR)/BSP/PY32F030xx_Start_Kit

# Defines
C_DEFS = \
  -DPY32F030x6 \
  -DUSE_FULL_LL_DRIVER

# Compiler flags
CFLAGS = $(MCU) $(C_DEFS) $(C_INCLUDES) -O2 -Wall -fdata-sections -ffunction-sections
ASFLAGS = $(MCU) -x assembler-with-cpp

# Linker flags
LDSCRIPT = $(IAP_DIR)/Packs/Puya.PY32F0xx_DFP.1.2.8/CMSIS/Flash/PY32F030x6.ld
LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) -Wl,--gc-sections -Wl,-Map=$(BUILD_DIR)/$(TARGET).map

# Build objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))

vpath %.c $(sort $(dir $(C_SOURCES)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).bin $(BUILD_DIR)/$(TARGET).hex

$(BUILD_DIR)/%.o: %.c | $(BUILD_DIR)
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.s | $(BUILD_DIR)
	$(AS) -c $(ASFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS)
	$(LD) $(OBJECTS) $(LDFLAGS) -o $@
	$(SIZE) $@

$(BUILD_DIR)/$(TARGET).bin: $(BUILD_DIR)/$(TARGET).elf
	$(OBJCOPY) -O binary -S $< $@

$(BUILD_DIR)/$(TARGET).hex: $(BUILD_DIR)/$(TARGET).elf
	$(OBJCOPY) -O ihex $< $@

$(BUILD_DIR):
	mkdir -p $@

disasm: $(BUILD_DIR)/$(TARGET).elf
	$(OBJDUMP) -d -S --demangle $(BUILD_DIR)/$(TARGET).elf > $(BUILD_DIR)/$(TARGET).disasm
	@echo "Disassembly written to $(BUILD_DIR)/$(TARGET).disasm"

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean disasm
