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

- [[entities/claude-commands]] — 命令参考
- [[entities/claude-skills]] — Skills 系统
- [[concepts/agent-harness]] — Agent Harness
