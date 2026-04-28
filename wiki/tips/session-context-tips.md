---
name: tips/session-context-tips
description: Session Management与1M Context管理 — Thariq 指南
type: source
tags: [tips, session, context, compact, subagents]
created: 2026-04-16
updated: 2026-04-26
source: ../../archive/tips/claude-thariq-tips-16-apr-26.md
---

# Session Management & 1M Context

Thariq 详解 1M token 上下文窗口管理：Continue/Rewind/Compact/Clear/Subagent 五种分支策略。Context rot 在 300-400K 时发生，主动 compact 优于被动。Rewind 比纠正更干净。

## 决策矩阵

| 场景 | 选择 | 原因 |
|------|------|------|
| 同任务、上下文相关 | Continue | 保持上下文负载 |
| Claude 走错路 | Rewind | 保留文件读取，丢弃失败尝试 |
| 会话臃肿 | /compact | 低成本摘要 |
| 新任务 | /clear | 零 rot |
| 中间产出仅需结论 | Subagent | 中间噪声隔离 |

## 相关页面

- [[context-management]] — 上下文管理
- [[claude-subagents]] — 子代理系统
