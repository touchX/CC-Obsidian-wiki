---
name: warpdotdev-warp
description: Warp — 基于终端的 Agentic 开发环境，GPU 渲染终端 + 集成 AI 编码智能体
type: source
version: 1.0
tags: [github, rust, ai, agents, terminal, developer-tools, gpu, productivity]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/resources/github/warpdotdev-warp-2026-04-29.json
stars: 32000
forks: 4500
language: Rust
license: AGPL-3.0
github_url: https://github.com/warpdotdev/Warp
homepage: https://www.warp.dev
---

# Warp — Agentic Development Environment

> 基于终端的 Agentic 开发环境（ADE），集成 AI 编码智能体

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [warpdotdev/Warp](https://github.com/warpdotdev/Warp) |
| **Stars** | 32,000+ |
| **Forks** | 4,500+ |
| **许可证** | MIT（WarpUI）/ AGPL-3.0（其他） |
| **语言** | Rust |
| **官网** | [warp.dev](https://www.warp.dev) |
| **文档** | [docs.warp.dev](https://docs.warp.dev/) |

## 核心定位

Warp 将自己定位为 **Agentic Development Environment (ADE)**，而非传统终端模拟器：

| 维度 | 传统终端 | Warp |
|------|----------|------|
| **输出** | 滚动文本缓冲区 | 结构化 Blocks |
| **AI** | 需第三方集成 | 内置多模型 AI 智能体 |
| **协作** | 无 | Warp Drive 云同步 |
| **界面** | 文本渲染 | GPU 渲染自定义 UI |

**赞助商**：OpenAI 是新开源仓库的创始赞助商，新智能体管理工作流由 GPT 模型驱动

## 架构概览

```
┌─────────────────────────────────────────────────────────────┐
│                    Warp 架构层级                              │
├─────────────────────────────────────────────────────────────┤
│  Application Layer — app/                                    │
│  ├── Terminal Emulation (warp_terminal)                      │
│  ├── AI Agent System (ai/)                                   │
│  └── Workspace Features                                     │
├─────────────────────────────────────────────────────────────┤
│  WarpUI Core Framework — warpui_core/                        │
│  └── GPU 渲染 + UI 原语                                     │
├─────────────────────────────────────────────────────────────┤
│  Crate Ecosystem — crates/                                   │
│  ├── Terminal Core                                          │
│  ├── AI & Indexing                                         │
│  ├── Settings & Persistence                                 │
│  └── Protocol (GraphQL, IPC, WebSocket)                     │
└─────────────────────────────────────────────────────────────┘
```

## 三大技术支柱

### 1. 自定义 UI 框架（WarpUI）

GPU 渲染的完全自定义 UI 框架：
- `warpui` + `warpui_core` — MIT 许可证
- 其他代码 — AGPL-3.0

### 2. Block-Based 终端模拟器

终端输出重新构想为结构化 Blocks，而非单调的滚动缓冲区：

| Block 类型 | 说明 | 可见性 |
|-----------|------|--------|
| `User` | 用户输入命令 | 终端 + AI |
| `Output` | 命令输出 | 终端 + AI |
| `AiExchange` | AI 交换 | AI 专用 |
| `AgentInsertedContent` | AI 插入内容 | 无遥测/历史 |
| `InBandCommand` | 内部 Warp 命令 | 仅 Debug |

**关键字段**：
- `is_for_in_band_command` — 标记 Warp 内部命令执行
- `cloud_workflow_id` — 链接云工作流执行
- `agent_view_visibility` — 追踪块在终端/AI 对话中的可见性
- `prompt_snapshot` — 捕获 AI 上下文的渲染提示

### 3. AI 智能体系统

内置 AI 编码智能体，支持多模型：
- 内置编码智能体
- 支持第三方 CLI 智能体（Claude Code、Codex、Gemini CLI）

## 项目结构

```
warpdotdev/Warp/
├── app/                    # 🚀 主应用二进制和功能模块
│   ├── src/
│   │   ├── ai/             # AI 智能体
│   │   ├── editor/         # 多光标文本编辑
│   │   ├── terminal/        # 终端模拟
│   │   └── warp_terminal/  # Shell 管理
│   └── tests/              # 应用层测试
├── crates/                 # 60+ 内部 crate
│   ├── ai/                 # AI 智能体、LLM 集成
│   ├── app-installation-detection/
│   ├── asset_cache/        # 资源缓存
│   ├── command/            # 命令处理
│   ├── command-signatures-v2/
│   ├── computer_use/        # 计算机使用
│   ├── editor/              # 编辑器核心
│   ├── fuzzy_match/         # 模糊匹配
│   ├── graphql/             # GraphQL 客户端
│   ├── http_client/        # HTTP 客户端
│   ├── ipc/                # 进程间通信
│   ├── lsp/                # 语言服务器协议
│   ├── persistence/        # 持久化层
│   ├── settings/           # 设置管理
│   ├── sum_tree/           # 块存储数据结构
│   ├── syntax_tree/       # 语法树
│   ├── virtual_fs/        # 虚拟文件系统
│   ├── warp_completer/    # 自动补全
│   ├── warp_terminal/     # 终端核心
│   ├── warpui/            # UI 框架
│   ├── warpui_core/       # UI 核心
│   └── websocket/         # WebSocket 通信
├── resources/              # 资源文件
│   ├── bundled/           # 捆绑资源
│   ├── channel-gated-skills/
│   └── linux/
├── script/                 # 构建/部署脚本
├── docker/                 # Docker 配置
│   ├── agent-dev/
│   └── linux-dev/
├── specs/                  # 设计规格文档
└── Cargo.toml             # Workspace 配置
```

## 核心 Crate 功能

### AI 相关

| Crate | 功能 |
|-------|------|
| `ai/` | AI 智能体、LLM 集成、索引 |
| `computer_use/` | 计算机使用能力 |
| `graphql/` | GraphQL 客户端 |
| `markdown_parser/` | Markdown 解析 |

### 终端相关

| Crate | 功能 |
|-------|------|
| `warp_terminal/` | 终端核心、Shell 管理 |
| `syntax_tree/` | 语法树解析 |
| `warp_completer/` | 自动补全引擎 |
| `vim/` | Vim 模式支持 |

### 数据层

| Crate | 功能 |
|-------|------|
| `persistence/` | SQLite 数据库持久化 |
| `settings/` | 配置管理 |
| `asset_cache/` | 资源缓存 |

## 许可证说明

| 组件 | 许可证 |
|------|--------|
| **`warpui` + `warpui_core`** | MIT License |
| **其他代码**（应用、终端、AI） | AGPL-3.0 |

## 构建与运行

### 快速开始

```bash
# 平台特定初始化
./script/bootstrap

# 构建并运行
./script/run

# 格式化、Clippy 和测试
./script/presubmit
```

### 最小化调试构建

```bash
cargo run --bin warp-oss --features "gui"
```

### 连接本地 Warp Server

```bash
WARP_WITH_LOCAL_SERVER=1 ./script/run
```

## 贡献工作流

```
Issue → PR → ready-to-spec 标签（可开始设计）→ ready-to-implement 标签（可实现代码）
```

**标签说明**：
- [`ready-to-spec`](https://github.com/warpdotdev/warp/issues?q=is%3Aissue+is%3Aopen+label%3Aready-to-spec) — 设计开放贡献者参与
- [`ready-to-implement`](https://github.com/warpdotdev/warp/issues?q=is%3Aissue+is%3Aopen+label%3Aready-to-implement) — 设计已确定，欢迎 PR

## 开源依赖

| 依赖 | 用途 |
|------|------|
| [Tokio](https://github.com/tokio-rs/tokio) | 异步运行时 |
| [NuShell](https://github.com/nushell/nushell) | Shell 集成 |
| [Fig Completion Specs](https://github.com/withfig/autocomplete) | 自动补全规范 |
| [Alacritty](https://github.com/alacritty/alacritty) | 终端渲染参考 |
| [Hyper](https://github.com/hyperium/hyper) | HTTP 库 |
| [FontKit](https://github.com/servo/font-kit) | 字体处理 |
| [Warp Server Framework](https://github.com/seanmonstar/warp) | Web 框架 |

## 相关资源

| 资源 | 链接 |
|------|------|
| GitHub | https://github.com/warpdotdev/Warp |
| 官网 | https://www.warp.dev |
| 文档 | https://docs.warp.dev/ |
| 下载 | https://www.warp.dev/download |
| AI Agents | https://www.warp.dev/agents |
| Blog | https://www.warp.dev/blog/how-warp-works |
| Slack | [go.warp.dev/join-preview](https://go.warp.dev/join-preview) |

## 适用场景

| 场景 | 适用功能 |
|------|----------|
| **AI 辅助编程** | 内置 AI 编码智能体、多模型支持 |
| **命令历史管理** | Block-Based 命令搜索、选择性 AI 上下文 |
| **团队协作** | Warp Drive 云同步 |
| **高性能终端** | GPU 渲染、自定义 UI |
| **智能体开发** | ACP (Agent Client Protocol) 支持 |
| **工作流自动化** | Cloud Workflows、云端执行 |

## 发展趋势

| 方向 | 状态 |
|------|------|
| **ACP 支持** | 高优先级 — 使用 Warp 作为 ACP 客户端连接外部智能体 |
| **Pager 兼容性** | 修复中 — 命令头与分页器输出重叠问题 |
| **NuShell 支持** | 开发中 |
| **配置化体验级别** | 已上线 — 从裸终端到完整 ADE 可调节 |
