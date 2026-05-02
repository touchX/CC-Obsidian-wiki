---
name: guides/skills
description: Skills 实现指南 — Agent Skills vs 直接调用 Skills
type: guide
tags: [skills, implementation, invocation]
created: 2026-04-26
updated: 2026-05-01
source: ../../archive/implementation/claude-skills-implementation.md
---

# Skills Implementation

Skills 是 **Command → Agent → Skill** 架构模式的最后一步。本项目实现了两种不同的 skill 调用模式：**agent skills**（预加载）和 **skills**（直接调用）。

## 两种 Skill 模式

### Agent Skills（预加载）

通过 `skills` 字段预加载到 agent：
```yaml
# weather-agent.md
skills:
  - weather-fetcher
```
自动加载，无需手动调用。

### Skills（直接调用）

通过 Skill 工具直接调用：
```typescript
Skill tool → skill: weather-svg-creator
```
需要显式调用，接收调用方传递的数据。

## 示例

| Skill | 类型 | 用途 |
|-------|------|------|
| weather-fetcher | Agent Skill | 预加载，从 Open-Meteo 获取温度 |
| weather-svg-creator | Skill | 直接调用，创建 SVG 天气卡片 |

## 交叉引用

- [[claude-skills]] — Skills 系统
- [[agent-command-skill-comparison]] — 三种扩展机制对比
- [[skills-discovery-mono-repos]] — 大型 Monorepo 中的发现机制

## 相关页面

- [[commands]] — Commands 实现
- [[subagents]] — Sub-agents 实现