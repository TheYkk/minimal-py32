#ifndef USB_CDC_H
#define USB_CDC_H

#include "usb.h"
#include <stdint.h>

#define LSB(x)  ((x) & 0xFF)
#define MSB(x)  (((x) >> 8) & 0xFF)

#define CDC_VENDOR_ID    0x1234
#define CDC_PRODUCT_ID   0x5678
#define CDC_DEVICE_VER   0x0100

#define CDC_IN_EP       0x81
#define CDC_OUT_EP      0x01
#define CDC_INT_EP      0x82

#define CDC_IN_SIZE     64
#define CDC_OUT_SIZE    64
#define CDC_INT_SIZE    8

typedef struct {
    uint8_t bcdCDC[2];
} __attribute__((packed)) CDC_HeaderDesc;

typedef struct {
    uint8_t  bFunctionLength;
    uint8_t  bDescriptorType;
    uint8_t  bDescriptorSubtype;
    uint8_t  bcdCDC[2];
} __attribute__((packed)) CDC_FunctionalHeader;

typedef struct {
    uint8_t  bFunctionLength;
    uint8_t  bDescriptorType;
    uint8_t  bDescriptorSubtype;
    uint8_t  bmCapabilities;
    uint8_t  bDataInterface;
} __attribute__((packed)) CDC_FunctionalACM;

typedef struct {
    uint8_t  bFunctionLength;
    uint8_t  bDescriptorType;
    uint8_t  bDescriptorSubtype;
    uint8_t  bMasterInterface;
    uint8_t  bSlaveInterface0;
} __attribute__((packed)) CDC_FunctionalUnion;

typedef struct {
    uint8_t  bFunctionLength;
    uint8_t  bDescriptorType;
    uint8_t  bDescriptorSubtype;
    uint8_t  bRIIBM;
    uint8_t  bGIS;
    uint8_t  wMaxSegmentSize[2];
    uint8_t  wNumDatagramPorts[2];
    uint8_t  b脯Protocol;
    uint8_t  bmNetworkCapabilities;
} __attribute__((packed)) CDC_FunctionalEthernet;

typedef struct {
    uint8_t lineCoding[7];
    uint8_t controlState;
    uint8_t breakDuration[2];
} __attribute__((packed)) CDC_LineCoding;

typedef enum {
    CDC_STATE_NONE = 0,
    CDC_STATE_SET_LINE_CODING,
    CDC_STATE_GET_LINE_CODING,
    CDC_STATE_SET_CONTROL_LINE_STATE,
    CDC_STATE_SEND_BREAK
} CDC_ControlState;

extern volatile CDC_LineCoding cdc_line_coding;
extern volatile CDC_ControlState cdc_control_state;
extern volatile uint8_t cdc_connected;
extern volatile uint8_t cdc_dtr;

void CDC_init(void);
void CDC_setup(const USB_SetupPacket *pkt);
void CDC_out(uint8_t ep, const uint8_t *data, uint16_t len);
void CDC_in(uint8_t ep, uint8_t *data, uint16_t len);
void CDC_send(const uint8_t *data, uint16_t len);
uint16_t CDC_recv(uint8_t *data, uint16_t maxlen);
uint8_t CDC_connected(void);

#endif
