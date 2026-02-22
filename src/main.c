// ===================================================================================
// Project:   Full Test for Serial Debug Functions (PY32F0xx)
// Version:   v1.1
// Description: Tests all functions in debug_serial.h/c
// ===================================================================================

#include "debug_serial.h" // serial debug functions
#include "gpio.h"         // GPIO functions
#include "log.h"
#include "system.h" // system functions

//------------------------------------------------------------------------------
// Module constant defines
//------------------------------------------------------------------------------
#define TAG "main"

//------------------------------------------------------------------------------
// Module static variables
//------------------------------------------------------------------------------
static uint32_t s_systick = 0;

#define SYSTICK_ONE_MILLISECOND ((uint32_t)F_CPU / 1000)
#define SYSTICK_ONE_MICROSECOND ((uint32_t)F_CPU / 1000000)
#define millis()                (SysTick->VAL / SYSTICK_ONE_MILLISECOND)

#define PIN_LED PB0 // define LED pin
int main(void)
{
    // 1. Initialize Debug Interface
    // Default is usually 115200 baud, 8N1. Pin selection depends on DEBUG_TX
    // define.
    DEBUG_init();
    // Setup
    PIN_output(PIN_LED); // set LED pin as output
    LOG_Init(eLOG_LEVEL_DEBUG, &s_systick);

    LOGI(TAG, "Hello, PY32F0xx!");
    // Wait a moment for the serial monitor to stabilize
    DLY_ms(500);
    uint32_t count = 0;
    while (1)
    {
        PIN_high(PIN_LED); // toggle LED on/off
        DEBUG_println("--- STARTING SERIAL DEBUG TEST ---");

        // 2. Test Basic String Functions
        DEBUG_print("This is DEBUG_print (no newline). ");
        DEBUG_println("This is DEBUG_println (with newline).");

        // 3. Test Raw Character Write
        DEBUG_print("Manual characters: ");
        DEBUG_write('O');
        DEBUG_write('K');
        DEBUG_write('\n');

        // 4. Test Hex Formatting Functions
        DEBUG_print("Hex Nibble (4-bit, 0xA):   ");
        DEBUG_printN(0xA);
        DEBUG_write('\n');
        DEBUG_print("Hex Byte (8-bit, 0xFE):    ");
        DEBUG_printB(0xFE);
        DEBUG_write('\n');
        DEBUG_print("Hex Half (16-bit, 0xABCD): ");
        DEBUG_printH(0xABCD);
        DEBUG_write('\n');
        DEBUG_print("Hex Word (32-bit, 0x12345678): ");
        DEBUG_printW(0x12345678);
        DEBUG_write('\n');

        // 5. Test Decimal Function
        DEBUG_print("Decimal (uint32_t max):     ");
        DEBUG_printD(4294967295);
        DEBUG_write('\n');
        DEBUG_print("Decimal (standard):        ");
        DEBUG_printD(123456);
        DEBUG_write('\n');

        // 6. Test Printf Functionality
        DEBUG_println("--- Testing DEBUG_printf ---");

        // String and Char
        DEBUG_printf("String: %s | Char: %c\n", "Hello PY32", '!');

        // Decimal (Signed and Unsigned)
        int32_t neg_val = -1234;
        uint32_t pos_val = 5678;
        DEBUG_printf("Signed: %d | Unsigned: %u\n", neg_val, pos_val);

        // Hex and Binary
        DEBUG_printf("Hex: %x | Binary: %b\n", 0xDEADBEEF, 0b10101010);

        // Padding (Leading zeros / width)
        // %02d style: 0 is the pad char, 2 is the width
        DEBUG_printf("Padding (05d): %05d\n", 42);
        DEBUG_printf("Padding (10u): %10u\n", 123);

        // Percent sign
        DEBUG_printf("Literal Percent: 100%%\n");

        DEBUG_println("--- TEST COMPLETE ---\n");

        LOGI(TAG, "Count: %d", count++);

        PIN_low(PIN_LED); // toggle LED on/off
        // Wait 5 seconds before repeating
        DLY_ms(5000);
    }
}

/**
 * @brief  SysTick interrupt handler.
 * @param  None
 * @return None
 */
void SysTick_Handler(void)
{
    s_systick++;
}