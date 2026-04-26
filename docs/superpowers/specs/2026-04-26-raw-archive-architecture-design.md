# P3: Raw→Archive 架构设计

> 状态：已批准
> 日期：2026-04-26
> 类型：架构决策

## 背景

Wiki ingest 流程需要解决两个问题：
1. 源文件 ingest 后应存放在哪里？
2. 如何避免重复扫描造成资源浪费？

## 架构概览

```
[源文件] → raw/ → [ingest] → wiki/ + [源文件] → archive/{类型}/
```

| 阶段 | 目录 | 说明 |
|------|------|------|
| 摄入前 | `raw/` | 临时存放待处理源文件 |
| 处理中 | `wiki/` | Wiki 知识库（LLM 完全维护） |
| 处理后 | `archive/` | 源文件归档（供溯源） |

## 目录结构

```
project-root/
├── raw/                    # ingest 前临时目录（保持空或仅存待处理文件）
│
├── wiki/                   # Wiki 知识库
│   ├── concepts/
│   ├── sources/           ← 来源摘要
│   ├── tips/             ← 技巧笔记
│   ├── entities/
│   ├── synthesis/
│   ├── guides/
│   ├── implementation/
│   └── tutorial/
│
└── archive/               # 归档目录（ingest 后移入）
    ├── reports/           # 原始报告
    ├── tips/             # 原始技巧
    ├── best-practice/    # 原始最佳实践
    └── workflows/        # 原始工作流
```

## Archive 子目录映射

| 源目录 | → Archive 子目录 |
|--------|-----------------|
| `reports/` | `archive/reports/` |
| `tips/` | `archive/tips/` |
| `best-practice/` | `archive/best-practice/` |
| `development-workflows/` | `archive/workflows/` |

## 操作规程

### Ingest 流程

1. **源文件放入 `raw/`**
   - 将待处理的源文件复制或移动到 `raw/` 目录
   - 支持格式：Markdown、TXT

2. **执行 ingest**
   - 创建/更新 Wiki 页面
   - 在 Wiki 页面 frontmatter 添加 `source:` 字段，指向归档位置
   - 示例：`source: ../archive/reports/claude-advanced-tool-use.md`

3. **Ingest 完成**
   - 将 `raw/` 中的源文件移动到对应的 `archive/{类型}/` 目录
   - 保持原始文件名

4. **清理 `raw/`**
   - ingest 完成后，`raw/` 保持空状态
   - 仅存放新的待处理文件

### 避免重复扫描机制

- **扫描范围限定**：`raw/` 目录是 ingest 的唯一扫描目标
- **已处理文件移出**：ingest 后立即移入 `archive/`
- **Archive 不再扫描**：Archive 目录仅供溯源查阅，不参与 ingest

## Wiki 页面 source 字段规范

Wiki 页面 frontmatter 中 `source:` 字段格式：

```markdown
---
name: sources/advanced-tool-use
description: API 级别工具调用优化
type: source
source: ../archive/reports/claude-advanced-tool-use.md
---
```

路径为相对路径，从 Wiki 页面位置指向 archive 位置。

## 溯源使用场景

- 查看原始文档内容
- 验证 Wiki 摘要准确性
- 引用原始来源

## 更新 WIKI.md

本设计生效后，需更新 `wiki/WIKI.md` 中相关章节：
- 目录结构说明
- Ingest 操作流程
- Archive 目录用途

## 实施步骤

1. [ ] 创建 `raw/` 目录
2. [ ] 创建 `archive/` 目录及其子目录
3. [ ] 将现有源文件按类型归档到 `archive/`
4. [ ] 更新 Wiki 页面的 `source:` 字段
5. [ ] 更新 `wiki/WIKI.md` 文档

---

*本设计基于 brainstorming 会话生成*
