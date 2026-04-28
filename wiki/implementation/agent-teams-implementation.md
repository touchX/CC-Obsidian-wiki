---
name: implementation/agent-teams-implementation
description: Agent Teams 多会话实现详解 — 独立上下文窗口协调机制
type: implementation
tags: [implementation, agent-teams, multi-session, coordination, tmux]
created: 2026-03-12
---

# Agent Teams Implementation

> Agent Teams 通过生成多个独立 Claude Code 会话实现并行工作，每个会话拥有完整上下文窗口（CLAUDE.md、MCP 服务器、Skills 自动加载），通过共享任务列表协调。

## 核心概念

Agent Teams 与 Sub-agents 的核心区别：

| 特性 | Agent Teams | Sub-agents |
|------|-------------|------------|
| 会话数量 | 多会话并行 | 单会话隔离分支 |
| 上下文 | 各自完整独立 | 共享主会话配置 |
| 启动方式 | 多终端/tmux | `Task` 工具 |
| 适用场景 | 复杂多角色协作 | 轻量级任务分解 |

## 协调机制

### 团队结构

```
Lead (主控)
    ├── Command Architect (命令设计)
    ├── Agent Engineer (Agent 开发)
    └── Skill Designer (Skill 设计)
```

### 共享任务列表

通过共享的 Markdown 任务列表协调：
- [ ] 约定数据契约：`{time, tz, formatted}`
- [ ] Command 使用 Agent 工具
- [ ] Agent 预加载 skill
- [ ] Skill 从上下文读取数据

### 架构模式

Agent Teams 同样遵循 **Command → Agent → Skill** 编排模式：

| 组件 | 职责 | 文件位置 |
|------|------|----------|
| Command | 入口点 | `archive/implementation/claude-agent-teams/.claude/commands/` |
| Agent | 数据获取 | `archive/implementation/claude-agent-teams/.claude/agents/` |
| Skill | 视觉输出 | `archive/implementation/claude-agent-teams/.claude/skills/` |

## 启动方式

### 前置要求

```bash
# macOS/Linux
brew install tmux
```

### 启动命令

```bash
tmux new -s dev
CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1 claude
```

## 相关页面

- [[agent-teams]] — Agent Teams 指南
- [[claude-subagents]] — 子代理系统
- [[agent-command-skill-comparison]] — Agent/Command/Skill 对比
- [[commands-implementation]] — Commands 实现
- [[subagents-implementation]] — Sub-agents 实现
