#ifndef USB_H
#define USB_H

#include <stdint.h>
#include <stddef.h>

#define USB_ENDPOINT_OUT    0
#define USB_ENDPOINT_IN     1

#define USB_CONTROL_ENDPOINT 0
#define USB_DATA_ENDPOINT   1

#define USB_DESC_DEVICE       0x01
#define USB_DESC_CONFIG       0x02
#define USB_DESC_STRING       0x03
#define USB_DESC_INTERFACE    0x04
#define USB_DESC_ENDPOINT     0x05

#define USB_CLASS_CDC        0x02
#define USB_CLASS_HID         0x03
#define USB_CLASS_VENDOR     0xFF

#define USB_REQ_GET_STATUS        0x00
#define USB_REQ_GET_DESCRIPTOR    0x06
#define USB_REQ_GET_CONFIGURATION 0x08
#define USB_REQ_GET_INTERFACE     0x0A
#define USB_REQ_SET_ADDRESS       0x05
#define USB_REQ_SET_CONFIGURATION 0x09
#define USB_REQ_SET_INTERFACE      0x0B
#define USB_REQ_SET_DESCRIPTOR     0x07
#define USB_REQ_CLEAR_FEATURE      0x01
#define USB_REQ_SET_FEATURE        0x03

#define USB_FEATURE_ENDPOINT_HALT  0x00
#define USB_FEATURE_DEVICE_REMOTE_WAKEUP 0x01

#define USB_ENDPOINT_TYPE_CONTROL  0x00
#define USB_ENDPOINT_TYPE_ISO      0x01
#define USB_ENDPOINT_TYPE_BULK      0x02
#define USB_ENDPOINT_TYPE_INTERRUPT 0x03

#define USB_STATE_DETACHED    0
#define USB_STATE_ATTACHED    1
#define USB_STATE_POWERED     2
#define USB_STATE_DEFAULT     3
#define USB_STATE_ADDRESSED   4
#define USB_STATE_CONFIGURED  5

#define USB_DBG_NONE   0
#define USB_DBG_ERR    1
#define USB_DBG_INF    2
#define USB_DBG_ALL    3

#ifndef USB_DEBUG_LEVEL
#define USB_DEBUG_LEVEL USB_DBG_NONE
#endif

#if USB_DEBUG_LEVEL >= USB_DBG_ERR
#define USB_ERR(...) 
#endif

#if USB_DEBUG_LEVEL >= USB_DBG_INF
#define USB_INF(...) 
#endif

typedef struct {
    uint8_t  bLength;
    uint8_t  bDescriptorType;
    uint16_t bcdUSB;
    uint8_t  bDeviceClass;
    uint8_t  bDeviceSubClass;
    uint8_t  bDeviceProtocol;
    uint8_t  bMaxPacketSize0;
    uint16_t idVendor;
    uint16_t idProduct;
    uint16_t bcdDevice;
    uint8_t  iManufacturer;
    uint8_t  iProduct;
    uint8_t  iSerialNumber;
    uint8_t  bNumConfigurations;
} __attribute__((packed)) USB_DeviceDescriptor;

typedef struct {
    uint8_t  bLength;
    uint8_t  bDescriptorType;
    uint16_t wTotalLength;
    uint8_t  bNumInterfaces;
    uint8_t  bConfigurationValue;
    uint8_t  iConfiguration;
    uint8_t  bmAttributes;
    uint8_t  bMaxPower;
} __attribute__((packed)) USB_ConfigDescriptor;

typedef struct {
    uint8_t  bLength;
    uint8_t  bDescriptorType;
    uint8_t  bInterfaceNumber;
    uint8_t  bAlternateSetting;
    uint8_t  bNumEndpoints;
    uint8_t  bInterfaceClass;
    uint8_t  bInterfaceSubClass;
    uint8_t  bInterfaceProtocol;
    uint8_t  iInterface;
} __attribute__((packed)) USB_InterfaceDescriptor;

typedef struct {
    uint8_t  bLength;
    uint8_t  bDescriptorType;
    uint8_t  bEndpointAddress;
    uint8_t  bmAttributes;
    uint16_t wMaxPacketSize;
    uint8_t  bInterval;
} __attribute__((packed)) USB_EndpointDescriptor;

typedef struct {
    uint8_t  bmRequestType;
    uint8_t  bRequest;
    uint16_t wValue;
    uint16_t wIndex;
    uint16_t wLength;
} __attribute__((packed)) USB_SetupPacket;

typedef struct {
    void (*init)(void);
    void (*poll)(void);
    void (*send)(uint8_t endpoint, const uint8_t *data, uint16_t len);
    uint16_t (*recv)(uint8_t endpoint, uint8_t *data, uint16_t maxlen);
    void (*recv_complete)(uint8_t endpoint, const uint8_t *data, uint16_t len);
    void (*status_stage)(uint8_t dir);
    void (*set_config)(uint8_t config);
    uint8_t state;
    uint8_t address;
    uint8_t configuration;
} USB_Device;

typedef struct {
    const USB_DeviceDescriptor *device;
    const uint8_t *config;
    const uint8_t * const *strings;
    uint8_t  num_strings;
    void (*init)(void);
    void (*setup)(const USB_SetupPacket *pkt);
    void (*out)(uint8_t ep, const uint8_t *data, uint16_t len);
    void (*in)(uint8_t ep, uint8_t *data, uint16_t len);
} USB_Class;

extern USB_Device *usb_device;

void USB_init(USB_Device *dev, const USB_Class *klass);
void USB_poll(void);
void USB_connect(void);
void USB_disconnect(void);

void USB_send_data(uint8_t ep, const uint8_t *data, uint16_t len);
uint16_t USB_recv_data(uint8_t ep, uint8_t *data, uint16_t maxlen);

#endif
