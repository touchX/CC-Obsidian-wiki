---
name: agent-architecture
description: AI Agent 系统架构模式综合分析
type: synthesis
tags: [architecture, agent, system-design]
created: 2026-04-23
updated: 2026-04-23
sources: 5
---

# Agent 系统架构

综合多个来源，分析 AI Agent 的核心架构模式。

## 核心组件

```
┌──────────────────────────────────────────────────┐
│                   Agent                          │
├──────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌───────────┐ │
│  │   Planner   │  │    Tool      │  │   Memory  │ │
│  │             │  │    Set       │  │           │ │
│  │ - Reasoning │  │ - File Ops   │  │ - Context │ │
│  │ - Planning  │  │ - Bash      │  │ - Wiki    │ │
│  │ - Decompose │  │ - Search    │  │ - memU    │ │
│  └─────────────┘  └─────────────┘  └───────────┘ │
├──────────────────────────────────────────────────┤
│              Harness (测试框架)                   │
│  - Test Cases  - Evaluator  - Runner  - Reporter │
└──────────────────────────────────────────────────┘
```

## 关键设计模式

### 1. 上下文分层

| 层 | 持久性 | 用途 |
|---|--------|------|
| CLAUDE.md | 永久 | 核心规则 |
| Wiki | 半永久 | 知识积累 |
| 会话 | 临时 | 当前任务 |
| memU | 长期 | 跨会话记忆 |

### 2. 工具生态

```
Claude Code
├── 内置工具 (Read/Edit/Bash/Git)
├── Skills (可扩展行为)
├── MCP 服务器 (外部集成)
├── Subagents (子代理)
└── Hooks (生命周期钩子)
```

### 3. 测试策略

根据 [[concepts/agent-harness]]：
- **Harness** 提供可重复的测试环境
- **Test Cases** 定义输入/期望输出
- **Evaluator** 判断输出质量
- **Runner** 批量执行测试

## 架构决策

### 上下文管理
- **避免最后 20%**：防止 LLM 遗忘开头内容
- **渐进压缩**：60% → 轻度，75% → 中度，85% → 强度
- **外部存储**：重要信息存 Wiki 而非会话

### 记忆系统
- **memU**：长期语义知识
- **Wiki**：半永久结构化知识
- **Claude-Mem**：近期活动追踪
- **Platform Memory**：环境信息

### 可扩展性
- **Skills**：行为模式扩展
- **MCP**：外部服务集成
- **Subagents**：任务分解执行

## 相关来源

- [[sources/karpathy-llm-wiki]] — 知识管理方法论
- [[concepts/context-window]] — 上下文限制
- [[concepts/context-management]] — 管理策略
- [[concepts/agent-harness]] — 测试框架

## 实践建议

1. **分层记忆**：根据持久性选择存储层
2. **持续测试**：用 Harness 验证 Agent 行为
3. **渐进扩展**：从简单开始，逐步增加复杂度
4. **监控上下文**：始终关注上下文使用率

## 来源

- Claude Code 官方文档
- Karpathy LLM Wiki 方法论
- 项目实战经验
- Agent 设计模式研究
- 测试框架最佳实践
