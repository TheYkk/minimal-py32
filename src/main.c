#include "system.h"
#include "gpio.h"
#include "../lib/usb.h"
#include "../lib/usb_cdc.h"
#include <stdio.h>
#include <string.h>
#include <stdint.h>

#define LED_PIN PB0

static uint8_t rx_buf[64];
static uint8_t tx_buf[64];
static volatile uint32_t systick_counter = 0;

void SysTick_Handler(void) {
    systick_counter++;
}

static void delay_ms(uint32_t ms) {
    uint32_t start = systick_counter;
    while ((systick_counter - start) < ms);
}

static void led_init(void) {
    RCC->IOPENR |= RCC_IOPENR_GPIOBEN;
    GPIOB->MODER &= ~(0x3 << (LED_PIN * 2));
    GPIOB->MODER |= (0x1 << (LED_PIN * 2));
}

static void led_on(void) {
    GPIOB->BSRR = (1 << LED_PIN);
}

static void led_off(void) {
    GPIOB->BRR = (1 << LED_PIN);
}

static void led_toggle(void) {
    GPIOB->ODR ^= (1 << LED_PIN);
}

static void usb_poll_handler(void) {
    USB_poll();
    
    if (CDC_connected()) {
        uint16_t len = CDC_recv(rx_buf, sizeof(rx_buf));
        if (len > 0) {
            for (uint16_t i = 0; i < len; i++) {
                tx_buf[i] = rx_buf[i];
            }
            CDC_send(tx_buf, len);
            led_toggle();
        }
    }
}

int main(void) {
    SystemInit();
    
    RCC->IOPENR |= RCC_IOPENR_GPIOBEN;
    SysTick_Config(48000);
    
    led_init();
    led_off();
    
    const USB_Class *cdc = CDC_get_class();
    USB_Device dev;
    memset(&dev, 0, sizeof(dev));
    dev.init = NULL;
    dev.poll = usb_poll_handler;
    dev.send = USB_send_data;
    dev.recv = USB_recv_data;
    dev.recv_complete = NULL;
    dev.status_stage = NULL;
    dev.set_config = NULL;
    dev.state = USB_STATE_DETACHED;
    dev.address = 0;
    dev.configuration = 0;
    
    USB_init(&dev, cdc);
    USB_connect();
    
    uint32_t toggle_timer = 0;
    
    while (1) {
        usb_poll_handler();
        
        if ((systick_counter - toggle_timer) > 1000) {
            toggle_timer = systick_counter;
            if (CDC_connected()) {
                const char *msg = "USB CDC Connected\r\n";
                CDC_send((const uint8_t *)msg, strlen(msg));
            }
        }
        
        delay_ms(10);
    }
    
    return 0;
}
