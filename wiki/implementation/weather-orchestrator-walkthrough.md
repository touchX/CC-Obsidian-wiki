---
name: implementation/weather-orchestrator-walkthrough
description: Command → Agent → Skill 编排工作流实战演练
type: guide
tags: [orchestration, command, agent, skill, workflow, weather]
created: 2026-04-27
updated: 2026-04-29
source: ../../archive/cc-doc/天气编排器实战演练  shanraisshanclaude-code-best-practice.md
---

# Weather Orchestrator 实战演练

Command → Agent → Skill 编排工作流引导式演练 —— 完全基于 Claude Code 原生扩展原语构建的天气数据获取与 SVG 渲染系统。

## 架构概览

天气系统演示了 **两种不同的技能模式** 在编排流程中的协作：

```
Command (haiku)
    ↓ 委托
Agent (sonnet) + 预加载 Skill (weather-fetcher)
    ↓ 获取数据
Standalone Skill (weather-svg-creator)
    ↓ 生成产物
SVG 卡片 + Markdown 摘要
```

## 组件清单

| 组件 | 类型 | 模型 | 用途 |
|------|------|------|------|
| /weather-orchestrator | Command | haiku | 编排完整工作流，处理用户交互 |
| weather-agent | Agent | sonnet | 通过预加载技能获取温度数据 |
| weather-fetcher | Agent Skill | — | Open-Meteo API 调用的预加载指令 |
| weather-svg-creator | Standalone Skill | — | 创建 SVG 卡片和 markdown 摘要 |

## 三步执行流程

### 步骤 1 — 收集用户偏好

命令通过 `AskUserQuestion` 工具要求用户选择温度单位（Celsius/Fahrenheit）。用户的选择成为传递给 Agent 的**必需输入参数**。

命令的 frontmatter 明确限制工具访问权限为仅 `AskUserQuestion`、`Agent` 和 `Skill`，防止其直接调用 API 或写入文件。

### 步骤 2 — 带预加载技能的 Agent 委托

命令使用 `Agent` 工具调用 `weather-agent`，并在提示词中传递用户的单位偏好。

**预加载技能模式**：启动时，Claude Code 自动将 `weather-fetcher` 技能的完整内容作为领域知识注入到 Agent 的上下文中。Agent 无需发现或调用此技能 —— 它只需遵循已经存在的指令。

Agent 使用 `WebFetch` 调用 Open-Meteo API（迪拜坐标），提取温度值，返回给命令。

### 步骤 3 — 独立技能调用

温度数据存在于命令的对话上下文中，命令通过 `Skill` 工具调用 `weather-svg-creator`。此技能**在命令的上下文中独立运行**，从对话中读取温度值，生成 SVG 卡片和 markdown 摘要。

**失效安全防护机制**：如果 Agent 没有返回有效的数字温度，则禁止进入步骤 3。

## 两种技能模式对比

| 维度 | Agent 技能（预加载） | 独立技能（调用） |
|------|---------------------|-----------------|
| **加载机制** | Agent frontmatter 的 `skills` 字段 | 来自命令/Agent 的 `Skill` 工具调用 |
| **内容加载时机** | Agent 启动时（注入上下文） | 调用时（隔离任务运行） |
| **调用模型** | 从不显式调用 —— 遵循预加载指令 | 通过 `Skill` 显式调用 |
| **执行上下文** | 在 Agent 自身的上下文内 | 在调用者的上下文中 |
| **visibility** | 通常 hidden（`true`） | 通常可见 |
| **适用场景** | Agent 整个生命周期需要的领域知识 | 渲染、格式化、生成产物等一次性任务 |

## 设计原则

1. **命令作为编排器，而非执行者** — 命令委托一切，只负责协调，使模型保持轻量
2. **预加载技能用于领域知识** — API URL、字段路径、数据格式等通过 frontmatter 预加载
3. **独立技能用于生成产物** — 使用 `Skill` 工具调用一次性能力
4. **通过 allowedTools 进行能力范围界定** — 在配置级别限制每个组件的操作
5. **失效安全防护机制** — 定义明确的失败条件并停止流水线

## Agent 配置关键字段

| Frontmatter 字段 | 值 | 用途 |
|------------------|-----|------|
| `model` | sonnet | 更强大的模型用于可靠 JSON 解析 |
| `maxTurns` | 5 | 限制自主循环次数防止失控 |
| `tools` | AutoWrite | 自动接受文件编辑 |
| `memory` | MEMORY.md | 持久化读数进行跨会话跟踪 |
| `skills` | [weather-fetcher] | 启动时预加载获取指令 |
| `hooks` | PreToolUse 等 | 在每个工具事件触发声音通知 |

## 构建自己的编排工作流

| 天气系统组件 | 你的系统 | 核心问题 |
|--------------|----------|----------|
| /weather-orchestrator | 你的命令 | 面向用户的入口点是什么？需要哪些工具？ |
| weather-agent | 你的数据 Agent | 需要什么外部数据？哪个模型足够？ |
| weather-fetcher（预加载） | 你的领域技能 | Agent 需要遵循什么指令？API 规格？ |
| weather-svg-creator（调用） | 你的输出技能 | 工作流应产生什么产物？ |

## 相关 Wiki 页面

- [[implementation/subagent-best-practices]] — Subagent 配置和最佳实践
- [[implementation/skill-design-principles]] — Skill 设计原则
- [[entities/claude-commands]] — 斜杠命令系统
- [[entities/claude-subagents]] — Subagent 系统
