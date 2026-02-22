PUYA

# PY32F030 Datasheet

32-bit ARM® Cortex®-M0+ Microcontroller

![img-0.jpeg](img-0.jpeg)

Puya Semiconductor (Shanghai) Co., Ltd

PY32F030 Datasheet

PUYA

PY32F030 Series

32-bit ARM® Cortex®-M0+ Microcontroller

# Features

- Core
- 32-bit ARM® Cortex® - M0+ CPU
- Up to 48 MHz operating frequency
- Memories
- Maximum 64 Kbytes of flash memory
- Up to 8 Kbytes SRAM
- Clock system
- Internal 4/8/16/22.12/24 MHz RC Oscillator (HSI)
- Internal 32.768 kHz RC oscillator (LSI)
- 4 to 32 MHz crystal oscillator (HSE)
- 32.768 kHz low speed crystal oscillator (LSE)
- PLL (supports 2 octaves for HSI or HSE)
- Power management and reset
- Operating voltage(x6 version): 1.7 V to 5.5 V
- Operating voltage(x7 version): 2.0 V to 5.5 V
- Low power modes: Sleep and Stop
- Power-on/Power-down reset (POR/PDR)
- Brownout Detect Reset (BOR)
- Programmable Voltage Detection (PVD)
- General purpose input and output (I/O)
- Up to 30 I/Os, all available as external interrupts
- Driver current 8 mA
- 4 GPIOs support ultra high sink current, configurable to 80 mA/ 60 mA/ 40 mA/ 20 mA
- 3-channel DMA controller
- 1 x 12-bit ADC
- Supports up to 10 external input channels
- Input voltage conversion range: 0 ~ Vcc

- Timers
- A 16 bits advanced control timer (TIM1)
- 4 general purpose 16-bit timers (TIM3/TIM14/TIM16/TIM17)
- A low-power timer (LPTIM), supports wake-up from stop mode
- An Independent Watchdog Timer (IWDG)
- A Window Watchdog Timer (WWDG)
- A SysTick timer
- A IRTIM
- RTC
- Communication Interfaces
- Two Serial Peripheral Interface (SPI)
- Two Universal Synchronous / Asynchronous Transceivers (USARTs) with automatic baudrate detection
- An I²C interface, supports standard mode (100 kHz), Fast mode (400 kHz), supports 7-bit addressing mode
- Support 4-digit 7-segment common-cathode LED digital tube
- Cyclic scanning of 1, 2, 3, 4 digits
- Hardware CRC-32 module
- Two comparators
- Unique UID
- Serial wire debug (SWD)
- Operating temp.(x6 version): -40 to 85°C
- Operating temp.(x7 version): -40 to 105°C
- Package: LQFP32,QFN32(5*5),QFN32(4*4),QFN24, SSOP24,QFN20,TSSOP20,DFN8(1.5*1.5)

2of 81

PY32F030 Datasheet

# Contents

Features ... 2
1. Introduction ... 5
2. Functional Overview ... 17
2.1. Arm®Cortex®-M0+ core ... 17
2.2. Memories ... 17
2.3. Boot mode ... 17
2.4. Clock System ... 17
2.5. Power management ... 19
2.5.1. Power block diagram ... 19
2.5.2. Power monitoring ... 19
2.5.3. Voltage regulator ... 20
2.5.4. Low power mode ... 21
2.6. Reset ... 21
2.6.1. Power reset ... 21
2.6.2. System reset ... 21
2.7. General-purpose input and output (GPIOs) ... 21
2.8. DMA ... 21
2.9. Interrupt ... 21
2.9.1. Interrupt controller NVIC ... 21
2.9.2. Extended interrupt/event controller (EXTI) ... 22
2.10. Analog to digital converter (ADC) ... 22
2.11. Comparators (COMP) ... 22
2.12. Timer ... 22
2.12.1. Advanced timer ... 23
2.12.2. General-purpose timer ... 23
2.12.3. Low power timer (LPTIM) ... 24
2.12.4. IWDG ... 24
2.12.5. WWDG ... 24
2.12.6. SysTick timer ... 24
2.13. Real time clock (RTC) ... 24
2.14. I²C interface ... 24
2.15. Universal synchronous asynchronous receiver/ transmitter (USART) ... 25
2.16. Serial peripheral interface (SPI) ... 26
2.17. SWD ... 26
3. Pin Configuration ... 27
3.1. Port A multiplexing function mapping ... 51
3.2. Port B multiplexing function mapping ... 52
3.3. Port F multiplexing function mapping ... 52
4. Memory Map ... 53

3of 81

PY32F030 Datasheet

5. Electrical Characteristics 57

5.1. Test conditions 57

5.1.1. Min and Max 57
5.1.2. Typical value 57

5.2. Absolute maximum ratings 57
5.3. Operating conditions 58

5.3.1. General operating conditions 58
5.3.2. Power on and down operating conditions 58
5.3.3. Embedded reset and LVD module features 58
5.3.4. Operating current characteristics 59
5.3.5. Low power mode wake-up time 60
5.3.6. External clock source characteristics 61
5.3.7. Internal high frequency clock source HSI characteristics 63
5.3.8. Internal low frequency clock source LSI characteristics 63
5.3.9. Phase-locked loop PLL characteristics 64
5.3.10. Memory characteristics 64
5.3.11. EFT characteristics 64
5.3.12. ESD &amp; LU Characteristics 64
5.3.13. Port characteristics 65
5.3.14. NRST pin characteristics 65
5.3.15. ADC characteristics 66
5.3.16. Comparator characteristics 66
5.3.17. Temperature sensor characteristics 67
5.3.18. Built-in reference voltage characteristics 67
5.3.19. Timer features 67
5.3.20. Communication port characteristics 68

6. Package Information 72

6.1. LQFP32 72
6.2. QFN32(5*5) 73
6.3. QFN32(4*4) 74
6.4. QFN24 75
6.5. SSOP24 76
6.6. QFN20 77
6.7. TSSOP20 78
6.8. DFN8(1.5*1.5) 79

7. Ordering Information 80
8. Version History 81

4of 81

PY32F030 Datasheet

# 1. Introduction

PY32F030 series microcontrollers are MCUs with high performance 32-bit ARM® Cortex® -M0 + core, wide voltage operating range. It has embedded up to 64 KBytes flash and 8 KBytes SRAM memory, a maximum operating frequency of 48 MHz, and contains various products in different package types. The chip integrates multi-channel I²C, SPI, USART and other communication peripherals, one channel 12 bits ADC, five 16 bits timers, and two-channel comparators.

PY32F030 series microcontrollers are -40 °C ~ 85 °C and -40 °C ~ 105 °C, the operating voltage range is 1.7 V ~ 5.5 V and 2.0 V ~ 5.5 V. The chip provides sleep and stop low-power operating modes from meeting different low-power applications.

The PY32F030 series of microcontrollers are suitable for various application scenarios, such as controllers, portable devices, PC peripherals, gaming and GPS platforms, industrial applications.

5 of 81

PY32F030 Datasheet

Table 1-1 PY32F030x6 series LQFP32 product features and peripheral counts

|  Peripherals |   | PY32F030 K18T6 | PY32F030 K17T6 | PY32F030 K16T6 | PY32F030 K14T6 | PY32F030 K28T6 | PY32F030 K28T6-E | PY32F030 K27T6 | PY32F030 K26T6 | PY32F030 K24T6  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  Flash(Kbytes) |   | 64 | 48 | 32 | 16 | 64 | 64 | 48 | 32 | 16  |
|  SRAM(Kbytes) |   | 8 | 6 | 4 | 2 | 8 | 8 | 6 | 4 | 2  |
|  Timers | Advanced | 1 (16-bit)  |   |   |   |   |   |   |   |   |
|   |  General pupose | 4 (16-bit)  |   |   |   |   |   |   |   |   |
|   |  low power | 1  |   |   |   |   |   |   |   |   |
|   |  RTC | 1  |   |   |   |   |   |   |   |   |
|   |  SysTick | 2  |   |   |   |   |   |   |   |   |
|  Comm. interfaces | SPI | 2  |   |   |   |   |   |   |   |   |
|   |  I2C | 1  |   |   |   |   |   |   |   |   |
|   |  USART | 2  |   |   |   |   |   |   |   |   |
|  DMA |   | 3 ch  |   |   |   |   |   |   |   |   |
|  RTC |   | Yes  |   |   |   |   |   |   |   |   |
|  GPIOs |   | 28 |   |   |   | 30  |   |   |   |   |
|  12-bit ADC (external + internal) |   | 10+2  |   |   |   |   |   |   |   |   |
|  Comparators |   | 2  |   |   |   |   |   |   |   |   |
|  Max. CPU frequency |   | 48 MHz  |   |   |   |   |   |   |   |   |
|  Operating Voltage |   | 1.7~5.5 V  |   |   |   |   |   |   |   |   |
|  Operating Temperature |   | -40 ~ 85 °C  |   |   |   |   |   |   |   |   |
|  Package |   | LQFP32  |   |   |   |   |   |   |   |   |

6of 81

PY32F030 Datasheet

Table 1-2 PY32F030x6 series QFN32 product features and peripheral counts

|  Peripherals |   | PY32F03
0K18U6 | PY32F03
0K17U6 | PY32F03
0K16U6 | PY32F03
0K14U6 | PY32F03
0K28U6 | PY32F03
0K28U6-E | PY32F03
0K27U6 | PY32F03
0K26U6 | PY32F03
0K24U6 | PY32F03
0K38U6-E | PY32F03
0K48U6-E | PY32F03
0K46U6-E  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  Flash (Kbytes) |   | 64 | 48 | 32 | 16 | 64 | 64 | 48 | 32 | 16 | 64 | 64 | 32  |
|  SRAM (Kbytes) |   | 8 | 6 | 4 | 2 | 8 | 8 | 6 | 4 | 2 | 8 | 8 | 8  |
|  Timers | Advanced | 1 (16-bit)  |   |   |   |   |   |   |   |   |   |   |   |
|   |  General
pupose | 4 (16-bit)  |   |   |   |   |   |   |   |   |   |   |   |
|   |  low power | 1  |   |   |   |   |   |   |   |   |   |   |   |
|   |  RTC | 1  |   |   |   |   |   |   |   |   |   |   |   |
|   |  SysTick | 2  |   |   |   |   |   |   |   |   |   |   |   |
|  Comm.
interfaces | SPI | 2  |   |   |   |   |   |   |   |   |   |   |   |
|   |  I²C | 1  |   |   |   |   |   |   |   |   |   |   |   |
|   |  USART | 2  |   |   |   |   |   |   |   |   |   |   |   |
|  DMA |   | 3 ch  |   |   |   |   |   |   |   |   |   |   |   |
|  RTC |   | Yes  |   |   |   |   |   |   |   |   |   |   |   |
|  GPIOs |   | 28 |   |   |   | 30  |   |   |   |   |   |   |   |
|  12-bit ADC( external + internal) |   | 10+2  |   |   |   |   |   |   |   |   |   |   |   |
|  Comparators |   | 2  |   |   |   |   |   |   |   |   |   |   |   |
|  Max. CPU fre-
quency |   | 48 MHz  |   |   |   |   |   |   |   |   |   |   |   |
|  Operating Voltage |   | 1.7~5.5 V  |   |   |   |   |   |   |   |   |   |   |   |
|  Operating Temp. |   | -40 ~ 85 °C  |   |   |   |   |   |   |   |   |   |   |   |
|  Package |   | QFN32(5*5) |   |   |   |   |   |   |   |   |   | QFN32(4*4)  |   |

7of 81

PY32F030 Datasheet

Table 1-3 PY32F030x6 series QFN24/SSOP24 product features and peripheral counts

|  Peripherals |   | PY32F030E18U6-E | PY32F030E16U6-E | PY32F030E18M6 | PY32F030E26M6 | PY32F030E26M6-E  |
| --- | --- | --- | --- | --- | --- | --- |
|  Flash (Kbyte) |   | 64 | 32 | 64 | 32 | 32  |
|  SRAM (Kbyte) |   | 8 | 4 | 8 | 4 | 4  |
|  Timers | Advanced | 1 (16-bit)  |   |   |   |   |
|   |  General pupose | 4 (16-bit)  |   |   |   |   |
|   |  low power | 1  |   |   |   |   |
|   |  RTC | 1  |   |   |   |   |
|   |  SysTick | 2  |   |   |   |   |
|  Comm. interfaces | SPI | 2  |   |   |   |   |
|   |  I²C | 1  |   |   |   |   |
|   |  USART | 2  |   |   |   |   |
|  DMA |   | 3 ch  |   |   |   |   |
|  RTC |   | Yes  |   |   |   |   |
|  GPIOs |   | 23 |   | 22  |   |   |
|  12-bit ADC (external + internal) |   | 10+2  |   |   |   |   |
|  Comparators |   | 2  |   |   |   |   |
|  Max. CPU frequency |   | 48 MHz  |   |   |   |   |
|  Operating Voltage |   | 1.7 ~ 5.5 V  |   |   |   |   |
|  Operating Temperature |   | -40 ~ 85 °C  |   |   |   |   |
|  Package |   | QFN24 |   | SSOP24  |   |   |

8 of 81

PY32F030 Datasheet

Table 1-4 PY32F030x6 series QFN20 product features and peripheral counts

|  Peripherals |   | PY32F030 F18U6 | PY32F030 F17U6 | PY32F030 F16U6 | PY32F030 F28U6 | PY32F030 F28U6-E | PY32F030 F27U6 | PY32F030 F26U6 | PY32F030 F36U6  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  Flash (Kbytes) |   | 64 | 48 | 32 | 64 | 64 | 48 | 32 | 32  |
|  SRAM (Kbytes) |   | 8 | 6 | 4 | 8 | 8 | 6 | 4 | 4  |
|  Timers | Advanced | 1 (16-bit)  |   |   |   |   |   |   |   |
|   |  General pupose | 4 (16-bit)  |   |   |   |   |   |   |   |
|   |  low power | 1  |   |   |   |   |   |   |   |
|   |  RTC | 1  |   |   |   |   |   |   |   |
|   |  SysTick | 2  |   |   |   |   |   |   |   |
|  Comm. interfaces | SPI | 2  |   |   |   |   |   |   |   |
|   |  I²C | 1  |   |   |   |   |   |   |   |
|   |  USART | 2  |   |   |   |   |   |   |   |
|  DMA |   | 3 ch  |   |   |   |   |   |   |   |
|  RTC |   | Yes  |   |   |   |   |   |   |   |
|  GPIOs |   | 18 |   |   | 18 |   |   |   | 17  |
|  12-bit ADC (external + internal) |   | 5+2 |   |   | 8+2 |   |   |   | 5+2  |
|  Comparators |   | 2  |   |   |   |   |   |   |   |
|  Max. CPU frequency |   | 48 MHz  |   |   |   |   |   |   |   |
|  Operating Voltage |   | 1.7~5.5 V  |   |   |   |   |   |   |   |
|  Operating Temperature |   | -40 ~ 85 °C  |   |   |   |   |   |   |   |
|  Package |   | QFN20  |   |   |   |   |   |   |   |

9of81

PY32F030 Datasheet

Table 1-5 PY32F030x6 series TSSOP20 product features and peripheral counts

|  Peripherals |   | PY32F030F18
P6 | PY32F030F17
P6 | PY32F030F16
P6 | PY32F030F28
P6 | PY32F030F27
P6 | PY32F030F26
P6 | PY32F030F38
P6 | PY32F030F46
P6  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  Flash (Kbytes) |   | 64 | 48 | 32 | 64 | 48 | 32 | 64 | 32  |
|  SRAM (Kbytes) |   | 8 | 6 | 4 | 8 | 6 | 4 | 8 | 4  |
|  Timers | Advanced | 1 (16-bit)  |   |   |   |   |   |   |   |
|   |  General pupose | 4 (16-bit)  |   |   |   |   |   |   |   |
|   |  low power | 1  |   |   |   |   |   |   |   |
|   |  RTC | 1  |   |   |   |   |   |   |   |
|   |  SysTick | 2  |   |   |   |   |   |   |   |
|  Comm. interfaces | SPI | 2  |   |   |   |   |   |   |   |
|   |  I²C | 1  |   |   |   |   |   |   |   |
|   |  USART | 2  |   |   |   |   |   |   |   |
|  DMA |   | 3 ch  |   |   |   |   |   |   |   |
|  RTC |   | Yes  |   |   |   |   |   |   |   |
|  GPIOs |   | 18  |   |   |   |   |   |   |   |
|  12-bit ADC
(external + internal) |   | 2+2 |   |   | 8+2 |   |   | 9+2 | 8+2  |
|  Comparators |   | 2  |   |   |   |   |   |   |   |
|  Max. CPU frequency |   | 48 MHz  |   |   |   |   |   |   |   |
|  Operating Voltage |   | 1.7~5.5 V  |   |   |   |   |   |   |   |
|  Operating Temperature |   | -40 ~ 85 °C  |   |   |   |   |   |   |   |
|  Package |   | TSSOP20  |   |   |   |   |   |   |   |

10of 81

PY32F030 Datasheet

Table 1-6 PY32F030x6 series DFN8 product features and peripheral counts

|  Peripheral |   | PY32F030L14D6 | PY32F030L16D6  |
| --- | --- | --- | --- |
|  Flash (Kbyte) |   | 16 | 32  |
|  SRAM (Kbyte) |   | 2 | 4  |
|  Timers | Advanced | 1 (16-bit)  |   |
|   |  General pupose | 4 (16-bit)  |   |
|   |  low power | 1  |   |
|   |  SysTick | 1  |   |
|   |  Watchdog | 2  |   |
|  Comm. interfaces | SPI | 1  |   |
|   |  I2C | 1  |   |
|   |  USART | 1  |   |
|  DMA |   | 3ch  |   |
|  RTC |   | Yes  |   |
|  GPIOs |   | 7  |   |
|  12-bit ADC (external + internal) |   | 4+2  |   |
|  Comparators |   | 2  |   |
|  Max. CPU frequency |   | 48 MHz  |   |
|  Operating Voltage |   | 1.7~5.5 V  |   |
|  Operating Temperature |   | -40 ~ 85 °C  |   |
|  Package |   | DFN8(1.5*1.5)  |   |

11of 81

PY32F030 Datasheet

Table 1-7 PY32F030x7 series LQFP32 product features and peripheral counts

|  Peripheral |   | PY32F030K18 T7 | PY32F030K17 T7 | PY32F030K16 T7 | PY32F030K14 T7 | PY32F030K28 T7 | PY32F030K27 T7 | PY32F030K26 T7 | PY32F030K24 T7  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  Flash (Kbyte) |   | 64 | 48 | 32 | 16 | 64 | 48 | 32 | 16  |
|  SRAM (Kbyte) |   | 8 | 6 | 4 | 2 | 8 | 6 | 4 | 2  |
|  Timers | Advanced | 1 (16-bit)  |   |   |   |   |   |   |   |
|   |  General pupose | 4 (16-bit)  |   |   |   |   |   |   |   |
|   |  low power | 1  |   |   |   |   |   |   |   |
|   |  SysTick | 1  |   |   |   |   |   |   |   |
|   |  Watchdog | 2  |   |   |   |   |   |   |   |
|  Comm. interfaces | SPI | 2  |   |   |   |   |   |   |   |
|   |  I2C | 1  |   |   |   |   |   |   |   |
|   |  USART | 2  |   |   |   |   |   |   |   |
|  DMA |   | 3ch  |   |   |   |   |   |   |   |
|  RTC |   | Yes  |   |   |   |   |   |   |   |
|  GPIOs |   | 28 |   |   |   | 30  |   |   |   |
|  12-bit ADC (external + internal) |   | 10+2  |   |   |   |   |   |   |   |
|  Comparators |   | 2  |   |   |   |   |   |   |   |
|  Max. CPU frequency |   | 48 MHz  |   |   |   |   |   |   |   |
|  Operating Voltage |   | 2.0 ~ 5.5 V  |   |   |   |   |   |   |   |
|  Operating Temp. |   | -40 ~ 105 °C  |   |   |   |   |   |   |   |
|  Package |   | LQFP32  |   |   |   |   |   |   |   |

12of 81

PY32F030 Datasheet

Table 1-8 PY32F030x7 series QFN32 product features and peripheral counts

|  Peripheral |   | PY32F030K 18U7 | PY32F030K 17U7 | PY32F030K 16U7 | PY32F030K 14U7 | PY32F030K 28U7 | PY32F030K 27U7 | PY32F030K 26U7 | PY32F030K 24U7 | PY32F030E 18M7  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  Flash (Kbyte) |   | 64 | 48 | 32 | 16 | 64 | 48 | 32 | 16 | 64  |
|  SRAM (Kbyte) |   | 8 | 6 | 4 | 2 | 8 | 6 | 4 | 2 | 8  |
|  Timers | Advanced | 1 (16-bit)  |   |   |   |   |   |   |   |   |
|   |  General pupose | 4 (16-bit)  |   |   |   |   |   |   |   |   |
|   |  low power | 1  |   |   |   |   |   |   |   |   |
|   |  SysTick | 1  |   |   |   |   |   |   |   |   |
|   |  Watchdog | 2  |   |   |   |   |   |   |   |   |
|  Comm. interfaces | SPI | 2  |   |   |   |   |   |   |   |   |
|   |  I2C | 1  |   |   |   |   |   |   |   |   |
|   |  USART | 2  |   |   |   |   |   |   |   |   |
|  DMA |   | 3ch  |   |   |   |   |   |   |   |   |
|  RTC |   | Yes  |   |   |   |   |   |   |   |   |
|  GPIOs |   | 28 |   |   |   | 30 |   |   |   | 22  |
|  12-bit ADC (external + internal) |   | 10+2  |   |   |   |   |   |   |   |   |
|  Comparators |   | 2  |   |   |   |   |   |   |   |   |
|  Max. CPU frequency |   | 48 MHz  |   |   |   |   |   |   |   |   |
|  Operating Voltage |   | 2.0 ~ 5.5 V  |   |   |   |   |   |   |   |   |
|  Operating Temp. |   | -40 ~ 105 °C  |   |   |   |   |   |   |   |   |
|  Package |   | QFN32 |   |   |   |   |   |   |   | SSOP24  |

13of 81

PY32F030 Datasheet

Table 1-9 PY32F030x7 series QFN20product features and peripheral counts

|  外设 |   | PY32F030F18U7 | PY32F030F17U7 | PY32F030F16U7 | PY32F030F28U7 | PY32F030F27U7 | PY32F030F26U7  |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  Flash (Kbyte) |   | 64 | 48 | 32 | 64 | 48 | 32  |
|  SRAM (Kbyte) |   | 8 | 6 | 4 | 8 | 6 | 4  |
|  Timers | Advanced | 1 (16-bit)  |   |   |   |   |   |
|   |  General pupose | 4 (16-bit)  |   |   |   |   |   |
|   |  low power | 1  |   |   |   |   |   |
|   |  SysTick | 1  |   |   |   |   |   |
|   |  Watchdog | 2  |   |   |   |   |   |
|  Comm. interfaces | SPI | 2  |   |   |   |   |   |
|   |  I2C | 1  |   |   |   |   |   |
|   |  USART | 2  |   |   |   |   |   |
|  DMA |   | 3ch  |   |   |   |   |   |
|  RTC |   | Yes  |   |   |   |   |   |
|  GPIOs |   | 18 |   |   | 18  |   |   |
|  12-bit ADC (external + internal) |   | 5+2 |   |   | 8+2  |   |   |
|  Comparators |   | 2  |   |   |   |   |   |
|  Max. CPU frequency |   | 48 MHz  |   |   |   |   |   |
|  Operating Voltage |   | 2.0 ~ 5.5 V  |   |   |   |   |   |
|  Operating Temp. |   | -40 ~ 105 °C  |   |   |   |   |   |
|  Package |   | QFN20  |   |   |   |   |   |

14of 81

PY32F030 Datasheet

Table 1-10 PY32F030x7 series TSSOP20 product features and peripheral counts

|  Peripheral |   | PY32F030F18P7 | PY32F030F17P7 | PY32F030F16P7 | PY32F030F28P7 | PY32F030F27P7 | PY32F030F26P7 | PY32F030F38P7  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  Flash memory (Kbyte) |   | 64 | 48 | 32 | 64 | 48 | 32 | 64  |
|  SRAM (Kbyte) |   | 8 | 6 | 4 | 8 | 6 | 4 | 8  |
|  Timers | Advanced | 1 (16-bit)  |   |   |   |   |   |   |
|   |  General pupose | 4 (16-bit)  |   |   |   |   |   |   |
|   |  low power | 1  |   |   |   |   |   |   |
|   |  SysTick | 1  |   |   |   |   |   |   |
|   |  Watchdog | 2  |   |   |   |   |   |   |
|  Comm. interfaces | SPI | 2  |   |   |   |   |   |   |
|   |  I2C | 1  |   |   |   |   |   |   |
|   |  USART | 2  |   |   |   |   |   |   |
|  DMA |   | 3ch  |   |   |   |   |   |   |
|  RTC |   | Yes  |   |   |   |   |   |   |
|  GPIOs |   | 18 |   |   | 18 |   |   | 18  |
|  12-bit ADC (external + internal) |   | 2+2 |   |   | 8+2 |   |   | 9+2  |
|  Comparators |   | 2  |   |   |   |   |   |   |
|  Max. CPU frequency |   | 48 MHz  |   |   |   |   |   |   |
|  Operating Voltage |   | 2.0 ~ 5.5 V  |   |   |   |   |   |   |
|  Operating Temp. |   | -40 ~ 105 °C  |   |   |   |   |   |   |
|  Package |   | TSSOP20  |   |   |   |   |   |   |

15 of 81

PY32F030 Datasheet

![img-1.jpeg](img-1.jpeg)
Figure 1-1 Functional Module

PY32F030 Datasheet

# 2. Functional Overview

## 2.1. Arm®Cortex®-M0+ core

The Arm ® Cortex ® - M0+ is an entry-level 32-bit Arm Cortex processor designed for a wide range of embedded applications. It provides developers with significant benefits, including:

- Simple structure, easy to learn and program
- Ultra-low power consumption, energy-saving operation
- Reduced code density and more

Cortex-M0+ processor is a 32-bit core optimized for area and power consumption and is a 2-stage pipeline Von Neumann architecture. The processor offers high-end processing hardware, including single-cycle multipliers, through a streamlined but powerful instruction set and an extensively optimized design. Moreover, it delivers the superior performance expected from a 32-bit architecture computer, with a higher coding density than other 8 and 16-bit microcontrollers.

The Cortex-M0+ is tightly coupled with a Nested Vectored Interrupt Controller (NVIC).

## 2.2. Memories

The on-chip integrated SRAM is accessed by bytes (8 bits), half-word (16 bits) or word (32 bits).

The on-chip integrated Flash consists of two different physical areas:

- Main flash area, which contains application and user data
- The information area has 4 Kbytes, and it includes the following parts:
- Option bytes
- UID bytes
- System memory

The protection of Flash main memory includes the following mechanisms:

- Read protection (RDP) prevents access from outside.
- Write protection (WRP) control prevents unwanted writes (confuse by program memory pointer from PC). The minimum protection unit for write protection is 4 Kbytes.
- Option byte write protection, special unlocking design.

## 2.3. Boot mode

Through BOOT0 pin and boot configuration bit nBOOT1 (stored in Option bytes), three different boot modes can be selected, as shown in the following table:

Table 2-1 Boot configuration

|  Boot mode configuration |   | Mode  |
| --- | --- | --- |
|  nBOOT1 bit | BOOT0 pin  |   |
|  X | 0 | Select Main flash as the boot area  |
|  1 | 1 | Select System memory as the boot area  |
|  0 | 1 | Select SRAM as the boot area  |

The Boot loader program is stored in the System memory and used to download the Flash program through the USART interface.

## 2.4. Clock System

After the CPU starts, the default system clock frequency is HSI 8 MHz, and the system clock frequency and system clock source can be reconfigured after the program runs. The high frequency clocks that can be selected are:

- A 4/8/16/22.12/24 MHz configurable internal high precision HSI clock.
- A 32.768 KHz configurable internal LSI clock.
- 4 ~ 32 MHz HSE clock can enable the CSS function to detect HSE. If CSS fails, the hardware will automatically convert the system clock to HSI, and software configures the HSI frequency. Simultaneously, CPU NMI interrupt is generated.
- A 32.768 KHz LSE clock.

17of 81

PY32F030 Datasheet

- PLL clock, PLL source can be selected as HSI and HSE. If HSE source is selected, when CSS is enabled and CSS fails, PLL and HSE are turned off and hardware selects the system clock source as HSI.

The AHB clock can be divided based on the system clock, and the APB clock can be divided based on the AHB clock. AHB and APB clock frequencies up to 48 MHz.

![img-2.jpeg](img-2.jpeg)
Figure 2-1 System Clock Structure Diagram

18of81

PY32F030 Datasheet

## 2.5. Power management

### 2.5.1. Power block diagram

![img-3.jpeg](img-3.jpeg)
Figure 2-2 Power Block Diagram

Table 2-2 Power Block Diagram

|  No. | Power supply | Condition | Power value | Describe  |
| --- | --- | --- | --- | --- |
|  1 | V_{CC} | x6 version | 1.7 V ~ 5.5 V | The chip is supplied with power through the power pins, and its power supply module is part of the analogue circuit.  |
|   |   |  x7 version | 2.0 V ~ 5.5 V  |   |
|  2 | V_{CCA} | x6 version | 1.7 V ~ 5.5 V | Power to most analogue modules from V_{CC} PAD (a separate power supply PAD can also be designed).  |
|   |   |  x7 version | 2.0 V ~ 5.5 V  |   |
|  3 | V_{CCIO} | x6 version | 1.7 V ~ 5.5 V | Power supply to IO, from V_{CC} PAD  |
|   |   |  x7 version | 2.0 V ~ 5.5 V  |   |
|  4 | V_{DD} | - | 1.2 V/1.0 V ± 10 % | VR supplies power to the main logic circuits and SRAM inside the chip. When the MR is powered, it outputs 1.2V. According to the software configuration, entering the stop mode can be powered by MR or LPR, and the LPR output is determined to be 1.2V or 1.0V.  |

### 2.5.2. Power monitoring

#### 2.5.2.1. Power on reset (POR/PDR)

The Power on reset (POR)/Power down reset (PDR) module is designed to provide power-on and power-off reset for the chip. The module keeps working in all modes.

19of 81

PY32F030 Datasheet

## 2.5.2.2. Brown-out reset (BOR)

In addition to POR/ PDR, BOR (brown-out reset) is also implemented. BOR can only be enabled and disabled through the option byte.

When the BOR is turned on, the BOR threshold can be selected by the Option byte, and both the rising and falling detection points can be configured individually.

![img-4.jpeg](img-4.jpeg)
Figure 2-3 POR/PDR/BOR threshold

## 2.5.2.3. Voltage detection (PVD)

Programmable Voltage Detector (PVD) module can be used to detect the $V_{CC}$ power supply (it can also detect the voltage of the PB7 pin), and the detection point can be configured through the register. When $V_{CC}$ is higher or lower than the detection point of PVD, a corresponding reset flag is generated. This event is internally connected to line 16 of EXTI, depending on the rising/falling edge configuration of EXTI line 16. When $V_{CC}$ rises above the PVD detection point, or $V_{CC}$ falls below the PVD detection point, an interrupt is generated. In the service program, users can perform urgent shutdown tasks.

![img-5.jpeg](img-5.jpeg)
Figure 2-4 PVD Threshold

## 2.5.3. Voltage regulator

PY32F030 Datasheet

The chip designs two voltage regulators:
- MR (Main regulator) keeps working when the chip is in normal operating state.
- LPR (Low power regulator) provides a lower power consumption option in stop mode.

## 2.5.4. Low power mode

In addition to the normal operating mode, the chip has 2 low-power modes:
- Sleep mode: Peripherals can be configured to keep working when the CPU clock is off (NVIC, SysTick, etc.). It is recommended only to enable the modules that must work, and close the module after the module works.
- Stop mode: In this mode, the contents of SRAM and registers are maintained, High-speed clock PLL, HSI and HSE are turned off, and most modules of clocks in the VDD domain are stopped. GPIO, PVD, COMP output, RTC and LPTIM can wake up stop mode.

## 2.6. Reset

Two resets are designed in the chip: power and system reset.

### 2.6.1. Power reset

A power reset occurs in the following situations:
- Power on/off reset (POR/PDR)
- Brown-out reset (BOR)

### 2.6.2. System reset

A system reset occurs when the following events occur:
- Reset of NRST pin
- Windowed Watchdog Reset (WWDG)
- Independent Watchdog Reset (IWDG)
- SYSRESETREQ software reset
- Option byte load reset (OBL)
- Power reset (POR/PDR, BOR)

## 2.7. General-purpose input and output (GPIOs)

The software configures each GPIO as output (push-pull or open-drain), input (floating, pull-up/down, analogue), peripheral multiplexing function, and locking mechanism freeze I/O port configuration function.

## 2.8. DMA

Direct Memory Access (DMA) provides high-speed data transfer between peripherals and memory or between memory and memory.

DMA controller has three channels, and each channel is responsible for managing memory access requests from one or more peripherals. The DMA controller includes an arbiter for handling DMA requests for each DMA request's priority..

DMA supports circular buffer management, eliminating the need for user code to intervene when the controller reaches the end of the buffer.

Each channel is directly connected to a dedicated hardware DMA request, and each channel also supports software triggering. These functions are configured through software.

DMA is available for peripherals: SPI, I²C, USART, all TIMx timers (except TIM14 and LPTIM) and ADC.

## 2.9. Interrupt

The PY32F030 handles exceptions through the Cortex-M0+ processor's embedded Vectored Interrupt Controller (NVIC) and an Extended Interrupt/Event Controller (EXTI).

### 2.9.1. Interrupt controller NVIC

NVIC is a tightly coupled IP inside the Cortex-M0+ processor. The NVIC can handle NMI (Non-Maskable Interrupts) and maskable external interrupts from outside the processor and Cortex-M0+ internal exceptions. NVIC provides flexible priority management.

The tight coupling of the processor core to the NVIC greatly reduces the delay between an interrupt event and the initiation of the corresponding interrupt service routine (ISR). The ISR vectors are listed in a vector table, stored at a base address of the NVIC. The vector table base address determines the vector address of the ISR to execute, and the ISR is used as the offset composed of serial numbers.

21of81

PY32F030 Datasheet

If a high-priority interrupt event occurs and a low-priority interrupt event is just waiting to be serviced, the later-arriving high-priority interrupt event will be serviced first. Another optimization is called tail-chaining. When returning from a high-priority ISR and then starting a pending low-priority ISR, unnecessary pushes and pops of processor contexts will be skipped. This reduces latency and improves power efficiency.

NVIC features:
- Low latency interrupt handling
- Level 4 Interrupt Priority
- Supports one NMI interrupt
- Supports 32 maskable external interrupts
- Supports 10 Cortex-M0+ exceptions
- High-priority interrupts can interrupt low-priority interrupt responses
- Support tail-chaining optimization
- Hardware Interrupt Vector Retrieval

## 2.9.2. Extended interrupt/event controller (EXTI)

EXTI adds flexibility to handle physical wire events and generates wake-up events when the processor wakes up from stop mode.

The EXTI controller has multiple channels, including a maximum of 16 GPIOs, 1 PVD output, 2 COMP outputs, RTC and LPTIM wake-up signals. GPIO, PVD and COMP can be configured to be triggered by a rising edge, falling edge or double edge. Any GPIO signal can be configured as EXTI0 ~ 15 channel through the select signal.

- Each EXTI line can be independently masked through registers.
- The EXTI controller can capture pulses shorter than the internal clock period.
- Registers in the EXTI controller latch each event. Even in stop mode, after the processor wakes up from stop mode, it can identify the wake-up source or identify the GPIO and event that caused the interrupt.

## 2.10. Analog to digital converter (ADC)

The chip has a 12-bit SARADC. The module has up to 12 channels to be measured, including 10 external channels and 2 internal channels.

- The conversion mode of each channel can be set to single, continuous, sweep, discontinuous mode. Conversion results are stored in left or right-aligned 16-bit data registers.
- An analogue watchdog allows the application to detect if the input voltage exceeds a user-defined high or low threshold.
- The ADC has been implemented to operate at a low frequency, resulting in lower power consumption.
- At the end of sampling, conversion, and continuous conversion, an interrupt request is generated when the conversion voltage exceeds the threshold when simulating the watchdog.

## 2.11. Comparators (COMP)

- Each comparator has configurable positive or negative inputs for flexible voltage selection
- Multiple I/O pins
- Power supply $V_{CC}$
- The output of the temperature sensor
- Internal reference voltage and 3-part values supplied by divider (1/4, 1/2, 3/4)
- The hysteresis function is configurable
- Programmable speed and power consumption
- The output can be connected to the input of I/O or timer as a trigger
- OCREF_CLR event (current control of cycle by cycle)
- Brakes for fast PWM shutdown

Each COMP has interrupt generation capability to act as a wake-up of the chip from low-power modes (sleep and stop modes) (via EXTI)

## 2.12. Timer

The characteristics of different timers of PY32F030 are shown in the following table:

PY32F030 Datasheet

Table 2-3 Timer Features

|  Types | Timer | Bit Width | Counting Direction | Prescaler | DMA | Capture /compare channel | Complementary output  |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  Advanced | TIM1 | 16-bit | Superior, Down, Center aligned | 1 ~ 65536 | Support | 4 | 3  |
|  General purpose | TIM3 | 16-bit | Superior, Down, Center aligned | 1 ~ 65536 | Support | 4 | -  |
|   |  TIM14 | 16-bit | Superior | 1 ~ 65536 | - | 1 | -  |
|   |  TIM16, TIM17 | 16-bit | Superior | 1 ~ 65536 | Support | 1 | 1  |

## 2.12.1. Advanced timer

The advanced timer (TIM1) consists of a 16-bit auto-reload counter driven by a programmable prescaler. It can be used in various scenarios, including pulse length measurement of input signals (input capture) or generating output waveforms (output compare, output PWM, complementary PWM with dead-time insertion).

TIM1 includes 4 independent channels:

- Input capture
- Output comparison
- PWM generation (edge or center-aligned mode)
- Single pulse mode output

If TIM1 is configured as a standard 16-bit timer, it has the same characteristics as the TIMx timer. Full modulation capability (0-100%) if configured as a 16-bit PWM generator.

In the MCU debug mode, TIM1 can freeze counting.

The timer feature with the same architecture is shared so that the TIM1 can work with other timers for synchronization or event chaining through the timer chaining function.

TIM1 supports the DMA function.

## 2.12.2. General-purpose timer

### 2.12.2.1. TIM3

- The general-purpose timer TIM3 consists of a 16-bit auto-reload counter driven by a 16-bit programmable prescaler. It has 4 independent channels, each for input capture/output compare, PWM or single pulse mode output.
- TIM3 can work with TIM1 through the timer link function.
- TIM3 supports the DMA function.
- The TIM3 can process quadrature (incremental) encoder signals and digital outputs from 1 to 3 Hall Effect Sensors.
- In the MCU debug mode, the TIM 3 can freeze counting.

### 2.12.2.2. TIM14

- The general-purpose timer TIM14 consists of a 16-bit auto-reload counter driven by a 16-bit programmable prescaler.
- TIM14 has one independent channel for input capture/output compare, PWM or single pulse mode output.
- In the MCU debug mode, the TIM14 can freeze counting.

### 2.12.2.3. TIM16/TIM17

- The general-purpose timer TIM16 and TIM17 consists of a 16-bit auto-reload counter driven by programmable prescaler.
- TIM16/TIM17 have 1 independent channel for input capture/output compare, PWM or single pulse mode output.

23of81

PY32F030 Datasheet

- TIM16/TIM17 have complementary outputs with dead time.
- TIM16/TIM17 supports the DMA function.
- In the MCU debug mode, TIM 16/TIM17 can freeze counting.

## 2.12.3. Low power timer (LPTIM)

- LPTIM is a 16-bit up counter with a 3-bit prescaler and only support a single count.
- LPTIM can be configured as a stop mode wakeup source.
- In the MCU debug mode, LPTIM can freeze the count value.

## 2.12.4. IWDG

- Independent watchdog (IWDG) is integrated in the chip, and this module has the characteristics of high-security level, accurate timing and flexible use. IWDG finds and resolves functional confusion due to software failure and triggers a system reset when the counter reaches the specified timeout value.
- The IWDG is clocked by LSI, so even if the main clock fails, it can keep working.
- IWDG is the best suited for applications that require the watchdog as a standalone process outside of the main application and do not have high timing accuracy constraints.
- Controlling of option byte can enable IWDG hardware mode.
- IWDG is the wake-up source of stop mode, which wakes up stop mode by reset.
- In the MCU debug mode, IWDG can freeze the count value.

## 2.12.5. WWDG

The system window watchdog is based on a 7-bit down counter and can be set to free-run. It acts as a watchdog to reset the system when a failure shows. The count clock is the APB clock (PCLK). It has early warning interrupt capability, and the counter can be freeze in the MCU debug mode.

## 2.12.6. SysTick timer

SysTick counters are specifically for real-time operating systems (RTOS) also can use as standard down counters.

SysTick Features:

- 24-bit count down
- Self-loading capability
- An interrupt can be generated when the counter reaches 0 (maskable)

## 2.13. Real time clock (RTC)

- The real-time clock is an independent timer. It has a set of continuous counting counters, which can provide a clock calendar function under the corresponding software configuration. Modifying the value of the counter can reset the current time and date of the system.
- RTC is a 32-bit programmable counter with a prescale factor of up to $2^{20}$ bits.
- The RTC counter clock source can be LSI and the stop wake-up source.
- RTC can generate alarm interrupt, second interrupt and overflow interrupt (maskable).
- RTC supports clock calibration.
- In the MCU debug mode, RTC can freeze counting.

## 2.14. I²C interface

I²C (inter-integrated circuit) bus interface connects the microcontroller and the serial I²C bus. It provides multi-master capability and controls all I²C bus specific sequences, protocols, arbitration and timing. Standard (Sm) and fast (Fm) are supported.

I²C Features:

- Slave and master mode
- Multi-host function: can be master or slave
- Support different communication speeds
- Standard Mode (Sm): Up to 100 kHz

24of 81

PY32F030 Datasheet

- Fast Mode (Fm): up to 400 kHz
- As master
- Generate Clock
- Generation of Start and Stop
- As slave
- Programmable I²C address detection
- Discovery of the Stop bit
- 7-bit addressing mode
- General call
- Status flag
- Transmit/receive mode flags
- Byte transfer complete flag
- I²C busy flag bit
- Error flag
- Master arbitration loss
- ACK failure after address/data transfer
- Start/Stop error
- Overrun/Underrun (clock stretching function disable)
- Optional Clock Stretching
- Single-byte buffer with DMA capability
- Software reset
- Analogue noise filter function

## 2.15. Universal synchronous asynchronous receiver/ transmitter (USART)

PY32F030 contains 2 USARTs with precisely the same functions.

The Universal Synchronous Asynchronous Transceiver (USART) provides a flexible method for full-duplex data exchange with external devices using the industry-standard NRZ asynchronous serial data format. The USART utilizes a fractional baudrate generator to provide a wide range of baudrate options.

It supports simultaneous one-way communication and half-duplex single-wire communication, and it also allows multi-processor communication.

Automatic baudrate detection is supported.

High-speed data communication can be achieved by using the DMA method of the multi-buffer configuration.

USART features:
- Full-duplex asynchronous communication
- NRZ standard format
- Configurable 16 times or 8 times oversampling for increased flexibility in speed and clock tolerance
- Programmable baudrate shared by transmit and receive, up to 4.5 Mbit/s
- Automatic baudrate detection
- Programmable data length of 8 or 9 bits
- Configurable stop bits (1 bit or 2 bits)
- Synchronous mode and clock output function for synchronous communication
- Single-wire half-duplex communication
- Independent transmit and receive enable bits
- Hardware flow control
- Receive/transmit bytes by DMA buffer
- Detection flag
- Receive full buffer
- Send empty buffer
- End of transmission
- Parity Control
- Send check digit
- Check the received data
- Flagged interrupt sources
- CTS change
- Send empty register
- Send completed

25of 81

PY32F030 Datasheet

- Receive full data register
- Bus idle detected
- Overflow error
- Frame error
- Noise operation
- Error detection
- Multiprocessor communication
- If the address does not match, enter silent mode
- Wake-up from silent mode: by idle detection and address flag detection

## 2.16. Serial peripheral interface (SPI)

PY32F030 contains two SPIs.

Serial Peripheral Interface (SPI) allows the chip to communicate with external devices in half-duplex, full-duplex, and simplex synchronous serial communication. This interface can be configured in master mode and provides the communication clock (SCK) for external slave devices. The interface can also work in a multi-master configuration.

The SPI features are as follows:

- Master or slave mode
- 3 -wire full-duplex simultaneous transmission
- 2-wire half-duplex synchronous transmission (with bidirectional data line)
- 2-wire simplex synchronous transmission (no bidirectional data line)
- 8-bit or 16-bit transmission frame selection
- Support multi-master mode
- 8 master mode baudrate prescaler factors (max f_PCLK/4)
- Slave mode frequency (max f_PCLK/4)
- Both master and slave modes can be managed by software or hardware NSS: dynamic change of master/slave operating mode
- Programmable clock polarity and phase
- Programmable data order, MSB first or LSB first
- Dedicated transmit and receive flags that can trigger interrupts
- SPI bus busy status flag
- Motorola mode
- Interrupt-causing master mode faults, overloads
- Two 32-bit Rx and Tx FIFOs with DMA capability

## 2.17. SWD

The ARM SWD interface allows serial debugging tools to be connected to the PY32F030.

26of 81

PY32F030 Datasheet

# 3. Pin Configuration

![img-6.jpeg](img-6.jpeg)
Figure 3-1 LQFP32 Pinout1 PY32F030K1xTx (Top view)

![img-7.jpeg](img-7.jpeg)
Figure 3-2 LQFP32 Pinout2 PY32F030K2xTx / PY32F030K2xTx-E (Top view)

27of 81

PY32F030 Datasheet

![img-8.jpeg](img-8.jpeg)
Figure 3-3 QFN32(5*5) Pinout2 PY32F030K2xUx / PY32F030K2xUx-E (Top view)

![img-9.jpeg](img-9.jpeg)
Figure 3-4 QFN32(5*5) Pinout3 PY32F030K3xUx-E (Top view)

![img-10.jpeg](img-10.jpeg)
Figure 3-5 QFN32(4*4) Pinout4 PY32F030K4xUx-E (Top view)

PY32F030 Datasheet

![img-11.jpeg](img-11.jpeg)
Figure 3-6 QFN24 Pinout1 PY32F030E1xUx-E (Top view)

![img-12.jpeg](img-12.jpeg)
Figure 3-7 SSOP24 Pinout1 PY32F030E1xMx (Top view)

![img-13.jpeg](img-13.jpeg)
Figure 3-8 SSOP24 Pinout2 PY32F030E2xMx / PY32F030E2xMx-E (Top view)

PY32F030 Datasheet

![img-14.jpeg](img-14.jpeg)
Figure 3-9 QFN20 Pinout1 PY32F030F1xUx (Top view)

![img-15.jpeg](img-15.jpeg)
Figure 3-10 QFN20 Pinout2 PY32F030F2xUx / PY32F030F2xUx-E (Top view)

![img-16.jpeg](img-16.jpeg)
Figure 3-11 QFN20 Pinout3 PY32F030F3xUx (Top view)

30of 81

PY32F030 Datasheet

![img-17.jpeg](img-17.jpeg)
Figure 3-12 TSSOP20 Pinout1 PY32F030F1xPx (Top view)

![img-18.jpeg](img-18.jpeg)
Figure 3-13 TSSOP20 Pinout2 PY32F030F2xPx (Top view)

![img-19.jpeg](img-19.jpeg)
Figure 3-14 TSSOP20 Pinout3 PY32F030F3xPx (Top view)

31of81

PY32F030 Datasheet

![img-20.jpeg](img-20.jpeg)
Figure 3-15 TSSOP20 Pinout4 PY32F030F4xP (Top view)

![img-21.jpeg](img-21.jpeg)
Figure 3-16 DFN8(1.5*1.5) Pinout1 PY32F030L1xDx (Top view)

Table 3-1 Pin definition terminology and symbols

|  Types |   | Symbol | Definition  |
| --- | --- | --- | --- |
|  Port type | S | Supply pin  |   |
|   |   |  G | Ground pin  |
|   |   |  I/O | Input/output pin  |
|   |   |  NC | Undefined  |
|  Port structure | COM | 5 V port, support analogue input and output function  |   |
|   |   |  RST | Reset port, with internal weak pull-up resistor, does not support analog input and output function  |
|   |   |  _L | LED COM port with analog input and output functions  |
|  Notes |   | - | Unless other specified, all ports are used as floating inputs between and after reset  |
|  Port function | Multiplexing function | - | Function selected by GPIOx_AFR register  |
|   |  Additional features | - | Directly selected or enabled through peripheral registers  |

Table 3-2 LQFP32/QFN32 pin definitions

|  Packages |   |   |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  LQFP32 K1 | LQFP32 K2 | QFN32(5*5) K3 | QFN32(5*5) K3 | QFN32(4*4) K4 |   |   |   | Notes | Multiplexing | Additional  |
|  - | - | - | - | - | NC | NC |  |  |   |   |

PY32F030 Datasheet

|  Packages |   |   |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  LQFP32 K1 | LQFP32 K2 | QFN32(5*5) K2 | QFN32(5*5) K3 | QFN32(4*4) K4 |   |   |   | Notes | Multiplexing | Additional  |
|  1 | 1 | 1 | 1 | 1 | Vcc | S |  |  | Digital power supply  |   |
|  2 | 2 | 2 | 2 | 2 | PF0-OSC_IN- (PF0) | I/O | COM |  | SPI2_SCK | OSC_IN  |
|   |   |   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |   |   |  TIM14_CH1  |   |
|   |   |   |   |   |   |   |   |   |  USART1_RX  |   |
|   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |  I²C_SDA  |   |
|  3 | 3 | 3 | 3 | 3 | PF1-OSC_OUT- (PF1) | I/O | COM |  | SPI2_MISO | OSC_OUT  |
|   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |   |   |  I²C_SCL  |   |
|   |   |   |   |   |   |   |   |   |  SP1_NSS  |   |
|   |   |   |   |   |   |   |   |   |  TIM14_CH1  |   |
|  4 | 4 | 4 | 4 | 4 | PF2-NRST | I/O | RST | (1) | MCO | NRST  |
|   |   |   |   |   |   |   |   |   |  SPI2_MOSI  |   |
|   |   |   |   |   |   |   |   |   |  USART2_RX  |   |
|  5 | 5 | 5 | 5 | 5 | PF3 | I/O | COM |  | USART1_TX | COMP2_INP  |
|   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |  SPI2_MISO  |   |
|   |   |   |   |   |   |   |   |   |  SPI1_NSS  |   |
|   |   |   |   |   |   |   |   |   |  TIM3_CH3  |   |
|   |   |   |   |   |   |   |   |   |  RTC_OUT  |   |
|  6 | 6 | 6 | 6 | 6 | PA0 | I/O | COM |  | SPI2_SCK | ADC_IN0
COMP1_INM  |
|   |   |   |   |   |   |   |   |   |  USART1_CTS  |   |
|   |   |   |   |   |   |   |   |   |  LED_DATA_B  |   |
|   |   |   |   |   |   |   |   |   |  USART2_CTS  |   |
|   |   |   |   |   |   |   |   |   |  COMP1_OUT  |   |
|   |   |   |   |   |   |   |   |   |  TIM1_CH3  |   |
|   |   |   |   |   |   |   |   |   |  TIM1_CH1N  |   |
|   |   |   |   |   |   |   |   |   |  SPI1_MISO  |   |
|   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |  IR_OUT  |   |
|  7 | 7 | 7 | 7 | 7 | PA1 | I/O | COM |  | SPI1_SCK | COMP1_INP
ADC_IN1  |
|   |   |   |   |   |   |   |   |   |  USART1_RTS  |   |
|   |   |   |   |   |   |   |   |   |  USART2_RTS  |   |
|   |   |   |   |   |   |   |   |   |  LED_DATA_C  |   |
|   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |  SPI1_MOSI  |   |
|   |   |   |   |   |   |   |   |   |  USART2_RX  |   |

33of 81

PY32F030 Datasheet

|  Packages |   |   |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  LQFP32 K1 | LQFP32 K2 | QFN32(5*5) K2 | QFN32(5*5) K3 | QFN32(4*4) K4 |   |   |   | Notes | Multiplexing | Additional  |
|   |  |  |  |  |  |  |  |  | TIM1_CH4 |   |
|   |   |   |   |   |   |   |   |   |  TIM1_CH2N  |   |
|   |   |   |   |   |   |   |   |   |  MCO  |   |
|  8 | 8 | 8 | 8 | 8 | PA2 | I/O | COM |  | SPI1_MOSI | COMP2_INM
ADC_IN2  |
|   |   |   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |  LED_DATA_D  |   |
|   |   |   |   |   |   |   |   |   |  COMP2_OUT  |   |
|   |   |   |   |   |   |   |   |   |  SPI1_SCK  |   |
|   |   |   |   |   |   |   |   |   |  TIM3_CH1  |   |
|   |   |   |   |   |   |   |   |   |  I²C_SDA  |   |
|  9 | 9 | 9 | 9 | 9 | PA3 | I/O | COM |  | SPI2_MISO | COMP2_INP
ADC_IN3  |
|   |   |   |   |   |   |   |   |   |  USART1_RX  |   |
|   |   |   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |   |   |  LED_DATA_E  |   |
|   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |  SPI1_MOSI  |   |
|   |   |   |   |   |   |   |   |   |  TIM1_CH1  |   |
|   |   |   |   |   |   |   |   |   |  I²C_SCL  |   |
|  10 | 10 | 10 | 10 | 10 | PA4 | I/O | COM |  | SPI1_NSS | ADC_IN4  |
|   |   |   |   |   |   |   |   |   |  USART1_CK  |   |
|   |   |   |   |   |   |   |   |   |  SPI2_MOSI  |   |
|   |   |   |   |   |   |   |   |   |  LED_DATA_F  |   |
|   |   |   |   |   |   |   |   |   |  TIM14_CH1  |   |
|   |   |   |   |   |   |   |   |   |  USART2_CK  |   |
|   |   |   |   |   |   |   |   |   |  ENENTOUT  |   |
|   |   |   |   |   |   |   |   |   |  RTC_OUT  |   |
|   |   |   |   |   |   |   |   |   |  TIM3_CH3  |   |
|   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|  11 | 11 | 11 | 11 | 11 | PA5 | I/O | COM |  | SPI1_SCK | ADC_IN5  |
|   |   |   |   |   |   |   |   |   |  LED_DATA_G  |   |
|   |   |   |   |   |   |   |   |   |  LPTIM_ETR  |   |
|   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |  TIM3_CH2  |   |
|   |   |   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |   |   |  MCO  |   |
|  12 | 12 | 12 | 12 | 12 | PA6 | I/O | COM |  | SPI1_MISO | ADC_IN6  |
|   |   |   |   |   |   |   |   |   |  TIM3_CH1  |   |
|   |   |   |   |   |   |   |   |   |  TIM1_BKIN  |   |
|   |   |   |   |   |   |   |   |   |  LED_DATA_DP  |   |

34of 81

PY32F030 Datasheet

| Packages | Reset | Port type | Port structure | Functions |
| --- | --- | --- | --- | --- |
| LQFP32 K1 | LQFP32 K2 | QFN32(5*5) K2 | QFN32(5*5) K3 | QFN32(4*4) K4 | Notes | Multiplexing | Additional |
|  |  |  |  |  |  |  |  |  | TIM16_CH1 |  |
| COMP1_OUT |
| USART1_CK |
| RTC_OUT |
| 13 | 13 | 13 | 13 | 13 | PA7 | I/O | COM |  | SPI1_MOSI | ADC_IN7 |
| TIM3_CH2 |
| TIM1_CH1N |
| TIM14_CH1 |
| TIM17_CH1 |
| EVENTOUT |
| COMP2_OUT |
| USART1_TX |
| USART2_TX |
| I²C_SDA |
| SPI1_MISO |
| 14 | 14 | 14 | 14 | 14 | PB0 | I/O | COM |  | SPI1_NSS | ADC_IN8 |
| TIM3_CH3 |
| TIM1_CH2N |
| EVENTOUT |
| COMP1_OUT |
| 15 | 15 | 15 | 15 | 15 | PB1 | I/O | COM |  | TIM14_CH1 | COMP1_INM ADC_IN9 |
| TIM3_CH4 |
| TIM1_CH3N |
| EVENTOUT |
| 16 | 16 | 16 | 17 | 16 | Vss | S |  |  | Ground |
| - | 17 | 17 | 16 | 17 | PB2 | I/O | COM |  | USART1_RX | COMP1_INP |
| USART2_RX |
| SPI2_SCK |
| 17 | - | - | - | - | Vcc | S |  |  | Digital power supply |
| 18 | 18 | 18 | 18 | 18 | PA8 | I/O | COM |  | SPI2_NSS | - |
| USART1_CK |
| TIM1_CH1 |
| USART2_CK |
| MCO |
| EVENTOUT |
| USART1_RX |
| USART2_RX |
| SPI1_MOSI |
| I²C_SCL |
| 19 | 19 | 19 | 19 | 19 | PA9 | I/O | COM |  | SPI2_MISO | OSC32OUT |

35of 81

PY32F030 Datasheet

|  Packages |   |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  LQFP32 K1 | LQFP32 K2 | QFN32(5*5) K2 | QFN32(5*5) K3 |   |   |   | Notes | Multiplexing | Additional  |
|   |  |  |  |  |  |  | USART1_TX |  |   |
|   |   |   |   |   |   |   |  TIM1_CH2  |   |   |
|   |   |   |   |   |   |   |  MCO  |   |   |
|   |   |   |   |   |   |   |  I²C_SCL  |   |   |
|   |   |   |   |   |   |   |  EVENTOUT  |   |   |
|   |   |   |   |   |   |   |  I²C_SDA  |   |   |
|   |   |   |   |   |   |   |  TIM1_BK  |   |   |
|   |   |   |   |   |   |   |  SPI1_SCK  |   |   |
|   |   |   |   |   |   |   |  USART1_RX  |   |   |
|  20 | 20 | 20 | 20 | 20 | PA10 | I/O | COM | SPI2_MOSI | OS32IN  |
|   |   |   |   |   |   |   |   |  USART1_RX  |   |
|   |   |   |   |   |   |   |   |  TIM1_CH3  |   |
|   |   |   |   |   |   |   |   |  TIM17_BKIN  |   |
|   |   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |   |  I²C_SDA  |   |
|   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |  I²C_SCL  |   |
|   |   |   |   |   |   |   |   |  SPI1_NSS  |   |
|   |   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |   |  IR_OUT  |   |
|  21 | 21 | 21 | 21 | 21 | PA11 | I/O | COM | SPI1_MISO | -  |
|   |   |   |   |   |   |   |   |  USART1_CTS  |   |
|   |   |   |   |   |   |   |   |  TIM1_CH4  |   |
|   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |  USART2_CTS  |   |
|   |   |   |   |   |   |   |   |  I²C_SCL  |   |
|   |   |   |   |   |   |   |   |  COMP1_OUT  |   |
|  22 | 22 | 22 | 22 | 22 | PA12 | I/O | COM | SPI1_MOSI | -  |
|   |   |   |   |   |   |   |   |  USART1_RTS  |   |
|   |   |   |   |   |   |   |   |  TIM1_ETR  |   |
|   |   |   |   |   |   |   |   |  USART2_RTS  |   |
|   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |  I²C_SDA  |   |
|   |   |   |   |   |   |   |   |  COMP2_OUT  |   |
|  23 | 23 | 23 | 23 | 23 | PA13(SWDIO) | I/O | COM | SWDIO | -  |
|   |   |   |   |   |   |   |   |  IR_OUT  |   |
|   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |  SPI1_MISO  |   |
|   |   |   |   |   |   |   |   |  TIM1_CH2  |   |
|   |   |   |   |   |   |   |   |  USART1_RX  |   |

36of 81

PY32F030 Datasheet

|  Packages |   |   |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  LQFP32 K1 | LQFP32 K2 | QFN32(5*5) K2 | QFN32(5*5) K3 | QFN32(4*4) K4 |   |   |   | Notes | Multiplexing | Additional  |
|   |  |  |  |  |  |  |  |  | MCO |   |
|  24 | 24 | 24 | 24 | 24 | PA14(SWCLK) | I/O | COM | (2) | SWCLK | -  |
|   |   |   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |  MCO  |   |
|  25 | 25 | 25 | 25 | 25 | PA15 | I/O | COM_L |  | SPI1_NSS | -  |
|   |   |   |   |   |   |   |   |   |  USART1_RX  |   |
|   |   |   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |   |   |  LED_COM0  |   |
|   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|  26 | 26 | 26 | 26 | 26 | PB3 | I/O | COM_L |  | SPI1_SCK | COMP2_INM  |
|   |   |   |   |   |   |   |   |   |  TIM1_CH2  |   |
|   |   |   |   |   |   |   |   |   |  USART1_RTS  |   |
|   |   |   |   |   |   |   |   |   |  USART2_RTS  |   |
|   |   |   |   |   |   |   |   |   |  LED_COM1  |   |
|   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|  27 | 27 | 27 | 27 | 27 | PB4 | I/O | COM_L |  | SPI1_MISO | COMP2_INP  |
|   |   |   |   |   |   |   |   |   |  TIM3_CH1  |   |
|   |   |   |   |   |   |   |   |   |  USART2_CTS  |   |
|   |   |   |   |   |   |   |   |   |  USART1_CTS  |   |
|   |   |   |   |   |   |   |   |   |  TIM17_BKIN  |   |
|   |   |   |   |   |   |   |   |   |  LED_COM2  |   |
|   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|  28 | 28 | 28 | 28 | 28 | PB5 | I/O | COM_L |  | SPI1_MOSI | -  |
|   |   |   |   |   |   |   |   |   |  TIM3_CH2  |   |
|   |   |   |   |   |   |   |   |   |  TIM16_BKIN  |   |
|   |   |   |   |   |   |   |   |   |  USART2_CK  |   |
|   |   |   |   |   |   |   |   |   |  USART1_CK  |   |
|   |   |   |   |   |   |   |   |   |  LPTIM_IN1  |   |
|   |   |   |   |   |   |   |   |   |  LED_COM3  |   |
|   |   |   |   |   |   |   |   |   |  COMP1_OUT  |   |
|  29 | 29 | 29 | 29 | 29 | PB6 | I/O | COM |  | USART1_TX | COMP2_INP  |
|   |   |   |   |   |   |   |   |   |  TIM1_CH3  |   |
|   |   |   |   |   |   |   |   |   |  TIM16_CH1N  |   |
|   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |  SPI2_MISO  |   |
|   |   |   |   |   |   |   |   |   |  I²C_SCL  |   |
|   |   |   |   |   |   |   |   |   |  LPTIM_ETR  |   |
|   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |

37of 81

PY32F030 Datasheet

| Packages | Reset | Port type | Port structure | Functions |
| --- | --- | --- | --- | --- |
| LQFP32 K1 | LQFP32 K2 | QFN32(5*5) K2 | QFN32(5*5) K3 | QFN32(4*4) K4 | Notes | Multiplexing | Additional |
| 30 | 30 | 30 | 30 | 30 | PB7 | I/O | COM |  | USART1_RX | COMP2_INM PVD_IN |
| SPI2_MOSI |
| TIM17_CH1N |
| USART2_RX |
| I²C_SDA |
| EVENTOUT |
| 31 | 31 | 31 | 31 | 31 | PF4-BOOT0 | I/O | COM | (3) | - | BOOT0 |
| - | 32 | 32 | 32 | 32 | PB8 | I/O | COM |  | SPI2_SCK | COMP1_INP |
| TIM16_CH1 |
| I²C1_SCL |
| USART2_TX |
| EVENTOUT |
| LED_DATA_A |
| USART1_TX |
| SPI2_NSS |
| I²C_SDA |
| TIM17_CH1 |
| IR_OUT |
| 32 | - | - | - | - | Vss | S |  |  | Ground |

1. Selecting PF2 or NRST is configured through option bytes.
2. After reset, the two pins of PA13 and PA14 are configured as SWDIO and SWCLK AF function, the former internal pull-up resistor, the latter internal pull-down resistor is activated.
3. PF4 -BOOT0 is the default digital input mode, and the pull-down is enabled.

Table 3-3 SSOP24/QFN24 pin definitions

|  Packages |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  SSOP24 E1 | SSOP24 E2 | QFN24 E1 |   |   |   | Notes | Multiplexing | Additional  |
|  1 | 1 | 1 | Vcc | S |  |  | Digital power supply  |   |
|  2 | 2 | 2 | PF0-OSC_IN-(PF0) | I/O | COM |  | SPI2_SCK | OSC_IN  |
|   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |  TIM14_CH1  |   |
|   |   |   |   |   |   |   |  USART1_RX  |   |
|   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |  I²C_SDA  |   |
|  3 | 3 | 3 | PF1-OSC_OUT-(PF1) | I/O | COM |  | SPI2_MISO | OSC_OUT  |
|   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |  USART2_RX  |   |

38of 81

PY32F030 Datasheet

|  Packages |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  SSOP24 E1 | SSOP24 E2 | QFN24 E1 |   |   |   | Notes | Multiplexing | Additional  |
|   |  |  |  |  |  |  | I²C_SCL |   |
|   |   |   |   |   |   |   |  SP1_NSS  |   |
|   |   |   |   |   |   |   |  TIM14_CH  |   |
|  4 | 4 | 4 | PF2-NRST | I/O | RST | (1) | MCO | NRST  |
|   |   |   |   |   |   |   |  SPI2_MOSI  |   |
|   |   |   |   |   |   |   |  USART2_RX  |   |
|  - | - | 5 | PF3 | I/O | COM |  | USART1_TX | COMP2_INP  |
|   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |  SPI2_MISO  |   |
|   |   |   |   |   |   |   |  SPI1_NSS  |   |
|   |   |   |   |   |   |   |  TIM3_CH3  |   |
|   |   |   |   |   |   |   |  RTC_OUT  |   |
|  5 | 5 | 6 | PA0 | I/O | COM |  | SPI2_SCK | ADC_IN0
COMP1_INM  |
|   |   |   |   |   |   |   |  USART1_CTS  |   |
|   |   |   |   |   |   |   |  LED_DATA_B  |   |
|   |   |   |   |   |   |   |  USART2_CTS  |   |
|   |   |   |   |   |   |   |  COMP1_OUT  |   |
|   |   |   |   |   |   |   |  TIM1_CH3  |   |
|   |   |   |   |   |   |   |  TIM1_CH1N  |   |
|   |   |   |   |   |   |   |  SPI1_MISO  |   |
|   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |  IR_OUT  |   |
|  6 | 6 | 7 | PA1 | I/O | COM |  | SPI1_SCK | COMP1_INP
ADC_IN1  |
|   |   |   |   |   |   |   |  USART1_RTS  |   |
|   |   |   |   |   |   |   |  USART2_RTS  |   |
|   |   |   |   |   |   |   |  LED_DATA_C  |   |
|   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |  SPI1_MOSI  |   |
|   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |  TIM1_CH4  |   |
|   |   |   |   |   |   |   |  TIM1_CH2N  |   |
|   |   |   |   |   |   |   |  MCO  |   |
|  7 | 7 | 8 | PA2 | I/O | COM |  | SPI1_MOSI | COMP2_INM
ADC_IN2  |
|   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |  LED_DATA_D  |   |
|   |   |   |   |   |   |   |  COMP2_OUT  |   |
|   |   |   |   |   |   |   |  SPI1_SCK  |   |
|   |   |   |   |   |   |   |  TIM3_CH1  |   |
|   |   |   |   |   |   |   |  I²C_SDA  |   |
|  8 | 8 | 9 | PA3 | I/O | COM |  | SPI2_MISO | COMP2_INP
ADC_IN3  |
|   |   |   |   |   |   |   |  USART1_RX  |   |
|   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |  LED_DATA_E  |   |

39of 81

PY32F030 Datasheet

|  Packages |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  SSOP24 E1 | SSOP24 E2 | QFN24 E1 |   |   |   | Notes | Multiplexing | Additional  |
|   |  |  |  |  |  |  | EVENTOUT |   |
|   |   |   |   |   |   |   |  SPI1_MOSI  |   |
|   |   |   |   |   |   |   |  TIM1_CH1  |   |
|   |   |   |   |   |   |   |  I²C_SCL  |   |
|  9 | 9 | 10 | PA4 | I/O | COM |  | SPI1_NSS | ADC_IN4  |
|   |   |   |   |   |   |   |  USART1_CK  |   |
|   |   |   |   |   |   |   |  SPI2_MOSI  |   |
|   |   |   |   |   |   |   |  LED_DATA_F  |   |
|   |   |   |   |   |   |   |  TIM14_CH1  |   |
|   |   |   |   |   |   |   |  USART2_CK  |   |
|   |   |   |   |   |   |   |  ENENTOUT  |   |
|   |   |   |   |   |   |   |  RTC_OUT  |   |
|   |   |   |   |   |   |   |  TIM3_CH3  |   |
|   |   |   |   |   |   |   |  USART2_TX  |   |
|  10 | 10 | 11 | PA5 | I/O | COM |  | SPI1_SCK | ADC_IN5  |
|   |   |   |   |   |   |   |  LED_DATA_G  |   |
|   |   |   |   |   |   |   |  LPTIM_ETR  |   |
|   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |  TIM3_CH2  |   |
|   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |  MCO  |   |
|  11 | 11 | 12 | PA6 | I/O | COM |  | SPI1_MISO | ADC_IN6  |
|   |   |   |   |   |   |   |  TIM3_CH1  |   |
|   |   |   |   |   |   |   |  TIM1_BKIN  |   |
|   |   |   |   |   |   |   |  LED_DATA_DP  |   |
|   |   |   |   |   |   |   |  TIM16_CH1  |   |
|   |   |   |   |   |   |   |  COMP1_OUT  |   |
|   |   |   |   |   |   |   |  USART1_CK  |   |
|   |   |   |   |   |   |   |  RTC_OUT  |   |
|  12 | 12 | 13 | PA7 | I/O | COM |  | SPI1_MOSI | ADC_IN7  |
|   |   |   |   |   |   |   |  TIM3_CH2  |   |
|   |   |   |   |   |   |   |  TIM1_CH1N  |   |
|   |   |   |   |   |   |   |  TIM14_CH1  |   |
|   |   |   |   |   |   |   |  TIM17_CH1  |   |
|   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |  COMP2_OUT  |   |
|   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |  I²C_SDA  |   |
|   |   |   |   |   |   |   |  SPI1_MISO  |   |
|  13 | 13 | 14 | PB0 | I/O | COM |  | SPI1_NSS | ADC_IN8  |
|   |   |   |   |   |   |   |  TIM3_CH3  |   |
|   |   |   |   |   |   |   |  TIM1_CH2N  |   |
|   |   |   |   |   |   |   |  EVENTOUT  |   |

40of 81

PY32F030 Datasheet

|  Packages |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  SSOP24 E1 | SSOP24 E2 | QFN24 E1 |   |   |   | Notes | Multiplexing | Additional  |
|   |  |  |  |  |  |  | COMP1_OUT |   |
|  14 | 14 | 15 | PB1 | I/O | COM |  | TIM14_CH1 | COMP1_INM ADC_IN9  |
|   |   |   |   |   |   |   |  TIM3_CH4  |   |
|   |   |   |   |   |   |   |  TIM1_CH3N  |   |
|   |   |   |   |   |   |   |  EVENTOUT  |   |
|  - | 15 | 16 | PB2 | I/O | COM |  | USART1_RX | COMP1_INP  |
|   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |  SPI2_SCK  |   |
|  - | - | 17 | PA10 | I/O | COM |  | SPI2_MOSI | OS32IN  |
|   |   |   |   |   |   |   |  USART1_RX  |   |
|   |   |   |   |   |   |   |  TIM1_CH3  |   |
|   |   |   |   |   |   |   |  TIM17_BKIN  |   |
|   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |  I2C_SDA  |   |
|   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |  I2C_SCL  |   |
|   |   |   |   |   |   |   |  SPI1_NSS  |   |
|   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |  IR_OUT  |   |
|  15 | - | - | PA12 | I/O | COM |  | SPI1_MOSI | -  |
|   |   |   |   |   |   |   |  USART1_RTS  |   |
|   |   |   |   |   |   |   |  TIM1_ETR  |   |
|   |   |   |   |   |   |   |  USART2_RTS  |   |
|   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |  I²C_SDA  |   |
|   |   |   |   |   |   |   |  COMP2_OUT  |   |
|  16 | 16 | 18 | PA13(SWDIO) | I/O | COM | (2) | SWDIO | -  |
|   |   |   |   |   |   |   |  IR_OUT  |   |
|   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |  SPI1_MISO  |   |
|   |   |   |   |   |   |   |  TIM1_CH2  |   |
|   |   |   |   |   |   |   |  USART1_RX  |   |
|   |   |   |   |   |   |   |  MCO  |   |
|  17 | 17 | 19 | PA14(SWCLK) | I/O | COM | (2) | SWCLK | -  |
|   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |  MCO  |   |
|  18 | 18 | 20 | PA15 | I/O | COM_L |  | SPI1_NSS | -  |
|   |   |   |   |   |   |   |  USART1_RX  |   |
|   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |  LED_COM0  |   |
|   |   |   |   |   |   |   |  EVENTOUT  |   |
|  19 | 19 | 21 | PB3 | I/O | COM_L |  | SPI1_SCK | COMP2_INM  |

41of81

PY32F030 Datasheet

|  Packages |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  SSOP24 E1 | SSOP24 E2 | QFN24 E1 |   |   |   | Notes | Multiplexing | Additional  |
|   |  |  |  |  |  |  | TIM1_CH2 |   |
|   |   |   |   |   |   |   |  USART1_RTS  |   |
|   |   |   |   |   |   |   |  USART2_RTS  |   |
|   |   |   |   |   |   |   |  LED_COM1  |   |
|   |   |   |   |   |   |   |  EVENTOUT  |   |
|  20 | 20 | 22 | PB4 | I/O | COM_L |  | SPI1_MISO | COMP2_INP  |
|   |   |   |   |   |   |   |  TIM3_CH1  |   |
|   |   |   |   |   |   |   |  USART2_CTS  |   |
|   |   |   |   |   |   |   |  USART1_CTS  |   |
|   |   |   |   |   |   |   |  TIM17_BKIN  |   |
|   |   |   |   |   |   |   |  LED_COM2  |   |
|   |   |   |   |   |   |   |  EVENTOUT  |   |
|  21 | 21 | 23 | PB5 | I/O | COM_L |  | SPI1_MOSI | -  |
|   |   |   |   |   |   |   |  TIM3_CH2  |   |
|   |   |   |   |   |   |   |  TIM16_BKIN  |   |
|   |   |   |   |   |   |   |  USART2_CK  |   |
|   |   |   |   |   |   |   |  USART1_CK  |   |
|   |   |   |   |   |   |   |  LPTIM_IN1  |   |
|   |   |   |   |   |   |   |  LED_COM3  |   |
|   |   |   |   |   |   |   |  COMP1_OUT  |   |
|  22 | 22 | - | PF4-BOOT0 | I/O | COM | (3) | - | BOOT0  |
|  23 | 23 | 24 | PB8 | I/O | COM |  | SPI2_SCK | COMP1_INP  |
|   |   |   |   |   |   |   |  TIM16_CH1  |   |
|   |   |   |   |   |   |   |  I²C1_SCL  |   |
|   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |  LED_DATA_A  |   |
|   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |  SPI2_NSS  |   |
|   |   |   |   |   |   |   |  I²C_SDA  |   |
|   |   |   |   |   |   |   |  TIM17_CH1  |   |
|   |   |   |   |   |   |   |  IR_OUT  |   |
|  24 | 24 | - | Vss | S |  |  | Ground  |   |

1. Selecting PF2 or NRST is configured through option bytes.
2. After reset, the two pins of PA13 and PA14 are configured as SWDIO and SWCLK AF function, the former internal pull-up resistor, the latter internal pull-down resistor is activated.
3. PF4 -BOOT0 is the default digital input mode, and the pull-down is enabled.

42of 81

PY32F030 Datasheet

Table 3-4 QFN20/TSSOP20 pin definitions

|  Packages |   |   |   |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  QFN20 F1 | QFN20 F2 | QFN20 F3 | TSSOP20 F1 | TSSOP20 F2 | TSSOP20 F3 |   |   |   | Notes | Multiplexing | Additional  |
|  16 | 13 | 1 | 1 | 16 | 2 | 14 | PF0-OSC_IN-(PF0) | I/O | COM | SPI2_SCK | OSC_IN  |
|   |   |   |   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |   |   |   |  TIM14_CH1  |   |
|   |   |   |   |   |   |   |   |   |   |  USART1_RX  |   |
|   |   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |   |  I²C_SDA  |   |
|  - | - | 2 | - | - | - | - | NC | NC |  |  |   |
|  17 | 14 | 3 | 2 | 17 | 3 | 15 | PF1-OSC_OUT-(PF1) | I/O | COM | SPI2_MISO | OSC_OUT  |
|   |   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |   |   |   |  I²C_SCL  |   |
|   |   |   |   |   |   |   |   |   |   |  SP1_NSS  |   |
|   |   |   |   |   |   |   |   |   |   |  TIM14_CH  |   |
|  18 | 15 | 4 | 3 | 18 | 4 | 16 | PF2-NRST | I/O | RST | MCO | NRST  |
|   |   |   |   |   |   |   |   |   |   |  SPI2_MOSI  |   |
|   |   |   |   |   |   |   |   |   |   |  USART2_RX  |   |
|  - | - | - | 4 | - | 5 | 17 | PF3 | I/O | COM | USART1_TX | COMP2_INP  |
|   |   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |   |  SPI2_MISO  |   |
|   |   |   |   |   |   |   |   |   |   |  SPI1_NSS  |   |
|   |   |   |   |   |   |   |   |   |   |  TIM3_CH3  |   |
|   |   |   |   |   |   |   |   |   |   |  RTC_OUT  |   |
|  19 | 16 | 5 | - | 19 | 6 | 17 | PA0 | I/O | COM | SPI2_SCK | ADC_IN0
COMP1_INM  |
|   |   |   |   |   |   |   |   |   |   |  USART1_CTS  |   |
|   |   |   |   |   |   |   |   |   |   |  USART2_CTS  |   |
|   |   |   |   |   |   |   |   |   |   |  COMP1_OUT  |   |
|   |   |   |   |   |   |   |   |   |   |  TIM1_CH3  |   |
|   |   |   |   |   |   |   |   |   |   |  TIM1_CH1N  |   |
|   |   |   |   |   |   |   |   |   |   |  SPI1_MISO  |   |
|   |   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |   |  IR_OUT  |   |

43of 81

PY32F030 Datasheet

|  Packages |   |   |   |   |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  QFN20 F1 | QFN20 F2 | QFN20 F3 | TSSOP20 F1 | TSSOP20 F2 | TSSOP20 F3 | TSSOP20 F4 |   |   |   | Notes | Multiplexing | Additional  |
|  20 | 17 | - | - | 20 | 7 | 18 | PA1 | I/O | COM |  | SPI1_SCK | ADC_IN1
COMP1_INP  |
|   |   |   |   |   |   |   |   |   |   |   |  USART1_RT
S  |   |
|   |   |   |   |   |   |   |   |   |   |   |  USART2_RT
S  |   |
|   |   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |   |   |  SPI1_MOSI  |   |
|   |   |   |   |   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM1_CH4  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM1_CH2N  |   |
|   |   |   |   |   |   |   |   |   |   |   |  MCO  |   |
|  1 | 18 | - | 5 | 1 | 8 | 19 | PA2 | I/O | COM |  | SPI1_MOSI | ADC_IN2
COMP2_INM  |
|   |   |   |   |   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |   |   |  COMP2_OUT  |   |
|   |   |   |   |   |   |   |   |   |   |   |  SPI1_SCK  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM3_CH1  |   |
|   |   |   |   |   |   |   |   |   |   |   |  I²C_SDA  |   |
|  2 | 19 | - | 6 | 2 | 9 | 20 | PA3 | I/O | COM |  | SPI2_MISO | ADC_IN3
COMP2_INP  |
|   |   |   |   |   |   |   |   |   |   |   |  USART1_RX  |   |
|   |   |   |   |   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |   |   |  SPI1_MOSI  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM1_CH1  |   |
|   |   |   |   |   |   |   |   |   |   |   |  I²C_SCL  |   |
|  3 | 20 | 6 | - | 3 | 10 | 1 | PA4 | I/O | COM |  | SPI1_NSS | ADC_IN4  |
|   |   |   |   |   |   |   |   |   |   |   |  USART1_CK  |   |
|   |   |   |   |   |   |   |   |   |   |   |  SPI2_MOSI  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM14_CH1  |   |
|   |   |   |   |   |   |   |   |   |   |   |  USART2_CK  |   |
|   |   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |   |   |  RTC_OUT  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM3_CH3  |   |
|   |   |   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|  - | 1 | 7 | - | 4 | 11 | 13 | PA5 | I/O | COM |  | SPI1_SCK | ADC_IN5  |

44of 81

PY32F030 Datasheet

|  Packages |   |   |   |   |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  QFN20 F1 | QFN20 F2 | QFN20 F3 | TSSOP20 F1 | TSSOP20 F2 | TSSOP20 F3 | TSSOP20 F4 |   |   |   | Notes | Multiplexing | Additional  |
|   |  |  |  |  |  |  |  |  |  |  | LPTIM_ETR |   |
|   |   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM3_CH2  |   |
|   |   |   |   |   |   |   |   |   |   |   |  USART2_RX  |   |
|   |   |   |   |   |   |   |   |   |   |   |  MCO  |   |
|  - | - | 8 | - | - | - | - | NC | NC |  |  |  |   |
|  - | 2 | 9 | - | 5 | 12 | 2 | PA6 | I/O | COM |  | SPI1_MISO | ADC_IN6  |
|   |   |   |   |   |   |   |   |   |   |   |  TIM3_CH1  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM1_BKIN  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM16_CH1  |   |
|   |   |   |   |   |   |   |   |   |   |   |  COMP1_OUT  |   |
|   |   |   |   |   |   |   |   |   |   |   |  USART1_CK  |   |
|   |   |   |   |   |   |   |   |   |   |   |  RTC_OUT  |   |
|  - | 3 | 10 | - | 6 | 13 | 3 | PA7 | I/O | COM |  | SPI1_MOSI | ADC_IN7  |
|   |   |   |   |   |   |   |   |   |   |   |  TIM3_CH2  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM1_CH1N  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM14_CH1  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM17_CH1  |   |
|   |   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |   |   |  COMP2_OUT  |   |
|   |   |   |   |   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |   |   |  I²C_SDA  |   |
|   |   |   |   |   |   |   |   |   |   |   |  SPI1_MISO  |   |
|  - | - | - | - | - | - | 4 | PB0 | I/O | COM |  | SPI1_NSS | ADC_IN8  |
|   |   |   |   |   |   |   |   |   |   |   |  TIM3_CH3  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM1_CH2N  |   |
|   |   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |   |   |  COMP1_OUT  |   |
|  - | - | - | - | - | 14 | 5 | PB1 | I/O | COM |  | TIM14_CH1 | ADC_IN9
COMP1_INM  |
|   |   |   |   |   |   |   |   |   |   |   |  TIM3_CH4  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM1_CH3N  |   |
|   |   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |

45of 81

PY32F030 Datasheet

| Packages | Reset | Port type | Port structure | Functions |
| --- | --- | --- | --- | --- |
| QFN20 F1 | QFN20 F2 | QFN20 F3 | TSSOP20 F1 | TSSOP20 F2 | TSSOP20 F3 | TSSOP20 F4 | Notes | Multiplexing | Additional |
| 4 | 4 | - | 7 | 7 | 15 | 6 | Vss | S |  |  | Ground |
| 5 | - | - | 8 | - | - | - | PB2 | I/O | COM |  | USART1_RX | COMP1_INP |
| USART2_RX |
| SPI2_SCK |
| 6 | 6 | 20 | 9 | 9 | 16 | 7 | Vcc | S |  |  | Digital power supply |
| - | - | 11 | 10 | - | - | 8 | PA8 | I/O | COM |  | SPI2_NSS | - |
| USART1_CK |
| TIM1_CH1 |
| USART2_CK |
| MCO |
| EVENTOUT |
| USART1_RX |
| USART2_RX |
| SPI1_MOSI |
| I²C_SCL |
| 7 | - | 12 | 11 | - | 17 | 9 | PA9 | I/O | COM |  | SPI2_MISO | OSC32OUT |
| USART1_TX |
| TIM1_CH2 |
| MCO |
| I²C_SCL |
| EVENTOUT |
| I²C_SDA |
| TIM1_BK |
| SPI1_SCK |
| USART1_RX |
| 8 | - | - | 12 | - | 18 | 10 | PA10 | I/O | COM |  | SPI2_MOSI | OS32IN |
| USART1_RX |
| TIM1_CH3 |
| TIM17_BKIN |
| USART2_RX |
| I²C_SDA |
| EVENTOUT |
| I²C_SCL |

46of 81

PY32F030 Datasheet

|  Packages |   |   |   |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  QFN20 F1 | QFN20 F2 | QFN20 F3 | TSSOP20 F1 | TSSOP20 F2 | TSSOP20 F3 |   |   |   | Notes | Multiplexing | Additional  |
|   |  |  |  |  |  |  |  |  |  | SPI1_NSS |   |
|   |   |   |   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |   |   |   |  IR_OUT  |   |
|  - | - | - | 13 | - | - | - | PA11 | I/O | COM | SPI1_MISO | -  |
|   |   |   |   |   |   |   |   |   |   |  USART1_CTS  |   |
|   |   |   |   |   |   |   |   |   |   |  TIM1_CH4  |   |
|   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |   |  USART2_CTS  |   |
|   |   |   |   |   |   |   |   |   |   |  I²C_SCL  |   |
|   |   |   |   |   |   |   |   |   |   |  COMP1_OUT  |   |
|  - | 5 | 13 | - | 8 | - | - | PA12 | I/O | COM | SPI1_MOSI | -  |
|   |   |   |   |   |   |   |   |   |   |  USART1_RTS  |   |
|   |   |   |   |   |   |   |   |   |   |  TIM1_ETR  |   |
|   |   |   |   |   |   |   |   |   |   |  USART2_RTS  |   |
|   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |   |  I²C_SDA  |   |
|   |   |   |   |   |   |   |   |   |   |  COMP2_OUT  |   |
|  9 | 7 | 14 | 14 | 10 | 19 | 11 | PA13 (SWDIO) | I/O | COM | SWDIO | -  |
|   |   |   |   |   |   |   |   |   |   |  IR_OUT  |   |
|   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |   |  SPI1_MISO  |   |
|   |   |   |   |   |   |   |   |   |   |  TIM1_CH2  |   |
|   |   |   |   |   |   |   |   |   |   |  USART1_RX  |   |
|   |   |   |   |   |   |   |   |   |   |  MCO  |   |
|  10 | 8 | 15 | 15 | 11 | 20 | 12 | PA14 (SWCLK) | I/O | COM | SWCLK | -  |
|   |   |   |   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |   |  MCO  |   |
|  - | - | - | - | - | - | - | PA15 | I/O |  | SPI1_NSS | -  |
|   |   |   |   |   |   |   |   |   |   |  USART1_RX  |   |
|   |   |   |   |   |   |   |   |   |   |  USART2_RX  |   |

47of 81

PY32F030 Datasheet

|  Packages |   |   |   |   |   |   | Reset | Port type | Port structure | Functions  |   |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  QFN20 F1 | QFN20 F2 | QFN20 F3 | TSSOP20 F1 | TSSOP20 F2 | TSSOP20 F3 | TSSOP20 F4 |   |   |   | Notes | Multiplexing | Additional  |   |
|   |   |   |   |   |   |   |   |   |   |   |   | LED_COM0 |   |
|   |  |  |  |  |  |  |   |   |   |  |  | EVENTOUT  |   |
|  - | - | - | - | - | - | - | - | PB3 | I/O |  |  | SPI1_SCK | COMP2_INM  |
|   |   |   |   |   |   |   |   |   |   |   |   |  TIM1_CH2  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  USART1_RT S  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  USART2_RT S  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|  11 | - | 16 | 16 | - | - | - | 13 | PB4 | I/O |  |  | SPI1_MISO | COMP2_INP  |
|   |   |   |   |   |   |   |   |   |   |   |   |  TIM3_CH1  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  USART2_CT S  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  USART1_CT S  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  TIM17_BKIN  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|  12 | 9 | 17 | 17 | 12 | - | - | - | PB5 | I/O |  |  | SPI1_MOSI | -  |
|   |   |   |   |   |   |   |   |   |   |   |   |  TIM3_CH2  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  TIM16_BKIN  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  USART2_CK  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  USART1_CK  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  LPTIM_IN1  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  COMP1_OUT  |   |
|  - | 10 | 18 | 18 | 13 | - | - | - | PB6 | I/O | COM |  | USART1_TX | COMP2_INP  |
|   |   |   |   |   |   |   |   |   |   |   |   |  TIM1_CH3  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  TIM16_CH1N  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  SPI2_MISO  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  I²C_SCL  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  LPTIM_ETR  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|  13 | 11 | 19 | 19 | 14 | - | - | - | PB7 | I/O | COM |  | USART1_RX | COMP2_INM PVD_IN  |
|   |   |   |   |   |   |   |   |   |   |   |   |  SPI2_MOSI  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  TIM17_CH1N  |   |
|   |   |   |   |   |   |   |   |   |   |   |   |  USART2_RX  |   |

48of 81

PY32F030 Datasheet

|  Packages |   |   |   |   |   |   | Reset | Port type | Port structure | Functions  |   |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  QFN20 F1 | QFN20 F2 | QFN20 F3 | TSSOP20 F1 | TSSOP20 F2 | TSSOP20 F3 | TSSOP20 F4 |   |   |   | Notes | Multiplexing | Additional  |
|   |  |  |  |  |  |  |   |   |   |  | I²C_SDA |   |
|   |   |   |   |   |   |   |  EVENTOUT |   |   |   |   |   |
|  14 | 12 | - | 20 | 15 | 1 | - | PF4-BOOT0 | I/O | COM | (3) | - | BOOT0  |
|  15 | - | - | - | - | - | - | PB8 | I/O | COM |  | SPI2_SCK | COMP1_INP  |
|   |   |   |   |   |   |   |   |   |   |   |  TIM16_CH1  |   |
|   |   |   |   |   |   |   |   |   |   |   |  I²C1_SCL  |   |
|   |   |   |   |   |   |   |   |   |   |   |  USART2_TX  |   |
|   |   |   |   |   |   |   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |   |   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |   |   |   |   |   |   |  SPI2_NSS  |   |
|   |   |   |   |   |   |   |   |   |   |   |  I²C_SDA  |   |
|   |   |   |   |   |   |   |   |   |   |   |  TIM17_CH1  |   |
|   |   |   |   |   |   |   |   |   |   |   |  IR_OUT  |   |
|  - | - | - | - | - | - | - | Vss | S |  |  | Ground  |   |

1. Selecting PF2 or NRST is configured through option bytes.
2. After reset, the two pins of PA13 and PA14 are configured as SWDIO and SWCLK AF function, the former internal pull-up resistor, the latter internal pull-down resistor is activated.
3. PF4 -BOOT0 is the default digital input mode, and the pull-down is enabled.

Table 3-5 DFN8 pin definitions

|  Packages | Reset | Port type | Port structure | Notes | Functions  |   |
| --- | --- | --- | --- | --- | --- | --- |
|  DFN8 L1 |   |   |   |   | Multiplexing | Additional  |
|  1 | VCC | S |  |  | Digital power supply  |   |
|  2 | PA0 | I/O | COM |  | USART1_CTS | ADC_IN0
COMP1_INM  |
|   |   |   |   |   |  COMP1_OUT  |   |
|   |   |   |   |   |  TIM1_CH3  |   |
|   |   |   |   |   |  TIM1_CH1N  |   |
|   |   |   |   |   |  SPI1_MISO  |   |
|   |   |   |   |   |  IR_OUT  |   |
|  3 | PA1 | I/O | COM |  | SPI1_SCK | COMP1_INP
ADC_IN1  |
|   |   |   |   |   |  USART1_RTS  |   |
|   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |  SPI1_MOSI  |   |
|   |   |   |   |   |  TIM1_CH4  |   |
|   |   |   |   |   |  TIM1_CH2N  |   |
|   |   |   |   |   |  MCO  |   |

PY32F030 Datasheet

|  Packages | Reset | Port type | Port structure | Notes | Functions  |   |
| --- | --- | --- | --- | --- | --- | --- |
|  DFN8 L1 |  |  |  |  | Multiplexing | Additional  |
|  4 | PA2 | I/O | COM |  | SPI1_MOSI | COMP2_INM
ADC_IN2  |
|   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |  COMP2_OUT  |   |
|   |   |   |   |   |  SPI1_SCK  |   |
|   |   |   |   |   |  TIM3_CH1  |   |
|   |   |   |   |   |  I2C_SDA  |   |
|  5 | PF2-NRST | I/O | RST | (1) (3) (4) | MCO | NRST  |
|  5 | PB0 | I/O | COM | (3)(4) | SPI1_NSS | ADC_IN8  |
|   |   |   |   |   |  TIM3_CH3  |   |
|   |   |   |   |   |  TIM1_CH2N  |   |
|   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |  COMP1_OUT  |   |
|  6 | PA10 | I/O | COM | (3) | USART1_RX | OS32IN  |
|   |   |   |   |   |  TIM1_CH3  |   |
|   |   |   |   |   |  TIM17_BKIN  |   |
|   |   |   |   |   |  I2C_SDA  |   |
|   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |  I2C_SCL  |   |
|   |   |   |   |   |  SPI1_NSS  |   |
|   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |  IR_OUT  |   |
|  6 | PA13(SWDIO) | I/O | COM | (2) (3) | SWDIO | -  |
|   |   |   |   |   |  IR_OUT  |   |
|   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |  SPI1_MISO  |   |
|   |   |   |   |   |  TIM1_CH2  |   |
|   |   |   |   |   |  USART1_RX  |   |
|   |   |   |   |   |  MCO  |   |
|  7 | PA14(SWCLK) | I/O | COM | (2) (3) | SWCLK | -  |
|   |   |   |   |   |  USART1_TX  |   |
|   |   |   |   |   |  EVENTOUT  |   |
|   |   |   |   |   |  MCO  |   |
|  7 | PB6 | I/O | COM | (3) | USART1_TX | COMP2_INP  |
|   |   |   |   |   |  TIM1_CH3  |   |
|   |   |   |   |   |  TIM16_CH1N  |   |
|   |   |   |   |   |  I2C_SCL  |   |
|   |   |   |   |   |  LPTIM_ETR  |   |
|   |   |   |   |   |  EVENTOUT  |   |
|  8 | PB5 | I/O | COM |  | SPI1_MOSI | -  |
|   |   |   |   |   |  TIM3_CH2  |   |
|   |   |   |   |   |  TIM16_BKIN  |   |
|   |   |   |   |   |  USART1_CK  |   |
|   |   |   |   |   |  LPTIM_IN1  |   |

50of 81

PY32F030 Datasheet

|  Packages | Reset | Port type | Port structure | Notes | Functions  |   |
| --- | --- | --- | --- | --- | --- | --- |
|  DFN8 L1 |   |   |   |   | Multiplexing | Additional  |
|   |  |  |  |  | COMP1_OUT |   |

1. Selecting PF2 or NRST is configured through option bytes.
2. After reset, the two pins of PA13 and PA14 are configured as SWDIO and SWCLK AF function, the former internal pull-up resistor, the latter internal pull-down resistor is activated.
3. PF4 -BOOT0 is the default digital input mode, and the pull-down is enabled.
4. Both IO ports lead out on the same pin, only either IO port can be used at the same time, and the other IO must be configured in analog mode (MODEy[1:0] is 0B11).

# 3.1. Port A multiplexing function mapping

|  Port | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  PA0 | SPI2_SCK | USART1_CTS | - | LED_DATA_B | USART2_CTS | - | - | COMP1_OUT  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  - | USART2_TX | SPI1_MISO | - | - | TIM1_CH3 | TIM1_CH1N | IR_OUT  |
|  PA1 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI1_SCK | USART1_RTS | - | LED_DATA_C | USART2_RTS | - | - | EVENTOUT  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  - | USART2_RX | SPI1_MOSI | - | - | TIM1_CH4 | TIM1_CH2N | MCO  |
|  PA2 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI1_MOSI | USART1_TX | - | LED_DATA_D | USART2_TX | - | - | COMP2_OUT  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  - | - | SPI1_SCK | - | I²C_SDA | TIM3_CH1 | - | -  |
|  PA3 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI2_MISO | USART1_RX | - | LED_DATA_E | USART2_RX | - | - | EVENTOUT  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  - | - | SPI1_MOSI | - | I²C_SCL | TIM1_CH1 | - | -  |
|  PA4 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI1_NSS | USART1_CK | SPI2_MOSI | LED_DATA_F | TIM14_CH1 | USART2_CK | - | EVENTOUT  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  - | USART2_TX | - | - | - | TIM3_CH3 | - | RTC_OUT  |
|  PA5 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI1_SCK | - | - | LED_DATA_G | - | LPTIM1_ETR | - | EVENTOUT  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  - | USART2_RX | - | - | - | TIM3_CH2 | - | MCO  |
|  PA6 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI1_MISO | TIM3_CH1 | TIM1_BKIN | LED_DATA_DP | - | TIM16_CH1 | - | COMP1_OUT  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  USART1_CK | - | - | - | - | - | - | RTC_OUT  |
|  PA7 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI1_MOSI | TIM3_CH2 | TIM1_CH1N | - | TIM14_CH1 | TIM17_CH1 | EVENTOUT | COMP2_OUT  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  USART1_TX | USART2_TX | SPI1_MISO | - | I²C_SDA | - | - | -  |
|  PA8 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI2_NSS | USART1_CK | TIM1_CH1 | - | USART2_CK | MCO | - | EVENTOUT  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  USART1_RX | USART2_RX | SPI1_MOSI | - | I²C_SCL | - | - | -  |
|  PA9 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI2_MISO | USART1_TX | TIM1_CH2 | - | USART2_TX | MCO | I²C_SCL | EVENTOUT  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  USART1_RX | - | SPI1_SCK | - | I²C_SDA | TIM1_BKIN | - | -  |
|  PA10 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI2_MOSI | USART1_RX | TIM1_CH3 | - | USART2_RX | TIM17_BKIN | I²C_SDA | EVENTOUT  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  USART1_TX | - | SPI1_NSS | - | I²C_SCL | - | - | -  |

51of81

PY32F030 Datasheet

|  PA11 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|   |  SPI1_MISO | USART1_CTS | TIM1_CH4 | - | USART2_CTS | EVENTOUT | I²C_SCL | COMP1_OUT  |
|  PA12 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI1_MOSI | USART1_RTS | TIM1_ETR | - | USART2_RTS | EVENTOUT | I²C_SDA | COMP2_OUT  |
|  PA13 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SWDIO | IR_OUT | - | - | - | - | - | EVENTOUT  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  USART1_RX | - | SPI1_MISO | - | - | TIM1_CH2 | - | MCO  |
|  PA14 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SWCLK | USART1_TX | - | - | USART2_TX | - | - | EVENTOUT  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  - | - | - | - | - | - | - | MCO  |
|  PA15 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI1_NSS | USART1_RX | - | - | USART2_RX | - | LED_COM0 | EVENTOUT  |

## 3.2. Port B multiplexing function mapping

|  Port | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  PB0 | SPI1_NSS | TIM3_CH3 | TIM1_CH2N | - | - | EVENTOUT | - | COMP1_OUT  |
|  PB1 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  TIM14_CH1 | TIM3_CH4 | TIM1_CH3N | - | - | - | - | EVENTOUT  |
|  PB2 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  USART1_RX | SPI2_SCK | - | USART2_RX | - | - | - | -  |
|  PB3 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI1_SCK | TIM1_CH2 | - | USART1_RTS | USART2_RTS | - | LED_COM1 | EVENTOUT  |
|  PB4 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI1_MISO | TIM3_CH1 | - | USART1_CTS | USART2_CTS | TIM17_BKIN | LED_COM2 | EVENTOUT  |
|  PB5 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  SPI1_MOSI | TIM3_CH2 | TIM16_BKIN | USART1_CK | USART2_CK | LPTIM_IN1 | LED_COM3 | COMP1_OUT  |
|  PB6 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  USART1_TX | TIM1_CH3 | TIM16_CH1N | SPI2_MISO | USART2_TX | LPTIM_ETR | I²C_SCL | EVENTOUT  |
|  PB7 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  USART1_RX | SPI2_MOSI | TIM17_CH1N | - | USART2_RX | - | I²C_SDA | EVENTOUT  |
|  PB8 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  - | SPI2_SCK | TIM16_CH1 | LED_DATA_A | USART2_TX | - | I²C_SCL | EVENTOUT  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  USART1_TX | - | - | SPI2_NSS | I²C_SDA | TIM17_CH1 | - | IR_OUT  |

## 3.3. Port F multiplexing function mapping

|  Port | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  PF0-OSC_IN | - | - | TIM14_CH1 | SPI2_SCK | USART2_RX | - | - | -  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  USART1_RX | USART2_TX | - | - | I²C_SDA | - | - | -  |
|  PF1_OSC_OUT | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  - | - | - | SPI2_MISO | USART2_TX | - | - | -  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  USART1_TX | USART2_RX | SPI1_NSS | - | I²C_SCL | TIM14_CH1 | - | -  |
|  PF2-NRST | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  - | - | - | SPI2_MOSI | USART2_RX | - | MCO | -  |
|  PF3 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  USART1_TX | - | - | SPI2_MISO | USART2_TX | - | - | -  |
|   |  AF8 | AF9 | AF10 | AF11 | AF12 | AF13 | AF14 | AF15  |
|   |  - | - | SPI1_NSS | - | - | TIM3_CH3 | - | RTC_OUT  |
|  PF4-BOOT0 | AF0 | AF1 | AF2 | AF3 | AF4 | AF5 | AF6 | AF7  |
|   |  - | - | - | - | - | - | - | -  |

52of81

PY32F030 Datasheet

# 4. Memory Map

![img-22.jpeg](img-22.jpeg)
Figure 4-1 Memory map

Table 4-1 Memory address

|  Type | Boundary Address | Size | Memory Area | Description  |
| --- | --- | --- | --- | --- |
|  SRAM | 0x2000 2000-0x3FFF FFFF | - | Reserved | -  |
|   |  0x2000 0000-0x2000 1FFF | 8 Kbytes | SRAM | SRAM up to 8 KBytes depending on hardware  |
|  Code | 0x1FFF 1000-0x1FFF FFFF | - | Reserved | -  |
|   |  0x1FFF 0F80-0x1FFF 0FFF | - | Reserved | -  |
|   |  0x1FFF 0F00-0x1FFF 0F7F | 128 Bytes | Factory config | Storage of HSI trimming data, flash erase time configuration parameters  |
|   |  0x1FFF 0E80-0x1FFF 0EFF | 128 Bytes | Option bytes | option bytes  |
|   |  0x1FFF 0E00-0x1FFF 0E7F | 128 Bytes | UID | Unique ID  |
|   |  0x1FFF 0000-0x1FFF 0DFF | 3.5 Kbytes | System memory | Storage boot loader  |
|   |  0x0801 0000-0x1FFF FFFF | - | Reserved | -  |
|   |  0x0800 0000-0x0800 FFFF | 64 Kbytes | Main flash memory | -  |
|   |  0x0001 0000-0x07FF FFFF | - | Reserved | -  |

PY32F030 Datasheet

|  Type | Boundary Address | Size | Memory Area | Description  |
| --- | --- | --- | --- | --- |
|   | 0x0000 0000-0x0000 FFFF | 64 Kbytes | Select based on Boot configuration:
1) Main flash memory
2) System memory
3) SRAM | -  |

1. Except for 0x1FFF 0E00-0x1FFF 0E7F, the above spaces are marked as reserved spaces, which cannot be written and read as 0 with response error.

2.

Table 4-2 Peripheral register address

|  Bus | Boundary Address | Size | Peripheral  |
| --- | --- | --- | --- |
|   | 0xE000 0000-0xE00F FFFF | 1 Mbytes | M0+  |
|  IOPORT | 0x5000 1800-0x5FFF FFFF | - | Reserved^{(1)}  |
|   |  0x5000 1400-0x5000 17FF | 1 Kbytes | GPIOF  |
|   |  0x5000 1000-0x5000 13FF | - | Reserved  |
|   |  0x5000 0C00-0x5000 0FFF | - | Reserved  |
|   |  0x5000 0800-0x5000 0BFF | - | Reserved  |
|   |  0x5000 0400-0x5000 07FF | 1 Kbytes | GPIOB  |
|   |  0x5000 0000-0x5000 03FF | 1 Kbytes | GPIOA  |
|  AHB | 0x4002 3400-0x4FFF FFFF | - | Reserved  |
|   |  0x4002 300C-0x4002 33FF | 1 Kbytes | Reserved  |
|   |  0x4002 3000-0x4002 3008 |   | CRC  |
|   |  0x4002 2400-0x4002 2FFF | - | Reserved  |
|   |  0x4002 2124-0x4002 23FF | 1 Kbytes | Reserved  |
|   |  0x4002 2000-0x4002 2120 |   | Flash  |
|   |  0x4002 1C00-0x4002 1FFF | - | Reserved  |
|   |  0x4002 1888-0x4002 1BFF | 1 Kbytes | Reserved  |
|   |  0x4002 1800-0x4002 1884 |   | EXTI^{(2)}  |
|   |  0x4002 1400-0x4002 17FF | - | Reserved  |
|   |  0x4002 1064-0x4002 13FF | 1 Kbytes | Reserved  |
|   |  0x4002 1000-0x4002 1060 |   | RCC^{(2)}  |
|   |  0x4002 0C00-0x4002 0FFF | 1 Kbytes | Reserved  |
|   |  0x4002 0040-0x4002 03FF | 1 Kbytes | Reserved  |
|   |  0x4002 0000-0x4002 003C |   | DMA  |
|  APB | 0x4001 5C00-0x4001 FFFF | - | Reserved  |
|   |  0x4001 5880-0x4001 5BFF | 1 Kbytes | Reserved  |
|   |  0x4001 5800-0x4001 587F |   | DBG  |
|   |  0x4001 4C00-0x4001 57FF | - | Reserved  |
|   |  0x4001 4850-0x4001 4BFF | 1 Kbytes | Reserved  |
|   |  0x4001 4800-0x4001 484C |   | TIM17  |
|   |  0x4001 4450-0x4001 47FF | 1 Kbytes | Reserved  |
|   |  0x4001 4400-0x4001 404C |   | TIM16  |

54of 81

PY32F030 Datasheet
|  Bus | Boundary Address | Size | Peripheral  |
| --- | --- | --- | --- |
|   | 0x4001 3C00-0x4001 43FF | - | Reserved  |
|   | 0x4001 381C-0x4001 3BFF | 1 Kbytes | Reserved  |
|   | 0x4001 3800-0x4001 3018 |  | USART1  |
|   | 0x4001 3400-0x4001 37FF | - | Reserved  |
|   | 0x4001 3010-0x4001 33FF | 1 Kbytes | Reserved  |
|   | 0x4001 3000-0x4001 300C |  | SPI1  |
|   | 0x4001 2C50-0x4001 2FFF | 1 Kbytes | Reserved  |
|   | 0x4001 2C00-0x4001 2C4C |  | TIM1  |
|   | 0x4001 2800-0x4001 2BFF | - | Reserved  |
|   | 0x4001 270C-0x4001 27FF | 1 Kbytes | Reserved  |
|   | 0x4001 2400-0x4001 2708 |  | ADC  |
|   | 0x4001 0400-0x4001 23FF | - | Reserved  |
|   | 0x4001 0220-0x4001 03FF | 1 Kbytes | Reserved  |
|   | 0x4001 0200-0x4001 021F |  | COMP1 and COMP2  |
|   | 0x4001 0000-0x4001 01FF |  | SYSCFG  |
|   | 0x4000 B400-0x4000 FFFF | - | Reserved  |
|   | 0x4000 B000-0x4000 B3FF | - | Reserved  |
|   | 0x4000 8400-0x4000 AFFF | - | Reserved  |
|   | 0x4000 8000-0x4000 83FF | 1 Kbytes | Reserved  |
|   | 0x4000 7C28-0x4000 7FFF | 1 Kbytes | Reserved  |
|   | 0x4000 7C00-0x4000 7C24 |  | LPTIM  |
|   | 0x4000 7400-0x4000 7BFF | - | Reserved  |
|   | 0x4000 7018-0x4000 73FF | 1 Kbytes | Reserved  |
|   | 0x4000 7000-0x4000 7014 |  | PWR (3)  |
|   | 0x4000 5800-0x4000 6FFF | - | Reserved  |
|   | 0x4000 5434-0x4000 57FF | 1 Kbytes | Reserved  |
|   | 0x4000 5400-0x4000 5430 |  | I²C  |
|   | 0x4000 4800-0x4000 53FF | - | Reserved  |
|   | 0x4000 441C-0x4000 47FF | 1 Kbytes | Reserved  |
|   | 0x4000 4400-0x4000 4418 |  | USART2  |
|   | 0x4000 3C00-0x4000 43FF | - | Reserved  |
|   | 0x4000 3810-0x4000 3BFF | 1 Kbytes | Reserved  |
|   | 0x4000 3800-0x4000 380C |  | SPI2  |
|   | 0x4000 3400-0x4000 37FF | - | Reserved  |
|   | 0x4000 3014-0x4000 33FF | 1 Kbytes | Reserved  |
|   | 0x4000 3000-0x4000 0010 |  | IWDG  |
|   | 0x4000 2C0C-0x4000 2FFF | 1 Kbytes | Reserved  |
|   | 0x4000 2C00-0x4000 2C08 |  | WWDG  |
|   | 0x4000 2830-0x4000 2BFF | 1 Kbytes | Reserved  |
|   | 0x4000 2800-0x4000 282C |  | RTC (3)  |
55of 81

PY32F030 Datasheet

|  Bus | Boundary Address | Size | Peripheral  |
| --- | --- | --- | --- |
|   | 0x4000 2420-0x4000 27FF | 1 Kbytes | Reserved  |
|   |  0x4000 2400-0x4000 241C |   | LED  |
|   |  0x4000 2054-0x4000 23FF | 1 Kbytes | Reserved  |
|   |  0x4000 2000-0x4000 0050 |   | TIM14  |
|   |  0x4000 1800-0x4000 1FFF | - | Reserved  |
|   |  0x4000 1400-0x4000 17FF | - | Reserved  |
|   |  0x4000 1030-0x4000 13FF | 1 Kbytes | Reserved  |
|   |  0x4000 1000-0x4000 102C |   | Reserved  |
|   |  0x4000 0800-0x4000 0FFF | - | Reserved  |
|   |  0x4000 0450-0x4000 07FF | 1 Kbytes | Reserved  |
|   |  0x4000 0400-0x4000 044C |   | TIM3  |
|   |  0x4000 0000-0x4000 03FF | 1 Kbytes | Reserved  |

1. The address space marked as Reserved by AHB in the above table cannot be written, read is 0, and a hardfault is generated. The address space marked as Reserved by APB cannot be written, read back as 0, but no hardfault will be generated.
2. Not only supports 32 bits word access, but also supports halfword and byte access.
3. Not only supports 32 bits word access, but also supports halfword and byte access.

56of81

PY32F030 Datasheet

# 5. Electrical Characteristics

## 5.1. Test conditions

All voltages are referenced to $V_{SS}$ unless otherwise specified.

## 5.1.1. Min and Max

Unless otherwise specified, the chip is screened by mass production testing at ambient temperature $T_A = 25^{\circ}C$ and $T_A = T_{A(max)}$, guaranteed to reach the minimum value and maximum value under the worst ambient temperature, supply voltage and clock frequency conditions.

Based on electrical characterization results, design simulations, and/or process parameters noted below the table, not tested in production. Minimum and maximum values are referenced to sample testing and averaged plus or minus three times the standard deviation.

## 5.1.2. Typical value

Unless otherwise specified, typical data is based on $T_A = 25^{\circ}C$ and $V_{CC} = 3.3\ \mathrm{V}$. These data are for design guidance only and have not been tested.

Typical ADC accuracy values are obtained by sampling a standard batch, tested under all temperature ranges, and $95\%$ of the chip error is less than or equal to the given value.

## 5.2. Absolute maximum ratings

If the applied voltage exceeds the absolute maximum value given in the table below, it may cause permanent damage to the chip. Only the strength ratings that can be tolerated are listed here, and it does not imply that the functional operation of the device is correct under these conditions. Operating under maximum conditions for a long time may affect the reliability of the chip.

Table 5-1 Voltage characteristics (1)

|  Symbol | Describe | Minimum | Maximum | Unit  |
| --- | --- | --- | --- | --- |
|  Vcc | External mains power supply | -0.3 | 6.25 | V  |
|  VIN | Input voltage of other pins | -0.3 | Vcc + 0.3 | V  |

1. Power supply $V_{CC}$ and ground $V_{SS}$ pins must always be connected to the external power supply within the allowable range.

Table 5-2 Current characteristics

|  Symbol | Describe | Maximum | Unit  |
| --- | --- | --- | --- |
|  IVCC | Flowing into Vcc pin (supply current) (1) | 100 | mA  |
|  IVSS | Total current flowing out of Vss pin (outflow current) (1) | 100  |   |
|  IIO(PIN) | Output sink current of COM IO(2) | 20  |   |
|   |  Output sink current COM_L IO(2) | 80  |   |
|   |  Source current for all IOs | - 20  |   |

1. Power supply $V_{CC}$ and ground $V_{SS}$ pins must always be connected to the external power supply within the allowable range.
2. IO types can refer to pin definition terminology and symbols.

Table 5-3 Temperature characteristics

|  Symbol | Describe | Condition | Value | Unit  |
| --- | --- | --- | --- | --- |
|  TSTG | Storage temperature range |  | -65 ~ +150 | °C  |
|  TO | Range of operating temperature | x6 version | -40 ~ +85 | °C  |
|   |   |  x7 version | - 40 ~ +105  |   |

PY32F030 Datasheet

## 5.3. Operating conditions

### 5.3.1. General operating conditions

Table 5-4 General operating conditions

|  Symbol | Parameter | Condition | Minimum | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- |
|  f_{HCLK} | Internal AHB clock frequency | - | 0 | 48 | MHz  |
|  f_{PCLK} | Internal APB Clock Frequency | - | 0 | 48 | MHz  |
|  V_{CC} | Standard operating voltage | x6 version | 1.7 | 5.5 | V  |
|   |   |  x7 version | 2.0 | 5.5  |   |
|  V_{IN} | IO input voltage | - | -0.3 | V_{CC}+0.3 | V  |
|  T_{A} | Ambient temperature | x6 version | -40 | 85 | °C  |
|   |   |  x7 version | -40 | 105  |   |
|  T_{J} | Junction temperature | x6 version | -40 | 90 | °C  |
|   |   |  x7 version | -40 | 110  |   |

### 5.3.2. Power on and down operating conditions

Table 5-5 Power on and Power down Operating Conditions

|  Symbol | Parameter | Condition | Minimum | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- |
|  t_{VCC} | V_{CC} rise rate | - | 0 | ∞ | us/V  |
|   |  V_{CC} fall rate | - | 20 | ∞  |   |

### 5.3.3. Embedded reset and LVD module features

Table 5-6 Embedded Reset Module Features

|  Symbol | Parameter | Condition | Minimum | Typical | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- | --- |
|  t_{RSTTEMPO}^{(1)} | Reset time | - | - | 4.0 | 7.5 | ms  |
|  V_{POR/PDR} | POR/PDR reset threshold | rising edge | 1.50^{(2)} | 1.60 | 1.70 | V  |
|   |   |  falling edge | 1.45^{(1)} | 1.55 | 1.65^{(2)} | V  |
|  V_{BOR1} | BOR threshold 1 | rising edge | 1.70^{(2)} | 1.80 | 1.90 | V  |
|   |   |  falling edge | 1.60 | 1.70 | 1.80^{(2)} | V  |
|  V_{BOR2} | BOR threshold 2 | rising edge | 1.90^{(2)} | 2.00 | 2.10 | V  |
|   |   |  falling edge | 1.80 | 1.90 | 2.00^{(2)} | V  |
|  V_{BOR3} | BOR threshold 3 | rising edge | 2.10^{(2)} | 2.20 | 2.30 | V  |
|   |   |  falling edge | 2.00 | 2.10 | 2.20^{(2)} | V  |
|  V_{BOR4} | BOR threshold 4 | rising edge | 2.30^{(2)} | 2.40 | 2.50 | V  |
|   |   |  falling edge | 2.20 | 2.30 | 2.40^{(2)} | V  |
|  V_{BOR5} | BOR threshold 5 | rising edge | 2.50^{(2)} | 2.60 | 2.70 | V  |
|   |   |  falling edge | 2.40 | 2.50 | 2.60^{(2)} | V  |
|  V_{BOR6} | BOR threshold 6 | rising edge | 2.70^{(2)} | 2.80 | 2.90 | V  |
|   |   |  falling edge | 2.60 | 2.70 | 2.80^{(2)} | V  |
|  V_{BOR7} | BOR threshold 7 | rising edge | 2.90^{(2)} | 3.00 | 3.10 | V  |
|   |   |  falling edge | 2.80 | 2.90 | 3.00^{(2)} | V  |
|  V_{BOR8} | BOR threshold 8 | rising edge | 3.10^{(2)} | 3.20 | 3.30 | V  |

58of81

PY32F030 Datasheet

|  Symbol | Parameter | Condition | Minimum | Typical | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- | --- |
|   |  | falling edge | 3.00 | 3.10 | 3.20 (2) | V  |
|  V_{PVD0} | PVD threshold 0 | rising edge | 1.70 (2) | 1.80 | 1.90 | V  |
|   |   |  falling edge | 1.60 | 1.70 | 1.80 (2) | V  |
|  V_{PVD1} | PVD Threshold 1 | rising edge | 1.90 (2) | 2.00 | 2.10 | V  |
|   |   |  falling edge | 1.80 | 1.90 | 2.00 (2) | V  |
|  V_{PVD2} | PVD Threshold 2 | rising edge | 2.10 (2) | 2.20 | 2.30 | V  |
|   |   |  falling edge | 2.00 | 2.10 | 2.20 (2) | V  |
|  V_{PVD3} | PVD Threshold 3 | rising edge | 2.30 (2) | 2.40 | 2.50 | V  |
|   |   |  falling edge | 2.20 | 2.30 | 2.40 (2) | V  |
|  V_{PVD4} | PVD Threshold 4 | rising edge | 2.50 (2) | 2.60 | 2.70 | V  |
|   |   |  falling edge | 2.40 | 2.50 | 2.60 (2) | V  |
|  V_{PVD5} | PVD threshold 5 | rising edge | 2.70 (2) | 2.80 | 2.90 | V  |
|   |   |  falling edge | 2.60 | 2.70 | 2.80 (2) | V  |
|  V_{PVD6} | PVD threshold 6 | rising edge | 2.90 (2) | 3.00 | 3.10 | V  |
|   |   |  falling edge | 2.80 | 2.90 | 3.00 (2) | V  |
|  V_{PVD7} | PVD threshold 7 | rising edge | 3.10 (2) | 3.20 | 3.30 | V  |
|   |   |  falling edge | 3.00 | 3.10 | 3.20 (2) | V  |
|  V_{POR_PDR_hyst}(1) | POR / PDR hysteresis voltage | - | - | 50 | - | mV  |
|  V_{PVD_BOR_hyst}(1) | PVD hysteresis voltage | - | - | 100 | - | mV  |
|  I_{DD}(PVD) | PVD power consumption | - | - | 0.6 | - | uA  |
|  I_{DD(BOR)} | BOR power consumption | - | - | 0.6 | - | uA  |

1. Guaranteed by design, not tested in production.
2. Data is based on assessment results and is not tested in production.

## 5.3.4. Operating current characteristics

Table 5-7 Run mode current

| Symbol | Condition | Typical(1) | Maximum | Unit |
| --- | --- | --- | --- | --- |
| System clock | Frequency | Code | Run | Peripheral clock | FLASH sleep |
| I_{DD}(run) | PLL | 48 MHz | While(1) | Flash | ON | DISABLE | 2.6 | - | mA |
| OFF | DISABLE | 1.7 | - |
| HSI | 24 MHz | ON | DISABLE | 1.5 | - |
| OFF | DISABLE | 0.9 | - |
| 16 MHz | ON | DISABLE | 1.1 | - |
| OFF | DISABLE | 0.7 | - |
| 8 MHz | ON | DISABLE | 0.7 | - |
| OFF | DISABLE | 0.5 | - |
| 4 MHz | ON | DISABLE | 0.5 | - |
| OFF | DISABLE | 0.35 | - |
| LSI |  | ON | DISABLE | 170 | - | uA |

PY32F030 Datasheet

|  Symbol | Condition |   |   |   |   |   | Typical(1) | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|   |  System clock | Frequency | Code | Run | Peripheral clock | FLASH sleep  |   |   |   |
|   |  | 32.768 kHz |  |  | OFF | DISABLE | 170 | - |   |
|   |  LSI | 32.768 kHz |   |   | ON | ENABLE | 95 | - | uA  |
|   |   |   |   |   |  OFF | ENABLE | 95 | -  |   |

1. Data is based on assessment results and is not tested in production.

Table 5-8 Sleep mode current

|  Symbol | Condition |   |   |   | Typical (1) | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- | --- | --- |
|   |  System clock | Frequency | Peripheral clock | FLASH sleep  |   |   |   |
|  I_{DD}(sleep) | PLL | 48 MHz | ON | DISABLE | 1.80 | - | mA  |
|   |   |   |  OFF | DISABLE | 1.10 | - | mA  |
|   |  HSI | 24 MHz | ON | DISABLE | 1.00 | - | mA  |
|   |   |   |  OFF | DISABLE | 0.60 | - | mA  |
|   |   |  16 MHz | ON | DISABLE | 0.75 | - | mA  |
|   |   |   |  OFF | DISABLE | 0.50 | - | mA  |
|   |   |  8 MHz | ON | DISABLE | 0.50 | - | mA  |
|   |   |   |  OFF | DISABLE | 0.35 | - | mA  |
|   |   |  4 MHz | ON | DISABLE | 0.40 | - | mA  |
|   |   |   |  OFF | DISABLE | 0.35 | - | mA  |
|   |  LSI | 32.768 kHz | ON | DISABLE | 170.00 | - | uA  |
|   |   |   |  OFF | DISABLE | 170.00 | - | uA  |
|   |   |  32.768 kHz | ON | ENABLE | 95.00 | - | uA  |
|   |   |   |  OFF | ENABLE | 96.00 | - | uA  |

1. Data is based on assessment results and is not tested in production.

Table 5-9 Stop mode current

|  Symbol | Condition |   |   |   |   | Typical(1) | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|   |  V_{CC} | V_{DD} | MR/LPR | LSI | Peripheral clock  |   |   |   |
|  I_{DD}(stop) | 1.7~5.5 V | 1.2 V | MR | - | - | 70.00 | - | uA  |
|   |   |  1.2 V | LPR | ON | RTC+IWDG+LPTIM | 6.00 | -  |   |
|   |   |   |   |   |  IWDG | 6.00 | -  |   |
|   |   |   |   |   |  LPTIM | 6.00 | -  |   |
|   |   |   |   |   |  RTC | 6.00 | -  |   |
|   |   |   |   |  OFF | No | 6.00 | -  |   |
|   |   |  1.0 V |   | ON | RTC+IWDG+LPTIM | 4.50 | -  |   |
|   |   |   |   |   |  IWDG | 4.50 | -  |   |
|   |   |   |   |   |  LPTIM | 4.50 | -  |   |
|   |   |   |   |   |  RTC | 4.50 | -  |   |
|   |   |   |   |  OFF | No | 4.50 | -  |   |

1. Data is based on assessment results and is not tested in production.

## 5.3.5. Low power mode wake-up time

60of 81

PY32F030 Datasheet

Table 5-10 Low power mode wake-up time

|  Symbol | Parameters^{(1)} |   | Condition |   | Typical^{(2)} | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  tWUSLEEP | Wake-up time from sleep |   | - |   | 1.65 | - | us  |
|  tWUSTOP | Wake-up time from stop | Powered by MR | Execute program in Flash, HSI (24 Mhz) as system clock |   | 3.50 | - | us  |
|   |   |  Powered by LPR | Execute program in Flash, HSI as system clock | VDD=1.2 V | 6.00 | - | us  |
|   |   |   |   |  VDD=1.0 V | 6.00 | -  |   |

1. The wake-up time is measured from the wake-up time until the first instruction is read by the user program.
2. Data is based on assessment results and is not tested in production.

## 5.3.6. External clock source characteristics

### 5.3.6.1. External high-speed clock

In the bypass mode of HSE (the HSEBYP of RCC_CR is set), when the high-speed start-up circuit in the chip stops working, the corresponding IO is used as a standard GPIO.

![img-23.jpeg](img-23.jpeg)
Figure 5-1 External high-speed clock timing diagram

Table 5-11 External high-speed clock features

|  Symbol | Parameters^{(1)} | Minimum | Typical | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- |
|  fHSE_ext | User external clock frequency | 0 | 8 | 32 | MHz  |
|  VHSEH | Input pin high level voltage | 0.7 Vcc | - | Vcc | V  |
|  VHSEL | Input pin low level voltage | Vss | - | 0.3 Vcc  |   |
|  tW(HSEH)
tW(HSEL) | Enter high or low time | 1 5 | - | - | ns  |
|  tr(HSE)
tr(HSE) | Enter the rise/fall time | - | - | 20 | ns  |

1. Guaranteed by design, not tested in production.

### 5.3.6.2. External low-speed clock

In LSE's bypass mode (RCC_BDCR LSEBYP position), the low-speed starter circuit within the chip stops working, and the corresponding IO is used as a standard GPIO.

61of81

PY32F030 Datasheet

![img-24.jpeg](img-24.jpeg)
Figure 5-2 External low-speed clock timing diagram

Table 5-12 External high-speed clock features

|  Symbol | Parameter(1) | Minimum | Typical | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- |
|  fLSE_ext | User external clock frequency | - | 32.786 | 1000 | kHz  |
|  VLSEH | Input pin high level voltage | 0.7Vcc | - | - | V  |
|  VLSEL | Input pin low level voltage | - | - | 0.3Vcc  |   |
|  tW(LSEH)
tW(LSEL) | Enter high or low time | 450 | - | - | ns  |
|  tr(LSE)
tr(LSE) | Enter the rise/fall time | - | - | 50 | ns  |

1. Guaranteed by design, not tested in production.

## 5.3.6.3. External high-speed crystal

An external 4~32MHz crystal/ceramic resonator. In the application, the crystal and load capacitors should be as close as possible to the pins to minimize output distortion and start-up settling time.

Table 5-13 External high-speed crystal characteristics

|  Symbol | Parameter | Condition(1) | Minimum(2) | Typical | Maximum(2) | Unit  |
| --- | --- | --- | --- | --- | --- | --- |
|  fOSC_IN | Oscillation frequency | - | 4 | - | 32 | MHz  |
|  IDD(4) | HSE power consumption | During startup | - | - | 5.5 | mA  |
|   |   |  Vcc=3 V, Rm=30 α, CL=10 pF@8 MHz | - | 0.58 | -  |   |
|   |   |  Vcc=3 V,Rm=45 α, CL=10 pF@8 MHz | - | 0.59 | -  |   |
|   |   |  Vcc=3 V,Rm=30 α, CL=5 pF@48 MHz | - | 0.89 | -  |   |
|   |   |  Vcc=3 V,Rm=30 α, CL=10 pF@48 MHz | - | 1.14 | -  |   |
|   |   |  Vcc=3 V,Rm=30 α, CL=20 pF@48 MHz | - | 1.94 | -  |   |
|  tSU (HSE)(3)(4) | Start Time | fOSC_IN=32 MHz | - | 3 | - | ms  |
|   |   |  fOSC_IN=4 MHz | - | 15 | -  |   |

1. Crystal/ceramic resonator characteristics are based on the manufacturer datasheet.
2. Guaranteed by design, not tested in production.
3. tSU(HSE) is the start-up time from enable (by software) to the clock oscillation reaches stability, measured for a standard crystal/resonator, which can vary greatly from one crystal/resonator to another.
4. Data is based on assessment results and is not tested in production.

62of81

PY32F030 Datasheet

## 5.3.6.4. External low-speed crystal

An external 32.768 kHz crystal/ceramic resonator can be used. In the application, the crystal and load capacitors should be as close as possible to the pins to minimize output distortion and start-up settling time.

Table 5-14 External high-speed crystal characteristics

|  Symbol | Parameter | Condition(1) | Minimum(2) | Typical | Maximum(2) | Unit  |
| --- | --- | --- | --- | --- | --- | --- |
|  I_{DD}(4) | LSE power consumption | LSE_DRIVER [1:0] = 00 | - | - | - | nA  |
|   |   |  LSE_DRIVER [1:0] = 01 | - | 560 | -  |   |
|   |   |  LSE_DRIVER [1:0] = 10 | - | 920 | -  |   |
|   |   |  LSE_DRIVER [1:0] = 11 | - | 1260 | -  |   |
|  t_{SU(LSE)}(3) (4) | Start Time | - | - | 3 | - | s  |

1. Crystal/ceramic resonator characteristics are based on the manufacturer datasheet.
2. Guaranteed by design, not tested in production.
3. $t_{\mathrm{SU(LSE)}}$ is the start-up time from enable (by software) to the clock oscillation reaches stability, measured for a standard crystal/resonator, which can vary greatly from one crystal/resonator to another.
4. Data is based on assessment results and is not tested in production.

## 5.3.7. Internal high frequency clock source HSI characteristics

Table 5-15 Internal high frequency clock source characteristics

|  Symbol | Parameter | Condition | Minimum | Typical | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- | --- |
|  f_{HSI} | HSI frequency | T_{A}=25°C, V_{CC}=3.3 V | 23.83(2) | 24.00 | 24.17(2) | MHz  |
|   |   |   |  21.97(2) | 22.12 | 22.27(2)  |   |
|   |   |   |  15.89(2) | 16.00 | 16.11(2)  |   |
|   |   |   |  7.94(2) | 8.00 | 8.06(2)  |   |
|   |   |   |  3.97(2) | 4.00 | 4.03(2)  |   |
|  Δ_{Temp(HSI)} | HSI frequency temperature drift | T_{A}=0 ~ 85 °C | -2(2) | - | 2(2) | %  |
|   |   |  T_{A}=-40 ~ 85 °C | -4(2) | - | 2(2)  |   |
|   |   |  T_{A}=-40 ~ 105 °C | -4(2) | - | 2.5(2)  |   |
|  f_{TRIM}(1) | HSI fine-tuning accuracy | - | - | 0.1 | - | %  |
|  D_{HSI}(1) | Duty cycle | - | 45(1) | - | 55(1) | %  |
|  t_{Stab(HSI)} | HSI stabilization time | - | - | 2 | 4(1) | us  |
|  I_{DD(HSI)}(2) | HSI power consumption | 4 MHz | - | 100 | - | uA  |
|   |   |  8 MHz | - | 105 | -  |   |
|   |   |  16 MHz | - | 150 | -  |   |
|   |   |  22.12 MHz, 24 MHz | - | 180 | -  |   |

1. Guaranteed by design, not tested in production.
2. Data is based on assessment results and is not tested in production.

## 5.3.8. Internal low frequency clock source LSI characteristics

Table 5-16 Internal low frequency clock characteristics

|  Symbol | Parameter | Condition | Minimum | Typical | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- | --- |
|  f_{LSI} | LSI frequency | T_{A}=25 °C, V_{CC}=3.3 V | -3 | - | +3 | %  |
|  Δ_{Temp(LSI)} | LSI frequency temperature drift | T_{A}=0 ~ 85 °C | -10(2) | - | 10(2) | %  |
|   |   |  T_{A}=-40 ~ 105 °C | -20(2) | - | 20(2) | %  |

PY32F030 Datasheet

|  Symbol | Parameter | Condition | Minimum | Typical | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- | --- |
|  f_{TRIM}(1) | LSI fine-tuning accuracy | - | - | 0.2 | - | %  |
|  t_{Stab}(LSI)(1) | LSI stabilization time | - | - | 150 | - | us  |
|  l_{DD}(LSI)(1) | LSI power consumption | - | - | 210 | - | nA  |

1. Guaranteed by design, not tested in production.
2. Data is based on assessment results and is not tested in production.

## 5.3.9. Phase-locked loop PLL characteristics

Table 5-17 Phase-locked loop characteristics

|  Symbol | Parameter | Condition | Minimum |   | Typical | Maximum | Unit  |   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|   |   |   |   |  Default |   |   |   | - E(2)  |
|  f_{PLL_IN} | Enter the frequency | T_{A}=25°C, V_{CC}=3.3 V | x6 version | 16^{(1)} | 24 | - | 24^{(1)} | MHz  |
|   |   |   |  x7 version | 24 | 24 | - | 24  |   |
|  f_{PLL_OUT} | Output frequency | T_{A}=25°C, V_{CC}=3.3 V | x6 version | 32^{(1)} | 48 | - | 48 | MHz  |
|   |   |   |  x7 version | 48 | - | - | 48  |   |
|  Jitter | Periodic jitter | - |   | - | - | - | 0.3^{(1)} | ns  |
|  t_{LOCK} | Latch time | f_{PLL_IN}=24MHz |   | - | - | 15 | 40^{(1)} | us  |

1. Guaranteed by design, not tested in production.

## 5.3.10. Memory characteristics

Table 5-18 Memory characteristics

|  Symbol | Parameter | Condition | Typical | Maximum^{(1)} | Unit  |
| --- | --- | --- | --- | --- | --- |
|  t_{prog} | Page program | - | 1.0 | 1.5 | ms  |
|  t_{ERASE} | Page/sector/mass erase | - | 3.0 | 4.5 | ms  |
|  l_{DD} | Page programe | - | 2.1 | 2.9 | mA  |
|   |  Page/sector/mass erase | - | 2.1 | 2.9 | mA  |

1. Guaranteed by design, not tested in production.

Table 5-19 Memory erase times and data retention

|  Symbol | Parameter | Condition | Minimum^{(1)} | Unit  |
| --- | --- | --- | --- | --- |
|  N_{END} | Erase and write times | T_{A} = -40 ~ 85 °C | 100 | kcycle  |
|   |   |  T_{A} = 85 ~ 105 °C | 10  |   |
|  t_{RET} | Data retention period | 10 kcycle T_{A} = 55 °C | 20 | Year  |

1. Data is based on assessment results and is not tested in production.

## 5.3.11. EFT characteristics

Table 5-20 EFT characteristics

|  Symbol | Parameter | Condition | Grade | Typical | Unit  |
| --- | --- | --- | --- | --- | --- |
|  EFT to Power | - | IEC61000-4-4 | A | 4 | KV  |

## 5.3.12. ESD &amp; LU Characteristics

64of 81

PY32F030 Datasheet

Table 5-21 ESD &amp; LU characteristics

|  Symbol | Parameter | Condition | Typical | Unit  |
| --- | --- | --- | --- | --- |
|  V_{ESD(HBM)} | Static Discharge Voltage (human body model) | ESDA/JEDEC JS-001-2017 | 6 | KV  |
|  V_{ESD(CDM)} | Static Discharge Voltage (charging equipment model) | ESDA/JEDEC JS-002-2018 | 1 | KV  |
|  V_{ESD(MM)} | Static discharge voltage (machine model) | JESD22-A115C | 200 | V  |
|  LU | Static Latch-Up | JESD78E | 200 | mA  |

## 5.3.13. Port characteristics

Table 5-22 IO static characteristics

|  Symbol | Parameter | Condition | Minimum | Typical | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- | --- |
|  V_{IH} | Input high level voltage | V_{CC}=1.7 ~ 5.5 V | 0.7 V_{CC} | - | - | V  |
|  V_{IL} | Input low level voltage | V_{CC}=1.7 ~ 5.5 V | - | - | 0.3 V_{CC} | V  |
|  V_{hys}(1) | Schmitt hysteresis voltage | - | - | 200 | - | mV  |
|  I_{kg} | Input leakage current | - | - | - | 1 | uA  |
|  R_{PU} | Pull-up resistor | - | 30 | 50 | 70 | kΩ  |
|  R_{PD} | Pull-down resistor | - | 30 | 50 | 70 | kΩ  |
|  C_{IO}(1) | Pin capacitance | - | - | 5 | - | pF  |

1. Guaranteed by design, not tested in production.

Table 5-23 Output Voltage Characteristics

|  Symbol | Parameters (1) | condition | minimum | maximum | unit  |
| --- | --- | --- | --- | --- | --- |
|  V_{OL} | COM IO output low level | I_{OL} = 8 mA, V_{CC} ≥ 2.7 V | - | 0.4 | V  |
|   |   |  I_{OL} = 4 mA, V_{CC} = 1.8 V | - | 0.5  |   |
|  V_{OL}(3) | COM_L IO^{(2)} output low level | I_{OL} = 20 mA, V_{CC} ≥ 2.7 V | - | 0.7 | V  |
|   |   |  I_{OL} = 10 mA, V_{CC} = 1.8 V | - | 0.6  |   |
|   |   |  I_{OL} = 40 mA, V_{CC} ≥ 2.7 V | - | 0.7  |   |
|   |   |  I_{OL} = 20 mA, V_{CC} = 1.8 V | - | 0.6  |   |
|   |   |  I_{OL} = 60 mA, V_{CC} ≥ 2.7 V | - | 0.7  |   |
|   |   |  I_{OL} = 30 mA, V_{CC} = 1.8 V | - | 0.6  |   |
|   |   |  I_{OL} = 80 mA, V_{CC} ≥ 2.7 V | - | 0.7  |   |
|   |   |  I_{OL} = 40 mA, V_{CC} = 1.8 V | - | 0.6  |   |
|  V_{OH} | COM IO output high level | I_{OH} = 8 mA, V_{CC} ≥ 2.7 V | V_{CC}-0.4 | - | V  |
|   |   |  I_{OH} = 4 mA, V_{CC} = 1.8 V | V_{CC}-0.5 | -  |   |

1. IO types can refer to the terms and symbols defined by the pins.
2. COM_L IO current 80mA/60mA/40mA/20mA can be software set.
3. Data is based on assessment results and is not tested in production.

## 5.3.14. NRST pin characteristics

Table 5-24 NRST pin characteristics

|  Symbol | Parameter | Condition | Minimum | Typical | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- | --- |
|  V_{IH} | Input high level voltage | V_{CC}=1.7 ~ 5.5 V | 0.7V_{CC} | - | - | V  |
|  V_{IL} | Input low level voltage | V_{CC}=1.7 ~ 5.5 V | - | - | 0.2V_{CC} | V  |
|  V_{hys}(1) | Schmitt hysteresis voltage | - | - | 300 | - | mV  |

65of81

PY32F030 Datasheet

|  I_{kg} | Input leakage current | - | - | - | 1 | uA  |
| --- | --- | --- | --- | --- | --- | --- |
|  R_{PU}(1) | Pull-up resistor | - | 30 | 50 | 70 | kΩ  |
|  R_{PD}(1) | Pull-down resistor | - | 30 | 50 | 70 | kΩ  |
|  C_{IO} | Pin capacitance | - | - | 5 | - | pF  |

1. Guaranteed by design, not tested in production.

## 5.3.15. ADC characteristics

Table 5-25 ADC characteristics

|  Symbol | Parameter | Condition | Minimum | Typical | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- | --- |
|  I_{DD} | Power consumption | @0.75MSPS | - | 1.0 | - | mA  |
|  C_{IN}(1) | Internal sample and hold capacitors | - | - | 5 | - | pF  |
|  f_{ADC} | Convert clock frequency | V_{CC}=1.7 ~ 2.3 V | 1 | 4 | 6^{(2)} | MHz  |
|   |   |  V_{CC}=2.3 ~ 5.5 V | 1 | 8 | 12^{(2)} | MHz  |
|  t_{samp}(1) | Sampling time | V_{CC}=1.7~ 2.3 V | 0.2 | - | - | us  |
|   |   |  V_{CC}=2.3 ~ 5.5 V | 0.1 | - | - | us  |
|  t_{conv}(1) | Total conversion time | - | - | 12*Tclk | - | -  |
|  t_{eoc}(1) | Conversion end time | - | - | 0.5*Tclk | - | -  |
|  DNL(2) | - | - | - | ±2 | - | LSB  |
|  INL(2) | - | - | - | ±3 | - | LSB  |
|  Offset(2) | - | - | - | ±2 | - | LSB  |

1. Guaranteed by design, not tested in production.
2. Data is based on assessment results and is not tested in production.

## 5.3.16. Comparator characteristics

Table 5-26 Comparator features(1)

|  Symbol | Parameter | Condition |   | Minimum | Typical | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  V_{IN} | Input voltage range | - |   | 0 | - | V_{CC} | V  |
|  V_{BG} | Scale input voltage | - |   | V_{REFINT} |   |   |   |
|  V_{SC} | Scaler offset voltage | - |   | - | ±5 | ±10 | mV  |
|  I_{DD}(SCALER) | Scaler static consumption | - |   | - | 0.8 | 1 | uA  |
|  t_{START}_SCALER | Scaler startup time | - |   | - | 100 | 200 | us  |
|  t_{START} | Startup time to reach propagation delay specification | High-speed mode |   | - | - | 5 | us  |
|   |   |  Medium-speed mode |   | - | - | 15  |   |
|  t_{D} | Propagation delay | 200 mV step; 100 mV overdrive | High-speed mode | - | 40 | 70 | ns  |
|   |   |   |  Medium-speed mode | - | 0.9 | 2.3 | us  |
|   |   |  >200 mV step;100 mV overdrive | High-speed mode | - | - | 85 | us  |
|   |   |   |  Medium-speed mode | - | - | 3.4 | ns  |
|  V_{offset} | Offset error | - |   | - | ±5 | - | mV  |

PY32F030 Datasheet

|  Symbol | Parameter | Condition |   | Minimum | Typical | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  V_{hys} | Hysteresis | No hysteresis |   | - | 0 | - | mV  |
|   |   |  With hysteresis |   | - | 20 | -  |   |
|  I_{DD} | Consumption | Medium-speed mode; No deglitcher | Static | - | 5 | - | uA  |
|   |   |   |  With 50 kHz and ±100 mv overdrive square signal | - | 6 | - | uA  |
|   |   |  Medium-speed mode With de-glitcher | Static | - | 7 | - | uA  |
|   |   |   |  With 50 kHz and ±100 mv overdrive square signal | - | 8 | - | uA  |
|   |   |  High-speed mode; No deglitcher | Static | - | 250 | - | uA  |
|   |   |   |  With 50 kHz and ±100 mv overdrive square signal | - | 250 | - | uA  |

1. Guaranteed by design, not tested in production.

## 5.3.17. Temperature sensor characteristics

Table 5-27 Temperature sensor characteristics

|  Symbol | Parameter | Minimum | Typical | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- |
|  T_{L}(1) | V_{TS} linearity with temperature | - | ±1 | ±2 | °C  |
|  Avg_Slope(1) | Average slope | 2.3 | 2.5 | 2.7 | mV/°C  |
|  V_{30} | Voltage at 30°C(±5°C) | 0.742 | 0.76 | 0.785 | V  |
|  t_{START}(1) | Start-up time entering in continuous mode | - | 70 | 120 | us  |
|  t_{S_temp}(1) | ADC sampling time when reading the temperature | 9 | - | - | us  |

1. Guaranteed by design, not tested in production.
2. Data is based on assessment results and is not tested in production.

## 5.3.18. Built-in reference voltage characteristics

Table 5-28 Built-in reference voltage characteristics

|  Symbol | Parameter | Minimum | Typical | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- |
|  V_{REFINT} | Internal reference voltage | 1.17 | 1.2 | 1.23 | V  |
|  t_{start_vrefint} | Start time of internal reference voltage | - | 10 | 15 | us  |
|  T_{coeff} | Temperature coefficient | - | - | 100^{(1)} | ppm/°C  |
|  I_{vcc} | Current consumption from V_{CC} | - | 12 | 20 | uA  |

1. Guaranteed by design, not tested in production.

## 5.3.19. Timer features

Table 5-29 Timer features

|  Symbol | Parameter | Condition | Minimum | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- |
|  t_{res}(TIM) | Timer resolution time | - | 1 | - | t_{TIMxCLK}  |
|   |   |  f_{TIMxCLK} = 48 MHz | 20.833 | - | ns  |

PY32F030 Datasheet

|  fEXT | Timer external clock frequency on CH1 to CH4 | - | - | fTIMxCLK/2 | MHz  |
| --- | --- | --- | --- | --- | --- |
|   |   |  fTIMxCLK = 48 MHz | - | 24  |   |
|  ResTIM | Timer resolution | TIM1/3/14/16/17 | - | 16 | Bit  |
|  tCOUNTER | 16-bit counter clock period | - | 1 | 65536 | tTIMxCLK  |
|   |   |  fTIMxCLK = 48 MHz | 0.020833 | 1365 | us  |

Table 5-30 LPTIM characteristics (clock selection LSI)

|  Prescaler | PRESC[2:0] | Minimum overflow | Maximum overflow | Unit  |
| --- | --- | --- | --- | --- |
|  /1 | 0 | 0.0305 | 1998.848 | ms  |
|  /2 | 1 | 0.0610 | 3997.696  |   |
|  /4 | 2 | 0.1221 | 8001.9456  |   |
|  /8 | 3 | 0.2441 | 15997.3376  |   |
|  /16 | 4 | 0.4883 | 32001.2288  |   |
|  /32 | 5 | 0.9766 | 64002.4576  |   |
|  /64 | 6 | 1.9531 | 127998.3616  |   |
|  /128 | 7 | 3.9063 | 256003.2768  |   |

Table 5-31 IWDG characteristics (clock selection LSI)

|  Prescaler | PR[2:0] | Minimum overflow | Maximum overflow | Unit  |
| --- | --- | --- | --- | --- |
|  /4 | 0 | 0.122 | 499.712 | ms  |
|  /8 | 1 | 0.244 | 999.424  |   |
|  /16 | 2 | 0.488 | 1998.848  |   |
|  /32 | 3 | 0.976 | 3997.696  |   |
|  /64 | 4 | 1.952 | 7995.392  |   |
|  /128 | 5 | 3.904 | 15990.784  |   |
|  /256 | 6 or 7 | 7.808 | 31981.568  |   |

Table 5-32 WWDG characteristics (clock select 48 MHz PCLK)

|  Prescaler | WDGTB[1:0] | Minimum overflow | Maximum overflow | Unit  |
| --- | --- | --- | --- | --- |
|  1*4096 | 0 | 0.085 | 5.461 | ms  |
|  2*4096 | 1 | 0.171 | 10.923  |   |
|  4*4096 | 2 | 0.341 | 21.845  |   |
|  8*4096 | 3 | 0.683 | 43.691  |   |

## 5.3.20. Communication port characteristics

### 5.3.20.1. I²C bus interface features

I²C interface meets the requirements of the I²C -bus specification and user manual :

- Standard-mode(Sm): 100 kbit/s
- Fast-mode(Fm): 400 kbit/s

Timing is guaranteed by design, provided the I²C peripheral is properly configured and the I²C CLK frequency is greater than the minimum required in the table below.

68of 81

PY32F030 Datasheet

Table 5-33 Minimum I²C CLK frequency

|  Symbol | Parameter | Condition | Minimum | Unit  |
| --- | --- | --- | --- | --- |
|  f_{I2CCLK(min)} | Minimum I²C CLK frequency | Standard-mode | 2 | MHz  |
|   |   |  Fast-mode | 9  |   |

I²C SDA and SCL pins have analog filtering, see table below.

Table 5-34 I²C filter characteristics

|  Symbol | Parameter | Minimum | Maximum | Unit  |
| --- | --- | --- | --- | --- |
|  t_{AF} | Limiting duration of spikes suppressed by the filter (Spikers shorter than the limiting duration are suppressed) | 50 | 260 | ns  |

## 5.3.20.2. Serial Peripheral Interface SPI Characteristics

Table 5-35 SPI characteristics

|  Symbol | Parameter | Condition | Minimum | Maximum | Unit  |
| --- | --- | --- | --- | --- | --- |
|  f_{SCK} | SPI clock frequency | Master mode | - | 12 | MHz  |
|  1/f_{c(SCK)} |   | Slave mode | - | 12  |   |
|  t_{r(SCK)} | SPI clock rise and fall time | Capacitive load: C=15 pF | - | 6 | ns  |
|  t_{t(SCK)}  |   |   |   |   |   |
|  t_{su(NSS)} | NSS setup time | Slave mode | 4Tpclk | - | ns  |
|  t_{h(NSS)} | NSS hold time | Slave mode | 2Tpclk + 10 | - | ns  |
|  t_{w(SCKH)} | SCK high and low time | Master mode,presc = 4 | Tpclk*2 -2 | Tpclk*2 + 1 | ns  |
|  t_{w(SCKL)}  |   |   |   |   |   |
|  t_{su(MI)} | Data input setup time | Master mode,presc = 4 | Tpclk+5^{(1)} | - | ns  |
|  t_{su(SI)} |   | Slave mode,presc = 4 | 5 | -  |   |
|  t_{h(MI)} | Data input hold time | Master mode | 5 | - | ns  |
|  t_{h(SI)} |   | Slave mode | Tpclk+5 | -  |   |
|  t_{a(SO)} | Data output access time | Slave mode, presc = 4 | 0 | 3Tpclk | ns  |
|  t_{dis(SO)} | Data output disable time | Slave mode | 2Tpclk+5 | 4Tpclk+5 | ns  |
|  t_{v(SO)} | Data output valid time | Slave mode (after enable edge),presc = 4 | 0 | 1.5Tpclk^{(2)} | ns  |
|  t_{v(MO)} | Data output valid time | Master mode (after enable edge) | - | 6 | ns  |
|  t_{h(SO)} | Data output hold time | Slave mode,presc = 4 | 0^{(3)} | - | ns  |
|  t_{h(MO)} |   | Master mode | 2 | -  |   |
|  DuCy(SCK) | SPI slave input clock duty cycle | Slave mode | 45 | 55 | %  |

1. The Master generates 1 pclk to receive control signal before the receive edge.
2. Slave has a maximum of 1 PCLK based on the sending edge of SCK delay, considering IO delay, etc., define 1.5 PCLK.
3. In the case that the SCK duty cycle sent by the Master is wide between the receiving edge and the sending edge, the Slave updates the data before the sending edge.

69of81

PY32F030 Datasheet

![img-25.jpeg](img-25.jpeg)
Figure 5-3 SPI timing diagram – slave mode and CPHA=0

![img-26.jpeg](img-26.jpeg)
Figure 5-4 SPI timing diagram – slave mode and CPHA=1

70of81

PY32F030_Datasheet

![img-27.jpeg](img-27.jpeg)
Figure 5-5 SPI timing diagram – master mode

71of81

PY32F030 Datasheet

# 6. Package Information

## 6.1. LQFP32

![img-28.jpeg](img-28.jpeg)

![img-29.jpeg](img-29.jpeg)

![img-30.jpeg](img-30.jpeg)

![img-31.jpeg](img-31.jpeg)

Common Dimensions
(Unit of Measure=millimeters)

|  Symbol | Min | Typ | Max  |
| --- | --- | --- | --- |
|  A | - | - | 1.600  |
|  A1 | 0.050 | - | 0.150  |
|  A2 | 1.350 | 1.400 | 1.450  |
|  b | 0.300 | - | 0.450  |
|  c | 0.100 | - | 0.200  |
|  D | 8.800 | 9.000 | 9.200  |
|  D1 | 6.800 | 7.000 | 7.200  |
|  E | 8.800 | 9.000 | 9.200  |
|  E1 | 6.800 | 7.000 | 7.200  |
|  e |  | 0.800BSC |   |
|  L | 0.450 | - | 0.750  |
|  L1 |  | 1.000REF |   |
|  θ | 0 | - | 7°  |

Note: 1. Dimensions are not to scale
2. Have two shape can be compatible with each other

|  PUYA | TITLE
Puya LQFP32L 7x7X1.4-0.8PITCH | DRAWING NO.
QRPD-0040 | REV
1.0  |
| --- | --- | --- | --- |

PY32F030 Datasheet

## 6.2. QFN32(5*5)

![img-32.jpeg](img-32.jpeg)
TOP VIEW

![img-33.jpeg](img-33.jpeg)
BOTTOM VIEW

![img-34.jpeg](img-34.jpeg)
Bottom VIEW

## Common Dimensions
(Unit of Measure=millimeters)

|  Symbol | Min | Typ | Max  |
| --- | --- | --- | --- |
|  A | 0.700 | 0.750 | 0.800  |
|  A1 | 0 | 0.020 | 0.050  |
|  b | 0.180 | 0.250 | 0.300  |
|  c | 0.200REF  |   |   |
|  D | 4.900 | 5.000 | 5.100  |
|  D2 | 3.400 | 3.500 | 3.600  |
|  E | 4.900 | 5.000 | 5.100  |
|  E1 | 3.400 | 3.500 | 3.600  |
|  e | 0.500BSC  |   |   |
|  Nd | 3.500BSC  |   |   |
|  L | 0.350 | 0.400 | 0.450  |
|  h | 0.300 | 0.350 | 0.400  |

Note: 1. Dimensions are not to scale

|  PUYA | TITLE
Puya QFN32L 5x5X0.75-0.5PITCH POD | DRAWING NO.
QRPD-0042 | REV
1.0  |
| --- | --- | --- | --- |

PY32F030 Datasheet

## 6.3. QFN32(4*4)

![img-35.jpeg](img-35.jpeg)
TOP VIEW

![img-36.jpeg](img-36.jpeg)
SIDE VIEW

![img-37.jpeg](img-37.jpeg)
BOTTOM VIEW

![img-38.jpeg](img-38.jpeg)

Common Dimensions
(Unit of Measure=millimeters)

|  Symbol | Min | Typ | Max  |
| --- | --- | --- | --- |
|  A | 0.700 | 0.750 | 0.800  |
|  A1 | 0.000 | 0.020 | 0.050  |
|  b | 0.150 | 0.200 | 0.250  |
|  c | 0.180 | 0.200 | 0.250  |
|  D | 3.900 | 4.000 | 4.100  |
|  D2 | 2.700 | 2.850 | 3.000  |
|  E | 3.900 | 4.000 | 4.100  |
|  E2 | 2.700 | 2.850 | 3.000  |
|  e | 0.400BSC  |   |   |
|  Nd | 2.800BSC  |   |   |
|  Ne | 2.800BSC  |   |   |
|  b1 | 0.140REF  |   |   |
|  L | 0.200 | 0.300 | 0.400  |
|  h | 0.300 | 0.350 | 0.400  |

Note: 1. Dimensions are not to scale

|  PUYA | TITLE
Puya QFN32L 4X4X0.75-0.4PITCH POD | DRAWING NO.
QRPD-0060 | REV
1.0  |
| --- | --- | --- | --- |

PY32F030 Datasheet

# 6.4. QFN24

![img-39.jpeg](img-39.jpeg)
TOP VIEW

![img-40.jpeg](img-40.jpeg)
Note 2:

![img-41.jpeg](img-41.jpeg)
BOTTOM VIEW

![img-42.jpeg](img-42.jpeg)
SIDE VIEW

![img-43.jpeg](img-43.jpeg)

Common Dimensions
(Unit of Measure=millimeters)

|  Symbol | Min | Typ | Max  |
| --- | --- | --- | --- |
|  A | 0.500 | 0.550 | 0.600  |
|  A1 | 0.000 | 0.020 | 0.050  |
|  b | 0.120 | 0.170 | 0.230  |
|  c | 0.152REF  |   |   |
|  D | 3.000BSC  |   |   |
|  D2 | 1.600 | 1.700 | 1.800  |
|  E | 3.000BSC  |   |   |
|  E2 | 1.600 | 1.700 | 1.800  |
|  e | 0.350BSC  |   |   |
|  Nd | 1.750BSC  |   |   |
|  Ne | 1.750BSC  |   |   |
|  L | 0.250 | 0.300 | 0.350  |
|  h | 0.250BSC  |   |   |

Note:
1. Dimensions are not to scale
2. Have two lead shape can be compatible with each other

|  PUYA | TITLE
Puya QFN24 3x3x0.55-0.35PITCH POD | DRAWING NO.
QRPD-0074 | REV
1.0  |
| --- | --- | --- | --- |

PY32F030 Datasheet

# 6.5. SSOP24

![img-44.jpeg](img-44.jpeg)

![img-45.jpeg](img-45.jpeg)

![img-46.jpeg](img-46.jpeg)

![img-47.jpeg](img-47.jpeg)

Common Dimensions
(Unit of Measure=millimeters)

|  Symbol | Min | Typ | Max  |
| --- | --- | --- | --- |
|  A | - | - | 1.750  |
|  A1 | 0.100 | - | 0.250  |
|  A2 | 1.300 | 1.400 | 1.500  |
|  b | 0.230 | - | 0.310  |
|  c | 0.200 | - | 0.240  |
|  D | 8.550 | 8.650 | 8.750  |
|  E | 5.800 | 6.000 | 6.200  |
|  E1 | 3.800 | 3.900 | 4.000  |
|  e | 0.635BSC  |   |   |
|  h | 0.300 | - | 0.500  |
|  L | 0.500 | - | 0.800  |
|  L1 |  | 1.050REF |   |
|  θ | 0 | - | 8°  |

Note: 1. Dimensions are not to scale

|  PUYA | TITLE
Puya SSOP24 POD | DRAWING NO.
QRPD-0045 | REV
1.0  |
| --- | --- | --- | --- |

PY32F030 Datasheet

## 6.6. QFN20

![img-48.jpeg](img-48.jpeg)
TOP VIEW

![img-49.jpeg](img-49.jpeg)
BOTTOM VIEW

![img-50.jpeg](img-50.jpeg)

## Common Dimensions
(Unit of Measure=millimeters)

|  Symbol | Min | Typ | Max  |
| --- | --- | --- | --- |
|  A | 0.500 | 0.550 | 0.600  |
|  A1 | 0.000 | 0.020 | 0.050  |
|  b | 0.150 | 0.200 | 0.250  |
|  b1 | 0.140REF  |   |   |
|  c | 0.150REF  |   |   |
|  D | 2.900 | 3.000 | 3.100  |
|  D2 | 1.550 | 1.650 | 1.750  |
|  E | 2.900 | 3.000 | 3.100  |
|  E2 | 1.550 | 1.650 | 1.750  |
|  e | 0.400BSC  |   |   |
|  Nd | 1.600BSC  |   |   |
|  Ne | 1.600BSC  |   |   |
|  L | 0.350 | 0.400 | 0.450  |
|  h | 0.200 | 0.250 | 0.300  |

Note: 1. Dimensions are not to scale

|  PUYA | TITLE
Puya QFN20L 3x3X0.55-0.4PITCH POD | DRAWING NO.
QRPD-0041 | REV
1.0  |
| --- | --- | --- | --- |

PY32F030 Datasheet

# 6.7. TSSOP20

![img-51.jpeg](img-51.jpeg)

![img-52.jpeg](img-52.jpeg)

![img-53.jpeg](img-53.jpeg)

![img-54.jpeg](img-54.jpeg)

Common Dimensions
(Unit of Measure=millimeters)

|  Symbol | Min | Typ | Max  |
| --- | --- | --- | --- |
|  A | - | - | 1.200  |
|  A1 | 0.050 | - | 0.150  |
|  A2 | 0.800 | 1.000 | 1.050  |
|  b | 0.200 | - | 0.280  |
|  c | 0.090 | - | 0.200  |
|  D | 6.400 | 6.500 | 6.600  |
|  E | 6.200 | 6.400 | 6.600  |
|  E1 | 4.300 | 4.400 | 4.500  |
|  e | 0.650BSC  |   |   |
|  L | 0.450 | 0.600 | 0.750  |
|  L1 | 1.000REF  |   |   |
|  θ | 0 | - | 8°  |

Note: 1. Dimensions are not to scale

|  PUYA | TITLE
Puya TSSOP20 POD | DRAWING NO.
QRPD-0043 | REV
1.0  |
| --- | --- | --- | --- |

PY32F030 Datasheet

# 6.8. DFN8(1.5*1.5)

![img-55.jpeg](img-55.jpeg)
TOP VIEW

![img-56.jpeg](img-56.jpeg)
SIDE VIEW

![img-57.jpeg](img-57.jpeg)
BOTTOM VIEW

Common Dimensions
(Unit of Measure=millimeters)

|  Symbol | Min | Typ | Max  |
| --- | --- | --- | --- |
|  A | 0.500 | 0.550 | 0.600  |
|  A1 | 0.000 | 0.020 | 0.050  |
|  A2 | - | 0.418 | -  |
|  A3 | 0.152 REF  |   |   |
|  b | 0.130 | 0.180 | 0.230  |
|  D | 1.400 | 1.500 | 1.600  |
|  E | 1.400 | 1.500 | 1.600  |
|  e | 0.400BSC  |   |   |
|  L | 0.150 | 0.200 | 0.250  |
|  J | 0.600 | 0.700 | 0.800  |
|  K | 1.200 | 1.300 | 1.400  |

Note: Dimensions are not to scale.

|  PUYA | TITLE
PUYA USON8 1.5x1.5x0.55-0.4 PITCH POD | DRAWING NO.
QRPD-0002 | REV
1.1  |
| --- | --- | --- | --- |

PY32F030 Datasheet

# 7. Ordering Information

Example:
PY 32 F 030 K1 8 T 6 x - X
Company
Product family
ARM® based 32-bit microcontroller
Product type
F = General purpose
Sub-family
030 = PY32F030xx
Pin count
K1 = 32 pins Pinout1
K2 = 32 pins Pinout 2
K3 = 32 pins Pinout 3
K4 = 32 pins Pinout 4
E1 = 24 pins Pinout1
E2 = 24 pins Pinout2
F1 = 20 pins Pinout1
F2 = 20 pins Pinout2
F3 = 20 pins Pinout3
F4 = 20 pins Pinout4
L1 = 8 pins Pinout1
User code memory size
8 = 64 Kbytes
7 = 48 Kbytes
6 = 32 Kbytes
4 = 16 Kbytes
3 = 8 Kbytes
Package
T = LQFP
U = QFN
P = TSSOP
M = SSOP
D = DFN
Temperature range
6 = -40°C to +85°C
7 = -40°C to +105°C
Options
xxx = Code ID of programmed parts(includes packing type)
TR = Tape and reel packing
TU = Tube Packing
blank = Tray packing
Delimiter character
Version
X = Version X

80of 81

PY32F030 Datasheet

# 8. Version History

|  Version | Date | Updated the record  |
| --- | --- | --- |
|  V1.0 | 2022.10.20 | Initial version  |
|  V1.1 | 2021.12.09 | 1. Delete SSOP24 package information
2. Add "TU= Tube Packing" to ordering information
3. Section 6.3.9, modifying parameters  |
|  V1.2 | 2021.12.28 | 1. Modify the format
2. Section 6.3.4, modifying parameters
3. Section 6.3.16, modifying parameters
4. Chapter 4, LQFP32 Pinout1 pin configuration modification  |
|  V1.3 | 2022.1.13 | 1. Added chapter 6.3.11
2. Modify chapter 3.15, modify parameters
3. Add TSSOP20/QFN20 Pinout2 package  |
|  V1.4 | 2022.1.24 | 1. Table 6-18, modify parameters
2. Table 6-33, modify parameters
3. Chapter 8, modifying parameters  |
|  V1.5 | 2023.3.09 | 1. Add SSOP24 package  |
|  V1.6 | 2023.1.18 | 1. Add QFN24/ QFN32(4*4)/ DFN8 packages  |
|  V1.7 | 2024.2.5 | 1. Add QFN32 product: PY32F030K46U6TR-E  |
|  V1.8 | 2024.6.07 | 1. Merge PY32F030x6 and PY32F030x7 versions
2. Add QFN24 Pinout1 - E / SSOP24 Pinout2 - E product
3. Table 5-19 / 5-20, modify parameters  |

# PUYA

# Puya Semiconductor Co., Ltd.

## IMPORTANT NOTICE

Puya reserve the right to make changes, corrections, enhancements, modifications to Puya products and/or to this document at any time without notice. Purchasers should obtain the latest relevant information of Puya products before placing orders.

Puya products are sold pursuant to terms and conditions of sale in place at the time of order acknowledgement.

Purchasers are solely responsible for the choice and use of Puya products. Puya does not provide service support and assumes no responsibility when products that are used on its own or designated third party products.

Puya hereby disclaims any license to any intellectual property rights, express or implied.

Resale of Puya products with provisions inconsistent with the information set forth herein shall void any warranty granted by Puya.

Any with Puya or Puya logo are trademarks of Puya. All other product or service names are the property of their respective owners.

The information in this document supersedes and replaces the information in the previous version.

Puya Semiconductor Co., Ltd. – All rights reserved

81of81

