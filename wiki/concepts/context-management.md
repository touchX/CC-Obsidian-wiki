---
name: context-management
description: Claude Code 上下文管理策略
type: concept
tags: [workflow, optimization, claude-code]
created: 2026-04-23
updated: 2026-04-23
sources: 3
---

# Context Management (上下文管理)

## 概述

Claude Code 提供了多种上下文管理机制，帮助在长时间任务中保持高效。

## 管理工具

### 1. 内置命令

| 命令 | 功能 | 触发时机 |
|------|------|----------|
| `/compact` | 压缩上下文 | 60-70% |
| `/clear` | 清空上下文 | 需要重启时 |
| `/help` | 查看所有命令 | - |

### 2. 外部记忆系统

```
Memory Strategy (四层)
├── memU (MCP) — 长期语义知识
├── Claude-Mem — 近期活动
├── Platform Memory — 环境信息
└── Memory Hub — 统一入口
```

### 3. 分层上下文

| 层 | 持久性 | 内容 | 工具 |
|---|--------|------|------|
| CLAUDE.md | 永久 | 核心规则 | 用户维护 |
| Wiki | 半永久 | 知识积累 | LLM 维护 |
| 会话 | 临时 | 当前任务 | 自动 |

## 最佳实践

### 渐进压缩策略

| 触发点 | 动作 | 模式 |
|--------|------|------|
| 60% | summarize | 正常 |
| 75% | caveman lite | 轻度压缩 |
| 85% | caveman full | 标准压缩 |
| 90% | caveman ultra | 极致压缩 |

### 项目级配置

```json
// .claude.json
{
  "contextStrategy": "auto",
  "maxInputTokens": 4000
}
```

## 相关概念

- [[concepts/context-window]] — 上下文窗口原理
- [[entities/claude-code]] — Claude Code 工具
- [[entities/claude-hooks]] — Hooks 系统

## 来源

- 项目配置文件分析
- 实战经验总结
