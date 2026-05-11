---
name: long-running-agents
description: Anthropic 关于如何让 AI Agent 跨多个 context windows 有效工作的技术实践
type: concept
tags: [claude, anthropic, agent, long-running, harness-engineering, context-window]
created: 2026-05-11
updated: 2026-05-11
source: ../../archive/claude/Effective-harnesses-long-running-agents.md
---

# Long-Running Agents

> [!summary] Anthropic 的技术实践：如何让 AI Agent 在跨多个 context windows 的长期任务中保持一致性和生产力
> **核心理念**：将长期任务拆解为清晰的初始化阶段和增量开发阶段

**来源**：[Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)
**作者**：Justin Young（Anthropic）
**发布时间**：2026-05-11

---

## 原始文档

> [!info] 来源
> 本页面基于归档文档 [[../../archive/claude/Effective-harnesses-long-running-agents.md|原始文档]] 创建

---

## 核心概念

### 长期运行 Agent 的挑战

随着 AI Agent 能力增强，开发者越来越要求它们承担需要**数小时甚至数天**的复杂任务。然而，让 Agent 在多个 context windows 中保持一致进展仍然是一个**未解决的问题**。

**核心挑战**：
- Agent 必须在**离散的会话**中工作
- 每个新会话开始时**没有之前会话的记忆**
- Context windows 有限，复杂项目无法在单个窗口内完成

**类比**：想象一个软件项目由工程师轮班工作，但每个新工程师到达时对上一个班次发生了什么**一无所知**。

### 失败模式

在实验中，Claude Agent SDK 在跨多个 context windows 循环运行时，表现出两种主要失败模式：

#### 模式 1：一次性尝试过多

Agent 倾向于一次性完成整个应用，导致：
- Context 在实现过程中耗尽
- 下一个会话面对**功能实现了一半且无文档**的状态
- Agent 必须猜测发生了什么，花费大量时间试图让基本应用重新工作

#### 模式 2：过早声明完成

在项目后期，Agent 实例查看项目后，看到已取得进展，就**宣布任务完成**。

### 解决方案：双 Agent 架构

Anthropic 开发了两部分解决方案来使 Claude Agent SDK 在多个 context windows 中有效工作：

#### 1. Initializer Agent（初始化 Agent）

**第一个 Agent 会话**使用专门的提示词，要求模型设置初始环境：

- **`init.sh` 脚本**：启动开发服务器
- **`claude-progress.txt` 文件**：记录 Agent 做了什么
- **初始 Git 提交**：显示添加了哪些文件

#### 2. Coding Agent（编码 Agent）

**每个后续会话**要求模型：
- 做出增量进展
- 在会话结束时留下**结构化更新**
- 保持环境在**干净状态**

**关键洞察**：找到一种方法让 Agent 在使用新的 context window 开始时快速理解工作状态，这是通过 `claude-progress.txt` 文件和 git 历史记录实现的。

---

## 环境管理

### Feature List（功能列表）

为了解决 Agent 一次性完成应用或过早认为项目完成的问题，初始化 Agent 被提示编写一个**全面的功能需求文件**，扩展用户的初始提示词。

在 claude.ai 克隆示例中，这意味着**超过 200 个功能**，例如：

> "用户可以打开新聊天、输入查询、按回车并看到 AI 响应"

所有功能最初都被标记为 **"failing"（失败）**，以便后续编码 Agent 能够清楚了解完整功能的样子。

**功能示例**（JSON 格式）：

```json
{
    "category": "functional",
    "description": "New chat button creates a fresh conversation",
    "steps": [
      "Navigate to main interface",
      "Click the 'New Chat' button",
      "Verify a new conversation is created",
      "Check that chat area shows welcome state",
      "Verify conversation appears in sidebar"
    ],
    "passes": false
}
```

**关键实践**：
- 提示编码 Agent **只能通过更改 passes 字段的状态来编辑此文件**
- 使用强有力的指令，如"删除或编辑测试是不可接受的，因为这可能导致功能缺失或错误"
- 使用 **JSON 格式**，因为模型不太可能不当更改或覆盖 JSON 文件（相比 Markdown）

### Incremental Progress（增量进展）

有了这个初始环境脚手架后，编码 Agent 的下一次迭代被要求**一次只处理一个功能**。这种增量方法被证明是解决 Agent 倾向一次性做太多问题的关键。

**增量工作后，模型必须留下环境在干净状态**：
- **Git 提交**：使用描述性提交消息提交进度
- **进度文件**：在进度文件中编写进度摘要

这允许模型使用 git **恢复错误的代码更改**并恢复代码库的工作状态。

**效率提升**：这些方法消除了 Agent 必须猜测发生了什么并花费时间让基本应用重新工作的需要。

### Testing（测试）

观察到的最后一个主要失败模式是 Claude 倾向于**在没有适当测试的情况下将功能标记为完成**。

**问题**：
- Claude 会进行代码更改
- 甚至会使用单元测试或对开发服务器的 `curl` 命令进行测试
- 但会**未能识别功能端到端不工作**

**解决方案**：明确提示使用**浏览器自动化工具**，并像人类用户一样进行所有测试。

**工具支持**：为 Claude 提供 Puppeteer MCP 服务器，使 Agent 能够：
- 识别并修复仅从代码中看不明显的错误
- 通过截图验证功能
- 在测试失败时自动修复

---

## 快速上手

### 每个会话的标准流程

每个编码 Agent 都被提示运行一系列步骤来了解情况：

1. **运行 `pwd`** 查看工作目录
   > 你只能编辑这个目录中的文件

2. **阅读 git logs 和 progress files** 了解最近的工作
   > 快速了解项目状态

3. **阅读功能列表文件** 并选择尚未完成的最高优先级功能开始工作

4. **阅读 `init.sh`** 并运行基本端到端测试
   > 在实现新功能之前确保应用没有被破坏

### 典型会话流程

```
[Assistant] 我将首先了解情况并理解项目的当前状态。

[Tool Use] <bash - pwd>
[Tool Use] <read - claude-progress.txt>
[Tool Use] <read - feature_list.json>

[Assistant] 让我检查 git 日志以查看最近的工作。
[Tool Use] <bash - git log --oneline -20>

[Assistant] 现在让我检查是否有 init.sh 脚本来重启服务器。
<启动开发服务器>

[Assistant] 太好了！现在让我导航到应用程序并验证一些基本功能仍然工作。
<测试基本功能>

[Assistant] 基于我的验证测试，我可以看到基本功能运行良好。
核心聊天功能、主题切换、对话加载和错误处理都正常工作。
现在让我更全面地查看 tests.json 文件，以了解接下来需要实现什么。
<开始新功能>
```

---

## 失败模式和解决方案总结

| **问题** | **Initializer Agent 行为** | **Coding Agent 行为** |
| --- | --- | --- |
| Claude 过早宣布整个项目完成 | 设置功能列表文件：根据输入规范，建立一个包含端到端功能描述的结构化 JSON 文件 | 在会话开始时阅读功能列表文件。选择一个功能开始工作 |
| Claude 将环境留在有错误或未记录进度的状态 | 编写初始 git 仓库和进度注释文件 | 通过阅读进度注释文件和 git 提交日志开始会话，并在开发服务器上运行基本测试以捕获任何未记录的错误。通过编写 git 提交和进度更新结束会话 |
| Claude 过早将功能标记为完成 | 设置功能列表文件 | 自我验证所有功能。仅在仔细测试后将功能标记为"通过" |
| Claude 花时间弄清楚如何运行应用 | 编写 `init.sh` 脚本来运行开发服务器 | 通过阅读 `init.sh` 开始会话 |

---

## 未来工作

这项研究展示了在长期运行 Agent harness 中实现模型在多个 context windows 中取得增量进展的一组可能的解决方案。然而，仍然存在**未解决的问题**。

### 开放问题

1. **单一通用 Agent vs 多 Agent 架构**
   - 目前还不清楚在所有上下文中，单一的通用编码 Agent 是否表现最佳
   - 或者是否可以通过多 Agent 架构实现更好的性能
   - 专门的 Agent（如测试 Agent、质量保证 Agent 或代码清理 Agent）可能在软件开发生命周期的子任务上做得更好

2. ** generalize 到其他领域**
   - 该演示针对全栈 Web 应用开发进行了优化
   - 未来的方向是将这些发现**推广到其他领域**
   - 在科学研究或金融建模中所需的长期 Agent 任务中，可能可以应用这些经验中的一些或全部

### 致谢

**作者**：Justin Young

**特别感谢**：David Hershey, Prithvi Rajasakeran, Jeremy Hadfield, Naia Bouscal, Michael Tingley, Jesse Mu, Jake Eaton, Marius Buleandara, Maggie Vo, Pedram Navid, Nadine Yasser, 和 Alex Notov 的贡献。

**团队致谢**：这项工作反映了 Anthropic 多个团队的集体努力，使 Claude 能够安全地进行长期地平线自主软件工程，特别是代码 RL 和 Claude Code 团队。

---

## 相关页面

- [[harness-engineering]] - Harness Engineering 三次演进
- [[subagents]] - Subagents 是长期运行 Agent 的一部分
- [[agent-teams]] - Agent Teams 协作模式
- [[workflows]] - 工作流编排

---

> [!info] 来源
> - **文章**：Anthropic Engineering Blog
> - **URL**：https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents
> - **类型**：技术实践 + 架构设计
> - **价值**：⭐⭐⭐⭐⭐ 解决长期运行 Agent 的核心挑战

---

*文档创建于 2026-05-11*
*来源：Anthropic Engineering Blog*
*类型：技术实践总结*
