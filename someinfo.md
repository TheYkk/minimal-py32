EEVblog® Electronics Community Forum*A Free & Open Forum For Electronics Enthusiasts & Professionals
Welcome, Guest. Please login or register.
Did you miss your activation email?
 
 
Forever
 
Login with username, password and session length
  
This topic
 

Home  Home
Help  Help
Search  Search
About us
Links
Login  Login
Register  Register

EEVblog® Electronics Community Forum »Electronics »Microcontrollers »Search »Search Results

 Search results for: swd
Pages: [1]
1
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by corgon on January 18, 2026, 11:28:09 am »
Hi,
I’d like to ask for advice on how to restore the nBOOT bit on the PY32F030.
I switched the nBOOT bit to 0, and as a result I no longer have access to the bootloader via the PY32ISP Tool over USART  :palm:.
The chip can still be programmed without any issues via SWD in KEIL (uVision) using an ST-LINK V2 clone.
How can I set the option bytes back to their original values?

Thank you for any advice.

2
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by IOsetting on September 01, 2025, 03:04:27 am »
Quote from: U6emp on August 31, 2025, 02:18:15 pm
RE:
In that case, it's pretty much a dead end.
What are you trying to do?
Repurpose the mcu? Just buy a new one, it costs cents...

I have no problems with the purchase, I am trying to analyze how effective the protective measures were that China used )))

As David said, the conventional method may not work. 002B has no BOOT0 pin, and the NRST pin can also be turned off in the code, so unless there is a flaw in the chip itself, it is difficult to connect it with SWD. From the perspective of reverse engineering, a feasible way is to analyze the communication between the printer and the cartridge with a logic analyzer, and make a module to simulate this communication process.

3
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by U6emp on August 31, 2025, 02:18:15 pm »
RE:
In that case, it's pretty much a dead end.
What are you trying to do?
Repurpose the mcu? Just buy a new one, it costs cents...

I have no problems with the purchase, I am trying to analyze how effective the protective measures were that China used )))

Connect via blackmagic probe:
Switching out of dormant state into SWD
DP DPIDR 0x0bc11477 (v1 MINDP rev0) designer 0x43b partno 0xbc
AP   0: IDR=04770031 CFG=00000000 BASE=e00ff000 CSW=e3000040 (AHB3-AP var3 rev0)
Halt via DHCSR(02000001): failure after 2002ms
Try again with longer timeout or connect under reset
adiv5: Failed to prepare AP, results may be unpredictable
ROM Table: BASE=0xe00ff000 SYSMEM=1, Manufacturer 43b Partno 4c0 (PIDR = 0x04000bb4c0)
0 0x0e000e000: Generic IP component - Cortex-M0 SCS (System Control Space) (PIDR = 0x04000bb008 DEVTYPE = 0x00 ARCHID = 0x0000)
-> cortexm_probe
CPUID 0x410cc601 (M0+ var 0 rev 1)
remote_v3_adiv5_mem_read_bytes error around 0x1fff0ffc
remote_v3_adiv5_mem_read_bytes error around 0xe00ff004
ROM Table: END
remote_v3_adiv5_mem_write_bytes error around 0xe000edf0
***  1   PY32Fxxx M0+
remote_v3_adiv5_mem_write_bytes error around 0xe000edf0
remote_v3_adiv5_mem_read_bytes error around 0xe000edf0
Can not attach to target 1

My Zoo!

4
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by DavidAlfa on August 31, 2025, 12:19:04 pm »
It won't connect with reset active.
The code probably disables SWD interface, so you have only few micro seconds to establish the connection after releasing nRST, which is very difficult with a PC programmer, probably only dedicated programmers can do this.

However, did you try with BOOT0=1 ?
This will boot into SRAM, which contains nothing, so it should keep the SWD active.
Keep in mind not all PY32F002x devices have this pin... In that case, it's pretty much a dead end.

What are you trying to do? Repurpose the mcu? Just buy a new one, it costs cents...

5
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by U6emp on August 30, 2025, 02:00:06 pm »
Hello!
Maybe someone had communication with PY32F002B?
The situation is as follows, this chip is used in the PC211 cartridge.
I can't reach it either via SWD or via UART. If I pull nRST to GND  then via SWD:

Switching out of dormant state into SWD
DP DPIDR 0x0bc11477 (v1 MINDP rev0) designer 0x43b partno 0xbc
AP   0: IDR=04770031 CFG=00000000 BASE=e00ff000 CSW=e3000040 (AHB3-AP var3 rev0)
remote_v4_adiv5_mem_read_bytes error around 0xe000edf0
Halt via DHCSR(000d0744): failure after 2510ms
Try again with longer timeout or connect under reset
adiv5: Failed to prepare AP, results may be unpredictable
remote_v4_adiv5_mem_read_bytes error around 0xe00ffff0
Error reading CIDR on AP0: 2
No target found

Is it possible to reset via ISP?
Best regards!

6
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by andrvisht on June 26, 2025, 09:28:34 pm »
I found a problem with interrupt handling when RDP is installed. And this is where this thread started (page 2).
The processor goes into a HALT after an unhandled interrupt.
One of the solutions - vectors in SRAM, seems to be the most correct, but DavidAlfa's assumptions about the vulnerability of the method at that time force me to resume discussing this problem.

As a result of testing on hardware, I can say that with RDP, any reading of FLASH from SRAM leads to a Hard Fault.
This is also confirmed by the Reference Manual
4.5.2. Flash read protection
By setting RDP option byte, and perform system reset (POR/BOR or OPL reset) to load a new RDP option byte to activate the read protection function. RDP protects main Flash memory, option byte, and SRAM.

And also Table 4-7 The relationship between access status and protection level and execution mode

There is no SWD fuse in PY32F0xx, so the only possible additional means are nRST nBOOT1 and switching GPIO AF.

Does anyone have any thoughts on this?
Perhaps I did not fully understand the vulnerability described by DavidAlfa, or it was an assumption that requires verification.

Thanks

7
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by DavidAlfa on May 08, 2024, 06:23:45 pm »
See datasheet or RM. Usually they're set in analog mode by default (Hi-Z) except SWD pins.

8
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by John_doe on April 25, 2024, 04:35:24 am »
Quote from: John Celo on April 23, 2024, 04:21:33 am
The chip is gone if you reassign both SWC/SWD and NRST.
If you have SWC/SWD reassigned, but NRST is still available, you can still flash the chip if you pull NRST low (which forces the SWC/SWD pins to get reassigned to defaults).
Thanks for the useful tip! I tried it, that is, pinMode() for both the SWD and SWC pins and indeed couldn't connect to the chip anymore. Holding NRST low (and releasing it after the command "reset halt") worked like a charm!

Quote from: prosper on April 24, 2024, 03:55:11 pm
Thanks for the write up. I was excited about openocd for the PY32.... but there's (still) no source and no linux version. Ah well.
Wait, so the PY32 support of openOCD is built into the executable? I didn't know that... I thought that if you download the official Linux version and add the *.cfg files to it from the gitee archive it'll work.

Quote from: prosper on April 24, 2024, 03:55:11 pm
Also may be worth noting: beyond openocd and pyocd, there's also probe-rs which supports the py32.
Thanks, right now I got myself busy with something else but when I'll return to the PY32F002A project I'll be sure to try probe-rs.

9
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by John_doe on April 23, 2024, 04:36:39 am »
I'm writing a summery of what I did to program these PY32F002A chips. Maybe it'll help some other n00b to save some time:

1. I installed PY32Duino for the Arduino IDE. I just followed the instructions here (used Google to translate the site to English):
https://arduino.py32.org/

2. Wrote a simple test sketch and compiled it. To upload it to the TSSOP-20 version, I just connected a USB to TTL module (costs less than $1 on AliExpress) and uploaded from the Arduino GUI. Instructions on how to connect the module to the chip can be found here:
https://github.com/wagiminator/MCU-Flash-Tools?tab=readme-ov-file#puyaisp

3. To write to the chip packages that do not have a BOOT0 pin, a programmer was needed, I didn't have a suitable one, such as these that were recommended in this thread:
https://www.aliexpress.com/item/1005003620126365.html
https://www.aliexpress.com/item/1005005179354439.html
So I used an ST-Link v2 clone to write this firmware to an STM32F103 "Blue Pill":
https://github.com/RadioOperator/STM32F103C8T6_CMSIS-DAP_SWO/blob/master/build/F103-DAP-SWO-CDC-BLUEPILL-SWD_REMAP.hex
To do that I used STM32 ST-LINK utility from this link:
https://www.st.com/en/development-tools/stsw-link004.html
I had to hold the reset button while pressing Target>Connect . Connections from ST-Link to blue pill are 3.3v->3.3V ; GND ->GND ; SWCLK->SWCLK ; SWDIO->SWDIO.

4. After I had a working CMSIS-DAP, I took the compiled Arduino hex file (if you don't know where to find it, google it) and used OpenOCD. To do that I downloaded the OpenOCD package that already includes the PY32 support files from the PUYA gitee:
https://gitee.com/puya-semiconductor/tools-and-software/blob/master/PY32_GCC/openocd-0.12.0.zip
(Thanks IOsetting and DavidAlfa for the link)
I had to modify the "openocd_run.bat" file to include the ".\bin" folder:
Code: [Select]
.\bin\openocd.exe -s ./scripts -f ./scripts/interface/cmsis-dap.cfg -f ./scripts/target/py32f002x.cfg

5. Had to enable Telnet for my Windows 10 (google it if you don't know how) from the control panel.

6. To connect the blue pill CMSIS-DAP to the IC, I connected the USB of it to my PC and from the blue pill to the PY32F002A the connections are: 3.3V->VCC ; GND->GND ;  SWCLK->SWC ; SWDIO->SWD. For the SOP-8 Package, the pins are 1 ; 8 ; 4 ; 5, respectively.

7. To use OpenOCD, I ran the batch file and in a new command prompt window I entered:
Code: [Select]
telnet localhost 4444
And then the following commands:
Code: [Select]
reset halt
flash write_image erase c:/myfolder/myfile.hex
Notice the forward slash in the path to hex file. The command will fail if a Backslash is used.

10
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by John Celo on April 23, 2024, 04:21:33 am »
Quote from: John_doe on April 23, 2024, 03:17:19 am
Quote from: John Celo on April 23, 2024, 01:34:10 am
That being said, SOP-8 is pain in the ass to work with, you functionally have 3 pins left (VCC/GND/SWC/SWD/NRST) if you don't remap SWC/SWD/NRST - and I dont think it's worth bothering with that. SOP-16 is just a better fit for a beginner, since you can hook up uart and have some extra printfs diagnostics messages ON TOP of debugger. I also use uart to send commands from my computer to the chip.
Wait, only 3 pins? Does that mean that if I use the SWC/SWD pins in my Arduino sketch, I won't be able to write to the chip again  ???
The chip is gone if you reassign both SWC/SWD and NRST.
If you have SWC/SWD reassigned, but NRST is still available, you can still flash the chip if you pull NRST low (which forces the SWC/SWD pins to get reassigned to defaults).

What I mean by saying "3 pins" is - that during development, you will probably want to have SWC/SWD connected all the time as you iterate and work on your design & code.

If you reassign SWC/SWD you'll have to have some way to share those programming wires with whatever peripherals you want there and have some way to connect/reconnect those - not to interfere with flashing, as well as have to hold NRST while programming.

It just seems like a hassle for no real benefit? Price is the same, and package is roughly the same size as tssop20.

I bought a few py32 sop8 chips myself, and retrospectively that was a mistake, with so few pins there's not much I can use them for.


11
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by John_doe on April 23, 2024, 03:17:19 am »
Quote from: bingo600 on April 22, 2024, 05:16:07 pm
Your ST_link should be able to program a "Bluepill" with the above firmware.

I'd suggest you program the "remap hex" from here : https://github.com/RadioOperator/STM32F103C8T6_CMSIS-DAP_SWO/tree/master/build
Then the picts on the above site seem to match your new cmsis-dap bluepill board.
Thanks Bingo, I was able to write the "remap" firmware to the blue pill with 'STM32 ST-LINK utility'.
I also had success writing to the SOP-8 chip with OpenOCD. I will write a summery of what I did in a new message.

Quote from: John Celo on April 23, 2024, 01:34:10 am
I'm an absolutest newbie/amateur, and I did get SOP-8 flashing, used J-Link OB (with keil uvision) and CMSIS/DAP-link (via pyOCD which is a command line flasher, it's not hard to use at all!).
Thank you, but I already managed to write to the chip with OpenOCD, and a good thing I did, because I HATE Python with a vengeance!  >:D

Quote from: John Celo on April 23, 2024, 01:34:10 am
That being said, SOP-8 is pain in the ass to work with, you functionally have 3 pins left (VCC/GND/SWC/SWD/NRST) if you don't remap SWC/SWD/NRST - and I dont think it's worth bothering with that. SOP-16 is just a better fit for a beginner, since you can hook up uart and have some extra printfs diagnostics messages ON TOP of debugger. I also use uart to send commands from my computer to the chip.
Wait, only 3 pins? Does that mean that if I use the SWC/SWD pins in my Arduino sketch, I won't be able to write to the chip again  ???

Quote from: John Celo on April 23, 2024, 01:34:10 am
I've yet to try the "hidden" PY32F002A features like DMA and clocking it to 48mhz (is this hard to do?).
No idea, but I would also like to know how to do that. Maybe you just select PY32F030 as your target chip when writing?

12
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by John Celo on April 23, 2024, 01:34:10 am »
Quote from: John_doe on April 22, 2024, 04:38:21 pm
Hi, another newbie/amateur here, hopefully you still have some patience for one of those  :D
I'd like some help writing to the flash of the PY32F002AL15S6TU (That is, the SOP-8 package).
After reading this thread and finding out that only the TSSOP-20 package supports ISP, I tried first with my PY32F002AF15P6TU (TSSOP-20) using Arduino as my IDE and writing to the PY32F002AF15P6TU directly from Arduino using a USB->TTL adapter with BOOT0 pulled high and everything worked well on the first try (yes, I was also surprised :) ) - Got some LEDs blinking and some buzzers beeping and was happy.

But now I want to return to my original goal of flashing the SOP-8 version. The thing is, I haven't touched a traditional IDE since collage (more than 3 decades ago) and I really don't want to start installing and then messing with CubeIDE, Keil, Eclipse, Python stuff, or any other heavy software that requires fiddling with definitions, settings and configuration files. Is there a simple solution like a standalone software such as PuyaISP in the the sense of just running an EXE (I'm on Windows) and writing? Or better yet, writing directly from the Arduino IDE ?
I'm an absolutest newbie/amateur, and I did get SOP-8 flashing, used J-Link OB (with keil uvision) and CMSIS/DAP-link (via pyOCD which is a command line flasher, it's not hard to use at all!).

That being said, SOP-8 is pain in the ass to work with, you functionally have 3 pins left (VCC/GND/SWC/SWD/NRST) if you don't remap SWC/SWD/NRST - and I dont think it's worth bothering with that. SOP-16 is just a better fit for a beginner, since you can hook up uart and have some extra printfs diagnostics messages ON TOP of debugger. I also use uart to send commands from my computer to the chip.

Frankly, if you want Arduino as an IDE, I'd suggest to stick with tssop-20 package, it takes as much space as SOP-8 anyway and costs the same.

I did go the absolute opposite route - I do want a debugger and prefer an IDE, so I use keil uVision (but might move to another IDE).
This sop16 chip is my first step outside of Arduino environment.

So far I've got multiple ADCs working in continuous mode, uart and i2c is also working (although i2c is a bit finicky) using provided high-level HAL (as far as I can tell it's similar to hal used by stm32), I do intend to move to lower level HAL as I find them easier to reason about with reference sheet in hand.

These chips are kind of slow, so if you sample multiple ADCs at total sample rate of 400kHz, and it runs at 24mHz, you only get ~60 cycles
to work for every sample! If you have some external timing sensitive signals that trigger an interrupt, those can easily take 16 cycles or more if you account for storing/restoring registers state, etc! (I have to time this!)

I've yet to try the "hidden" PY32F002A features like DMA and clocking it to 48mhz (is this hard to do?).

13
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by IOsetting on March 15, 2024, 10:00:52 am »
Quote from: John Celo on March 15, 2024, 08:55:45 am
It's all very confusing, for example PY32F002BW15S sop16 B version of the chip doesn't even seem to have NRST pin. (or is it a bug in the datasheet?)
PIN13 is NRST, multiplexed with PC0, PA7
EN datasheet v0.3 is not the latest, please refer to the pin map in CN datasheet v0.9, page 17


Quote from: John Celo on March 15, 2024, 08:55:45 am
How does writing to the flash memory of the device gets started/initiated when connected just to VCC/GND/SWC/SWD pins?
SWD transfer doesn't need a reset

14
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by John Celo on March 15, 2024, 08:55:45 am »
It's all very confusing, for example PY32F002BW15S sop16 B version of the chip doesn't even seem to have NRST pin. (or is it a bug in the datasheet?)
How does writing to the flash memory of the device gets started/initiated when connected just to VCC/GND/SWC/SWD pins?

From what I could understand from reading the reference manual is:
1. Once powered on device resets pin functions to their default state
2. Since the SOP14/16 devices don't have a BOOT0 pin, CPU fetches top-of-stack value from 0x0000 00000
and starts executing code from 0x0000 0004 from the main flash memory (20kbytes)
3. Now in code, functions of GPIO pins will be set via Alternate Function Registers called GPIOx_AFRH and GPIOx_AFRL and accessed via peripheral registers (those are memory mapped in linear address space (32bit, 4gb))

For PF2-NRST pin specifically, their function is set through so called "Option bytes"
Option bytes (128bytes, one page of flash memory) are stored in flash memory.

Is that correct?

15
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by DavidAlfa on March 14, 2024, 07:07:59 pm »
If you reasign swd pins, then you must also connect nRST to enter programming mode, otherwise it'll be impossible.

16
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by prosper on March 14, 2024, 06:22:46 pm »
I generally reserve SWC and SWD for debugging only, and don't re-assign them. It's easy enough to use a TSSOP-20 or something with more pins if IO is that tight.


If you do want to re-assign them, it'd be wise to implement a boot delay in your code before doing so, so that you have a moment when you can flash it on bootup before the SWD interface becomes unavailable to you. Otherwise, you'd essentially get a one-time-programmable device (which is not necessarily a problem if you're a manufacturer, but is less than ideal for a hobbyist)


Also be aware that in some cases, the 'multiplexing' is just the way the die is bonded - i.e. they just short together the points to the same pin. So you might have trouble if you try to drive PA14 high and PB3 low at the same time. Not sure if this is the case with the py32 or not, you'd need to carefully examine the datasheet (or experiment) and make your own inferences.

17
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by John Celo on March 14, 2024, 05:32:42 pm »
Thank you for advice!

Sop8 version has following pins:
1. VCC
2. PA4/PA10
3. PA3
4. PA14-SWC/PB3
5. PA13-SWD
6. PA2/PF2-NRST
7. PA1
8. GND

The pins that have to be connected when programming are (5) SWC (6) SWD and (1) VCC (2) GND, correct?

Can SWC/SWD pins be shared and reused for different purposes?

And if the pins can be reused/shared, how does the device know that is being flashed instead of being used as in normal operation?

Is there some sort of special startup sequence?

18
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by DavidAlfa on March 13, 2024, 08:59:11 pm »
Puya has modded OpenOCD adding support por their chips:

https://gitee.com/puya-semiconductor/tools-and-software/blob/master/PY32_GCC/openocd-0.12.0.zip

Example cfg file for this DAP:
Code: [Select]
source [find interface/cmsis-dap.cfg]
source [find target/py32f030.cfg]
cmsis_dap_backend hid
transport select "swd"
set CLOCK_FREQ 1000
reset_config none
set CONNECT_UNDER_RESET 0
set CORE_RESET 0

Unfortunately CubeIDE complains about non genuine device. Haven't looked over it.

19
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by IOsetting on February 29, 2024, 01:45:44 am »
Quote from: pappkopp on February 28, 2024, 07:42:58 pm
I have the option to try J-Link, does Puya have some tool to upload or read the mcu info via this? I have tried PuyaProgrammer but it can't find the USB device to use for SWD, For the J-link i'm using a nucleo board i have converted to J-link, but i belive Puya has its own programmer but it should be compatible ?
J-Link has its own software, which can be downloaded from https://www.segger.com/downloads/jlink/

20
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by pappkopp on February 28, 2024, 07:42:58 pm »
I'm trying to connect to the 8 pin (SOP8) PY32F002AL15S6TU via PuyaISP, but i cant really get it working, how should i enter the bootloader? I have tried pulling pin 6 (PA2/PF2-NRST) both high and low while power-cycling the MCU, but PuyaISP wont connect,

Is pulling NRST high the correct method to enter the bootloader? This package does not have a dedicated BOOT0 pin,

I have the option to try J-Link, does Puya have some tool to upload or read the mcu info via this? I have tried PuyaProgrammer but it can't find the USB device to use for SWD, For the J-link i'm using a nucleo board i have converted to J-link, but i belive Puya has its own programmer but it should be compatible ?

21
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by bingo600 on August 26, 2023, 06:02:25 pm »
I got something kludged together to generate ~9KHz pulses on PA1
Used your CCP as base

Code: [Select]
/*--------------------------------------------------*/
void system_init(void)
{
  LL_RCC_HSI_SetCalibFreq(LL_RCC_HSICALIBRATION_24MHz);
  while (LL_RCC_HSI_IsReady() != 1);

  LL_IOP_GRP1_EnableClock(LL_IOP_GRP1_PERIPH_GPIOA | LL_IOP_GRP1_PERIPH_GPIOB | LL_IOP_GRP1_PERIPH_GPIOF);
  LL_APB1_GRP2_EnableClock(LL_APB1_GRP2_PERIPH_TIM1);

  // LL_GPIO_Init(SWC_Port,   &(LL_GPIO_InitTypeDef){ SWC_Pin,  LL_GPIO_MODE_ANALOG });         // Disable SWD interface access
  // LL_GPIO_Init( SWD_Port,  &(LL_GPIO_InitTypeDef){ SWD_Pin,  LL_GPIO_MODE_ANALOG });

  LL_GPIO_Init(CCP_Port,   &(LL_GPIO_InitTypeDef){ CCP_Pin,  LL_GPIO_MODE_ALTERNATE, LL_GPIO_SPEED_FREQ_VERY_HIGH, LL_GPIO_OUTPUT_PUSHPULL, LL_GPIO_PULL_NO, CCP_AF });
  LL_GPIO_Init(RED_Port,   &(LL_GPIO_InitTypeDef){ RED_Pin, LL_GPIO_MODE_OUTPUT, LL_GPIO_SPEED_FREQ_VERY_HIGH, LL_GPIO_OUTPUT_PUSHPULL, LL_GPIO_PULL_NO });
  LL_GPIO_Init(GREEN_Port, &(LL_GPIO_InitTypeDef){ GREEN_Pin, LL_GPIO_MODE_OUTPUT, LL_GPIO_SPEED_FREQ_VERY_HIGH, LL_GPIO_OUTPUT_PUSHPULL, LL_GPIO_PULL_NO });
  LL_GPIO_Init(BTN_Port,   &(LL_GPIO_InitTypeDef){ BTN_Pin, LL_GPIO_MODE_INPUT, 0, 0, LL_GPIO_PULL_UP });


//https://community.st.com/t5/stm32-mcu-products/setting-the-timer-tim1-in-stm32f407/td-p/395256

  //LL_TIM_Init(CCP_TIM, &(LL_TIM_InitTypeDef){ 23, LL_TIM_COUNTERDIRECTION_UP, 65535, LL_TIM_CLOCKDIVISION_DIV1, 0});                              // 1MHz clock, 65ms overflow
  LL_TIM_Init(CCP_TIM, &(LL_TIM_InitTypeDef){ 11, LL_TIM_COUNTERDIRECTION_UP, 111, LL_TIM_CLOCKDIVISION_DIV1, 0});                              // 1MHz clock, 65ms overflow
  //LL_TIM_IC_Init(CCP_TIM, CCP_CH, &(LL_TIM_IC_InitTypeDef){ LL_TIM_IC_POLARITY_FALLING, LL_TIM_ACTIVEINPUT_DIRECTTI, LL_TIM_ICPSC_DIV1, 4 });      // Falling edge
  LL_TIM_OC_Init(CCP_TIM, CCP_CH, &(LL_TIM_OC_InitTypeDef){ LL_TIM_OCMODE_TOGGLE, LL_TIM_OCSTATE_ENABLE, LL_TIM_OCSTATE_ENABLE, 111,
                                                            LL_TIM_OCPOLARITY_HIGH, LL_TIM_OCPOLARITY_HIGH, LL_TIM_OCIDLESTATE_LOW, LL_TIM_OCIDLESTATE_LOW });      // Falling edge

  // Generates 8.97 KHz pulses

  LL_TIM_EnableCounter(CCP_TIM);
  LL_TIM_CC_EnableChannel(CCP_TIM, CCP_CH);
  LL_TIM_EnableAllOutputs(CCP_TIM);

  NVIC_SetPriority(TIM1_CC_IRQn, 1);
  //NVIC_EnableIRQ(TIM1_CC_IRQn);

  SysTick_Config(24000);      // 24MHz cpu clock, 1ms period.
}


But it seems like it's the below LL_TIM_Init that controls the Pulse duration

24M/12/111 ~18KHz ==> 9KHz Toggled
Code: [Select]
  LL_TIM_Init(CCP_TIM, &(LL_TIM_InitTypeDef){ 11, LL_TIM_COUNTERDIRECTION_UP, 111, LL_TIM_CLOCKDIVISION_DIV1, 0});                              // 1MHz clock, 65ms overflow

Whar does the 111 in this one (LL_TIM_OC_Init) do then ?
Code: [Select]
LL_TIM_OC_Init(CCP_TIM, CCP_CH, &(LL_TIM_OC_InitTypeDef){ LL_TIM_OCMODE_TOGGLE, LL_TIM_OCSTATE_ENABLE, LL_TIM_OCSTATE_ENABLE, 111,
                                                            LL_TIM_OCPOLARITY_HIGH, LL_TIM_OCPOLARITY_HIGH, LL_TIM_OCIDLESTATE_LOW, LL_TIM_OCIDLESTATE_LOW });      // Falling edge

I would have expected that one :
Code: [Select]
  uint32_t CompareValue;  /*!< Specifies the Compare value to be loaded into the Capture Compare Register.
                               This parameter can be a number between Min_Data=0x0000 and Max_Data=0xFFFF.

To control the "compare" ...


Will try tomorrow, with the 9KHz from my F002 dev board as pulse source.

Ps:
Thank you for your examples & guidance

/Bingo

22
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by bingo600 on August 26, 2023, 02:58:52 pm »
Thanx for the hint with the AF in the DS.
Btw do you exclusively look at the F030 documentation for the F002 ?

Re DAPLINK
I use an Air32F103 with both the (top/bottom) 5 Pins soldered at the end.   ... Think you have some of them
Use V1 hexfile ... V2 doesn't work
https://www.eevblog.com/forum/microcontrollers/air105-air32f103-new-chinese-arm-chips/msg5014411/#msg5014411


Quote
**** DON'T use the "silkscreened swd/swclk" , that you use to program the board... Won't work

Pinout as a DAPLink
PB13: SWCLK
PB14: SWDIO
PB0: RESET
PA2: TX
PA3: RX

/Bingo

23
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by bingo600 on August 26, 2023, 08:20:43 am »
I just tried the RDP on a PY32F002AW15S6TU (SOP-16)
Changed leds to active high.

It given an error during programming (pyOCD - DAP)

Code: [Select]
$ make flash
pyocd erase -t py32f030x6 --chip --config ./Misc/pyocd.yaml
0000872 I Erasing chip... [eraser]
0001113 I Chip erase complete [eraser]
pyocd load ./Build/main.hex -t py32f030x6 --config ./Misc/pyocd.yaml
0000874 I Loading /home/cfo/1-Arm/py32f0/git/David/PY32F030_test-cfo/Build/main.hex [load_cmd]
[==================================================] 100%
0002048 I Erased 4096 bytes (1 sector), programmed 2432 bytes (19 pages), skipped 0 bytes (0 pages) at 2.03 kB/s [loader]
0002058 E Error during board uninit: [session]

But i suppose it's ok  unint prob involve Reset , that has just been deactivated ....
Hmm RDP just sets RDP (Flas lock) ...

My "Dual led" toggles between RED & Orange (Orange = Red + Green)

When i GND PA7 , LED gets Green

Ohh ... And i have to Power reset to get swd to work again
Well ... I didn't have DAP reset connected , so the programmer couldn't reset it.

Connected DAP Reset to MCU
Code: [Select]
$ make flash
pyocd erase -t py32f030x6 --chip --config ./Misc/pyocd.yaml
0000806 I Erasing chip... [eraser]
0001051 I Chip erase complete [eraser]
pyocd load ./Build/main.hex -t py32f030x6 --config ./Misc/pyocd.yaml
0000824 I Loading /home/cfo/1-Arm/py32f0/git/David/PY32F030_test-cfo/Build/main.hex [load_cmd]
[==================================================] 100%
0001969 I Erased 4096 bytes (1 sector), programmed 2432 bytes (19 pages), skipped 0 bytes (0 pages) at 2.09 kB/s [loader]
0001975 E Error during board uninit: [session]
0001977 E Probe error during disconnect: [session]
Now 2 errors during programming

Still can't program (after PA7 Clear of RDP)
Code: [Select]
$ make flash
pyocd erase -t py32f002ax5 --chip --config ./Misc/pyocd.yaml
0000843 I Erasing chip... [eraser]
0001076 C target was not halted as expected after calling flash algorithm routine (IPSR=3) [__main__]

POR Reset works.


/Bingo

24
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by bingo600 on August 26, 2023, 05:42:22 am »
Oh ...

I have modified both examples RDP + CCP to use PA7 for BTN , and PB0 for Red / PB1 for Green.
My PY32F002AW15S6TU (SOP16) doesn't have PA5, and if you'd not commected out the "lock code" my SOP16 MCU would have been locked forever.

RDP
Code: [Select]
//Buttons
#define BTN_Port        GPIOA
  #define BTN_Pin       LL_GPIO_PIN_7

// LEDs
#define RED_Port        GPIOB
  #define RED_Pin       LL_GPIO_PIN_0
#define GREEN_Port      GPIOB
  #define GREEN_Pin     LL_GPIO_PIN_1

CCP
Code: [Select]
// CCP pin
#define   CCP_Port      GPIOA
  #define CCP_Pin       LL_GPIO_PIN_1
  #define CCP_AF        LL_GPIO_AF13_TIM1
  #define CCP_TIM       TIM1
  #define CCP_CH        LL_TIM_CHANNEL_CH4

// Buttons
#define BTN_Port        GPIOA
  #define BTN_Pin       LL_GPIO_PIN_7

// LEDs
#define RED_Port        GPIOB
  #define RED_Pin       LL_GPIO_PIN_0
#define GREEN_Port      GPIOB
  #define GREEN_Pin     LL_GPIO_PIN_1

// SWD interface
#define   SWC_Port      GPIOA
  #define SWC_Pin       LL_GPIO_PIN_14
#define   SWD_Port      GPIOA
  #define SWD_Pin       LL_GPIO_PIN_13


/Bingo

25
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by DavidAlfa on August 22, 2023, 07:11:36 pm »
I guess you could also write to VTOR with the debugger, yeah!
Well, if possible at all, nRST=OFF, BOR=ON, SWD=OFF and BOOT1=OFF should give plenty of headaches to the attackers  :).

26
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by DavidAlfa on August 21, 2023, 08:04:27 pm »
Yeah, a debugger has complete access to the ram.
Systick vector is now placed at 0x2000003C:
You could halt the system, load a program into 0x20001000, made to dump the flash through the serial port, and write that address to systick vector.
When the IRQ triggers, game over!

At least I can mitigate this by disabling SWD port and setting the nRST config bit.
The reset pin function becoems completely disabled, even when shorting the reset pin before power is applied, it no longer works.
Then I have a special unlock procedure in the code that resets the RDP, this completely erases the mcu so it can be accesed again.

nBOOT1 config bit switches between bootloader mode ad system ram booting. Not sure what would be the safest!
Let me guess.. Burn the pin down! :-DD

27
Microcontrollers / Re: $0.11 PY32F002A: Cortex-M0+ MCU, actually a PY32F030! 32/4KB, 48MHz, PLL, DMA...
« Message by danymogh on August 06, 2023, 12:39:37 pm »
I finally managed to get it working.

I first used a USB TTL as you described and connected to it by Puya ISP. I had to pull up Boot0 pin.
The software is a bit tricky. I had to reset the VDD after every program or chip cleared. (I'm not using DTR or RST).
Also if you attempt to readout a read-protected chip it automatically clears the chip!

Then I converted a Bluepill to a CMISIS-DAP and managed to get it to work with KEIL. the standard SWD, SWCK, VDD, GND, and Reset.

I can now use the debug features. however, It doesn't work with Puya Programmer.

Is there any way to set the option bytes with CMSIS-DAP?

Pages: [1]

Jump to: 
=> Please select a destination
 

EEVblog® Main Site	EEVblog® on Youtube	EEVblog® on Twitter	EEVblog® on Facebook	EEVblog® on Odysee
SMF 2.0.19 | SMF © 2021, Simple Machines
Simple Audio Video Embedder
SMFAds for Free Forums | Powered by SMFPacks Advanced Attachments Uploader Mod
XHTML RSS MobileMobileWAP2