---
name: dataview-test
description: Dataview 查询语法验证页面
type: reference
tags: [dataview, test, query]
created: 2026-04-26
updated: 2026-04-26
---

# Dataview 测试

## 基础查询测试

```dataview
LIST
FROM "wiki"
WHERE type
SORT type, file.link
```

预期: 列出所有带 type 字段的页面

---

## 文件列表

```dataview
TABLE file.name, type, created
FROM "wiki"
SORT file.mtime DESC
LIMIT 20
```

预期: 显示 wiki 目录中最新的 20 个文件及其属性

---

## 按分类统计

```dataview
TABLE rows.file.link AS "文件", length(rows) AS "数量"
FROM "wiki"
GROUP BY type
```

预期: 按 type 分组统计文件数量