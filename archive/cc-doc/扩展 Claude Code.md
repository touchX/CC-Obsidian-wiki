---
title: "扩展 Claude Code"
source: "https://code.claude.com/docs/zh-CN/features-overview"
author:
  - "anthropic"
created: 2026-04-27
description: "了解何时使用 CLAUDE.md、Skills、subagents、hooks、MCP 和 plugins。"
tags:
  - "clippings"
  - "claude"
---
Claude Code 结合了一个能够推理代码的模型和 [内置工具](https://code.claude.com/docs/zh-CN/how-claude-code-works#tools) ，用于文件操作、搜索、执行和网络访问。内置工具涵盖了大多数编码任务。本指南涵盖扩展层：您添加的功能，用于自定义 Claude 的知识、将其连接到外部服务以及自动化工作流。

有关核心代理循环如何工作的信息，请参阅 [Claude Code 如何工作](https://code.claude.com/docs/zh-CN/how-claude-code-works) 。

**初次使用 Claude Code？** 从 [CLAUDE.md](https://code.claude.com/docs/zh-CN/memory) 开始了解项目约定。根据需要添加其他扩展。

## 概述

扩展插入代理循环的不同部分：

- **[CLAUDE.md](https://code.claude.com/docs/zh-CN/memory)** 添加 Claude 每个会话都能看到的持久上下文
- **[Skills](https://code.claude.com/docs/zh-CN/skills)** 添加可重用的知识和可调用的工作流
- **[MCP](https://code.claude.com/docs/zh-CN/mcp)** 将 Claude 连接到外部服务和工具
- **[Subagents](https://code.claude.com/docs/zh-CN/sub-agents)** 在隔离的上下文中运行自己的循环，返回摘要
- **[Agent teams](https://code.claude.com/docs/zh-CN/agent-teams)** 协调多个独立会话，具有共享任务和点对点消息传递
- **[Hooks](https://code.claude.com/docs/zh-CN/hooks)** 完全在循环外作为确定性脚本运行
- **[Plugins](https://code.claude.com/docs/zh-CN/plugins)** 和 **[marketplaces](https://code.claude.com/docs/zh-CN/plugin-marketplaces)** 打包和分发这些功能

[Skills](https://code.claude.com/docs/zh-CN/skills) 是最灵活的扩展。Skill 是一个包含知识、工作流或说明的 markdown 文件。您可以使用 `/deploy` 之类的命令调用 skills，或者 Claude 可以在相关时自动加载它们。Skills 可以在您当前的对话中运行，也可以通过 subagents 在隔离的上下文中运行。

## 将功能与您的目标相匹配

功能范围从 Claude 每个会话都能看到的始终开启的上下文，到您或 Claude 可以调用的按需功能，再到在特定事件上运行的后台自动化。下表显示了可用的功能以及何时使用每个功能。

| 功能 | 作用 | 何时使用 | 示例 |
| --- | --- | --- | --- |
| **CLAUDE.md** | 每次对话加载的持久上下文 | 项目约定、“始终执行 X” 规则 | ”使用 pnpm，而不是 npm。提交前运行测试。“ |
| **Skill** | Claude 可以使用的说明、知识和工作流 | 可重用内容、参考文档、可重复的任务 | `/deploy` 运行您的部署清单；包含端点模式的 API 文档 skill |
| **Subagent** | 返回摘要结果的隔离执行上下文 | 上下文隔离、并行任务、专门的工作者 | 读取许多文件但仅返回关键发现的研究任务 |
| **[Agent teams](https://code.claude.com/docs/zh-CN/agent-teams)** | 协调多个独立的 Claude Code 会话 | 并行研究、新功能开发、使用竞争假设进行调试 | 生成审查者同时检查安全性、性能和测试 |
| **MCP** | 连接到外部服务 | 外部数据或操作 | 查询您的数据库、发布到 Slack、控制浏览器 |
| **Hook** | 在事件上运行的确定性脚本 | 可预测的自动化，不涉及 LLM | 每次文件编辑后运行 ESLint |

**[Plugins](https://code.claude.com/docs/zh-CN/plugins)** 是打包层。Plugin 将 skills、hooks、subagents 和 MCP servers 捆绑到单个可安装单元中。Plugin skills 是命名空间的（如 `/my-plugin:review` ），因此多个 plugins 可以共存。当您想在多个存储库中重用相同的设置或通过 **[marketplace](https://code.claude.com/docs/zh-CN/plugin-marketplaces)** 分发给他人时，使用 plugins。

### 比较相似的功能

某些功能可能看起来相似。以下是如何区分它们。

- Skill vs Subagent
- CLAUDE.md vs Skill
- CLAUDE.md vs Rules vs Skills
- Subagent vs Agent team
- MCP vs Skill

Skills 和 subagents 解决不同的问题：

- **Skills** 是可重用的内容，您可以将其加载到任何上下文中
- **Subagents** 是与您的主对话分开运行的隔离工作者

| 方面 | Skill | Subagent |
| --- | --- | --- |
| **它是什么** | 可重用的说明、知识或工作流 | 具有自己上下文的隔离工作者 |
| **关键优势** | 在上下文之间共享内容 | 上下文隔离。工作单独进行，仅返回摘要 |
| **最适合** | 参考材料、可调用的工作流 | 读取许多文件的任务、并行工作、专门的工作者 |

**Skills 可以是参考或操作。** 参考 skills 提供 Claude 在整个会话中使用的知识（如您的 API 风格指南）。操作 skills 告诉 Claude 执行特定操作（如运行您的部署工作流的 `/deploy` ）。

**当您需要上下文隔离或上下文窗口变满时，使用 subagent** 。Subagent 可能读取数十个文件或运行广泛的搜索，但您的主对话仅接收摘要。由于 subagent 工作不消耗您的主上下文，当您不需要中间工作保持可见时，这也很有用。自定义 subagents 可以有自己的说明并可以预加载 skills。

**它们可以结合。** Subagent 可以预加载特定的 skills（ `skills:` 字段）。Skill 可以使用 `context: fork` 在隔离的上下文中运行。有关详细信息，请参阅 [Skills](https://code.claude.com/docs/zh-CN/skills) 。

### 了解功能如何分层

功能可以在多个级别定义：用户范围、每个项目、通过 plugins 或通过托管策略。您还可以在子目录中嵌套 CLAUDE.md 文件或在 monorepo 的特定包中放置 skills。当相同的功能存在于多个级别时，以下是它们的分层方式：

- **CLAUDE.md 文件** 是累加的：所有级别同时向 Claude 的上下文贡献内容。来自您的工作目录及以上的文件在启动时加载；子目录在您在其中工作时加载。当说明冲突时，Claude 使用判断来协调它们，更具体的说明通常优先。有关详细信息，请参阅 [CLAUDE.md 文件如何加载](https://code.claude.com/docs/zh-CN/memory#how-claudemd-files-load) 。
- **Skills 和 subagents** 按名称覆盖：当相同的名称存在于多个级别时，一个定义根据优先级获胜（对于 skills 为托管 > 用户 > 项目；对于 subagents 为托管 > CLI 标志 > 项目 > 用户 > plugin）。Plugin skills 是 [命名空间的](https://code.claude.com/docs/zh-CN/plugins#add-skills-to-your-plugin) 以避免冲突。有关详细信息，请参阅 [skill 发现](https://code.claude.com/docs/zh-CN/skills#where-skills-live) 和 [subagent 范围](https://code.claude.com/docs/zh-CN/sub-agents#choose-the-subagent-scope) 。
- **MCP 服务器** 按名称覆盖：本地 > 项目 > 用户。有关详细信息，请参阅 [MCP 范围](https://code.claude.com/docs/zh-CN/mcp#scope-hierarchy-and-precedence) 。
- **Hooks** 合并：所有注册的 hooks 为其匹配的事件触发，无论来源如何。有关详细信息，请参阅 [hooks](https://code.claude.com/docs/zh-CN/hooks) 。

### 组合功能

每个扩展解决不同的问题：CLAUDE.md 处理始终开启的上下文，skills 处理按需知识和工作流，MCP 处理外部连接，subagents 处理隔离，hooks 处理自动化。真实的设置根据您的工作流组合它们。

例如，您可能使用 CLAUDE.md 处理项目约定、使用 skill 处理部署工作流、使用 MCP 连接到数据库、使用 hook 在每次编辑后运行 linting。每个功能处理它最擅长的事情。

| 模式 | 工作原理 | 示例 |
| --- | --- | --- |
| **Skill + MCP** | MCP 提供连接；skill 教导 Claude 如何很好地使用它 | MCP 连接到您的数据库，skill 记录您的架构和查询模式 |
| **Skill + Subagent** | Skill 为并行工作生成 subagents | `/audit` skill 启动在隔离上下文中工作的安全性、性能和风格 subagents |
| **CLAUDE.md + Skills** | CLAUDE.md 保存始终开启的规则；skills 保存按需加载的参考材料 | CLAUDE.md 说”遵循我们的 API 约定”，skill 包含完整的 API 风格指南 |
| **Hook + MCP** | Hook 通过 MCP 触发外部操作 | 编辑后 hook 在 Claude 修改关键文件时发送 Slack 通知 |

## 了解上下文成本

您添加的每个功能都会消耗 Claude 的一些上下文。太多可能会填满您的上下文窗口，但它也可能增加噪音，使 Claude 效率降低；skills 可能无法正确触发，或 Claude 可能会失去对您的约定的跟踪。了解这些权衡有助于您构建有效的设置。

### 按功能的上下文成本

每个功能都有不同的加载策略和上下文成本：

| 功能 | 何时加载 | 加载内容 | 上下文成本 |
| --- | --- | --- | --- |
| **CLAUDE.md** | 会话开始 | 完整内容 | 每个请求 |
| **Skills** | 会话开始 + 使用时 | 启动时的描述，使用时的完整内容 | 低（每个请求的描述）\* |
| **MCP 服务器** | 会话开始 | 所有工具定义和 JSON 架构 | 每个请求 |
| **Subagents** | 生成时 | 具有指定 skills 的新鲜上下文 | 与主会话隔离 |
| **Hooks** | 触发时 | 无（外部运行） | 零，除非 hook 返回额外上下文 |

\*默认情况下，skill 描述在会话开始时加载，以便 Claude 可以决定何时使用它们。在 skill 的 frontmatter 中设置 `disable-model-invocation: true` 以将其完全隐藏在 Claude 中，直到您手动调用它。这将 skills 的上下文成本降低到零，您只需自己触发这些 skills。

### 了解功能如何加载

每个功能在会话的不同点加载。下面的选项卡解释了每个功能何时加载以及什么进入上下文。

![上下文加载：CLAUDE.md 和 MCP 在会话开始时加载并保留在每个请求中。Skills 在启动时加载描述，在调用时加载完整内容。Subagents 获得隔离的上下文。Hooks 外部运行。](https://mintcdn.com/claude-code/6yTCYq1p37ZB8-CQ/images/context-loading.svg?w=2500&fit=max&auto=format&n=6yTCYq1p37ZB8-CQ&q=85&s=7807709604d9851e7cba2c604422901c)

上下文加载：CLAUDE.md 和 MCP 在会话开始时加载并保留在每个请求中。Skills 在启动时加载描述，在调用时加载完整内容。Subagents 获得隔离的上下文。Hooks 外部运行。

**何时：** 会话开始

**加载内容：** 所有 CLAUDE.md 文件的完整内容（托管、用户和项目级别）。

**继承：** Claude 从您的工作目录读取 CLAUDE.md 文件直到根目录，并在访问这些文件时发现子目录中的嵌套文件。有关详细信息，请参阅 [CLAUDE.md 文件如何加载](https://code.claude.com/docs/zh-CN/memory#how-claudemd-files-load) 。

保持 CLAUDE.md 在 200 行以下。将参考材料移到 skills，这些 skills 按需加载。

## 了解更多

每个功能都有自己的指南，包含设置说明、示例和配置选项。

## [CLAUDE.md](https://code.claude.com/docs/zh-CN/memory)

存储项目上下文、约定和说明

## [Skills](https://code.claude.com/docs/zh-CN/skills)

给予 Claude 领域专业知识和可重用的工作流

## [Subagents](https://code.claude.com/docs/zh-CN/sub-agents)

将工作卸载到隔离的上下文

## [Agent teams](https://code.claude.com/docs/zh-CN/agent-teams)

协调多个并行工作的会话