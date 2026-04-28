---
name: wiki-schema
description: LLM Wiki 维护规范 — 本项目的 Wiki 架构、操作流程和约定
type: reference
version: 2.2
updated: 2026-04-26
---

# Wiki Schema — Claude Code Best Practice Wiki

本文档定义了本 Wiki 的架构、规范和工作流程。所有 LLM 操作都应遵循此规范。

## 架构概览

```
[源文件] → raw/ → [ingest] → wiki/ + [源文件] → archive/{类型}/
```

| 阶段 | 目录 | 说明 |
|------|------|------|
| 摄入前 | `raw/` | 临时存放待处理源文件 |
| 处理中 | `wiki/` | Wiki 知识库（LLM 完全维护） |
| 处理后 | `archive/` | 源文件归档（供溯源） |

```
project-root/
├── raw/                    # ingest 前临时目录
├── wiki/                   # Wiki 知识库
│   ├── WIKI.md            # 本文件
│   ├── index.md           # Wiki 目录
│   ├── log.md             # 操作日志
│   ├── WIKI-LINT-REPORT.md # Lint 报告（自动生成）
│   ├── concepts/          # 概念
│   ├── entities/          # 实体
│   ├── sources/           # 来源摘要
│   ├── synthesis/          # 综合分析
│   ├── guides/             # 使用指南
│   ├── tips/               # 技巧总结
│   ├── tutorial/           # 教程
│   │   ├── day0/          # Day 0 教程
│   │   │   ├── README.md  # Linux/Mac/Windows 安装
│   │   │   ├── linux.md
│   │   │   ├── mac.md
│   │   │   └── windows.md
│   │   └── day1/          # Day 1 教程
│   │       └── README.md
│   ├── implementation/      # 实现文档
│   └── orchestration-workflow/  # 编排工作流
├── archive/               # 归档目录（不可变）
│   ├── reports/           # 原始报告
│   ├── tips/              # 原始技巧
│   ├── best-practice/      # 原始最佳实践
│   ├── tutorial/          # 原始教程
│   │   ├── day0/
│   │   └── day1/
│   ├── implementation/     # 原始实现文档
│   ├── workflows/         # 原始工作流
│   ├── changelog/         # 变更日志历史
│   └── assets/            # 归档资源
│       └── images/        # 图片资源
│           ├── best-practice/
│           ├── implementation/
│           ├── reports/
│           ├── tips/
│           └── tutorial/
└── .claude/skills/       # Skills 目录
    └── wiki-lint/         # Wiki Lint Skill
        └── wiki-lint.sh  # Wiki 健康检查工具
```

## 三层架构

### 1. Raw（临时目录）
- 存放于 `raw/` 目录
- **暂存状态** — 仅在 ingest 过程中存在
- 支持格式：Markdown、TXT

### 2. Wiki（知识库）
- 存放于 `wiki/` 目录
- **LLM 完全拥有** — 创建、更新，维护
- 页面 frontmatter 中 `source:` 字段指向 archive 位置

### 3. Archive（归档存储）
- 存放于 `archive/` 目录
- **不可变** — ingest 后移入，仅供溯源查阅
- 不参与 ingest 扫描
### 4. Schema（本文件）
- 定义页面格式和约定
- 更新以反映最佳实践

## 页面格式

### Frontmatter（必须）

```markdown
---
name: page-slug
description: 一句话描述
type: concept | entity | source | synthesis | guide | tutorial | tips | implementation
tags: [tag1, tag2, tag3]
created: YYYY-MM-DD
updated: YYYY-MM-DD
source: ../../archive/{category}/{filename}.md  # 模板占位符
---

# Page Title
```

**重要规则**：
- `source:` 字段必须指向 `archive/` 中的原始文件
- 路径从 Wiki 页面位置计算相对路径：
  - `wiki/{category}/xxx.md` → `source: ../../archive/{category}/xxx.md`
  - `wiki/{category}/{subcategory}/xxx.md` → `source: ../../archive/{category}/xxx.md`

### 命名规范
- **概念**：小写 + 连字符，如 `context-window.md`
- **实体**：小写 + 连字符，如 `claude-code.md`
- **来源**：简短标识，如 `karpathy-llm-wiki.md`
- **综合**：描述性标题，如 `agent-architecture-patterns.md`
- **指南**：动词性标题，如 `quick-start.md`
- **实现**：组件名 + -implementation，如 `commands-implementation.md`

### 交叉引用
使用 `[[page-slug]]` 语法创建链接：
```markdown
参见 [[context-window]] 了解更多信息。
```

## 操作流程

### Ingest（摄入）

当添加新来源时：

1. **读取来源** — 阅读 `raw/` 中的原始文档
2. **讨论要点** — 与用户讨论关键内容
3. **写入摘要页** — 创建 `sources/` 中的来源摘要
4. **更新相关页面** — 更新 `concepts/`、`entities/` 中的相关页面
5. **更新索引** — 更新 `index.md`
6. **记录日志** — 添加 `log.md` 条目

### Query（查询）

当用户提问时：

1. **搜索 Wiki** — 读取 `index.md` 找到相关页面
2. **阅读相关页面** — 获取背景知识
3. **综合回答** — 结合多个来源
4. **归档有价值内容** — 将分析结果写回 Wiki

### Lint（检查）

使用 `/wiki-lint` skill 定期检查 Wiki 健康状况：

调用 `/wiki-lint` skill 或使用备选命令 `cd wiki && ../.claude/skills/wiki-lint/wiki-lint.sh`

**检查项目**：
1. **页面统计** — 按分类统计页面数量
2. **Frontmatter 完整性** — 检查必需字段（name, description, type）
3. **交叉引用验证** — 验证 `[[...]]` 链接目标存在
4. **Source 引用验证** — 验证 `source:` 字段指向存在的 archive 文件
5. **生成报告** — 输出到 `wiki/WIKI-LINT-REPORT.md`

## 索引结构

### Dataview 自动索引（默认）

`index.md` 使用 [Dataview](https://github.com/blacksmithgu/obsidian-dataview) 插件自动生成：

```markdown
# Wiki Index

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

Dataview 会根据 frontmatter 自动查询并生成表格，实现零维护。

### 手动备份索引

`index-manual.md` 是手动维护的备份版本，如 Dataview 出现问题可参考恢复。

### 必需插件

- **Dataview**: 必须安装并启用此插件才能自动刷新索引

### 零维护原理

当页面添加正确的 frontmatter 后：
1. 新页面自动出现在对应分类
2. `updated` 字段决定排序
3. 无需手动更新任何表格

## 日志格式

`log.md` 使用统一前缀：

```markdown
## [YYYY-MM-DD] ingest | Source Title
- Extracted: 3 concepts, 2 entities
- Updated: [[context-window]], [[claude-code]]
- Notes: 关键发现...

## [YYYY-MM-DD] query | User Question
- Answered: 综合了 [[context-management]], [[context-window]]
- Filed to: [[synthesis/topic-analysis]]

## [YYYY-MM-DD] lint
- Found: 1 contradiction, 2 orphans
- Fixed: [[quick-start]], [[best-practices]]
```

## 质量标准

### 页面质量
- [ ] 一句话描述在前matter中
- [ ] 至少 2 个相关标签
- [ ] 至少 1 个交叉引用
- [ ] 更新日期正确
- [ ] 内容无过时引用

### 链接健康
- [ ] 无悬空链接
- [ ] 入站链接 > 0（无孤立页面）
- [ ] 概念链接到源页面

## 维护责任

| 角色 | 职责 |
|------|------|
| **人类** | 策展来源、提问、思考、分析 |
| **LLM** | 读取、总结、交叉引用、归档、维护 |

## 工具提示

- 使用 `grep "^## \[" wiki/log.md | tail -5` 查看最近 5 条日志
- 调用 `/wiki-lint` skill 检查健康状况
- 在 Obsidian 中查看 Graph View 可视化 Wiki 结构

## 故障排除

### Source 引用路径错误

**症状**: Lint 工具报告 source 指向不存在的文件

**常见原因**:
- Wiki 页面位于子目录，但 `source:` 路径层级不正确
- 例如：`wiki/entities/xxx.md` 使用 `source: ../archive/...` 会指向 `wiki/archive/`（错误）

**路径计算规则**:
```
wiki/{category}/xxx.md       → source: ../../archive/{category}/xxx.md
wiki/{category}/{sub}/xxx.md → source: ../../archive/{category}/xxx.md
```

**修复命令**:
```bash
# 修复一级子目录
find wiki -mindepth 2 -maxdepth 2 -type f -name "*.md" \
  -not -path "*/tutorial/*" \
  -exec sed -i 's|source: \.\./archive/|source: ../../archive/|' {} \;

# 修复二级子目录（如 tutorial/day0/）
find wiki/tutorial -type f -name "*.md" \
  -exec sed -i 's|source: \.\./\.\./archive/|source: ../../archive/|' {} \;
```

**验证**: `grep -r "^source: \.\./archive/" wiki/` 应返回 0

## 更新历史

| 日期 | 版本 | 变更 |
|------|------|------|
| 2026-04-23 | 1.0 | 初始版本 |
| 2026-04-26 | 2.0 | P3 架构：新增 Raw→Archive 工作流，source 字段规范 |
| 2026-04-26 | 2.1 | 优化：完整目录结构、Lint 工具集成、故障排除章节 |
| 2026-04-26 | 2.2 | Dataview 自动索引：index.md 改为 Dataview 查询实现零维护 |

---

*本 Wiki 基于 Karpathy 的 LLM Wiki 方法论构建*
