---
name: notes/2026-04-27-mcp-detailed-overview
description: Claude Code MCP 机制详解 — 作用域、Token 消耗、隔离策略
type: insight
tags: [session, mcp, architecture, claude-code]
created: 2026-04-27
source: conversation
---

# Claude Code MCP 机制详解

## MCP 是什么

MCP (Model Context Protocol) 是 Claude Code 连接外部工具、服务、数据库的扩展协议。

## 核心架构

```
┌─────────────────────────────────────────────────────┐
│                    Claude Code                      │
├─────────────────────────────────────────────────────┤
│  内置工具 (Read/Edit/Bash)  │  MCP 服务器 (扩展)     │
│               ↕            │         ↕              │
│     Claude Code 核心       │   外部服务和 API       │
└─────────────────────────────────────────────────────┘
```

## 三级作用域

| 级别 | 配置文件 | 作用域 | 用途 |
|------|----------|--------|------|
| Project | `.mcp.json` | 仅当前项目 | 团队共享 |
| User | `~/.claude.json` | 所有项目 | 个人配置 |
| Subagent | frontmatter `mcpServers` | 特定 Agent | 隔离环境 |

**优先级**: Subagent > Project > User (累加,非覆盖)

## 推荐 MCP 服务器

| 服务器 | 用途 |
|--------|------|
| context7 | 获取最新文档 |
| Playwright | 浏览器自动化 |
| Chrome DevTools | 实时调试 |
| DeepWiki | GitHub 仓库分析 |
| Excel | Excel 操作 |

## Token 消耗

### 占 Context 的部分
- MCP 工具定义: ❌ 不占
- MCP 调用结果: ✅  占 (类似 API 返回)
- 工具描述: ⚠️  极小

### Context 消耗排名
1. 对话消息 (最大)
2. CLAUDE.md
3. Skills (5000 tokens 上限)
4. MCP 结果
5. 工具描述

## 无法禁用用户级 MCP

**结论**: MCP 是累加的,无法在项目级禁用用户级已配置的 MCP。

**间接方法**:
1. Subagent 中指定 `mcpServers` 过滤
2. allowedTools 限制 `mcp__*` 工具
3. Hook 拦截

## 使用场景

- 查库文档 → context7
- 浏览器自动化 → Playwright
- Excel 处理 → Excel MCP

## 相关 Wiki 页面
- [[entities/claude-mcp]]
- [[entities/claude-subagents]]
- [[concepts/global-vs-project-settings]]