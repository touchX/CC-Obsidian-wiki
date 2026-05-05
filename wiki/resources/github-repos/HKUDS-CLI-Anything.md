---
name: HKUDS-CLI-Anything
description: Making ALL Software Agent-Native - 让所有软件变得对 AI Agent 友好
type: source
version: 1.0
tags: [github, python, cli, agent]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/HKUDS-CLI-Anything-2026-05-05.json
stars: 33429
language: Python
license: Apache-2.0
github_url: https://github.com/HKUDS/CLI-Anything
---

# CLI-Anything

> [!info]+ 项目概述
> - **类型**: Agent-Native CLI 框架
> - **语言**: Python
> - **许可证**: Apache-2.0
> - **Stars**: 33,429
> - **官网**: https://clianything.cc/

## 核心特性

CLI-Anything 是一个让所有软件变得对 AI Agent 友好的框架。它的核心理念是：

> **Today's Software Serves Humans 👨‍💻. Tomorrow's Users will be Agents 🤖.**

### 为什么选择 CLI？

- **结构化与可组合** — 文本命令匹配 LLM 格式，可链接复杂工作流
- **轻量与通用** — 最小开销，跨所有系统无依赖运行
- **自描述** — `--help` 标志提供自动文档供 Agent 发现
- **经过验证** — Claude Code 每天通过 CLI 运行数千个真实工作流
- **Agent 优先设计** — 结构化 JSON 输出消除解析复杂性
- **确定性与可靠性** — 一致的结果实现可预测的 Agent 行为

## CLI-Hub

[CLI-Hub](https://hkuds.github.io/CLI-Anything/) 是社区 CLI 的中心注册表：

```bash
pip install cli-anything-hub
cli-hub install <name>
```

浏览、安装和管理所有社区构建的 CLI。

## 快速开始

### Claude Code 用户

**Step 1: 添加 Marketplace**

```bash
/plugin marketplace add HKUDS/CLI-Anything
```

**Step 2: 安装插件**

```bash
/plugin install cli-anything
```

**Step 3: 构建 CLI**

```bash
/cli-anything <software-path-or-repo>
```

### 前提条件

- Python 3.10+
- 目标软件已安装
- 支持的 AI 编码 Agent

## 支持的平台

- Claude Code ⚡
- Pi Coding Agent
- OpenClaw
- OpenCode
- Codex
- Qodercli
- GitHub Copilot CLI

## 相关链接

> [!links]+ 相关链接
> - [GitHub 仓库](https://github.com/HKUDS/CLI-Anything)
> - [CLI-Hub](https://clianything.cc/)
> - [文档](https://github.com/HKUDS/CLI-Anything#readme)
> - [贡献指南](https://github.com/HKUDS/CLI-Anything/blob/main/CONTRIBUTING.md)

## 项目状态

- ✅ 测试: 2,269 通过
- ✅ 覆盖率: 单元 + E2E
- ✅ Forks: 3,266
- ✅ Open Issues: 52