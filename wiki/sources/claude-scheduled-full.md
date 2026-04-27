---
name: sources/claude-scheduled-full
description: 计划任务完整官方文档 — 按计划自动运行 Claude Code 提示词
type: source
tags: [source, claude, scheduled-tasks, cron, automation, scheduled]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/按计划运行提示词.md
---

# 按计划运行提示词

Claude Code 支持按计划自动运行提示词。使用 cron 表达式定义执行时间表。

## 基本配置

在 `.claude/scheduled-tasks.json` 中定义任务：

```json
{
  "tasks": [
    {
      "id": "daily-standup",
      "cron": "0 9 * * 1-5",
      "prompt": "Summarize yesterday's commits and identify blockers",
      "allowedTools": ["Bash", "Read"],
      "notify": true
    }
  ]
}
```

## Cron 表达式

| 表达式 | 说明 |
| --- | --- |
| `0 9 * * *` | 每天 9:00 |
| `0 9 * * 1-5` | 工作日 9:00 |
| `*/15 * * * *` | 每 15 分钟 |
| `0 0 1 * *` | 每月第一天 |

## 通知选项

设置 `notify: true` 会在任务完成后发送通知。

## 使用场景

- 每日 standup 摘要
- 定期代码健康检查
- 自动化报告生成
- 定时数据同步

## 相关资源

- [以编程方式运行 Claude Code](https://code.claude.com/docs/zh-CN/headless)
- [GitHub Actions 集成](https://code.claude.com/docs/zh-CN/github-actions)
