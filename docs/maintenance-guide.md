# Wiki 长期维护指南

> 上次更新：2026-04-26

本指南基于 Karpathy LLM Wiki 方法论，提供 Wiki 系统的长期维护流程和最佳实践。

---

## 维护原则

### 1. 持久化积累

Wiki 是持久化知识库，而非一次性文档：
- 每个页面应可独立理解
- 跨页面链接形成知识网络
- 随着理解加深而迭代更新

### 2. 增量更新

- 添加新知识而非重写
- 保持历史脉络（sources）
- 版本更新记录在 changelog

### 3. Schema 驱动

所有页面遵循统一 Frontmatter 格式：
```yaml
---
name: <unique-identifier>
description: <one-line-summary>
type: <concept|entity|source|synthesis|guide|...>
tags: [<tag1>, <tag2>]
created: <YYYY-MM-DD>
---
```

---

## 维护操作

### Ingest（摄入新知识）

当产生新的研究报告或分析时：

1. **创建 Source 页面**
   ```markdown
   wiki/sources/<topic>.md
   ```

2. **提取关键信息**
   - 标题和来源
   - 一句话总结（`>` 格式）
   - 详细摘要（2-3 句话）
   - 相关页面链接

3. **更新索引**
   - 在 `wiki/index.md` Sources 部分添加条目
   - 更新统计数字

### Query（知识检索）

定期使用 Wiki：

| 场景 | 操作 |
|------|------|
| 忘记某功能细节 | 搜索 Entities |
| 理解某概念原理 | 阅读 Concepts |
| 查找操作方法 | 查阅 Guides |
| 复习学习路径 | 通读 Tutorial |

### Lint（质量检查）

每月执行一次 Lint 检查：

#### 检查清单

- [ ] 所有页面 Frontmatter 完整
- [ ] 无断裂的 Wiki 链接
- [ ] 索引与实际页面同步
- [ ] 标签使用一致
- [ ] 无孤立页面（未被引用）

#### 常见修复

```markdown
# 修复断裂链接
[[old-page]] → [[new-page]]

# 更新索引
1. 添加缺失页面
2. 移除已删除页面
3. 更新日期
```

---

## 维护日程

### 每日

- 新增 Source 时更新索引

### 每周

- 检查新增页面的 Frontmatter 完整性
- 确保 Wiki 链接有效

### 每月

- Lint 检查：断裂链接、孤立页面
- 统计更新：`wiki/index.md` 底部数字
- 清理：合并重复页面、更新过时内容

### 每季度

- 回顾 Wiki 结构是否需要调整
- 评估标签体系是否完善
- 更新 Tutorial 学习路径

---

## 新页面创建流程

### 1. 确定页面类型

| 场景 | 类型 |
|------|------|
| 解释原理/概念 | `concepts/` |
| 记录工具/功能 | `entities/` |
| 摘要外部来源 | `sources/` |
| 跨概念分析 | `synthesis/` |
| 操作步骤说明 | `guides/` |
| 系统化学习内容 | `tutorial/` |
| 实现原理讲解 | `implementation/` |
| 分享使用技巧 | `tips/` |

### 2. 命名规范

```
类型/简述.md
```

示例：
- `concepts/context-window.md`
- `entities/claude-commands.md`
- `guides/quick-start.md`

### 3. 必要元素

```markdown
---
name: <name>
description: <description>
type: <type>
tags: [<tags>]
created: <YYYY-MM-DD>
---

# Title

> 一句话描述

正文内容...

---

## 相关页面
- [[entities/claude-cli]]
- [[guides/quick-start]]
```

---

## 页面生命周期

```
创建 (created)
    ↓
活跃更新 (定期修订)
    ↓
稳定期 (偶尔更新)
    ↓
归档或合并 (长期未更新)
```

### 归档条件

页面超过 6 个月未更新且内容已过时：
1. 标记为 `status: deprecated`
2. 添加指向新页面的重定向
3. 或合并到相关页面

---

## 质量标准

### 必须

- Frontmatter 包含所有必需字段
- 包含 `>` 格式的一句话描述
- 相关页面使用 `[[wiki-link]]` 格式

### 推荐

- 中文撰写
- 代码示例（当适用）
- 标签准确（3-5 个）
- 更新日期准确

### 避免

- 空洞内容（无实质信息）
- 断裂链接
- 过时信息（无更新日期）
- 重复页面（检查后再创建）

---

## 工具支持

### Wiki Lint 命令

```bash
# 检查断裂链接
# 检查 Frontmatter 完整性
# 统计页面数量
```

### 自动化检查

- CI 钩子验证 Frontmatter 格式
- 定期运行 Lint

---

## 相关资源

- [Wiki 导航索引](../wiki/index.md)
- [Karpathy LLM Wiki 方法论](../wiki/sources/karpathy-llm-wiki.md)
- [Wiki Schema](../wiki/WIKI.md)

---

*维护是一个持续过程，每次小的改进都会让 Wiki 更加有价值*
