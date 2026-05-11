---
name: harness-engineering-first-thoughts
description: Martin Fowler 对 Harness Engineering 的早期思考 — OpenAI 实践分析和未来展望
type: tips
tags: [martin-fowler, harness-engineering, openai, early-thoughts, future-questions]
created: 2026-05-11
updated: 2026-05-11
source: ../../../archive/claude/extra/Harness Engineering - first thoughts.md
external_url: https://martinfowler.com/articles/exploring-gen-ai/harness-engineering-memo.html
---

# Harness Engineering - 早期思考

> [!summary] Martin Fowler 对 OpenAI Harness Engineering 实践的早期分析和思考 — 从备忘录到完整文章的探索过程
> **后续发展**：此备忘录已被更全面的 [[harness-engineering-for-users]]文章取代

**作者**：Martin Fowler
**发布时间**：2026-02-17（备忘录）
**完整文章**：2026-04-02

---

## 原始文档

> [!info] 来源
> 本页面基于归档文档 [[../../../archive/claude/extra/Harness Engineering - first thoughts.md|原始文档]] 创建
> **注意**：此早期备忘录已被 [[harness-engineering-for-users]]完整文章取代

---

## 备忘录背景

### 从备忘录到文章

自从撰写这份备忘录以来，Martin Fowler 有时间进一步分析该主题并撰写了[更全面的描述 Harness Engineering 的文章](https://martinfowler.com/articles/harness-engineering.html)。

**完整文章的框架**：
- Harness 的元素被构建为指南（Guides）和传感器（Sensors）
- 可以是计算型或推理型
- Harness 模板允许我们在更大的软件组织中共享常见的指南和传感器
- Harness 试图外化和明确人类开发者经验带来的东西，但它们只能到此为止
- 好的 Harness 不一定旨在完全消除人类输入，而是将其引导到我们最重要的地方

---

## OpenAI 的 Harness Engineering 实践

### 核心数据

OpenAI 团队使用"完全不手动输入代码"作为强制函数，构建了一个用 AI agents 维护大型应用的 Harness。

**关键指标**：
- ⏱️ **时间**：5 个月
- 📊 **代码规模**：100 万行以上的真实产品
- 🎯 **策略**：无手动编码

### Harness 的三个类别（基于解读）

#### 1. Context Engineering（上下文工程）

**组成**：
- 代码库中持续增强的知识库
- Agent 访问动态上下文：
  - 可观测性数据
  - 浏览器导航

#### 2. Architectural Constraints（架构约束）

**监控方式**：
- 不仅由基于 LLM 的 agents 监控
- 还包括确定性的：
  - 自定义 linters
  - 结构测试

#### 3. "Garbage Collection"（垃圾收集）

**机制**：
- 定期运行的 agents
- 发现文档中的不一致
- 发现架构约束违规
- 对抗熵和腐烂

### 迭代过程

**关键洞察**：
> "当 agent 挣扎时，我们将其视为一个信号：识别缺少什么 — 工具、护栏、文档 — 并将其反馈到存储库中，总是让 Codex 自己编写修复。"

**特点**：
- 高度迭代
- Agent 自己编写修复
- 持续改进 Harness

### 观察到的差距

所有描述的措施都集中在提高**长期内部质量和可维护性**。

**缺失**：功能和行为的验证

---

## 早期思考与问题

### Harnesses — 未来的服务模板？

**现状**：大多数组织只有两三种主要技术栈 — 并非每个应用都是独特的雪花。

**未来想象**：
- 团队从常见应用拓扑的一组 Harness 中选择以开始
- 类似今天的服务模板
- 帮助团队在"黄金路径"上实例化新服务

**Harness 的组成**：
- 自定义 linters
- 结构测试
- 基本上下文和知识文档
- 额外的上下文提供者

**问题**：
- Harness 会成为新的服务模板吗？
- 团队会使用它们作为起点，然后随着时间的推移为应用的具体特性塑造它们吗？
- 会看到类似的服务模板的分叉和同步挑战吗？

### 运行时必须受到约束以获得更多 AI 自主性？

**早期和当前 AI 编码炒作假设**：
- LLM 将给我们目标运行时的无限灵活性
- 生成任何语言、任何模式、没有约束
- LLM 会弄清楚

**现实**：
- 对于可维护的、大规模的 AI 生成代码，我们可以信任，必须有妥协

**OpenAI 的 Harness 建议**：
- 增加信任和可靠性需要约束解决方案空间：
  - 特定的架构模式
  - 强制边界
  - 标准化结构
- 这意味着放弃一些"生成任何东西"的灵活性
- 换取充满技术细节的提示、规则和 Harness

### 技术栈和拓扑的收敛？

**趋势**：
- 编码变得较少关于输入代码
- 更多关于引导其生成
- AI 可能会推动我们走向更少的技术栈

**仍然重要**：
- 框架和 SDK 的可用性仍然重要
- 我们反复看到对人类有益的东西对 AI 也有益

**变化**：
- 开发者口味在细节层面上不那么重要
- 接口中的低效率和特性不那么烦人，因为我们不直接处理它们
- 可能选择有良好 Harness 可用的技术栈
- 优先考虑"AI 友好性"

**应用范围**：
- 不仅适用于技术栈
- 还适用于代码库结构和拓扑
- 可能默认于更容易用 AI 维护的结构
- 因为它们更容易 Harness

**OpenAI 团队的重点**：
- 架构刚性和执行规则
- 主要关注领域：
  - 保持数据结构稳定
  - 定义和强制模块边界

**开放问题**：
> 没有具体示例，我仍然难以想象"我们要求 Codex 在边界解析数据形状"在他们的 Harness 中实际上是什么样子。

**更大问题**：
> 如果我们能弄清楚如何广泛地 Harness 代码库设计模式，这些拓扑会成为新的抽象层吗，而不是像如此多 AI 爱好者希望的那样是自然语言本身？

### 两个未来世界：Pre-AI vs Post-AI 应用维护？

**假设**：假设我们开发了良好的 Harness 技术，将 AI 自主性提高到 9 并增加我们对结果的信心。

**问题**：哪些技术可以应用于现有应用程序，哪些只能为从头开始构建的应用程序（考虑了 Harness）工作？

**对于较旧的代码库**：
- 需要考虑改造 Harness 是否值得努力
- AI 可以帮助我们更快地做这件事
- 但这些应用通常如此非标准化和充满熵，可能不值得
- 让我想起在从未有过静态代码分析工具的代码库上运行它，然后在警报中淹没

---

## 对当前实践的思考

### 你的 Harness 今天是什么？

OpenAI 团队在他们 的 Harness 上工作了 **5 个月**，这表明这不是一些可以快速获得结果的东西。

**但值得反思你今天的 Harness 是什么**：

- [ ] 你有 pre-commit hook 吗？
- [ ] 里面有什么？
- [ ] 你有自定义 linters 的想法吗？
- [ ] 你想对代码库施加什么架构约束？
- [ ] 你实验过像 ArchUnit 这样的结构测试框架吗？

### 这不是快速工作

**不足为奇**，他们描述的听起来比仅仅生成和维护一堆 Markdown 规则文件要多得多的工作。

**OpenAI 团队构建了**：
- Harness 的确定性部分的广泛工具
- 上下文工程不仅涉及策划知识库
- 还涉及重要的设计工作 — **代码设计本身是上下文的巨大部分**

---

## 最困难挑战

### OpenAI 团队的结论

> "我们现在最困难的挑战集中在设计环境、反馈循环和控制系统。"

### 与其他观点的联系

这让 Martin 想起了 [Chad Fowler 最近关于"重新定位严谨性"的帖子](https://aicoding.leaflet.pub/3mbrvhyye4k2e)。

**令人耳目一新**：
- 听到关于严谨性可能去向的具体想法和经验
- 而不是只是希望"更好的模型"会神奇地解决可维护性问题

---

## 最终思考

### 关于术语

> 最后，这一次，我喜欢这个空间中的一个术语。
> 虽然它只有 2 周大 — 我可能可以保持我的隐喻性呼吸，直到有人称他们的一提示、基于 LLM 的代码审查 agent 为 harness……

---

## 关键洞察

### 从备忘录到文章的演进

| 方面 | 备忘录（早期思考） | 文章（完整框架） |
|------|-------------------|----------------|
| **框架** | 探索性问题 | Guides + Sensors 框架 |
| **分类** | 3 个类别（上下文、架构、垃圾收集） | 3 类监管（可维护性、架构适应性、行为） |
| **深度** | 分析 OpenAI 实践 | 系统性用户指南 |
| **结构** | 问题驱动 | 原则驱动 |

### 开放问题（备忘录特有）

1. **Harnesses 会成为新的服务模板吗？**
2. **运行时约束是否是 AI 自主性的必要条件？**
3. **我们是否会收敛到有限数量的技术栈？**
4. **Pre-AI vs Post-AI 应用维护的不同策略？**
5. **如何改造 Legacy 代码库的 Harness？**

### 核心观察

- OpenAI 的 5 个月、100 万行代码项目展示了 Harness Engineering 的潜力
- 这不是快速工作 — 需要大量设计和工具构建
- 上下文工程 = 知识库 + 代码设计
- 最困难挑战：环境、反馈循环、控制系统
- "重新定位严谨性" — 而不是希望更好的模型

---

## 相关页面

- [[harness-engineering-for-users]] — Martin Fowler 的完整指南（取代此备忘录）
- [[codex-harness-engineering]] — OpenAI 的完整实战经验
- [[agent-harness-anatomy]] — Agent Harness 核心组件
- [[mitchell-ai-adoption-journey]] — Mitchell Hashimoto 的采用之旅

---

> [!info] 来源
> - **文章**：Martin Fowler's Blog（早期备忘录）
> - **URL**：https://martinfowler.com/articles/exploring-gen-ai/harness-engineering-memo.html
> - **作者**：Martin Fowler
> - **类型**：早期思考 + 问题探索
> - **价值**：⭐⭐⭐⭐ 探索性问题，已被完整文章取代

---

*文档创建于 2026-05-11*
*来源：Martin Fowler's Blog*
*类型：早期思考备忘录*
*状态：已被完整文章取代*
