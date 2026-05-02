---
name: implementation/scheduled-tasks-implementation
description: /loop 定时任务实现详解 — Cron 调度与递归执行
type: implementation
tags: [implementation, scheduled-tasks, loop, cron, automation]
created: 2026-03-10
updated: 2026-05-01
---

# Scheduled Tasks Implementation

> `/loop` 命令通过 cron 表达式实现定时任务调度，支持会话级和持久化两种模式。适用于监控、定时检查、周期性报告生成等自动化场景。

## 核心概念

`/loop` 是 Claude Code 内置的定时任务命令，使用 cron 表达式定义调度：

```bash
$ claude
> /loop 1m "tell current time"
```

### Cron 表达式映射

| 简写 | 完整表达式 | 说明 |
|------|------------|------|
| `1m` | `*/1 * * * *` | 每分钟 |
| `5m` | `*/5 * * * *` | 每 5 分钟 |
| `1h` | `0 * * * *` | 每小时 |

## 重要特性

| 特性 | 说明 |
|------|------|
| 最小粒度 | 1 分钟 |
| 自动过期 | 循环任务 3 天后自动过期 |
| 会话作用域 | 退出 Claude 后任务停止 |
| 取消命令 | `cron cancel <job-id>` |

## 实现原理

`/loop` 底层使用 cron 工具系列：

- `CronCreate` — 创建定时任务
- `CronList` — 列出活跃任务
- `CronDelete` — 删除任务

### 任务触发机制

每次触发时：
1. 执行指定命令或 prompt
2. 触发 `UserPromptSubmit` 钩子
3. 触发 `Stop` 钩子（用于声音通知等）

## 相关页面

- [[scheduled-tasks]] — 定时任务使用指南
- [[claude-commands]] — Commands 实体
