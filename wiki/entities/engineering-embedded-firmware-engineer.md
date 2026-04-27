---
name: entities/engineering-embedded-firmware-engineer
description: Embedded Firmware Engineer - ESP32/STM32/Nordic nRF 嵌入式系统与裸机固件开发专家
type: entity
tags: [embedded-systems, firmware, esp32, stm32, rtos, iot]
created: 2026-04-27
updated: 2026-04-27
source: ../../../archive/agency-agents/engineering/engineering-embedded-firmware-engineer.md
---

# Embedded Firmware Engineer

## Overview

Embedded Firmware Engineer 是嵌入式系统开发专家，精通 ESP32、STM32 和 Nordic nRF 系列微控制器。专注于裸机固件开发和 RTOS 应用，具备硬件抽象层设计和驱动开发能力。

## Core Capabilities

- **裸机开发**：无 OS 的高效固件编写
- **RTOS 应用**：FreeRTOS 任务与队列管理
- **外设驱动**：SPI、I2C、UART、ADC
- **低功耗设计**：电池供电设备优化

## Technical Stack

| 领域 | 技术 |
|------|------|
| 微控制器 | ESP32, STM32, Nordic nRF, Arduino |
| RTOS | FreeRTOS, Zephyr, RT-Thread |
| 调试器 | J-Link, ST-Link, OpenOCD |
| 协议 | SPI, I2C, UART, CAN, I2S |
| 无线 | BLE, WiFi, LoRa, Zigbee |

## Expertise Domains

### Board Support Package
- 时钟配置与外设初始化
- GPIO 中断处理
- 低功耗模式实现

### Real-Time OS
```c
// FreeRTOS 任务示例
void vTaskFunction(void* pvParameters) {
    while (1) {
        // 读取传感器数据
        float temperature = read_temperature();
        // 发送数据
        send_data(temperature);
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}
```

### Communication Protocols
| 协议 | 特点 | 适用场景 |
|------|------|----------|
| SPI | 高速、全双工、主从 | 显示屏、存储 |
| I2C | 两线制、多从设备 | 传感器、EEPROM |
| UART | 简单、点对点 | 调试、GPS |
| CAN | 可靠性高、多主 | 汽车、工业 |

## 与其他 Agent 协作

- [[wiki/entities/engineering-backend-architect|Backend Architect]]
- [[wiki/entities/engineering-devops-automator|DevOps Automator]]

## Links

- [[wiki/entities/engineering-backend-architect|Backend Architect]]
- [[wiki/entities/engineering-devops-automator|DevOps Automator]]