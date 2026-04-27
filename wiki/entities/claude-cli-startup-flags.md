---
name: entities/claude-cli-startup-flags
description: Claude CLI 75+ 启动参数完整参考手册
type: entity
tags: [cli, flags, command-line, startup, reference]
created: 2026-04-26
source: ../../../archive/best-practice/claude-cli-startup-flags.md
---

# Claude CLI Startup Flags

Claude Code 提供 75+ 个启动参数，覆盖会话、模型、输出、连接等 16 个类别。

## 参数分类速查

| 分类 | 参数数 | 典型用途 |
|------|--------|----------|
| Session | 11 | 会话管理、日志输出 |
| Model | 8 | 模型选择、温度、采样 |
| Output | 10 | 响应格式、文件处理 |
| Connection | 14 | MCP、端口、本地模式 |
| Agent | 7 | 子代理配置 |
| Hook | 5 | 钩子脚本执行 |

## 核心参数

| 参数 | 说明 |
|------|------|
| `--model` | 选择模型 (haiku/sonnet/opus) |
| `--temperature` | 采样温度 (0.0-1.0) |
| `--output-format` | 输出格式 (stream/json/compact) |
| `--resume` | 恢复历史会话 |
| `--verbose` | 详细日志输出 |

## 连接与集成

```bash
claude --mcp-allowed-env VAR1,VAR2  # 允许 MCP 访问环境变量
claude --port 8080                   # 本地 HTTP 模式端口
claude --local                      # 本地模式（无需 API）
```

## 模型参数

| 参数 | 值 | 用途 |
|------|------|------|
| `--model` | haiku/sonnet/opus | 模型选择 |
| `--max-tokens` | 数值 | 最大输出 token |
| `--temperature` | 0.0-1.0 | 采样温度 |

## 交叉引用

- [[wiki/entities/claude-cli]] — CLI 核心功能
- [[wiki/entities/claude-code]] — CLI 工具完整指南
- [[concepts/context-window]] — 上下文窗口原理

## 相关页面

- [[guides/commands]] — Commands 实现
- [[guides/subagents]] — Sub-agents 实现