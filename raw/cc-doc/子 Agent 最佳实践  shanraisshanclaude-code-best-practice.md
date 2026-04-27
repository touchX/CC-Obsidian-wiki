---
title: "子 Agent 最佳实践 | shanraisshan/claude-code-best-practice"
source: "https://zread.ai/shanraisshan/claude-code-best-practice/10-subagents-best-practices"
author:
  - "https://zread.ai/"
created: 2026-04-27
description: "Subagent 是 Claude Code 生成隔离的、自主的工作进程的机制——每个进程都有自己的上下文窗口、工具限制、模型选择和持久化记忆。本页涵盖完整的 Frontmatter 参考、内置 Agent 类型、经过验证的设计模式，以及从本仓库实现中提炼的真实世界最佳实践。已实现Frontmatter 字段（16 个）每个 Subagent 都通过 YAML Frontmatter 进行配置。以..."
tags:
  - "clippings"
  - "claude"
  - "zread"
---
Subagent 是 Claude Code 生成 **隔离的、自主的工作进程** 的机制——每个进程都有自己的上下文窗口、工具限制、模型选择和持久化记忆。本页涵盖完整的 Frontmatter 参考、内置 Agent 类型、经过验证的设计模式，以及从本仓库实现中提炼的真实世界最佳实践。

![已实现](https://img.shields.io/badge/Implemented-2ea44f?style=flat)

---

## 架构概述

Subagent 被定义为一个位于 的 Markdown 文件，通过 YAML Frontmatter 控制其行为，文件正文提供其系统提示词。当 Claude 通过 工具调用 Subagent 时，它会创建一个 **独立的上下文窗口** ——Subagent 无法看到父级对话，反之亦然，除非通过显式的提示词参数和返回值进行传递。

<svg id="mermaid-1777272321628" width="100%" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2412 512" style="max-width: 512px;" role="graphics-document document" aria-roledescription="error"><style>#mermaid-1777272321628{font-family:"trebuchet ms",verdana,arial,sans-serif;font-size:16px;fill:#000000;}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#mermaid-1777272321628.edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#mermaid-1777272321628.edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#mermaid-1777272321628.error-icon{fill:#552222;}#mermaid-1777272321628.error-text{fill:#552222;stroke:#552222;}#mermaid-1777272321628.edge-thickness-normal{stroke-width:1px;}#mermaid-1777272321628.edge-thickness-thick{stroke-width:3.5px;}#mermaid-1777272321628.edge-pattern-solid{stroke-dasharray:0;}#mermaid-1777272321628.edge-thickness-invisible{stroke-width:0;fill:none;}#mermaid-1777272321628.edge-pattern-dashed{stroke-dasharray:3;}#mermaid-1777272321628.edge-pattern-dotted{stroke-dasharray:2;}#mermaid-1777272321628.marker{fill:#666;stroke:#666;}#mermaid-1777272321628.marker.cross{stroke:#666;}#mermaid-1777272321628 svg{font-family:"trebuchet ms",verdana,arial,sans-serif;font-size:16px;}#mermaid-1777272321628 p{margin:0;}#mermaid-1777272321628:root{--mermaid-font-family:"trebuchet ms",verdana,arial,sans-serif;}</style><g></g><g></g></svg>

这种隔离是其决定性特征：Subagent **始终** 在自己的上下文中运行，这与 Skill 不同，后者默认内联运行，除非配置了 。这使得 Subagent 成为自主多步骤任务的正确选择，否则这些任务会污染主对话的上下文窗口。

来源： [CLAUDE.md](https://zread.ai/shanraisshan/claude-code-best-practice/CLAUDE.md#L49-L56) 、 [claude-agent-command-skill.md](https://zread.ai/shanraisshan/claude-code-best-practice/reports/claude-agent-command-skill.md#L18-L33)

---

## Frontmatter 字段（16 个）

每个 Subagent 都通过 YAML Frontmatter 进行配置。以下是截至 Claude Code v2.1.118 所有 16 个字段的完整参考，通过自动漂移检测与官方文档保持同步。

### 核心身份

| 字段 | 类型 | 必填 | 描述 |
| --- | --- | --- | --- |
|  | string | 是 | 使用小写字母和连字符的唯一标识符。这是 Claude 通过 生成该 Agent 时的引用方式 |
|  | string | 是 | 何时调用该 Agent。使用 鼓励 Claude 在未被显式指示时自动调用 |

### 工具与模型控制

| 字段  | 类型          | 必填  | 描述                                                                                         |
| --- | ----------- | --- | ------------------------------------------------------------------------------------------ |
|     | string/list | 否   | 以逗号分隔的工具允许列表（例如 ）。 **如果省略，则继承所有工具。** 支持 语法来限制该 Agent 可以生成哪些 Subagent；较旧的 别名在 v2.1.63 中仍然有效 |
|     | string/list | 否   | 显式拒绝的工具，从继承或指定的列表中移除                                                                       |
|     | string      | 否   | 使用的模型：、、、完整的模型 ID（例如 ）或 （默认：）                                                              |
|     | string      | 否   | 权限模式：、、、、 或                                                                                |
|     | string      | 否   | 当此 Subagent 激活时的努力程度覆盖：、、、（仅限 Opus 4.6）。默认：继承自会话                                           |

### 生命周期与资源边界

| 字段 | 类型 | 必填 | 描述 |
| --- | --- | --- | --- |
|  | integer | 否 | Subagent 停止前的最大 Agent 轮次。对于防止 Agent 失控和控制成本至关重要 |
|  | boolean | 否 | 设置为 以始终作为后台任务运行（默认：） |
|  | string | 否 | 设置为 以在临时 git worktree 中运行（如果没有更改则自动清理） |

### 知识与扩展

| 字段 | 类型 | 必填 | 描述 |
| --- | --- | --- | --- |
|  | list | 否 | 启动时预加载到 Agent 上下文中的技能名称—— **注入完整内容** ，而不仅仅是使其可用 |
|  | string | 否 | 持久化记忆范围：（跨项目）、（团队共享）或 （个人，被 git 忽略） |
|  | list | 否 | 此 Subagent 的 MCP 服务器——服务器名称字符串或内联 对象 |
|  | object | 否 | 作用域限于此 Subagent 的生命周期钩子。支持所有钩子事件；、 和 最为常用 |

### 展示与启动

| 字段 | 类型 | 必填 | 描述 |
| --- | --- | --- | --- |
|  | string | 否 | Subagent 在任务列表和记录中的显示颜色：、、、、、、 或 |
|  | string | 否 | 当此 Agent 作为主会话 Agent 运行时（通过 或 设置），自动作为第一个用户轮次提交。会处理命令和技能。会前置到任何用户提供的提示词之前 |

来源： [claude-subagents.md](https://zread.ai/shanraisshan/claude-code-best-practice/best-practice/claude-subagents.md#L17-L37) 、 [CLAUDE.md](https://zread.ai/shanraisshan/claude-code-best-practice/CLAUDE.md#L57-L74)

---

## 官方内置 Agent 类型（5 个）

Claude Code 附带了五个 Claude 可以自动调用的内置 Subagent 类型。它们始终可用——你不需要自己定义它们。

| |---|-------|-------|-------|-------------|  
| 1 | | 继承 | 全部 | 复杂的多步骤任务——研究、代码搜索和自主工作的默认 Agent 类型 |  
| 2 | | haiku | 只读（无 Write、Edit） | 快速的代码库搜索和探索——针对查找文件、搜索代码和回答代码库问题进行了优化 |  
| 3 | | 继承 | 只读（无 Write、Edit） | 计划模式下的预规划研究——在编写代码之前探索代码库并设计实现方案 |  
| 4 | | sonnet | Read、Edit | 配置用户的 Claude Code 状态栏设置 |  
| 5 | | haiku | Glob、Grep、Read、WebFetch、WebSearch | 回答有关 Claude Code 功能、Agent SDK 和 Claude API 的问题 |

需要观察的关键模式： **和 都是只读的，并且使用更便宜或继承的模型** 。这是有意为之——只读 Agent 对于发现工作是安全的，并且没有修改你代码库的风险。 Agent 特别使用 Haiku 以在快速导航任务中获得速度，而 继承会话模型，因为规划受益于更深度的推理。

来源： [claude-subagents.md](https://zread.ai/shanraisshan/claude-code-best-practice/best-practice/claude-subagents.md#L40-L48)

---

## Subagent vs Skill vs Command：选择正确的机制

最重要的架构决策之一是知道何时使用 Subagent 而不是 Skill 或 Command。每个都有独特的属性，使其适用于不同的场景。

<svg id="mermaid-1777272321636" width="100%" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2412 512" style="max-width: 512px;" role="graphics-document document" aria-roledescription="error"><style>#mermaid-1777272321636{font-family:"trebuchet ms",verdana,arial,sans-serif;font-size:16px;fill:#000000;}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#mermaid-1777272321636.edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#mermaid-1777272321636.edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#mermaid-1777272321636.error-icon{fill:#552222;}#mermaid-1777272321636.error-text{fill:#552222;stroke:#552222;}#mermaid-1777272321636.edge-thickness-normal{stroke-width:1px;}#mermaid-1777272321636.edge-thickness-thick{stroke-width:3.5px;}#mermaid-1777272321636.edge-pattern-solid{stroke-dasharray:0;}#mermaid-1777272321636.edge-thickness-invisible{stroke-width:0;fill:none;}#mermaid-1777272321636.edge-pattern-dashed{stroke-dasharray:3;}#mermaid-1777272321636.edge-pattern-dotted{stroke-dasharray:2;}#mermaid-1777272321636.marker{fill:#666;stroke:#666;}#mermaid-1777272321636.marker.cross{stroke:#666;}#mermaid-1777272321636 svg{font-family:"trebuchet ms",verdana,arial,sans-serif;font-size:16px;}#mermaid-1777272321636 p{margin:0;}#mermaid-1777272321636:root{--mermaid-font-family:"trebuchet ms",verdana,arial,sans-serif;}</style><g></g><g></g></svg>

| 维度 | Subagent | Command | Skill |
| --- | --- | --- | --- |
| **位置** |  |  |  |
| **上下文** | 独立进程（始终） | 内联（共享主上下文） | 内联（除非 ） |
| **Claude 自动调用** | 是——通过 | 否——始终由用户触发 | 是——通过 |
| **用户可通过 调用** | 否 | 是——始终可以 | 是（除非 ） |
| **拥有自己的上下文窗口** | 是——隔离的 | 否——共享主上下文 | 否（除非 ） |
| **持久化记忆** | 是—— 字段 | 否 | 否 |
| **可预加载技能** | 是—— 字段 | 否 | 否 |
| **MCP 服务器** | 是—— 字段 | 否 | 否 |
| **生命周期钩子** | 是—— 字段 | 否 | 是—— 字段 |

**当多种机制匹配同一意图时的解析顺序** ：Claude 偏好 **最轻量的选项** ——Skill（内联，无开销）→ Agent（独立上下文）→ Command（从不自动调用，需要显式的 ）。如果设置了 Skill 的 ，Claude 会回退到 Agent。如果两者都被禁用，Claude 将使用其自身的通用知识。

来源： [claude-agent-command-skill.md](https://zread.ai/shanraisshan/claude-code-best-practice/reports/claude-agent-command-skill.md#L16-L33) 、 [claude-agent-command-skill.md](https://zread.ai/shanraisshan/claude-code-best-practice/reports/claude-agent-command-skill.md#L143-L168)

---

## Command → Agent → Skill 模式

本仓库的天气系统展示了一种分层编排模式，这是复杂工作流推荐的架构。理解这种模式对于构建生产级质量的 Claude Code 配置至关重要。

<svg id="mermaid-1777272321639" width="100%" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2412 512" style="max-width: 512px;" role="graphics-document document" aria-roledescription="error"><style>#mermaid-1777272321639{font-family:"trebuchet ms",verdana,arial,sans-serif;font-size:16px;fill:#000000;}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#mermaid-1777272321639.edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#mermaid-1777272321639.edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#mermaid-1777272321639.error-icon{fill:#552222;}#mermaid-1777272321639.error-text{fill:#552222;stroke:#552222;}#mermaid-1777272321639.edge-thickness-normal{stroke-width:1px;}#mermaid-1777272321639.edge-thickness-thick{stroke-width:3.5px;}#mermaid-1777272321639.edge-pattern-solid{stroke-dasharray:0;}#mermaid-1777272321639.edge-thickness-invisible{stroke-width:0;fill:none;}#mermaid-1777272321639.edge-pattern-dashed{stroke-dasharray:3;}#mermaid-1777272321639.edge-pattern-dotted{stroke-dasharray:2;}#mermaid-1777272321639.marker{fill:#666;stroke:#666;}#mermaid-1777272321639.marker.cross{stroke:#666;}#mermaid-1777272321639 svg{font-family:"trebuchet ms",verdana,arial,sans-serif;font-size:16px;}#mermaid-1777272321639 p{margin:0;}#mermaid-1777272321639:root{--mermaid-font-family:"trebuchet ms",verdana,arial,sans-serif;}</style><g></g><g></g></svg>

| 组件 | 角色 | 文件 |
| --- | --- | --- |
| **Command** | 入口点，用户交互，编排 |  |
| **Agent** | 使用预加载技能获取数据，独立上下文 |  |
| **Agent 技能** | 预加载的 API 指令（启动时注入） |  |
| **独立技能** | 独立创建 SVG 输出 |  |

这两种技能模式在架构上有明显的区别： **Agent 技能** 在启动时被烘焙到 Agent 的上下文中，作为 Agent 遵循的参考材料；而 **独立技能** 通过 工具按需调用，并在调用方的上下文中执行。这种分离实现了清晰的流水线，其中数据获取（Agent 关注点）与输出渲染（Skill 关注点）被隔离开来。

来源： [orchestration-workflow.md](https://zread.ai/shanraisshan/claude-code-best-practice/orchestration-workflow/orchestration-workflow.md#L12-L30) 、 [claude-subagents-implementation.md](https://zread.ai/shanraisshan/claude-code-best-practice/implementation/claude-subagents-implementation.md#L84-L97)

---

## 真实世界的 Agent 定义

检查本仓库中实际的 Agent 可以揭示三个不同的复杂度层级，每个层级服务于不同的目的。

### 第一层级：极简 Agent（轻量级实用工具）

展示了最简单但有用的 Agent——一个具有严格资源约束的单用途实用工具。

关键的设计选择：对于简单的 bash 命令使用 **Haiku 模型** ，使用 **maxTurns: 3** 防止失控执行， **没有记忆或技能** ，因为该任务不需要领域知识，并且 **没有工具限制** ，因为它默认继承所有工具。描述中刻意省略了 ——这个 Agent 很有用，但还没有重要到可以为每个与时间相关的查询自动调用的地步。

### 第二层级：特色 Agent（领域专家）

展示了 Subagent 系统的全部威力——技能、记忆、钩子、工具允许列表和权限模式。

关键的设计选择：带有通配符模式的 **显式 列表** 用于细粒度控制，描述中包含 **PROACTIVELY** 以实现自动调用， **项目记忆** 用于跨会话的历史温度跟踪， **预加载技能** 用于特定 API 的指令，以及 **异步钩子** 用于在每次工具使用时提供非阻塞的声音反馈。 防止权限提示中断自主工作流。

### 第三层级：研究 Agent（只读分析）

展示了一种自动化文档维护的模式——一个仅研究的 Agent，用于检测官方文档和本地报告之间的漂移。

关键的设计选择：对于复杂的分析推理和比较任务使用 **Opus 模型** ， **没有记忆或技能** ，因为每次运行都是独立且无状态的，并且正文包含详细的分阶段指令。此 Agent 由工作流自动化调用以保持文档同步——这是一种 Claude 维护其自身文档的元模式。

来源： [time-agent.md](https://zread.ai/shanraisshan/claude-code-best-practice/.claude/agents/time-agent.md#L1-L18) 、 [weather-agent.md](https://zread.ai/shanraisshan/claude-code-best-practice/.claude/agents/weather-agent.md#L1-L44) 、 [workflow-claude-subagents-agent.md](https://zread.ai/shanraisshan/claude-code-best-practice/.claude/agents/workflows/best-practice/workflow-claude-subagents-agent.md#L1-L18)

---

## Agent 设计的最佳实践

### 编写显式的工具允许列表

当你省略 字段时，Subagent 会从父会话继承 **所有** 工具——包括完整的写入权限、bash 执行权限和 MCP 服务器。对于生产环境的 Agent，这几乎总是过于宽松。使用显式的 列表来强制执行最小权限原则。

**修改前** （继承所有内容——有风险）：

**修改后** （显式的、可审计的）：

**Subagent 不能通过 bash 命令调用其他 Subagent。** 使用 工具（在 v2.1.63 中从 重命名而来； 仍作为别名有效）来链接 Subagent。在 Agent 描述中要明确——避免使用“启动”等模糊术语，Claude 可能会将其误解为 bash 命令。

来源： [CLAUDE.md](https://zread.ai/shanraisshan/claude-code-best-practice/CLAUDE.md#L49-L56)

### 适当地设置

每个 Subagent 都应该有一个反映其预期复杂度的 值。如果没有它，配置错误的 Agent 可能会无限制地消耗 Token。

| Agent 类型 | 建议的 | 理由 |
| --- | --- | --- |
| 单个 bash 命令（时间、日期） | 2–3 | 一次轮次执行，一次轮次返回 |
| API 获取 + 转换 | 5–8 | 获取、解析、格式化、返回 |
| 多文件代码搜索 | 10–15 | 多次 Glob/Grep 迭代 |
| 复杂分析或生成 | 20–30 | 可能需要多次读/写循环 |
| 无限制研究 | 50+ | 谨慎使用，配合 |

### 对有状态的 Agent 使用

字段使 Agent 能够跨会话构建知识。根据共享需求选择范围：

| 范围 | 存储位置 | 与团队共享 | 最适合 |
| --- | --- | --- | --- |
|  |  | 否 | 跨项目模式、个人约定 |
|  |  | 是 | 团队共享的项目知识 |
|  |  | 否 | 个人项目笔记（被 git 忽略） |

的前 200 行会在启动时自动注入到 Agent 的系统提示词中。对于会积累知识的 Agent，在正文中包含明确的指令： *"在开始之前，查看你的记忆。完成之后，用你学到的内容更新你的记忆。"*

来源： [claude-agent-memory.md](https://zread.ai/shanraisshan/claude-code-best-practice/reports/claude-agent-memory.md#L33-L58)

### 将模型与任务复杂度相匹配

并非每个 Agent 都需要 Opus。模型的选择应该反映任务的认知需求：

- **Haiku** ：简单的实用工具、时间/日期查询、简单格式化——速度比深度更重要的任务
- **Sonnet** ：大多数 Agent——API 调用、代码搜索、中等分析、数据转换
- **Opus** ：复杂推理、多文档分析、架构决策、漂移检测

### 使用 进行安全的并行工作

当多个 Agent 可能同时修改相同的文件时，设置 使每个 Agent 在临时的 git worktree 中运行。如果 Agent 没有做出任何更改，worktree 将被自动清理，从而防止冲突并保持你的工作树整洁。

### 编排首选 Command，执行首选 Agent

CLAUDE.md 工作流最佳实践明确指出： *"使用命令来处理工作流，而不是独立的 Agent。"* Command 作为面向用户的入口点来编排一个或多个 Agent。Agent 处理实际的执行。这种分离保持了用户交互层的轻量级和执行层的自主性。

---

## 调用方式

有多种方式可以触发 Subagent，具体取决于你想要显式控制还是自动行为：

| 方式 | 语法 | 何时使用 |
| --- | --- | --- |
| **自动调用** | Claude 匹配 | Claude 根据用户意图决定生成该 Agent——描述中需要包含 以确保可靠触发 |
| **Agent 工具** |  | 从另一个 Agent、Command 或主会话中——标准的编程式方法 |
| **CLI 标志** |  | 启动一个 Claude Code 会话，其中特定的 Agent 作为主会话 Agent——如果定义了则使用 |
| **命令** | 在 Claude 中输入 | 交互式 Agent 浏览器——探索可用的 Agent 并选择一个运行 |
| **设置** | settings.json 中的 | 始终以特定的 Agent 作为主 Agent 启动会话 |

来源： [changelog.md](https://zread.ai/shanraisshan/claude-code-best-practice/changelog/best-practice/claude-subagents/changelog.md#L38-L39) 、 [claude-boris-15-tips-30-mar-26.md](https://zread.ai/shanraisshan/claude-code-best-practice/tips/claude-boris-15-tips-30-mar-26.md#L193-L200)

---

## 常见陷阱与解决方案

| 陷阱 | 症状 | 解决方案 |
| --- | --- | --- |
| Agent 试图通过 bash "启动"另一个 Agent | Agent 挂起或产生错误 | 使用 工具，而不是 bash。在描述中要明确——说"通过 Agent 工具生成" |
| 没有设置 | Agent 在复杂任务上无限期运行 | 始终设置与任务复杂度成正比的 |
| 描述中缺少 | Claude 从不自动调用该 Agent | 当你想要自动触发时，包含 |
| 引用了不存在的技能 | Agent 在没有预期领域知识的情况下启动 | 验证技能名称是否与 中的目录名称匹配 |
| Agent 返回太多上下文 | 父对话变得杂乱 | 指示 Agent 仅返回结构化数据，而不是完整的分析 |
| 工具允许列表过于严格 | Agent 无法完成其任务 | 包含所有必要的工具——如果链接 Subagent，请记住包含 工具 |

---

## Subagent vs Agent Teams

为了完整性，重要的是将 Subagent 与 **Agent Teams** 区分开来——这是一种用于在完全独立的 Claude Code 会话中并行执行的实验性功能。

| 维度 | Subagents | Agent Teams |
| --- | --- | --- |
| **上下文** | 单个会话内的隔离分支 | 完全独立的 Claude Code 会话 |
| **协调** | 通过 工具、提示词参数 | 通过共享任务列表 |
| **设置** | 单个 文件 | 环境变量 + tmux |
| **开销** | 低——共享进程 | 高——每个团队成员都要加载 CLAUDE.md、MCP、技能 |
| **最适合** | 单任务隔离 | 并行构建多个组件 |

Subagent 是日常使用的标准机制。Agent Teams 则保留用于多个 Claude 实例需要同时协作处理系统不同部分的并行工作流。

来源： [claude-agent-teams-implementation.md](https://zread.ai/shanraisshan/claude-code-best-practice/implementation/claude-agent-teams-implementation.md#L20-L21)

---

## 速查参考：最小可用 Agent

对于刚开始开发的开发者，这里是最简单有用的 Agent 定义及其扩展方法：

---

## 后续步骤

为了加深你对 Subagent 生态系统的理解，请按顺序探索以下相关页面：

- [Command Agent Skill 模式](https://zread.ai/shanraisshan/claude-code-best-practice/8-command-agent-skill-pattern) —— 三种扩展机制如何组合成编排架构
- [技能系统指南](https://zread.ai/shanraisshan/claude-code-best-practice/11-skills-system-guide) —— Agent Frontmatter 中的 字段以及 Agent 技能与独立技能的区别
- [斜杠命令参考](https://zread.ai/shanraisshan/claude-code-best-practice/12-slash-commands-reference) —— 作为调用 Agent 的编排入口点的命令
- [Agent Teams 与并行执行](https://zread.ai/shanraisshan/claude-code-best-practice/19-agent-teams-and-parallel-execution) —— 当 Subagent 不够用且你需要完全独立的会话时
- [记忆与上下文管理](https://zread.ai/shanraisshan/claude-code-best-practice/15-memory-and-context-management) —— Agent 记忆如何与 CLAUDE.md 和会话记忆交互