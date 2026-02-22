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
1. Verify with `pyocd list --targets` (look for `py32f030x6` with source `pack`)

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
