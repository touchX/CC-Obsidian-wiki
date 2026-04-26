---
name: tutorial/day0/windows
description: Windows 平台 Claude Code 安装指南
type: tutorial
tags: [tutorial, installation, windows, setup, beginner]
created: 2026-04-26
source: ../../../archive/tutorial/day0/windows.md
---

# Windows 平台安装指南

> 在 Windows 11 上安装 Claude Code 的完整步骤。

## 安装方式

### 方式一：npm 全局安装（推荐）

```powershell
npm install -g @anthropic-ai/claude-code
```

### 方式二：下载可执行文件

从 [GitHub Releases](https://github.com/anthropics/claude-code/releases) 下载 Windows 版本。

---

## 认证配置

### 环境变量方式

```powershell
# PowerShell
$env:ANTHROPIC_API_KEY="your-api-key"

# CMD
set ANTHROPIC_API_KEY=your-api-key
```

### 首次运行

```powershell
claude
```

首次运行时会提示输入 API Key，或自动使用环境变量。

---

## Windows 特定配置

### 路径配置

Claude Code 会创建以下配置目录：
- 配置: `%USERPROFILE%\.claude`
- 项目配置: `{项目目录}\.claude`

### 快捷方式

建议创建快捷方式方便访问：
```powershell
# 创建 alias (PowerShell)
function claude { & claude-code $args }
```

---

## 已知问题

| 问题 | 解决方案 |
|------|----------|
| 权限错误 | 以管理员身份运行终端 |
| 路径包含空格 | 使用引号包裹路径 |

---

## 相关资源

- [[tutorial/day0/README]] — 安装概览
- [[tutorial/day0/linux]] — Linux 安装
- [[tutorial/day0/mac]] — macOS 安装