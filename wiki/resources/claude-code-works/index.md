---
name: claude-code-works-index
description: How Claude Code Works 专题文档索引 - 15 篇深入解读 Claude Code 源码架构的文档
type: guide
tags: [claude-code, ai-agent, source-code-analysis, architecture, typescript]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/claude-code-works/docs/
github_url: https://github.com/Windy3f3f3f3f/how-claude-code-works
online_docs: https://windy3f3f3f3f.github.io/how-claude-code-works
---

# How Claude Code Works — 专题文档索引

> [!info] 项目介绍
> **How Claude Code Works** 深入解读当前最成功的 AI 编程 Agent 的源码架构。通过 Claude Code 与开发者协作，从 50 万行 TypeScript 源码中提炼出 **15 篇专题文档**。

## 📚 文档总览

| # | 专题 | 章节数 | 大小 | 核心内容 |
|---|------|--------|------|----------|
| 01 | [[01-overview]] | 7 节 | 35KB | 技术栈、6 条核心设计原则、9 阶段启动流程 |
| 02 | [[02-agent-loop]] | 5 节 | 27KB | Agent 循环双层架构、7 种故障恢复、工具预执行 |
| 03 | [[03-context-engineering]] | 6 节 | 69KB | 4 级压缩流水线、自动恢复机制、提示词缓存 |
| 04 | [[04-tool-system]] | 6 节 | 61KB | 66 个工具注册与并发、MCP 7 种传输 |
| 05 | [[05-code-editing-strategy]] | 4 节 | 46KB | search-and-replace、唯一性约束、抗幻觉设计 |
| 06 | [[06-hooks-extensibility]] | 5 节 | 52KB | 23+ Hook 事件、5 种 Hook 类型、6 阶段管道 |
| 07 | [[07-multi-agent]] | 5 节 | 56KB | 子 Agent 4 种模式、Worktree 隔离、Swarm 通信 |
| 08 | [[08-memory-system]] | 5 节 | 37KB | 4 种记忆类型、语义召回、团队记忆 |
| 09 | [[09-skills-system]] | 4 节 | 27KB | 6 层优先级、懒加载、白名单权限 |
| 10 | [[10-plan-mode]] | 5 节 | 25KB | 5 阶段工作流、附件节流、审批与恢复 |
| 11 | [[11-permission-security]] | 6 节 | 52KB | 5 层纵深防御、tree-sitter AST 23 项检查 |
| 12 | [[12-user-experience]] | 5 节 | 50KB | Ink 渲染器、Yoga Flexbox、虚拟滚动、Vim 模式 |
| 13 | [[13-minimal-components]] | 6 节 | 59KB | 7 个最小组件、从 500 行到 50 万行演进 |
| 14 | [[14-system-prompt-design]] | 8 节 | 223KB | 7 层递进架构、反模式接种、7 条设计原则 |
| 15 | [[15-task-system]] | 5 节 | 24KB | 文件级存储、三层变更检测、多 Agent 协调 |

## 🎯 按主题分类

### 核心架构

| 文档 | 说明 |
|------|------|
| [01-概述](./01-overview.md) | 技术选型、核心设计原则 |
| [02-主循环](./02-agent-loop.md) | Agent Loop 双层架构 |
| [13-最小组件](./13-minimal-components.md) | 7 个核心组件 |

### 上下文与记忆

| 文档 | 说明 |
|------|------|
| [03-上下文工程](./03-context-engineering.md) | 4 级压缩、渐进式压缩 |
| [08-记忆系统](./08-memory-system.md) | 语义召回、团队记忆 |

### 工具与安全

| 文档 | 说明 |
|------|------|
| [04-工具系统](./04-tool-system.md) | 66 工具注册、MCP 协议 |
| [05-代码编辑](./05-code-editing-strategy.md) | Search-and-replace 策略 |
| [11-权限安全](./11-permission-security.md) | 5 层防御、AST 分析 |

### 扩展与协作

| 文档 | 说明 |
|------|------|
| [06-Hooks](./06-hooks-extensibility.md) | Hook 系统、权限请求 |
| [07-多Agent](./07-multi-agent.md) | 协作模式、Worktree |
| [09-技能系统](./09-skills-system.md) | 技能加载、Token 预算 |

### 用户体验

| 文档 | 说明 |
|------|------|
| [10-Plan模式](./10-plan-mode.md) | 规划工作流 |
| [12-用户体验](./12-user-experience.md) | 渲染器、布局、Vim |
| [14-提示词设计](./14-system-prompt-design.md) | 提示词架构 |
| [15-任务管理](./15-task-system.md) | 任务协调 |

## 📊 文档统计

| 指标 | 数值 |
|------|------|
| **总文档数** | 15 篇 |
| **总大小** | ~860 KB |
| **最大文档** | 14-系统提示词设计 (223KB) |
| **最小文档** | 15-任务管理 (24KB) |
| **平均大小** | ~57 KB |

## 🚀 阅读路线图

### 快速入门（30 分钟）

```
1. 01-概述（必读）→ 10 分钟
2. 02-主循环（必读）→ 10 分钟
3. 03-上下文工程（选读）→ 10 分钟
```

### 核心原理（2 小时）

```
1. 01-概述 → 10 分钟
2. 02-主循环 → 20 分钟
3. 03-上下文工程 → 30 分钟
4. 04-工具系统 → 25 分钟
5. 11-权限安全 → 25 分钟
```

### 深度定制（4 小时）

```
1. 01-概述 → 10 分钟
2. 02-主循环 → 20 分钟
3. 06-Hooks → 30 分钟
4. 07-多Agent → 30 分钟
5. 08-记忆系统 → 25 分钟
6. 09-技能系统 → 20 分钟
7. 10-Plan模式 → 25 分钟
8. 13-最小组件 → 40 分钟
```

### 自建 Agent（8 小时）

```
通读全部 15 篇文档
+ 配套项目 claude-code-from-scratch
```

## 🔗 相关资源

| 资源 | 链接 |
|------|------|
| **GitHub 仓库** | [Windy3f3f3f3f/how-claude-code-works](https://github.com/Windy3f3f3f3f/how-claude-code-works) |
| **在线文档** | [windy3f3f3f3f.github.io](https://windy3f3f3f3f.github.io/how-claude-code-works) |
| **配套项目** | [claude-code-from-scratch](https://github.com/Windy3f3f3f3f/claude-code-from-scratch) |

## 📝 文档归档

所有专题文档已归档到：
- **源文档目录**：`archive/resources/claude-code-works/docs/`
- **归档时间**：2026-05-05
- **总大小**：~860 KB

---

*最后更新: 2026-05-05*
*来源: [How Claude Code Works](https://github.com/Windy3f3f3f3f/how-claude-code-works)*
