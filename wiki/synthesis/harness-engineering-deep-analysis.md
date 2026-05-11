---
name: harness-engineering-deep-analysis
description: 马克的技术工作坊的深度分析 — Harness Engineering概念、实战与争议的全面解读
type: synthesis
tags: [bilibili, 马克的技术工作坊, harness-engineering, 深度分析, prompt-context-harness]
created: 2026-05-11
updated: 2026-05-11
source: ../../../archive/clippings/bilibili/2026-05-11-Harness Engineering 到底是什么？概念、实战与争议，一次全部讲清楚.md
external_url: https://www.bilibili.com/video/BV12LR1B3EUt
---

# Harness Engineering 深度分析

> [!summary] 马克的技术工作坊的全面解读 — 从 Prompt Engineering 到 Context Engineering 再到 Harness Engineering，概念演进、实战案例与争议讨论
> **核心观点**：Harness Engineering 不是噱头，但也不是终局——它是当下最现实的过渡期关键技术

**来源**：[Harness Engineering 到底是什么？概念、实战与争议，一次全部讲清楚](https://www.bilibili.com/video/BV12LR1B3EUt)
**作者**：马克的技术工作坊
**发布时间**：2026-05-05
**视频时长**：约 37 分钟

---

## 原始文档

> [!info] 来源
> 本页面基于归档文档 [[../../../archive/clippings/bilibili/2026-05-11-Harness Engineering 到底是什么？概念、实战与争议，一次全部讲清楚.md|原始文档]] 创建

---

## 视频内容概览

### 本期视频覆盖内容

1. **Harness Engineering 是什么**？
2. **Harness Engineering 与 Prompt Engineering、Context Engineering 的关系**
3. **OpenAI 和 Anthropic 在 Harness Engineering 方面的实战**
4. **Harness Engineering 的来源**
5. **Harness Engineering 是噱头还是技术突破？**

### 章节时间线

| 时间点 | 章节 |
|--------|------|
| `00:00` | 视频内容介绍 |
| `00:51` | 提示词工程和上下文工程 |
| `04:50` | Harness 工程是什么 |
| `09:06` | 来自 OpenAI 的实战 |
| `18:41` | 来自 Anthropic 的实战 |
| `27:19` | 是噱头还是技术突破？ |

---

## 第一部分：Prompt Engineering

### 核心概念

**Prompt（提示词）** = 用户发给大模型的话

**Prompt Engineering** = 研究怎么把这句话说清楚的技术

### 具体例子

**没有 Prompt Engineering**：
```
问：帮我的猫起个名字
答：花花、小白
问题：家里的猫是橘色的，这些名字不匹配
```

**有 Prompt Engineering**：
```
问：帮我的橘色小猫起名两个字，需要体现出它活泼爱玩的性格
答：橘宝（橘色的大活宝）、橙豆（橙色的小豆子）
```

### 关键洞察

> Prompt Engineering 就是专门用来研究怎么把话说清楚的技术

**如今很少被单独提起的两个原因**：
1. 门槛实在太低
2. 模型本身能力变强了，很多时候不需要在 prompt 上调来调去

---

## 第二部分：Context Engineering

### 核心概念

**Context（上下文）** = 大模型所接收的所有信息

**包含内容**：
- Prompt（当前问题）
- 对话历史
- 工具列表
- Skill 列表
- 其他配置信息

### 容量问题

**Context 是有容量上限的**，不可能无止境地往里面塞东西

**因此我们需要精心设计 Context 里面的内容** = Context Engineering

### 经典技术

Context Engineering 有很多具体方法，其中一个非常经典的技术是......

---

## 第三部分：Harness Engineering

### 核心定义

**Harness = 围绕 AI 模型搭建的一整套工作环境和工作流程**

Harness Engineering 关注的是：
- 不仅给 AI 提供什么信息
- 还要给他配什么工具
- 大任务怎么拆分成小步骤分批完成
- 出了问题怎么自己检查和修复
- 怎么防止代码质量随着迭代慢慢下滑

**让 AI 不只是回答问题，而是持续靠谱地完成整个任务**

---

## 三者关系：层层递进

### 三阶段演进图

```
┌─────────────────────────────────────────────────────────────┐
│                    Harness Engineering                       │
│                  （最外层，关注持续靠谱完成任务）               │
│                                                              │
│   ┌─────────────────────────────────────────────────────┐  │
│   │              Context Engineering                    │  │
│   │           （中间层，关注提供正确信息）                │  │
│   │                                                      │  │
│   │   ┌─────────────────────────────────────────────┐   │  │
│   │   │         Prompt Engineering                 │   │  │
│   │   │       （最内层，关注怎么下指令）              │   │  │
│   │   └─────────────────────────────────────────────┘   │  │
│   └─────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

### 演进关系

| 阶段 | 关注点 | 核心问题 |
|------|--------|----------|
| **Prompt Engineering** | 怎么说清楚 | 怎么把话说清楚 |
| **Context Engineering** | 怎么提供信息 | 在对的时候给对的信息 |
| **Harness Engineering** | 怎么持续靠谱 | 怎么让 AI 稳定完成任务 |

---

## 第四部分：OpenAI 的实战

### 核心数据

**项目周期**：5 个月（2025 年 8 月 - 2026 年 1 月）

**团队规模**：3 名工程师（初期）→ 7 名工程师（现在）

**代码规模**：约一百万行代码

**PR 数量**：约 1,500 个

**效率提升**：约手工编写代码所需时间的 1/10

### 核心理念

**人类掌舵，智能体执行**

- 不再是编写代码
- 而是设计环境、明确意图、构建反馈回路

### 三大核心模块

#### 1. 上下文架构

**问题**：一开始尝试把几千行规则塞进一个大文件，结果 AI 反而更容易忽略关键信息

**解决方案**：
- 把 `AGENTS.md` 当成目录来用
- 只写大概 100 行的摘要和索引
- 在 `docs/` 目录下放详细的设计文档
- AI 需要什么就去读对应的文件

**核心思想**：按需加载的渐进式披露

#### 2. 架构护栏

**通过 Linter 强制执行架构约束**：
- UI 层不能直接调用数据库层
- 模块间的依赖必须是单向的
- AI 一旦违反就会被自动拦住

**垃圾回收机制**：
- 定期让 AI 扫描代码库
- 检查有没有偏离架构规范
- 自动提交修复 PR
- 持续偿还技术债

#### 3. 执行能力

**任务编排**：
- 把大任务拆分成小任务
- 每次只做一个功能点
- 用 Git 提交作为存档点

**Feedback Loop（反馈循环）**：
- 让 AI 跑测试验证
- 错误时自动修复
- 人工在关键点介入

---

## 第五部分：Anthropic 的实战

### 核心架构：三个 Agent

Anthropic 的方案使用了经典的三个 Agent 架构：

```
┌──────────────────────────────────────────────────┐
│                   Planner Agent                   │
│              （规划器：拆解任务）                   │
└──────────────────────┬───────────────────────────┘
                       │
                       ▼
┌──────────────────────────────────────────────────┐
│                 Generator Agent                   │
│               （生成器：编写代码）                 │
└──────────────────────┬───────────────────────────┘
                       │
                       ▼
┌──────────────────────────────────────────────────┐
│                  Evaluator Agent                  │
│               （评估器：验证质量）                 │
└──────────────────────────────────────────────────┘
```

### Planner Agent（规划器）

**职责**：将大任务拆解成小的功能点

**工作流程**：
1. 分析任务需求
2. 生成功能列表
3. 规划执行顺序
4. 分配给 Generator

### Generator Agent（生成器）

**职责**：根据规划编写代码

**关键约束**：
- 每次只选取一个功能点
- 做完一个再做下一个
- 确保稳步推进

### Evaluator Agent（评估器）

**职责**：验证代码质量

**验证方式**：
- 检查功能是否正确实现
- 运行测试
- 反馈问题给 Generator

---

## 第六部分：Harness Engineering 的争议分析

### 术语的来源

#### Harness 词源

**Harness** 在传统领域早就存在：
- 软件测试领域的 **test harness**（测试框架）
- LLM evaluation harness（模型评估框架）
- Agent 长时间运行的支持框架

#### 真正的起点

**目前比较公认的起点**是 Mitchell Hashimoto 的文章：

> **My AI Adoption Journey**（2026-02-05）

**关键引述**：
> "我也不知道业界有没有公认的叫法，我就姑且叫它是 harness engineering。它的核心理念就是只要 agent 犯了错，你就去改造系统，让它绝不再犯同样的错误。"

#### 传播历程

| 时间 | 事件 |
|------|------|
| 2 月 5 日 | Mitchell Hashimoto 发表博客，首次使用 harness engineering |
| 2 月 11 日 | OpenAI 发表 harness engineering 文章（引爆概念） |
| 2 月 17 日 | Martin Fowler 网站发表 "Harness Engineering First Thoughts" |
| 3 月 10 日 | LangChain 发表 "The Anatomy of an Agent Harness"，给出公式 **Agent = Model + Harness** |
| 3 月 24 日 | Anthropic 发表 harness 文章，展示 Planner/Generator/Evaluator 架构 |

### 争议焦点

#### 争议一：没有新技术

**批评观点**：
> Harness Engineering 所用到的所有技术竟然没有一个是新的。Linter、代码检查、任务拆解、规划、质量评估机制这些东西其实早就有了。

**反驳观点**：
> 工程领域真正的进步往往不在于发明了什么新技术，而在于有没有一套统一的框架把这些零散的能力组织起来，变成可以系统设计、可以持续优化的工程方法。

#### 争议二：会被模型吸收

**更扎心的观点**：
> 所有的 Harness Engineering 都是迟早要被淘汰的。随着大模型自身能力持续优化，今天看起来必不可少的这些 harness 设计，未来很有可能会被模型能力本身逐步吸收。

### 模型越强，Harness 越少

#### 问题一：上下文焦虑（Context Window Anxiety）

**问题描述**：当上下文过长时，模型会急于结束任务，以更少的 token 完成交付

| 阶段 | 解决方案 |
|------|----------|
| **初期（使用 Sonnet 4.5）** | 使用上下文重置的 Harness Engineering 技术 |
| **后期（升级到 Opus 4.5）** | 这种现象被大幅缓解，不再需要这方面的 Harness 设计 |

#### 问题二：长任务执行效果差

**初期（使用 Sonnet 4.5）**：
- 在提示词里强制 Generator 每次只选一个功能点
- 做完一个再做下一个
- 确保稳步推进

**后期（升级到 Opus 4.6）**：
- 全局统筹能力够强
- 可以一次把所有功能点都拿过来
- 自己决定先做哪个再做哪个
- 不再需要别人对他的执行流程指指点点

**结论**：
> 模型越强，所需要的 Harness 就越少。模型能力的提升正在一点点吃掉 Harness Engineering 的生存空间。

---

## 作者观点：Harness Engineering 不是噱头，但也不是终局

### 核心判断

> **Harness Engineering 不是噱头，但应该也不是终局。**

### 为什么不是噱头

**已经实实在在带来了效果**：
- OpenAI 通过 Harness Engineering 5 个月写出 100 万行代码
- Anthropic 把 Agent 稳定性、自动化程度和生产力往前推了一大步

**这些都是可以被验证的工程成果，而不是概念炒作。**

**关键洞察**：
> 工程领域真正的进步往往不在于发明了什么新技术，而在于有没有一套统一的框架把这些零散的能力组织起来，变成可以系统设计、可以持续优化的工程方法。Harness Engineering 的意义恰恰就在这里。

### 为什么不是终局

**随着模型能力继续增强**：
- 今天用来约束模型、纠正模型、给模型兜底的系统设计方案
- 很有可能会被模型自身逐步吸收

**大胆推演**：
> 如果未来的模型真的强到离谱，也许只要给大模型配置上最基础的 Harness，它自己就能够把剩下 99% 的问题全部都给搞定。

**真到了那一天**：
- Harness Engineering 可能不再是一门需要大家专门去钻研的技术
- 它会退化成一个单纯的环境接口、一个底层的基础设施

### 最终结论

> **我更愿意把 Harness Engineering 看成是一个过渡期的关键技术。它可能不是未来的终极答案，但它是当下最现实的答案。**

**原因**：
- 在今天，模型依然会犯错
- 依然会有幻觉
- 依然会在复杂的任务中偏离轨道

**在这种现实下，Harness Engineering 的重要性不容忽视。可以说谁能够把 Harness 搭的更稳，谁就能够更早地把 AI 的能力转换为真正的生产力，从而从中受益。**

---

## 视频核心观点总结

### 关于概念演进

1. **Prompt Engineering** — 怎么说清楚（门槛低，逐渐被忽略）
2. **Context Engineering** — 怎么提供信息（按需加载，渐进式披露）
3. **Harness Engineering** — 怎么持续靠谱（系统化框架，持续优化）

### 关于实战效果

| 公司 | 核心方案 | 效果 |
|------|----------|------|
| **OpenAI** | 上下文架构 + 架构护栏 + 反馈循环 | 5 个月，100 万行代码 |
| **Anthropic** | Planner + Generator + Evaluator | Agent 稳定性大幅提升 |

### 关于争议

| 争议点 | 批评 | 反驳 |
|--------|------|------|
| **没有新技术** | 全是老技术，新瓶装旧酒 | 工程进步在于统一框架，而非新技术 |
| **会被模型吸收** | 越强的模型越不需要 Harness | 确实如此，所以是过渡期技术 |

### 关于终局

**不是噱头**：已经带来可以被验证的工程成果

**不是终局**：随着模型能力提升，Harness 会逐渐被吸收

**是过渡期关键技术**：当下最现实的答案，但不是未来的终极答案

---

## 关键时间线回顾

| 日期 | 事件 | 影响 |
|------|------|------|
| **2025-08** | OpenAI 团队开始 Harness Engineering 实验 | 奠定基础 |
| **2026-02-05** | Mitchell Hashimoto 发表 "My AI Adoption Journey" | 提出术语 |
| **2026-02-11** | OpenAI 发表 Harness Engineering 文章 | 引爆概念 |
| **2026-02-17** | Martin Fowler 网站发表第一反应文章 | 扩大影响 |
| **2026-03-10** | LangChain 发表 "Agent = Model + Harness" 公式 | 概念定调 |
| **2026-03-24** | Anthropic 发表 Harness 文章 | 教科书案例 |
| **2026-05-05** | 马克的技术工作坊深度分析视频 | 全面解读 |

---

## 术语对照表

| 中文 | 英文 | 解释 |
|------|------|------|
| 马具工程 | Harness Engineering | 围绕 AI 模型搭建的完整工作环境和工作流程 |
| 提示词工程 | Prompt Engineering | 调整大模型提示词的技术 |
| 上下文工程 | Context Engineering | 精心设计模型接收的信息 |
| 渐进式披露 | Progressive Disclosure | 按需加载，而非一次性提供所有信息 |
| 上下文焦虑 | Context Window Anxiety | 上下文过长时模型急于结束任务 |
| 架构护栏 | Architectural Guardrails | 通过 Linter 等强制执行架构约束 |
| 垃圾回收 | Garbage Collection | 定期扫描并修复偏离规范的代码 |

---

## 相关页面

- [[harness-engineering]] — Harness Engineering 三次演进（理论框架）
- [[agent-harness-anatomy]] — Agent Harness 核心组件（LangChain 视角）
- [[harness-engineering-for-users]] — 编码 Agent 用户的实践指南（Martin Fowler）
- [[codex-harness-engineering]] — OpenAI 的完全 AI 编写代码项目
- [[long-running-agents]] — Anthropic 的长期运行 Agent 实践
- [[mitchell-ai-adoption-journey]] — Mitchell Hashimoto 的采用之旅
- [[tutorials/harness-engineering-yupi]] — 程序员鱼皮的保姆级教程
- [[tutorials/harness-agent-practice-series]] — 小森的源码级实战教程

---

> [!info] 来源
> - **视频**：Bilibili - 马克的技术工作坊
> - **URL**：https://www.bilibili.com/video/BV12LR1B3EUt
> - **作者**：马克的技术工作坊
> - **类型**：深度分析 + 争议讨论
> - **价值**：⭐⭐⭐⭐⭐ 全面解读 Harness Engineering 概念、实战与争议

---

*文档创建于 2026-05-11*
*来源：Bilibili 视频字幕*
*类型：深度分析*
