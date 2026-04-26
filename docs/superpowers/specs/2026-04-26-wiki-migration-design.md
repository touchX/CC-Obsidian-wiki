---
name: wiki-migration-design
description: LLM Wiki 批量迁移设计方案
type: design
created: 2026-04-26
---

# Wiki 迁移设计方案

## 概述

将 `claude-code-best-practice` 项目中的所有文档批量迁移到 LLM Wiki 结构，实现知识的持久化、累积和跨文档关联。

## 目标

- 所有文档（best-practice/implementation/tips/reports）整合为统一 Wiki
- 建立跨文档交叉引用，形成知识网络
- 保持内容简洁（50-100字/页面），便于快速查阅

## Wiki 结构

```
wiki/
├── index.md          # 导航索引
├── log.md            # 操作日志
├── concepts/         # 概念（抽象原理）
├── entities/         # 实体（工具/功能）
├── guides/           # 指南（操作步骤）
├── synthesis/        # 综合（跨文档分析）
└── sources/          # 来源摘要
```

## 页面模板

```yaml
---
name: page-slug
description: 一句话描述
type: concept|entity|guide|synthesis|source
tags: [tag1, tag2]
related: [[other-page]]
source: ../original-doc.md
created: 2026-04-26
---

# Page Title

正文内容（50-100字）。

## 相关页面

- [[related-page-1]]
- [[related-page-2]]
```

## 标签体系

| 标签 | 用途 |
|------|------|
| fundamentals | LLM/Claude 基础概念 |
| workflow | 工作流优化 |
| optimization | 性能/上下文优化 |
| architecture | 系统架构 |
| tool | 工具使用 |
| feature | Claude Code 功能 |
| tips | 使用技巧 |
| patterns | 设计模式 |
| integration | 集成相关 |

## 迁移流程

1. **扫描** — 读取所有源文档（best-practice/ implementation/ tips/ reports）
2. **分析** — 识别核心概念、实体、关联关系
3. **去重** — 合并相似内容，确定唯一归属
4. **生成** — 创建 wiki 页面
5. **交叉链接** — 建立页面间引用
6. **更新索引** — 刷新 index.md

## 分类规则

| 类型 | 定义 | 示例 |
|------|------|------|
| concept | 抽象原理/方法论 | context-window, agent-harness |
| entity | 具体工具/功能 | claude-cli, claude-skills |
| guide | 操作步骤/教程 | quick-start, hook-guide |
| synthesis | 跨文档综合分析 | agent-architecture |
| source | 来源摘要 | karpathy-llm-wiki |

## 质量标准

- 每个页面有唯一主题
- 标签使用预定义标签库
- 交叉引用完整
- 无重复内容
- 正文 50-100 字

## 迁移顺序

1. best-practice/ (8 files)
2. tips/ (11 files)
3. implementation/ (5 files)
4. reports/ (9 files)

## 参考

- LLM Wiki 方法论: [[../llm-wiki|Wiki 方法论]]