---
claude.md.configuration.guide
name: guides/claude-md-configuration-guide
description: CLAUDE.md 文件配置指南：为代码库定制 Claude Code，提供项目上下文、编码标准和工作流程
type: guide
tags: [claude, claude-md, configuration, best-practices, customization]
created: 2026-05-01
updated: 2026-05-01
source: ../../archive/guides/claude-md-configuration-2026-05-01.md
---

# CLAUDE.md 文件配置指南

## 概述

如果你使用 AI 编程 agent，你会面临同样的挑战：如何给它们足够的上下文来理解你的架构、约定和工作流程，而不必重复自己？

随着代码库的增长，这个问题会更加复杂。复杂的模块关系、特定领域的模式和团队约定不会轻易显现。你最终会在每次对话开始时重复解释相同的架构决策、测试要求和代码风格偏好。

**CLAUDE.md 文件**通过为 Claude 提供项目的持久上下文来解决这个问题。将其视为配置文件，Claude 会自动将其融入到每次对话中，确保它始终了解你的项目结构、编码标准和首选工作流程。

## 什么是 CLAUDE.md 文件？

CLAUDE.md 是存在于仓库中的特殊配置文件，为 Claude 提供项目特定的上下文。你可以将其放在仓库根目录以与团队共享，放在父目录用于 monorepo 设置，或放在主文件夹中以在所有项目中通用应用。

### 示例 CLAUDE.md

```markdown
# 项目上下文

在使用此代码库时，优先考虑可读性而非聪明才智。在进行架构更改之前先提出澄清问题。

## 关于此项目

用于用户身份验证和资料的 FastAPI REST API。使用 SQLAlchemy 进行数据库操作，使用 Pydantic 进行验证。

## 关键目录

- `app/models/` - 数据库模型
- `app/api/` - 路由处理程序
- `app/core/` - 配置和工具

## 标准

- 所有函数都需要类型提示
- pytest 用于测试（fixtures 在 `tests/conftest.py`）
- PEP 8，行长 100 字符

## 常用命令
```bash
uvicorn app.main:app --reload  # 开发服务器
pytest tests/ -v               # 运行测试
```

## 注意事项

所有路由使用 `/api/v1` 前缀。JWT 令牌在 24 小时后过期。
```

### CLAUDE.md 的作用

良好配置的 CLAUDE.md 从根本上改变 Claude 与你的特定项目的工作方式。该文件具有多种用途：

- 提供架构上下文
- 建立工作流程
- 将 Claude 连接到你的开发工具

每个添加都应该解决你遇到的实际问题，而不是关于 Claude 可能需要的理论担忧。

### CLAUDE.md 可以记录的内容

- 常用的 bash 命令
- 核心工具
- 代码风格指南
- 测试说明
- 仓库约定
- 开发者环境设置
- 项目特定警告

**无必需格式**。建议保持文件简洁和人类可读，将其作为人类和 Claude 都需要快速理解的文档。

## 使用 /init 入门

从零开始创建 CLAUDE.md 可能令人生畏，尤其是在不熟悉的代码库中。

### `/init` 命令自动化

`/init` 命令通过分析你的项目并生成入门配置来自动化此过程。

在 Claude Code 会话中运行 `/init`：

```bash
cd your-project
claude
/init
```

Claude 检查你的代码库——读取包文件、现有文档、配置文件和代码结构——然后生成适合你的项目的 CLAUDE.md。生成的文件通常包括：

- 构建命令
- 测试说明
- 关键目录
- 检测到的编码约定

### `/init` 作为起点

将 `/init` 视为起点，而非成品。生成的 CLAUDE.md 捕获了明显的模式，但可能遗漏与你工作流程相关的细微差别。

**审查并改进**：
- 审查生成内容的准确性
- 添加 Claude 无法推断的工作流程说明（分支命名约定、部署流程、代码审查要求）
- 删除不适用于你的项目的通用指导
- 提交到版本控制以使团队受益

### 在现有项目上使用 `/init`

你也可以在已有 CLAUDE.md 的现有项目上使用 `/init`。Claude 将审查当前文件，并根据从探索代码库中学到的知识建议改进。

### 后续步骤

运行 `/init` 后，考虑以下后续步骤：

1. 审查生成内容的准确性
2. 添加 Claude 无法推断的工作流程说明
3. 删除不适用于你项目的通用指导
4. 提交到版本控制

## 如何构建 CLAUDE.md

以下部分展示如何构建内容以实现最大影响：导航复杂架构、跟踪多步骤任务的进度、集成自定义工具、通过一致的工作流程防止返工。

### 为 Claude 提供地图

为每个新任务解释项目架构、关键库和编码风格变得乏味。你需要 Claude 在没有手动强化的情况下保持对代码库结构的一致上下文。

**在 CLAUDE.md 中添加项目摘要和高级目录结构**。这为 Claude 在导航代码库时提供即时定位。

#### 目录树示例

简单的树输出显示关键目录有助于 Claude 了解不同组件的位置：

```markdown
main.py
├── logs
│   ├── application.log
├── modules
│   ├── cli.py
│   ├── logging_utils.py
│   ├── media_handler.py
│   ├── player.py
```

#### 包含的信息

- 主要依赖项
- 架构模式
- 任何非标准的组织选择

如果你使用领域驱动设计、微服务或特定框架，请记录这些。Claude 使用此地图做出更好的决策，了解在哪里找到代码以及在哪里进行更改。

### 将 Claude 连接到你的工具

Claude 继承你的完整环境，但需要指导使用哪些自定义工具和脚本。你的团队可能有专门的工具用于部署、测试或代码生成，Claude 应该了解这些。

**在 CLAUDE.md 中记录自定义工具**，包括使用示例。包括：

- 工具名称
- 基本使用模式
- 何时调用它们

#### MCP 服务器集成

Claude 充当 MCP（模型上下文协议）客户端，连接到扩展其功能的 MCP 服务器。这些通过项目设置、全局配置或检入的 `.mcp.json` 文件配置。

**示例：Slack MCP 配置**

```markdown
### Slack MCP
- 仅发布到 #dev-notifications 频道
- 用于部署通知和构建失败
- 不用于单个 PR 更新（这些通过 GitHub webhooks）
- 限制为每小时 10 条消息
```

### 定义标准工作流程

让 Claude 在没有计划的情况下直接进行代码更改会产生返工。Claude 可能实现遗漏要求的解决方案、选择错误的架构方法或破坏现有功能的更改。

**你需要在行动之前让 Claude 进行思考。** 在 CLAUDE.md 中为不同类型的任务定义 Claude 应遵循的标准工作流程。

#### 四个关键问题

在做出更改之前，可靠的默认工作流程应解决四个问题：

1. **这是否是需要先调查的当前状态问题？**
2. **这是否需要详细的实施计划？**
3. **缺少什么额外信息？**
4. **如何测试有效性？**

#### 具体工作流程

特定工作流程可能包括：
- 功能的 explore-plan-code-commit
- 算法工作的测试驱动开发
- UI 更改的视觉迭代

记录你的测试要求、提交消息格式和任何批准步骤。当 Claude 提前了解你的工作流程时，它会构建工作以匹配团队的实际流程，而不是猜测。

#### 工作流程指令示例

```markdown
1) 在修改以下位置的代码之前：X, Y, Z
    - 考虑它如何影响 A, B, C
    - 构建实施计划
    - 开发将验证以下功能的测试计划...
```

## 使用 Claude Code 的其他技巧

除了配置 CLAUDE.md 文件外，还有三种额外的技术可以改善你与 Claude Code 的工作方式。

### 保持上下文新鲜

随着时间推移使用 Claude Code 会积累不相关的上下文。早期任务的文件内容、不再重要的命令输出和切向对话会填满 Claude 的上下文窗口。随着信噪比下降，Claude 难以保持对当前任务的专注。

**在不同任务之间使用 `/clear` 重置上下文窗口**。这将删除累积的历史记录，同时保留你的 CLAUDE.md 配置和 Claude 解决新问题的能力。

将其视为关闭一个工作会话并打开另一个会话。

#### 何时使用 `/clear`

完成调试身份验证并切换到实现新的 API 端点时，清除上下文。身份验证细节不再重要，会分散新工作的注意力。

### 为不同阶段使用 Subagents

长对话会累积上下文，干扰新任务。你调试了复杂的身份验证流程，现在需要对同一代码进行安全审查。调试细节会影响 Claude 的安全分析，可能导致它忽略问题或专注于已解决的问题。

**告诉 Claude 为工作的不同阶段使用 [subagent](https://code.claude.com/docs/en/sub-agents)**。Subagents 维护隔离的上下文，防止早期任务的信息干扰新分析。

在实施支付处理器后，指示 Claude "使用 sub-agent 对该代码进行安全审查"，而不是在同一对话中继续。

#### Subagents 最佳用例

Subagents 最适用于每个阶段需要不同视角的多步骤工作流程：

- 实施需要架构上下文和功能要求
- 安全审查需要专注于漏洞的新鲜眼光

上下文分离使两者都保持敏锐。

### 创建自定义命令

重复的提示浪费时间。你发现自己反复输入"审查此代码的安全问题"或"分析此性能问题"。每次你需要记住获得良好结果的确切措辞。

**自定义斜杠命令**将这些存储为 ` .claude/commands/ ` 目录中的 markdown 文件。创建名为 `performance-optimization.mm` 的文件，包含你首选的性能优化提示，它在任何对话中都可用作 `/performance-optimization`。

#### 命令参数

命令通过 `$ARGUMENTS` 或编号占位符（如 `$1` 和 `$2`）支持参数，允许你传递特定文件或参数。

#### 示例：性能优化命令

`performance-optimization.md` 可能如下所示：

```markdown
# 性能优化

分析提供的代码是否存在性能瓶颈和优化机会。进行全面审查，涵盖：

## 分析领域

### 数据库和数据访问
- N+1 查询问题和缺少预加载
- 频繁查询的列缺少数据库索引
- 低效的连接或子查询
- 大型结果集缺少分页
- 缺少查询结果缓存
- 连接池问题

### 算法效率
- 时间复杂度问题（存在更好算法时出现 O(n²) 或更差）
- 可以优化的嵌套循环
- 冗余计算或重复工作
- 低效的数据结构选择
- 缺少记忆化或动态规划机会

### 内存管理
- 内存泄漏或保留的引用
- 可以流式传输时加载整个数据集
- 循环中过度的对象实例化
- 不必要地保留在内存中的大型数据结构
- 缺少垃圾回收机会

### 异步和并发
- 应该是异步的阻塞 I/O 操作
- 可以并行运行的顺序操作
- 缺少 Promise.all() 或并发执行模式
- 同步文件操作
- 未优化的工作线程使用

### 网络和 I/O
- 过度的 API 调用（缺少请求批处理）
- 没有响应缓存策略
- 没有压缩的大型有效负载
- 静态资产缺少 CDN 使用
- 缺少连接重用

### 前端性能
- 阻塞渲染的 JavaScript 或 CSS
- 缺少代码分割或懒加载
- 未优化的图像或资产
- 过度的 DOM 操作或回流
- 长列表缺少虚拟化
- 昂贵操作上没有去抖/节流

### 缓存
- 缺少 HTTP 缓存头
- 没有应用级缓存层
- 纯函数缺少记忆化
- 没有缓存清除的静态资产

## 输出格式

对于识别的每个问题：
1. **问题**：描述性能问题
2. **位置**：指定文件/函数/行号
3. **影响**：评级严重性（严重/高/中/低）并解释预期的性能下降
4. **当前复杂度**：包括时间/空间复杂度（如适用）
5. **建议**：提供具体的优化策略
6. **代码示例**：尽可能显示优化版本
7. **预期改进**：如果可量化，量化性能收益

如果代码优化良好：
- 确认优化状态
- 列出正确实施的性能最佳实践
- 注明可能的任何小改进

**要审查的代码：**
```
$ARGUMENTS
```
```

#### 自动创建命令

你无需手动编写自定义命令文件。让 Claude 为你创建：

```javascript
创建一个名为 /performance-optimization 的自定义斜杠命令，用于分析代码的数据库查询问题、算法效率、内存管理和缓存机会。
```

Claude 将把 markdown 文件写入 `.claude/commands/performance-optimization.md`，该命令将立即可用。

## 从简单开始，有意识地扩展

立即创建全面的 CLAUDE.md 很诱人。抵制这种冲动。

### 保持简洁

CLAUDE.md 每次都会添加到 Claude Code 的上下文中，因此从 [context engineering](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents) 和 [prompt engineering](https://www.anthropic.com/engineering/prompt-engineering-overview) 的角度来看，保持简洁。

**选项**：将信息分解为单独的 markdown 文件，并在 CLAUDE.md 文件中引用它们。

### 避免敏感信息

不要包括敏感信息、API 密钥、凭据、数据库连接字符串或详细的安全漏洞信息——特别是如果你提交到版本控制。由于 CLAUDE.md 成为 Claude 系统提示的一部分，将其视为可以公开共享的文档。

## 让 CLAUDE.md 为你服务

CLAUDE.md 文件将 Claude Code 从通用助手转变为专门为你的代码库配置的工具。从基本的项目结构和构建文档开始，然后根据工作流程中的实际摩擦点进行扩展。

**最有效的 CLAUDE.md 文件解决实际问题**：
- 记录你反复输入的命令
- 捕获需要十分钟解释的架构上下文
- 建立防止返工的工作流程

你的文件应反映团队的实际软件开发方式——而不是听起来不错但不匹配现实的理论最佳实践。

将定制视为持续的实践，而不是一次性设置任务。项目会变化，团队会学习更好的模式，新工具会进入你的工作流程。维护良好的 CLAUDE.md 随代码库一起发展，持续减少在复杂软件上使用 AI 辅助的摩擦。

## 相关资源

- [Claude Code 产品页](https://www.claude.com/product/claude-code)
- [CLAUDE.md 最佳实践](https://www.anthropic.com/engineering/claude-code-best-practices)
- [Context Engineering 指南](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
- [Prompt Engineering 概述](https://www.anthropic.com/engineering/prompt-engineering-overview)
- [MCP 基础和最佳实践](https://www.anthropic.com/engineering/building-effective-mcp-servers)
- [Subagents 文档](https://code.claude.com/docs/en/sub-agents)
- [Settings.json 文档](https://code.claude.com/docs/en/settings)

## 相关 Wiki 页面

- [[guides/claude-hooks-configuration-guide|Claude Hooks 配置指南]]
- [[concepts/agentic-coding-benefits|Agentic Coding 的核心好处]]
