---
name: properties-reference
description: Wiki 页面 Frontmatter 属性规范 — 所有 Wiki skill 的统一引用源
type: reference
tags: [frontmatter, schema, wiki]
created: 2026-05-11
updated: 2026-05-11
---

# Frontmatter 属性规范

> 此文件是 docs-ingest、wiki-lint、wiki-query 等 Wiki skills 的**统一属性引用源**。
> 所有技能文件应引用此文件而非各自维护属性列表。

## 必需字段

| 字段 | 必需 | 类型 | 说明 |
|------|------|------|------|
| `name` | ✅ | text | 页面 slug，全小写 + 连字符 |
| `description` | ✅ | text | 一句话描述 |
| `type` | ✅ | text | 页面类型（见下方允许值） |
| `tags` | ✅ | list | 标签数组，至少 1 个 |
| `created` | ✅ | date | 创建日期 YYYY-MM-DD |
| `updated` | ✅ | date | 最后更新日期 YYYY-MM-DD |

## 建议字段

| 字段 | 必要 | 类型 | 说明 |
|------|------|------|------|
| `source` | 建议 | links | 指向 archive/ 中原始文件的相对路径 |

## type 允许值

| 类型 | 分类目录 | 说明 |
|------|----------|------|
| `concept` | concepts/ | 核心概念说明 |
| `entity` | entities/ | 具体工具、框架、项目 |
| `source` | sources/ | 原始来源摘要 |
| `synthesis` | synthesis/ | 跨概念深度分析 |
| `guide` | guides/ | 操作指南 |
| `tips` | tips/ | 实用技巧 |
| `tutorial` | tutorial/, tutorials/ | 结构化教程路径 |
| `implementation` | implementation/ | 实现原理与架构模式 |
| `pattern` | patterns/ | 可复用的设计模式 |
| `tool` | tools/ | 外部工具和集成 |
| `workflow` | orchestration-workflow/ | 多 Agent 编排流程 |
| `resource` | resources/ | 外部资源和参考链接 |
| `external` | external/ | 外部文档和参考资料 |
| `report` | — | 健康检查报告 |
| `progress` | — | 学习进度追踪 |
| `reference` | — | 参考文件 |

## 示例

```yaml
---
name: claude-commands
description: Claude Code 命令系统详解
type: concept
tags: [commands, claude-code]
created: 2026-04-26
updated: 2026-05-01
source: ../../../archive/guides/claude-commands.md
---
```

> 最后更新: 2026-05-11
