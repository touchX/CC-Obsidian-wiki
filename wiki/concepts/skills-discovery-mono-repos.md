---
name: concepts/skills-discovery-mono-repos
description: 大型 Monorepo 中 Skills 发现机制 — 与 CLAUDE.md 的关键区别
type: concept
tags: [skills, monorepo, discovery, context]
created: 2026-04-12
source: ../../archive/reports/claude-skills-for-larger-mono-repos.md
---

# Skills 在大型 Monorepo 中的发现机制

Skills 与 CLAUDE.md 的核心区别：CLAUDE.md 向上遍历目录树（ancestor loading），而 Skills 使用 `paths:` frontmatter 在当前目录内嵌套发现。通过 glob 模式匹配定位，无需跨越目录边界。

## 相关页面

- [[claude-skills]] — Skills 系统
- [[context-management]] — 上下文管理
- [[skill-organization]] — 组织指南
