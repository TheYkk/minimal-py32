# Minimal Puya PY32 development environment

## Requirements:
 - make
 - arm-none-eabi-*
 - pyOCD with PY32 packs installed

## Install custom PY32 pack for pyOCD:
The PY32 pack is not in the online CMSIS pack index, so `pyocd pack find` will not find it.
Instead, the local pack file is referenced directly in `pyocd.yaml`.

1. Download the latest PY32 pack from https://www.keil.arm.com/packs/py32f0xx_dfp-puya/devices/
1. Place the `.pack` file in the project root
1. Update the pack path in `pyocd.yaml` if the version differs
1. Verify with `pyocd list --targets` and select the target matching `MODEL` (for example, `py32f030x6`).

## Commands:
 - `make` - build everything
 - `make MODEL=py32f030x8` - build for another supported device (the linker script and family macro are selected automatically)
 - `make flash` - flash firmware
 - `make connect` - connect to target with pyOCD
 - `make debug` - start gdb (must call connect in a different window first)
 - `make monitor` - open console via ARM semihosting
 - `make size` - report memory usage using the selected linker script
 - `make dump DUMP_SIZE=0x8000` - read the selected flash range back from the target

## Output and peripheral notes:
 - The `DEBUG_*` calls in the example use the configured USART TX pin.
 - The `LOG_*` calls use newlib stdout/stderr and therefore use the semihosting console when a debugger is connected; they are not sent to the debug UART.
 - The blocking I2C drivers expose `I2C_getStatus()` so callers can distinguish a timeout, NACK, or bus error. The DMA drivers return from `I2C_writeBuffer()` when the transfer starts; call `I2C_waitComplete()` before checking status or starting another transfer.
 - The DMA UART receive drivers expose `UART_overflowed()` when incoming data overwrote unread bytes; clear it with `UART_clearOverflow()` after handling the loss.

## Usage:
Set the desired microcontroller in the Makefile, or override it on the command line with `make MODEL=py32f030x6`.

You can copy, or create a symlink to, any file in the project `lib/` directory into `src/`.

For anything else, use the reference manual.

## Acknowledgements:
 - [wagiminator](https://github.com/wagiminator/MCU-Templates)
 - [ErichStyger](https://github.com/ErichStyger/McuLib/blob/master/src/McuSemihost.h)
