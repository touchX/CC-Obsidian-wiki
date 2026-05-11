---
name: agent-harness-anatomy
description: LangChain 关于 Agent Harness 核心组件的深入分析 — Agent = Model + Harness
type: concept
tags: [langchain, agent, harness, filesystem, sandbox, context-management]
created: 2026-05-11
updated: 2026-05-11
source: ../../../archive/claude/extra/The Anatomy of an Agent Harness.md
external_url: https://www.langchain.com/blog/the-anatomy-of-an-agent-harness
---

# Agent Harness 解剖

> [!summary] LangChain 的核心理念：Agent = Model + Harness — 模型提供智能，Harness 让智能变得有用
> **核心洞察**：Harness 是围绕模型构建的系统，将模型智能转化为实际生产力

**来源**：[The Anatomy of an Agent Harness](https://www.langchain.com/blog/the-anatomy-of-an-agent-harness)
**作者**：LangChain 团队
**发布时间**：2026-05-11

---

## 原始文档

> [!info] 来源
> 本页面基于归档文档 [[../../../archive/claude/extra/The Anatomy of an Agent Harness.md|原始文档]] 创建

---

## 核心概念

### Agent = Model + Harness

**TLDR**：Agent = Model + Harness。Harness Engineering 是围绕模型构建系统，将模型转化为工作引擎的方法。

- **Model（模型）**：提供智能和推理能力
- **Harness（挽具）**：让智能变得有用的系统

**模型本身的能力限制**：
- ✅ 可以做：输入文本/图像/音频/视频 → 输出文本
- ❌ 不能做：
  - 跨交互维持持久状态
  - 执行代码
  - 访问实时知识
  - 设置环境并安装包完成任务

这些都是 **Harness 级别的特性**。LLM 的结构需要某种机制包装它们才能做有用的工作。

---

## 为什么需要 Harness

### 从模型的视角

**有一些我们希望 Agent 做的事情是模型开箱即用无法做到的。这就是 Harness 发挥作用的地方。**

例如，要获得"聊天"这样的产品 UX，我们将模型包装在一个 while 循环中，以跟踪先前的消息并追加新的用户消息。每个阅读本文的人都已经使用过这种 Harness。

**主要思想**：我们希望将所需的 Agent 行为转化为 Harness 中的实际特性。

### 从期望行为反向设计

Harness Engineering 帮助人类注入有用的先验来指导 Agent 行为。随着模型变得更强大，Harness 被用来手术式地扩展和纠正模型以完成以前不可能的任务。

**设计模式**：
```
我们想要的行为（或想要修复的）→ Harness 设计帮助模型实现
```

---

## Harness 的核心组件

### 1. 文件系统（Filesystems）— 持久存储和上下文管理

**目标**：Agent 需要持久存储来接口真实数据、卸载不适合上下文的信息、跨会话持久化工作。

**为什么需要**：
- 模型只能直接操作上下文窗口内的知识
- 在文件系统之前，用户必须复制/粘贴内容到模型，UX 笨拙且对自主 Agent 不起作用
- 世界已经在使用文件系统工作，模型自然地在数十亿 token 上训练了如何使用它们

**解决方案**：**Harness 配备文件系统抽象和 fs-ops 工具**

**文件系统是基础 Harness 原语**，因为它解锁了：
- Agent 获得工作空间来读取数据、代码和文档
- 工作可以增量添加和卸载，而不是在上下文中保存所有内容
- Agent 可以存储中间输出并维持超过单个会话的状态
- **文件系统是自然的协作表面** — 多个 Agent 和人类可以通过共享文件协调

**Git 版本控制**：Git 向文件系统添加版本控制，Agent 可以跟踪工作、回滚错误和分支实验。

---

### 2. Bash + 代码 — 通用工具

**目标**：Agent 应该能够自主解决问题，而无需人类预先设计每个工具。

**当前执行模式**：ReAct 循环（推理 → 行动 → 观察 → 重复）

但 Harness 只能执行其具有逻辑的工具。与其强迫用户为每个可能的操作构建工具，更好的解决方案是给 Agent 一个像 bash 这样的通用工具。

**解决方案**：**Harness 配备 bash 工具，模型可以通过编写和执行代码自主解决问题**

Bash + 代码执行是**给模型一台计算机**并让它们自主弄清楚其余部分的一大步。模型可以通过代码即时设计自己的工具，而不是被约束到一组固定的预配置工具。

**关键转变**：代码执行已成为自主问题解决的默认通用策略。

---

### 3. 沙盒（Sandboxes）— 执行和验证工作

**目标**：Agent 需要具有正确默认值的环境，以便它们可以安全地行动、观察结果并取得进展。

**挑战**：
- 本地运行 Agent 生成的代码有风险
- 单个本地环境不能扩展到大型 Agent 工作负载

**解决方案**：
1. **沙盒提供安全的操作环境**
   - 安全、隔离的代码执行
   - 白名单命令和网络隔离
   - 按需创建环境、分发到许多任务、完成后拆除

2. **良好的环境配备良好的默认工具**
   - 预装语言运行时和包
   - git 和测试的 CLI
   - 浏览器用于 web 交互和验证

3. **观察和分析工具**
   - 浏览器、日志、截图、测试运行器
   - 创建**自验证循环**：编写应用代码 → 运行测试 → 检查日志 → 修复错误

**模型不会开箱即用配置自己的执行环境**。决定 Agent 在哪里运行、什么工具可用、它可以访问什么以及如何验证其工作都是 Harness 级别的决策。

---

### 4. 对抗上下文腐烂（Battling Context Rot）

**目标**：Agent 性能不应在工作过程中下降。

**Context Rot** 描述模型随着上下文窗口填充而在推理和完成任务方面变得更差的情况。Context 是宝贵且稀缺的资源，Harness 需要策略来管理它。

**Harness 今天主要是良好上下文工程的交付机制**：

#### Compaction（压缩）

当上下文窗口接近填满时做什么：
- 智能卸载和总结现有上下文窗口
- Agent 可以继续工作而不是报错

#### Tool Call Offloading（工具调用卸载）

减少大工具输出的影响：
- 保留超过阈值的工具输出的头部和尾部 token
- 将完整输出卸载到文件系统
- 模型可以在需要时访问

#### Skills（技能）

解决启动时太多工具或 MCP 服务器的问题：
- **渐进式披露**（Progressive Disclosure）
- Skill 是 Harness 级原语
- 保护模型免受上下文腐烂

---

### 5. 长期自主执行

**目标**：Agent 应该在长期时间范围内自主、正确地完成复杂工作。

**挑战**：
- 早期停止（Early Stopping）
- 分解复杂问题的问题
- 跨多个上下文窗口的不连贯性

**解决方案需要早期原语的组合**：

#### 文件系统和 Git 跟踪工作

- Agent 在长任务中产生数百万 token
- 文件系统持久捕获工作以跟踪进度
- Git 允许新 Agent 快速了解最新工作和项目历史
- 对于多个 Agent 一起工作，文件系统充当工作的共享账本

#### Ralph Loops 继续工作

[Ralph Loop](https://ghuntley.com/loop/) 是一种 Harness 模式：
- 通过钩子拦截模型的退出尝试
- 在干净的上下文窗口中重新注入原始提示
- 强制 Agent 继续工作以完成目标
- 文件系统使这成为可能，因为每次迭代从干净上下文开始，但从上次迭代读取状态

#### 规划和自验证保持正轨

**Planning（规划）**：
- 模型将目标分解为一系列步骤
- Harness 通过良好的提示支持
- 注入提醒如何在文件系统中使用计划文件

**Self-Verification（自验证）**：
- 完成每个步骤后，Agent 受益于通过自验证检查工作正确性
- Harness 中的钩子可以运行预定义的测试套件
- 失败时循环回到模型并带有错误消息
- 模型可以被提示独立自评估其代码
- 验证将解决方案建立在测试中并创建自我改进的反馈信号

---

## Harness 的未来

### 模型训练与 Harness 设计的耦合

今天的 Agent 产品（如 Claude Code 和 Codex）在训练循环中包含模型和 Harness：
- 帮助模型改进 Harness 设计者认为它们应该天生擅长的操作
- 文件系统操作、bash 执行、规划或使用 subagents 并行工作

**创建反馈循环**：
1. 发现有用的原语
2. 添加到 Harness
3. 在训练下一代模型时使用

**副作用**：泛化问题
- 更改工具逻辑导致模型性能下降
- 在循环中训练会产生过度拟合

**但这并不意味着最好的 Harness 是模型后训练的那个**：
- Terminal Bench 2.0 排行榜示例
- Opus 4.6 在 Claude Code 中的得分远低于在其他 Harness 中
- 仅通过更改 Harness 将编码 Agent 从 Top 30 改进到 Top 5

### Harness Engineering 的方向

随着模型变得更强大，今天在 Harness 中的一些内容将被模型吸收：
- 模型将天生更擅长规划、自验证和长期一致性
- 因此需要更少的上下文注入

**但这并不意味着 Harness 将变得不那么重要**：
- 就像 Prompt Engineering 今天仍然有价值
- Harness Engineering 可能继续对构建良好的 Agent 有用
- Harness 今天修补模型缺陷，但也围绕模型智能构建系统使其更有效

**活跃研究领域**：
- 编排数百个 Agent 在共享代码库上并行工作
- 分析自己的跟踪以识别和修复 Harness 级失败模式的 Agent
- 动态组装正确工具和上下文的 Harness，而不是预配置

---

## 关键洞察

1. **模型包含智能，Harness 是让智能有用的系统**
2. **文件系统是基础原语** — 持久状态、协作表面
3. **Bash + 代码是通用工具** — 自主问题解决
4. **沙盒提供安全环境** — 隔离执行和观察
5. **Context 管理至关重要** — 压缩、卸载、渐进式披露
6. **长期执行需要规划 + 验证** — Ralph Loops、自验证循环
7. **模型与 Harness 共同进化** — 训练耦合 vs 泛化权衡

---

## 相关页面

- [[harness-engineering]] — Harness Engineering 三次演进
- [[long-running-agents]] — Anthropic 的长期运行 Agent 实践
- [[codex-harness-engineering]] — OpenAI 的完全 AI 编写代码项目
- [[subagents]] — Subagents 架构模式
- [[agent-teams]] — Agent Teams 协作

---

## 实践总结

### Harness 组件清单

| 组件 | 目的 | 关键特性 |
|------|------|---------|
| **文件系统** | 持久存储、协作 | Git 版本控制、共享账本 |
| **Bash + 代码** | 通用问题解决 | 自主工具设计、代码执行 |
| **沙盒** | 安全执行环境 | 隔离、可扩展、预装工具 |
| **上下文管理** | 对抗 Context Rot | 压缩、卸载、渐进式披露 |
| **规划 + 验证** | 长期执行 | Ralph Loops、自验证循环 |

### 设计原则

1. **从期望行为反向设计** — 行为 → Harness 特性
2. **持久状态是基础** — 文件系统是第一原语
3. **安全性和可扩展性** — 沙盒环境
4. **Context 是稀缺资源** — 主动管理而非被动填满
5. **自主需要规划** — 分解 + 验证循环

---

> [!info] 来源
> - **文章**：LangChain Blog
> - **URL**：https://www.langchain.com/blog/the-anatomy-of-an-agent-harness
> - **作者**：LangChain Team
> - **类型**：核心概念 + 架构设计
> - **价值**：⭐⭐⭐⭐⭐ 定义 Harness 核心组件的权威文章

---

*文档创建于 2026-05-11*
*来源：LangChain Engineering Blog*
*类型：核心概念分析*
