---
name: synthesis/orchestration-architecture
description: Command → Agent → Skill 分层编排架构详解
type: synthesis
tags: [orchestration, command, agent, skill, architecture]
created: 2026-04-27
updated: 2026-04-27
source: ../../../archive/cc-doc/Command Agent 技能模式  shanraisshanclaude-code-best-practice.md
related:
  - wiki/synthesis/agent-command-skill-comparison.md
  - wiki/guides/commands.md
  - wiki/entities/claude-subagents.md
  - wiki/guides/skills.md
---

# 编排架构：Command → Agent → Skill 分层模式

Claude Code 提供了三种可组合的扩展机制 —— **Commands**、**Agents** 和 **Skills** —— 它们可以分层组合成一个统一的编排架构。

## 三大机制概览

每种机制在编排栈中占据不同的角色：

| 维度 | Command | Agent | Skill |
| --- | --- | --- | --- |
| **执行上下文** | 内联（共享主对话） | 隔离的子 Agent 进程 | 默认内联；设置 `isolation` 以隔离 |
| **用户可调用** | 始终可以 —— 通过 `/` | 永远不行 —— 无菜单项 | 默认可以；设置 `userInvokable: false` 将其隐藏 |
| **Claude 自动调用** | 永远不行 | 是 —— 通过 `suggestedTools` 字段 | 是 —— 通过 `modelRequests` 字段；设置 `autoInvoke: false` 以阻止 |
| **参数处理** | `argument`/`options`/`interactive` | 通过 Agent 工具上的 `prefill` 参数 | `argument`/`options`/`interactive` |
| **动态上下文注入** | 是 —— `prefill` 块 | 否 | 是 —— `prefill` 块 |
| **可预加载 Skill** | 否 | 是 —— `preload` 前置数据 | 否 |
| **工具限制** | `allowedTools` | `allowedTools`/`deniedTools` | - |
| **持久化记忆** | 否 | 是 —— `memory` 前置数据 | 否 |
| **MCP 服务器** | 否 | 是 —— `mcpServers` 前置数据 | 否 |
| **Hooks** | 否 | 是 —— `hooks` 前置数据 | 是 —— `preload.hooks` |

## 分层编排模式

典型的模式是将这三种机制串联成一个有向流水线： **Command → Agent → Skill** 。

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Command    │────▶│   Agent     │────▶│   Skill     │
│  入口点      │     │  数据获取    │     │  渲染输出    │
└─────────────┘     └─────────────┘     └─────────────┘
     用户触发           隔离执行           内联处理
```

### 各层职责

| 层级 | 职责 | 示例 |
| --- | --- | --- |
| **Command** | 编排用户交互，进行委托 | `/weather-orchestrator` — 协调工作流 |
| **Agent** | 在隔离上下文中获取数据 | `weather-agent` — 从 API 获取温度 |
| **Skill** | 渲染输出、处理结果 | `weather-svg-creator` — 生成 SVG 图表 |

这种分离意味着你可以独立替换任何一层 —— 例如用 JSON 导出器替换 SVG Skill，而无需触碰其他部分。

## 决策框架

选择机制时考虑三个问题：

### 1. 当你需要用户发起的工作流入口点时 → 使用 Command

Command 永远不会被自动调用 —— 它们严格存在于 `/` 前缀之后。这使得它们非常适合编排多步骤工作流，用户需要显式选择加入。

```javascript
// weather-orchestrator.md 的一部分
argument: "location"      // 用户必须提供位置
options: ["Celsius", "Fahrenheit"]  // 选择温度单位
allowedTools: ["AskUserQuestion", "Agent", "Skill"]  // 限制委托
```

### 2. 当任务需要自主执行且需要上下文隔离时 → 使用 Agent

Agent 在自己的上下文窗口中运行，它们的探索和工具使用不会污染主对话。

```javascript
// weather-agent.md 的一部分
preload:
  - type: "skill"
    name: "weather-fetcher"           // 预加载领域知识
  - type: "memory"
    path: "weather-readings.json"     // 持久化记忆
allowedTools: ["Read", "WebFetch"]    // 工具限制
```

### 3. 当你需要可复用、可自动调用的流程时 → 使用 Skill

Skill 是最通用的机制，Claude 会将其 `modelRequests` 与用户意图进行匹配。

| 模式 | 示例 | 调用方式 | 可见性 |
| --- | --- | --- | --- |
| **Direct skill** | `time-skill` | 通过 Command 中的 `Skill` 调用 | 出现在 `/skills` 菜单中 |
| **Agent skill** | `weather-fetcher` | 通过 `preload` 预加载到 Agent 中 | 隐藏（无菜单） |

## 自动调用优先级

Claude 解析使用哪种机制遵循基于**权重**的优先级：

```
用户请求
    │
    ▼
┌─────────────┐  Skill 优先 ── 内联运行，零上下文开销
│ Skill 匹配   │
└─────────────┘
    │ (若 skill 不可用)
    ▼
┌─────────────┐  Agent 其次 ── 隔离上下文， heavier
│ Agent 匹配   │
└─────────────┘
    │ (仅用户显式输入)
    ▼
┌─────────────┐  Command 永不自动 ── 严格 `/` 触发
│ Command     │
└─────────────┘
```

1. **Skill 优先** —— 以零上下文开销内联运行
2. **Agent 其次** —— 当 Skill 不可用或任务需要自主性时
3. **Command 永不自动** —— 仅在用户显式输入 `/` 时触发

## 上下文隔离策略

| 策略 | 机制 | 适用场景 |
| --- | --- | --- |
| **内联（共享）** | Command、Skill（默认） | 轻量级任务、渲染、格式化 |
| **隔离（独立窗口）** | Agent（始终） | 数据获取、探索、自主工作 |
| **分支（按需）** | 带 `isolation` 的 Skill | 繁重转换任务 |

Agent 始终在其自己的上下文窗口中运行。返回的数据必须通过 Agent 工具的响应显式传回。

## 构建自定义编排流水线

### 1. 设计 Command（入口点）

- 创建 `.claude/commands/xxx.md`
- 使用受限的 `allowedTools` 强制执行委托
- 包含**执行契约**，明确列出被禁止的操作和顺序依赖关系

### 2. 构建 Agent（数据层）

- 创建 `.claude/agents/xxx.md`
- 预加载 Skill 以获取领域知识
- 设置 `maxRoundSteps` 防止失控循环
- Agent 指令应专注于获取和返回**结构化数据**，不是写入输出文件

### 3. 创建 Skills（知识 + 渲染）

- **Agent skills**（预加载）：设置 `userInvokable: false` —— 作为领域知识注入
- **Direct skills**（调用）：设置 `userInvokable: true` —— 出现在菜单中

## 关键设计原则

1. **每层单一职责** — Command 编排，Agent 获取，Skill 渲染
2. **通过 Skill 预加载实现渐进式呈现** — Agent 通过预加载的 Skill 接收领域知识
3. **失效安全护栏** — 每个步骤在继续之前应验证其输入
4. **模型差异化** — 使用 Haiku 进行编排和渲染，使用 Sonnet 进行推理

## 相关页面

- [[agent-command-skill-comparison]] — Agent vs Command vs Skill 对比
- [[commands]] — Slash Commands 完整指南
- [[claude-subagents]] — Subagent 配置与最佳实践
- [[skills]] — Skills 系统指南

---

*来源：[zread.ai - Command Agent 技能模式](https://zread.ai/shanraisshan/claude-code-best-practice/8-command-agent-skill-pattern)*