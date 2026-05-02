---
name: sources/yc-startups-claude-code-case-studies
description: 三家 YC 创业公司使用 Claude Code 构建公司的案例研究：HumanLayer、Ambral 和 Vulcan Technologies
type: source
tags: [claude, claude-code, case-study, yc, startups, agents, subagents]
created: 2026-05-01
updated: 2026-05-01
source: ../../archive/sources/yc-startups-claude-code-2026-05-01.md
---

# YC 创业公司 Claude Code 案例研究

## 概述

[Y Combinator](https://www.ycombinator.com/) 自 2005 年以来已经孵化了超过 5,000 家公司，总估值超过 8000 亿美元，包括 Airbnb、Stripe 和 DoorDash 等知名企业。

如今，agentic coding 工具如 [Claude Code](https://www.claude.com/product/claude-code) 正在根本性地改变 YC 创业公司构建和扩展的方式。创始人现在可以直接从终端发布产品，将开发周期从数周压缩到数小时，甚至使非技术创始人能够从第一天起就与成熟公司竞争。

本文介绍的三个 YC 创业公司展示了这种转型：

- [HumanLayer](https://www.humanlayer.dev/) (F24) 使用 Claude Code 构建整个平台并开创了 context engineering 实践
- [Ambral](https://www.ambral.com/) (W25) 使用 Claude Code 和 Claude Agents SDK 构建的复杂 sub-agent 工作流来扩展 AI 驱动的账户管理
- [Vulcan Technologies](https://vulcan-tech.com/) (S25) 使用 Claude Code 为政府和行业解决监管复杂性

## HumanLayer：从 SQL agents 到扩展 AI-first 工程团队

### 产品转型

Dexter Horthy 在构建自主 AI agents 管理 SQL 仓库时注意到了一个基本但可以理解的 agentic adoption 挑战：公司不愿意让 AI 应用程序无监督地访问敏感操作，比如删除数据库表。

这一认识成为了 HumanLayer 的核心洞察：任何软件中最有用的功能往往也是最危险的，特别是对于非确定性 LLM 驱动的系统。

"我们的 MVP 是一个在 Slack 中与人类协调的 agent，可以进行基本的清理，比如删除 90 天以上未查询的任何表，" Horthy 解释道。"我们对 AI 应用程序无监督运行原始 SQL 不太放心，所以我们加入了一些基本的人工审批步骤。"

2024 年 8 月，Horthy 构建了 MVP，向 SF 的不同初创公司进行了演示，并获得了第一批付费客户。

这一进展使 HumanLayer 进入了 YC F24 批次，团队全力提供 API 和 SDK，让 AI agents 通过 Slack、email、SMS 和其他渠道联系人类以获取反馈、输入和批准。

### Context Engineering 实践

通过 2025 年第一季度，HumanLayer 团队进行了广泛的客户发现，与数十个构建 AI agents 的工程团队交谈，意识到他们在 agentic 开发循环中遗漏了一个空白。

"每个团队都有自己的 agent 架构，" Horthy 解释道。"我们意识到我们不能只构建一个更好的 API——我们需要帮助建立模式和原则，让生态系统成熟。"

这促使 Horthy 在 "[12-Factor Agents: Patterns of reliable LLM applications](https://github.com/humanlayer/12-factor-agents)" 中记录了他们的学习。该指南于 2025 年 4 月发布并迅速走红，综合了他们构建生产 agent 系统的经验，并强调了新兴的 context engineering 学科的最佳实践。

### 使用 Claude Code 构建一切

有了这些学习经验，HumanLayer 团队开始探索替代产品想法和转型角度。

当 Anthropic 发布 Claude Code 时，Horthy 和团队已经是 Claude 编码模型的坚定支持者。他们立即开始使用它来构建这些实验。

"我们用 Claude Code 编写了一切，" Horthy 说。"当 Claude Agent SDK 随 Opus 4 和 Sonnet 4 推出，实现 headless agent 执行时，我们知道这将是一件大事。"

在内部完善 Claude Code 工作流程几个月后，Horthy 开始与亲密的创始人朋友分享这些工作流程。

"告诉我我们需要全力以赴的时刻是与 BoundaryML (YC W23) 的 Vaibhav 进行为期一天的配对编程会话，" Horthy 回忆道。"Vaibhav 起初持怀疑态度，但当我们花了 7 个小时完成通常需要 1-2 周的工作后，他信服了。我意识到这个工作流程可以适用于其他团队和其他代码库。"

### 构建 CodeLayer：扩展 AI-first 工程

如今，HumanLayer 的产品 CodeLayer 帮助团队使用 worktree 和远程 cloud workers 并行运行多个 Claude agent 会话。他们发现了一个关键模式：一旦工程师掌握了 Claude Code，他们的生产力提升如此显著，真正的挑战变成了组织性的——在整个团队中扩展这些工作流程。

"当你的团队中有多个人员发布 AI 编写的代码时，你面临的是完全不同类型的问题，" Horthy 解释道。"这是一个沟通、协作、工具和管理问题。你必须重新连接团队构建软件的所有方面。"

自 2025 年第四季度初以来，HumanLayer 已在各种规模的工程团队中关闭了几个大型试点项目，以部署这些使用 Claude Code 构建的工具和工作流程。

## Ambral：使用 Subagents 构建生产系统

### 转变账户管理

Jack Stettner 和 Sam Brickman 创立 Ambral 解决每个 B2B 创始人和 CRO 熟悉的问题：随着公司扩展，推动早期增长的创始人级别的客户亲密关系变得不可能维持。

无论是在经历超增长的早期公司还是在成熟的企业公司，客户经理经常同时管理 50 到 100 个账户。"你不能用某人 1/50 的注意力提供有效的账户管理体验，" Stettner 解释道。曾经适合创始人头脑的客户上下文分散在系统、日志、Slack 消息、会议记录和产品使用数据中。

Ambral 将客户活动和互动的信号综合到每个账户的 AI 驱动模型中。该系统确定谁需要关注以及为什么，自主驱动或推荐扩展，同时捕获不满的早期迹象以防止流失。

"我们试图为每个客户提供一对一账户管理体验，" Stettner 说。

作为这家年轻初创公司的 CTO 和唯一工程师，Stettner 严重依赖 Claude Code 进行开发，并使用 Claude 的 Agent SDK 为产品本身提供动力。技术架构反映了对如何从不同 Claude 模型中提取最大价值的复杂理解。

### 委托工作流程：Opus 用于思考，Sonnet 用于构建，Subagents 无处不在

Stettner 采用了精确的工作流程，结合不同 Claude 模型的优势以及 subagents：

"我使用 Opus 4.1 进行研究和规划。Sonnet 4.5 在执行我在 Markdown 中创建的计划方面绝对杀手级，" Stettner 解释道。

他的开发过程遵循三个不同的阶段：

1. **研究阶段 (Opus 4.1)**：对功能实现所需的任何背景进行深入研究。"我认为最重要的是在规划之前进行研究，" Stettner 强调。"让 Claude 为你进行研究并创建一个长篇研究文档。"他使用一系列 subagents 并行研究代码库的多个区域。
2. **规划阶段 (Opus 4.1)**：创建一个包含不同阶段的计划，说明如何实现该功能。"我会让 Opus 创建一个包含阶段的计划，说明如何实际实现它，然后我会修改该计划。也许我会与 Opus 讨论某些细节的问题，或者我会手动更新这个 markdown 文件。"
3. **实现阶段 (Sonnet 4.5)**：系统地执行计划的每个阶段。"然后我会使用 Sonnet 4.5 去实现每个阶段。"

这种方法优于 Stettner 尝试的其他工作流程，并受到 Horthy 在 HumanLayer 所做的一些工作的影响："我尝试了每个编码工具，我基本上实验了每个模型。我只是认为 Anthropic 的模型目前在工具使用方面是最好的，这转化为代码。"

### 构建强大的研究引擎

产品本身反映了这种 multi-agent 方法。Stettner 使用 Claude Agent SDK 构建了 Ambral 的核心研究引擎，为每种数据类型配备了专用的 sub-agents。

"我花了很多时间使用 Claude Agent SDK 基本上构建了一个非常强大的研究引擎，可以在所有这些数据中运行，" Stettner 解释道。"它基于 Claude sub-agents，对于每种数据类型，我们都有一个专用的 sub-agent，它是理解该数据的专家。"

无论是用户与系统聊天还是 Ambral 为客户构建自动化，所有内容都由 [Claude Agent SDK](https://docs.claude.com/en/api/agent-sdk/overview) 和一系列 sub-agents 支撑，这些 sub-agents 跨使用数据、Slack 消息、会议记录和产品互动进行检索和推理。

架构灵感直接来自 Stettner 的开发经验："我认为 Claude Code subagents 的表现以及帮助我进行开发的方式，正是启发我基本上想要采用这些相同的 sub-agents 并在产品本身的研究引擎中使用它们。"

## Vulcan Technologies：赋能非技术创始人发布产品

### 在没有专门工程师的情况下发布产品

对于 Vulcan 的 CEO 和联合创始人 Tanner Jones 来说，Claude Code 的影响远远超出了生产力——它构成了公司构建的民主化。在创立初创公司时，Vulcan 团队相信必须有一个产品可以让政府工作对公民更好。如果没有 Claude Code，这一愿景将是不可能的，因为两位创始人都没有工程背景。

Vulcan 解决了一个积累了几个世纪的问题：[监管代码](https://en.wikipedia.org/wiki/Code_of_Federal_Regulations) 复杂性。弗吉尼亚州议会，世界上最古老的连续民主机构， exemplifies 这一挑战。400 多年的监管积累创造了美国最细致和复杂的代码之一。

当 Aleksander Mekhanik 和 Tanner Jones 于 2025 年 4 月联合创立 Vulcan 时，两人都没有传统的工程背景。Mekhanik 在大学学习 ML 和数学，Jones 最后的编程经验是在高中的 AP JavaScript 课程，他们用纸笔编写代码。然而，这对组合在 5 月 1 日为弗吉尼亚州长办公室构建了第一个产品的原型——并在成熟咨询公司的竞争中赢得了合同。

"整个原型都是使用 Claude 制作的，" Jones 解释道。"这是在 Claude Code 之前。实际上是将脚本复制粘贴到 web 应用程序中，交换方法。"在构建原型后，他们聘请了曾在 Google 的 Gemini 和 Waymo 工作的 CTO Christopher Minge。然后，当 Claude Code 于 6 月推出时， trio 的速度再次倍增。

Vulcan 的 AI 驱动监管分析通过识别冗余和重复的监管要求，帮助将弗吉尼亚州新房的平均价格降低了 24,000 美元，每年为弗吉尼亚人节省超过 10 亿美元。弗吉尼亚州长非常喜欢 Vulcan 的工作，以至于他[签署了第 51 号行政命令](https://www.govtech.com/artificial-intelligence/virginia-to-use-agentic-ai-to-power-review-of-regulations)，要求所有州机构使用"agentic AI 监管审查"。

### 民主化公司构建

对于 Jones 来说，Claude Code 的影响超出了生产力指标。

"如果你理解语言并且理解批判性思维，你就能很好地使用 Claude Code，" 他说。"我实际上认为学过人文科学的人可能有一些边际优势，因为我们与 AI 交流的媒介是语言。如果你对语言有很好的掌握，并且擅长构建有序的列表、嵌套项目符号和深思熟虑的流程，你的 prompts 可能会更好地执行。"

Jones 赞扬 Claude Code 是 Vulcan 成功的主要组成部分："在四个月内，三位创始人，只有一位是真正技术的，我们获得了州和联邦政府合同，并从一些顶级 VC 募集了 1100 万美元的种子轮。如果没有 Anthropic 令人难以置信的工具，这一切都不可能实现。"

拥有"真正技术"培训的 Vulcan CTO Christopher Minge 经历了自己对工程思考方式的转变。

"感觉有点像我在 Google 有一个同事，我把我所有的想法和任务都给他们，他们会经常犯错，但我的角色是委托给几个 Claude Code 实例，并擅长检查常见错误并有效地交流想法，" Minge 解释道。

## YC 创始人的最佳实践

这三家创业公司开发了经过实战考验的方法来最大化 Claude Code 的影响，包括：

### 1. 将研究、规划和实现分离到不同的会话中

"不要让 Claude 在尝试规划的同时进行研究，在尝试实现的同时进行研究，" Stettner 建议。"使用不同的 prompts 并使它们成为不同的步骤。"

这种模式防止上下文污染，并允许每个阶段专注于其核心目标。为每个主要阶段启动一个新的 Claude Code 会话，只向前传递精炼的结论，而不是拖动整个上下文历史。

### 2. 精心管理上下文

Stettner 给其他创始人的建议围绕精心管理上下文：

"上下文至关重要。当我看到意外或低质量的输出时，通常是由于我在某个 prompt 中的矛盾，"他解释道。"非常慎重地考虑你将什么信息放入系统 prompt 或选择何时开始新对话，因为你不想模糊你的上下文。如果你的 prompt 中有任何矛盾，你将收到低质量的输出。"

### 3. 监控和中断思维链

"尝试审查思维链并观察它在做什么，" Jones 建议。"将手指放在触发器上以逃避并中断任何不良行为。"

这在运行多个实例时变得尤为重要。在早期发现错误方向——在最初的几次工具调用内——比让 Claude Code 完成整个错误方法节省更多时间。

## 新的构建者优势

这三家创业公司展示了工具如 Claude Code 如何根本性地改变公司的构建方式。HumanLayer 在转型和扩展的同时编纂了现在在整个 YC 生态系统中使用的 context engineering 实践。Ambral 以精简的创始团队大规模应对客户成功。Vulcan 作为非工程师赢得了政府合同。

构建软件的传统障碍——技术专业知识、团队规模、开发时间——正在让位于新的竞争优势：清晰的思维、结构化的问题分解以及与 AI 有效协作的能力。

## 相关资源

- [Claude Code 产品页](https://www.anthropic.com/claude-code)
- [HumanLayer](https://www.humanlayer.dev/)
- [Ambral](https://www.ambral.com/)
- [Vulcan Technologies](https://vulcan-tech.com/)
- [12-Factor Agents](https://github.com/humanlayer/12-factor-agents)
- [Claude Agent SDK 文档](https://docs.claude.com/en/api/agent-sdk/overview)

## 相关 Wiki 页面

- [[concepts/agents-skills-paradigm|Agent Skills 范式]]
- [[concepts/agentic-coding-benefits|Agentic Coding 的核心好处]]
- [[guides/claude-md-configuration-guide|CLAUDE.md 配置指南]]
- [[implementation/subagents-usage-guide|Subagents 使用指南]]
