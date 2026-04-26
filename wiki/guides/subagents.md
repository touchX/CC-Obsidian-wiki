---
name: guides/subagents
description: Sub-agents 实现指南 — 上下文分叉与记忆系统
type: guide
tags: [subagents, implementation, memory]
created: 2026-04-26
source: ../../archive/implementation/claude-subagents-implementation.md
---

# Sub-agents Implementation

Sub-agents 通过隔离的上下文分叉在单会话内运行，与 Agent Teams 的独立会话模式形成对比。weather-agent 是典型示例。

## Weather Agent 结构

```yaml
---
name: weather-agent
description: Fetches weather data for Dubai, UAE
tools: WebFetch, Read, Write, Edit
model: sonnet
color: green
maxTurns: 5
permissionMode: acceptEdits
memory: project
skills:
  - weather-fetcher
---
```

## 核心配置

| 配置项 | 值 | 说明 |
|--------|-----|------|
| model | sonnet | 使用 Sonnet 模型 |
| maxTurns | 5 | 最大回合数限制 |
| memory | project | 项目级记忆持久化 |
| skills | weather-fetcher | 预加载 skill |

## Sub-agents vs Agent Teams

| 特性 | Sub-agents | Agent Teams |
|------|-----------|-------------|
| 上下文 | 单会话分叉 | 独立完整会话 |
| 记忆 | 可选持久化 | 独立上下文 |
| 复杂度 | 简单 | 复杂 |
| 适用场景 | 轻量任务 | 复杂协调 |

## 交叉引用

- [[entities/claude-subagents]] — 子代理系统
- [[concepts/agent-memory]] — 子 Agent 持久化记忆系统
- [[guides/agent-teams]] — Agent Teams（对比）

## 相关页面

- [[guides/skills]] — Skills 实现
- [[guides/commands]] — Commands 实现