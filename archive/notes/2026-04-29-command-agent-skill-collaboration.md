---
name: notes/2026-04-29-command-agent-skill-collaboration
description: Commands、Agents 和 Skills 三种扩展机制的协作关系
type: insight
tags: [architecture, agents, commands, skills, claude-code]
created: 2026-04-29
source: conversation
---

# Commands、Agents 和 Skills 协作关系

## 核心发现

### 三种机制的核心差异

| 维度       | Command | Agent | Skill |
| -------- | ------- | ----- | ----- |
| **本质**   | 同步函数    | 有状态进程 | 知识片段  |
| **状态**   | 无状态     | 有状态   | 无状态   |
| **上下文**  | 共享主会话   | 独立上下文 | 注入调用方 |
| **适用场景** | 快捷操作    | 复杂推理  | 知识注入  |

### 调用关系矩阵

| 关系对 | 方向 | 说明 |
|--------|------|------|
| Command ↔ Agent | 双向 | 可以互相触发、编排 |
| Agent → Skill | 单向 | Agent 调用 Skill |
| Command → Skill | 单向 | Command 可触发 Skill |

### 核心结论

1. **Command ↔ Agent**：双向调用关系，可以互相编排
2. **Agent → Skill**：单向调用关系（Skill 不能主动调用 Agent）
3. **Skill 是 Agent 的属性**：Agent 自主决定使用哪个 Skill

> 类比：工具箱决定用哪把螺丝刀，但螺丝刀不知道自己在被用

## 两种 Skill 调用模式

### Agent Skills（预加载）
```yaml
skills:
  - weather-fetcher
```
自动加载到 Agent，无需手动调用。

### Skills（直接调用）
```typescript
Skill tool → skill: weather-svg-creator
```
通过 Skill 工具显式调用。

## 设计原则

1. **避免循环**：Command → Agent → Command → Agent 可能形成死循环
2. **按需选择**：推理用 Agent，快捷用 Command，知识用 Skill
3. **渐进扩展**：从简单 Command 开始，逐步演进到 Agent

## 实际应用示例

| 场景 | 使用的机制 | 原因 |
|------|------------|------|
| /plan 进入规划模式 | Command | 需要快捷调用 |
| 复杂任务分解 | Agent | 需要推理能力 |
| 获取天气数据 | Skill | 需要知识注入 |
| 天气 Agent + weather-fetcher | Agent + Skill | 组合使用 |

## 相关 Wiki 页面

- [[agent-command-skill-comparison]] — 三种扩展机制对比
- [[agent-architecture]] — Agent 系统架构
- [[skills]] — Skills 实现指南
