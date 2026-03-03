#include "usb.h"
#include <stddef.h>
#include "../src/py32f0xx.h"

USB_Device *usb_device = NULL;

#define USB_DM_PIN  11
#define USB_DP_PIN  12

#define USB_DM_PORT GPIOA
#define USB_DP_PORT GPIOA

#define USB_DM_MASK (1U << USB_DM_PIN)
#define USB_DP_MASK (1U << USB_DP_PIN)

static uint8_t usb_state = USB_STATE_DETACHED;
static uint8_t usb_addr = 0;
static uint8_t usb_config = 0;
static uint8_t usb_tx_buf[64];
static uint8_t usb_rx_buf[64];
static uint16_t usb_tx_len = 0;
static uint16_t usb_tx_pos = 0;

static const USB_Class *usb_class_ptr = NULL;

static inline void usb_dm_high(void) { USB_DM_PORT->BSRR = USB_DM_MASK; }
static inline void usb_dm_low(void)  { USB_DM_PORT->BRR = USB_DM_MASK; }
static inline void usb_dp_high(void) { USB_DP_PORT->BSRR = USB_DP_MASK; }
static inline void usb_dp_low(void)  { USB_DP_PORT->BRR = USB_DP_MASK; }

static inline uint8_t usb_dm_read(void) {
    return (USB_DM_PORT->IDR & USB_DM_MASK) ? 1 : 0;
}

static inline uint8_t usb_dp_read(void) {
    return (USB_DP_PORT->IDR & USB_DP_MASK) ? 1 : 0;
}

static inline uint8_t usb_se0_read(void) {
    return (!usb_dm_read() && !usb_dp_read()) ? 1 : 0;
}

void USB_init(USB_Device *dev, const USB_Class *klass) {
    usb_device = dev;
    usb_class_ptr = klass;
    
    RCC->IOPENR |= RCC_IOPENR_GPIOAEN;
    
    USB_DM_PORT->MODER &= ~(0x3U << (USB_DM_PIN * 2));
    USB_DM_PORT->MODER |= (0x1U << (USB_DM_PIN * 2));
    USB_DM_PORT->OTYPER &= ~USB_DM_MASK;
    USB_DM_PORT->OSPEEDR |= (0x3U << (USB_DM_PIN * 2));
    USB_DM_PORT->PUPDR &= ~(0x3U << (USB_DM_PIN * 2));
    USB_DM_PORT->PUPDR |= (0x1U << (USB_DM_PIN * 2));
    
    USB_DP_PORT->MODER &= ~(0x3U << (USB_DP_PIN * 2));
    USB_DP_PORT->MODER |= (0x1U << (USB_DP_PIN * 2));
    USB_DP_PORT->OTYPER &= ~USB_DP_MASK;
    USB_DP_PORT->OSPEEDR |= (0x3U << (USB_DP_PIN * 2));
    USB_DP_PORT->PUPDR &= ~(0x3U << (USB_DP_PIN * 2));
    USB_DP_PORT->PUPDR |= (0x1U << (USB_DP_PIN * 2));
    
    usb_state = USB_STATE_ATTACHED;
    
    if (klass && klass->init) {
        klass->init();
    }
}

void USB_connect(void) {
    usb_state = USB_STATE_POWERED;
    usb_dp_high();
}

void USB_disconnect(void) {
    usb_dp_low();
    usb_dm_low();
    usb_state = USB_STATE_DETACHED;
}

void USB_poll(void) {
    if (usb_state < USB_STATE_POWERED) {
        return;
    }
    
    if (usb_se0_read()) {
        if (usb_state >= USB_STATE_DEFAULT) {
            usb_state = USB_STATE_DEFAULT;
            usb_addr = 0;
            usb_config = 0;
        }
        return;
    }
    
    usb_state = USB_STATE_DEFAULT;
}

void USB_send_data(uint8_t ep, const uint8_t *data, uint16_t len) {
    if (len > 64) len = 64;
    for (uint16_t i = 0; i < len; i++) {
        usb_tx_buf[i] = data[i];
    }
    usb_tx_len = len;
    usb_tx_pos = 0;
}

uint16_t USB_recv_data(uint8_t ep, uint8_t *data, uint16_t maxlen) {
    uint16_t len = 0;
    for (uint16_t i = 0; i < maxlen && i < 64; i++) {
        data[i] = usb_rx_buf[i];
        len++;
    }
    return len;
}

void USB_set_address(uint8_t addr) {
    usb_addr = addr;
    if (addr > 0) {
        usb_state = USB_STATE_ADDRESSED;
    }
}

void USB_set_config(uint8_t cfg) {
    usb_config = cfg;
    if (cfg > 0) {
        usb_state = USB_STATE_CONFIGURED;
        if (usb_class_ptr && usb_class_ptr->init) {
        }
    }
}

uint8_t USB_get_state(void) {
    return usb_state;
}

uint8_t USB_get_address(void) {
    return usb_addr;
}
