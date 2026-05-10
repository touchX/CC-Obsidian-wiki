---
name: getpaseo-paseo
description: One interface for all your Claude Code, Codex and OpenCode agents
type: source
tags: [github, typeScript]
created: 2025-10-13
updated: 2026-05-07
source: ../../../archive/resources/github/getpaseo-paseo-2026-05-07.json
stars: 5579
forks: 496
language: TypeScript
license: other
github_url: https://github.com/getpaseo/paseo
homepage: https://paseo.sh
topics: [agents, claude-code, codex, opencode, claude, copilot, gemini, mobile, orchestration]
---

# Paseo

> [!tip] Repository Overview
> ⭐ **5579 Stars** | 🔥 **One interface for all your Claude Code, Codex and OpenCode agents**

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [getpaseo/paseo](https://github.com/getpaseo/paseo) |
| **Stars** | ⭐ 5579 |
| **Forks** | 496 |
| **语言** | TypeScript |
| **许可证** | other |
| **Topics** | agents, claude-code, codex, opencode, claude, copilot, gemini, mobile, orchestration |
| **创建时间** | 2025-10-13 |
| **更新时间** | 2026-05-07 |

## 项目介绍

**Paseo** 是一个跨平台 AI 编码代理编排工具，可以通过统一界面管理多个 AI 编程助手（Claude Code、Codex、OpenCode），支持 iOS、Android、Desktop、Web、CLI 等多种设备。

**核心价值**：
- 在你自己的机器上并行运行 AI 代理
- 打通多种 AI 编程助手，统一管理
- 隐私优先，无遥测、无追踪、无强制登录

## 技术架构

Paseo 采用 **Daemon + Clients** 架构：

```
┌─────────────────────────────────────────────────┐
│                   Clients                        │
│  (Desktop App / Mobile App / Web App / CLI)    │
└─────────────────┬───────────────────────────────┘
                  │ Connect
                  ▼
┌─────────────────────────────────────────────────┐
│                 Paseo Daemon                     │
│            (Local Server on Machine)            │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐        │
│  │ Claude  │  │  Codex  │  │ OpenCode│        │
│  │  Code   │  │         │  │         │        │
│  └─────────┘  └─────────┘  └─────────┘        │
└─────────────────────────────────────────────────┘
```

**核心组件**：
- **Daemon**：运行在本地机器上的守护进程，管理所有 AI 代理
- **Clients**：桌面端、移动端、Web 端、CLI 客户端，通过网络连接 Daemon

## 核心特性

- **🤖 Self-hosted**：代理运行在你的机器上，使用完整的开发环境（工具、配置、技能）
- **🔄 Multi-provider**：通过同一界面管理 Claude Code、Codex、OpenCode
- **🎤 Voice control**：语音模式，口述任务或讨论问题，解放双手
- **📱 Cross-device**：支持 iOS、Android、桌面、Web、CLI，在任何设备上继续工作
- **🔒 Privacy-first**：无遥测、无追踪、无强制登录

## 安装与使用

### Desktop app（推荐）

从 [paseo.sh/download](https://paseo.sh/download) 下载或从 [GitHub releases](https://github.com/getpaseo/paseo/releases) 下载。打开应用后守护进程自动启动。

### CLI / 无头模式

```bash
# 安装 CLI
npm install -g @getpaseo/cli

# 启动 Paseo
paseo
```

终端会显示二维码，用任何客户端扫描即可连接。适用于服务器和远程机器。

### 基本命令

```bash
# 运行代理
paseo run --provider claude/opus-4.6 "implement user authentication"

# 列出运行中的代理
paseo ls

# 附加到运行中的代理
paseo attach abc123

# 发送后续任务
paseo send abc123 "also add tests"

# 远程连接
paseo --host workstation.local:6767 run "run the full test suite"
```

## 相关链接

- [GitHub 仓库](https://github.com/getpaseo/paseo)
- [官方文档](https://paseo.sh)
- [下载页面](https://paseo.sh/download)
- [配置参考](https://paseo.sh/docs/configuration)
- [CLI 参考](https://paseo.sh/docs/cli)
- [Issue 页面](https://github.com/getpaseo/paseo/issues)

## 元数据

- **归档日期**: 2026-05-07
- **归档来源**: [getpaseo/paseo](https://github.com/getpaseo/paseo)

---

*由 github-collect 自动收集于 2026-05-07*
*AI 增强处理：v3.2*
