# Docs Ingest — 使用示例

本文档提供 docs-ingest skill 的详细使用示例，涵盖常见场景和边缘案例。

## 目录

- [示例 1：从 raw/ 文件摄取](#示例-1从-raw-文件摄取)
- [示例 2：从网页 URL 摄取](#示例-2从网页-url-摄取)
- [示例 3：多个来源文档综合](#示例-3多个来源文档综合)
- [示例 4：处理重复内容](#示例-4处理重复内容)
- [示例 5：错误处理场景](#示例-5错误处理场景)

---

## 示例 1：从 raw/ 文件摄取

### 场景

用户有一个 Markdown 文档在 `raw/guides/obsidian-workflow.md`，需要摄取到 Wiki。

### 步骤

```bash
# 1. 读取源文档
Read raw/guides/obsidian-workflow.md

# 2. 检查 Wiki 中是否有重复内容
obsidian search query="Obsidian 工作流" limit=5

# 3. 创建 Wiki 页面（中文环境）
Write tool 创建 wiki/guides/obsidian-workflow.md
```

### 输出：wiki/guides/obsidian-workflow.md

```markdown
---
name: obsidian-workflow
description: Obsidian 工作流最佳实践指南
type: guide
tags: [obsidian, workflow, best-practice]
created: 2026-05-08
updated: 2026-05-08
source: ../../../archive/guides/obsidian-workflow.md
---

# Obsidian 工作流指南

## 原始文档

> [!info] 来源
> 本页面基于归档文档 [[../../../archive/guides/obsidian-workflow.md|原始文档]] 创建

---

## 概述

本文档介绍 Obsidian 的高效工作流...

## 主要内容

...

## 参考资源

- [[../concepts/obsidian-setup]]
- [[../tips/daily-notes]]
```

### 归档

```bash
# 用户确认后移动源文件
mv raw/guides/obsidian-workflow.md archive/guides/
```

---

## 示例 2：从网页 URL 摄取

### 场景

用户提供了一个网页 URL，需要提取内容并摄取到 Wiki。

### 步骤

```bash
# 1. 使用 defuddle 提取网页内容
defuddle parse https://example.com/guide --md -o raw/temp/extracted.md

# 2. 检查 Wiki 中是否有相关内容
obsidian search query="guide 关键词" limit=5

# 3. 读取提取的内容并分析
Read raw/temp/extracted.md

# 4. 创建 Wiki 页面
Write tool 创建 wiki/guides/web-guide.md
```

### 输出：wiki/guides/web-guide.md

```markdown
---
name: web-guide
description: 从网页提取的指南文档
type: guide
tags: [guide, web, extracted]
created: 2026-05-08
updated: 2026-05-08
source: ../../../archive/web/extracted.md
external_url: https://example.com/guide
---

# Web 指南

## 原始文档

> [!info] 来源
> - 网页来源：[原始链接](https://example.com/guide)
> - 归档副本：[[../../../archive/web/extracted.md|本地归档]]

---

## 概述

从网页提取的内容...

## 主要内容

...
```

### 归档

```bash
# 归档提取的网页内容
mv raw/temp/extracted.md archive/web/
```

---

## 示例 3：多个来源文档综合

### 场景

Wiki 页面需要综合 3 个不同的归档文档。

### 步骤

```bash
# 1. 读取所有源文档
Read archive/guides/obsidian-setup.md
Read archive/guides/obsidian-workflow.md
Read archive/tips/daily-notes.md

# 2. 分析内容结构，确定综合方案

# 3. 创建 Wiki 页面
Write tool 创建 wiki/guides/obsidian-complete-guide.md
```

### 输出：wiki/guides/obsidian-complete-guide.md

```markdown
---
name: obsidian-complete-guide
description: Obsidian 完整指南：设置、工作流和技巧
type: guide
tags: [obsidian, comprehensive, setup, workflow]
created: 2026-05-08
updated: 2026-05-08
---

# Obsidian 完整指南

## 原始文档

本页面综合了以下归档文档：
- [[../../../archive/guides/obsidian-setup.md|Obsidian 设置指南]]
- [[../../../archive/guides/obsidian-workflow.md|Obsidian 工作流]]
- [[../../../archive/tips/daily-notes.md|日记笔记技巧]]

---

## 概述

本指南综合了 Obsidian 的设置、工作流和日常使用技巧...

## 第一部分：设置

基于 [[../../../archive/guides/obsidian-setup.md|设置指南]]...

## 第二部分：工作流

基于 [[../../../archive/guides/obsidian-workflow.md|工作流指南]]...

## 第三部分：技巧

基于 [[../../../archive/tips/daily-notes.md|日记技巧]]...
```

---

## 示例 4：处理重复内容

### 场景

检查时发现 Wiki 中已有相似页面。

### 步骤

```bash
# 1. 搜索重复内容
obsidian search query="Obsidian 工作流" limit=5

# 2. 查看搜索结果
# 发现已有页面：wiki/guides/obsidian-workflow.md

# 3. 决策：更新现有页面 vs 创建新页面
# 如果新内容更好：更新现有页面
# 如果新内容是补充：追加到现有页面
# 如果新内容独立：创建新页面并添加双向链接
```

### 选项 A：更新现有页面

```bash
# 使用 Edit 工具或 obsidian append 追加新内容
obsidian append file="guides/obsidian-workflow" content="\n\n## 新增章节\n\n新内容..."
```

### 选项 B：创建新页面并添加链接

```markdown
---
# 新页面内容

## 相关页面

- [[../guides/obsidian-workflow|原有工作流指南]]
---
```

同时在原页面中添加反向链接：

```markdown
## 相关页面

- [[obsidian-advanced|高级工作流]]
```

---

## 示例 5：错误处理场景

### 场景 5.1：defuddle 提取失败

**问题**：网页无法提取

```bash
defuddle parse https://example.com --md -o raw/temp/article.md
# 错误：Failed to fetch URL
```

**解决方案**：

```bash
# 1. 尝试使用 WebFetch 作为备选
WebFetch https://example.com

# 2. 手动复制粘贴内容到 raw/temp/article.md

# 3. 继续正常的摄取流程
```

### 场景 5.2：文件名冲突

**问题**：归档时目标文件已存在

```bash
mv raw/guides/workflow.md archive/guides/
# 错误：file exists
```

**解决方案**：

```bash
# 1. 检查现有文件
ls archive/guides/workflow*

# 2. 决策：覆盖、合并或重命名
# 覆盖：使用 -f 强制覆盖
mv -f raw/guides/workflow.md archive/guides/

# 合并：手动合并内容后归档
# 重命名：添加时间戳或版本号
mv raw/guides/workflow.md archive/guides/workflow-v2.md
```

### 场景 5.3：Git Bash 中文路径问题

**问题**：中文文件名无法移动

```bash
mv raw/guides/工作流.md archive/guides/
# 错误：No such file or directory
```

**解决方案**：

```bash
# 方案 1：使用通配符
cd raw/guides && mv *工作流*.md ../../archive/guides/

# 方案 2：使用绝对路径
mv /d/Docs/project/raw/guides/工作流.md /d/Docs/project/archive/guides/

# 方案 3：避免中文文件名
# 在提取时使用英文文件名
defuddle parse <url> --md -o raw/temp/workflow.md
```

### 场景 5.4：source 属性路径错误

**问题**：source 路径指向不存在的文件

```markdown
---
source: ../../../archive/guides/wrong-filename.md
---
```

**解决方案**：

```bash
# 1. 验证文件是否存在
ls archive/guides/correct-filename.md

# 2. 使用 Edit 工具修正 source 属性
Edit tool 修改 source 字段为正确路径

# 3. 或使用 wiki-lint 检查所有问题
cd wiki && ../.claude/skills/wiki-lint/wiki-lint.sh
```

---

## 快速检查清单

在执行文档摄取前，快速检查：

```
[ ] 源文档是否存在？
[ ] 是否已检查重复内容？
[ ] 环境判断（中文/英文）？
[ ] 是否选择了正确的工具？
[ ] 归档路径是否正确？
[ ] 是否添加了归档文档双链？
```

---

## 故障排除速查表

| 症状 | 可能原因 | 解决方案 |
|------|----------|----------|
| defuddle 失败 | 网页不可访问 | 使用 WebFetch 或手动复制 |
| 搜索无结果 | 关键词不准确 | 使用更通用的关键词 |
| 中文路径错误 | Git Bash 编码问题 | 使用通配符或绝对路径 |
| property:set 失败 | 中文值或 Git Bash | 改用 Write + YAML |
| 双链不工作 | 路径计算错误 | 检查 ../ 层级是否正确 |
| 文件已存在 | 重复内容 | 更新现有页面或重命名 |
