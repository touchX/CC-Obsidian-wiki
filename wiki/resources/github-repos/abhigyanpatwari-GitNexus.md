---
name: abhigyanpatwari-GitNexus
description: 零服务器代码智能引擎 - 为 AI Agent 构建代码库知识图谱
type: source
tags: [github, typescript, knowledge-graph, mcp-server, ai-agents, code-intelligence]
created: 2026-05-08
updated: 2026-05-08
source: ../../../archive/resources/github/abhigyanpatwari-GitNexus-2026-05-08.json
stars: 36865
language: TypeScript
license: PolyForm Noncommercial
github_url: https://github.com/abhigyanpatwari/GitNexus
---

# GitNexus

> [!tip] Repository Overview
> ⭐ **36,865 Stars** | 🔥 **零服务器代码智能引擎 — 为 AI Agent 构建代码库知识图谱**

**Building nervous system for agent context.**

GitNexus 将任何代码库索引为知识图谱 — 每个依赖、调用链、集群和执行流 — 然后通过智能工具暴露它，让 AI Agent 永不遗漏代码。

> *Like DeepWiki, but deeper.* DeepWiki 帮助你*理解*代码。GitNexus 让你*分析*它 — 因为知识图谱追踪每个关系，而不仅仅是描述。

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [abhigyanpatwari/GitNexus](https://github.com/abhigyanpatwari/GitNexus) |
| **Stars** | ⭐ 36,865 |
| **Forks** | 4,194 |
| **语言** | TypeScript |
| **许可证** | PolyForm Noncommercial |
| **创建时间** | 2025-08-02 |
| **更新时间** | 2026-05-08 |

## 两种使用方式

| | **CLI + MCP** | **Web UI** |
| --- | --- | --- |
| **功能** | 本地索引仓库，通过 MCP 连接 AI Agent | 浏览器中的可视化图谱浏览器 + AI 聊天 |
| **适用场景** | Cursor、Claude Code、Codex、Windsurf 等日常开发 | 快速探索、演示、一次性分析 |
| **规模** | 完整仓库，任意大小 | 受浏览器内存限制（~5k 文件）或后端模式无限制 |
| **安装** | `npm install -g gitnexus` | 无需安装 — [gitnexus.vercel.app](https://gitnexus.vercel.app) |
| **存储** | LadybugDB 原生（快速、持久） | LadybugDB WASM（内存中，按会话） |
| **解析** | Tree-sitter 原生绑定 | Tree-sitter WASM |
| **隐私** | 全本地，无网络 | 全浏览器内，无服务器 |

## 项目介绍

GitNexus 是一个客户端知识图谱创建器，完全在浏览器中运行。Drop in 一个 GitHub 仓库或 ZIP 文件，即可获得带有内置 Graph RAG Agent 的交互式知识图谱。

**核心创新：预计算关系智能**

- **可靠性** — LLM 不会遗漏上下文，工具响应已包含
- **Token 效率** — 无需 10 次查询链来理解一个函数
- **模型民主化** — 更小的 LLM 也能工作，因为工具做了重活

### GitNexus 解决的问题

```
1. AI 编辑 `UserService.validate()`
2. 不知道 47 个函数依赖于它的返回类型
3. 破坏性变更发布 ❌
```

## 技术架构

### 多阶段索引管道

```
文件结构 → Tree-sitter AST 解析 → 导入/调用解析 → 聚类 → 执行流追踪 → 混合搜索索引
```

1. **Structure** — 遍历文件树，映射文件夹/文件关系
2. **Parsing** — 使用 Tree-sitter AST 提取函数、类、方法、接口
3. **Resolution** — 解析跨文件导入、函数调用、继承、构造函数推断
4. **Clustering** — 将相关符号分组为功能社区
5. **Processes** — 从入口点追踪执行流
6. **Search** — 构建快速检索的混合搜索索引

### 技术栈

| 层级 | CLI | Web |
|------|-----|-----|
| **运行时** | Node.js (原生) | 浏览器 (WASM) |
| **解析** | Tree-sitter 原生绑定 | Tree-sitter WASM |
| **数据库** | LadybugDB 原生 | LadybugDB WASM |
| **嵌入** | HuggingFace transformers.js | transformers.js (WebGPU/WASM) |
| **搜索** | BM25 + 语义 + RRF | BM25 + 语义 + RRF |
| **Agent 接口** | MCP (stdio) | LangChain ReAct agent |
| **可视化** | — | Sigma.js + Graphology (WebGL) |
| **前端** | — | React 18, TypeScript, Vite, Tailwind v4 |

## 安装与使用

### 快速开始

```bash
# 索引仓库（从仓库根目录运行）
npx gitnexus analyze
```

这将：
- 索引代码库
- 安装 Agent Skills
- 注册 Claude Code Hooks
- 创建 `AGENTS.md` / `CLAUDE.md` 上下文文件

### MCP 配置

```bash
# 一次性配置 MCP
gitnexus setup
```

### Claude Code 完整支持

```bash
# macOS / Linux
claude mcp add gitnexus -- npx -y gitnexus@latest mcp

# Windows
claude mcp add gitnexus -- cmd /c npx -y gitnexus@latest mcp
```

### CLI 命令

```bash
gitnexus analyze [path]          # 索引仓库（或更新过时索引）
gitnexus analyze --force         # 强制完全重新索引
gitnexus analyze --skills        # 生成仓库特定的技能文件
gitnexus analyze --skip-embeddings  # 跳过嵌入生成（更快）
gitnexus mcp                     # 启动 MCP 服务器（stdio）
gitnexus serve                   # 启动本地 HTTP 服务器（多仓库）
gitnexus list                    # 列出所有已索引的仓库
gitnexus status                  # 显示当前仓库的索引状态
gitnexus wiki [path]             # 从知识图谱生成仓库 Wiki
```

## 核心特性

### 16 个 MCP 工具

| 工具 | 功能 | 参数 |
|------|------|------|
| `list_repos` | 发现所有已索引仓库 | — |
| `query` | 混合搜索（BM25 + 语义 + RRF） | `repo` 可选 |
| `context` | 360度符号视图 | `repo` 可选 |
| `impact` | 影响范围分析 | `repo` 可选 |
| `detect_changes` | Git diff 影响检测 | `repo` 可选 |
| `rename` | 多文件协调重命名 | `repo` 可选 |
| `cypher` | 原始 Cypher 图查询 | `repo` 可选 |

### 4 个 Agent Skills（自动安装）

- **Exploring** — 使用知识图谱导航不熟悉的代码
- **Debugging** — 通过调用链追踪 bug
- **Impact Analysis** — 在更改前分析影响范围
- **Refactoring** — 使用依赖映射规划安全重构

### 多仓库 MCP 架构

```
~/.gitnexus/registry.json ← 全局注册表
     ↓
MCP Server ← 读取注册表，连接多个 LadybugDB
     ↓
Connection Pool (lazy open, 5分钟超时)
```

## 支持的语言（14+）

| 语言 | 导入 | 命名绑定 | 导出 | 继承 | 类型注解 | 构造函数推断 |
|------|------|----------|------|------|----------|--------------|
| TypeScript | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| JavaScript | ✓ | ✓ | ✓ | ✓ | — | ✓ |
| Python | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Java | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Go | ✓ | — | ✓ | ✓ | ✓ | ✓ |
| Rust | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| C# | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| PHP | ✓ | ✓ | ✓ | — | ✓ | ✓ |
| Ruby | ✓ | — | ✓ | ✓ | — | ✓ |
| Swift | — | — | ✓ | ✓ | ✓ | ✓ |
| C/C++ | — | — | ✓ | ✓ | ✓ | ✓ |

## 使用案例

### 影响分析

```
impact({target: "UserService", direction: "upstream", minConfidence: 0.8})

TARGET: Class UserService (src/services/user.ts)

UPSTREAM (依赖于此):
  Depth 1 (会破坏):
    handleLogin [CALLS 90%] -> src/api/auth.ts:45
    handleRegister [CALLS 90%] -> src/api/auth.ts:78
  Depth 2 (可能受影响):
    authRouter [IMPORTS] -> src/routes/auth.ts
```

### 过程分组搜索

```
query({query: "authentication middleware"})

processes:
  - summary: "LoginFlow"
    priority: 0.042
    symbol_count: 4
    process_type: cross_community
```

### 检测变更（预提交）

```
detect_changes({scope: "all"})

summary:
  changed_count: 12
  affected_count: 3
  risk_level: medium
```

## 安全与隐私

- **CLI**：一切在本地运行，无网络调用。索引存储在 `.gitnexus/`（gitignore）
- **Web**：一切在浏览器内，无代码上传到服务器
- 开源 — 自己审计代码

## 相关链接

- [GitHub 仓库](https://github.com/abhigyanpatwari/GitNexus)
- [Web UI](https://gitnexus.vercel.app)
- [Discord 社区](https://discord.gg/MgJrmsqr62)
- [npm 包](https://www.npmjs.com/package/gitnexus)
- [Enterprise (SaaS & Self-hosted)](https://akonlabs.com)

