---
name: entities/claude-tools
description: Claude Code 内置工具完整参考，包括权限要求和行为说明
type: entity
tags: [tools, reference, permissions, built-in]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/工具参考.md
related:
  - raw/notes/2026-04-27-claude-code-built-in-capabilities.md
---

# Claude 工具参考

Claude Code 可以访问一组内置工具，帮助它理解和修改您的代码库。工具名称是您在权限规则、subagent 工具列表和 hook 匹配器中使用的确切字符串。

## 六大类别概览

| 类别 | 数量 | 用途 |
|------|------|------|
| 文件操作 | 8 | Read/Edit/Write/Glob |
| 搜索 | 3 | Grep/LSP/Monitor |
| 执行 | 4 | Bash/PowerShell/TaskStop |
| Agent 编排 | 3 | Agent/SendMessage/TeamCreate |
| 任务管理 | 5 | TodoWrite/TaskList/TaskUpdate |
| 网络 | 3 | WebFetch/WebSearch |
| 其他 | 19+ | Cron/Skill 等 |

## 工具列表

| 工具 | 描述 | 需要权限 |
| --- | --- | --- |
| `Agent` | 生成一个具有自己 context window 的 subagent，用于处理任务 | 否 |
| `AskUserQuestion` | 提出多选问题以收集需求或澄清歧义 | 否 |
| `Bash` | 在您的环境中执行 shell 命令 | 是 |
| `CronCreate` | 在当前会话中安排定期或一次性提示 | 否 |
| `CronDelete` | 按 ID 取消计划任务 | 否 |
| `CronList` | 列出会话中的所有计划任务 | 否 |
| `Edit` | 对特定文件进行有针对性的编辑 | 是 |
| `EnterPlanMode` | 切换到 Plan Mode 以在编码前设计方法 | 否 |
| `EnterWorktree` | 创建隔离的 git worktree 并切换到它 | 否 |
| `ExitPlanMode` | 提出计划以供批准并退出 Plan Mode | 是 |
| `ExitWorktree` | 退出 worktree 会话并返回到原始目录 | 否 |
| `Glob` | 基于模式匹配查找文件 | 否 |
| `Grep` | 在文件内容中搜索模式 | 否 |
| `ListMcpResourcesTool` | 列出连接的 MCP servers 公开的资源 | 否 |
| `LSP` | 通过语言服务器进行代码智能 | 否 |
| `Monitor` | 在后台运行命令并对日志/状态变化做出反应 | 是 |
| `NotebookEdit` | 修改 Jupyter notebook 单元格 | 是 |
| `PowerShell` | 本地执行 PowerShell 命令 | 是 |
| `Read` | 读取文件内容 | 否 |
| `ReadMcpResourceTool` | 按 URI 读取特定 MCP 资源 | 否 |
| `SendMessage` | 向 agent 队友发送消息或恢复 subagent | 否 |
| `Skill` | 在主对话中执行 skill | 是 |
| `TaskCreate` | 在任务列表中创建新任务 | 否 |
| `TaskGet` | 检索特定任务的完整详细信息 | 否 |
| `TaskList` | 列出所有任务及其当前状态 | 否 |
| `TaskStop` | 按 ID 终止运行中的后台任务 | 否 |
| `TaskUpdate` | 更新任务状态、依赖项、详细信息或删除任务 | 否 |
| `TeamCreate` | 创建具有多个队友的 agent team | 否 |
| `TeamDelete` | 解散 agent team 并清理队友进程 | 否 |
| `TodoWrite` | 管理会话任务清单 | 否 |
| `ToolSearch` | 搜索并加载延迟的 MCP 工具 | 否 |
| `WebFetch` | 从指定 URL 获取内容 | 是 |
| `WebSearch` | 执行网络搜索 | 是 |
| `Write` | 创建或覆盖文件 | 是 |

## Bash 工具行为

Bash 工具在单独的进程中运行每个命令，具有以下持久性行为：

- 当 Claude 在主会话中运行 `cd` 时，只要它保持在项目目录内或额外工作目录内，新的工作目录就会延续到后续的 Bash 命令。Subagent 会话永远不会延续工作目录更改。
- 如果 `cd` 落在这些目录之外，Claude Code 会重置为项目目录。
- 要禁用此延续，使每个 Bash 命令都在项目目录中启动，请设置 `CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR=1`。
- 环境变量不持久。一个命令中的 `export` 在下一个命令中将不可用。

在启动 Claude Code 之前激活您的 virtualenv 或 conda 环境。

## LSP 工具行为

LSP 工具为 Claude 提供来自运行中的语言服务器的代码智能：

- 跳转到符号的定义
- 查找对符号的所有引用
- 获取位置处的类型信息
- 列出文件或工作区中的符号
- 查找接口的实现
- 追踪调用层次结构

## Monitor 工具

Monitor 工具让 Claude 在后台监视某些内容，并在其更改时做出反应：

- 跟踪日志文件并在错误出现时标记它们
- 轮询 PR 或 CI 作业并在其状态更改时报告
- 监视目录以查找文件更改
- 跟踪长时间运行脚本的输出

## PowerShell 工具

PowerShell 工具让 Claude 本地运行 PowerShell 命令。在 Windows 上，这意味着命令在 PowerShell 中运行，而不是通过 Git Bash 路由。

启用方法：在环境或 `settings.json` 中设置 `CLAUDE_CODE_USE_POWERSHELL_TOOL=1`

## 检查哪些工具可用

运行以下命令检查在运行中的会话中加载了什么：

```text
What tools do you have access to?
```

## 另请参阅

- [MCP servers](https://code.claude.com/docs/zh-CN/mcp) — 通过连接外部服务器添加自定义工具
- [[claude-cli]] — CLI 完整指南
- [[claude-commands]] — 命令系统
