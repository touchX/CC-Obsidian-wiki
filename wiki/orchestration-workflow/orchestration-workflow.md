---
name: orchestration-workflow/orchestration-workflow
description: Command → Agent → Skill 编排工作流详解 — 天气数据获取与 SVG 渲染示例
type: guide
tags: [orchestration, commands, agents, skills, architecture, weather-agent]
created: 2026-04-26
updated: 2026-04-26
source: ../../archive/orchestration-workflow.md
---

# Orchestration Workflow

> 编排工作流展示 Command → Agent → Skill 三层架构模式。Command 作为入口协调工作流，Agent 通过预加载的 Agent Skill 获取数据，Skill 独立生成视觉输出。

## 系统概述

天气系统演示了单一编排工作流中的两种 Skill 模式：

| 模式 | 说明 | 示例 |
|------|------|------|
| **Agent Skills** | 预加载到 Agent 上下文 | `weather-fetcher` 注入 `weather-agent` |
| **Skills** | 独立调用 | `weather-svg-creator` 通过 Skill tool 调用 |

---

## 组件总览

| 组件 | 角色 | 位置 |
|------|------|------|
| **Command** | 入口点，用户交互 | `.claude/commands/weather-orchestrator.md` |
| **Agent** | 使用预加载技能获取数据 | `.claude/agents/weather-agent.md` + `weather-fetcher` skill |
| **Skill** | 独立生成输出 | `.claude/skills/weather-svg-creator/SKILL.md` |

---

## 执行流程

```
用户 → /weather-orchestrator (Command)
              ↓
         询问温度单位
              ↓
         weather-agent (Agent)
         └─ weather-fetcher (预加载技能)
              ↓
         返回温度数据
              ↓
         weather-svg-creator (Skill)
              ↓
         生成 SVG 文件
```

---

## 关键设计原则

1. **两种 Skill 模式**：Agent Skills（预加载）与 Skills（直接调用）
2. **Command 作为编排器**：处理用户交互，协调工作流
3. **Agent 负责数据获取**：使用预加载技能获取数据并返回
4. **Skill 负责输出生成**：独立运行，接收来自 Command 的数据
5. **职责分离**：Fetch（Agent）→ Render（Skill）

---

## 相关资源

- [[commands]] — Commands 使用指南
- [[skills]] — Skills 实现指南
- [[subagents]] — Sub-agents 实现指南
- [[claude-commands]] — Commands 实体
- [[claude-skills]] — Skills 实体
- [[claude-subagents]] — 子代理实体