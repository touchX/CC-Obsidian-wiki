---
name: guides/scheduled-tasks
description: 定时任务实现指南 — /loop cron 调度与任务管理
type: guide
tags: [scheduled-tasks, loop, cron, implementation]
created: 2026-04-26
updated: 2026-05-01
source: ../../archive/implementation/claude-scheduled-tasks-implementation.md
---

# Scheduled Tasks Implementation

使用 `/loop` skill 调度周期性任务，基于 cron 间隔自动触发。这是 Claude Code 内置功能，无需额外设置。

## 工作原理

`/loop` 使用底层 cron 工具（`CronCreate`、`CronList`、`CronDelete`）管理循环调度。

## 核心限制

| 限制 | 说明 |
|------|------|
| 最小粒度 | 1 分钟（`1m` → `*/1 * * * *`） |
| 自动过期 | 3 天后自动停止 |
| 会话范围 | Claude 退出后终止 |

## 使用示例

```bash
> /loop 1m "tell current time"    # 每分钟报告时间
> /loop 5m /simplify              # 每5分钟简化上下文
> /loop 10m "check deploy status" # 每10分钟检查部署状态
```

## 取消任务

```bash
/cron cancel <job-id>
```

## 交叉引用

- [[claude-commands]] — 命令系统
- [[agent-command-skill-comparison]] — 扩展机制对比

## 相关页面

- [[commands]] — Commands 实现
- [[agent-teams]] — Agent Teams 实现