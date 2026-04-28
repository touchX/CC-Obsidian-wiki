---
name: synthesis/agent-command-skill-comparison
description: Agent/Command/Skill 三种扩展机制对比 — 何时使用哪种
type: synthesis
tags: [agents, commands, skills, architecture]
created: 2026-04-10
updated: 2026-04-26
source: ../../archive/reports/claude-agent-command-skill.md
---

# Agents vs Commands vs Skills

三种扩展机制的核心差异：Agent 是独立上下文的有状态进程，Command 是触发后执行返回的同步函数，Skill 是注入子代理上下文的知识片段。按需选择：需要推理 → Agent；需要快捷调用 → Command；需要知识注入 → Skill。

## 相关页面

- [[claude-commands]] — 命令参考
- [[claude-skills]] — Skills 系统
- [[agent-harness]] — Agent Harness

---

## 调用关系解析

### 核心关系矩阵

| 关系对 | 方向 | 说明 |
|--------|------|------|
| **Command ↔ Agent** | 双向 | 互相触发/编排 |
| **Agent → Skill** | 单向 | Agent 调用 Skill |
| **Command → Skill** | 单向 | Command 可触发 Skill |

### 调用关系图解

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

### 核心结论

1. **Agent ↔ Command**：双向调用关系
2. **Agent → Skill**：单向调用关系（Skill 不能调用 Agent）
3. **Skill 是 Agent 的属性**，Agent 自主决定使用哪个 Skill

### Skill 与 Agent 的关系类比

> 工具箱 (Agent) 决定用哪把螺丝刀
> 螺丝刀 (Skill) 不知道自己在被用

### 循环调用风险

Command → Agent → Command → Agent ... 可能形成循环
**解决方案**：设计时避免循环，或通过 flags 标记执行深度

### 详细字段对比

| 字段 | Agent | Command | Skill |
|------|:-----:|:-------:|:-----:|
| name | ✅ | ❌ | ✅ |
| description | ✅ | ✅ | ✅ |
| model | ✅ | ✅ | ❌ |
| allowedTools | ✅ | ✅ | ❌ |
| skills | ✅ | ❌ | ❌ |
| memory | ✅ | ❌ | ❌ |
| hooks | ✅ | ❌ | ❌ |
| mcpServers | ✅ | ❌ | ❌ |
| maxTurns | ✅ | ❌ | ❌ |
| permissionMode | ✅ | ❌ | ❌ |
| color | ✅ | ❌ | ❌ |
| user-invocable | ❌ | ❌ | ✅ |

详细规格见：[[agent-command-skill-fields]]
