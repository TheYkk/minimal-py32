# PY32F030 USB Virtual COM Port (CDC) Project

A complete USB CDC (Virtual COM Port) implementation for PY32F030 microcontroller using software USB.

## Features

- **48 MHz System Clock** from internal HSI + PLL (no external crystal required)
- **USB CDC Class** - Virtual COM Port for serial communication over USB
- **WebSerial Compatible** - Works with WebUSB/WebSerial APIs
- **Software USB** - Bit-banged implementation for devices without hardware USB
- **Compact Code** - Optimized for small flash size

## Hardware Requirements

### Minimum Setup
- PY32F030x6 or PY32F030x8 microcontroller
- USB connector with series resistors and pull-up
- 3.3V or 5V power supply

### Pin Configuration
```
PA0  -> USB D+ through ~22Ω series resistor
PA1  -> USB D- through ~22Ω series resistor
PA1  -> Pull-up to 3.3V with 1.5kΩ (low-speed attach)
PB1  -> LED (optional, for status)
```

## Building

### Prerequisites
```bash
# Install ARM GCC toolchain
sudo apt-get install gcc-arm-none-eabi libnewlib-arm-none-eabi

# Install PyOCD (for flashing)
pip install pyocd
```

### Build
```bash
# Clone and build
make clean
make
```

### Flash
```bash
# Flash using PyOCD
make flash

# Or with J-Link
make flash FLASH_PROGRM=jlink
```

## Usage

1. Connect the device to a USB host
2. The device will enumerate as a Virtual COM Port
3. Use any serial terminal (e.g., PuTTY, screen) to communicate
4. For WebSerial, use the WebUSB API in a Chrome-based browser

### WebSerial Example
```javascript
async function connect() {
    const port = await navigator.serial.requestPort();
    await port.open({ baudRate: 115200 });
    
    const reader = port.readable.getReader();
    while (true) {
        const { value, done } = await reader.read();
        if (done) break;
        console.log(new TextDecoder().decode(value));
    }
}
```

## Project Structure

```
├── Makefile              # Build configuration
├── src/
│   ├── main.c           # Main application
│   ├── system.c         # System initialization
│   ├── system.h         # System functions
│   └── py32f0xx.h       # Register definitions
├── lib/
│   ├── usb.h            # USB core definitions
│   ├── usb_soft.c       # Software USB implementation
│   ├── usb_cdc.h        # CDC class definitions
│   └── usb_cdc.c        # CDC implementation
└── ld/
    └── py32f030x6.ld   # Linker script
```

## Technical Notes

### Clock Configuration
The project uses internal HSI oscillator at 24MHz multiplied by PLL to achieve 48MHz system clock. This eliminates the need for an external crystal.

### USB Implementation
Since PY32F030 may not have a built-in USB peripheral in all variants, this implementation uses software USB (bit-banging). For better performance, consider:
- Using a microcontroller with hardware USB
- Implementing a more complete USB stack
- Using TinyUSB library

### Performance
The current software USB implementation is designed for:
- Low-speed (1.5 Mbps) or Full-speed (12 Mbps) operation
- Basic CDC communication
- Simple echo test applications

For production use, consider implementing proper USB timing or using hardware USB.

## References

- [PY32F030 Datasheet](https://download.py32.org/Datasheet/en/PY32F030_Datasheet_V1.8.pdf)
- [LemcuUSB](https://github.com/lemcu/LemcUSB) - Software USB for Cortex-M0+
- [Grainuum](https://github.com/xobs/grainuum) - Software USB stack
- [NUC126usb](https://github.com/majbthrd/NUC126usb) - Reference USB implementation
