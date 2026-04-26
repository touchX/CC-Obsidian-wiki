---
name: concepts/agent-memory
description: 子 Agent 持久化记忆系统 — memory frontmatter 字段详解
type: concept
tags: [agents, memory, persistence, context]
created: 2026-02-15
source: ../../archive/reports/claude-agent-memory.md
---

# Agent Memory 持久化记忆

v2.1.33 引入的 `memory` frontmatter 字段为每个 subagent 提供独立持久化 markdown 知识库。在此之前，每次 agent 调用都从零开始。memory 让 agent 跨会话学习、记忆和积累知识。

## 相关页面

- [[entities/claude-subagents]] — 子代理系统
- [[concepts/context-management]] — 上下文管理
- [[guides/memory-usage]] — 内存使用指南
