---
quick.start
name: quick-start
description: Wiki 快速入门指南
type: guide
tags: [onboarding, tutorial]
created: 2026-04-23
updated: 2026-04-23
sources: 1
---

# Wiki 快速入门

本 Wiki 基于 Karpathy LLM Wiki 方法论构建，用于积累 Claude Code 最佳实践知识。

## 目录结构

```
wiki/
├── WIKI.md           # Schema 规范
├── index.md          # 导航索引
├── log.md            # 操作日志
├── concepts/         # 概念页面
├── entities/         # 实体页面
├── sources/          # 来源摘要
├── synthesis/        # 综合分析
├── guides/           # 使用指南
└── raw/              # 原始来源
```

## 快速操作

### 1. 查询知识
```
问：我如何使用 Claude Code 的 Skills？
→ 读取 [[claude-skills]]
```

### 2. 摄入新来源
1. 将原始文档放入 `raw/`
2. 创建 `sources/` 摘要页面
3. 创建相关 `concepts/` 或 `entities/` 页面
4. 更新 `index.md`
5. 追加到 `log.md`

### 3. 创建新页面

```markdown
---
name: my-concept
description: 我的概念描述
type: concept
tags: [tag1, tag2]
created: 2026-04-23
updated: 2026-04-23
sources: 1
---

# 我的概念

## 概述
...

## 相关概念
- [[related-page]]

## 来源
- [来源链接](url)
```

## 页面类型

| 类型 | 用途 | 示例 |
|------|------|------|
| concept | 核心概念 | [[context-window]] |
| entity | 具体工具/项目 | [[claude-code]] |
| source | 来源摘要 | [[karpathy-llm-wiki]] |
| synthesis | 综合分析 | [[agent-architecture]] |
| guide | 操作指南 | [[quick-start]] |

## 交叉引用

使用 `[[page-slug]]` 语法创建链接：
- `[[xxx]]` — 概念页面
- `[[xxx]]` — 实体页面
- `[[xxx]]` — 来源页面
- `[[xxx]]` — 综合页面
- `[[xxx]]` — 指南页面

## 下一步

- 阅读 [[karpathy-llm-wiki]] 了解方法论
- 查看 [[agent-harness]] 了解测试框架
- 阅读 [[agent-architecture]] 了解系统架构

## 来源

- 本 Wiki Schema: [[WIKI|WIKI.md]]
