# Obsidian Wiki Index 自动化实现计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**目标:** 将手动维护的 `wiki/index.md` 改造为 Dataview 自动索引,实现零维护、零遗漏的 Wiki 导航系统。

**架构:** 基于 Obsidian Dataview 插件,使用 YAML frontmatter 元数据动态生成索引表格。为每个分类创建独立查询块,支持按标签、日期自动排序,保留现有双链兼容性。

**技术栈:** Obsidian, Dataview 插件, YAML frontmatter

---

## 文件结构

**将要创建/修改的文件:**

1. **wiki/index-auto.md** (新建)
   - Dataview 自动索引的测试版本
   - 包含 7 个分类的查询块

2. **wiki/index-manual.md** (备份)
   - 现有手动索引的完整备份
   - 用于应急回滚

3. **wiki/index.md** (修改)
   - 替换为 Dataview 自动版本
   - 保留原有页面结构

4. **wiki/dataview-test.md** (新建)
   - Dataview 查询语法验证页面
   - 用于测试查询正确性

5. **wiki/WIKI.md** (修改)
   - 添加 Dataview 使用说明
   - 更新索引维护章节

**文件职责划分:**
- `index-auto.md`: 新功能测试环境,与生产隔离
- `index-manual.md`: 安全备份,确保可回滚
- `dataview-test.md`: 查询语法实验室,快速迭代
- `index.md`: 生产环境,最终生效版本
- `WIKI.md`: 规范文档,记录新工作流程

---

### Task 1: 环境准备 - Dataview 插件验证

**文件:**
- 检查: `.obsidian/plugins/dataview/`
- 检查: `.obsidian/plugins.json`

- [ ] **Step 1: 验证 Dataview 插件已安装**

检查插件目录:
```bash
test -d ".obsidian/plugins/dataview" && echo "Dataview 插件已安装" || echo "❌ Dataview 插件未安装"
```

预期: "Dataview 插件已安装"

- [ ] **Step 2: 验证 Dataview 插件已启用**

检查插件配置:
```bash
grep -A 3 '"dataview"' .obsidian/plugins.json | grep '"enabled": true'
```

预期: 输出包含 `"enabled": true`

- [ ] **Step 3: 配置 Dataview 设置**

如果 `.obsidian/plugins/dataview/data.json` 不存在,创建默认配置:
```json
{
  "queryInline": true,
  "queryInlineJs": false,
  "automaticReloadViews": true,
  "renderNullAs": "-",
  "prettyRenderInlineFields": true,
  "dateFormat": "YYYY-MM-DD",
  "recursiveLinkDisplay": true
}
```

- [ ] **Step 4: 创建 dataview-test.md 验证页面**

创建测试页面:
```markdown
---
name: dataview-test
description: Dataview 查询语法验证页面
type: reference
created: 2026-04-26
updated: 2026-04-26
---

# Dataview 测试

## 基础查询测试

\`\`\`dataview
LIST
FROM "wiki"
WHERE type
SORT type, file.link
\`\`\`

预期: 列出所有带 type 字段的页面
```

- [ ] **Step 5: 在 Obsidian 中打开 dataview-test.md 验证**

操作:
1. 在 Obsidian 中打开 `wiki/dataview-test.md`
2. 查看是否显示页面列表

预期: 显示一个包含所有 Wiki 页面的列表

---

### Task 2: 创建 Dataview 查询块 - Concepts 分类

**文件:**
- 修改: `wiki/index-auto.md`

- [ ] **Step 1: 创建 index-auto.md 页面框架**

创建自动索引页面:
```markdown
---
name: wiki-index-auto
description: Wiki 自动索引 (Dataview 版本) - 测试版
type: reference
created: 2026-04-26
updated: 2026-04-26
---

# Wiki Index (Auto)

> 本页面使用 Dataview 插件自动生成索引,零维护、零遗漏

本 Wiki 基于 Karpathy LLM Wiki 方法论构建,专注于 Claude Code 最佳实践知识积累。

---

## Concepts (概念)

\`\`\`dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
  , tags as "标签"
  , updated as "更新"
FROM "wiki/concepts"
WHERE type = "concept"
SORT updated DESC
\`\`\`

## Entities (实体)

(待添加)

## Sources (来源)

(待添加)

## Synthesis (综合)

(待添加)

## Guides (指南)

(待添加)

## Tutorial (教程)

(待添加)

## Implementation (实现详解)

(待添加)

## Tips (技巧)

(待添加)
```

- [ ] **Step 2: 在 Obsidian 中打开 index-auto.md 验证 Concepts 查询**

操作:
1. 在 Obsidian 中打开 `wiki/index-auto.md`
2. 检查 Concepts 分类是否正确显示

预期: 显示 6 个 Concepts 页面的表格,包含列: 页面、描述、标签、更新

---

### Task 3: 创建 Dataview 查询块 - Entities 分类

**文件:**
- 修改: `wiki/index-auto.md`

- [ ] **Step 1: 添加 Entities 查询块**

在 `## Entities (实体)` 章节添加查询:
```markdown
## Entities (实体)

\`\`\`dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
  , type as "类型"
  , updated as "更新"
FROM "wiki/entities"
WHERE type = "entity"
SORT updated DESC
\`\`\`
```

- [ ] **Step 2: 在 Obsidian 中刷新页面验证**

操作:
1. 在 Obsidian 中刷新 `wiki/index-auto.md`
2. 检查 Entities 分类是否正确显示

预期: 显示 10 个 Entities 页面的表格

---

### Task 4: 创建 Dataview 查询块 - Sources 分类

**文件:**
- 修改: `wiki/index-auto.md`

- [ ] **Step 1: 添加 Sources 查询块**

在 `## Sources (来源)` 章节添加查询:
```markdown
## Sources (来源)

\`\`\`dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "摘要"
  , updated as "摘要日期"
FROM "wiki/sources"
WHERE type = "source"
SORT updated DESC
\`\`\`
```

- [ ] **Step 2: 验证 Sources 查询输出**

在 Obsidian 中刷新页面,检查是否正确显示 7 个 Sources 页面。

---

### Task 5: 创建 Dataview 查询块 - Synthesis 分类

**文件:**
- 修改: `wiki/index-auto.md`

- [ ] **Step 1: 添加 Synthesis 查询块**

在 `## Synthesis (综合)` 章节添加查询:
```markdown
## Synthesis (综合)

\`\`\`dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
  , updated as "更新"
FROM "wiki/synthesis"
WHERE type = "synthesis"
SORT updated DESC
\`\`\`

**注意**: synthesis 包含 orchestration-workflow 目录的特殊处理

\`\`\`dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
  , updated as "更新"
FROM "wiki/orchestration-workflow"
WHERE type = "synthesis"
SORT updated DESC
\`\`\`
```

- [ ] **Step 2: 验证 Synthesis 查询输出**

在 Obsidian 中刷新页面,检查是否正确显示 5 个 Synthesis 页面。

---

### Task 6: 创建 Dataview 查询块 - Guides 分类

**文件:**
- 修改: `wiki/index-auto.md`

- [ ] **Step 1: 添加 Guides 查询块**

在 `## Guides (指南)` 章节添加查询:
```markdown
## Guides (指南)

\`\`\`dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
FROM "wiki/guides"
WHERE type = "guide"
SORT file.link ASC
\`\`\`
```

- [ ] **Step 2: 验证 Guides 查询输出**

在 Obsidian 中刷新页面,检查是否正确显示 8 个 Guides 页面。

---

### Task 7: 创建 Dataview 查询块 - Tutorial 分类

**文件:**
- 修改: `wiki/index-auto.md`

- [ ] **Step 1: 添加 Tutorial 查询块**

在 `### Tutorial (教程)` 章节添加查询:
```markdown
### Tutorial (教程)

\`\`\`dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
FROM "wiki/tutorial"
SORT file.link ASC
\`\`\`
```

- [ ] **Step 2: 验证 Tutorial 查询输出**

在 Obsidian 中刷新页面,检查是否正确显示 5 个 Tutorial 页面。

---

### Task 8: 创建 Dataview 查询块 - Implementation 分类

**文件:**
- 修改: `wiki/index-auto.md`

- [ ] **Step 1: 添加 Implementation 查询块**

在 `### Implementation (实现详解)` 章节添加查询:
```markdown
### Implementation (实现详解)

\`\`\`dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
  , tags as "标签"
FROM "wiki/implementation"
WHERE type = "implementation"
SORT file.link ASC
\`\`\`
```

- [ ] **Step 2: 验证 Implementation 查询输出**

在 Obsidian 中刷新页面,检查是否正确显示 5 个 Implementation 页面。

---

### Task 9: 创建 Dataview 查询块 - Tips 分类

**文件:**
- 修改: `wiki/index-auto.md`

- [ ] **Step 1: 添加 Tips 查询块**

在 `## Tips (技巧)` 章节添加查询:
```markdown
## Tips (技巧)

\`\`\`dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
  , updated as "更新"
FROM "wiki/tips"
WHERE type = "tips"
SORT updated DESC
\`\`\`
```

- [ ] **Step 2: 验证 Tips 查询输出**

在 Obsidian 中刷新页面,检查是否正确显示 13 个 Tips 页面。

---

### Task 10: 验证自动索引完整性

**文件:**
- 检查: `wiki/index-auto.md`

- [ ] **Step 1: 统计各分类页面数量**

在 Obsidian 中打开 `wiki/index-auto.md`,统计每个分类显示的页面数:

```bash
echo "手动统计 index-auto.md 中各分类的页面数量:"
echo "Concepts: __ 个"
echo "Entities: __ 个"
echo "Sources: __ 个"
echo "Synthesis: __ 个"
echo "Guides: __ 个"
echo "Tutorial: __ 个"
echo "Implementation: __ 个"
echo "Tips: __ 个"
```

预期统计:
- Concepts: 6 个
- Entities: 10 个
- Sources: 7 个
- Synthesis: 5 个
- Guides: 8 个
- Tutorial: 5 个
- Implementation: 5 个
- Tips: 13 个

总计: 59 个页面

- [ ] **Step 2: 与现有 index.md 对比**

打开 `wiki/index.md`,检查两个版本的页面数量是否一致。

预期: 自动索引页面数量 = 手动索引页面数量

- [ ] **Step 3: 验证双链兼容性**

在 `index-auto.md` 中点击任意页面链接,确认能正常跳转。

预期: 所有 `[[...]]` 链接都能正常跳转到目标页面

---

### Task 11: 备份现有手动索引

**文件:**
- 创建: `wiki/index-manual.md`

- [ ] **Step 1: 复制当前 index.md 为备份**

执行备份命令:
```bash
cp wiki/index.md wiki/index-manual.md
```

- [ ] **Step 2: 验证备份文件已创建**

检查备份文件:
```bash
test -f "wiki/index-manual.md" && echo "✅ 备份成功" || echo "❌ 备份失败"
```

预期: "✅ 备份成功"

- [ ] **Step 3: 添加备份说明到 index-manual.md**

在备份文件顶部添加说明:
```markdown
---
name: wiki-index-manual
description: Wiki 手动索引备份 - 应急回滚版本
type: reference
created: 2026-04-23
updated: 2026-04-26
note: 本文件是 index.md 的手动维护版本备份,用于应急回滚
---

# Wiki Index (Manual Backup)

> ⚠️ 本文件是手动索引的备份版本,仅在需要回滚时使用
> 正常使用请查看 [[index|Wiki Index (Auto)]]

(以下是原始手动索引内容,保持不变)
```

---

### Task 12: 替换 index.md 为自动版本

**文件:**
- 替换: `wiki/index.md`

- [ ] **Step 1: 备份当前 index.md 内容**

读取当前内容到临时文件(已在 Task 11 完成,此步骤确认)
```bash
ls -lh wiki/index.md wiki/index-manual.md
```

预期: 两个文件大小一致

- [ ] **Step 2: 用 Dataview 自动版本替换 index.md**

复制自动版本到主索引:
```bash
cp wiki/index-auto.md wiki/index.md
```

- [ ] **Step 3: 更新 index.md 的 frontmatter**

修改 `wiki/index.md` 的 frontmatter:
```markdown
---
name: wiki-index
description: Wiki 导航索引 — 所有页面的分类目录 (Dataview 自动生成)
type: reference
created: 2026-04-23
updated: 2026-04-26
note: 本页面使用 Dataview 插件自动生成,零维护、零遗漏
---
```

- [ ] **Step 4: 验证替换成功**

在 Obsidian 中打开 `wiki/index.md`,检查:
1. 所有分类的表格是否正确显示
2. 页面数量是否与之前一致
3. 点击双链是否能正常跳转

预期: 所有功能正常,无页面遗漏

---

### Task 13: 验证与调整

**文件:**
- 对比: `wiki/index.md` vs `wiki/index-manual.md`

- [ ] **Step 1: 逐行对比页面列表**

创建对比脚本:
```bash
echo "=== 手动版页面统计 ==="
grep -E "^\| \[\[" wiki/index-manual.md | wc -l

echo "=== 自动版页面统计 ==="
# 在 Obsidian 中查看实际显示的行数

echo "=== 验证: 统计应该一致 ==="
```

- [ ] **Step 2: 检查是否有遗漏页面**

在 Obsidian 中对比两个版本:
1. 左侧打开 `index-manual.md` (手动版)
2. 右侧打开 `index.md` (自动版)
3. 逐行对比每个分类的页面列表

预期: 两个版本包含相同的页面

- [ ] **Step 3: 调整表格显示(如需要)**_

如果某些列宽不合理,在 Dataview 查询中调整列顺序或字段名称。

- [ ] **Step 4: 添加"最近更新"查询块**

在 `index.md` 底部添加:
```markdown
---

## 最近更新

\`\`\`dataview
TABLE without id
  link(file.link, title) as "页面"
  , updated as "更新时间"
FROM "wiki"
SORT updated DESC
LIMIT 5
\`\`\`
```

---

### Task 14: 更新 WIKI.md 文档

**文件:**
- 修改: `wiki/WIKI.md`

- [ ] **Step 1: 在 WIKI.md 中添加 Dataview 使用说明**

在"操作流程"章节后添加新章节:
```markdown
## 自动索引

Wiki 使用 [Dataview](https://github.com/blacksmithgu/obsidian-dataview) 插件自动生成索引。

### 查询语法

每个分类使用独立的 Dataview 查询块:

\`\`\`dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
  , tags as "标签"
FROM "wiki/concepts"
WHERE type = "concept"
SORT updated DESC
\`\`\`

### 添加新页面

创建新页面时,确保 YAML frontmatter 包含必需字段:

\`\`\`yaml
---
name: page-slug
description: 一句话描述
type: concept | entity | source | synthesis | guide | implementation | tips
tags: [tag1, tag2]
created: YYYY-MM-DD
updated: YYYY-MM-DD
source: ../archive/{category}/{filename}.md
---
\`\`\`

新页面会自动出现在对应的分类索引中,无需手动更新 `index.md`。
```

- [ ] **Step 2: 更新"索引结构"章节**

替换原有的"索引结构"章节内容:
```markdown
## 索引结构

`index.md` 使用 Dataview 自动生成,按类别组织:

- **Concepts (概念)** — 核心概念和原理
- **Entities (实体)** — 具体工具、框架和项目
- **Sources (来源)** — 原始来源摘要
- **Synthesis (综合)** — 跨概念的深度分析
- **Guides (指南)** — 实用操作指南
- **Tutorial (教程)** — 系统化教程
- **Implementation (实现)** — 组件实现原理
- **Tips (技巧)** — 社区使用技巧

索引使用 Dataview 插件自动生成,零维护、零遗漏。
```

- [ ] **Step 3: 更新版本历史**

在 WIKI.md 的"更新历史"表格中添加新行:
```markdown
| 2026-04-26 | 2.2 | Dataview: 引入自动索引系统,零维护 Wiki 导航 |
```

---

### Task 15: 记录日志到 log.md

**文件:**
- 修改: `wiki/log.md`

- [ ] **Step 1: 添加迁移日志条目**

在 `log.md` 顶部添加新条目:
```markdown
## [2026-04-26] migration | Wiki Index 自动化迁移完成

- **操作**: 将手动维护的 index.md 迁移到 Dataview 自动索引
- **创建文件**:
  - `wiki/index-auto.md` — Dataview 自动索引测试版
  - `wiki/index-manual.md` — 手动索引备份(应急回滚)
  - `wiki/dataview-test.md` — Dataview 查询语法验证
- **修改文件**:
  - `wiki/index.md` — 替换为 Dataview 自动版本
  - `wiki/WIKI.md` — 添加 Dataview 使用说明
- **验证结果**:
  - ✅ 7 个分类查询块全部正常工作
  - ✅ 59 个页面全部正确显示
  - ✅ 双链兼容性保持完整
  - ✅ 自动索引与手动版页面数量一致
- **效果**:
  - 零维护: 新页面自动出现在索引中
  - 零遗漏: Datavouch 自动扫描所有符合条件的页面
  - 支持排序: 按更新日期降序自动排序
- **备份**: `index-manual.md` 已保存,可随时回滚

---
```

- [ ] **Step 2: 验证日志格式**

检查日志是否符合 `log.md` 的格式规范:
- 使用 `## [YYYY-MM-DD] operation | Brief description` 格式
- 包含操作、创建/修改文件列表
- 记录验证结果和效果

预期: 日志格式与现有条目一致

---

### Task 16: 最终验证与提交

**文件:**
- 验证: 所有修改的文件

- [ ] **Step 1: 运行 wiki-lint.sh 检查 Wiki 健康**

执行健康检查:
```bash
cd wiki && ../scripts/wiki-lint.sh
```

预期: Lint 报告显示 Wiki 状态良好,无新增问题

- [ ] **Step 2: 在 Obsidian 中全面测试**

在 Obsidian 中完成以下测试:
1. 打开 `wiki/index.md`,确认所有分类表格正常显示
2. 点击每个分类中的任意页面链接,确认能正常跳转
3. 检查"最近更新"查询块是否正常工作
4. 打开 Graph View,确认双链关系正常
5. 检查 Backlinks 面板,确认反向链接正常

预期: 所有功能正常,无回归问题

- [ ] **Step 3: 提交变更到 Git**

提交所有修改:
```bash
git add wiki/index.md wiki/index-manual.md wiki/index-auto.md wiki/dataview-test.md wiki/WIKI.md wiki/log.md
git commit -m "feat: 引入 Dataview 自动索引系统

- 创建 Dataview 自动索引,零维护 Wiki 导航
- 支持 7 个分类的动态查询 (concepts, entities, sources, synthesis, guides, tutorial, implementation, tips)
- 保留手动版备份 (index-manual.md) 用于应急回滚
- 更新 WIKI.md 添加 Dataview 使用说明
- 记录迁移日志到 log.md

验证结果:
- ✅ 59 个页面全部正确显示
- ✅ 双链兼容性保持完整
- ✅ 支持按更新日期自动排序

Refs: docs/superpowers/specs/2026-04-26-obsidian-index-automation-design.md"
```

- [ ] **Step 4: 标记任务完成**

确认所有任务已完成:
- [ ] Dataview 插件已验证
- [ ] 7 个分类查询块已创建
- [ ] 自动索引与手动版页面数量一致
- [ ] 双链兼容性保持完整
- [ ] 备份文件已创建
- [ ] WIKI.md 已更新
- [ ] log.md 已记录
- [ ] Lint 检查通过
- [ ] Git 提交完成

预期: 所有检查项通过,实现计划执行完毕

---

## 附录: 故障排除

### 问题 1: Dataview 查询不显示任何结果

**症状**: 查询块显示"无结果"

**排查**:
1. 检查页面是否有 YAML frontmatter
2. 检查 `type:` 字段值是否正确
3. 检查文件路径是否在查询的 `FROM` 范围内

**解决**: 使用 `dataview-test.md` 验证基础查询,确认插件工作正常

### 问题 2: 页面数量不一致

**症状**: 自动索引显示的页面数少于手动版

**排查**:
1. 检查某些页面是否缺少 `type:` 字段
2. 检查文件路径是否正确(应该在 `wiki/{category}/` 下)
3. 运行 `wiki-lint.sh` 检查 frontmatter 完整性

**解决**: 为缺失字段的页面补充 frontmatter

### 问题 3: 双链失效

**症状**: 点击 `[[...]]` 链接无法跳转

**排查**:
1. 确认目标页面文件名与链接名称一致
2. 确认目标页面存在于 `wiki/` 目录中

**解决**: 修正链接名称或移动文件到正确位置

---

## 成功标准

- [ ] ✅ 新页面自动出现在索引中(无需手动更新)
- [ ] ✅ 所有 59 个现有页面都能正确显示
- [ ] ✅ 所有双链保持可用
- [ ] ✅ 支持按更新日期自动排序
- [ ] ✅ Lint 检查通过
- [ ] ✅ 用户文档已更新(WIKI.md)

---

**计划创建日期**: 2026-04-26
**预计执行时间**: 30-45 分钟
**风险等级**: 低(有完整备份和回滚计划)
