# Claude Code Best Practice Wiki 使用指南

> 上次更新：2026-04-26

本 Wiki 基于 Karpathy LLM Wiki 方法论构建，是一个专注于 Claude Code 最佳实践的持久化知识积累系统。

---

## 快速导航

| 类别 | 页面数 | 说明 |
|------|--------|------|
| Concepts | 6 | 核心概念 |
| Entities | 10 | 工具和功能实体 |
| Sources | 7 | 原始来源摘要 |
| Synthesis | 5 | 跨概念深度分析 |
| Guides | 8 | 实用操作指南 |
| Tutorial | 5 | 系统化教程 |
| Implementation | 5 | 实现原理详解 |
| Tips | 6 | 使用技巧 |

---

## 核心概念

### Wiki 3 层架构

```
Raw Sources (reports/)
    ↓ Ingest
Wiki Pages (wiki/)
    ↓ Schema
Searchable Index (index.md)
```

### 页面类型

| 类型 | 前缀 | 说明 |
|------|------|------|
| Concept | `concepts/` | 抽象概念和原理 |
| Entity | `entities/` | 具体工具和功能 |
| Source | `sources/` | 原始来源摘要 |
| Synthesis | `synthesis/` | 综合分析 |
| Guide | `guides/` | 操作指南 |
| Tutorial | `tutorial/` | 教程 |
| Implementation | `implementation/` | 实现详解 |
| Tips | `tips/` | 技巧 |

---

## 常用场景

### 1. 查找 Claude Code 功能

**路径**: `wiki/index.md` → Entities 部分

```markdown
| [[entities/claude-commands]] | 自定义 Commands | feature | 2026-04-26 |
```

### 2. 学习核心概念

**路径**: `wiki/index.md` → Concepts 部分

推荐学习顺序：
1. `context-window` — 上下文窗口原理
2. `context-management` — 上下文管理策略
3. `agent-harness` — Agent Harness 重要性

### 3. 查找使用技巧

**路径**: `wiki/index.md` → Tips 部分

### 4. 系统化教程

**路径**: `wiki/index.md` → Tutorial 部分

推荐学习路径：
- Day 0: 安装与认证
- Day 1: 使用层级 (Prompting → Agents → Skills)

---

## Wiki 页面结构

### Frontmatter 格式

```yaml
---
name: entities/claude-commands
description: 自定义 Commands 系统详解
type: entity
tags: [commands, orchestration, feature]
created: 2026-04-26
---
```

### 内容格式

```markdown
# Title

> 一句话描述（用于快速理解）

正文内容...
```

---

## 参与贡献

### 添加新页面

1. **创建页面**: 在对应目录创建 `.md` 文件
2. **编写 Frontmatter**: 必须包含 name, description, type, tags, created
3. **更新索引**: 在 `wiki/index.md` 添加条目

### 页面质量标准

- **单一职责**: 每个文件聚焦一个主题
- **中文优先**: 中文撰写，便于快速理解
- **链接完整**: 相关页面使用 Wiki 链接 `[[page]]`
- **标签准确**: 使用现有标签，便于检索

---

## 相关资源

- [Wiki Schema](../wiki/index.md#wiki-schema)
- [Karpathy LLM Wiki 方法论](../wiki/sources/karpathy-llm-wiki.md)
- [CLAUDE.md](../wiki/WIKI.md) — Wiki 操作规范（CLAUDE.md 功能）

---

*查看 [Wiki 导航索引](../wiki/index.md) 获取完整页面列表*
