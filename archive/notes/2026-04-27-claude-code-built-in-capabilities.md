---
name: notes/2026-04-27-claude-code-built-in-capabilities
description: Claude Code 45+ 内置工具完整参考，按功能分类
type: insight
tags: [session, tools, built-in, reference]
created: 2026-04-27
source: conversation
---

# Claude Code 内置工具详解

## 工具概述

Claude Code 内置 45+ 工具，帮助它理解和修改代码库。工具名称是权限规则、subagent 工具列表和 hook 匹配器中使用的确切字符串。

## 六大类别

| 类别 | 数量 | 用途 |
|------|------|------|
| 文件操作 | 8 | Read/Edit/Write/Glob |
| 搜索 | 3 | Grep/LSP/Monitor |
| 执行 | 4 | Bash/PowerShell/TaskStop |
| Agent编排 | 3 | Agent/SendMessage/TeamCreate |
| 任务管理 | 5 | TodoWrite/TaskList/TaskUpdate |
| 网络 | 3 | WebFetch/WebSearch |
| 其他 | 19 | Cron/Monitor/Skill等 |

## 文件操作工具

| 工具 | 描述 | 需要权限 |
|------|------|--------|
| `Read` | 读取文件内容 | 否 |
| `Edit` | 对特定文件进行有针对性的编辑 | 是 |
| `Write` | 创建或覆盖文件 | 是 |
| `Glob` | 基于模式匹配查找文件 | 否 |
| `Grep` | 在文件内容中搜索模式 | 否 |
| `NotebookEdit` | 修改 Jupyter notebook 单元格 | 是 |

## Agent 编排工具

| 工具 | 描述 | 需要权限 |
|------|------|--------|
| `Agent` | 生成 subagent 处理任务 | 否 |
| `SendMessage` | 向 agent 队友发送消息 | 否 |
| `TeamCreate` | 创建多 agent 团队 | 否 |
| `TeamDelete` | 解散 agent 团队 | 否 |

## 任务管理工具

| 工具 | 描述 |
|------|------|
| `TodoWrite` | 管理会话任务清单 |
| `TaskCreate` | 创建任务 |
| `TaskList` | 列出所有任务 |
| `TaskUpdate` | 更新任务状态 |
| `TaskStop` | 终止后台任务 |

## 定时任务工具

| 工具 | 描述 |
|------|------|
| `CronCreate` | 安排定期或一次性提示 |
| `CronDelete` | 取消计划任务 |
| `CronList` | 列出会话计划任务 |

## 网络工具

| 工具 | 描述 | 需要权限 |
|------|------|--------|
| `WebFetch` | 从指定 URL 获取内容 | 是 |
| `WebSearch` | 执行网络搜索 | 是 |

## 代码智能工具

| 工具 | 描述 |
|------|------|
| `LSP` | 通过语言服务器进行代码智能 |

## 执行工具

| 工具 | 描述 | 需要权限 |
|------|------|--------|
| `Bash` | 执行 shell 命令 | 是 |
| `PowerShell` | 本地执行 PowerShell | 是 |
| `Monitor` | 在后台运行命令并对变化做出反应 | 是 |

## 模式切换工具

| 工具 | 描述 |
|------|------|
| `EnterPlanMode` | 切换到 Plan Mode |
| `ExitPlanMode` | 退出 Plan Mode |
| `EnterWorktree` | 创建隔离的 git worktree |
| `ExitWorktree` | 退出 worktree 会话 |

## 提问工具

| 工具 | 描述 |
|------|------|
| `AskUserQuestion` | 提出多选问题收集需求 |

## MCP 资源工具

| 工具 | 描述 |
|------|------|
| `ListMcpResourcesTool` | 列出连接的 MCP servers 公开的资源 |
| `ReadMcpResourceTool` | 按 URI 读取特定 MCP 资源 |

## Skill 工具

| 工具 | 描述 | 需要权限 |
|------|------|--------|
| `Skill` | 在主对话中执行 skill | 是 |

## ToolSearch 工具

| 工具 | 描述 |
|------|------|
| `ToolSearch` | 搜索并加载延迟的 MCP 工具 |

## 权限说明

- **需要权限**: 首次使用会触发权限请求，用户同意后记住
- **无需权限**: 可直接使用
- 权限可通过 `~/.claude.json` 的 `allowedTools` 配置自动授予

## 检查可用工具

在 Claude Code 中运行：
```text
What tools do you have access to?
```

## 相关 Wiki 页面
- [[wiki/entities/claude-commands]] — 斜杠命令系统
- [[wiki/entities/claude-mcp]] — MCP 服务器扩展
- [[raw/notes/2026-04-27-mcp-detailed-overview]] — MCP 机制详解