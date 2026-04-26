---
name: sources/usage-rate-limits
description: Claude Code 用量限制与 Rate Limits 详解 — 滚动窗口策略
type: source
tags: [usage, limits, rate-limits, billing]
created: 2026-03-10
updated: 2026-04-26
source: ../../archive/reports/claude-usage-and-rate-limits.md
---

# Usage, Rate Limits & Extra Usage

Claude Code 订阅计划（Pro/Max 5x/Max 20x）采用滚动窗口重置策略。内置三个斜杠命令帮助监控：`/usage` 查看当前用量、`/cost` 分析成本、`/extra-usage` 购买额外计算量。理解滚动窗口机制是避免工作中断的关键。

## 相关页面

- [[entities/claude-commands]] — 命令参考
