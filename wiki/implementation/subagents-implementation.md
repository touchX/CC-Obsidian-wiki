---
name: implementation/subagents-implementation
description: Sub-agents 子代理实现详解 — Weather Agent 示例
type: implementation
tags: [implementation, subagents, weather-agent, isolated-context]
created: 2026-03-02
---

# Sub-agents Implementation

> Sub-agents 在单会话内创建隔离上下文分支，通过 `Task` 工具调用。与 Agent Teams（多会话并行）不同，Sub-agents 共享主会话的 CLAUDE.md 和 MCP 配置，适合轻量级任务分解与并行执行。

## 核心概念

Sub-agents 通过 `Task` 工具创建隔离的上下文分支：

```typescript
Task({
  prompt: "任务描述",
  subagent_type: "agent-type",
  // ...
})
```

### 与 Agent Teams 的区别

| 特性 | Sub-agents | Agent Teams |
|------|------------|-------------|
| 上下文 | 隔离但共享主会话配置 | 完全独立会话 |
| 启动方式 | `Task` 工具 | 多终端并行 |
| 适用场景 | 轻量级并行 | 复杂多角色协作 |

## Weather Agent 示例

**文件位置**: `.claude/agents/weather-agent.md`

```yaml
---
name: weather-agent
description: 获取迪拜天气的专用 Agent
tools: WebFetch, Read, Write, Edit
model: sonnet
skills:
  - weather-fetcher
---
```

### 特性

- **预加载 Skill**：`weather-fetcher` 在启动时注入上下文
- **隔离执行**：独立上下文避免主会话污染
- **工具受限**：通过 `tools` 字段限制可用工具

## 相关页面

- [[wiki/entities/claude-subagents]] — Sub-agents 实体
- [[guides/subagents]] — Sub-agents 使用指南
- [[synthesis/agent-command-skill-comparison]] — Agent/Command/Skill 对比
- [[implementation/agent-teams-implementation]] — Agent Teams 实现
- [[implementation/commands-implementation]] — Commands 实现
