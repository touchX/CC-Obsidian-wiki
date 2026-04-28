---
name: tutorial/day0/README
description: Day 0 教程 — Claude Code 安装与认证指南
type: tutorial
tags: [tutorial, installation, setup, authentication, beginner]
created: 2026-04-26
source: ../../archive/tutorial/day0/README.md
---

# Day 0 — Claude Code 安装与认证

> 首次使用 Claude Code？本教程带你完成安装到认证的全过程。

## 学习路径

| 平台 | 教程 |
|------|------|
| Windows | [[day0/windows]] |
| Linux | [[day0/linux]] |
| macOS | [[day0/mac]] |

---

## 安装前准备

### 系统要求

- **Node.js**: 18+ (用于 CLI 扩展)
- **操作系统**: Windows 10+, Linux, macOS
- **网络**: 能够访问 Anthropic API

### 获取 API Key

1. 访问 [Anthropic Console](https://console.anthropic.com/)
2. 创建 API Key
3. 妥善保存，后续认证需要

---

## 安装步骤概览

```
1. 安装 CLI 工具
      ↓
2. 首次运行认证
      ↓
3. 配置基础设置
      ↓
4. 验证安装成功
```

---

## 快速验证

安装完成后，运行以下命令验证：

```bash
claude --version
```

成功后会显示版本号。

---

## 下一步

安装完成后，前往 [[day1/README]] 学习使用层级。

---

## 相关资源

- [[claude-cli]] — CLI 核心功能
- [[claude-settings]] — 设置配置系统
- [[quick-start]] — Wiki 快速入门