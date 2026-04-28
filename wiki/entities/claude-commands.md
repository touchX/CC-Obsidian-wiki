---
name: entities/claude-commands
description: Claude Code 75+ 内置斜杠命令完整分类参考
type: entity
tags: [commands, slash-commands, reference]
created: 2026-04-26
updated: 2026-04-27
source: ../../archive/cc-doc/命令.md
---

# Claude Commands

内置斜杠命令系统，输入 `/` 触发自动补全，支持自定义命令扩展。

## 命令分类

| 类别 | 数量 | 示例 |
|------|------|------|
| 会话控制 | 6 | `/resume`, `/clear`, `/exit` |
| 模式切换 | 5 | `/plan`, `/auto`, `/ask` |
| 文件操作 | 7 | `/new`, `/edit`, `/read` |
| 执行控制 | 8 | `/execute`, `/bash`, `/websearch` |
| 上下文管理 | 6 | `/memory`, `/compact`, `/claude-md` |
| 扩展功能 | 12 | `/mcp`, `/agents`, `/skill` |
| 工具集成 | 14 | `/git`, `/test`, `/debug` |
| 辅助功能 | 17 | `/help`, `/model`, `/review` |

## 高频命令

| 命令 | 用途 |
|------|------|
| `/plan` | 进入 Plan Mode 规划任务 |
| `/resume` | 恢复上次会话 |
| `/compact` | 压缩上下文节省空间 |
| `/model` | 切换模型（Haiku/Sonnet/Opus） |
| `/permissions` | 管理工具权限规则 |
| `/mcp` | 管理 MCP server 连接 |
| `/hooks` | 查看 hook 配置 |
| `/diff` | 打开交互式差异查看器 |

## 完整命令列表

完整的 75+ 命令列表请参阅 [[commands-full]]。

## 相关页面

- [[claude-cli]] — CLI 完整指南
- [[claude-settings]] — 配置选项
- [[agent-command-skill-comparison]] — 扩展机制对比
