---
name: sources/claude-hooks-full
description: Claude Code 官方 Hooks 完整文档 - 自动化工作流配置
type: source
tags: [claude, hooks, documentation, official]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/使用 hooks 自动化工作流.md
---

Hooks 是用户定义的 shell 命令，在 Claude Code 生命周期中的特定点执行。它们对 Claude Code 的行为提供确定性控制，确保某些操作始终发生，而不是依赖 LLM 选择运行它们。使用 hooks 来强制执行项目规则、自动化重复任务，并将 Claude Code 与现有工具集成。

有关完整的参考文档，请访问：https://code.claude.com/docs/zh-CN/hooks-guide

## 核心概念

### Hook 事件类型

| Event | When it fires |
| --- | --- |
| `SessionStart` | 当会话开始或恢复时 |
| `UserPromptSubmit` | 当你提交提示时，在 Claude 处理之前 |
| `PreToolUse` | 在工具调用执行之前 |
| `PostToolUse` | 在工具调用成功之后 |
| `PermissionRequest` | 当权限对话框出现时 |
| `Stop` | 当 Claude 完成响应时 |
| `SubagentStart` | 当 subagent 启动时 |
| `SubagentStop` | 当 subagent 停止时 |
| `ConfigChange` | 当配置文件在会话期间更改时 |
| `CwdChanged` | 当工作目录更改时 |

### Hook 输出控制

- **退出 0**：操作继续
- **退出 2**：阻止操作（stderr 变成 Claude 的反馈）
- **JSON 结构化输出**：提供更精细的控制

### Hook 类型

- **命令 hooks** (`type: "command"`): 运行 shell 命令
- **HTTP hooks** (`type: "http"`): POST 事件数据到 URL
- **MCP tool hooks** (`type: "mcp_tool"`): 调用 MCP 服务器工具
- **基于提示的 hooks** (`type: "prompt"`): 单轮 LLM 评估
- **基于代理的 hooks** (`type: "agent"`): 多轮验证（实验性）

## 常见用例

### 在 Claude 需要输入时获得通知

```json
{
  "hooks": {
    "Notification": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "osascript -e 'display notification \"Claude Code needs your attention\" with title \"Claude Code\"'"
          }
        ]
      }
    ]
  }
}
```

### 编辑后自动格式化代码

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.tool_input.file_path' | xargs npx prettier --write"
          }
        ]
      }
    ]
  }
}
```

### 阻止对受保护文件的编辑

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "./scripts/protect-files.sh"
          }
        ]
      }
    ]
  }
}
```

## Hook 配置位置

| Location | Scope | 可共享 |
| --- | --- | --- |
| `~/.claude/settings.json` | 所有项目 | 否 |
| `.claude/settings.json` | 单个项目 | 是 |
| `.claude/settings.local.json` | 单个项目 | 否 |
| 托管策略设置 | 组织范围 | 是 |

## 完整文档

本页面是完整官方文档的摘要版本。完整内容请参阅：
- [[claude-hooks-full|claude-hooks-full]] - 完整 Hooks 官方文档
- 原始文件：[[../../archive/cc-doc/使用 hooks 自动化工作流.md]]
