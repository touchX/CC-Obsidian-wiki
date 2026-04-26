---
name: entities/claude-skills
description: Skills 系统详解 — 自定义命令与自动加载规则
type: entity
tags: [skills, automation, hooks]
created: 2026-04-26
source: ../../archive/best-practice/claude-skills.md
---

# Claude Skills

Skills 是 Claude Code 的扩展系统，允许自定义 LLM 的行为模式。Skill 是一个 YAML/JSON 配置文件，定义触发条件、系统提示、工具权限和工作流。

## 核心字段

```yaml
---
name: skill-name
description: 技能描述
type: guide|concept|reference
triggers: ["/skill", "/custom"]
instruction: |
  技能执行时的指令模板
---
```

## Skill 类型

| 类型 | 用途 | 示例 |
|------|------|------|
| Global | 全局生效 | 代码审查 skill |
| Project | 项目专用 | 特定框架规范 |
| Agent | Agent 专用 | 子代理配置 |

## 内置 Skills

| Skill | 触发 | 功能 |
|-------|------|------|
| tdd-guide | 自动检测 | TDD 工作流引导 |
| code-reviewer | 代码变更后 | 自动化审查 |
| brainstorming | `/brainstorm` | 头脑风暴模式 |

## 相关页面

- [[entities/claude-commands]] — 命令系统
- [[entities/claude-subagents]] — 子代理系统
- [[concepts/claude-memory]] — 上下文管理