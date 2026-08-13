// ===================================================================================
// Basic I2C Master Functions for PY32F0xx                                    * v1.2 *
// ===================================================================================
//
// Functions available:
// --------------------
// I2C_init()               Init I2C with defined clock rate (see below)
// I2C_start(addr)          I2C start transmission, addr must contain R/W bit
// I2C_write(b)             I2C transmit one data byte via I2C
// I2C_read(ack)            I2C receive one data byte (set ack=0 for last byte)
// I2C_stop()               I2C stop transmission
//
// I2C_sendBuffer(addr,buf,len) Send buffer (*buf) with length (len) to device (addr)
// I2C_getBuffer(addr,buf,len)  Receive buffer (*buf) with length (len) from (addr)
// I2C_writeBuffer(buf,len)     Write buffer (*buf) with length (len) via I2C and stop
// I2C_readBuffer(buf,len)      Read buffer (*buf) with length (len) via I2C and stop
//
// I2C pin mapping (set below in I2C parameters):
// ----------------------------------------------
// PY32F030-supported mappings (AF6):
// I2C_MAP   2     3     4     5
// SDA-pin  PA10  PA12  PB7   PB7
// SCL-pin  PA9   PA11  PB6   PB8
//
// External pull-up resistors (4k7 - 10k) are mandatory!
// 2023 by Stefan Wagner:   https://github.com/wagiminator

#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include "system.h"

// I2C Parameters
#define I2C_CLKRATE   400000    // I2C bus clock rate (Hz)
#define I2C_MAP       3         // I2C pin mapping (see above)

#if defined(PY32F030) && (I2C_MAP != 2) && (I2C_MAP != 3) && (I2C_MAP != 4) && (I2C_MAP != 5)
  #error I2C_MAP is not a PY32F030 I2C1 mapping; use 2, 3, 4, or 5
#endif
#define I2C_TIMEOUT_LOOPS 1000000UL // maximum polling iterations per operation

typedef enum
{
    I2C_STATUS_OK = 0,
    I2C_STATUS_TIMEOUT,
    I2C_STATUS_BUS_ERROR,
    I2C_STATUS_NACK,
} I2C_Status;

extern volatile I2C_Status I2C_status;
#define I2C_getStatus() I2C_status

// I2C Functions
void I2C_init(void);            // I2C init function
void I2C_start(uint8_t addr);   // I2C start transmission, addr must contain R/W bit
void I2C_stop(void);            // I2C stop transmission
void I2C_write(uint8_t data);   // I2C transmit one data byte via I2C
uint8_t I2C_read(uint8_t ack);  // I2C receive one data byte from the slave

void I2C_writeBuffer(uint8_t* buf, uint16_t len);
void I2C_readBuffer(uint8_t* buf, uint16_t len);

#define I2C_sendBuffer(addr,buf,len)  {I2C_start(addr); I2C_writeBuffer(buf,len);}
#define I2C_getBuffer(addr,buf,len)   {I2C_start(addr); I2C_readBuffer(buf,len);}

#ifdef __cplusplus
};
#endif
