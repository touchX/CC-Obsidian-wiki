---
name: claude-code
description: Anthropic Claude Code CLI 工具完整指南
type: entity
tags: [tool, cli, anthropic]
created: 2026-04-23
updated: 2026-04-23
sources: 3
---

# Claude Code

Anthropic 官方 CLI 工具，将 Claude 作为结对编程伙伴集成到本地开发环境。

## 核心功能

| 功能 | 命令 | 描述 |
|------|------|------|
| 交互式编程 | `claude` | 启动对话式编程会话 |
| 文件编辑 | 编辑/创建/读取 | 完整的文件操作能力 |
| 终端执行 | Bash 工具 | 执行命令和脚本 |
| Git 操作 | 内置 Git 工具 | 提交、分支、推送 |

## 工作流命令

| 命令 | 功能 |
|------|------|
| `/help` | 查看所有命令 |
| `/compact` | 压缩上下文 |
| `/clear` | 清空上下文 |
| `/plan` | 进入计划模式 |
| `/review` | 请求代码审查 |

## 配置系统

### CLAUDE.md
项目级指令文件，在目录根目录定义：
- 核心编码规范
- 技术栈约定
- 特定项目规则

### .claude.json
```json
{
  "disabledPlugins": [],
  "contextStrategy": "auto",
  "maxInputTokens": 4000
}
```

## 相关概念

- [[concepts/context-window]] — 上下文限制
- [[concepts/context-management]] — 上下文管理
- [[concepts/agent-harness]] — 测试框架

## 相关实体

- [[entities/claude-skills]] — Skills 扩展系统
- [[entities/claude-subagents]] — 子代理系统
- [[entities/claude-mcp]] — MCP 服务器集成
- [[entities/claude-hooks]] — Hooks 系统

## 来源

- [Claude Code 官方文档](https://docs.anthropic.com/claude-code)
- 项目实战经验
