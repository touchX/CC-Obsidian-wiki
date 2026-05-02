---
name: guides/claude-hooks-configuration-guide
description: Claude Code Hooks 高级配置指南：自动化重复任务、强制项目规则、注入动态上下文
type: guide
tags: [claude, hooks, configuration, automation, advanced]
created: 2026-05-01
updated: 2026-05-01
source: ../../archive/guides/claude-hooks-configuration-2026-05-01.md
---

# Claude Code Hooks 配置指南

## 概述

即使是流畅的 [Claude Code](https://www.claude.com/product/claude-code) 工作流，也会随时间积累摩擦点：
- 每次写文件后，需要手动运行 [Prettier](https://prettier.io/)
- 每次运行 `npm test`，都出现相同的权限提示
- 每次会话开始，都要粘贴相同的项目上下文样板

**Hooks** 消除这些摩擦点。它们是可配置的触发器，在特定事件发生时自动执行自定义逻辑、脚本和命令。

本文针对熟悉 Claude Code 基础的开发者，涵盖 8 种 Hook 类型、配置方法、调试技巧。

## 什么是 Hook？

Hook 是自定义 shell 命令，在 Claude Code 会话中的特定事件发生时自动执行。

**能力**：
- 拦截操作执行前
- 注入 agent 上下文
- 自动化审批
- 阻止操作发生

**配置方式**：在 settings 文件中使用 JSON 结构，包含事件名称、匹配器（过滤哪些工具触发）、执行的命令。

**执行环境**：本地环境、用户权限、通过 stdin 接收事件信息、通过 exit codes 和 stdout 通信。

## 为什么使用 Hooks？

### 解决三类问题

**1. 消除重复手动步骤**
- PostToolUse Hook 自动运行格式化器
- PermissionRequest Hook 自动批准测试命令

**2. 自动强制项目规则**
- 阻止危险命令执行
- 验证文件路径
- 确保命名规范

**3. 注入动态上下文**
- SessionStart Hook 提供 git status 和 TODO 列表
- UserPromptSubmit Hook 追加 sprint 优先级

## 八种 Hook 类型

### Hook 类型速查表

| Hook | 触发时机 | 常见用途 |
|------|---------|---------|
| **PreToolUse** | 工具执行前 | 阻止危险命令、验证路径、自动批准安全操作 |
| **PermissionRequest** | 权限对话框出现前 | 自动批准测试命令、阻止敏感文件访问 |
| **PostToolUse** | 工具成功完成后 | 运行格式化器、触发 linter、记录文件变更 |
| **PreCompact** | 上下文压缩前 | 备份 transcripts、保留重要决策 |
| **SessionStart** | 会话开始或恢复时 | 注入 git status、加载 TODO 列表、设置环境上下文 |
| **Stop** | Claude 完成响应后 | 验证任务完成、运行测试、生成摘要 |
| **SubagentStop** | Subagent 完成时 | 验证 subagent 输出、触发后续操作 |
| **UserPromptSubmit** | 提交提示时 | 注入 sprint 上下文、验证请求、添加动态上下文 |

### PreToolUse

**最常用 Hook**，在 Claude 选择工具后、实际执行前触发。

**能力**：检查计划的操作、批准、阻止、请求确认、修改参数。

**示例**：验证文件写入

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Write",
        "hooks": [
          {
            "type": "command",
            "command": "/path/to/validate-file-path.sh"
          }
        ]
      }
    ]
  }
}
```

**使用场景**：
- 阻止危险的 Bash 命令（如 `rm -rf`、force push）
- 自动批准安全、重复的操作以减少提示疲劳
- 写入前验证文件路径防止意外覆盖
- 修改工具输入注入项目默认值

### PermissionRequest

**触发时机**：Claude 通常显示权限对话框时。

**能力**：在显示确认提示前拦截，决定允许、拒绝或仍询问用户。

**示例**：自动批准 `npm test` 开头的 Bash 命令

```json
{
  "hooks": {
    "PermissionRequest": [
      {
        "matcher": "Bash(npm test*)",
        "hooks": [
          {
            "type": "command",
            "command": "/path/to/validate-test-command.sh"
          }
        ]
      }
    ]
  }
}
```

**使用场景**：
- 自动批准每会话运行数十次的测试命令
- 阻止对生产配置文件的写入访问
- 允许对特定目录的读操作而不提示
- 拒绝匹配危险模式的任何命令

### PostToolUse

**触发时机**：工具成功完成后立即触发。

**能力**：接收操作信息（包括工具输出），使用 matchers 过滤触发器。

**示例**：对 Claude 写入或编辑的任何文件运行 Prettier

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "prettier --write \"$CLAUDE_TOOL_INPUT_FILE_PATH\""
          }
        ]
      }
    ]
  }
}
```

**使用场景**：
- 每次文件写入后运行 Prettier、Black 或 gofmt
- 记录所有文件修改到审计跟踪
- 代码更改后触发 linter 并显示警告
- 某些操作完成时发送通知

### PreCompact

**触发时机**：Claude 压缩对话上下文以释放空间之前。

**背景**：压缩会总结对话的较旧部分，某些细节会丢失。此 Hook 提供在丢失前保留信息的机会。

**示例**：自动压缩前备份 transcript

```json
{
  "hooks": {
    "PreCompact": [
      {
        "matcher": "auto",
        "hooks": [
          {
            "type": "command",
            "command": "/path/to/backup-transcript.sh"
          }
        ]
      }
    ]
  }
}
```

**matcher 可选值**：`"auto"`（自动压缩）或 `"manual"`（用户触发压缩）

**使用场景**：
- 总结前将完整 transcript 备份到文件
- 提取并保存重要决策或代码片段
- 记录会话里程碑供后续审查

### SessionStart

**触发时机**：Claude Code 开始新会话或恢复现有会话时。

**能力**：脚本输出的任何内容都会添加到对话上下文中，Claude 启动时已加载这些信息。

**示例**：每次会话开始时，Claude 都知道当前 git status 和 TODO 列表

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "git status --short && echo '---' && cat TODO.md"
          }
        ]
      }
    ]
  }
}
```

**stdout 自动变成上下文**

**使用场景**：
- 提供当前 git 分支和最近的提交
- 加载 TODO 列表或 sprint backlog 内容
- 注入环境特定的配置详情

### Stop

**触发时机**：Claude 完成响应并通常等待下一个输入时。

**能力**：脚本可以检查 Claude 生成的内容，决定任务是否真正完成。

**脚本可以返回 JSON**：`{"continue": true}` 使 Claude 继续工作，对多步骤工作流有用。

**示例**：强制 Claude 持续工作直到检查清单完成

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "prompt",
            "prompt": "Review whether the task is complete. If all requirements are met, respond with 'complete'. If work remains, respond with 'continue' and specify what still needs to be done."
          }
        ]
      }
    ]
  }
}
```

**使用场景**：
- 强制 Claude 持续工作直到检查清单所有项完成
- 验证测试通过后才认为任务完成
- 会话结束时触发摘要生成
- 停止前检查生成的代码是否可编译

### SubagentStop

**触发时机**：通过 Task 工具创建的 subagent 完成时。

**工作方式**：与 Stop 相同，但专门在 subagent 完成操作时触发（而非主 agent）。

**配置结构**：镜像 Stop Hook

**示例**：验证 subagent 输出

```json
{
  "hooks": {
    "SubagentStop": [
      {
        "hooks": [
          {
            "type": "prompt",
            "prompt": "Evaluate the subagent's output. Verify the task was completed correctly and the results meet quality standards. If the output is satisfactory, respond with 'accept'. If issues exist, respond with 'reject' and explain what needs to be fixed."
          }
        ]
      }
    ]
  }
}
```

**使用场景**：
- 验证 subagent 输出符合质量标准
- 基于 subagent 结果触发后续操作
- 记录 subagent 活动用于调试或审计

### UserPromptSubmit

**触发时机**：提交提示时，在 Claude 处理之前。

**能力**：脚本通过 stdout 输出的任何内容都会与提示一起添加到 Claude 的上下文中。

**示例**：每次提交提示时，Claude 接收 sprint 上下文文件内容

```json
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "cat ./current-sprint-context.md"
          }
        ]
      }
    ]
  }
}
```

**使用场景**：
- 每次提示注入当前 sprint 上下文或项目优先级
- 提示到达 Claude 前验证提示
- 基于内容阻止某些类型的请求
- 添加动态上下文如最近错误日志或测试结果

## 配置和文件位置

### 三层配置级别

**Hooks 存在于 JSON settings 文件的三个级别**：

| 位置 | 范围 | 可共享 | 路径 |
|------|------|--------|------|
| **项目级** | 单个项目 | 是 | `.claude/settings.json` |
| **用户级** | 所有项目 | 否 | `~/.claude/settings.json` |
| **本地项目** | 单个项目 | 否 | `.claude/settings.local.json` |

**优先级**：项目级设置 > 用户级设置

**企业托管策略设置**：可用于组织控制

**专业提示**：这是同一个文件，可以在此为 Claude 操作设置细粒度权限，在项目、用户或本地级别。

例如：
- 明确允许 Claude 读取目录中所有文件，无需每次批准
- 阻止对敏感文件的任何修改

## Matcher 语法

**Matchers**：过滤哪些工具可以触发 Hook。仅适用于 PreToolUse、PostToolUse 和 PermissionRequest hooks。

### 基础匹配

**简单字符串匹配**：完全符合预期

```json
{
  "matcher": "Write"
}
```

`"Write"` 仅匹配 Write 工具。

### 多工具匹配

**管道语法**：匹配多个工具

```json
{
  "matcher": "Write|Edit"
}
```

`"Write|Edit"` 触发其中任一。

### 通配符

**匹配所有**：`"*"` 或空字符串匹配所有工具。

### 大小写敏感

**Matchers 区分大小写**：`"bash"` 不会匹配到 Bash 工具。

### 参数模式

**精细控制**：`"Bash(npm test*)"` 可匹配特定命令参数。

### MCP 工具模式

**格式**：`"mcp__memory__.*"` 用于 Model Context Protocol 工具。

## 输入、输出和结构化响应

### Hooks 接收的内容

**所有 Hooks 通过 stdin 接收 JSON**，包含会话信息和特定事件数据。

**通用字段**：
- `session_id`
- `transcript_path`
- `cwd`
- `permission_mode`
- `hook_event_name`

**工具相关字段**：
- `tool_name`
- `tool_input`

脚本可以使用这些数据做出明智决策。

### Hooks 响应方式

**Exit codes 决定基本结果**：

| Exit Code | 结果 |
|-----------|------|
| **0** | 成功，stdout 处理为 JSON 或添加到上下文 |
| **2** | 阻止错误，stderr 变成错误消息，操作被阻止 |
| 其他 | 非阻止错误，stderr 在详细模式显示 |

**结构化 JSON 响应**：提供更精细控制

**字段**：
- `decision`: `"approve"`, `"block"`, `"allow"`, `"deny"`
- `reason`: 显示给 Claude 的解释
- `continue`: 对于 Stop hooks 强制继续
- `updatedInput`: 在执行前修改工具参数

## 环境和执行

### 环境变量

**Hooks 可访问的环境变量**：

| 变量 | 说明 |
|------|------|
| `CLAUDE_PROJECT_DIR` | 项目根路径 |
| `CLAUDE_CODE_REMOTE` | Web 环境时为 true |
| `CLAUDE_ENV_FILE` | SessionStart hooks 持久化变量 |

**标准环境变量**：shell 中的标准环境变量也可访问。

### 执行特性

- **默认超时**：60 秒（可每个 Hook 配置）
- **并行执行**：多个 Hook 匹配事件时并行运行
- **自动去重**：相同命令自动去重

## 安全考虑

### Hooks 权限

**Hooks 执行任意 shell 命令**，具有用户权限。

**Claude Code 保护措施**：直接编辑 Hook 配置文件需要先在 `/hooks` 菜单审查，才生效。这防止恶意代码静默添加 Hook 到配置。

**然而**：如果配置并批准了 Hooks，它们将以权限级别执行。

**安全实践**：
- 验证和清理 stdin 的输入
- 引用 shell 变量防止注入
- 脚本使用绝对路径
- 避免处理敏感文件如 `.env` 或凭据

## 调试和测试

### Transcript 日志

**Claude Code 将所有内容记录到 transcript 文件**，提供工具调用和响应的可见性。

**每个 Hook 接收** `transcript_path` 字段，指向包含完整会话历史的 JSONL 文件。

**示例**：SessionStart Hook 记录每个 transcript 的位置

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '\"Session: \" + .transcript_path' >> ~/.claude/sessions.log"
          }
        ]
      }
    ]
  }
}
```

**实时监控**：`tail -f /path/to/transcript.jsonl | jq`

### Hook 专用调试

**添加日志到 Hook 脚本**：transcript 文件显示 Claude 做了什么，但不显示 Hook 为什么采取批准或阻止操作。

**解决方案**：创建小型 bash 脚本包装工具并记录额外信息。

**示例**：`log-wrapper.sh`

```bash
#!/bin/bash
LOG=~/.claude/hooks.log
INPUT=$(cat)

TOOL=$(echo "$INPUT" | jq -r '.tool_name // "n/a"')
EVENT=$(echo "$INPUT" | jq -r '.hook_event_name // "n/a"')

echo "=== $(date) | $EVENT | $TOOL ===" >> "$LOG"

echo "$INPUT" | "$1"
CODE=$?

echo "Exit: $CODE" >> "$LOG"
exit $CODE
```

**包装器脚本功能**：
- 捕获 stdin 到变量
- 记录时间戳和工具名称
- 管道输入到实际工具

**使用方式**：在 Hook 中前置到工具调用

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "log-wrapper.sh your-tool-command.py"
          }
        ]
      }
    ]
  }
}
```

## 构建自己的 Hooks

### 入门建议

**从一个简单的 Hook 开始**，解决工作流中的实际摩擦点。

**推荐起点**：PostToolUse 格式化器 Hook，反馈立即可见。

**一旦有效**，基于学到的经验扩展。

### 完整参考文档

**包含所有可用字段和高级模式**：[官方 Hooks 文档](https://code.claude.com/docs/en/hooks-guide)

### 价值主张

**Hooks 让你塑造 Claude Code 匹配工作流**，而不是调整工作流适应工具。

**投资配置 Hooks 的回报**：每次会话都受益。

## 相关资源

- [Claude Code Hooks 完整文档](https://code.claude.com/docs/en/hooks-guide)
- [[claude-hooks-full|Claude Hooks 官方文档摘要]]（Wiki 现有页面）
- [Claude Code 产品页](https://www.claude.com/product/claude-code)
