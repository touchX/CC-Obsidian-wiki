---
name: implementation/skills-implementation
description: Skills 系统实现详解 — Agent Skills 与 Skills 两种调用模式
type: implementation
tags: [implementation, skills, agent-skills, invocation-patterns]
created: 2026-03-02
---

# Skills Implementation

> Skills 展示了两种调用模式——Agent Skills（预加载）和 Skills（直接调用）。Weather SVG Creator 技能演示了 Command → Agent → Skill 架构模式中的 Skill 层实现。

## 两种调用模式

| 模式 | 调用方式 | 示例 | 特点 |
|------|----------|------|------|
| **Skill** | `Skill(skill: "name")` | `weather-svg-creator` | 通过 Skill 工具直接调用 |
| **Agent Skill** | `skills:` 字段预加载 | `weather-fetcher` | 启动时注入 agent 上下文 |

## Weather SVG Creator (Skill)

**文件位置**: `.claude/skills/weather-svg-creator/SKILL.md`

```yaml
---
name: weather-svg-creator
description: 创建显示迪拜天气的 SVG 天气卡片
---
```

### 使用方式

```bash
$ claude
> /weather-svg-creator
```

### 工作流程

1. 接收温度数据和单位
2. 生成 SVG 天气卡片
3. 写入 `orchestration-workflow/weather.svg`
4. 更新 `orchestration-workflow/output.md`

## Weather Fetcher (Agent Skill)

**文件位置**: `.claude/skills/weather-fetcher/SKILL.md`

```yaml
---
name: weather-fetcher
description: 从 Open-Meteo API 获取迪拜天气数据
user-invocable: false
---
```

### 特点

- `user-invocable: false`：不在 `/` 命令菜单显示
- 预加载到 `weather-agent` 的上下文中
- 提供领域知识而非独立执行能力

## 相关页面

- [[wiki/entities/claude-skills]] — Skills 实体
- [[guides/skills]] — Skills 使用指南
- [[synthesis/agent-command-skill-comparison]] — Agent/Command/Skill 对比
- [[implementation/commands-implementation]] — Commands 实现
- [[implementation/subagents-implementation]] — Sub-agents 实现
