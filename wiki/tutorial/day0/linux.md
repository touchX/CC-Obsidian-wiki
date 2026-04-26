---
name: tutorial/day0/linux
description: Linux 平台 Claude Code 安装指南
type: tutorial
tags: [tutorial, installation, linux, setup, beginner]
created: 2026-04-26
source: ../../../archive/tutorial/day0/linux.md
---

# Linux 平台安装指南

> 在 Linux 上安装 Claude Code 的完整步骤。

## 安装方式

### 方式一：npm 全局安装（推荐）

```bash
npm install -g @anthropic-ai/claude-code
```

### 方式二：curl 安装

```bash
curl -L https://github.com/anthropics/claude-code/releases/latest/download/claude-code-linux-x64 -o claude
chmod +x claude
sudo mv claude /usr/local/bin/
```

---

## 认证配置

### 环境变量方式

```bash
# ~/.bashrc 或 ~/.zshrc
export ANTHROPIC_API_KEY="your-api-key"
```

### 首次运行

```bash
claude
```

---

## Linux 特定配置

### Shell 集成

```bash
# 添加到 ~/.bashrc 或 ~/.zshrc
eval "$(claude --init-script)"
```

### Shell 自动补全

```bash
claude --completion-install
```

---

## 相关资源

- [[tutorial/day0/README]] — 安装概览
- [[tutorial/day0/windows]] — Windows 安装
- [[tutorial/day0/mac]] — macOS 安装