---
name: karpathy-llm-wiki
description: Karpathy LLM Wiki 方法论来源摘要
type: source
tags: [methodology, knowledge-base, ai]
created: 2026-04-23
updated: 2026-04-23
sources: 1
---

# Karpathy LLM Wiki 方法论

> 来源：Andrej Karpathy 关于构建 LLM 个人知识库的方法论

## 核心思想

### 问题：RAG 的局限性

RAG（检索增强生成）每次查询都需要从零开始发现信息。

### 解决方案：持久化 Wiki

建立累积的知识库，让 LLM 能够：
- **记住**之前学到的内容
- **复用**跨会话的知识
- **积累**每次交互的洞见

## 三层架构

```
┌─────────────────────────────────────────┐
│  Schema Layer (WIKI.md)                │
│  - 页面格式规范                         │
│  - 操作流程                             │
│  - 质量标准                             │
├─────────────────────────────────────────┤
│  Wiki Layer (pages/)                    │
│  - 概念页面                             │
│  - 实体页面                             │
│  - 综合分析                             │
├─────────────────────────────────────────┤
│  Sources Layer (raw/)                   │
│  - 原始文档                             │
│  - 网络资源                             │
│  - 实战记录                             │
└─────────────────────────────────────────┘
```

## Wiki 操作

### Ingest（摄入）
将新来源转化为 Wiki 页面：
1. 阅读原始来源
2. 提取关键概念
3. 创建/更新页面
4. 添加交叉引用

### Query（查询）
检索已有知识：
1. 搜索相关页面
2. 读取页面内容
3. 综合多来源信息

### Lint（检查）
保持 Wiki 健康：
1. 检查孤立页面
2. 验证交叉引用
3. 确认来源有效性

## 页面格式

### Frontmatter
```yaml
---
name: page-slug
description: 简短描述
type: concept|entity|source|synthesis|guide
tags: [tag1, tag2]
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: N
---
```

### 正文结构
1. 标题（H1）
2. 概述（1-2 段）
3. 详细章节
4. 相关概念
5. 来源引用
6. 实践建议

## 交叉引用

使用 `[[page-slug]]` 语法：
- `[[context-window]]` → 链接到概念页面
- `[[claude-code]]` → 链接到实体页面

## 与 RAG 的区别

| 维度 | RAG | LLM Wiki |
|------|-----|----------|
| 知识保留 | 无 | 累积 |
| 查询速度 | 快 | 更快（已理解）|
| 维护成本 | 低 | 需要投入 |
| 适用场景 | 一次性问题 | 长期项目 |

## 来源

- Andrej Karpathy 关于 LLM 使用的分享
- 项目实战验证
