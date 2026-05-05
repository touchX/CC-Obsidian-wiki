---
name: zilliztech-claude-context
description: MCP 插件 — 使用向量数据库为 AI 编码助手提供语义代码搜索能力
type: source
version: 1.0
tags: [github, typescript, mcp, semantic-search, vector-database, ai-coding, agents, rag, milvus]
created: 2026-04-29
updated: 2026-04-29
source: ../../../archive/resources/github/zilliztech-claude-context-2026-04-29.json
stars: 10223
forks: 758
language: TypeScript
license: MIT
github_url: https://github.com/zilliztech/claude-context
---

# Claude Context — 语义代码搜索 MCP 插件

> 为 AI 编码助手提供语义代码搜索能力，让智能体真正「理解」你的代码库

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [zilliztech/claude-context](https://github.com/zilliztech/claude-context) |
| **Stars** | 10,223+ |
| **Forks** | 758+ |
| **许可证** | MIT |
| **语言** | TypeScript |
| **架构** | pnpm Monorepo |
| **平台支持** | Claude Code / Codex CLI / Gemini CLI / Cursor / Windsurf / VSCode |

## 核心定位

Claude Context 是一个 **MCP (Model Context Protocol)** 插件，将语义代码搜索能力注入 AI 编码助手：

| 维度 | 无上下文插件 | Claude Context |
|------|-------------|----------------|
| **搜索方式** | 关键词匹配 | 语义向量搜索 |
| **上下文理解** | 字符串相似度 | 语义相似度 |
| **代码理解** | 逐字匹配 | AST + 语义块 |
| **增量更新** | 完整重建 | Merkle 树差量 |
| **检索效率** | O(n) 线性扫描 | O(log n) 向量索引 |

## 三大技术支柱

### 1. 混合搜索架构

```
查询输入 → BM25 (稀疏向量) + Dense Embedding (密集向量)
                ↓                    ↓
              关键词召回           语义召回
                ↓                    ↓
              ┌───────────────────────┐
              │    Reciprocal Rank    │
              │    Fusion (RRF)       │
              └───────────────────────┘
                        ↓
                  融合排序结果
```

**核心特性**：
- BM25 + Dense Vector 双路召回
- Reciprocal Rank Fusion (RRF) 融合排序
- 支持 Zilliz Cloud / Milvus / Pinecone / Qdrant 等向量数据库

### 2. 增量索引（Merkle Tree）

使用 Merkle 树实现增量代码索引：

| 特性 | 说明 |
|------|------|
| **差量更新** | 文件变更仅重索引受影响子树 |
| **一致性验证** | 根哈希变化快速检测修改 |
| **增量同步** | 远程索引与本地代码同步 |
| **存储效率** | 避免全量重索引开销 |

### 3. AST-Based 分块

基于抽象语法树（AST）的智能代码分块：

```
源代码 → Parser → AST → 语义块识别 → 嵌入向量
                  ↓
            保留结构信息：
            - 函数/类边界
            - 导入依赖
            - 注释关联
            - 类型信息
```

**优势**：保持代码语义完整性，避免跨函数截断

## 项目结构

```
zilliztech/claude-context/
├── packages/
│   ├── claude-context-core/      # 核心搜索库
│   │   ├── src/
│   │   │   ├── indexer/          # 索引器（Merkle Tree）
│   │   │   ├── searcher/         # 搜索器（混合搜索）
│   │   │   ├── chunker/          # 分块器（AST）
│   │   │   └── embeddings/       # 向量嵌入
│   │   └── package.json
│   ├── claude-context-mcp/      # MCP 服务器实现
│   │   ├── src/
│   │   │   ├── server.ts         # MCP 服务器
│   │   │   ├── resources/        # 资源定义
│   │   │   └── tools/            # 工具定义
│   │   └── package.json
│   └── vscode-extension/         # VSCode 插件
├── examples/                      # 使用示例
├── README.md                     # 英文文档
└── README_zh.md                  # 中文文档
```

## 核心包

### @zilliz/claude-context-core

核心搜索库，提供底层 API：

| 模块 | 功能 |
|------|------|
| `indexer/` | Merkle Tree 增量索引 |
| `searcher/` | 混合搜索 + RRF 融合 |
| `chunker/` | AST 分块器 |
| `embeddings/` | 向量嵌入接口 |

### @zilliz/claude-context-mcp

MCP 服务器实现，符合 Model Context Protocol 规范：

```typescript
// 使用示例
import { createMCPServer } from '@zilliz/claude-context-mcp'

const server = createMCPServer({
  vectorDb: {
    provider: 'zilliz',
    collection: 'codebase-index'
  }
})

server.start()
```

### VSCode 扩展

为 VSCode 提供原生集成：

- 实时索引当前工作区
- 查询结果内联显示
- 快捷键支持

## 支持的平台

| 平台 | 支持状态 | 说明 |
|------|----------|------|
| **Claude Code** | ✅ 完整 | MCP 协议原生支持 |
| **Codex CLI** | ✅ 完整 | MCP 协议原生支持 |
| **Gemini CLI** | ✅ 完整 | MCP 协议原生支持 |
| **Cursor** | ✅ 完整 | MCP 协议支持 |
| **Windsurf** | ✅ 完整 | MCP 协议支持 |
| **VSCode** | ✅ 原生扩展 | 专用 VSIX 插件 |
| **Cline / Roo Code** | ✅ 完整 | MCP 协议支持 |
| **其他 MCP 客户端** | ✅ 通用 | 标准 MCP 协议 |

## 向量数据库支持

| 数据库 | 状态 | 配置示例 |
|--------|------|----------|
| **Zilliz Cloud** | ✅ 推荐 | SaaS，向量搜索托管 |
| **Milvus** | ✅ 完整 | 自托管向量数据库 |
| **Pinecone** | ✅ 完整 | 云端向量服务 |
| **Qdrant** | ✅ 完整 | 自托管/云端 |
| **Chroma** | ✅ 完整 | 本地向量库 |
| **pgvector** | ✅ 完整 | PostgreSQL 扩展 |

## 性能基准

| 指标 | 数据 | 说明 |
|------|------|------|
| **Token 节省** | ~40% | 等效检索质量下 |
| **索引速度** | ~1000 files/s | 中等配置机器 |
| **搜索延迟** | <50ms | P99，端到端 |
| **增量索引** | <100ms | 单文件变更 |

## 快速开始

### 安装

```bash
# 安装 MCP 服务器
npm install -g @zilliz/claude-context-mcp

# 或使用 Claude Code 集成
claude mcp add claude-context npx @zilliz/claude-context-mcp
```

### 配置向量数据库

```json
// MCP 配置文件 (~/.config/claude/mcp.json)
{
  "mcpServers": {
    "claude-context": {
      "command": "npx",
      "args": ["@zilliz/claude-context-mcp", "start"],
      "env": {
        "ZILLIZ_API_KEY": "your-api-key",
        "ZILLIZ_COLLECTION": "codebase-index"
      }
    }
  }
}
```

### 使用示例

```typescript
// 在 Claude Code 中查询
// 问：我在哪里使用了 authenticateUser 函数？
// → 返回相关代码片段及其语义相似度分数
```

## 技术栈

| 组件 | 技术 | 说明 |
|------|------|------|
| **核心语言** | TypeScript | 类型安全 |
| **运行时** | Node.js | 跨平台 |
| **MCP 协议** | @modelcontextprotocol/sdk | 标准协议 |
| **向量数据库** | Zilliz Cloud / Milvus | 向量存储 |
| **AST 解析** | @swc/core | 高性能解析 |
| **嵌入模型** | Embedding API | 语义向量化 |

## 相关资源

| 资源 | 链接 |
|------|------|
| GitHub | https://github.com/zilliztech/claude-context |
| Zilliz Cloud | https://cloud.zilliz.com |
| MCP 协议 | https://modelcontextprotocol.io |
| 文档 | README.md / README_zh.md |

## 适用场景

| 场景 | 适用功能 |
|------|----------|
| **大规模代码库** | Merkle 树增量索引 |
| **语义搜索** | 混合搜索 + RRF 融合 |
| **多智能体协作** | MCP 协议标准接口 |
| **代码审查** | 语义相似代码发现 |
| **重构辅助** | 相关代码上下文 |
| **跨语言搜索** | 多语言语义理解 |
