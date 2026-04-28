# GitHub 资源收集

本目录用于存储从 GitHub 收集的优秀仓库资源 Wiki 页面。

## 使用方法

提供 GitHub URL 给 AI 助手，它将自动：
1. 获取仓库元数据（通过 GitHub API）
2. 生成标准化的 Wiki 页面
3. 归档原始 JSON 数据

## 页面格式

每个仓库页面包含：

### Frontmatter 元数据
```yaml
---
name: github-repos-readme
description: GitHub 资源收集模块说明文档
type: guide
tags: [github, resources, index]
created: 2026-04-28
updated: 2026-04-28
---
```

### 内容部分
- **基本信息** - 作者、语言、Stars、许可证
- **链接** - GitHub 仓库、Issue 跟踪、文档
- **标签** - 语言和类型标签（用于 Dataview 查询）
- **相关资源** - Dataview 自动填充

## Dataview 查询示例

### 查看所有 GitHub 仓库
```dataview
LIST
FROM "wiki/resources/github-repos"
WHERE contains(tags, "github")
SORT stars DESC
```

### 按语言过滤
```dataview
LIST
FROM "wiki/resources/github-repos"
WHERE contains(tags, "github") AND contains(tags, "TypeScript")
SORT stars DESC
```

### 查找高分仓库（Stars > 1000）
```dataview
LIST
FROM "wiki/resources/github-repos"
WHERE contains(tags, "github") AND stars > 1000
SORT stars DESC
```

### 按更新时间排序
```dataview
TABLE stars, language, license
FROM "wiki/resources/github-repos"
WHERE contains(tags, "github")
SORT updated DESC
```

## 数据溯源

每个 Wiki 页面的 `source` 字段指向归档的原始 JSON 数据：
```
wiki/resources/github-repos/{owner}-{repo}.md
  → source: ../../../archive/resources/github/{owner}-{repo}-{YYYY-MM-DD}.json
```

归档文件包含完整的 GitHub API 响应数据，可用于：
- 数据验证
- 重新生成页面
- 自定义分析

## 维护说明

- **添加新仓库**：通过 AI 助手提供 GitHub URL
- **更新现有页面**：重新运行收集命令（会更新 updated 字段并保留旧归档）
- **删除页面**：删除 Wiki 页面和对应的归档文件

## 相关文档

- [Wiki Schema 规范](../../../wiki/WIKI.md)
- [设计文档](../../../docs/superpowers/specs/2026-04-28-github-resource-collector-design.md)
- [实现计划](../../../docs/superpowers/plans/2026-04-28-github-resource-collector.md)
