---
name: tutorial/day0/mac
description: macOS 平台 Claude Code 安装指南
type: tutorial
tags: [tutorial, installation, macos, setup, beginner]
created: 2026-04-26
source: ../../../archive/tutorial/day0/mac.md
---

# macOS 平台安装指南

> 在 macOS 上安装 Claude Code 的完整步骤。

## 安装方式

### 方式一：Homebrew（推荐）

```bash
brew install anthropic/tap/claude-code
```

### 方式二：npm 全局安装

```bash
npm install -g @anthropic-ai/claude-code
```

### 方式三：下载可执行文件

从 [GitHub Releases](https://github.com/anthropics/claude-code/releases) 下载 macOS 版本。

---

## 认证配置

### 环境变量方式

```bash
# ~/.zshrc 或 ~/.bash_profile
export ANTHROPIC_API_KEY="your-api-key"
```

### 首次运行

```bash
claude
```

---

## macOS 特定配置

### Shell 集成

```bash
# 添加到 ~/.zshrc
eval "$(claude --init-script)"
```

### 代码签名

如果遇到安全警告：
```bash
xattr -d com.apple.quarantine /path/to/claude
```

---

## 相关资源

- [[tutorial/day0/README]] — 安装概览
- [[tutorial/day0/windows]] — Windows 安装
- [[tutorial/day0/linux]] — Linux 安装