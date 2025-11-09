# Minimal Puya PY32 development environment

## Requirements:
 - make
 - arm-none-eabi-*
 - pyOCD with PY32 packs installed

## Install custom PY32 pack for pyOCD:
1. Download the latest PY32 pack from https://www.keil.arm.com/packs/py32f0xx_dfp-puya/devices/
1. run `pack-manager add-packs Puya.PY32F0xx_DFP.X.X.X.pack`
1. run `pyocd pack update`
1. run `pyocd pack find py32f002`

## Commands:
 - `make` - build everything
 - `make flash` - flash firmware
 - `make connect` - connect to target with pyOCD
 - `make debug` - start gdb (must call connect in a different window first)
 - `make monitor` - open console via ARM semihosting

## Usage:
Set the desired microcontroller in the Makefile.

You can copy, or create a symlink to, any file in `/lib` into `/src`.

For anything else, use the reference manual.

## Acknowledgements:
 - [wagiminator](https://github.com/wagiminator/MCU-Templates)
 - [ErichStyger](https://github.com/ErichStyger/McuLib/blob/master/src/McuSemihost.h)
