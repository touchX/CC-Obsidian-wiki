---
name: tips/boris-squash-tips
description: Squash Merging与PR Size Distribution技巧
type: tips
tags: [tips, boris, git, squash-merge, pr-size]
created: 2026-03-25
---

# Squash Merging & PR Size Distribution

> Boris Cherny 分享的高频 AI 辅助工作流中的 Git 最佳实践。2026年3月25日。

## 1/ 266 个贡献 — 总是 Squash

Boris 分享了他的 GitHub 贡献图，显示 **3月24日 266 个贡献** — 来自 **141 个 PR，全部 squash**，每个 PR 中位数 **118 行**。

- Squash merging 将所有分支 commits 合并到目标分支的单个 commit — 保持历史干净线性
- 每个 PR = 一个 commit 使 revert 整个特性变得容易
- 在高频 AI 辅助工作流中，squash 是务实选择

---

## 2/ PR Size Distribution — 保持 PR 小

141 个 PR 的行数分布，总计 **45,032 行**（添加+删除）：

| 指标 | 行数 | 含义 |
|------|------|------|
| **p50** | **118** | 中位数 — 一半 PR ≤118 行 |
| p90 | 498 | 90% PR <500 行 |
| **p99** | **2,978** | 仅 ~1 个 PR 超过 ~3K 行 |
| min | 2 | 最小 PR — 快速 2 行修复 |
| max | 10,459 | 最大 PR — 可能是迁移或生成代码 |

关键洞察：
- **118 行的中位数** 意味着大多数 PR 专注且可审查
- 分布严重右偏 — 偶尔大 PR 不可避免，但规范是紧凑的
- 小 PR 减少合并冲突风险、更容易审查

---

## 来源

- [Boris Cherny (@bcherny) on X — March 25, 2026](https://x.com/bcherny/status/2038552880018538749)
