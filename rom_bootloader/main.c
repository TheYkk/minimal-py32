/**
 ******************************************************************************
 * @file    main.c
 * @brief   PY32F030/PY32F002A ROM Bootloader - Reconstructed from binary
 *          ROM address range: 0x1FFF0000 - 0x1FFF0CFF
 *
 * This file was reconstructed from the actual ROM bootloader binary
 * (py_bootloader_1FFF0000_1FFF0CFF.bin) using RetDec decompiler and
 * cross-referenced with the OpenPuya IAP bootloader source code.
 *
 * The ROM bootloader implements the PUYA ISP (In-System Programming) protocol
 * over USART, compatible with the STM32 bootloader protocol.
 *
 * Memory Map:
 *   ROM Bootloader: 0x1FFF0000 - 0x1FFF0CFF (3328 bytes)
 *   Stack:          0x20000200 (initial SP from vector table)
 *   Entry Point:    0x1FFF00D5 (Reset_Handler, Thumb mode)
 *
 * Vector Table (at 0x1FFF0000):
 *   0x1FFF0000: 0x20000200  - Initial Stack Pointer
 *   0x1FFF0004: 0x1FFF00D5  - Reset_Handler
 *   0x1FFF0008: 0x1FFF00DD  - NMI_Handler
 *   0x1FFF000C: 0x1FFF00DF  - HardFault_Handler
 *   0x1FFF002C: 0x1FFF00E1  - SVC_Handler
 *   0x1FFF0038: 0x1FFF00E3  - PendSV_Handler
 *   0x1FFF003C: 0x1FFF00E5  - SysTick_Handler
 *   0x1FFF0040+: 0x1FFF00E7 - Default IRQ handlers (infinite loops)
 *
 * ISP Protocol Commands:
 *   0x00 - CMD_GET_COMMAND      - Get supported commands list
 *   0x01 - CMD_GET_VERSION      - Get bootloader version
 *   0x02 - CMD_GET_ID           - Get chip ID
 *   0x03 - CMD_GET_DEVICE_IDCODE - Get device IDCODE
 *   0x11 - CMD_READ_MEMORY      - Read memory
 *   0x21 - CMD_GO               - Jump to application
 *   0x31 - CMD_WRITE_MEMORY     - Write memory
 *   0x44 - CMD_EXT_ERASE_MEMORY - Extended erase
 *   0x63 - CMD_WRITE_PROTECT    - Write protect
 *   0x73 - CMD_WRITE_UNPROTECT  - Write unprotect
 *   0x82 - CMD_READ_PROTECT     - Read protect
 *   0x92 - CMD_READ_UNPROTECT   - Read unprotect
 *
 ******************************************************************************
 */

#include <stdbool.h>
#include <stdint.h>

/* ============================================================================
 * Register Definitions
 * ============================================================================ */

/* RCC (Reset and Clock Control) */
#define RCC_BASE            0x40021000UL
#define RCC_CR              (*(volatile uint32_t *)(RCC_BASE + 0x00))  /* Clock control */
#define RCC_ICSCR           (*(volatile uint32_t *)(RCC_BASE + 0x04))  /* Internal clock sources calibration */
#define RCC_CFGR            (*(volatile uint32_t *)(RCC_BASE + 0x08))  /* Clock configuration */
#define RCC_IOPENR          (*(volatile uint32_t *)(RCC_BASE + 0x34))  /* GPIO clock enable */
#define RCC_APBENR2         (*(volatile uint32_t *)(RCC_BASE + 0x40))  /* APB2 peripheral clock enable */

/* GPIOA */
#define GPIOA_BASE          0x50000000UL
#define GPIOA_MODER         (*(volatile uint32_t *)(GPIOA_BASE + 0x00))
#define GPIOA_OTYPER        (*(volatile uint32_t *)(GPIOA_BASE + 0x04))
#define GPIOA_OSPEEDR       (*(volatile uint32_t *)(GPIOA_BASE + 0x08))
#define GPIOA_PUPDR         (*(volatile uint32_t *)(GPIOA_BASE + 0x0C))
#define GPIOA_IDR           (*(volatile uint32_t *)(GPIOA_BASE + 0x10))
#define GPIOA_ODR           (*(volatile uint32_t *)(GPIOA_BASE + 0x14))
#define GPIOA_AFRL          (*(volatile uint32_t *)(GPIOA_BASE + 0x20))
#define GPIOA_AFRH          (*(volatile uint32_t *)(GPIOA_BASE + 0x24))

/* USART1 */
#define USART1_BASE         0x40013800UL
#define USART1_SR           (*(volatile uint32_t *)(USART1_BASE + 0x00))
#define USART1_DR           (*(volatile uint32_t *)(USART1_BASE + 0x04))
#define USART1_BRR          (*(volatile uint32_t *)(USART1_BASE + 0x08))
#define USART1_CR1          (*(volatile uint32_t *)(USART1_BASE + 0x0C))
#define USART1_CR2          (*(volatile uint32_t *)(USART1_BASE + 0x10))
#define USART1_CR3          (*(volatile uint32_t *)(USART1_BASE + 0x14))

/* FLASH */
#define FLASH_BASE_REG      0x40022000UL
#define FLASH_ACR           (*(volatile uint32_t *)(FLASH_BASE_REG + 0x00))
#define FLASH_KEYR          (*(volatile uint32_t *)(FLASH_BASE_REG + 0x08))
#define FLASH_OPTKEYR       (*(volatile uint32_t *)(FLASH_BASE_REG + 0x0C))
#define FLASH_SR            (*(volatile uint32_t *)(FLASH_BASE_REG + 0x10))
#define FLASH_CR            (*(volatile uint32_t *)(FLASH_BASE_REG + 0x14))
#define FLASH_OPTR          (*(volatile uint32_t *)(FLASH_BASE_REG + 0x20))

/* IWDG */
#define IWDG_BASE           0x40003000UL
#define IWDG_KR             (*(volatile uint32_t *)(IWDG_BASE + 0x00))
#define IWDG_PR             (*(volatile uint32_t *)(IWDG_BASE + 0x04))
#define IWDG_RLR            (*(volatile uint32_t *)(IWDG_BASE + 0x08))
#define IWDG_SR             (*(volatile uint32_t *)(IWDG_BASE + 0x0C))

/* DBGMCU */
#define DBGMCU_BASE         0x40015800UL
#define DBGMCU_IDCODE       (*(volatile uint32_t *)(DBGMCU_BASE + 0x00))

/* SCB (System Control Block) */
#define SCB_AIRCR           (*(volatile uint32_t *)0xE000ED0CUL)

/* ============================================================================
 * ROM Configuration Data (at 0x1FFF0D90)
 * Contains chip-specific pin availability information
 * ============================================================================ */
#define ROM_CONFIG_PA_PINS  (*(volatile uint32_t *)0x1FFF0D90UL)

/* Flash timing parameters (at 0x1FFF0F6C) */
#define FLASH_TIMING_BASE   0x1FFF0F6CUL

/* ============================================================================
 * Bootloader Constants
 * ============================================================================ */
#define ACK_BYTE            0x79U   /* Acknowledge byte */
#define NACK_BYTE           0x1FU   /* Not-acknowledge byte */
#define VERSION             0x10U   /* Bootloader version 1.0 */

/* ISP Command codes */
#define CMD_GET_COMMAND         0x00U
#define CMD_GET_VERSION         0x01U
#define CMD_GET_ID              0x02U
#define CMD_GET_DEVICE_IDCODE   0x03U
#define CMD_READ_MEMORY         0x11U
#define CMD_GO                  0x21U
#define CMD_WRITE_MEMORY        0x31U
#define CMD_EXT_ERASE_MEMORY    0x44U
#define CMD_WRITE_PROTECT       0x63U
#define CMD_WRITE_UNPROTECT     0x73U
#define CMD_READ_PROTECT        0x82U
#define CMD_READ_UNPROTECT      0x92U

/* Memory area types */
#define AREA_ERROR      0x00U
#define FLASH_AREA      0x01U
#define RAM_AREA        0x02U
#define OB_AREA         0x03U
#define OTP_AREA        0x04U
#define SYS_AREA        0x05U

/* Flash keys */
#define FLASH_KEY1      0x45670123UL
#define FLASH_KEY2      0xCDEF89ABUL
#define FLASH_OPTKEY1   0x08192A3BUL
#define FLASH_OPTKEY2   0x4C5D6E7FUL

/* USART status register bits */
#define USART_SR_RXNE   (1U << 5)   /* Read data register not empty */
#define USART_SR_TC     (1U << 6)   /* Transmission complete */
#define USART_SR_TXE    (1U << 7)   /* Transmit data register empty */
#define USART_SR_ABRF   (1U << 10)  /* Auto baud rate flag */
#define USART_SR_ABRE   (1U << 11)  /* Auto baud rate error */
#define USART_SR_ABRRQ  (1U << 12)  /* Auto baud rate request */

/* USART CR1 bits */
#define USART_CR1_RE    (1U << 2)   /* Receiver enable */
#define USART_CR1_TE    (1U << 3)   /* Transmitter enable */
#define USART_CR1_PCE   (1U << 10)  /* Parity control enable */
#define USART_CR1_M     (1U << 12)  /* Word length (9-bit) */
#define USART_CR1_UE    (1U << 13)  /* USART enable */

/* USART CR3 bits */
#define USART_CR3_ABREN     (1U << 20)  /* Auto baud rate enable */
#define USART_CR3_ABRMODE   (3U << 21)  /* Auto baud rate mode */

/* RCC bits */
#define RCC_CR_HSION    (1U << 8)   /* HSI oscillator enable */
#define RCC_CR_HSIRDY   (1U << 10)  /* HSI oscillator ready */
#define RCC_IOPENR_GPIOAEN (1U << 0) /* GPIOA clock enable */
#define RCC_APBENR2_USART1EN (1U << 14) /* USART1 clock enable */

/* FLASH bits */
#define FLASH_SR_BSY    (1U << 0)   /* Busy */
#define FLASH_CR_LOCK   (1U << 31)  /* Lock */
#define FLASH_CR_PG     (1U << 0)   /* Programming */
#define FLASH_CR_PER    (1U << 1)   /* Page erase */
#define FLASH_CR_MER    (1U << 2)   /* Mass erase */
#define FLASH_CR_STRT   (1U << 6)   /* Start */
#define FLASH_CR_OPTSTRT (1U << 17) /* Option bytes modification start */
#define FLASH_OPTR_RDP  (0xFFU)     /* Read protection level */
#define FLASH_OPTR_RDP_LEVEL_0 0xAAU /* No read protection */
#define FLASH_OPTR_RDP_LEVEL_1 0xBBU /* Read protection level 1 */

/* ============================================================================
 * Data Buffer (in RAM)
 * ============================================================================ */
static uint8_t gDataBuffer[0x180];  /* 384-byte data buffer at 0x20000024 */

/* ============================================================================
 * Function Prototypes
 * ============================================================================ */
typedef void (*FunctionPointer)(void);

static void     WDG_Init(void);
static void     WDG_Refresh(void);
static uint8_t  USART_ReadByte(void);
static void     USART_SendByte(uint8_t byte);
static void     Bootloader_Init(void);
static void     Bootloader_ProtocolDetection(void);
static uint8_t  GetAddressArea(uint32_t *pAddr);
static int      ReadMemory(void);
static int      Go(void);
static int      WriteMemory(void);
static int      ExtendedErase(void);
static int      WriteProtect(void);
static int      WriteUnprotect(void);
static int      ReadProtect(void);
static int      ReadUnprotect(void);
static int      WriteFlash(uint32_t addr, const uint8_t *data, uint32_t len);
static int      WriteOption(uint32_t addr, const uint8_t *data, uint32_t len);
static int      MassErase(void);
static int      PageErase(uint32_t addr, uint32_t count);
static void     JumpToAddress(uint32_t addr);
static void     SystemClockConfig(void);

/* ============================================================================
 * Startup / Reset Handler (at 0x1FFF00D4)
 * ============================================================================ */

/**
 * @brief  Reset Handler - Entry point of the ROM bootloader
 *         Called from vector table at 0x1FFF0004
 *         Sets up stack and calls main bootloader function
 */
void Reset_Handler(void) {
    /* Stack pointer is set from vector table (0x20000200) */
    /* Call the main bootloader initialization */
    Bootloader_Init();
    /* Jump to main bootloader loop */
    /* (function_1fff0c70 = main bootloader loop) */
    while (1) {
        Bootloader_ProtocolDetection();
    }
}

/* Infinite loop handlers for exceptions */
void NMI_Handler(void)      { while(1); }
void HardFault_Handler(void){ while(1); }
void SVC_Handler(void)      { while(1); }
void PendSV_Handler(void)   { while(1); }
void SysTick_Handler(void)  { while(1); }
void Default_Handler(void)  { while(1); }

/* ============================================================================
 * Watchdog Functions (at 0x1FFF08E8 and 0x1FFF0910)
 * ============================================================================ */

/**
 * @brief  Initialize the Independent Watchdog (IWDG)
 *         Configured with ~2 second timeout
 */
static void WDG_Init(void) {
    IWDG_KR = 0x5555;  /* Enable write access to IWDG_PR and IWDG_RLR */
    IWDG_PR = 0x06;    /* Prescaler /256 */
    IWDG_RLR = 0xFFF;  /* Reload value = 4095 (~2s at 40kHz/256) */
    IWDG_KR = 0xAAAA;  /* Reload IWDG counter */
    IWDG_KR = 0xCCCC;  /* Start IWDG */
}

/**
 * @brief  Refresh/reload the watchdog timer
 */
static void WDG_Refresh(void) {
    IWDG_KR = 0xAAAA;  /* Reload IWDG counter */
}

/* ============================================================================
 * USART Functions (at 0x1FFF08B8 and 0x1FFF08D4)
 * ============================================================================ */

/**
 * @brief  Read a byte from USART1 (blocking)
 * @return Received byte (8-bit data, parity stripped)
 */
static uint8_t USART_ReadByte(void) {
    /* Wait for RXNE (Receive data register not empty) */
    while (!(USART1_SR & USART_SR_RXNE));
    /* Return data (mask to 8 bits, parity bit is bit 8) */
    return (uint8_t)(USART1_DR & 0xFF);
}

/**
 * @brief  Send a byte via USART1 (blocking)
 * @param  byte: Byte to send
 */
static void USART_SendByte(uint8_t byte) {
    /* Wait for TXE (Transmit data register empty) */
    while (!(USART1_SR & USART_SR_TXE));
    USART1_DR = byte;
}

/* ============================================================================
 * Bootloader Initialization (at 0x1FFF0114)
 * ============================================================================ */

/**
 * @brief  Initialize the bootloader
 *
 * This function:
 * 1. Initializes the watchdog
 * 2. Enables GPIOA clock
 * 3. Configures PA3, PA10, PA15 as inputs with pull-up (if available)
 * 4. Waits for a falling edge on one of the RX pins (start bit detection)
 * 5. Configures the detected USART pin pair as alternate function
 * 6. Initializes USART1 with auto baud rate detection
 * 7. Sends ACK when baud rate is detected
 */
static void Bootloader_Init(void) {
    WDG_Init();

    /* Enable GPIOA clock */
    RCC_IOPENR |= RCC_IOPENR_GPIOAEN;

    /* Set PA3, PA10, PA15 as input (clear mode bits) */
    GPIOA_MODER &= ~((3U << (3*2)) | (3U << (10*2)) | (3U << (15*2)));

    /* Read chip configuration to check which pins are available */
    uint32_t paConfig = ROM_CONFIG_PA_PINS;

    /* If PA3 is not bonded out, add pull-up */
    if (!(paConfig & (1U << 3))) {
        GPIOA_PUPDR |= (1U << (3*2));   /* Pull-up on PA3 */
    }
    /* If PA10 is not bonded out, add pull-up */
    if (!(paConfig & (1U << 10))) {
        GPIOA_PUPDR |= (1U << (10*2));  /* Pull-up on PA10 */
    }
    /* If PA15 is not bonded out, add pull-up */
    if (!(paConfig & (1U << 15))) {
        GPIOA_PUPDR |= (1U << (15*2));  /* Pull-up on PA15 */
    }

    /* Read initial pin states */
    uint32_t pa3_prev  = GPIOA_IDR & (1U << 3);
    uint32_t pa10_prev = GPIOA_IDR & (1U << 10);
    uint32_t pa15_prev = GPIOA_IDR & (1U << 15);

    /* Wait for falling edge on any RX pin (start bit of 0x7F sync byte) */
    while (1) {
        WDG_Refresh();

        uint32_t pa3_curr  = GPIOA_IDR & (1U << 3);
        uint32_t pa10_curr = GPIOA_IDR & (1U << 10);
        uint32_t pa15_curr = GPIOA_IDR & (1U << 15);

        /* Falling edge on PA3 -> use USART1 TX=PA2, RX=PA3 */
        if (pa3_prev && !pa3_curr) {
            /* Set all GPIOA to analog (Hi-Z) except PA2/PA3 */
            GPIOA_MODER = 0xEBFFFFFF;
            /* PA2 and PA3 as alternate function (AF1 = USART1) */
            GPIOA_MODER &= ~((1U << (2*2)) | (1U << (3*2)));  /* Clear bit 0 of mode */
            GPIOA_AFRL |= (1U << (2*4)) | (1U << (3*4));       /* AF1 for PA2, PA3 */
            break;
        }

        /* Falling edge on PA10 -> use USART1 TX=PA9, RX=PA10 */
        if (pa10_prev && !pa10_curr) {
            GPIOA_MODER = 0xEBFFFFFF;
            GPIOA_MODER &= ~((1U << (9*2)) | (1U << (10*2)));
            GPIOA_AFRH |= (1U << ((9-8)*4)) | (1U << ((10-8)*4));  /* AF1 for PA9, PA10 */
            break;
        }

        /* Falling edge on PA15 -> use USART1 TX=PA14, RX=PA15 */
        if (pa15_prev && !pa15_curr) {
            GPIOA_MODER = 0xEBFFFFFF;
            GPIOA_MODER &= ~((1U << (14*2)) | (1U << (15*2)));
            GPIOA_AFRH |= (1U << ((14-8)*4)) | (1U << ((15-8)*4)); /* AF1 for PA14, PA15 */
            break;
        }

        pa3_prev  = pa3_curr;
        pa10_prev = pa10_curr;
        pa15_prev = pa15_curr;
    }

    /* Enable USART1 clock */
    RCC_APBENR2 |= RCC_APBENR2_USART1EN;

    /* Configure USART1:
     * - 9-bit word length (M=1)
     * - Even parity (PCE=1, PS=0)
     * - 1 stop bit
     * - Auto baud rate from start bit
     */
    USART1_CR1 |= USART_CR1_M | USART_CR1_PCE;

    /* Set default baud rate (115200 at 24MHz) */
    USART1_BRR = (24000000 + 115200/2) / 115200;  /* = 208 */

    /* Enable auto baud rate detection (mode 0: from start bit) */
    USART1_CR3 = (USART1_CR3 & ~USART_CR3_ABRMODE) | USART_CR3_ABREN;

    /* Enable USART */
    USART1_CR1 |= USART_CR1_UE;

    /* Wait for auto baud rate detection to complete */
    while (!(USART1_SR & USART_SR_ABRF));

    /* Check for auto baud rate error */
    if (USART1_SR & USART_SR_ABRE) {
        /* Reset on error */
        SCB_AIRCR = 0x05FA0004;
        while(1);
    }

    /* Disable interrupts */
    __asm volatile("cpsid i");

    /* Clear auto baud rate request and disable ABR */
    USART1_SR |= USART_SR_ABRRQ;
    USART1_CR3 &= ~USART_CR3_ABREN;

    /* Clear RXNE and TC flags */
    USART1_SR &= ~(USART_SR_RXNE | USART_SR_TC);

    /* Enable transmitter and receiver */
    USART1_CR1 |= USART_CR1_TE | USART_CR1_RE;

    /* Send ACK to indicate bootloader is ready */
    USART_SendByte(ACK_BYTE);
}

/* ============================================================================
 * Protocol Detection / Command Handler (at 0x1FFF029C)
 * ============================================================================ */

/**
 * @brief  Main bootloader protocol handler
 *
 * Receives and processes ISP commands in a loop.
 * Each command consists of:
 *   1. Command byte
 *   2. Complement byte (XOR with 0xFF)
 * If valid, sends ACK and executes the command.
 */
static void Bootloader_ProtocolDetection(void) {
    uint8_t cmd = USART_ReadByte();
    uint8_t cmdComplement = USART_ReadByte();

    /* Verify command integrity: cmd XOR complement must equal 0xFF */
    if ((cmd ^ cmdComplement) != 0xFF) {
        USART_SendByte(NACK_BYTE);
        return;
    }

    /* Check if flash is not read-protected for flash-modifying commands */
    switch (cmd) {
        case CMD_WRITE_MEMORY:
        case CMD_EXT_ERASE_MEMORY:
        case CMD_WRITE_PROTECT:
        case CMD_WRITE_UNPROTECT:
        case CMD_READ_PROTECT:
        case CMD_READ_UNPROTECT:
            /* Check RDP level - must be level 0 (no protection) */
            if ((FLASH_OPTR & FLASH_OPTR_RDP) != FLASH_OPTR_RDP_LEVEL_0) {
                USART_SendByte(NACK_BYTE);
                return;
            }
            break;
        default:
            break;
    }

    /* Send ACK for valid command */
    USART_SendByte(ACK_BYTE);

    /* Unlock flash for write/erase operations */
    switch (cmd) {
        case CMD_WRITE_MEMORY:
        case CMD_EXT_ERASE_MEMORY:
        case CMD_WRITE_PROTECT:
        case CMD_WRITE_UNPROTECT:
        case CMD_READ_PROTECT:
        case CMD_READ_UNPROTECT:
            if (FLASH_SR & FLASH_SR_BSY) {
                USART_SendByte(NACK_BYTE);
                return;
            }
            if (FLASH_CR & FLASH_CR_LOCK) {
                FLASH_KEYR = FLASH_KEY1;
                FLASH_KEYR = FLASH_KEY2;
                /* Configure flash timing parameters from ROM */
                /* (timing values stored at 0x1FFF0F6C) */
            }
            break;
        default:
            break;
    }

    /* Execute command */
    int result = 0;
    switch (cmd) {
        case CMD_GET_COMMAND:
            /* Return list of supported commands */
            {
                const uint8_t cmds[] = {
                    CMD_GET_COMMAND, CMD_GET_VERSION, CMD_GET_ID,
                    CMD_GET_DEVICE_IDCODE,
                    CMD_READ_MEMORY, CMD_GO, CMD_WRITE_MEMORY,
                    CMD_EXT_ERASE_MEMORY, CMD_WRITE_PROTECT,
                    CMD_WRITE_UNPROTECT, CMD_READ_PROTECT, CMD_READ_UNPROTECT
                };
                USART_SendByte(sizeof(cmds));
                USART_SendByte(VERSION);
                for (int i = 0; i < (int)sizeof(cmds); i++) {
                    USART_SendByte(cmds[i]);
                }
            }
            result = 1;
            break;

        case CMD_GET_VERSION:
            /* Return bootloader version */
            USART_SendByte(VERSION);
            USART_SendByte(0x00);
            USART_SendByte(0x00);
            result = 1;
            break;

        case CMD_GET_ID:
            /* Return ST-compatible chip ID (0x0440 for PY32F030) */
            USART_SendByte(0x01);  /* N-1 bytes to follow */
            USART_SendByte(0x04);  /* ID high byte */
            USART_SendByte(0x40);  /* ID low byte */
            result = 1;
            break;

        case CMD_GET_DEVICE_IDCODE:
            /* Return actual PUYA device IDCODE from DBGMCU */
            {
                uint32_t idcode = DBGMCU_IDCODE;
                USART_SendByte(0x01);
                USART_SendByte((idcode >> 8) & 0xFF);
                USART_SendByte(idcode & 0xFF);
            }
            result = 1;
            break;

        case CMD_READ_MEMORY:
            result = ReadMemory();
            break;

        case CMD_GO:
            result = Go();
            break;

        case CMD_WRITE_MEMORY:
            result = WriteMemory();
            break;

        case CMD_EXT_ERASE_MEMORY:
            result = ExtendedErase();
            break;

        case CMD_WRITE_PROTECT:
            result = WriteProtect();
            break;

        case CMD_WRITE_UNPROTECT:
            result = WriteUnprotect();
            break;

        case CMD_READ_PROTECT:
            result = ReadProtect();
            break;

        case CMD_READ_UNPROTECT:
            result = ReadUnprotect();
            break;

        default:
            result = 0;
            break;
    }

    /* Lock flash after write/erase operations */
    switch (cmd) {
        case CMD_WRITE_MEMORY:
        case CMD_EXT_ERASE_MEMORY:
        case CMD_WRITE_PROTECT:
        case CMD_WRITE_UNPROTECT:
        case CMD_READ_PROTECT:
        case CMD_READ_UNPROTECT:
            FLASH_CR |= FLASH_CR_LOCK;
            break;
        default:
            break;
    }

    USART_SendByte(result ? ACK_BYTE : NACK_BYTE);
}

/* ============================================================================
 * Address Area Detection (at 0x1FFF0528)
 * ============================================================================ */

/**
 * @brief  Read address from USART and determine memory area type
 * @param  pAddr: Pointer to store the received address
 * @return Memory area type (FLASH_AREA, RAM_AREA, OB_AREA, SYS_AREA, AREA_ERROR)
 */
static uint8_t GetAddressArea(uint32_t *pAddr) {
    /* Read 4-byte address (big-endian) + XOR checksum */
    gDataBuffer[0] = USART_ReadByte();
    gDataBuffer[1] = USART_ReadByte();
    gDataBuffer[2] = USART_ReadByte();
    gDataBuffer[3] = USART_ReadByte();
    uint8_t checksum = USART_ReadByte();

    /* Verify checksum */
    uint8_t xorVal = gDataBuffer[0] ^ gDataBuffer[1] ^ gDataBuffer[2] ^ gDataBuffer[3];
    if (checksum != xorVal) {
        return AREA_ERROR;
    }

    USART_SendByte(ACK_BYTE);

    /* Reconstruct address (big-endian) */
    uint32_t addr = ((uint32_t)gDataBuffer[0] << 24) |
                    ((uint32_t)gDataBuffer[1] << 16) |
                    ((uint32_t)gDataBuffer[2] << 8)  |
                    ((uint32_t)gDataBuffer[3]);
    *pAddr = addr;

    /* Map ST-compatible addresses to PUYA addresses */
    /* STM32F0 flash size register -> return OB area */
    if (addr == 0x1FFFF7E8 || addr == 0x1FFFF7CC) {
        return OB_AREA;
    }
    /* STM32F1 flash size register */
    if (addr == 0x1FFFF7E0) {
        return OB_AREA;
    }
    /* ST UID base -> map to PUYA UID */
    if (addr == 0x1FFFF7A6) {
        *pAddr = 0x1FFF0E00;  /* PUYA UID base */
        return FLASH_AREA;
    }
    /* ST option bytes base -> map to PUYA option bytes */
    if (addr == 0x1FFFF800) {
        *pAddr = 0x1FFF0E80;  /* PUYA option bytes */
        return OB_AREA;
    }

    /* Check flash area: 0x08000000 - 0x08009FFF (up to 40KB) */
    if (addr >= 0x08000000 && addr < 0x0800A000) {
        return FLASH_AREA;
    }

    /* Check RAM area: 0x20000200 - 0x20001FFF */
    if (addr >= 0x20000200 && addr < 0x20002000) {
        return RAM_AREA;
    }

    /* Check system memory (ROM bootloader): 0x1FFF0000 - 0x1FFF0DFF */
    if (addr >= 0x1FFF0000 && addr < 0x1FFF0E00) {
        return SYS_AREA;
    }

    /* Check option bytes area: 0x1FFF0E00 - 0x1FFF0FFF */
    if (addr >= 0x1FFF0E00 && addr < 0x1FFF1000) {
        return OB_AREA;
    }

    return AREA_ERROR;
}

/* ============================================================================
 * Read Memory Command (at 0x1FFF0628)
 * ============================================================================ */

/**
 * @brief  Read memory command handler
 *
 * Protocol:
 *   Host sends: address (4 bytes) + XOR checksum
 *   Host sends: N-1 (1 byte) + XOR checksum
 *   Device sends: ACK + N bytes of data
 */
static int ReadMemory(void) {
    uint32_t addr;
    uint8_t area = GetAddressArea(&addr);

    if (area == AREA_ERROR) {
        return 0;
    }

    /* Read number of bytes to read (N-1) */
    uint8_t nMinus1 = USART_ReadByte();
    uint8_t checksum = USART_ReadByte();

    if ((nMinus1 ^ checksum) != 0xFF) {
        return 0;
    }

    USART_SendByte(ACK_BYTE);

    /* Handle special flash size register reads */
    if (addr == 0x1FFFF7E8 || addr == 0x1FFFF7CC || addr == 0x1FFFF7E0) {
        /* Return flash/RAM size info */
        uint8_t flashSizeReg = *(volatile uint8_t *)0x1FFF0E00;
        uint8_t flashSizeKB = (((flashSizeReg & 0x07) >> 0) + 1) * 8;
        uint8_t ramSizeKB   = (((flashSizeReg & 0x30) >> 4) + 1) * 2;
        gDataBuffer[1] = flashSizeKB;
        gDataBuffer[2] = 0x00;
        gDataBuffer[3] = ramSizeKB;
        gDataBuffer[4] = 0x00;
        for (int i = 0; i <= nMinus1; i++) {
            USART_SendByte(gDataBuffer[i + 1]);
        }
        return 1;
    }

    /* If flash is read-protected, return zeros for flash area */
    if (area == FLASH_AREA && (FLASH_OPTR & FLASH_OPTR_RDP) != FLASH_OPTR_RDP_LEVEL_0) {
        for (int i = 0; i <= nMinus1; i++) {
            USART_SendByte(0x00);
        }
        return 1;
    }

    /* Read and send memory bytes */
    for (int i = 0; i <= nMinus1; i++) {
        USART_SendByte(*(volatile uint8_t *)(addr + i));
    }

    return 1;
}

/* ============================================================================
 * Go Command (at 0x1FFF0640)
 * ============================================================================ */

/**
 * @brief  Jump to application command handler
 *
 * Protocol:
 *   Host sends: address (4 bytes) + XOR checksum
 *   Device sends: ACK, then jumps to address
 */
static int Go(void) {
    uint32_t addr;
    uint8_t area = GetAddressArea(&addr);

    if (area != FLASH_AREA && area != RAM_AREA) {
        return 0;
    }

    JumpToAddress(addr);
    return 1;  /* Never reached if jump succeeds */
}

/**
 * @brief  Jump to the specified address
 * @param  addr: Address to jump to (must point to valid vector table)
 */
static void JumpToAddress(uint32_t addr) {
    /* Verify the stack pointer value is in SRAM range */
    uint32_t sp = *(volatile uint32_t *)addr;
    if ((sp & 0x2FFE0000) != 0x20000000) {
        return;  /* Invalid stack pointer */
    }

    /* Enable interrupts */
    __asm volatile("cpsie i");

    /* Set main stack pointer */
    __asm volatile("MSR msp, %0" : : "r" (sp));

    /* Get reset handler address and jump */
    FunctionPointer jumpToApp = (FunctionPointer)(*(volatile uint32_t *)(addr + 4));
    jumpToApp();
}

/* ============================================================================
 * Write Memory Command (at 0x1FFF06A2)
 * ============================================================================ */

/**
 * @brief  Write memory command handler
 *
 * Protocol:
 *   Host sends: address (4 bytes) + XOR checksum
 *   Host sends: N-1 (1 byte) + N bytes of data + XOR checksum
 *   Device sends: ACK
 */
static int WriteMemory(void) {
    uint32_t addr;
    uint8_t area = GetAddressArea(&addr);

    if (area != FLASH_AREA && area != RAM_AREA && area != OB_AREA) {
        return 0;
    }

    /* Read number of bytes (N-1) */
    uint8_t nMinus1 = USART_ReadByte();

    /* Read data bytes */
    for (int i = 0; i <= nMinus1; i++) {
        gDataBuffer[i] = USART_ReadByte();
    }

    /* Read and verify checksum */
    uint8_t checksum = USART_ReadByte();
    uint8_t xorVal = nMinus1;
    for (int i = 0; i <= nMinus1; i++) {
        xorVal ^= gDataBuffer[i];
    }
    if (checksum != xorVal) {
        return 0;
    }

    /* Write to appropriate memory area */
    if (area == RAM_AREA) {
        /* Direct write to RAM */
        for (int i = 0; i <= nMinus1; i++) {
            *(volatile uint8_t *)(addr + i) = gDataBuffer[i];
        }
        return 1;
    } else if (area == OB_AREA) {
        return WriteOption(addr, gDataBuffer, nMinus1);
    } else {
        return WriteFlash(addr, gDataBuffer, nMinus1);
    }
}

/* ============================================================================
 * Extended Erase Command (at 0x1FFF06BC)
 * ============================================================================ */

/**
 * @brief  Extended erase command handler
 *
 * Protocol:
 *   Host sends: subcommand (2 bytes) + XOR checksum
 *   For page erase: + page numbers (2 bytes each) + XOR checksum
 *   Device sends: ACK
 *
 * Subcommands:
 *   0xFFFF - Mass erase
 *   0x0000 - Page erase (followed by page numbers)
 *   0x0020 - Sector erase
 */
static int ExtendedErase(void) {
    uint8_t subcmdHigh = USART_ReadByte();
    uint8_t subcmdLow  = USART_ReadByte();
    uint8_t checksum   = USART_ReadByte();

    if ((subcmdHigh ^ subcmdLow ^ checksum) != 0xFF) {
        return 0;
    }

    /* Mass erase */
    if (subcmdHigh == 0xFF) {
        return MassErase();
    }

    /* Page/sector erase */
    uint16_t numPages = subcmdLow;
    uint32_t dataLen = (numPages + 1) * 2;

    /* Read page numbers */
    for (uint32_t i = 0; i < dataLen; i++) {
        gDataBuffer[i] = USART_ReadByte();
    }

    /* Read and verify checksum */
    uint8_t rxChecksum = USART_ReadByte();
    uint8_t xorVal = subcmdHigh ^ subcmdLow;
    for (uint32_t i = 0; i < dataLen; i++) {
        xorVal ^= gDataBuffer[i];
    }
    if (rxChecksum != xorVal) {
        return 0;
    }

    /* Swap bytes in page number pairs (big-endian to little-endian) */
    for (uint32_t i = 0; i <= numPages; i++) {
        uint8_t tmp = gDataBuffer[i*2];
        gDataBuffer[i*2] = gDataBuffer[i*2 + 1];
        gDataBuffer[i*2 + 1] = tmp;
    }

    if (subcmdHigh == 0x00) {
        return PageErase((uint32_t)gDataBuffer, numPages + 1);
    } else {
        /* Sector erase */
        return PageErase((uint32_t)gDataBuffer, numPages + 1);
    }
}

/* ============================================================================
 * Write Protect Command (at 0x1FFF0718)
 * ============================================================================ */

/**
 * @brief  Write protect command handler
 *
 * Enables write protection on specified flash sectors
 */
static int WriteProtect(void) {
    uint8_t nMinus1 = USART_ReadByte();

    for (int i = 0; i <= nMinus1; i++) {
        gDataBuffer[i] = USART_ReadByte();
    }

    uint8_t checksum = USART_ReadByte();
    uint8_t xorVal = nMinus1;
    for (int i = 0; i <= nMinus1; i++) {
        xorVal ^= gDataBuffer[i];
    }
    if (checksum != xorVal) {
        return 0;
    }

    /* Build write protection mask */
    uint16_t wrpMask = 0xFFFF;
    for (int i = 0; i <= nMinus1; i++) {
        uint8_t sector = gDataBuffer[i];
        wrpMask &= ~(1U << sector);
    }

    /* Write to WRPR option byte */
    *(uint16_t *)gDataBuffer = wrpMask;
    return WriteOption(0x1FFF0E8C, gDataBuffer, 1);
}

/* ============================================================================
 * Write Unprotect Command
 * ============================================================================ */

/**
 * @brief  Remove write protection from all flash sectors
 */
static int WriteUnprotect(void) {
    /* Read current SDKR and WRPR values */
    uint32_t sdkr = *(volatile uint32_t *)0x1FFF0E88;
    uint32_t wrpr = *(volatile uint32_t *)0x1FFF0E8C;

    gDataBuffer[0] = (sdkr >> 0) & 0xFF;
    gDataBuffer[1] = (sdkr >> 8) & 0xFF;
    gDataBuffer[4] = (wrpr >> 0) & 0xFF;
    gDataBuffer[5] = (wrpr >> 8) & 0xFF;

    return WriteOption(0x1FFF0E88, gDataBuffer, 7);
}

/* ============================================================================
 * Read Protect Command
 * ============================================================================ */

/**
 * @brief  Enable read protection (RDP level 1)
 */
static int ReadProtect(void) {
    gDataBuffer[0] = FLASH_OPTR_RDP_LEVEL_1;
    return WriteOption(0x1FFF0E80, gDataBuffer, 0);
}

/* ============================================================================
 * Read Unprotect Command
 * ============================================================================ */

/**
 * @brief  Remove read protection (mass erase + reset RDP to level 0)
 */
static int ReadUnprotect(void) {
    uint32_t optr = *(volatile uint32_t *)0x1FFF0E80;
    uint32_t sdkr = *(volatile uint32_t *)0x1FFF0E88;

    gDataBuffer[0] = (optr >> 0) & 0xFF;
    gDataBuffer[1] = (optr >> 8) & 0xFF;
    gDataBuffer[4] = (sdkr >> 0) & 0xFF;
    gDataBuffer[5] = (sdkr >> 8) & 0xFF;

    return WriteOption(0x1FFF0E80, gDataBuffer, 7);
}

/* ============================================================================
 * Flash Write Functions (at 0x1FFF07B4 and 0x1FFF084C)
 * ============================================================================ */

/**
 * @brief  Write data to flash memory
 * @param  addr: Target flash address (must be 4-byte aligned)
 * @param  data: Pointer to data buffer
 * @param  len: Number of bytes to write (N-1)
 * @return 1 on success, 0 on failure
 */
static int WriteFlash(uint32_t addr, const uint8_t *data, uint32_t len) {
    /* Wait for flash to be ready */
    while (FLASH_SR & FLASH_SR_BSY);

    /* Enable programming */
    FLASH_CR |= FLASH_CR_PG;

    /* Write data word by word (32-bit) */
    for (uint32_t i = 0; i <= len; i += 4) {
        uint32_t word = ((uint32_t)data[i+3] << 24) |
                        ((uint32_t)data[i+2] << 16) |
                        ((uint32_t)data[i+1] << 8)  |
                        ((uint32_t)data[i+0]);
        *(volatile uint32_t *)(addr + i) = word;

        /* Wait for programming to complete */
        while (FLASH_SR & FLASH_SR_BSY);

        /* Check for errors */
        if (FLASH_SR & 0xC2) {  /* WRPERR, PGAERR, PROGERR */
            FLASH_CR &= ~FLASH_CR_PG;
            return 0;
        }
    }

    FLASH_CR &= ~FLASH_CR_PG;
    return 1;
}

/**
 * @brief  Write option bytes
 * @param  addr: Option byte address
 * @param  data: Pointer to data buffer
 * @param  len: Number of bytes
 * @return 1 on success, 0 on failure
 */
static int WriteOption(uint32_t addr, const uint8_t *data, uint32_t len) {
    /* Unlock option bytes */
    FLASH_OPTKEYR = FLASH_OPTKEY1;
    FLASH_OPTKEYR = FLASH_OPTKEY2;

    /* Wait for flash to be ready */
    while (FLASH_SR & FLASH_SR_BSY);

    /* Write option bytes */
    for (uint32_t i = 0; i <= len; i++) {
        *(volatile uint8_t *)(addr + i) = data[i];
    }

    /* Start option bytes programming */
    FLASH_CR |= FLASH_CR_OPTSTRT;

    /* Wait for completion */
    while (FLASH_SR & FLASH_SR_BSY);

    /* Lock option bytes */
    FLASH_CR &= ~(1U << 9);  /* Clear OPTLOCK */

    /* System reset to apply new option bytes */
    SCB_AIRCR = 0x05FA0004;
    while(1);

    return 1;
}

/**
 * @brief  Mass erase all flash pages
 * @return 1 on success, 0 on failure
 */
static int MassErase(void) {
    /* Wait for flash to be ready */
    while (FLASH_SR & FLASH_SR_BSY);

    /* Start mass erase */
    FLASH_CR |= FLASH_CR_MER;
    FLASH_CR |= FLASH_CR_STRT;

    /* Wait for completion */
    while (FLASH_SR & FLASH_SR_BSY);

    /* Check for errors */
    if (FLASH_SR & 0xC2) {
        FLASH_CR &= ~FLASH_CR_MER;
        return 0;
    }

    FLASH_CR &= ~FLASH_CR_MER;
    return 1;
}

/**
 * @brief  Erase specified flash pages
 * @param  pages: Pointer to array of page numbers
 * @param  count: Number of pages to erase
 * @return 1 on success, 0 on failure
 */
static int PageErase(uint32_t pages, uint32_t count) {
    uint16_t *pageNums = (uint16_t *)pages;

    for (uint32_t i = 0; i < count; i++) {
        /* Calculate page address */
        uint32_t pageAddr = 0x08000000 + (uint32_t)pageNums[i] * 0x200;  /* 512-byte pages */

        /* Wait for flash to be ready */
        while (FLASH_SR & FLASH_SR_BSY);

        /* Set page address and start erase */
        FLASH_CR |= FLASH_CR_PER;
        *(volatile uint32_t *)0x40022028 = pageAddr;  /* FLASH_AR */
        FLASH_CR |= FLASH_CR_STRT;

        /* Wait for completion */
        while (FLASH_SR & FLASH_SR_BSY);

        /* Check for errors */
        if (FLASH_SR & 0xC2) {
            FLASH_CR &= ~FLASH_CR_PER;
            return 0;
        }

        FLASH_CR &= ~FLASH_CR_PER;
    }

    return 1;
}

/* ============================================================================
 * Main Entry Point
 * ============================================================================ */

/**
 * @brief  Main function - called from Reset_Handler
 *
 * The ROM bootloader does not have a traditional main() function.
 * The Reset_Handler directly calls Bootloader_Init() and then
 * enters the main protocol detection loop.
 *
 * This is provided for reference/documentation purposes.
 */
int main(void) {
    /* Initialize bootloader (USART, GPIO, auto-baud detection) */
    Bootloader_Init();

    /* Main command processing loop */
    while (1) {
        Bootloader_ProtocolDetection();
    }

    return 0;  /* Never reached */
}
