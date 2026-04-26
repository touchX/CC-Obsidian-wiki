---
name: day0-setup
description: Claude Code 安装与认证完整指南 — 支持 Windows/Linux/macOS
type: guide
tags: [tutorial, setup, installation, authentication, windows, linux, macos]
created: 2026-04-26
source: tutorial/day0/README.md
---

# Day 0 — Claude Code Setup

> 50-100字中文摘要：Day 0 指南涵盖 Claude Code 在 Windows/Linux/macOS 三平台的安装流程，包含 Node.js 环境配置、版本验证命令，以及三种认证方式（订阅账户、团队邀请、自有 API Key）的详细操作步骤。

![Last Updated](https://img.shields.io/badge/Last_Updated-Apr_26%2C_2026-white?style=flat&labelColor=555)

## 交叉引用

- [[entities/claude-code]] — Claude Code 工具完整指南
- [[entities/claude-cli]] — CLI 核心功能
- [[tutorial/day1/README]] — Day 1 使用层级指南

<table width="100%">
<tr>
<td><a href="../../">← Back to Claude Code Best Practice</a></td>
<td align="right"><img src="../../../assets/claude-jumping.svg" alt="Claude" width="60" /></td>
</tr>
</table>

---

## Step 1: Install Claude Code

This guide walks you through installing Claude Code on your machine and authenticating so you can start using it.

## Step 1: Install Claude Code

Choose your operating system:

| OS | Guide |
|----|-------|
| Windows | [windows.md](windows.md) |
| Linux | [linux.md](linux.md) |
| macOS | [mac.md](mac.md) |

Follow the guide for your OS, then come back here for authentication.

---

## Step 2: Verify Installation

After following your OS-specific guide, confirm everything is working:

```bash
node --version    # Should show v18.x or higher
claude --version  # Should show the installed Claude Code version
```

---

## Step 3: Login

<img src="../!/images/tutorial/login.png" alt="Claude Code login screen" width="50%">

Run `claude` in your terminal. On first launch, it will ask you to choose a login method.

### Method 1: Subscription (Claude Pro / Max)

- Select **Claude.ai account**
- Browser opens — sign in and authorize
- Return to terminal, you're logged in

### Method 2a: API Key (Team Invite)

Your team admin invites you from the Anthropic dashboard.

- You receive an **invite email** — accept it and create your Anthropic account
- Run `claude` in your terminal
- Select **Anthropic API Key**
- Your key is **auto-generated** on the dashboard — no manual setup needed
- Claude Code starts working immediately

### Method 2b: API Key (You have the key)

If someone shared the key with you (via Slack, email, etc.) or you created your own:

- Run `claude` in your terminal
- Select **Anthropic API Key**
- Paste your key (starts with `sk-ant-`)
- The key is **stored permanently** — you won't be asked again

---