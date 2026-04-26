---
name: entities/claude-cli
description: Anthropic Claude Code CLI 工具完整指南
type: entity
tags: [tool, cli, anthropic]
created: 2026-04-26
source: ../../archive/best-practice/claude-cli.md
---

# Claude CLI

Anthropic 官方 CLI 工具，通过自然语言对话完成代码修改、文件创建、bug 修复等任务。集成 MCP、Subagents、Memory 等高级功能。

## 核心能力

| 能力 | 说明 |
|------|------|
| 自然语言编程 | 用中文/英文描述需求，Claude 执行 |
| 文件操作 | 读取、创建、编辑、删除文件 |
| Git 操作 | commit、branch、PR 创建 |
| 终端命令 | 执行 shell 命令，安装依赖 |
| 上下文管理 | `@` 引用、 Memory 持久化 |

## 启动方式

```bash
claude                    # 默认启动
claude --resume           # 恢复上次会话
claude --print <prompt>   # 单次输出模式
```

## 相关页面

- [[entities/claude-commands]] — 75 个内置命令
- [[entities/claude-settings]] — 配置选项
- [[guides/power-ups]] — 交互教程