---
name: wiki-index
description: Wiki 导航索引 — 基于 Dataview 自动生成，零维护
type: reference
tags: [index, wiki, dataview]
created: 2026-04-26
updated: 2026-04-26
---

# Wiki Index

> 本页面使用 [Dataview](https://github.com/blacksmithgu/obsidian-dataview) 插件自动生成索引，零维护、零遗漏

本 Wiki 基于 Karpathy LLM Wiki 方法论构建，专注于 Claude Code 最佳实践知识积累。

---

## Concepts (概念)

关于 Claude Code 和 AI 编程的核心概念。

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
  , tags as "标签"
  , updated as "更新"
FROM "wiki/concepts"
WHERE type = "concept"
SORT updated DESC
```

## Entities (实体)

Claude Code 相关的具体工具、框架和项目。

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
  , type as "类型"
  , updated as "更新"
FROM "wiki/entities"
WHERE type = "entity"
SORT updated DESC
```

## Sources (来源)

原始来源摘要和参考。

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "摘要"
  , updated as "日期"
FROM "wiki/sources"
WHERE type = "source"
SORT updated DESC
```

## Synthesis (综合)

跨多个概念和来源的深度分析。

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
  , updated as "更新"
FROM "wiki/synthesis"
WHERE type = "synthesis"
SORT updated DESC
```

## Guides (指南)

实用操作指南和教程。

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
FROM "wiki/guides"
WHERE type = "guide"
SORT file.link ASC
```

## Tips (技巧)

来自社区和团队的 Claude Code 使用技巧。

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
  , updated as "更新"
FROM "wiki/tips"
WHERE type = "tips"
SORT updated DESC
```

## Implementation (实现详解)

深入理解 Claude Code 各组件的实现原理与架构模式。

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
  , tags as "标签"
FROM "wiki/implementation"
WHERE type = "implementation"
SORT file.link ASC
```

## Tutorial (教程)

结构化学习路径和进阶教程。

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
FROM "wiki/tutorial"
WHERE type = "tutorial"
SORT file.link ASC
```

## Patterns (模式)

可复用的设计模式和架构模式。

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
FROM "wiki/patterns"
WHERE type = "pattern"
SORT file.link ASC
```

## Tools (工具)

外部工具和集成说明。

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
FROM "wiki/tools"
WHERE type = "tool"
SORT file.link ASC
```

## Orchestration Workflow (编排工作流)

多 Agent 编排和协作流程。

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
FROM "wiki/orchestration-workflow"
WHERE type = "workflow"
SORT file.link ASC
```

## Resources (资源)

外部资源和参考链接。

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
FROM "wiki/resources"
WHERE type = "resource"
SORT file.link ASC
```

## External (外部)

外部文档和参考资料。

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
FROM "wiki/external"
WHERE type = "external"
SORT file.link ASC
```

---

> 📝 **提示**: 在 Obsidian 中打开此页面后，Dataview 会自动执行查询并生成表格。点击任意链接跳转到对应页面。
