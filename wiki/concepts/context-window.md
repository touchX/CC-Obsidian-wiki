---
name: context-window
description: 上下文窗口原理与管理策略
type: concept
tags: [fundamentals, llm, optimization]
created: 2026-04-23
updated: 2026-04-23
sources: 2
---

# Context Window (上下文窗口)

## 定义

上下文窗口是 LLM 在单次请求中能处理的令牌数量限制。它包括：
- **输入上下文**：系统提示、用户输入、工具结果
- **输出上下文**：模型生成的响应

## 核心约束

| 模型 | 上下文窗口 | 有效使用区 |
|------|----------|-----------|
| Haiku | 200K | 前 80% |
| Sonnet | 200K | 前 80% |
| Opus | 200K | 前 80% |

## 关键原则

### 1. 避免最后 20%

当上下文超过 80% 时，LLM 容易遗忘开头内容。应该：
- 预留缓冲空间
- 及时压缩/摘要
- 使用外部记忆系统

### 2. 上下文分层

```
高价值信息（始终加载）
├── CLAUDE.md 核心指令
├── 当前任务目标
└── 最近发现

可变上下文
├── 相关代码文件
├── 工具输出
└── 对话历史
```

### 3. 压缩时机

当上下文接近 60-70% 时触发压缩：
- 摘要长对话
- 提取关键信息到外部文件
- 使用 `/compact` 命令

## 压缩行为 (Compaction)

当长时间会话压缩时，各机制存活情况：

| 机制 | 压缩后状态 |
|------|-----------|
| System prompt 和 output style | 不变（不在消息历史中） |
| 项目根目录 CLAUDE.md 和无作用域规则 | 从磁盘重新注入 |
| 自动内存 | 从磁盘重新注入 |
| 带 `paths:` 的规则 | 丢失，直到匹配文件被读取 |
| 子目录中的嵌套 CLAUDE.md | 丢失，直到该子目录文件被读取 |
| 调用的 skill 内容 | 重新注入，每个 skill 上限 5000 tokens，总计 25000 tokens |

> **提示**：将最重要的指令放在 `SKILL.md` 顶部，因为大型 skills 会被截断保留开头部分。

## 上下文窗口交互式演练

官方提供交互式模拟，展示会话过程中上下文如何填充：

- **启动时加载**：CLAUDE.md、自动内存、MCP 工具名称、skill 描述
- **工作过程中**：每次文件读取添加到上下文，路径作用域规则自动加载
- **使用 `/context`**：查看实际上下文使用情况及优化建议
- **使用 `/memory`**：检查启动时加载了哪些 CLAUDE.md 和自动内存文件

## 相关概念

- [[concepts/context-management]] — 上下文管理策略
- [[wiki/entities/claude-code]] — Claude Code 的上下文处理
- [[synthesis/agent-architecture]] — Agent 架构中的上下文设计

## 实践建议

1. **监控上下文使用** — 注意 IDE 显示的百分比
2. **分散大任务** — 分解为小步骤
3. **使用外部存储** — 重要信息存到 Wiki
4. **定期压缩** — 不要等到接近满
5. **使用 Subagents** — 将大型研究任务委托给独立上下文窗口

## 来源

- [Explore the context window](https://code.claude.com/docs/zh-CN/context-window) — 官方交互式教程
- 项目实战经验总结
