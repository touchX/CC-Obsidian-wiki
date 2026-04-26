---
name: day0-windows-setup
description: Windows 平台 Claude Code 安装指南 — Node.js MSI 安装与 npm 全局安装
type: guide
tags: [tutorial, setup, windows, installation, nodejs, npm]
created: 2026-04-26
source: tutorial/day0/windows.md
---

# Windows Setup

> 50-100字中文摘要：Windows 平台 Claude Code 安装指南，通过 Node.js 官方 MSI 安装包配置运行环境，然后使用 npm 全局安装 Claude Code。包含版本验证命令和权限问题处理方案。

![Last Updated](https://img.shields.io/badge/Last_Updated-Apr_26%2C_2026-white?style=flat&labelColor=555)

## 交叉引用

- [[tutorial/day0/README]] — Day 0 主索引
- [[tutorial/day0/linux]] — Linux 安装指南
- [[tutorial/day0/mac]] — macOS 安装指南
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

**Node.js**
- Go to [nodejs.org](https://nodejs.org)
- Click the **"Download Node.js (LTS)"** button — this downloads the `.msi` installer
- Run the `.msi` file and click **Next** through the wizard
- Accept the defaults, click **Install**, wait for it to finish

**Verify Node.js**
- Open a **new** terminal (PowerShell or Windows Terminal) and run:
  ```powershell
  node --version
  npm --version
  ```

**Claude Code**
- ```powershell
  npm install -g @anthropic-ai/claude-code
  ```
- If you get a permission error, run your terminal as **Administrator** (right-click > Run as administrator)

**Verify**
- ```powershell
  claude --version
  ```

---

Now head back to [README.md](README.md) for authentication setup.
