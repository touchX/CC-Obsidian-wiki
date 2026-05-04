---
name: agent-skill-architecture
description: Agent/Skill 架构的通才与专才设计模式
type: synthesis
tags: [agents, skills, architecture, design-pattern]
created: 2026-05-02
updated: 2026-05-04
source: ../../../archive/notes/2026-05-02-agent-skill-architecture-insight.md
---

# Agent/Skill 架构的通才与专才设计模式

## 核心发现

### 外层 Agent = 通才（多面手）
- 负责决策"做什么"
- 能处理各种不同的任务和流程
- 可以调用各种不同的 Skill
- 需要理解整体任务，协调多个子任务

### Skill = 专才（专家）
- 专注于单一领域的执行
- 内部 Agent 只为该 Skill 的特定任务服务
- 在有限范围内决定"怎么做"
- 不需要知道外部任务的全貌

## 架构模式图解

```
外层 Agent (通才)
  任务: "分析代码库并生成文档"

  决策链:
  1. "需要先理解代码结构" → 调用 code-explainer-skill
  2. "需要分析依赖关系" → 调用 dependency-skill
  3. "需要生成文档" → 调用 doc-generator-skill

        ↓              ↓              ↓
    Skill A        Skill B        Skill C
  code-explainer  dependency   doc-generator
```

## Skill 内部 Agent 的决策范围

### 只在该 Skill 定义范围内做决定

| Skill | 内部决策范围 | 决策外的内容 |
|-------|-------------|--------------|
| weather-fetcher | 用哪个 API、如何解析数据 | ❌ 不关心最终显示 |
| svg-creator | SVG 格式、颜色、布局 | ❌ 不关心数据来源 |
| doc-generator | Markdown 还是 HTML、图表类型 | ❌ 不关心文档用途 |

## 决策与执行的区别

### 决策者 (Decision Maker)
- "我应该获取天气数据吗？"
- "我应该调用 Open-Meteo 还是 WeatherAPI？"
- "这次失败了，我应该重试吗？"
- ← **Agent 的职责**

### 执行者 (Executor)
- "好的，我需要执行获取天气的指令"
- "调用 fetch(url)..."
- "解析返回的 JSON..."
- ← **Skill 内部 Agent 的职责**（在 Skill 定义范围内）

## 专业化分工的好处

| 层级 | 能力 | 关注点 |
|------|------|--------|
| **外层 Agent** | 通才 + 编排 | 整体流程、任务协调 |
| **Skill** | 专才 + 执行 | 特定领域、渠道选择 |

## 核心理解

1. **外层 Agent** = 通才，负责"做什么"
2. **Skill** = 专才，负责"怎么做"
3. **Skill 内 Agent** = 专才的"执行引擎"，只在 Skill 定义的范围内做决定
4. **决策权**始终在调用者（外层 Agent/Command）手中

## 相关 Wiki 页面

- [[agent-command-skill-comparison]] — 三种扩展机制对比
- [[commands]] — Commands 实现指南
- [[subagents]] — Subagents 实现
- [[agent-teams]] — Agent Teams 实现
