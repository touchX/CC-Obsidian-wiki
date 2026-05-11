---
name: subagents
description: Claude Code 子代理 — 专用 AI 助手，实现任务分流和上下文管理
type: concept
tags: [claude-code, subagents, ai-agent, tool-access, 官方文档]
created: 2026-05-11
updated: 2026-05-11
source: ../../../raw/claude/Create custom subagents.md
external_url: https://code.claude.com/docs/en/sub-agents
---

# Claude Code 子代理 (Subagents)

> [!info] 来源
> [官方文档：Create custom subagents](https://code.claude.com/docs/en/sub-agents)

---

## 核心概念

子代理是专门的 AI 助手，用于处理特定类型的任务。当旁线任务（如搜索、日志、文件内容）会淹没主对话时，将任务委托给子代理 — 它在自己的上下文中完成工作，只返回摘要结果。

### 子代理的核心优势

| 优势 | 说明 |
|------|------|
| **保留上下文** | 将探索和实现保持在主对话之外 |
| **强制约束** | 限制子代理可以使用哪些工具 |
| **跨项目复用** | 通过用户级子代理在项目中复用配置 |
| **专业化行为** | 针对特定领域使用专注的系统提示词 |
| **控制成本** | 将任务路由到更快、更便宜的模型（如 Haiku） |

---

## 内置子代理

Claude Code 包含几个内置子代理，Claude 会在适当时自动使用：

| 子代理 | 模型 | 工具 | 用途 |
|--------|------|------|------|
| **Explore** | Haiku | 只读（无 Write/Edit） | 文件发现、代码搜索、代码库探索 |
| **Plan** | - | - | 规划复杂任务 |
| **General-purpose** | - | - | 通用任务处理 |
| **Other** | - | - | 其他专业任务 |

---

## 子代理作用域

子代理文件存储在不同位置，作用域不同。多个子代理同名时，优先级高的生效：

| 位置 | 作用域 | 优先级 | 创建方式 |
|------|--------|--------|----------|
| 托管设置 | 组织级 | 1（最高） | 通过托管设置部署 |
| `--agents` CLI 标志 | 当前会话 | 2 | 启动时传递 JSON |
| `.claude/agents/` | 当前项目 | 3 | 交互式或手动 |
| `~/.claude/agents/` | 所有项目 | 4 | 交互式或手动 |
| 插件 `agents/` 目录 | 插件启用范围 | 5（最低） | 随插件安装 |

---

## 创建子代理

### 方式一：使用 /agents 命令

```bash
claude agents
```

`/agents` 命令打开标签页界面：
- **Running** 标签：显示运行中的子代理，可打开或停止
- **Library** 标签：查看、创建、编辑、删除子代理

### 方式二：手动编写文件

```markdown
---
name: code-reviewer
description: Reviews code for quality and best practices
tools: Read, Glob, Grep
model: sonnet
---

You are a code reviewer. When invoked, analyze the code and provide
specific, actionable feedback on quality, security, and best practices.
```

---

## Frontmatter 字段

| 字段 | 必需 | 说明 |
|------|------|------|
| `name` | ✅ | 唯一标识符（小写字母和连字符） |
| `description` | ✅ | Claude 何时委托给此子代理 |
| `tools` | 否 | 允许使用的工具列表 |
| `disallowedTools` | 否 | 禁止使用的工具 |
| `model` | 否 | `sonnet`、`opus`、`haiku` 或 `inherit` |
| `permissionMode` | 否 | 权限模式：`default`、`acceptEdits`、`auto`、`dontAsk`、`bypassPermissions`、`plan` |
| `maxTurns` | 否 | 子代理停止前的最大轮数 |
| `skills` | 否 | 预加载到子代理上下文的技能 |
| `mcpServers` | 否 | 可用的 MCP 服务器 |
| `hooks` | 否 | 作用域到此子代理的生命周期钩子 |
| `memory` | 否 | 持久记忆范围：`user`、`project` 或 `local` |
| `background` | 否 | 设为 `true` 始终作为后台任务运行 |
| `effort` | 否 | 工作量级别：`low`、`medium`、`high`、`xhigh`、`max` |
| `isolation` | 否 | 设为 `worktree` 在临时 git worktree 中运行 |
| `color` | 否 | 显示颜色：`red`、`blue`、`green`、`yellow`、`purple`、`orange`、`pink`、`cyan` |

---

## 工具控制

### 可用工具

默认情况下，子代理继承主对话的所有工具（包括 MCP 工具）。

使用 `tools`（白名单）或 `disallowedTools`（黑名单）限制工具：

```yaml
---
name: safe-researcher
description: Research agent with restricted capabilities
tools: Read, Grep, Glob, Bash
---
```

此配置只允许读取和搜索，子代理无法编辑文件或使用 MCP 工具。

### 权限模式

| 模式 | 说明 |
|------|------|
| `default` | 标准权限确认 |
| `acceptEdits` | 自动接受编辑 |
| `auto` | 自动决策 |
| `dontAsk` | 不询问 |
| `bypassPermissions` | 绕过权限检查 |
| `plan` | 仅计划模式 |

---

## CLI 定义子代理

通过 `--agents` 标志在启动时传递 JSON（仅当前会话有效）：

```bash
claude --agents '{
  "code-reviewer": {
    "description": "Expert code reviewer",
    "prompt": "You are a senior code reviewer.",
    "tools": ["Read", "Grep", "Glob", "Bash"],
    "model": "sonnet"
  }
}'
```

---

## 模型选择

| 值 | 说明 |
|------|------|
| `sonnet` | 主力开发模型 |
| `opus` | 深度推理和研究 |
| `haiku` | 快速、低延迟、轻量级 |
| `inherit` | 继承主对话的模型 |
| 完整模型 ID | 如 `claude-opus-4-7` |

模型解析优先级：
1. `CLAUDE_CODE_SUBAGENT_MODEL` 环境变量
2. 每次调用的 `model` 参数
3. 子代理定义的 `model` frontmatter
4. 主对话的模型

---

## 与子代理团队的区别

| 维度 | 子代理 | 子代理团队 |
|------|--------|-----------|
| **上下文** | 独立上下文窗口，结果返回调用者 | 独立上下文窗口，完全独立 |
| **通信** | 只向主代理报告结果 | 队友之间直接消息传递 |
| **协调** | 主代理管理所有工作 | 共享任务列表，自主协调 |
| **适用场景** | 只需要结果的重点任务 | 需要讨论和协作的复杂工作 |
| **Token 成本** | 较低 | 较高 |

---

## 相关资源

- [官方文档](https://code.claude.com/docs/en/sub-agents)
- [[agent-teams]] — 子代理团队（需要通信的协作场景）
- [[claude-commands]] — Claude Code 命令参考
- [[hooks]] — 生命周期钩子配置

---

*文档创建于 2026-05-11*
*来源：code.claude.com*
