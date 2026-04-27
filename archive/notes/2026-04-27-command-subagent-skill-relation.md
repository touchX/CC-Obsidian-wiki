---
name: notes/2026-04-27-command-subagent-skill-relation
description: Command/Subagent/Skill 调用关系解析
type: insight
tags: [commands, subagents, skills, architecture, session]
created: 2026-04-27
source: conversation
---

# Command / Subagent / Skill 调用关系

## 调用关系矩阵

| 关系对 | 方向 | 说明 |
|--------|------|------|
| **Command ↔ Agent** | 双向 | 互相触发/编排 |
| **Agent → Skill** | 单向 | Agent 调用 Skill |
| **Command → Skill** | 单向 | Command 可触发 Skill |

## 核心结论

1. **Agent ↔ Command**: 双向调用关系
2. **Agent → Skill**: 单向调用关系（Skill 不能调用 Agent）
3. **Skill 是 Agent 的属性**，Agent 自主决定使用哪个 Skill

## 图解

```
Command ──── 触发 ───→ Agent
    ↑                      │
    │                      │
    └──── 调用 ────────────┘
              ↓
         Agent
         ├── skills: [weather-fetcher]
         ├── 自主决定是否调用 Skill
         └── Skill 不能主动调用 Agent
```

## Key Insights

### 1. Command 是触发器也是执行器
- 可以触发 Agent
- 可以被 Agent 调用
- 典型场景：`/weather-orchestrator` 调用 `weather-agent`

### 2. Skill 是被动知识模块
- **不是**执行主体
- **不能**主动调用 Agent 或 Command
- 可以**引导** Agent 自主选择调用
- 本质是**指令文本**，告诉 Agent「做什么」和「用什么」

### 3. Agent 是执行主体
- 有状态、持有上下文
- 自主决定使用哪个 Skill
- 可被 Command 编排或调用其他 Command

## Skill 与 Agent 的关系类比

> 工具箱 (Agent) 决定用哪把螺丝刀
> 螺丝刀 (Skill) 不知道自己在被用

## 循环调用风险

Command → Agent → Command → Agent ... 可能形成循环
**解决方案**：设计时避免循环，或通过 flags 标记执行深度

## 相关 Wiki 页面
- [[synthesis/agent-command-skill-comparison]]
- [[implementation/commands-implementation]]
- [[implementation/subagents-implementation]]
- [[implementation/skills-implementation]]