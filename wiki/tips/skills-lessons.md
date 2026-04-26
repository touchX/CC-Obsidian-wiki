---
name: tips/skills-lessons
description: Skills使用九大经验 — Thariq 总结
type: source
tags: [tips, skills, best-practices]
created: 2026-03-17
updated: 2026-04-26
source: ../../archive/tips/claude-thariq-tips-17-mar-26.md
---

# Skills 使用九大经验

Thariq 分享 Anthropic 数百个 Skills 实践：Skills 是文件夹非纯 Markdown；9 种类型分类；最佳实践包括写 Gotchas、使用文件系统渐进披露、Description 是触发条件而非摘要。

## 9 种类型

| 类型 | 示例 |
|------|------|
| Library & API Reference | billing-lib, frontend-design |
| Product Verification | signup-flow-driver, checkout-verifier |
| Data Fetching | funnel-query, grafana |
| Business Process | standup-post, weekly-recap |
| Code Scaffolding | new-migration, create-app |
| Code Quality | adversarial-review, code-style |
| CI/CD | babysit-pr, deploy-* |
| Runbooks | oncall-runner, log-correlator |
| Infrastructure Ops | dependency-management |

## 最佳实践

- **别写显而易见的** — 专注推离 Claude 常规思维的信息
- **写 Gotchas** — 常见失败点汇总
- **Description = 触发条件** — 描述何时调用，而非摘要

## 相关页面

- [[entities/claude-skills]] — Skills 系统
- [[guides/power-ups]] — 功能教程
