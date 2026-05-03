---
name: thedotmack-claude-mem
description: Claude Code 持久化记忆压缩系统 — 自动捕获会话并智能压缩上下文
type: source
version: 1.1
tags: [github, typescript, claude-code, memory, compression, plugin]
created: 2026-04-29
updated: 2026-05-03
source: ../../../../archive/resources/github/thedotmack-claude-mem-2026-05-03.json
stars: 71058
language: TypeScript
license: AGPL-3.0
github_url: https://github.com/thedotmack/claude-mem
---

# Claude-Mem

> **Persistent memory compression system for Claude Code** — 自动捕获会话并智能压缩上下文，跨会话持久化知识

## 基本信息

| 项目 | 信息 |
|------|------|
| **作者** | Alex Newman (@thedotmack) |
| **Stars** | ⭐ 71,058 (超高人气) |
| **Forks** | 6,091 (↑170) |
| **语言** | TypeScript |
| **许可证** | AGPL-3.0 |
| **版本** | 12.4.8 |
| **Node** | >=18.0.0 |
| **Bun** | >=1.0.0 |

## 核心功能

### 🧠 智能记忆系统

- **自动捕获**：静默记录 Claude Code 会话中的所有活动
- **AI 压缩**：使用 Claude Agent SDK 压缩上下文（基于知识图谱）
- **智能注入**：在未来的会话中自动注入相关上下文
- **长期记忆**：构建跨会话的知识库

### 🌐 多语言支持

README 支持 **30+ 种语言**，包括：
- 中文（简体/繁体）、日语、韩语
- 英语、葡萄牙语、西班牙语、德语、法语
- 俄语、阿拉伯语、希伯来语
- 等 20+ 种语言

### 🔄 技术架构

```
Claude Code 会话
     ↓
自动捕获活动
     ↓
AI 压缩 (Claude Agent SDK)
     ↓
知识图谱存储
     ↓
智能检索
     ↓
注入新会话
```

## 技术栈

### 核心依赖

| 依赖 | 用途 |
|------|------|
| `@anthropic-ai/claude-agent-sdk` | Claude Agent 集成 |
| `@modelcontextprotocol/sdk` | MCP 支持 |
| `express` | Web 服务器 |
| `react` + `react-dom` | UI 界面 |
| `yaml` | 配置解析 |
| `zod` | 数据验证 |

### Tree-sitter 语法解析

支持 **20+ 种编程语言**的代码解析：
- TypeScript, JavaScript, Python
- Go, Rust, C, C++, Java
- Ruby, PHP, Kotlin, Scala
- Bash, Lua, Zig, Haskell
- 等...

## 项目结构

```
claude-mem/
├── .claude-plugin/         # Claude Code 插件配置
├── .agent/                # Agent 配置
├── plugin/                # 插件核心
│   ├── .claude-plugin/
│   ├── hooks/             # 生命周期钩子
│   ├── modes/             # 压缩模式
│   ├── skills/            # 技能定义
│   └── scripts/           # 工作脚本
├── src/                   # TypeScript 源码
├── docs/                  # 文档
├── tests/                 # 测试套件
└── openclaw/              # 开放式 Claw 工具
```

## NPM 脚本

### 开发流程

```bash
npm run dev              # 开发模式（构建+同步+重启）
npm run build            # 构建插件
npm run sync-marketplace # 同步到市场
```

### Worker 管理

```bash
npm run worker:start     # 启动 Worker
npm run worker:stop      # 停止 Worker
npm run worker:restart   # 重启 Worker
npm run worker:status    # 查看 Worker 状态
npm run worker:logs      # 查看日志
```

### 测试

```bash
npm test                 # 运行所有测试
npm run test:sqlite      # SQLite 测试
npm run test:agents      # Agent 测试
npm run test:search      # 搜索测试
```

### 多语言翻译

```bash
npm run translate:all    # 翻译 README 到所有语言
npm run translate:tier1  # 主要语言（中/日/韩等）
```

## 安装与使用

### 安装方式

```bash
# 一键安装（推荐）
npx claude-mem install

# 通过 Claude Code Marketplace
claude plugin install thedotmack/claude-mem

# 或通过 npm
npm install -g claude-mem
```

### 配置要求

- Node.js >= 18.0.0
- Bun >= 1.0.0 (可选)
- Claude Code / Gemini CLI / OpenCode 安装

## 新增功能（v12+）

### 🎯 MCP Search Tools — 三层检索架构

专为 Claude Code 设计的知识检索工具，分三层逐步过滤：

```
1. search(query) → 返回带 ID 的索引（~50-100 tokens/条）
2. timeline(anchor=ID) → 获取结果周围的上下文
3. get_observations([IDs]) → 仅在筛选后获取完整详情
```

> **优势**：相比传统 RAG 节省 10x tokens

### ⚙️ Mode & Language 配置

通过 `CLAUDE_MEM_MODE` 环境变量切换运行模式：

```bash
# 查看当前模式
echo $CMEM

# 设置模式
export CLAUDE_MEM_MODE=compact   # 压缩模式
export CLAUDE_MEM_MODE=inject    # 注入模式
```

- **$CMEM Token**：通过 `$CMEM` 环境变量快速引用记忆系统状态
- **多语言支持**：插件界面和提示词支持中文、日语、韩语等

### 🧪 Beta 功能

| 功能 | 说明 |
|------|------|
| **Endless Mode** | 无限上下文模式 — 自动压缩旧上下文避免达到 token 上限 |
| **Biomimetic Memory** | 仿生记忆 — 模拟人类记忆的遗忘曲线和优先级机制 |

### 🔌 OpenClaw Gateway

开放式 Claw 工具网关：
- 支持自定义 Agent 工作流
- 开放 API 接口供第三方集成
- 与 OpenClaw 生态原生兼容

### 🪟 Windows 支持

- 提供完整的 Windows 安装和配置指南
- 兼容 PowerShell 和 CMD

## 相关链接

| 链接 | 说明 |
|------|------|
| [GitHub 仓库](https://github.com/thedotmack/claude-mem) | 源代码 |
| [文档站点](https://docs.claude-mem.ai) | 官方文档 |
| [Issue Tracker](https://github.com/thedotmack/claude-mem/issues) | 问题反馈 |
| [更新日志](https://github.com/thedotmack/claude-mem/blob/main/CHANGELOG.md) | 版本历史 |
| [许可证](https://github.com/thedotmack/claude-mem/blob/main/LICENSE) | AGPL-3.0 |

## 亮点特性

1. **超高人气**：71K+ Stars，Claude Code 生态最流行的记忆系统
2. **AI 驱动**：使用 Claude 自身的能力压缩上下文
3. **无缝集成**：作为 Claude Code 插件，零配置启动
4. **知识图谱**：基于图谱的智能检索，而非简单关键词匹配
5. **多语言**：README 支持 30+ 种语言
6. **开源协议**：AGPL-3.0，保证自由度

## 标签

#ai #ai-agents #ai-memory #anthropic #claude #claude-code #claude-code-plugin #memory #compression #knowledge-graph #rag #typescript

---

*收集时间：2026-05-03*
