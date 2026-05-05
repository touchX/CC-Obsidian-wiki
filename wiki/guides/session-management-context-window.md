---
session.management.context.window
name: guides/session-management-context-window
description: Claude Code 会话管理完全指南 — 1M Context 窗口下的 Continue/Rewind/Compact/Clear/Subagent 五种策略详解
type: guide
tags: [claude-code, session, context, compact, rewind, subagents, context-window, best-practices]
created: 2026-05-01
updated: 2026-05-01
source: ../../archive/guides/session-management-context-window-2026-05-01.md
external_source: https://claude.com/blog/using-claude-code-session-management-and-1m-context
---

# Session Management 与 1M Context 完全指南

> Claude Code 会话管理最佳实践 — Continue/Rewind/Compact/Clear/Subagent 五种策略详解

> 来源：Anthropic 官方博客

## 核心概念

### 上下文窗口（Context Window）

上下文窗口是模型在生成下一个响应时能够"看到"的所有内容：
- 系统提示
- 到目前为止的对话
- 每个工具调用及其输出
- 每个读取的文件

Claude Code 的上下文窗口为 **100 万 tokens**。

### Context Rot

**Context rot**（上下文腐坏）是指随着上下文增长，模型性能下降的现象：
- 注意力分散到更多 tokens
- 旧的、不相关的内容开始干扰当前任务
- 性能下降在 **300-400K tokens** 时开始显现

### Compaction（压缩）

当接近上下文窗口末尾时，当前任务会被自动总结为更小的描述，模型在新的上下文窗口中继续工作。这个过程称为 **compaction**。

## 五种会话管理策略

每个回合都是一个分支点，完成任务后有五种选择：

| 策略 | 命令 | 适用场景 |
|------|------|----------|
| **Continue** | 继续发送消息 | 同任务、上下文仍然相关 |
| **Rewind** | `Esc Esc` 或 `/rewind` | Claude 走错路、需要回退 |
| **Clear** | `/clear` | 开始新任务 |
| **Compact** | `/compact <hint>` | 会话臃肿、需要摘要 |
| **Subagents** | Agent tool | 中间产出仅需结论 |

### 1. Continue（继续）

**何时使用**：
- 同一任务，上下文仍然相关
- 窗口中的所有内容仍然必要
- 不需要重建上下文

**示例**：
继续实现同一功能的不同部分。

### 2. Rewind（回退）

**何时使用**：
- Claude 走错了方向
- 需要保留文件读取，但丢弃失败的尝试
- 比单纯"纠正"更干净

**使用方法**：
- 双击 `Esc` 键
- 或运行 `/rewind` 命令

**示例场景**：
Claude 读取了 5 个文件，尝试了一个方法但不奏效。

**错误做法**：
> 那个方法不行，试试 X

**正确做法**：
1. Rewind 到文件读取之后
2. 用学到的经验重新提示：
   > "不要用方法 A，foo 模块没有暴露那个接口—直接用 B"

**高级用法**：
- 使用 *"从这里总结"* 让 Claude 总结学到的经验
- 创建移交消息，就像未来的自己给过去的自己留言

### 3. Compact（压缩）

**何时使用**：
- 任务中期，但会话臃肿
- 充满过时的调试/探索内容
- 低成本摘要（让 Claude 决定什么重要）

**如何引导**：
可以传递指令引导压缩方向：

```bash
/compact focus on the auth refactor, drop the test debugging
```

**特点**：
- 有损压缩
- 不需要自己写
- Claude 可能更全面地包含重要学习内容或文件

### 4. Clear（清空）

**何时使用**：
- 开始全新的任务
- 零 context rot
- 完全控制什么内容被保留

**如何使用**：

```bash
/clear
# 然后写下重要信息：
"我们在重构 auth 中间件，约束是 X，重要的文件是 A 和 B，我们已经排除了方法 Y"
```

**特点**：
- 更多工作
- 但结果是你决定的相关内容

### 5. Subagents（子代理）

**何时使用**：
- 下一步会产生大量中间输出
- 只需要最终结论，不需要中间过程

**心智测试**：
> 我会再次需要这个工具输出吗，还是只需要结论？

**自动场景**：
Claude Code 会自动调用 subagents

**手动场景**（明确指示）：

```bash
# 启动子代理验证结果
"Spin up a subagent to verify the result of this work based on the following spec file"

# 启动子代理研究代码库
"Spin off a subagent to read through this other codebase and summarize how it implemented the auth flow, then implement it yourself in the same way"

# 启动子代理写文档
"Spin off a subagent to write the docs on this feature based on my git changes"
```

**工作原理**：
- Subagent 获得全新的上下文窗口
- 可以做尽可能多的工作
- 然后综合结果，只有最终报告返回给父会话
- 中间工具噪声保留在子代理的上下文中

## 何时启动新会话

### 通用经验法则

> 开始新任务时，也应该启动新会话

### 为什么？

虽然 1M 上下文窗口意味着你可以更可靠地完成更长的任务（例如从头开始构建全栈应用），但可能会发生 **context rot**。

### 相关任务的例外

有时你可能会做一些相关任务，其中一些上下文仍然是必要的，但不总是如此。

**示例**：
为你刚刚实现的功能编写文档。

- **新会话**：Claude 必须重新读取你刚刚实现的文件（更慢、更昂贵）
- **继续会话**：保留相关上下文（更快、更便宜）

## 导致自动压缩失败的原因

如果你运行很多长会话，可能会注意到压缩有时特别糟糕。

### 常见原因

**模型无法预测你的工作方向**

**示例场景**：
1. 长时间调试会话后，自动压缩触发
2. 压缩总结了调查过程
3. 你的下一条消息是："现在修复我们在 bar.ts 中看到的另一个警告"
4. 因为会话专注于调试，另一个警告可能已从摘要中删除

### 为什么困难？

由于 **context rot**，模型在压缩时处于最不智能的点。

**解决方案**：
- 有了 100 万上下文，你有更多时间主动使用 `/compact`
- 在压缩时描述你想做的事情

## 决策矩阵

| 场景 | 推荐工具 | 原因 |
|------|----------|------|
| 同任务、上下文仍然相关 | Continue | 窗口中的所有内容仍然是必要的；不要花钱重建它 |
| Claude 走错了方向 | Rewind (双击 Esc) | 保留有用的文件读取，丢弃失败的尝试，用学到的经验重新提示 |
| 任务中期但会话臃肿、充满过时的调试/探索 | `/compact <hint>` | 低成本；Claude 决定什么重要。如有需要用指令引导 |
| 开始真正的新任务 | `/clear` | 零 rot；你完全控制什么内容向前传递 |
| 下一步将产生大量输出、你只需要结论（代码库搜索、验证、文档编写） | Subagent | 中间工具噪声保留在子代理的上下文中；只有结果返回 |

## 最佳实践总结

1. **主动管理**：不要等到上下文满了才行动
2. **选择正确的工具**：使用决策矩阵选择合适的策略
3. **引导压缩**：使用 `/compact <hint>` 引导模型关注重要内容
4. **善用 Rewind**：比单纯"纠正"更干净的回退方式
5. **隔离噪声**：使用 Subagents 隔离大量中间输出

## 相关阅读

- [[../archive/zhihu/claude-session-management-zhihu-2026-05-01.md|知乎解读：如何管理 Claude Code 100w 上下文？Anthropic 官方推荐了五种使用指南]] — 中文解读版，包含实践示例和对比表格

## 相关页面

- [[tips/session-context-tips]] — 精简版决策矩阵
- [[guides/claude-code-parallel-development]] — 并行开发指南
- [[resources/tools/gstack]] — 虚拟工程团队工具集

---

*摄取时间: 2026-05-01*
*来源: Anthropic 官方博客*
*作者: Thariq Shihipar (Claude Code 技术团队成员)*
*原文: https://claude.com/blog/using-claude-code-session-management-and-1m-context*
