---
name: concepts/claude-memory
description: Claude Memory 分层加载与自定义规则机制
type: concept
tags: [memory, context, configuration]
created: 2026-04-26
source: ../../archive/best-practice/claude-memory.md
---

# Claude Memory

Claude Code 内存管理采用分层架构：**Ancestor Loading**（祖先进程上下文）按优先级加载，包含 CLAUDE.md、规则目录、内存文件和项目索引；**Dscendant Loading**（当前会话新增）通过 `/memory` 命令管理持久化上下文。

## 关键机制

| 机制 | 描述 |
|------|------|
| `memory.md` | 持久化文件，跨会话保留关键上下文 |
| `rules/` | 自动加载的前端规则目录 |
| `.claude/memory/` | 内存文件存储目录 |
| `/memory` | 交互式内存管理命令 |

## 加载优先级

```
CLAUDE.md → rules/*.md → memory/ → session context
```

## 相关页面

- [[entities/claude-settings]] — 配置详解
- [[entities/claude-commands]] — 命令参考