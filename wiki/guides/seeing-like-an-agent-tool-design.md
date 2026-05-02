---
name: guides/seeing-like-an-agent-tool-design
description: 从 Agent 视角设计工具 — Claude Code 工具设计方法论与实战案例
type: guide
tags: [claude-code, tool-design, agent, progressive-disclosure, case-study, askuserquestion, task-tool]
created: 2026-05-01
updated: 2026-05-01
source: ../../archive/guides/seeing-like-an-agent-tool-design-2026-05-01.md
external_source: https://claude.com/blog/seeing-like-an-agent
---

# 从 Agent 视角设计工具

> 核心洞察：设计工具的最佳方式是学会"像 Agent 一样思考"

> 来源：Anthropic 官方博客 | Claude Code 工具设计实践

## 设计哲学

### 工具设计的困境

构建 Agent harness 最难的部分之一是**工具构建**。

Claude 完全通过 [tool calling](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview) 运作，但 Claude API 中有多种工具构建方式：
- [bash](https://platform.claude.com/docs/en/agents-and-tools/tool-use/bash-tool) — 命令行工具
- [skills](https://code.claude.com/docs/en/skills) — 技能系统
- [code execution](https://platform.claude.com/docs/en/agents-and-tools/tool-use/code-execution-tool) — 代码执行

### 核心问题

**如何设计 Agent 的工具？**
- 给它一个通用工具（如 bash 或 code execution）？
- 还是五十个专用工具，每个用例一个？

### 思维框架

想象你面对一个复杂数学问题，你需要什么工具？
- **纸笔**：最小工具，但受限于手动计算
- **计算器**：更好，但需要知道高级操作
- **计算机**：最快最强，但需要编程能力

> **关键洞察**：你想给它的工具应该**与其自身能力相匹配**。

## 实战案例 1：AskUserQuestion 工具

### 设计目标

改进 Claude 提问能力（通常称为"elicitation"）：
- Claude 可以用纯文本提问，但回答感觉不必要地耗时
- 如何降低摩擦并增加用户-Claude 之间的通信带宽？

### 尝试 1：修改 ExitPlanTool（❌ 失败）

**方案**：在 ExitPlanTool 中添加参数，在计划旁边附加问题数组。

**问题**：
- Claude 感到困惑 — 同时要求计划和关于计划的问题
- 如果用户答案与计划冲突怎么办？
- Claude 需要调用 ExitPlanTool 两次吗？

**结论**：这个方法行不通。

### 尝试 2：改变输出格式（❌ 失败）

**方案**：更新 Claude 的输出指令，使用稍微修改的 markdown 格式提问。例如：
```markdown
- 问题 1 [选项 A | 选项 B]
- 问题 2 [选项 X | 选项 Y]
```

**问题**：
- Claude 通常可以产生这种格式，但**不可靠**
- 会附加额外句子
- 会丢弃选项
- 会完全放弃结构

**结论**：继续下一个方法。

### 尝试 3：AskUserQuestion Tool（✅ 成功）

**方案**：创建一个 Claude 可以随时调用的工具，特别是在 plan mode 期间被提示调用。

**实现**：
- 工具触发时显示模态框
- 向用户展示问题
- 阻塞 agent 循环直到用户回答

**优势**：
1. ✅ 允许我们提示 Claude 生成结构化输出
2. ✅ 帮助确保 Claude 给用户多个选项
3. ✅ 用户可以在多种方式中使用：
   - 在 [Agent SDK](https://platform.claude.com/docs/en/agent-sdk/overview) 中调用
   - 在 skills 中引用
4. ✅ **最重要的是**：Claude 似乎喜欢调用这个工具，输出效果很好

**关键教训**：
> 即使是最好的工具设计，如果 Claude 不理解如何调用，也不起作用。

**未来发展**：这是 Claude Code 中 elicitation 的最终形态吗？不太可能。随着 Claude 变得更强大，服务它的工具也必须进化。

## 实战案例 2：从 Todos 到 Tasks

### TodoWrite 工具时代

**初始需求**：Claude Code 首次发布时，模型需要一个 [todo list](https://platform.claude.com/docs/en/agent-sdk/todo-tracking) 来保持正轨。

**实现**：
- Todos 可以在开始时写入
- 模型完成工作时勾选
- 给 Claude TodoWrite 工具，写入或更新 Todos 并显示给用户

**问题**：Claude 经常忘记它要做什么。

**适应**：每 5 轮插入系统提醒，提醒 Claude 其目标。

### 模型能力进化后的困境

随着模型改进，它们发现 To-do lists **限制了能力**：
- 被发送 todo list 提醒让 Claude 认为必须坚持列表
- 而不是在意识到需要改变方向时修改它
- Opus 4.5 变得更擅长使用 subagents
- **但 subagents 如何在共享 todo list 上协调？**

### Task 工具诞生

**替代方案**：用 [Task tool](https://x.com/trq212/status/2014480496013803643) 替换 TodoWrite。

| 对比维度 | TodoWrite | Task Tool |
|---------|-----------|-----------|
| **焦点** | 保持模型正轨 | Agents 之间通信 |
| **能力** | 写入/更新/勾选 | 包含依赖项、跨 subagents 共享更新、模型可修改和删除 |

**关键洞察**：
> 随着模型能力增加，曾经需要的工具现在可能限制它们。
>
> 重要的是**不断重新评估**之前关于需要什么工具的假设。
>
> 这也是为什么支持少量具有相似能力配置的模型很有用的原因。

## 实战案例 3：搜索接口设计

### RAG 时代（早期）

**初始方案**：使用 RAG（检索增强生成）
- 向量数据库预索引代码库
- harness 在每次响应前检索相关片段并交给 Claude

**优势**：强大且快速

**劣势**：
- 需要索引和设置
- 在不同环境中可能脆弱
- **最重要的是**：Claude 是**被给予**上下文，而不是自己**找到**上下文

### Grep 工具时代（进步）

**问题**：如果 Claude 可以在网上搜索，为什么不能搜索你的代码库？

**解决方案**：给 Claude Grep 工具
- 让它搜索文件
- 自己构建上下文

**观察**：随着 Claude 变得更聪明，它在被给予正确工具时越来越擅长构建自己的上下文。

### Agent Skills 与渐进式披露（成熟）

**引入**：[Agent Skills](https://agentskills.io/home) 时，形式化了**渐进式披露**（progressive disclosure）的概念。

**定义**：允许 agents 通过探索**增量发现**相关上下文。

**实现**：
- Claude 可以读取 skill 文件
- 这些文件可以引用其他模型可以递归读取的文件
- skills 的常见用途是添加更多搜索能力（如如何使用 API 或查询数据库的指令）

**一年进步**：
- Claude 从**不能真正构建自己的上下文**
- 到能够**跨几层文件进行嵌套搜索**
- 以找到它需要的确切上下文

**关键洞察**：
> 渐进式披露是现在常用的技术，用于在不添加工具的情况下添加新功能。

## 实战案例 4：Claude Code Guide Agent

### 设计挑战

Claude Code 目前有 **~20 个工具**，团队经常重新评估是否需要所有工具。

**问题**：添加新工具的门槛很高，因为这给模型增加了一个思考选项。

**具体场景**：注意到 Claude 对如何使用 Claude Code 了解不够：
- 问它如何添加 MCP
- 问它斜杠命令做什么
- 它无法回答

### 方案 1：系统提示（❌）

**想法**：将所有信息放在系统提示中。

**问题**：
- 用户很少问这些问题
- 会添加上下文腐烂
- 干扰 Claude Code 的主要工作：编写代码

### 方案 2：渐进式披露（部分成功）

**做法**：给 Claude 一个指向其文档的链接，可以在需要时加载和搜索。

**结果**：有效，但 Claude 会将大块文档拉入上下文以查找用户可以用一句话得到的答案。

### 方案 3：Claude Code Guide Subagent（✅）

**实现**：
- Claude Code Guide — 一个 subagent
- Claude 在用户询问 Claude Code 本身时调用
- Subagent 在自己的上下文中进行文档搜索
- 遵循关于如何搜索和提取什么的详细指令
- 仅传回答案

**优势**：
- 主 agent 的上下文保持干净
- 能够向 Claude 的操作空间添加功能而**不添加新工具**

**现状**：这不是完美的解决方案（Claude 在被问及如何设置自己时仍然会困惑），但代表了工具设计的进步方向。

## 核心设计原则

### 1. 像 Agent 一样思考

**核心能力**：学会"像 Agent 一样思考"（see like an agent）

**实践方法**：
- 注意观察
- 阅读输出
- 实验
- 尝试新事物

**关键问题**：
- 何时添加工具？
- 何时移除工具？
- 如何区分？

### 2. 工具与能力匹配

**思维框架**：
> 你想给它的工具应该与其自身能力相匹配。

**例子**：
- 早期模型 → TodoWrite（简单任务跟踪）
- 先进模型 → Task tool（subagent 协调）
- RAG 被动 → Grep 主动 → 渐进式披露智能

### 3. 渐进式披露优先

**核心思想**：通过增量发现添加功能，而非添加工具。

**实现方式**：
- 文档链接 → 按需加载
- Agent Skills → 递归引用
- Subagent → 专用上下文

**好处**：
- 保持主上下文干净
- 降低工具数量
- 提高响应效率

### 4. 持续演进假设

**观察**：
- 模型能力在提升
- 曾经有帮助的工具可能成为限制
- 需求在变化

**行动**：
- 定期重新评估工具集
- 移除不再需要的工具
- 替换限制能力的工具
- 支持相似能力配置的模型

## 设计检查清单

### 添加工具前

- [ ] **必要性**：不添加这个工具能否实现？
- [ ] **渐进式披露**：能否通过文档/subagent/技能实现？
- [ ] **工具数量**：当前工具是否已经太多（~20 个是上限）？
- [ ] **模型理解**：Claude 是否能理解如何调用？
- [ ] **输出质量**：Claude 使用这个工具时输出是否良好？

### 评估现有工具

- [ ] **使用频率**：这个工具是否经常被使用？
- [ ] **限制检查**：是否限制了模型能力？
- [ ] **替代方案**：更先进的工具/方法是否可用？
- [ ] **演进需要**：是否应该替换或移除？

### 工具迭代流程

```
观察问题
   ↓
设计方案（多个）
   ↓
最小实现
   ↓
测试输出质量
   ↓
评估模型理解
   ↓
✅ 成功 → 部署
❌ 失败 → 迭代或放弃
```

## 实战经验总结

### AskUserQuestion 演进路径

| 版本 | 方案 | 结果 | 关键教训 |
|------|------|------|----------|
| v1 | ExitPlanTool 参数 | ❌ 混淆 Claude | 不要混用工具目的 |
| v2 | 输出格式 | ❌ 不可靠 | Claude 不擅长严格格式遵守 |
| v3 | 独立工具 | ✅ 成功 | 简单明确的工具最有效 |

### 任务管理演进

| 阶段 | 工具 | 模型能力 | 关键洞察 |
|------|------|----------|----------|
| 早期 | TodoWrite | 基础 | 模型需要提醒保持正轨 |
| 中期 | TodoWrite + 系统提醒 | 改进 | Reminders 成为限制 |
| 现在 | Task tool | 先进 | Subagent 协调需要共享状态 |

### 搜索能力演进

| 阶段 | 方法 | 上下文获取 | 关键洞察 |
|------|------|-----------|----------|
| v1 | RAG | 被动给予 | 设置复杂，环境脆弱 |
| v2 | Grep 工具 | 主动搜索 | Claude 开始自建上下文 |
| v3 | Agent Skills | 渐进式披露 | 嵌套搜索，智能发现 |

## 给工具设计者的建议

### 核心方法论

> 设计模型的工具既是科学也是艺术。
>
> 它很大程度上取决于：
> - 你使用的模型
> - Agent 的目标
> - 它运行所处的环境

### 最佳实践

1. **频繁实验**：不要假设，要验证
2. **阅读输出**：理解模型如何使用工具
3. **尝试新事物**：勇于创新设计
4. **像 Agent 一样思考**：最重要的一点

### 设计哲学

**工具不是静态的**：
- 随模型能力进化
- 随用户需求变化
- 随环境演进而调整

**成功标志**：
- Claude 理解如何调用
- 输出质量良好
- 不限制模型能力
- 用户感觉自然

## 相关页面

- [[guides/session-management-context-window]] — 会话管理（context 管理策略）
- [[guides/onboarding-claude-code-like-new-developer]] — Claude Code 入门方法论
- [[patterns/claude-intelligence-harnessing]] — Claude 智能利用模式

---

*摄取时间: 2026-05-01*
*来源: Anthropic 官方博客*
*作者: Thariq Shihipar (Claude Code 技术团队成员)*
*原文: https://claude.com/blog/seeing-like-an-agent*
