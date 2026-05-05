---
claude.hooks.configuration.guide
name: guides/claude-hooks-configuration-guide
description: Claude Code Hooks 完整参考指南：30+ 种 Hook 事件、配置架构、输入输出格式、高级特性（MCP hooks、HTTP hooks、async hooks）
type: guide
tags: [claude, hooks, configuration, automation, advanced, reference]
created: 2026-05-01
updated: 2026-05-04
source: ../../raw/claude/Hooks reference.md
---

# Claude Code Hooks 配置指南

> 本页面是 Claude Code Hooks 的完整参考文档，包含 30+ 种 Hook 事件、完整配置架构、输入输出格式和高级特性。如需快速入门指南和示例，参见 [[claude-hooks-guide|Claude Hooks 入门指南]]。

## 概述

Hooks 是用户定义的 shell 命令、HTTP 端点或 LLM prompt，在 Claude Code 生命周期中的特定点自动执行。使用本参考文档可以查找事件 schema、配置选项、JSON 输入输出格式以及高级特性（如 async hooks、HTTP hooks 和 MCP tool hooks）。

## Hook 生命周期

Hooks 在 Claude Code 会话中的特定点触发。当事件触发且 matcher 匹配时，Claude Code 将 JSON 上下文传递给 Hook 处理器。

事件分为三个节奏：
- **每会话一次**：`SessionStart`、`SessionEnd`
- **每轮一次**：`UserPromptSubmit`、`Stop`、`StopFailure`
- **每次工具调用**（Agentic Loop）：`PreToolUse`、`PostToolUse`、`PostToolBatch` 等

### Hook 事件速查表

| 事件 | 触发时机 | 是否可阻止 |
|------|----------|-----------|
| `SessionStart` | 会话开始或恢复时 | ❌ |
| `Setup` | `--init-only` 或 `-p --init/maintenance` 时 | ❌ |
| `UserPromptSubmit` | 提交提示时，在 Claude 处理前 | ✅ |
| `UserPromptExpansion` | 斜杠命令展开时 | ✅ |
| `PreToolUse` | 工具调用执行前 | ✅ |
| `PermissionRequest` | 权限对话框出现时 | ✅ |
| `PermissionDenied` | 自动模式分类器拒绝工具调用 | ❌ (可重试) |
| `PostToolUse` | 工具调用成功后 | ❌ |
| `PostToolUseFailure` | 工具调用失败后 | ❌ |
| `PostToolBatch` | 并行工具调用批次完成后 | ✅ |
| `Notification` | Claude Code 发送通知时 | ❌ |
| `SubagentStart` | Subagent 启动时 | ❌ |
| `SubagentStop` | Subagent 停止时 | ✅ |
| `TaskCreated` | 创建 Task 时 | ✅ |
| `TaskCompleted` | Task 标记为完成时 | ✅ |
| `Stop` | Claude 完成响应时 | ✅ |
| `StopFailure` | API 错误导致回合结束时 | ❌ |
| `TeammateIdle` | Agent Team 队友即将空闲 | ✅ |
| `InstructionsLoaded` | CLAUDE.md 或规则文件加载时 | ❌ |
| `ConfigChange` | 配置文件变更时 | ✅ |
| `CwdChanged` | 工作目录变更时 | ❌ |
| `FileChanged` | 监视文件变更时 | ❌ |
| `WorktreeCreate` | 创建 git worktree 时 | ✅ |
| `WorktreeRemove` | 移除 git worktree 时 | ❌ |
| `PreCompact` | 上下文压缩前 | ✅ |
| `PostCompact` | 上下文压缩完成后 | ❌ |
| `Elicitation` | MCP 服务器请求用户输入时 | ✅ |
| `ElicitationResult` | 用户响应 MCP 询问后 | ✅ |
| `SessionEnd` | 会话终止时 | ❌ |

## 配置架构

Hooks 在 JSON 设置文件中定义，配置有三级嵌套：

1. **选择 Hook 事件**（如 `PreToolUse`、`Stop`）
2. **添加 Matcher 组**过滤触发条件（如"仅对 Bash 工具"）
3. **定义一个或多个 Hook 处理器**（shell 命令、HTTP 端点、MCP 工具、prompt 或 agent）

### 配置位置

| 位置 | 范围 | 可共享 |
|------|------|--------|
| `~/.claude/settings.json` | 所有项目 | 否 |
| `.claude/settings.json` | 单个项目 | ✅ |
| `.claude/settings.local.json` | 单个项目 | 否 |
| 托管策略设置 | 组织范围 | ✅ |
| 插件 `hooks/hooks.json` | 插件启用时 | ✅ |
| Skill/Agent frontmatter | 组件活跃时 | ✅ |

### Matcher 语法

| Matcher 值 | 解析为 | 示例 |
|-----------|--------|------|
| `"*"`, `""`, 或省略 | 匹配所有 | 所有事件 |
| 仅字母、数字、`_` 和 `\|` | 精确字符串或 `\|` 分隔列表 | `Bash` 匹配 Bash 工具；`Edit\|Write` 匹配两者 |
| 包含其他字符 | JavaScript 正则表达式 | `^Notebook` 匹配任何 Notebook 工具；`mcp__memory__.*` 匹配 memory 服务器的所有工具 |

**MCP 工具匹配**：MCP 服务器工具遵循命名模式 `mcp__<server>__<tool>`，如：
- `mcp__memory__create_entities` — Memory 服务器的 create entities 工具
- `mcp__filesystem__read_file` — Filesystem 服务器的 read file 工具

### 五种 Hook 类型

| 类型 | 字段 | 说明 |
|------|------|------|
| **command** | `command` | 执行 shell 命令，stdin 接收 JSON 输入 |
| **http** | `url`, `headers` | 发送 HTTP POST 请求到 URL |
| **mcp_tool** | `server`, `tool`, `input` | 调用已连接的 MCP 服务器工具 |
| **prompt** | `prompt`, `model` | 发送 prompt 到 Claude 模型进行评估 |
| **agent** | `prompt`, `model` | 启动可使用工具的 subagent（实验性） |

### Hook 处理器通用字段

| 字段 | 必需 | 说明 |
|------|------|------|
| `type` | ✅ | `"command"`, `"http"`, `"mcp_tool"`, `"prompt"`, 或 `"agent"` |
| `if` | 否 | 权限规则语法进一步过滤，如 `"Bash(git *)"` |
| `timeout` | 否 | 超时秒数，默认：600(command)、30(prompt)、60(agent) |
| `statusMessage` | 否 | Hook 运行时的自定义加载消息 |
| `once` | 否 | `true` 时每个会话运行一次后移除（仅 Skill/Agent frontmatter） |

### Command Hook 特有字段

| 字段 | 必需 | 说明 |
|------|------|------|
| `command` | ✅ | 要执行的 shell 命令 |
| `async` | 否 | `true` 时在后台运行不阻塞 |
| `asyncRewake` | 否 | `true` 时后台运行，exit code 2 时唤醒 Claude |
| `shell` | 否 | `"bash"`（默认）或 `"powershell"` |

### HTTP Hook 特有字段

| 字段 | 必需 | 说明 |
|------|------|------|
| `url` | ✅ | POST 请求的 URL |
| `headers` | 否 | 额外 HTTP 头，支持 `$VAR_NAME` 环境变量插值 |
| `allowedEnvVars` | 否 | 可用于插值的环境变量名列表 |

### MCP Tool Hook 特有字段

| 字段 | 必需 | 说明 |
|------|------|------|
| `server` | ✅ | 已配置的 MCP 服务器名称 |
| `tool` | ✅ | 在该服务器上调用的工具名 |
| `input` | 否 | 传递给工具的参数，支持 `${path}` 替换 |

### Prompt/Agent Hook 特有字段

| 字段 | 必需 | 说明 |
|------|------|------|
| `prompt` | ✅ | 发送给模型的 prompt，使用 `$ARGUMENTS` 作为 hook 输入 JSON 的占位符 |
| `model` | 否 | 评估使用的模型，默认为快速模型 |

## 输入和输出

### 通用输入字段

所有 Hook 事件通过 stdin 接收 JSON，包含：

| 字段 | 说明 |
|------|------|
| `session_id` | 当前会话标识符 |
| `transcript_path` | 对话 JSONL 文件路径 |
| `cwd` | Hook 调用时的当前工作目录 |
| `permission_mode` | 当前权限模式：`"default"`, `"plan"`, `"acceptEdits"`, `"auto"`, `"dontAsk"`, `"bypassPermissions"` |
| `hook_event_name` | 触发的事件名称 |

Subagent 内运行时额外字段：
| `agent_id` | Subagent 的唯一标识符 |
| `agent_type` | Agent 名称（如 `"Explore"`） |

### Exit Code 输出

| Exit Code | 含义 |
|-----------|------|
| **0** | 成功。解析 stdout 为 JSON 输出 |
| **2** | 阻止错误。stderr 反馈为错误消息，操作被阻止 |
| **其他** | 非阻止错误。stderr 显示在 transcript，执行继续 |

### 阻止行为（按事件）

| 事件 | Exit 2 行为 |
|------|------------|
| `PreToolUse` | 阻止工具调用 |
| `PermissionRequest` | 拒绝权限 |
| `UserPromptSubmit` | 阻止提示处理并清除 |
| `UserPromptExpansion` | 阻止展开 |
| `Stop` | 阻止停止，继续对话 |
| `SubagentStop` | 阻止 subagent 停止 |
| `TeammateIdle` | 阻止队友空闲（继续工作） |
| `TaskCreated` | 回滚任务创建 |
| `TaskCompleted` | 阻止标记为完成 |
| `ConfigChange` | 阻止配置变更生效（`policy_settings` 除外） |
| `PostToolBatch` | 停止 agentic loop |
| `Elicitation` | 拒绝 elicitation |
| `ElicitationResult` | 阻止响应 |
| `WorktreeCreate` | 任何非零 exit code 导致创建失败 |

### JSON 输出

```json
{
  "continue": true,           // false 时停止处理
  "stopReason": "...",        // continue=false 时显示给用户
  "suppressOutput": false,    // true 时从调试日志省略 stdout
  "systemMessage": "..."      // 显示给用户的警告消息
}
```

### 决策控制模式

| 事件 | 决策模式 | 关键字段 |
|------|----------|----------|
| `UserPromptSubmit`, `PostToolBatch`, `Stop`, `SubagentStop`, `ConfigChange`, `PreCompact` | Top-level `decision` | `decision: "block"`, `reason` |
| `PreToolUse` | `hookSpecificOutput` | `permissionDecision` (allow/deny/ask/defer) |
| `PermissionRequest` | `hookSpecificOutput` | `decision.behavior` (allow/deny) |
| `PermissionDenied` | `hookSpecificOutput` | `retry: true` 允许模型重试 |
| `TeammateIdle`, `TaskCreated`, `TaskCompleted` | Exit code 或 `continue: false` | 阻止动作 |

### 为 Claude 添加上下文

`additionalContext` 字段将字符串注入 Claude 的上下文窗口：

```json
{
  "hookSpecificOutput": {
    "hookEventName": "PostToolUse",
    "additionalContext": "This file is generated. Edit src/schema.ts and run `bun generate` instead."
  }
}
```

## 主要 Hook 事件详解

### PreToolUse

在工具调用执行前触发，是最常用的 Hook 类型。

**输入示例**：
```json
{
  "session_id": "abc123",
  "hook_event_name": "PreToolUse",
  "tool_name": "Bash",
  "tool_input": { "command": "npm test" },
  "tool_use_id": "toolu_01abc"
}
```

**决策控制**：
```json
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "allow",      // allow/deny/ask/defer
    "permissionDecisionReason": "安全命令",
    "updatedInput": { ... },            // 修改工具参数
    "additionalContext": "..."          // 添加上下文
  }
}
```

### PermissionRequest

权限对话框出现时触发，可代表用户自动批准或拒绝。

**输入示例**：
```json
{
  "session_id": "abc123",
  "hook_event_name": "PermissionRequest",
  "tool_name": "Bash",
  "tool_input": { "command": "rm -rf node_modules" },
  "permission_suggestions": [...]
}
```

**决策控制**：
```json
{
  "hookSpecificOutput": {
    "hookEventName": "PermissionRequest",
    "decision": {
      "behavior": "allow",              // allow/deny
      "updatedInput": { ... },          // 可选：修改工具输入
      "updatedPermissions": [...]       // 可选：更新权限规则
    }
  }
}
```

### PostToolUse

工具成功完成后触发，用于格式化、linting、记录等。

**输入示例**：
```json
{
  "session_id": "abc123",
  "hook_event_name": "PostToolUse",
  "tool_name": "Write",
  "tool_input": { "file_path": "/path/to/file.ts", "content": "..." },
  "tool_output": { ... }
}
```

**使用场景**：
- 自动运行 Prettier/ESLint
- 记录文件变更
- 触发测试

### SessionStart

会话开始或恢复时触发，用于加载开发上下文。

**持久化环境变量**：
```bash
# 写入环境变量到 CLAUDE_ENV_FILE
echo 'export NODE_ENV=production' >> "$CLAUDE_ENV_FILE"
echo 'export PATH="$PATH:./node_modules/.bin"' >> "$CLAUDE_ENV_FILE"
```

### UserPromptSubmit

提交提示时触发，可在处理前验证或注入上下文。

**阻止提示**：
```json
{
  "decision": "block",
  "reason": "禁止的命令模式",
  "hookSpecificOutput": {
    "hookEventName": "UserPromptSubmit",
    "additionalContext": "添加的上下文内容"
  }
}
```

### Stop

Claude 完成响应时触发，用于最终验证或生成摘要。

**强制继续工作**：
```json
{
  "continue": true,
  "hookSpecificOutput": {
    "hookEventName": "Stop",
    "systemMessage": "任务未完成，继续工作中..."
  }
}
```

### PreCompact / PostCompact

上下文压缩前后触发，用于备份或保存重要信息。

### SubagentStart / SubagentStop

Subagent 启动/停止时触发，用于验证输出或触发后续操作。

### Elicitation / ElicitationResult

MCP 服务器请求用户输入时触发，可自动处理或阻止。

**决策控制**：
```json
{
  "hookSpecificOutput": {
    "hookEventName": "Elicitation",
    "action": "accept",    // accept/decline/cancel
    "content": { ... }     // 表单字段值
  }
}
```

## 高级特性

### Async Hooks

异步 Hook 在后台运行，不阻塞执行：

```json
{
  "type": "command",
  "command": "/path/to/run-tests.sh",
  "async": true,
  "timeout": 120
}
```

### HTTP Hooks

发送事件到远程服务：

```json
{
  "type": "http",
  "url": "http://localhost:8080/hooks/pre-tool-use",
  "headers": { "Authorization": "Bearer $MY_TOKEN" },
  "allowedEnvVars": ["MY_TOKEN"]
}
```

### MCP Tool Hooks

调用 MCP 服务器工具：

```json
{
  "type": "mcp_tool",
  "server": "my_server",
  "tool": "security_scan",
  "input": { "file_path": "${tool_input.file_path}" }
}
```

### Prompt Hooks

使用 LLM 进行决策：

```json
{
  "type": "prompt",
  "prompt": "Review this code change. If it looks safe, respond with 'approve'. If there are security concerns, respond with 'block' and explain why: $ARGUMENTS"
}
```

### Agent Hooks

启动 subagent 验证条件（实验性）：

```json
{
  "type": "agent",
  "prompt": "Verify that all tests pass in the repository. Check the test output and report back.",
  "timeout": 60
}
```

## 完整配置示例

### 自动格式化

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "prettier --write \"$CLAUDE_PROJECT_DIR/${tool_input.file_path}\""
          }
        ]
      }
    ]
  }
}
```

### 安全验证

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "if": "Bash(rm *|chmod *|chown *)",
            "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/validate-destructive.sh"
          }
        ]
      }
    ]
  }
}
```

### 会话初始化

```json
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "startup",
        "hooks": [
          {
            "type": "command",
            "command": "echo \"Branch: $(git branch --show-current)\nStatus: $(git status --short)\""
          }
        ]
      }
    ]
  }
}
```

### 自动批准测试

```json
{
  "hooks": {
    "PermissionRequest": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "if": "Bash(npm test*|pytest *|cargo test*)",
            "command": "echo '{\"hookSpecificOutput\": {\"hookEventName\": \"PermissionRequest\", \"decision\": {\"behavior\": \"allow\"}}}'"
          }
        ]
      }
    ]
  }
}
```

## 调试和故障排除

### /hooks 菜单

在 Claude Code 中输入 `/hooks` 可打开只读浏览器，查看所有配置的 Hook、来源文件、完整命令/prompt/URL。

### 常见问题

**JSON 解析失败**：
- 检查 shell profile 是否在启动时打印文本
- 确保 stdout 只包含 JSON 对象（无额外输出）

**Hook 不触发**：
- 确认 `enabled: true` 设置
- 检查 matcher 语法是否正确
- 验证规则文件路径

**Exit code 行为**：
- Exit 0 = 成功/允许
- Exit 2 = 阻止/拒绝
- 其他 = 非阻止错误（执行继续）

## 相关资源

- [Claude Code Hooks 官方文档](https://code.claude.com/docs/en/hooks)
- [Claude Code Hooks 入门指南](https://code.claude.com/docs/en/hooks-guide)
- [[claude-hooks-guide|Claude Hooks 快速入门]]
- [Claude Code 产品页](https://www.claude.com/product/claude-code)