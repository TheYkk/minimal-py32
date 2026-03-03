#include "usb_cdc.h"

#define USB_CONFIG_DESCRIPTOR_SIZE  67

static const uint8_t cdc_device_descriptor[] = {
    18,         // bLength
    0x01,       // bDescriptorType (DEVICE)
    0x10, 0x01, // bcdUSB (1.1)
    0x02,       // bDeviceClass (CDC)
    0x00,       // bDeviceSubClass
    0x00,       // bDeviceProtocol
    0x40,       // bMaxPacketSize0 (64)
    LSB(CDC_VENDOR_ID), MSB(CDC_VENDOR_ID),  // idVendor
    LSB(CDC_PRODUCT_ID), MSB(CDC_PRODUCT_ID), // idProduct
    LSB(CDC_DEVICE_VER), MSB(CDC_DEVICE_VER), // bcdDevice
    0x01,       // iManufacturer
    0x02,       // iProduct
    0x03,       // iSerialNumber
    0x01        // bNumConfigurations
};

static const uint8_t cdc_config_descriptor[] = {
    // Configuration Descriptor
    9,          // bLength
    0x02,       // bDescriptorType (CONFIGURATION)
    67, 0,      // wTotalLength
    0x02,       // bNumInterfaces
    0x01,       // bConfigurationValue
    0x00,       // iConfiguration
    0xC0,       // bmAttributes (self-powered)
    0x32,       // bMaxPower (100mA)

    // Interface Descriptor (Communication Interface)
    9,          // bLength
    0x04,       // bDescriptorType (INTERFACE)
    0x00,       // bInterfaceNumber
    0x00,       // bAlternateSetting
    0x01,       // bNumEndpoints
    0x02,       // bInterfaceClass (CDC Communication)
    0x02,       // bInterfaceSubClass (ACM)
    0x01,       // bInterfaceProtocol (AT Command)
    0x00,       // iInterface

    // CDC Header Functional Descriptor
    5,          // bLength
    0x24,       // bDescriptorType (CS_INTERFACE)
    0x00,       // bDescriptorSubtype (Header)
    0x10, 0x01, // bcdCDC

    // CDC ACM Functional Descriptor
    4,          // bLength
    0x24,       // bDescriptorType (CS_INTERFACE)
    0x02,       // bDescriptorSubtype (ACM)
    0x02,       // bmCapabilities

    // CDC Union Functional Descriptor
    5,          // bLength
    0x24,       // bDescriptorType (CS_INTERFACE)
    0x06,       // bDescriptorSubtype (Union)
    0x00,       // bMasterInterface (Communication)
    0x01,       // bSlaveInterface0 (Data)

    // Endpoint Descriptor (Interrupt IN)
    7,          // bLength
    0x05,       // bDescriptorType (ENDPOINT)
    0x82,       // bEndpointAddress (IN 2)
    0x03,       // bmAttributes (Interrupt)
    0x08, 0x00, // wMaxPacketSize (8)
    0x10,       // bInterval (16ms)

    // Interface Descriptor (Data Interface)
    9,          // bLength
    0x04,       // bDescriptorType (INTERFACE)
    0x01,       // bInterfaceNumber
    0x00,       // bAlternateSetting
    0x02,       // bNumEndpoints
    0x0A,       // bInterfaceClass (CDC Data)
    0x00,       // bInterfaceSubClass
    0x00,       // bInterfaceProtocol
    0x00,       // iInterface

    // Endpoint Descriptor (Bulk OUT)
    7,          // bLength
    0x05,       // bDescriptorType (ENDPOINT)
    0x01,       // bEndpointAddress (OUT 1)
    0x02,       // bmAttributes (Bulk)
    0x40, 0x00, // wMaxPacketSize (64)
    0x00,       // bInterval

    // Endpoint Descriptor (Bulk IN)
    7,          // bLength
    0x05,       // bDescriptorType (ENDPOINT)
    0x81,       // bEndpointAddress (IN 1)
    0x02,       // bmAttributes (Bulk)
    0x40, 0x00, // wMaxPacketSize (64)
    0x00        // bInterval
};

static const uint8_t cdc_string_lang[] = {
    4,          // bLength
    0x03,       // bDescriptorType (STRING)
    0x09, 0x04  // Language ID (English US)
};

static const uint8_t cdc_string_manufacturer[] = {
    20,         // bLength
    0x03,       // bDescriptorType (STRING)
    'P', 0, 'Y', 0, '3', 0, '2', 0, 'F', 0, '0', 0, '3', 0, '0', 0
};

static const uint8_t cdc_string_product[] = {
    22,         // bLength
    0x03,       // bDescriptorType (STRING)
    'U', 0, 'S', 0, 'B', 0, ' ', 0, 'V', 0, 'C', 0, 'P', 0, ' ', 0, 'D', 0, 'e', 0, 'v', 0
};

static const uint8_t cdc_string_serial[] = {
    12,         // bLength
    0x03,       // bDescriptorType (STRING)
    '0', 0, '0', 0, '0', 0, '1', 0
};

static const uint8_t * const cdc_strings[] = {
    cdc_string_lang,
    cdc_string_manufacturer,
    cdc_string_product,
    cdc_string_serial
};

volatile CDC_LineCoding cdc_line_coding = {
    {0x00, 0xC2, 0x01, 0x00},  // dwDTERate = 115200
    0,                          // bCharFormat (1 stop bit)
    0,                          // bParityType (None)
    0x08                         // bDataBits (8)
};

volatile CDC_ControlState cdc_control_state = CDC_STATE_NONE;
volatile uint8_t cdc_connected = 0;
volatile uint8_t cdc_dtr = 0;

static uint8_t cdc_rx_buf[CDC_OUT_SIZE];
static uint16_t cdc_rx_len = 0;
static uint8_t cdc_tx_buf[CDC_IN_SIZE];
static uint16_t cdc_tx_len = 0;
static uint16_t cdc_tx_pos = 0;

void CDC_init(void) {
    cdc_rx_len = 0;
    cdc_tx_len = 0;
    cdc_tx_pos = 0;
    cdc_connected = 0;
    cdc_dtr = 0;
    cdc_control_state = CDC_STATE_NONE;
}

void CDC_setup(const USB_SetupPacket *pkt) {
    uint16_t value = pkt->wValue;
    uint16_t index = pkt->wIndex;
    uint16_t len = pkt->wLength;
    (void)value;
    (void)index;
    (void)len;
    
    if ((pkt->bmRequestType & 0x60) == 0x20) {
        if (pkt->bRequest == 0x20) {
            cdc_control_state = CDC_STATE_SET_LINE_CODING;
        } else if (pkt->bRequest == 0x21) {
            cdc_control_state = CDC_STATE_GET_LINE_CODING;
        } else if (pkt->bRequest == 0x22) {
            cdc_dtr = (pkt->wValue & 0x01) ? 1 : 0;
            cdc_connected = cdc_dtr;
            cdc_control_state = CDC_STATE_SET_CONTROL_LINE_STATE;
        } else if (pkt->bRequest == 0x23) {
            cdc_control_state = CDC_STATE_SEND_BREAK;
        }
    }
}

void CDC_out(uint8_t ep, const uint8_t *data, uint16_t len) {
    (void)ep;
    if (len > CDC_OUT_SIZE) {
        len = CDC_OUT_SIZE;
    }
    for (uint16_t i = 0; i < len; i++) {
        cdc_rx_buf[i] = data[i];
    }
    cdc_rx_len = len;
}

void CDC_in(uint8_t ep, uint8_t *data, uint16_t len) {
    (void)ep;
    if (cdc_tx_len == 0) {
        return;
    }
    
    uint16_t send_len = cdc_tx_len - cdc_tx_pos;
    if (send_len > len) {
        send_len = len;
    }
    
    for (uint16_t i = 0; i < send_len; i++) {
        data[i] = cdc_tx_buf[cdc_tx_pos + i];
    }
    cdc_tx_pos += send_len;
    
    if (cdc_tx_pos >= cdc_tx_len) {
        cdc_tx_len = 0;
        cdc_tx_pos = 0;
    }
}

void CDC_send(const uint8_t *data, uint16_t len) {
    if (len > CDC_IN_SIZE) {
        len = CDC_IN_SIZE;
    }
    for (uint16_t i = 0; i < len; i++) {
        cdc_tx_buf[i] = data[i];
    }
    cdc_tx_len = len;
    cdc_tx_pos = 0;
}

uint16_t CDC_recv(uint8_t *data, uint16_t maxlen) {
    uint16_t len = cdc_rx_len;
    if (len > maxlen) {
        len = maxlen;
    }
    for (uint16_t i = 0; i < len; i++) {
        data[i] = cdc_rx_buf[i];
    }
    cdc_rx_len = 0;
    return len;
}

uint8_t CDC_connected(void) {
    return cdc_connected;
}

static const USB_DeviceDescriptor cdc_device_desc = {
    18, 0x01, 0x10, 0x01, 0x02, 0x00, 0x00, 0x40,
    LSB(CDC_VENDOR_ID), MSB(CDC_VENDOR_ID),
    LSB(CDC_PRODUCT_ID), MSB(CDC_PRODUCT_ID),
    LSB(CDC_DEVICE_VER), MSB(CDC_DEVICE_VER),
    0x01, 0x02, 0x03, 0x01
};

static const USB_Class cdc_class = {
    &cdc_device_desc,
    cdc_config_descriptor,
    cdc_strings,
    4,
    CDC_init,
    CDC_setup,
    CDC_out,
    CDC_in
};

const USB_Class *CDC_get_class(void) {
    return &cdc_class;
}
