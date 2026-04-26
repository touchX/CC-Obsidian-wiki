---
name: agent-teams-implementation
description: Claude Code 多会话 Agent Teams 实现详解 — 独立上下文窗口协调机制
type: guide
tags: [implementation, agent-teams, multi-session, coordination, tmux]
created: 2026-03-12
source: claude-agent-teams-implementation.md
---

# Agent Teams Implementation

> 50-100字中文摘要：Agent Teams 通过生成多个独立 Claude Code 会话实现并行工作，每个会话拥有完整上下文窗口（CLAUDE.md、MCP 服务器、Skills 自动加载），通过共享任务列表协调，适用于复杂任务的分解与并行执行。

![Last Updated](https://img.shields.io/badge/Last_Updated-Mar_12%2C_2026-white?style=flat&labelColor=555)

## 交叉引用

- [[guides/agent-teams]] — Agent Teams 指南
- [[entities/claude-subagents]] — 子代理系统

<table width="100%">
<tr>
<td><a href="../">← Back to Claude Code Best Practice</a></td>
<td align="right"><img src="archive/assets/claude-jumping.svg" alt="Claude" width="60" /></td>
</tr>
</table>

---

<a href="#time-orchestration"><img src="archive/assets/tags/implemented-hd.svg" alt="Implemented"></a>

<p align="center">
  <img src="../../assets/images/implementation/impl-agent-teams.png" alt="Agent Teams in action — split pane mode with tmux" width="100%">
</p>

Agent Teams spawn **multiple independent Claude Code sessions** that coordinate via a shared task list. Unlike subagents (isolated context forks within one session), each teammate gets its own full context window with CLAUDE.md, MCP servers, and skills loaded automatically.

---

## ![How to Use](archive/assets/tags/how-to-use.svg)

The time orchestration workflow was built entirely by an agent team. To run the finished product:

```bash
cd agent-teams
claude
/time-orchestrator
```

This invokes the **Command → Agent → Skill** pipeline: the agent fetches Dubai's current time, and the skill renders an SVG time card to `agent-teams/output/dubai-time.svg`.

---

## ![How to Implement](archive/assets/tags/how-to-implement.svg)

You can create a replica of the weather orchestration workflow using agent teams — in this example, the time orchestration workflow was built entirely by an agent team.

### 1. Install [iTerm2](https://iterm2.com/) and tmux

```bash
brew install --cask iterm2
brew install tmux
```

### 2. Start iTerm2 → tmux → Claude

```bash
tmux new -s dev
CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1 claude
```

### 3. Prompt with team structure

<a id="time-orchestration"></a>

Paste this prompt into Claude to bootstrap a complete time orchestrator workflow using agent teams:

Main prompt: **[agent-teams-prompt.md](../agent-teams/agent-teams-prompt.md)**

### Team Coordination Flow

```
┌──────────────────────────────────────────────────────────────┐
│                         LEAD (You)                           │
│       "Create an agent team to build time orchestration"     │
└──────────────────────────┬───────────────────────────────────┘
                           │ spawns team (all parallel)
              ┌────────────┼────────────┐
              ▼            ▼            ▼
   ┌────────────────┐ ┌──────────┐ ┌──────────────┐
   │ Command        │ │ Agent    │ │ Skill        │
   │ Architect      │ │ Engineer │ │ Designer     │
   │                │ │          │ │              │
   │ agent-teams/   │ │ agent-   │ │ agent-teams/ │
   │ .claude/       │ │ teams/   │ │ .claude/     │
   │ commands/      │ │ .claude/ │ │ skills/      │
   │ time-          │ │ agents/  │ │ time-svg-    │
   │ orchestrator.md│ │ time-    │ │ creator/     │
   │                │ │ agent.md │ │              │
   └───────┬────────┘ └────┬─────┘ └──────┬───────┘
           │               │              │
           ▼               ▼              ▼
   ┌──────────────────────────────────────────────────┐
   │            Shared Task List                      │
   │  ☐ Agree on data contract: {time, tz, formatted} │
   │  ☐ Command uses Agent tool (not bash)            │
   │  ☐ Agent preloads time-fetcher skill             │
   │  ☐ Skill reads time from context (no re-fetch)   │
   │  ☐ All files inside agent-teams/.claude/         │
   └──────────────────────────────────────────────────┘
                       │
                       ▼
          ┌──────────────────────────────┐
          │  cd agent-teams && claude    │
          │    /time-orchestrator        │
          │   Command → Agent → Skill    │
          └──────────────────────────────┘
```

