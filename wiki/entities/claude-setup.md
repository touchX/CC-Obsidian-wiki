---
name: entities/claude-setup
description: Claude Code 系统要求、安装和高级设置
type: entity
tags: [setup, installation, requirements, platform]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/高级设置.md
---

# Claude Code 高级设置

系统要求、特定平台安装、版本管理和卸载。

## 系统要求

| 要求 | 说明 |
| --- | --- |
| 操作系统 | macOS, Linux, Windows (原生/WSL) |
| 硬件 | 4 GB+ RAM, x64 或 ARM64 |
| 网络 | 需要互联网连接 |
| Shell | Bash, Zsh, PowerShell, CMD |

## 安装方法

### macOS/Linux/WSL

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

### Windows PowerShell

```powershell
irm https://claude.ai/install.ps1 | iex
```

### Windows CMD

```bat
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd
```

## Windows 设置选项

| 选项 | 需要 | 沙箱 | 何时使用 |
| --- | --- | --- | --- |
| 原生 Windows | Git for Windows | 不支持 | Windows 原生项目 |
| WSL 2 | WSL 2 | 支持 | Linux 工具链 |
| WSL 1 | WSL 1 | 不支持 | WSL 2 不可用时 |

## 自动更新

原生安装会在后台自动更新到最新版本。

## 相关页面

- [[wiki/entities/claude-cli]] — CLI 基础
- [[wiki/entities/claude-env-vars]] — 环境变量
- [[wiki/entities/claude-settings]] — 配置选项
