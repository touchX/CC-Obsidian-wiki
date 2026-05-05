---
agent.teams
name: guides/agent-teams
description: Agent Teams 多会话协调工作流实现指南
type: guide
tags: [agent-teams, implementation, tmux, coordination]
created: 2026-04-26
updated: 2026-05-01
source: ../../archive/implementation/claude-agent-teams-implementation.md
---

# Agent Teams Implementation

Agent Teams 通过多个独立 Claude Code 会话协调工作，每个 teammate 拥有完整上下文窗口。不同于 subagents（单会话内的隔离上下文分叉），每个团队成员自动加载 CLAUDE.md、MCP 服务器和 skills。

## 核心概念

- **独立会话**: 每个 teammate 是完整 Claude Code 实例
- **共享任务列表**: 通过共享任务列表协调
- **完整上下文**: CLAUDE.md、MCP、skills 全量加载
- **时间编排**: Agent Teams 构建的"time-orchestrator"示例

## 实现步骤

1. 安装 iTerm2 和 tmux
2. 启动 tmux 会话并设置 `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`
3. 提示团队结构引导完整工作流

## 交叉引用

- [[claude-subagents]] — 子代理系统（对比）
- [[claude-commands]] — 命令系统
- [[agent-command-skill-comparison]] — 扩展机制对比

## 相关页面

- [[skills]] — Skills 实现
- [[commands]] — Commands 实现