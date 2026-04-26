---
name: tips/squash-merge-tips
description: Squash Merging与PR Size Distribution — Boris 实践
type: source
tags: [tips, git, squash-merge, pr-size]
created: 2026-03-25
updated: 2026-04-26
source: ../../archive/tips/claude-boris-2-tips-25-mar-26.md
---

# Squash Merging & PR Size Distribution

Boris Cherny 每日 141 个 PR 的工作流实践：始终使用 squash merge 保持线性历史；PR 中位数 118 行，90% 在 500 行以内。关键数据：p50=118行，p90=498行，p99=2978行。

## 关键指标

| 指标 | 行数 | 含义 |
|------|------|------|
| p50 | 118 | 一半 PR ≤118 行 |
| p90 | 498 | 90% PR <500 行 |
| p99 | 2,978 | 仅 1% 超过 3K 行 |

## 相关页面

- [[concepts/git-workflow]] — Git 工作流
- [[entities/claude-commands]] — 相关命令
