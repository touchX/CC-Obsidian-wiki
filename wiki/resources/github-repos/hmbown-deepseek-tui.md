---
name: hmbown-deepseek-tui
description: DeepSeek TUI - 终端代码智能助手，支持 DeepSeek V4 模型和 1M Token 上下文
type: source
tags: [github, rust, cli, deepseek, llm, terminal, tui, coding-agent]
created: 2026-05-07
updated: 2026-05-07
source: ../../../archive/resources/github/hmbown-deepseek-tui-2026-05-07.json
language: Rust
license: MIT
github_url: https://github.com/Hmbown/DeepSeek-TUI
---

# DeepSeek TUI

> [!info] Repository Overview
> **DeepSeek TUI** 是一个在终端运行的代码智能助手，支持 DeepSeek V4 模型。它从 `deepseek` 命令启动，流式输出推理过程，编辑本地代码库时需要审批，并包含自动模式（每轮自动选择模型和思维层级）。

## 📊 仓库统计

| 指标 | 数值 |
|------|------|
| ⭐ Stars | 16,061 |
| 🍴 Forks | 1,236 |
| 💻 语言 | Rust |
| 📄 许可证 | MIT |
| 🔗 链接 | [github.com/Hmbown/DeepSeek-TUI](https://github.com/Hmbown/DeepSeek-TUI) |
| 🏷️ Topics | cli, deepseek, llm, rust, terminal, tui |

## 🎯 核心特性

### 主要功能

| 特性 | 说明 |
|------|------|
| **Auto 模式** | `--model auto` / `/model auto` 自动选择模型和思维层级 |
| **思维流式输出** | 实时显示 DeepSeek 推理过程 |
| **完整工具集** | 文件操作、Shell 执行、Git、Web 搜索/浏览、补丁应用、子 Agent、MCP |
| **1M Token 上下文** | 支持百万级 Token 上下文，带压缩和前缀缓存 |
| **三种模式** | Plan（只读探索）、Agent（交互审批）、YOLO（自动批准） |
| **思维层级切换** | `Shift + Tab` 循环切换 off → high → max |
| **会话保存/恢复** | 检查点和恢复长时间运行的会话 |
| **工作区回滚** | 使用 side-git 快照，支持 `/restore` 和 `revert_turn` |
| **持久任务队列** | 后台任务可跨越重启 |
| **HTTP/SSE API** | `deepseek serve --http` 无头 Agent 工作流 |
| **MCP 协议** | 连接 Model Context Protocol 服务器扩展工具 |
| **LSP 诊断** | 编辑后通过 rust-analyzer、pyright、typescript-language-server 等显示错误/警告 |
| **Skills 系统** | 可组合、可安装的指令包，从 GitHub 安装无需后端服务 |

## 🚀 安装方式

### 四种安装途径

```bash
# 1. npm（最简单）
npm install -g deepseek-tui

# 2. Cargo（无需 Node）
cargo install deepseek-tui-cli --locked   # 提供 `deepseek` 入口
cargo install deepseek-tui     --locked   # 提供 `deepseek-tui` 二进制

# 3. Homebrew（macOS）
brew tap Hmbown/deepseek-tui
brew install deepseek-tui

# 4. 直接下载（预编译二进制）
# https://github.com/Hmbown/DeepSeek-TUI/releases
# 支持 Linux x64/ARM64, macOS x64/ARM64, Windows x64
```

### 中国区镜像安装

```bash
# Cargo 镜像配置
# ~/.cargo/config.toml
[source.crates-io]
replace-with = "tuna"

[source.tuna]
registry = "sparse+https://mirrors.tuna.tsinghua.edu.cn/crates.io-index/"

# npm 使用国内镜像
npm install -g deepseek-tui --registry=https://registry.npmmirror.com
```

## 快速开始

```bash
# 安装
npm install -g deepseek-tui

# 设置 API Key
deepseek auth set --provider deepseek

# 验证安装
deepseek --version

# 自动模式运行
deepseek --model auto
```

## 🔑 认证配置

### 方式一：命令行配置（推荐）

```bash
# 设置 DeepSeek API Key
deepseek auth set --provider deepseek --api-key "YOUR_KEY"

# 查看认证状态
deepseek doctor
```

### 方式二：环境变量

```bash
export DEEPSEEK_API_KEY="YOUR_KEY"
deepseek
```

### 方式三：其他提供商

```bash
# NVIDIA NIM
deepseek auth set --provider nvidia-nim --api-key "YOUR_KEY"
deepseek --provider nvidia-nim

# Fireworks
deepseek auth set --provider fireworks --api-key "YOUR_KEY"
deepseek --provider fireworks --model deepseek-v4-pro

# 自托管 SGLang
SGLANG_BASE_URL="http://localhost:30000/v1" deepseek --provider sglang --model deepseek-v4-flash

# 自托管 vLLM
VLLM_BASE_URL="http://localhost:8000/v1" deepseek --provider vllm --model deepseek-v4-flash

# 自托管 Ollama
ollama pull deepseek-coder:1.3b
deepseek --provider ollama --model deepseek-coder:1.3b
```

## 📖 使用模式

### 三种工作模式

| 模式 | 命令 | 说明 |
|------|------|------|
| **Plan** | `/plan` | 只读探索模式，不修改文件 |
| **Agent** | 默认 | 交互模式，修改前需要审批 |
| **YOLO** | `/yolo` | 自动批准所有操作 |

### Auto 模式详解

Auto 模式同时控制两个设置：

- **模型**: `deepseek-v4-flash` 或 `deepseek-v4-pro`
- **思维**: `off`, `high`, 或 `max`

发送请求前，应用会先用 `deepseek-v4-flash`（关闭思维）做一次路由调用，根据请求内容和上下文选择合适的模型和思维层级。

```
Auto 模式本地执行，不向上游 API 发送 model: "auto"
```

## 🛠️ 工具集

### 支持的工具

| 工具类别 | 功能 |
|---------|------|
| **文件操作** | 读取、编辑、创建、删除文件 |
| **Shell 执行** | 运行终端命令 |
| **Git** | 提交、推送、拉取、分支管理 |
| **Web** | 搜索和浏览网页 |
| **补丁应用** | apply-patch 批量修改 |
| **子 Agent** | 协调子任务 |
| **MCP** | 连接 MCP 服务器扩展工具 |
| **RLM** | 批量分析通过 `deepseek-v4-flash` 子进程 |

### LSP 诊断支持

| 语言 | LSP 服务器 |
|------|-----------|
| Rust | rust-analyzer |
| Python | pyright |
| TypeScript/JS | typescript-language-server |
| Go | gopls |
| C/C++ | clangd |

## 🔧 架构设计

```
deepseek（调度 CLI）
    ↓
deepseek-tui（配套二进制）
    ↓
ratatui 界面
    ↓
异步引擎 ↔ OpenAI 兼容流式客户端

工具调用通过类型注册表路由：
Shell / 文件操作 / Git / Web / 子 Agent / MCP / RLM
结果流式返回到对话记录中
```

详细架构文档：[docs/ARCHITECTURE.md](https://github.com/Hmbown/DeepSeek-TUI/blob/main/docs/ARCHITECTURE.md)

## 📦 Skills 系统

DeepSeek TUI 支持可组合、可安装的指令包：

```bash
# 安装 Skills（从 GitHub）
# 具体命令请参考官方文档
```

特点：
- 从 GitHub 安装，无需后端服务
- 可组合使用
- 自定义工作流

## 🌐 MCP 协议支持

连接 Model Context Protocol 服务器扩展工具：

```bash
# 详见 docs/MCP.md
```

## 💰 成本跟踪

- **实时显示**：每轮和会话级别的 Token 使用量
- **成本估算**：实时费用统计
- **缓存命中率**：显示缓存命中/未命中情况

## 🖥️ 支持平台

| 平台 | 状态 |
|------|------|
| Linux x64 | ✅ 官方支持 |
| Linux ARM64 | ✅ v0.8.8+ |
| macOS x64 | ✅ 官方支持 |
| macOS ARM64 | ✅ 官方支持 |
| Windows x64 | ✅ 官方支持 |
| 其他（musl, riscv64, FreeBSD） | 需要源码编译 |

## 📚 相关资源

| 资源 | 链接 |
|------|------|
| **GitHub** | [Hmbown/DeepSeek-TUI](https://github.com/Hmbown/DeepSeek-TUI) |
| **npm** | [deepseek-tui](https://www.npmjs.com/package/deepseek-tui) |
| **crates.io** | [deepseek-tui-cli](https://crates.io/crates/deepseek-tui-cli) |
| **DeepSeek API** | [platform.deepseek.com](https://platform.deepseek.com/api_keys) |
| **架构文档** | [docs/ARCHITECTURE.md](https://github.com/Hmbown/DeepSeek-TUI/blob/main/docs/ARCHITECTURE.md) |
| **安装文档** | [docs/INSTALL.md](https://github.com/Hmbown/DeepSeek-TUI/blob/main/docs/INSTALL.md) |
| **MCP 文档** | [docs/MCP.md](https://github.com/Hmbown/DeepSeek-TUI/blob/main/docs/MCP.md) |
| **DeepWiki** | [deepwiki.com/Hmbown/DeepSeek-TUI](https://deepwiki.com/Hmbown/DeepSeek-TUI) |

## 🔮 核心价值

DeepSeek TUI 的核心价值：

1. **终端原生** — 在熟悉的命令行环境中工作
2. **DeepSeek V4 支持** — 1M Token 上下文、流式推理
3. **智能 Auto 模式** — 自动选择最佳模型和思维层级
4. **完整工具集** — 文件、Shell、Git、Web、MCP 一应俱全
5. **审批机制** — 重要操作需要确认，保护代码安全
6. **多提供商支持** — DeepSeek、NVIDIA NIM、Fireworks、SGLang、vLLM、Ollama

---

*最后更新: 2026-05-07*
*数据来源: GitHub README + 官方文档*
*终端代码智能助手，DeepSeek V4 原生支持*
