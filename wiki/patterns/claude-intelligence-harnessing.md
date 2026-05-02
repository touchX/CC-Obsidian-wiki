---
name: patterns/claude-intelligence-harnessing
description: Claude 智能利用的三种核心模式 — Use what Claude knows + Ask what you can stop doing + Set boundaries carefully
type: pattern
tags: [claude, anthropic, agent-harness, orchestration, context-management, best-practices, patterns]
created: 2026-05-01
updated: 2026-05-01
source: ../../archive/patterns/claude-intelligence-harnessing-2026-05-01.md
external_source: https://claude.com/blog/harnessing-claudes-intelligence
---

# Claude 智能利用的三种核心模式

> 在 Claude 能力不断演进的时代，如何构建能跟上其智能步伐的应用程序

> 来源：Anthropic 官方博客

## 核心挑战

**生成式 AI 系统更多是"生长"出来的，而不是"建造"出来的**。

研究人员设定条件来引导生长，但最终出现的结构或能力并不总是可预测的。这给构建基于 Claude 的应用带来了挑战：

- **Agent harness 编码了假设**：假设 Claude 无法独立完成的事情
- **假设会过时**：随着 Claude 变得更强大，这些假设变得陈旧
- **需要持续重新评估**：即使是文章中分享的经验教训也需要频繁重新审视

## 三种核心模式

### 模式 1：使用 Claude 已经知道的东西

**原则**：使用 Claude 理解良好的工具来构建应用程序。

#### Claude 在 SWE-bench 的表现

Claude 3.5 Sonnet 在 2024 年末达到了 **49%** 的 SWE-bench Verified 分数（当时的 SOTA），仅使用：
- **Bash tool**（查看、创建、编辑文件）
- **Text editor tool**（文本编辑器）

**关键洞察**：
- Bash 不是为构建 agents 设计的
- 但它是 Claude *知道如何使用* 的工具
- 并且随着时间推移，Claude 越来越擅长使用它

#### 通用工具的组成能力

Claude 可以将这些通用工具组合成解决不同问题的模式：

| 能力 | 基础工具 | 说明 |
|------|----------|------|
| **Agent Skills** | bash + text editor | 技能系统 |
| **Programmatic tool calling** | bash + text editor | 程序化工具调用 |
| **Memory tool** | bash + text editor | 记忆工具 |

**示例**：
- Agent Skills、程序化工具调用、记忆工具都是从 bash 和 text editor 工具构建的组合能力

### 模式 2：问"我可以停止做什么？"

**原则**：Agent harness 编码了关于 Claude 无法独立完成事情的假设。随着 Claude 变得更强大，这些假设应该被测试。

#### 2.1 让 Claude 编排自己的行动

**常见假设**：每个工具结果都应该流回 Claude 的上下文窗口以告知下一个行动。

**问题**：
- 将工具结果处理为 tokens 可能很慢、昂贵
- 如果结果只需要传递给下一个工具，这是不必要的
- 如果 Claude 只关心输出的一小部分，这也是浪费

**示例场景**：读取大表来推理单列
- 整个表进入上下文
- Claude 为它不需要的每一行支付 token 成本

**解决方案：代码执行工具**

给 Claude 一个**代码执行工具**（如 bash tool 或特定语言的 REPL）：
- 允许 Claude 编写代码来表达工具调用以及它们之间的逻辑
- 不是由 harness 决定每个工具调用结果都处理为 tokens
- **Claude 决定**什么结果通过、过滤或管道传递到下一个调用，而不触及上下文窗口
- 只有代码执行的输出到达 Claude 的上下文窗口

**编排决策的转移**：
- 从 harness 转移到模型
- 由于代码是 Claude 编排行动的通用方式，强大的编码模型也是强大的**通用代理**

**性能提升**：
- BrowseComp 基准测试中，Opus 4.6 过滤自己的工具输出
- 准确率从 45.3% 提升到 61.6%

#### 2.2 让 Claude 管理自己的上下文

**任务特定上下文**引导 Claude 使用通用工具（如 bash 和 text editor）。

**常见假设**：系统提示应该用手写的任务特定指令来精心制作。

**问题**：
- 预加载提示指令不能跨许多任务扩展
- 添加的每个 token 都会消耗 Claude 的**注意力预算**
- 用很少使用的指令预加载上下文是浪费的

**解决方案 1：Skills（技能）**

给 Claude 访问技能的能力：
- 每个技能的 YAML frontmatter 是一个简短描述，预加载到上下文窗口
- 提供技能内容的概述
- 完整的技能可以通过 Claude 调用 read file tool 来**渐进式披露**

**优势**：
- 技能给 Claude 自由组装自己的上下文窗口
- 只在需要时加载相关内容

**解决方案 2：Context Editing（上下文编辑）**

上下文编辑是相反的：
- 提供一种**选择性移除**变得陈旧或不相关的上下文的方法
- 例如：旧的工具结果或思考块

**解决方案 3：Subagents（子代理）**

随着 Claude 变得越来越擅长知道何时分叉到新的上下文窗口来隔离特定任务的工作：
- Opus 4.6 生成子代理的能力在 BrowseComp 上比最佳单代理运行提高了 2.8%

#### 2.3 让 Claude 持久化自己的上下文

**挑战**：长运行代理可以超过单个上下文窗口的限制。

**常见假设**：记忆系统应该依赖围绕模型的检索基础设施。

**Anthropic 的方法**：给 Claude 简单的方法来**自己选择**持久化什么内容。

**方法 1：Compaction（压缩）**

- 允许 Claude 总结其过去的上下文以在长视野任务上保持连续性
- Claude 在选择记住什么方面变得越来越好
- **示例**：在 BrowseComp 上，Sonnet 4.5 保持在 43%（无论我们给它什么压缩预算）
  - Opus 4.5 扩展到 68%
  - Opus 4.6 达到 84%

**方法 2：Memory Folder（记忆文件夹）**

- 允许 Claude 将上下文写入文件并在需要时读取
- **示例**：BrowseComp-Plus，给 Sonnet 4.5 一个记忆文件夹
  - 准确率从 60.4% 提升到 67.2%

**长期游戏示例：Pokémon**

**Sonnet 3.5 的行为**（14,000 步）：
- 将记忆视为转录
- 写下 NPC 说的而不是重要的事情
- 31 个文件（包括两个关于毛虫 Pokémon 的近似重复）
- 仍然在第二个城镇

```json
caterpie_weedle_info:
- Caterpie 和 Weedle 都是毛虫 Pokémon
- Caterpie 是没有毒药的毛虫 Pokémon
- Weedle 是有毒药的毛虫 Pokémon
- 这个信息对未来的遭遇和战斗至关重要
- 如果我们的 Pokémon 中毒，应尽快在 Pokémon Center 寻求治疗
```

**Opus 4.6 的行为**（相同步数）：
- 编写战术笔记
- 10 个文件组织到目录中
- 三个健身房徽章
- 一个从自己的失败中提炼的学习文件

```json
/gameplay/learnings.md:
- Bellsprout Sleep+Wrap 连招：在 Sleep Powder 降落前用 BITE 快速击倒
- 不要让它设置！
- 第 1 代包包限制：最多 20 个物品。在地牢前丢弃不需要的 TM
- 旋转瓷砖迷宫：不同的入口 y 位置导致不同的目的地。尝试所有入口并通过多个口袋链接
- B1F y=16 墙壁在所有 x=9-28 处确认为实心（第 14557 步）
```

### 模式 3：仔细设置边界

**原则**：Agent harness 提供围绕 Claude 的结构以强制执行 UX、成本或安全性。

#### 3.1 设计上下文以最大化缓存命中

**Messages API 是无状态的**：
- Claude 无法看到先前轮次的对话历史
- Agent harness 需要在每轮将新上下文与所有过去的行动、工具描述和指令一起打包给 Claude

**提示缓存**：
- 提示可以基于设置的**断点**进行缓存
- Claude API 将上下文直到断点写入缓存
- 检查上下文是否匹配任何先前的缓存条目

**缓存优势**：缓存的 tokens 是基础输入 tokens 成本的 **10%**

**最大化缓存命中的原则**：

| 原则 | 描述 |
|------|------|
| **静态优先，动态最后** | 排序请求使稳定内容（系统提示、工具）排在前面 |
| **消息用于更新** | 在消息中附加 `<system-reminder>` 而不是编辑提示 |
| **不要更改模型** | 避免在会话期间切换模型。缓存是特定于模型的；切换会破坏它们。如果需要更便宜的模型，使用子代理 |
| **小心管理工具** | 工具位于缓存前缀中。添加或移除一个会使它失效。对于动态发现，使用**工具搜索**，它附加而不会破坏缓存 |
| **更新断点** | 对于多轮应用（如 agents），将断点移动到最新消息以保持缓存最新。使用**自动缓存**来实现这一点 |

#### 3.2 使用声明式工具进行 UX、可观察性或安全边界

**为什么需要声明式工具**：

Claude 不一定知道应用程序的安全边界或 UX 表面。
- Claude 发出工具调用，由 harness 处理
- Bash tool 给 Claude 广泛的程序化杠杆来执行动作
- 但它只给 harness 一个命令字符串——每个动作的相同形状

**声明式工具的优势**：

将动作提升到专用工具给 harness：
- **动作特定的钩子**
- **类型化参数**，可以拦截、门控、渲染或审计

**使用场景**：

**1. 安全边界**
- 需要安全边界的动作是专用工具的自然候选
- **可逆性**通常是一个很好的标准
- 难以逆转的动作（如外部 API 调用）可以通过用户确认来门控
- 编辑工具可以包含陈旧检查，以便 Claude 不会覆盖自上次读取以来已更改的文件

**2. UX 呈现**
- 当动作需要呈现给用户时，工具也很有用
- 它们可以呈现为模态以清晰地显示问题给用户
- 给用户多个选项
- 阻塞代理循环直到用户提供反馈

**3. 可观察性**
- 当动作是类型化工具时，harness 获得结构化参数
- 可以记录、跟踪和重放

**持续重新评估**：
提升动作到工具的决定应该持续重新评估。

**示例**：Claude Code 的 auto-mode（研究模式时）
- 在 bash tool 周围提供安全边界
- 有第二个 Claude 读取命令字符串并判断它是否安全
- 这种模式可以*限制*对专用工具的需求
- **仅适用于用户信任总体方向的任务**
- 专用工具仍然可以在某些高风险动作中赢得一席之地

## 展望未来

**Claude 智能的前沿总是在变化**。

关于 Claude 不能做什么的假设需要在其能力的每一步变化中重新测试。

**重复模式**：
在一个为长视野任务构建的 agent 中：
- Sonnet 4.5 会在感觉到上下文限制接近时过早地收尾
- 添加了重置来清除上下文窗口以解决这种"上下文焦虑"
- 有了 Opus 4.5，这种行为消失了
- 我们构建来补偿的上下文重置在 agent harness 中变成了死重

**移除死重很重要**：
因为它可能成为 Claude 性能的瓶颈。

**持续修剪**：
随着时间的推移，应用程序中的结构或边界应该基于这个问题进行修剪：

> 我可以停止做什么？

## 最佳实践总结

### DO ✅

- **使用 Claude 熟悉的工具**：bash, text editor 等通用工具
- **让 Claude 编排行动**：使用代码执行工具让 Claude 决定如何处理工具输出
- **让 Claude 管理上下文**：使用 Skills、Context Editing、Subagents
- **让 Claude 持久化上下文**：使用 Compaction、Memory Folder
- **最大化缓存命中**：静态优先、消息更新、小心管理工具
- **使用声明式工具**：用于安全边界、UX 呈现、可观察性

### DON'T ❌

- 不要编码假设 Claude 无法做到的事情
- 不要让所有工具结果都流回上下文窗口
- 不要预加载大量很少使用的指令
- 不要频繁切换模型（破坏缓存）
- 不要让过时的补偿机制成为死重

## 相关页面

- [[patterns/agent-harness-design]] — Agent Harness 设计模式
- [[patterns/context-management]] — 上下文管理模式
- [[guides/session-management-context-window]] — 会话管理指南

---

*摄取时间: 2026-05-01*
*来源: Anthropic 官方博客*
*作者: Lance Martin (Claude Platform 技术团队成员)*
*原文: https://claude.com/blog/harnessing-claudes-intelligence*
