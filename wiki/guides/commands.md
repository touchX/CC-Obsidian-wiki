---
commands
name: guides/commands
description: Weather Orchestrator Command 实现指南 — Command → Agent → Skill 模式
type: guide
tags: [commands, implementation, orchestration]
created: 2026-04-26
updated: 2026-05-01
source: ../../archive/implementation/claude-commands-implementation.md
---

# Commands Implementation

Commands 是 **Command → Agent → Skill** 架构模式的入口点，用于编排多步骤工作流。weather-orchestrator 命令演示了完整流程。

## Weather Orchestrator 工作流

1. **询问用户偏好**: 使用 AskUserQuestion 询问温度单位（摄氏度/华氏度）
2. **获取天气数据**: 通过 Agent 工具调用 weather-agent
3. **创建 SVG 天气卡片**: 通过 Skill 工具调用 weather-svg-creator

## 命令结构

```yaml
---
description: Fetch weather data for Dubai and create an SVG weather card
model: haiku
---

# Weather Orchestrator Command
```

## 交叉引用

- [[claude-commands]] — Commands 系统
- [[agent-command-skill-comparison]] — 三种扩展机制对比
- [[agent-teams]] — Agent Teams 实现

## 相关页面

- [[skills]] — Skills 实现
- [[subagents]] — Sub-agents 实现