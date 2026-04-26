---
name: day0-mac-setup
description: macOS 平台 Claude Code 安装指南 — Homebrew 与 brew install
type: guide
tags: [tutorial, setup, macos, installation, homebrew, brew]
created: 2026-04-26
source: tutorial/day0/mac.md
---

# macOS Setup

> 50-100字中文摘要：macOS 平台 Claude Code 安装指南，通过 Homebrew 包管理器一键安装。检查 Homebrew 状态，自动安装缺失依赖，然后使用 brew install 安装 Claude Code 并验证版本。

![Last Updated](https://img.shields.io/badge/Last_Updated-Apr_26%2C_2026-white?style=flat&labelColor=555)

## 交叉引用

- [[tutorial/day0/README]] — Day 0 主索引
- [[tutorial/day0/windows]] — Windows 安装指南
- [[tutorial/day0/linux]] — Linux 安装指南
- [[entities/claude-code]] — Claude Code 工具

<table width="100%">
<tr>
<td><a href="../../">← Back to Claude Code Best Practice</a></td>
<td align="right"><img src="../../../assets/claude-jumping.svg" alt="Claude" width="60" /></td>
</tr>
</table>

---

[Back to Day 0](README.md)

---

**Terminal**
- Open Terminal (press `Cmd + Space`, type "Terminal", hit Enter)

**Homebrew**
- Check if Homebrew is already installed:
  ```bash
  brew --version
  ```
- If you get "command not found", install Homebrew first:
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

**Claude Code**
- ```bash
  brew install --cask claude-code
  ```

**Verify**
- ```bash
  claude --version
  ```

---

Now head back to [README.md](README.md) for authentication setup.
