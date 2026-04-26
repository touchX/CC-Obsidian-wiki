---
name: wiki-index-auto
description: Wiki 自动索引 (Dataview 版本) - 测试版
type: reference
created: 2026-04-26
updated: 2026-04-26
---

# Wiki Index (Auto)

> 本页面使用 [Dataview](https://github.com/blacksmithgu/obsidian-dataview) 插件自动生成索引，零维护、零遗漏

本 Wiki 基于 Karpathy LLM Wiki 方法论构建，专注于 Claude Code 最佳实践知识积累。

---

## Concepts (概念)

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

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
FROM "wiki/guides"
WHERE type = "guide"
SORT file.link ASC
```

## Tips (技巧)

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

```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
  , tags as "标签"
FROM "wiki/implementation"
WHERE type = "implementation"
SORT file.link ASC
```

---

> 📝 **提示**: 在 Obsidian 中打开此页面后，Dataview 会自动执行查询并生成表格
