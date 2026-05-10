---
name: windy3f3f3f3f-how-claude-code-works
description: How Claude Code Works — 深入解读 Claude Code 50 万行源码的 15 篇专题文档
type: source
tags: [github, typescript, claude-code, ai-agent, source-code-analysis, architecture, context-engineering]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/windy3f3f3f3f-how-claude-code-works-2026-05-05.json
stars: Active community
language: TypeScript
license: MIT
github_url: https://github.com/Windy3f3f3f3f/how-claude-code-works
---

# How Claude Code Works

> [!info] Repository Overview
> **How Claude Code Works** 是一个深入解读当前最成功的 AI 编程 Agent 源码架构的项目。通过 Claude Code 与开发者协作，从 50 万行 TypeScript 源码中提炼出 **15 篇专题文档**，覆盖了从核心循环到安全防护的每一个关键设计决策。

## 📊 仓库统计

| 指标 | 数值 |
|------|------|
| ⭐ Stars | Active community |
| 🍴 Forks | 活跃社区 |
| 💻 语言 | TypeScript |
| 📄 许可证 | MIT |
| 🔗 链接 | [github.com/.../how-claude-code-works](https://github.com/Windy3f3f3f3f/how-claude-code-works) |
| 🌐 在线文档 | [windy3f3f3f3f.github.io](https://windy3f3f3f3f.github.io/how-claude-code-works) |
| 📅 类型 | 源码分析文档 |
| 🔧 配套项目 | [claude-code-from-scratch](https://github.com/Windy3f3f3f3f/claude-code-from-scratch) |

## 🎯 项目介绍

### 核心定位

Claude Code 是目前使用最广泛的 AI 编程 Agent，也是被认为最好用的 AI 编程工具。它能理解整个代码仓库、自主执行多步编程任务、安全地运行命令——而这一切背后是 **50 万行 TypeScript 源码**中沉淀的工程智慧。

这个项目解决了"50 万行代码，从哪里开始读？"的问题——通过和 Claude Code 一起读，让它写文档配合理解源代码。

### 解决的问题

| 问题 | Claude Code 的解决方案 |
|------|---------------------|
| 对话上百万 token，上下文不够 | 记忆管理、4 级压缩方案设计 |
| 66 个内置工具如何协调 | 统一接口规范、自动并发控制 |
| 如何让用户感觉"快" | 全链路流式、工具预执行、9 阶段并行启动 |
| 如何防止危险操作 | 5 层纵深防御体系 |

## 🏗️ 系统架构

```
用户输入 → QueryEngine 会话管理 → query 主循环
                                      ↓
                            ┌─────────┴─────────┐
                            ↓                   ↓
                       文本响应              工具调用
                            ↓                   ↓
                       流式输出         工具执行引擎
                                              ↓
                      ┌────────────────────────┼────────────────────────┐
                      ↓                        ↓                        ↓
                 读文件                    编辑文件                  Shell 执行
                      ↓                        ↓                        ↓
                 搜索工具                  MCP 工具                  ...
                                              ↓
                                        结果回注 → 主循环
```

## 🔍 关键设计发现

### 1. 为什么感觉那么快？

Claude Code 做了三件聪明的事：

| 优化 | 说明 |
|------|------|
| **全链路流式输出** | 不是等模型全部想完再显示，而是每生成一个 token 就立刻展示 |
| **工具预执行** | 模型说要读文件时，文件已经在读了。利用模型生成的 5-30 秒窗口，把约 1 秒的延迟藏起来 |
| **9 阶段并行启动** | 把不相关的初始化任务并行执行，关键路径压到约 235ms |

### 2. 出错了怎么办？— 静默恢复

普通程序遇到错误会报错给用户。Claude Code 的策略是：**能恢复的错误，用户根本看不到。**

- 对话太长超出上下文窗口 → 悄悄压缩上下文、自动重试
- token 输出达到上限 → 自动从 4K 升级到 64K 再重试
- **7 种不同的"继续"策略**，每种对应一种故障恢复路径

### 3. 对话太长怎么办？— 4 级渐进式压缩

```
┌─────────────────────────────────────────────────────────┐
│                    4 级压缩流水线                        │
├─────────────────────────────────────────────────────────┤
│  Level 1: 裁剪   → 把历史消息中的大块内容（工具输出）截断 │
│  Level 2: 去重   → 几乎零成本地去除重复内容              │
│  Level 3: 折叠   → 把不活跃的对话段落折叠起来（可展开）  │
│  Level 4: 摘要   → 最后手段，启动子 Agent 对话做摘要      │
└─────────────────────────────────────────────────────────┘
```

每一级都可能释放足够的空间，让后面的级别不需要执行。**压缩后自动恢复最近编辑的 5 个文件内容**，防止模型忘记刚刚在干什么。

### 4. 怎么防止危险操作？— 5 层纵深防御

```
┌─────────────────────────────────────────────────────────┐
│                   5 层纵深防御体系                        │
├─────────────────────────────────────────────────────────┤
│  Layer 1: 权限模式    → 不同信任级别，限制可执行的操作范围 │
│  Layer 2: 规则匹配    → 基于命令模式的白名单/黑名单       │
│  Layer 3: Bash AST    → 用语法树分析命令真实意图（23项检查）│
│  Layer 4: 用户确认    → 危险操作弹出确认（200ms 防抖）    │
│  Layer 5: Hook 校验   → 自定义安全规则，动态修改工具输入   │
└─────────────────────────────────────────────────────────┘
```

### 5. 66 个工具如何协同？

所有工具遵循**同一套接口规范**：
- 第三方工具和内置工具走完全相同的执行流水线
- 只读工具自动并行执行，写操作自动串行
- 工具输出超过 100K 字符时自动落盘，模型只拿到摘要

### 6. 多个 Agent 如何协作？

三种多 Agent 模式：

| 模式 | 说明 |
|------|------|
| **子 Agent** | 主 Agent 分派任务给子 Agent，等结果返回 |
| **协调器** | 纯指挥官模式，协调器只能分配任务，**不能自己读文件、写代码** |
| **Swarm** | 多个命名 Agent 之间点对点通信，各自独立工作 |

用 Git Worktree 给每个 Agent 一份独立的代码副本，防止冲突。

## 📚 15 篇专题深入

| # | 专题 | 核心内容 |
|---|------|---------|
| 1 | [概述](./docs/01-overview.md) | 技术选型（Bun/React/Zod）、6 条核心设计原则、9 阶段 235ms 启动流程 |
| 2 | [系统主循环](./docs/02-agent-loop.md) | Agent 循环双层架构、7 种 Continue Sites 故障恢复、工具预执行 |
| 3 | [上下文工程](./docs/03-context-engineering.md) | 4 级压缩流水线完整细节、压缩后自动恢复机制 |
| 4 | [工具系统](./docs/04-tool-system.md) | 66 个工具注册与并发控制、MCP 7 种传输详解 |
| 5 | [技能系统](./docs/09-skills-system.md) | 6 层技能来源与优先级、懒加载与 Token 预算分配 |
| 6 | [记忆系统](./docs/08-memory-system.md) | 4 种记忆类型与封闭分类法、Sonnet 语义召回 |
| 7 | [Hooks 与可扩展性](./docs/06-hooks-extensibility.md) | 23+ Hook 事件全景、5 种 Hook 类型、6 阶段执行管道 |
| 8 | [多 Agent 架构](./docs/07-multi-agent.md) | 子 Agent 4 种执行模式、Worktree 隔离、Swarm 通信 |
| 9 | [Plan 模式](./docs/10-plan-mode.md) | 两条进入路径、5 阶段与迭代双工作流 |
| 10 | [代码编辑策略](./docs/05-code-editing-strategy.md) | search-and-replace 优于整文件重写、唯一性约束 |
| 11 | [任务管理系统](./docs/15-task-system.md) | 文件级存储与并发锁、三层变更检测 |
| 12 | [权限与安全](./docs/11-permission-security.md) | 5 层纵深防御、tree-sitter AST 分析 + 23 项安全检查 |
| 13 | [系统提示词设计](./docs/14-system-prompt-design.md) | 7 层递进式提示词架构、内外分层变体 |
| 14 | [用户体验设计](./docs/12-user-experience.md) | 自研 Ink 渲染器、Yoga Flexbox 布局、虚拟滚动 |
| 15 | [最小必要组件](./docs/13-minimal-components.md) | 7 个最小必要组件框架、从 500 行到 50 万行的演进 |

## 📥 本地归档文档

> [!tip] 本项目已收集所有专题文档
> 以下文档已归档到本项目中，可离线阅读：

| 资源 | 说明 |
|------|------|
| [[resources/claude-code-works/index]] | 📚 **专题文档索引** — 15 篇完整列表、分类索引、阅读路线图 |
| [[resources/claude-code-works/01-overview]] | 第 1 章：概述 — 技术栈、核心设计原则 |
| [[resources/claude-code-works/02-agent-loop]] | 第 2 章：系统主循环 — Agent 循环架构 |
| [[resources/claude-code-works/03-context-engineering]] | 第 3 章：上下文工程 — 4 级压缩流水线 |
| [[resources/claude-code-works/04-tool-system]] | 第 4 章：工具系统 — 66 工具注册 |
| [[resources/claude-code-works/05-code-editing-strategy]] | 第 5 章：代码编辑策略 |
| [[resources/claude-code-works/06-hooks-extensibility]] | 第 6 章：Hooks 与可扩展性 |
| [[resources/claude-code-works/07-multi-agent]] | 第 7 章：多 Agent 架构 |
| [[resources/claude-code-works/08-memory-system]] | 第 8 章：记忆系统 |
| [[resources/claude-code-works/09-skills-system]] | 第 9 章：技能系统 |
| [[resources/claude-code-works/10-plan-mode]] | 第 10 章：Plan 模式 |
| [[resources/claude-code-works/11-permission-security]] | 第 11 章：权限与安全 |
| [[resources/claude-code-works/12-user-experience]] | 第 12 章：用户体验设计 |
| [[resources/claude-code-works/13-minimal-components]] | 第 13 章：最小必要组件 |
| [[resources/claude-code-works/14-system-prompt-design]] | 第 14 章：系统提示词设计 |
| [[resources/claude-code-works/15-task-system]] | 第 15 章：任务管理系统 |

> [!info] 归档位置
> 所有专题文档原始文件位于：`archive/resources/claude-code-works/docs/`

## 📊 关键数据

| 指标 | 数值 |
|------|------|
| 源码总行数 | **512,000+** |
| TypeScript 文件 | **1,884** |
| 内置工具 | **66+** |
| 压缩流水线级数 | **4 级** |
| 权限防御层数 | **5 层** |

## 🎯 谁应该读这个？

| 你是 | 你能获得 |
|------|---------|
| 想做 AI Agent 产品的开发者 | 经过百万用户验证的架构参考，少走弯路 |
| Claude Code 用户 | 理解它为什么这样工作，学会用 Hooks 和 CLAUDE.md 深度定制 |
| 对 AI 安全感兴趣的人 | 生产级 AI 系统的安全设计实战，不是论文里的理论 |
| 学生或 AI 研究者 | 大规模工程实践的第一手材料，比任何教科书都真实 |

## 🗺️ 阅读建议

| 时间 | 建议 |
|------|------|
| **只有 10 分钟** | 读 [快速入门](./docs/quick-start.md) |
| **想理解核心原理** | 主循环 → 上下文工程 → 工具系统 |
| **想自己造一个 AI Agent** | 先读最小必要组件，然后跟 [claude-code-from-scratch](https://github.com/Windy3f3f3f3f/claude-code-from-scratch) 动手实现 |
| **想定制 Claude Code** | Hooks 与可扩展性 + 记忆系统 + 技能系统 |
| **关注安全** | 权限与安全 + 代码编辑策略 |

## 🤝 贡献者

| 贡献者 | GitHub |
|--------|--------|
| [@Windy3f3f3f3f](https://github.com/Windy3f3f3f3f) | 主要作者 |
| [@davidweidawang](https://github.com/davidweidawang) | 贡献者 |
| [Kaibo Huang](https://scholar.google.com/citations?user=C7B5X5IAAAAJ&hl=zh-CN) | 贡献者 |
| [@longx24](https://github.com/longx24) | 贡献者 |

## 🔧 配套项目

### Claude Code From Scratch

> 🛠️ 配套项目 — ~4000 行 TypeScript 或 Python 两个版本，11 章分步教程，从零构建你自己的 Claude Code

**链接**：[github.com/Windy3f3f3f3f/claude-code-from-scratch](https://github.com/Windy3f3f3f3f/claude-code-from-scratch)

## 🔮 核心价值

How Claude Code Works 的核心价值在于：

1. **生产级参考** — 50 万行源码提炼，不是 demo 级别
2. **深度分析** — 15 篇专题覆盖每一个关键设计决策
3. **实战导向** — 百万用户验证的架构，不是纸上谈兵
4. **配套教程** — 从 500 行到 50 万行的演进路线
5. **持续更新** — 活跃的贡献者社区

## 🚀 快速上手建议

### 新手推荐

1. **访问在线文档** — [windy3f3f3f3f.github.io](https://windy3f3f3f3f.github.io/how-claude-code-works)
2. **阅读快速入门** — 10 分钟了解整体架构
3. **按专题深入** — 根据兴趣选择专题
4. **配套实战** — 结合 claude-code-from-scratch 动手实现

### 进阶用户

1. **通读所有专题** — 建立完整的架构认知
2. **深入源码** — 直接阅读 Claude Code 源码
3. **贡献内容** — 向项目提交改进
4. **实践应用** — 将设计思想应用到自己的 Agent 项目

## 🌟 总结

How Claude Code Works 是一个**极其珍贵的 AI Agent 源码分析项目**，具有以下特点：

1. **50 万行源码** — 目前最成功的 AI 编程 Agent
2. **15 篇专题文档** — 覆盖核心设计决策
3. **配套实现教程** — claude-code-from-scratch 4000 行代码
4. **生产级参考** — 百万用户验证
5. **活跃社区** — 持续更新和维护
6. **中文友好** — 主要内容为中文
7. **阅读指南** — 针对不同场景的阅读建议
8. **贡献者团队** — 多位专家协作

**特别适合**：
- 想做 AI Agent 产品的开发者
- Claude Code 深度用户
- 对 AI 安全感兴趣的人
- 学生和研究人员

这是一个**改变游戏规则的项目**，让理解 Claude Code 变得有路可循！🚀

---

*最后更新: 2026-05-05*
*数据来源: GitHub README + 官方文档*
*深入解读 Claude Code 50 万行源码*
