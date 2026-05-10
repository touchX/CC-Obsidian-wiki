---
name: kingToolbox-WindTerm
description: 专业跨平台 SSH/Sftp/Shell/Telnet/Tmux/Serial 终端工具
type: source
tags: [github, c, terminal, ssh, sftp, telnet, serial, tmux, cross-platform]
created: 2026-05-08
updated: 2026-05-08
source: ../../../archive/resources/github/kingToolbox-WindTerm-2026-05-08.json
stars: 30870
language: C
license: Apache-2.0 (部分开源)
github_url: https://github.com/kingToolbox/WindTerm
---

# WindTerm

> [!tip] Repository Overview
> ⭐ **30,870 Stars** | 🔥 **专业跨平台终端工具 — 比 PuTTY/FileZilla 更快更强大**

A Quicker and better SSH/Telnet/Serial/Shell/Sftp client for DevOps.

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [kingToolbox/WindTerm](https://github.com/kingToolbox/WindTerm) |
| **Stars** | ⭐ 30,870 |
| **Forks** | 2,342 |
| **语言** | C |
| **许可证** | Apache-2.0（部分开源）+ 免费商用 |
| **创建时间** | 2019-10-09 |
| **更新时间** | 2026-05-08 |

## 项目介绍

WindTerm 是一个专业的跨平台终端工具，支持 SSH、Telnet、Serial、Shell、Sftp 等协议。相比 PuTTY 和 FileZilla，它拥有更高的性能和更低的内存占用。

**核心特点**：
- 🆓 **完全免费** — 商业和非商业使用均无限制
- 🚀 **超高性能** — Telnet/SSH 数据处理速度比 PuTTY 快 10 倍以上
- 💾 **超低内存** — 动态内存压缩技术，内存占用比传统终端低 80-90%
- 🖥️ **跨平台** — 支持 Windows、macOS、Linux

## 核心功能

### 协议支持

| 协议 | 功能 |
|------|------|
| **SSH v2** | 自动执行、ControlMaster、ProxyCommand/Jump、Agent 转发 |
| **Telnet** | 完整支持，XModem/YModem/ZModem 传输 |
| **Serial** | 串口通信支持 |
| **Shell** | Windows Cmd/PowerShell、Linux bash/zsh、macOS |
| **Sftp/Scp** | 内置文件传输客户端 |
| **Tmux** | 集成 Tmux 会话管理 |

### SSH 高级功能

- 🔐 **多种认证方式**：密码、公钥、keyboard-interactive、GSSAPI
- 🌐 **代理支持**：HTTP/SOCKS5 代理、Jump Server 跳转
- ⌨️ **X11 转发**：远程图形界面支持
- 🔌 **端口转发**：本地/远程/动态端口转发
- 🤖 **自动登录**：会话配置后自动认证

### 性能基准测试

**SFTP 传输性能（5GB 单文件）**：

| 应用 | 下载速率 | 上传速率 |
|------|---------|---------|
| **WindTerm** | **216.3 MB/s** | **247.0 MB/s** |
| FileZilla | 161.1 MB/s | 171.8 MB/s |
| WinSCP | 63.7 MB/s | 56.7 MB/s |

**终端滚动性能（1000万行无限制回溯）**：

| 终端 | 耗时 | 内存占用 |
|------|------|---------|
| **WindTerm** | **10.7s** | **133.3 MB** |
| rxvt | OOM | OOM |
| PuTTY | OOM | OOM |
| iTerm2 | 20.5s | 2231.3 MB |
| Kitty | OOM | OOM |

## 安装与下载

### 预编译版本

**下载地址**：https://github.com/kingToolbox/WindTerm/releases

| 平台 | 安装包 |
|------|--------|
| Windows | WindTerm_x.x_Windows.zip |
| macOS | WindTerm_x.x_macOS.tar.gz |
| Linux | WindTerm_x.x_Linux.tar.gz |

### 源码编译

```bash
# 克隆仓库
git clone https://github.com/kingToolbox/WindTerm.git
cd WindTerm

# 查看构建说明
# (项目使用 CMake 构建系统)
```

## 开源说明

WindTerm 是**部分开源**项目，源码将逐步开放：

**已开源**：
- 可独立使用的类（功能、算法、GUI 组件）
- 功能库（网络、协议等）
- 许可证要求开源的类型

**暂未开源**：
- 核心编辑器组件（WindEdit）

## 版本路线图

| 版本 | 级别 | 目标 | 状态 | 时间线 |
|------|------|------|------|--------|
| v0.x | 基础 | 框架和基础功能 | ✅ 完成 | 很久以前 ~ 2020初 |
| v1.x | 手动 | 完善功能，日常工作可用 | ✅ 完成 | 2020春 ~ 2020冬 |
| **v2.x** | **半自动** | 触发器、宏、事件辅助操作 | 🔄 开发中 | 2021春 ~ 2022夏 |
| v3.x | 全自动 | 插件、脚本、ML 自动运维 | 📋 规划中 | 2022夏 ~ 2023冬 |

**发布周期**：2-3 个月/版本

## 快捷键

详见官方文档：[Shortcut Keys List](https://kingtoolbox.github.io/tags/keyboard/)

## 相关链接

### 项目资源
- [GitHub 仓库](https://github.com/kingToolbox/WindTerm)
- [官方文档](https://kingtoolbox.github.io)
- [发布页面](https://github.com/kingToolbox/WindTerm/releases)
- [问题反馈](https://github.com/kingToolbox/WindTerm/issues)
- [讨论区](https://github.com/kingToolbox/WindTerm/discussions)
- [WindEdit (高性能文本编辑器)](https://github.com/kingToolbox/WindEdit)

### 使用指南
- [[../tools/windterm|WindTerm 使用指南]] — 知乎专栏教程
  - 窗格调整与界面优化
  - SSH/SFTP 连接配置
  - 命令提示与补全
  - 文件传输技巧
