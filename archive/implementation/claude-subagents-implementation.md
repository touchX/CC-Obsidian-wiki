---
name: subagents-implementation
description: Claude Code Sub-agents 子代理实现详解 — Weather Agent 示例
type: guide
tags: [implementation, subagents, weather-agent, isolated-context]
created: 2026-03-02
source: claude-subagents-implementation.md
---

# Sub-agents Implementation

> 50-100字中文摘要：Sub-agents 在单会话内创建隔离上下文分支，通过 `Task` 工具调用。与 Agent Teams（多会话并行）不同，Sub-agents 共享主会话的 CLAUDE.md 和 MCP 配置，适合轻量级任务分解与并行执行。

![Last Updated](https://img.shields.io/badge/Last_Updated-Mar_02%2C_2026_07%3A59_PM_PKT-white?style=flat&labelColor=555)

## 交叉引用

- [[guides/subagents]] — Sub-agents 使用指南
- [[entities/claude-subagents]] — 子代理实体
- [[synthesis/agent-command-skill-comparison]] — Agent/Command/Skill 对比

<table width="100%">
<tr>
<td><a href="../">← Back to Claude Code Best Practice</a></td>
<td align="right"><img src="archive/assets/claude-jumping.svg" alt="Claude" width="60" /></td>
</tr>
</table>

---

<a href="#weather-agent"><img src="archive/assets/tags/implemented-hd.svg" alt="Implemented"></a>

The weather agent is implemented in this repo as an example of the **Command → Agent → Skill** architecture pattern, demonstrating two distinct skill patterns.

---

## Weather Agent

**File**: [`.claude/agents/weather-agent.md`](../.claude/agents/weather-agent.md)

```yaml
---
name: weather-agent
description: Use this agent PROACTIVELY when you need to fetch weather data for
  Dubai, UAE. This agent fetches real-time temperature from Open-Meteo
  using its preloaded weather-fetcher skill.
tools: WebFetch, Read, Write, Edit
model: sonnet
color: green
maxTurns: 5
permissionMode: acceptEdits
memory: project
skills:
  - weather-fetcher
---

# Weather Agent

You are a specialized weather agent that fetches weather data for Dubai,
UAE.

## Your Task

Execute the weather workflow by following the instructions from your preloaded
skill:

1. **Fetch**: Follow the `weather-fetcher` skill instructions to fetch the
   current temperature
2. **Report**: Return the temperature value and unit to the caller
3. **Memory**: Update your agent memory with the reading details for
   historical tracking

...
```

The agent has one preloaded skill (`weather-fetcher`) that provides instructions for fetching from Open-Meteo. It returns the temperature value and unit to the calling command.

---

## ![How to Use](archive/assets/tags/how-to-use.svg)

```bash
$ claude
> what is the weather in dubai?
```

---

## ![How to Implement](archive/assets/tags/how-to-implement.svg)

You can create an agent using the `/agents` command, 
```bash
$ claude
> /agents
```

or ask Claude to create one for you — it will generate the markdown file with YAML frontmatter and body in `.claude/agents/<name>.md`

---

<a href="https://github.com/shanraisshan/claude-code-best-practice#orchestration-workflow"><img src="archive/assets/tags/orchestration-workflow-hd.svg" alt="Orchestration Workflow"></a>

The weather agent is the **Agent** in the Command → Agent → Skill orchestration pattern. It receives the workflow from the `/weather-orchestrator` command and fetches temperature using its preloaded skill (`weather-fetcher`). The command then invokes the standalone `weather-svg-creator` skill to create the visual output.

<p align="center">
  <img src="../orchestration-workflow/orchestration-workflow.svg" alt="Command Skill Agent Architecture Flow" width="100%">
</p>

| Component | Role | This Repo |
|-----------|------|-----------|
| **Command** | Entry point, user interaction | [`/weather-orchestrator`](../.claude/commands/weather-orchestrator.md) |
| **Agent** | Fetches data with preloaded skill (agent skill) | [`weather-agent`](../.claude/agents/weather-agent.md) with [`weather-fetcher`](../.claude/skills/weather-fetcher/SKILL.md) |
| **Skill** | Creates output independently (skill) | [`weather-svg-creator`](../.claude/skills/weather-svg-creator/SKILL.md) |
