# Copyright:
#   Stefan Wagner 2023
#   Bogdan Ionescu 2025

# Files and Folders
TARGET  := firmware
SOURCE  := src
LIB     := lib
BIN     := bin

# Library source files to compile (pick one variant per peripheral to avoid conflicts)
LIBFILES := $(LIB)/debug_serial.c 

# Microcontroller Settings
F_CPU   := 48000000
MODEL   := py32f030x6
LDSCRIPT:= ld/$(MODEL).ld
CPUARCH := -mcpu=cortex-m0plus -mthumb

# Toolchain
PREFIX  := arm-none-eabi
CC      := $(PREFIX)-gcc
OBJCOPY := $(PREFIX)-objcopy
OBJDUMP := $(PREFIX)-objdump
OBJSIZE := $(PREFIX)-size

# Compiler Flags
CFLAGS  := -ggdb -Os $(CPUARCH) -DF_CPU=$(F_CPU) -I$(SOURCE) -I$(LIB) -I.
CFLAGS  += -fdata-sections -ffunction-sections -fno-builtin -fno-common -Wall -D$(MODEL)
LDFLAGS := -T$(LDSCRIPT) #-static -lc -lm -nostartfiles -nostdlib -lgcc
LDFLAGS += -Wl,--gc-sections,--build-id=none --specs=nano.specs --specs=nosys.specs -Wl,--print-memory-usage
CFILES  := $(wildcard ./*.c) $(wildcard $(SOURCE)/*.c) $(wildcard $(SOURCE)/*.S) $(LIBFILES)
HFILES  := $(wildcard ./*.h) $(wildcard $(SOURCE)/*.h) $(wildcard $(LIB)/*.h)

all:	$(BIN)/$(TARGET).lst $(BIN)/$(TARGET).map $(BIN)/$(TARGET).bin $(BIN)/$(TARGET).hex $(BIN)/$(TARGET).asm

$(BIN):
	@mkdir -p $(BIN)

$(BIN)/$(TARGET).elf: $(CFILES) | $(HFILES) Makefile $(LDSCRIPT)
	@echo "Building $(BIN)/$(TARGET).elf ..."
	@mkdir -p $(BIN)
	@$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)

$(BIN)/$(TARGET).lst: $(BIN)/$(TARGET).elf
	@echo "Building $(BIN)/$(TARGET).lst ..."
	@$(OBJDUMP) -S $^ > $(BIN)/$(TARGET).lst

$(BIN)/$(TARGET).map: $(BIN)/$(TARGET).elf
	@echo "Building $(BIN)/$(TARGET).map ..."
	@$(OBJDUMP) -t $^ > $(BIN)/$(TARGET).map

$(BIN)/$(TARGET).bin: $(BIN)/$(TARGET).elf
	@echo "Building $(BIN)/$(TARGET).bin ..."
	@$(OBJCOPY) -O binary $< $(BIN)/$(TARGET).bin

$(BIN)/$(TARGET).hex: $(BIN)/$(TARGET).elf
	@echo "Building $(BIN)/$(TARGET).hex ..."
	@$(OBJCOPY) -O ihex $< $(BIN)/$(TARGET).hex

$(BIN)/$(TARGET).asm: $(BIN)/$(TARGET).elf
	@echo "Disassembling to $(BIN)/$(TARGET).asm ..."
	@$(OBJDUMP) -d $(BIN)/$(TARGET).elf > $(BIN)/$(TARGET).asm


$(BIN)/$(TARGET)_dump.bin:
	pyocd cmd -t $(MODEL) -f 1m -c reset halt -c savemem 0x08000000 0x6000 $(BIN)/$(TARGET)_dump.bin

elf:	$(BIN)/$(TARGET).elf

bin:	$(BIN)/$(TARGET).bin

hex:	$(BIN)/$(TARGET).hex

asm:	$(BIN)/$(TARGET).asm

dump: $(BIN)/$(TARGET)_dump.bin

flash:	all
	@echo "Uploading to MCU ..."
	@pyocd load -t $(MODEL) -f 1m $(BIN)/$(TARGET).bin

connect:
	@pyocd gdb -S -O semihost_console_type=console -t $(MODEL) -f 1m --elf $(BIN)/$(TARGET).elf

monitor:
	@pyocd gdb -S -O semihost_console_type=console -t $(MODEL) -f 1m --elf $(BIN)/$(TARGET).elf & \
	PYOCD_PID=$$! ; \
	sleep 1 ; \
	$(PREFIX)-gdb $(BIN)/$(TARGET).elf \
		-ex "target remote localhost:3333" \
		-ex "load" \
		-ex "c" ; \
	kill $$PYOCD_PID 2>/dev/null ; true

debug:
	@$(PREFIX)-gdb $(BIN)/$(TARGET).elf \
		-ex "target remote localhost:3333" \
		-ex "monitor reset halt"

compile_commands:
	@python3 -c "\
import json, os; \
root = os.getcwd(); \
flags = '-I$(SOURCE) -I$(LIB) -DF_CPU=$(F_CPU) -D$(MODEL) $(CPUARCH) -ggdb -Os -fdata-sections -ffunction-sections -fno-builtin -fno-common -Wall'; \
files = '$(CFILES)'.split(); \
entries = [{'directory': root, 'file': os.path.join(root, f), 'command': '$(CC) ' + flags + ' -c ' + f} for f in files]; \
fp = open('compile_commands.json', 'w'); json.dump(entries, fp, indent=2); fp.write('\n')"
	@echo "Generated compile_commands.json"

size:	$(BIN)/$(TARGET).elf
	@python3 size_analysis.py

clean:
	@echo "Cleaning all up ..."
	rm -rf $(BIN)

