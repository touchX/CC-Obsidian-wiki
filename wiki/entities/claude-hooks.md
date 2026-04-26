---
name: entities/claude-hooks
description: Hooks 系统 — 会话生命周期拦截与自动化
type: entity
tags: [hooks, lifecycle, automation, pretool, posttool]
created: 2026-04-26
source: ../../archive/best-practice/claude-hooks.md
---

# Claude Hooks

Hooks 在会话生命周期关键节点拦截执行，支持 PreToolUse、PostToolUse 和 Stop 三种类型。

## Hook 类型

| 类型 | 时机 | 用途 |
|------|------|------|
| `PreToolUse` | 工具执行前 | 验证、修改参数 |
| `PostToolUse` | 工具执行后 | 格式化、检查 |
| `Stop` | 会话结束时 | 最终验证、清理 |

## Frontmatter 结构

```yaml
---
name: hook-name          # 唯一标识
description: 描述        # 一句话说明
trigger: "tool-name"     # 触发工具
when: "condition"        # 触发条件
mode: allow|block|modify # 行为模式
priority: 100            # 执行优先级
---
```

## 使用场景

| 场景 | Hook 类型 | 示例 |
|------|-----------|------|
| 参数验证 | PreToolUse | 检查文件路径 |
| 强制格式化 | PostToolUse | Prettier 格式化 |
| 安全检查 | Stop | 检查敏感数据 |
| 上下文压缩 | Stop | 自动摘要 |

## 配置位置

- **项目级**: `.claude/settings.json` 的 `hooks` 字段
- **用户级**: `~/.claude/settings.json`
- **优先级**: 项目级 > 用户级

## 交叉引用

- [[concepts/context-management]] — 上下文管理
- [[entities/claude-commands]] — 命令系统
- [[synthesis/agent-command-skill-comparison]] — 扩展机制对比

## 相关页面

- [[guides/commands]] — Commands 实现
- [[guides/skills]] — Skills 实现
- [[guides/scheduled-tasks]] — 定时任务