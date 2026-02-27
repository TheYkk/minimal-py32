/**
 ******************************************************************************
 * @file    reconstructed_main.c
 * @brief   PY32F030/PY32F002A IAP Bootloader - Reconstructed from firmware binary
 *
 * This file was reconstructed from the PY32F030xx IAP bootloader firmware binary
 * using the following tools:
 *   - arm-none-eabi-gcc (ARM GCC toolchain) - compilation
 *   - arm-none-eabi-objdump - disassembly
 *   - RetDec v5.0 (https://retdec.com) - decompilation
 *
 * Source firmware: OpenPuya/IAP_APP_Fireware (GitHub)
 * Target: PY32F030x6 (Cortex-M0+, 32KB Flash, 4KB RAM)
 *
 * The bootloader implements the PUYA ISP protocol (compatible with STM32 USART
 * bootloader protocol) for programming the PY32F030/PY32F002A via UART.
 *
 * Bootloader ROM address: 0x1FFF0000 (System Memory)
 * Application start address: 0x08001000
 *
 * UART pins supported:
 *   - PA2 (TX) / PA3 (RX)  - USART1 AF1
 *   - PA9 (TX) / PA10 (RX) - USART1 AF1
 *   - PA14 (TX) / PA15 (RX) - USART1 AF1
 *
 * Protocol: 9-bit USART with even parity, auto baud rate detection
 * Baud rate range: 1200 - 1000000 bps (default: 115200)
 *
 * Commands supported:
 *   0x00 - GET_COMMAND      - Get list of supported commands
 *   0x01 - GET_VERSION      - Get bootloader version
 *   0x02 - GET_ID           - Get chip ID (returns 0x0440 for PY32F030)
 *   0x11 - READ_MEMORY      - Read memory
 *   0x21 - GO               - Jump to application
 *   0x31 - WRITE_MEMORY     - Write memory
 *   0x44 - EXT_ERASE_MEMORY - Extended erase
 *   0x63 - WRITE_PROTECT    - Write protect sectors
 *   0x73 - WRITE_UNPROTECT  - Remove write protection
 *   0x82 - READ_PROTECT     - Enable read protection
 *   0x92 - READ_UNPROTECT   - Remove read protection
 *   0x03 - GET_DEVICE_IDCODE - Get device IDCODE
 *
 ******************************************************************************
 */

/* ============================================================================
 * REGISTER DEFINITIONS (PY32F030)
 * ============================================================================ */

/* RCC Registers */
#define RCC_BASE        0x40021000
#define RCC_CR          (*(volatile uint32_t *)(RCC_BASE + 0x000))  /* Clock control */
#define RCC_ICSCR       (*(volatile uint32_t *)(RCC_BASE + 0x004))  /* Internal clock sources calibration */
#define RCC_CFGR        (*(volatile uint32_t *)(RCC_BASE + 0x008))  /* Clock configuration */
#define RCC_IOPENR      (*(volatile uint32_t *)(RCC_BASE + 0x034))  /* GPIO clock enable */
#define RCC_APBENR2     (*(volatile uint32_t *)(RCC_BASE + 0x040))  /* APB2 peripheral clock enable */

/* GPIOA Registers */
#define GPIOA_BASE      0x50000000
#define GPIOA_MODER     (*(volatile uint32_t *)(GPIOA_BASE + 0x000))  /* Mode register */
#define GPIOA_IDR       (*(volatile uint32_t *)(GPIOA_BASE + 0x010))  /* Input data register */
#define GPIOA_PUPDR     (*(volatile uint32_t *)(GPIOA_BASE + 0x00C))  /* Pull-up/pull-down register */
#define GPIOA_AFRL      (*(volatile uint32_t *)(GPIOA_BASE + 0x020))  /* Alternate function low register */
#define GPIOA_AFRH      (*(volatile uint32_t *)(GPIOA_BASE + 0x024))  /* Alternate function high register */

/* USART1 Registers */
#define USART1_BASE     0x40013800
#define USART1_CR1      (*(volatile uint32_t *)(USART1_BASE + 0x000))  /* Control register 1 */
#define USART1_CR2      (*(volatile uint32_t *)(USART1_BASE + 0x004))  /* Control register 2 */
#define USART1_CR3      (*(volatile uint32_t *)(USART1_BASE + 0x008))  /* Control register 3 */
#define USART1_BRR      (*(volatile uint32_t *)(USART1_BASE + 0x00C))  /* Baud rate register */
#define USART1_SR       (*(volatile uint32_t *)(USART1_BASE + 0x014))  /* Status register */
#define USART1_DR       (*(volatile uint32_t *)(USART1_BASE + 0x028))  /* Data register */

/* FLASH Registers */
#define FLASH_BASE_REG  0x40022000
#define FLASH_CR        (*(volatile uint32_t *)(FLASH_BASE_REG + 0x010))
#define FLASH_SR        (*(volatile uint32_t *)(FLASH_BASE_REG + 0x014))
#define FLASH_OPTR      (*(volatile uint32_t *)(FLASH_BASE_REG + 0x020))
#define FLASH_SDKR      (*(volatile uint32_t *)(FLASH_BASE_REG + 0x024))
#define FLASH_WRPR      (*(volatile uint32_t *)(FLASH_BASE_REG + 0x028))

/* System Memory (ROM Bootloader area) */
#define SYSTEM_BASE     0x1FFF0000
#define FLASHSIZE_BASE  0x1FFF0E00  /* Flash size register */
#define UID_BASE        0x1FFF0E10  /* Unique device ID */
#define BID_BASE        0x1FFF0F00  /* Bootloader ID */
#define OPTION_BASE     0x1FFF0E80  /* Option bytes */

/* ============================================================================
 * BOOTLOADER CONSTANTS
 * ============================================================================ */

#define SYS_CLK         24000000U
#define MAX_BAUDRATE    (1000000 + 100)
#define MIN_BAUDRATE    (1200 - 100)
#define DEFAULT_BAUDRATE 115200
#define DEFAULT_BRR     ((SYS_CLK + DEFAULT_BAUDRATE/2) / DEFAULT_BAUDRATE)  /* = 208 */
#define MAX_BRR         ((SYS_CLK + MAX_BAUDRATE/2) / MAX_BAUDRATE)
#define MIN_BRR         ((SYS_CLK + MIN_BAUDRATE/2) / MIN_BAUDRATE)

#define ACK_BYTE        0x79  /* Acknowledge byte */
#define NACK_BYTE       0x1F  /* Not-acknowledge byte */

#define VERSION         0x10  /* Bootloader version 1.0 */
#define BID             0x10  /* Bootloader ID */

/* Application start address */
#define APP_ADDR        0x08001000

/* Memory area types */
#define AREA_ERROR      0x0U  /* Error Address Area */
#define FLASH_AREA      0x1U  /* Flash Address Area */
#define RAM_AREA        0x2U  /* RAM Address area */
#define OB_AREA         0x3U  /* Option bytes Address area */
#define OTP_AREA        0x4U  /* OTP Address area */
#define SYS_AREA        0x5U  /* System memory area */
#define EB_AREA         0x7U  /* Engi bytes Address area */

/* Bootloader commands */
#define CMD_GET_COMMAND         0x00
#define CMD_GET_VERSION         0x01
#define CMD_GET_ID              0x02
#define CMD_READ_MEMORY         0x11
#define CMD_GO                  0x21
#define CMD_WRITE_MEMORY        0x31
#define CMD_EXT_ERASE_MEMORY    0x44
#define CMD_WRITE_PROTECT       0x63
#define CMD_WRITE_UNPROTECT     0x73
#define CMD_READ_PROTECT        0x82
#define CMD_READ_UNPROTECT      0x92
#define CMD_GET_DEVICE_IDCODE   0x03

/* DBGMCU IDCODE for PY32F030 */
#define DBGMCU_IDCODE   0x0440  /* PY32F030 device ID */

/* Flash keys */
#define FLASH_KEY1      0x45670123
#define FLASH_KEY2      0xCDEF89AB

/* RDP levels */
#define FLASH_OPTR_RDP_LEVEL_0  0xAA
#define FLASH_OPTR_RDP_LEVEL_1  0xBB

/* ============================================================================
 * TYPES
 * ============================================================================ */

#include <stdint.h>
#include <stdbool.h>

typedef void (*Function_Pointer)(void);

/* ============================================================================
 * GLOBAL VARIABLES
 * ============================================================================ */

/* Data buffer for bootloader operations (0x180 = 384 bytes) */
static uint8_t guc_DataBuffer[0x180];

/* Supported bootloader commands list */
static const uint8_t BOOTLOADER_CMD[] = {
    CMD_GET_COMMAND, CMD_GET_VERSION, CMD_GET_ID,
    CMD_READ_MEMORY, CMD_GO, CMD_WRITE_MEMORY, CMD_EXT_ERASE_MEMORY,
    CMD_WRITE_PROTECT, CMD_WRITE_UNPROTECT, CMD_READ_PROTECT, CMD_READ_UNPROTECT,
    CMD_GET_DEVICE_IDCODE
};

/* ============================================================================
 * FUNCTION PROTOTYPES
 * ============================================================================ */

void Bootloader_Init(void);
void Bootloader_ProtocolDetection(void);
void JumpToAddress(uint32_t dwAddr);
uint8_t GetAddressArea(uint32_t *pdwAddr);
int ReadMemory(void);
int Go(void);
int WriteMemory(void);
int ExtendedErase(void);
int WriteProtect(void);
uint8_t GetXOR(const uint8_t *pucDataBuf, uint16_t wDataLength, uint8_t ucBase);
void USART_SendByte(uint8_t byte);
uint8_t USART_ReadByte(void);
void WDG_Init(void);
void WDG_Refresh(void);
int WriteFlash(uint32_t addr, uint8_t *data, uint32_t len);
int WriteOption(uint32_t addr, uint8_t *data, uint32_t flags);
int MassErase(void);
int PageErase(uint8_t *pages, uint32_t xorCheck, uint32_t count);
int SectorErase(uint8_t *sectors, uint32_t count, uint32_t v12, uint32_t mode);
void APP_SystemClockConfig(uint32_t calibFreq, uint32_t sysClk);

/* ============================================================================
 * MAIN FUNCTION
 * ============================================================================ */

/**
 * @brief  Application entry point - IAP Bootloader
 *
 * The bootloader checks if the user button is pressed at startup.
 * If not pressed, it jumps directly to the application at APP_ADDR.
 * If pressed (or no valid app), it initializes the bootloader and
 * enters the main protocol detection loop.
 *
 * Decompiled from address: 0x080001F0
 */
int main(void)
{
#ifdef JUMP_TO_APP_BY_USER_BUTTON
    /* Configure user Button (PA1 on PY32F030 Start Kit) */
    BSP_PB_Init(BUTTON_USER, BUTTON_MODE_GPIO);

    /* Check if the USER Button is pressed (active low) */
    if (BSP_PB_GetState(BUTTON_USER) == 0x00)
    {
        /* Button not pressed - jump directly to application */
        JumpToAddress(APP_ADDR);
    }
#endif

    /* Configure system clock to 24MHz using HSI */
    /* Read HSI calibration from system memory at 0x1FFF0F10 */
    uint32_t hsiCalib = *(volatile uint32_t *)0x1FFF0F10;
    uint32_t calibFreq = (hsiCalib & 0x1FFF) | 0x8000;  /* Extract calibration value */
    APP_SystemClockConfig(calibFreq, 24000000);

    /* Initialize bootloader (UART detection, auto-baud) */
    Bootloader_Init();

    /* Main bootloader loop - process commands */
    while (1)
    {
        Bootloader_ProtocolDetection();
    }
}

/* ============================================================================
 * BOOTLOADER INITIALIZATION
 * ============================================================================ */

/**
 * @brief  Initialize the bootloader
 *
 * This function:
 * 1. Initializes the watchdog timer
 * 2. Polls UART RX pins (PA3, PA10, PA15) for a falling edge (START bit)
 * 3. Configures the detected UART pin pair as USART1 alternate function
 * 4. Initializes USART1 with 9-bit data, even parity, auto baud rate
 * 5. Waits for auto baud rate detection to complete
 * 6. Sends ACK byte to host
 *
 * Decompiled from address: 0x08000238
 */
void Bootloader_Init(void)
{
    uint32_t dwRstPALevel[3][2];
    uint32_t wPAConfig;

#ifdef JUMP_TO_APP_BY_TIME_OUT
    volatile uint32_t uwReadCount = 0;
#endif

    /* Initialize watchdog */
    WDG_Init();

    /* Enable GPIOA clock */
    RCC_IOPENR |= (1 << 0);  /* RCC_IOPENR_GPIOAEN */

    /* Set PA3, PA10, PA15 as input (clear mode bits) */
    GPIOA_MODER &= ~((3 << 6) | (3 << 20) | (3 << 30));

    /* Read pin configuration from system memory (0x1FFF0D90)
     * This tells which pins are physically bonded out on this package */
    wPAConfig = *(volatile uint32_t *)0x1FFF0D90;

    /* If PA3 is not bonded out, add pull-up to avoid floating input */
    if ((wPAConfig & (1 << 3)) == 0)
    {
        GPIOA_PUPDR |= (1 << 6);  /* Pull-up on PA3 */
    }
    /* If PA10 is not bonded out, add pull-up */
    if ((wPAConfig & (1 << 10)) == 0)
    {
        GPIOA_PUPDR |= (1 << 20);  /* Pull-up on PA10 */
    }
    /* If PA15 is not bonded out, add pull-up */
    if ((wPAConfig & (1 << 15)) == 0)
    {
        GPIOA_PUPDR |= (1 << 30);  /* Pull-up on PA15 */
    }

    /* Sample initial pin levels */
    dwRstPALevel[0][0] = GPIOA_IDR & (1 << 3);   /* PA3 */
    dwRstPALevel[1][0] = GPIOA_IDR & (1 << 10);  /* PA10 */
    dwRstPALevel[2][0] = GPIOA_IDR & (1 << 15);  /* PA15 */

    /* Wait for falling edge on any RX pin (START bit of 0x7F sync byte) */
    while (1)
    {
#ifdef JUMP_TO_APP_BY_TIME_OUT
        if (uwReadCount++ > MAX_TIME_OUT)
        {
            JumpToAddress(APP_ADDR);
        }
#endif

        /* Shift previous levels */
        dwRstPALevel[0][1] = dwRstPALevel[0][0];
        dwRstPALevel[1][1] = dwRstPALevel[1][0];
        dwRstPALevel[2][1] = dwRstPALevel[2][0];

        /* Sample current levels */
        dwRstPALevel[0][0] = GPIOA_IDR & (1 << 3);
        dwRstPALevel[1][0] = GPIOA_IDR & (1 << 10);
        dwRstPALevel[2][0] = GPIOA_IDR & (1 << 15);

        WDG_Refresh();

        /* Detect falling edge on PA3 (USART1_RX AF1) */
        if (dwRstPALevel[0][1] && (!dwRstPALevel[0][0]))
        {
            /* Configure GPIOA: set all to analog except PA2/PA3 as AF */
            GPIOA_MODER = 0xEBFFFFFF;
            GPIOA_MODER &= ~((1 << 4) | (1 << 6));  /* PA2, PA3 = AF mode (10) */
            GPIOA_AFRL |= (1 << 8) | (1 << 12);     /* AF1: USART1_TX(PA2), USART1_RX(PA3) */
            break;
        }

        /* Detect falling edge on PA10 (USART1_RX AF1) */
        if (dwRstPALevel[1][1] && (!dwRstPALevel[1][0]))
        {
            GPIOA_MODER = 0xEBFFFFFF;
            GPIOA_MODER &= ~((1 << 18) | (1 << 20));  /* PA9, PA10 = AF mode */
            GPIOA_AFRH |= (1 << 4) | (1 << 8);        /* AF1: USART1_TX(PA9), USART1_RX(PA10) */
            break;
        }

        /* Detect falling edge on PA15 (USART1_RX AF1) */
        if (dwRstPALevel[2][1] && (!dwRstPALevel[2][0]))
        {
            GPIOA_MODER = 0xEBFFFFFF;
            GPIOA_MODER &= ~((1 << 28) | (1 << 30));  /* PA14, PA15 = AF mode */
            GPIOA_AFRH |= (1 << 24) | (1 << 28);      /* AF1: USART1_TX(PA14), USART1_RX(PA15) */
            break;
        }
    }

    /* Enable USART1 clock */
    RCC_APBENR2 |= (1 << 14);  /* RCC_APBENR2_USART1EN */

    /* Configure USART1:
     * - 9-bit data (M=1)
     * - Even parity (PCE=1, PS=0)
     * - 1 stop bit (STOP=00)
     */
    USART1_CR1 |= (1 << 12) | (1 << 10);  /* USART_CR1_M | USART_CR1_PCE */

    /* Set default baud rate (will be overridden by auto-baud) */
    USART1_BRR = DEFAULT_BRR;  /* 208 for 115200 baud at 24MHz */

    /* Enable auto baud rate detection (measure from START bit) */
    USART1_CR3 = (USART1_CR3 & ~(3 << 20)) | (1 << 20);  /* ABRMODE=00, ABREN=1 */

    /* Enable USART */
    USART1_CR1 |= (1 << 0);  /* USART_CR1_UE */

    /* Wait for auto baud rate detection to complete */
    while ((USART1_SR & (1 << 10)) == 0);  /* Wait for ABRF flag */

    /* Check for auto baud rate error or out-of-range baud rate */
    if ((USART1_SR & (1 << 11)) ||           /* ABRE error flag */
        (USART1_BRR < MAX_BRR) ||            /* Baud rate too high */
        (USART1_BRR > MIN_BRR))              /* Baud rate too low */
    {
        /* Reset the MCU and try again */
        /* SCB->AIRCR = 0x05FA0004 (system reset request) */
        *(volatile uint32_t *)0xE000ED0C = 0x05FA0004;
        while (1);
    }

    /* Disable interrupts during USART configuration */
    __disable_irq();

    /* Request new auto baud rate measurement and disable auto-baud */
    USART1_SR |= (1 << 12);   /* ABRRQ - request new measurement */
    USART1_CR3 &= ~(1 << 20); /* Disable ABREN */

    /* Clear RX and TX complete flags */
    USART1_SR &= ~((1 << 5) | (1 << 6));  /* Clear RXNE and TC */

    /* Enable transmitter and receiver */
    USART1_CR1 |= (1 << 3) | (1 << 2);  /* TE | RE */

    /* Send ACK to indicate bootloader is ready */
    USART_SendByte(ACK_BYTE);
}

/* ============================================================================
 * PROTOCOL DETECTION / COMMAND HANDLER
 * ============================================================================ */

/**
 * @brief  Process one bootloader command from the host
 *
 * Protocol:
 * 1. Host sends command byte + XOR complement (cmd ^ ~cmd = 0xFF)
 * 2. Bootloader validates and sends ACK
 * 3. Bootloader executes command
 * 4. Bootloader sends ACK (success) or NACK (failure)
 *
 * Decompiled from address: 0x080008C4
 */
void Bootloader_ProtocolDetection(void)
{
    uint8_t ucCommand;
    int eStatus = 1;  /* SUCCESS */
    uint8_t i;

    /* Read command byte */
    ucCommand = USART_ReadByte();

    /* Validate command integrity: cmd XOR complement must equal 0xFF */
    if ((ucCommand ^ USART_ReadByte()) != 0xFF)
    {
        USART_SendByte(NACK_BYTE);
        return;
    }

    USART_SendByte(ACK_BYTE);

    /* Unlock FLASH for write/erase operations */
    switch (ucCommand)
    {
    case CMD_WRITE_MEMORY:
    case CMD_EXT_ERASE_MEMORY:
    case CMD_WRITE_PROTECT:
    case CMD_WRITE_UNPROTECT:
    case CMD_READ_PROTECT:
    case CMD_READ_UNPROTECT:
        /* Check if FLASH is busy */
        if (FLASH_SR & (1 << 16))  /* FLASH_SR_BSY */
        {
            USART_SendByte(NACK_BYTE);
            return;
        }
        /* Unlock FLASH if locked */
        if (FLASH_CR & (1 << 31))  /* FLASH_CR_LOCK */
        {
            /* Write unlock keys */
            *(volatile uint32_t *)(0x40022000 + 0x008) = FLASH_KEY1;
            *(volatile uint32_t *)(0x40022000 + 0x008) = FLASH_KEY2;

            /* Configure flash timing parameters from system memory */
            /* These values are stored at 0x1FFF0F6C by the factory */
            /* __HAL_FLASH_TIME_REG_SET(...) */
        }
        break;
    }

    /* Execute command */
    switch (ucCommand)
    {
    case CMD_GET_COMMAND:
        /* Return: count, version, command list */
        USART_SendByte(sizeof(BOOTLOADER_CMD));
        USART_SendByte(VERSION);
        for (i = 0; i < sizeof(BOOTLOADER_CMD); i++)
        {
            USART_SendByte(BOOTLOADER_CMD[i]);
        }
        break;

    case CMD_GET_VERSION:
        /* Return: version, 0x00, 0x00 */
        USART_SendByte(VERSION);
        USART_SendByte(0x00);
        USART_SendByte(0x00);
        break;

    case CMD_GET_ID:
        /* Return ST-compatible chip ID: 0x0440 (2 bytes, MSB first) */
        USART_SendByte(0x01);  /* N-1 = 1 (2 bytes follow) */
        USART_SendByte(0x04);  /* ID high byte */
        USART_SendByte(0x40);  /* ID low byte */
        break;

    case CMD_GET_DEVICE_IDCODE:
        /* Return actual PUYA device IDCODE */
        USART_SendByte(0x01);
        USART_SendByte((DBGMCU_IDCODE >> 8) & 0xFF);
        USART_SendByte(DBGMCU_IDCODE & 0xFF);
        break;

    case CMD_READ_MEMORY:
        eStatus = ReadMemory();
        return;  /* ReadMemory sends its own ACK/NACK */

    case CMD_GO:
        eStatus = Go();
        break;

    case CMD_WRITE_MEMORY:
        eStatus = WriteMemory();
        break;

    case CMD_EXT_ERASE_MEMORY:
        eStatus = ExtendedErase();
        break;

    case CMD_WRITE_PROTECT:
        eStatus = WriteProtect();
        break;

    case CMD_WRITE_UNPROTECT:
        /* Remove write protection - restore SDKR and WRPR to defaults */
        guc_DataBuffer[0] = (FLASH_SDKR >> 0) & 0xFF;
        guc_DataBuffer[1] = (FLASH_SDKR >> 8) & 0xFF;
        guc_DataBuffer[4] = (FLASH_WRPR >> 0) & 0xFF;
        guc_DataBuffer[5] = (FLASH_WRPR >> 8) & 0xFF;
        eStatus = WriteOption(0x1FFF0E8C, guc_DataBuffer, 0x07);
        break;

    case CMD_READ_PROTECT:
        /* Enable read protection level 1 */
        guc_DataBuffer[0] = FLASH_OPTR_RDP_LEVEL_1;
        eStatus = WriteOption(0x1FFF0E80, guc_DataBuffer, 0x00);
        break;

    case CMD_READ_UNPROTECT:
        /* Remove read protection - restore OPTR and SDKR to defaults */
        guc_DataBuffer[0] = (FLASH_OPTR >> 0) & 0xFF;
        guc_DataBuffer[1] = (FLASH_OPTR >> 8) & 0xFF;
        guc_DataBuffer[4] = (FLASH_SDKR >> 0) & 0xFF;
        guc_DataBuffer[5] = (FLASH_SDKR >> 8) & 0xFF;
        eStatus = WriteOption(0x1FFF0E80, guc_DataBuffer, 0x07);
        break;

    default:
        eStatus = 0;  /* ERROR */
        break;
    }

    /* Lock FLASH after write/erase operations */
    switch (ucCommand)
    {
    case CMD_WRITE_MEMORY:
    case CMD_EXT_ERASE_MEMORY:
    case CMD_WRITE_PROTECT:
    case CMD_WRITE_UNPROTECT:
    case CMD_READ_PROTECT:
    case CMD_READ_UNPROTECT:
        FLASH_CR |= (1 << 31);  /* FLASH_CR_LOCK */
        break;
    }

    /* Send final ACK or NACK */
    USART_SendByte(eStatus ? ACK_BYTE : NACK_BYTE);
}

/* ============================================================================
 * HELPER FUNCTIONS
 * ============================================================================ */

/**
 * @brief  Jump to application at given address
 *
 * Validates that the stack pointer value at dwAddr points to SRAM,
 * then sets MSP and jumps to the reset handler.
 *
 * Decompiled from address: 0x08000608
 */
void JumpToAddress(uint32_t dwAddr)
{
    Function_Pointer jump_to_address;

    /* Validate: check if stack pointer value is in SRAM range */
    if ((*(volatile uint32_t *)dwAddr & 0x2FFE0000) == 0x20000000)
    {
        __enable_irq();

        /* Set Main Stack Pointer to value stored at dwAddr */
        __set_MSP(*(volatile uint32_t *)dwAddr);

        /* Get reset handler address (stored at dwAddr + 4) */
        jump_to_address = (Function_Pointer)(*(volatile uint32_t *)(dwAddr + 4U));

        /* Jump to application */
        jump_to_address();
    }
}

/**
 * @brief  Read address from UART and determine memory area type
 *
 * Reads 4 bytes (MSB first) + XOR checksum from UART.
 * Returns the memory area type and sets *pdwAddr.
 *
 * Decompiled from address: 0x08000404
 */
uint8_t GetAddressArea(uint32_t *pdwAddr)
{
    uint32_t dwStartAddr;
    uint32_t dwEndAddr;

    /* Read 4-byte address (big-endian) */
    guc_DataBuffer[0] = USART_ReadByte();
    guc_DataBuffer[1] = USART_ReadByte();
    guc_DataBuffer[2] = USART_ReadByte();
    guc_DataBuffer[3] = USART_ReadByte();

    /* Validate XOR checksum */
    if (USART_ReadByte() != GetXOR(guc_DataBuffer, 0x04, 0x00))
    {
        return AREA_ERROR;
    }

    USART_SendByte(ACK_BYTE);

    /* Reconstruct address from bytes (big-endian) */
    *pdwAddr = ((uint32_t)guc_DataBuffer[0] << 24) |
               ((uint32_t)guc_DataBuffer[1] << 16) |
               ((uint32_t)guc_DataBuffer[2] << 8)  |
               ((uint32_t)guc_DataBuffer[3]);

    /* Handle special address remapping for ST-compatible tools */
    switch (*pdwAddr)
    {
    case 0x1FFFF7CC:  /* STM32F0 Flash size register address */
    case 0x1FFFF7E0:  /* STM32F1 Flash size register address */
        return OB_AREA;

    case 0x1FFFF7A6:  /* ST UID base address */
        *pdwAddr = UID_BASE;  /* Remap to PY32 UID address */
        break;

    case 0x1FFFF800:  /* ST Option bytes base */
        *pdwAddr = OPTION_BASE;  /* Remap to PY32 option bytes */
        break;

    case 0x1FFFF7E8:  /* ST BID base */
        *pdwAddr = BID_BASE;  /* Remap to PY32 BID */
