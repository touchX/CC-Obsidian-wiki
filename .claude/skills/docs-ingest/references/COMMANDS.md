# Docs Ingest — 命令参考

本文档提供 docs-ingest skill 中使用的所有命令的详细参考。

## 目录

- [defuddle 网页提取](#1-defuddle-网页提取)
- [obsidian-cli 命令](#2-obsidian-cli-命令)
- [环境适配命令](#3-环境适配命令)

---

## 1. defuddle 网页提取

### 基本提取

```bash
# 提取网页为 Markdown（首选方式，比 WebFetch 省 token）
defuddle parse <url> --md -o content.md

# 示例
defuddle parse https://example.com/article --md -o raw/temp/article.md
```

### 提取元数据

```bash
# 提取标题
defuddle parse <url> -p title

# 提取描述
defuddle parse <url> -p description

# 提取所有元数据
defuddle parse <url> -p all
```

### 高级选项

```bash
# 指定输出编码（处理中文网页）
defuddle parse <url> --md -o content.md --encoding utf-8

# 提取后立即保存到 raw/ 待处理
defuddle parse <url> --md -o raw/temp/extracted.md

# 使用自定义 User-Agent
defuddle parse <url> --md -o content.md --user-agent "MyBot/1.0"
```

---

## 2. obsidian-cli 命令

### 搜索去重

```bash
# 搜索是否已有相关页面（重要！必须先做）
obsidian search query="相关关键词" limit=5

# 查看搜索结果的 wikilinks 确定无重复后再创建
obsidian search query="Obsidian 工作流" limit=10
```

### 创建页面

```bash
# 创建基础页面（content 使用 \n 换行）
obsidian create name="category/slug" content="# Title\n\nContent" silent

# 使用模板创建（如果项目有模板）
obsidian create name="category/slug" template="WikiTemplate" silent

# 指定完整路径
obsidian create path="category/slug" content="# Title\n\nContent" silent
```

### 设置属性

```bash
# 逐个设置属性（推荐方式，与 Obsidian 属性系统同步）
obsidian property:set name="description" value="一句话描述" file="category/slug"
obsidian property:set name="type" value="concept" file="category/slug"
obsidian property:set name="tags" value='["tag1", "tag2"]' file="category/slug"
obsidian property:set name="source" value="../../archive/category/filename.md" file="category/slug"

# 日期属性
obsidian property:set name="created" value="2026-05-02" file="category/slug"
obsidian property:set name="updated" value="2026-05-02" file="category/slug"

# ⚠️ Git Bash 中文值会失败，使用 Write 工具 + 手写 YAML
```

### 追加内容

```bash
# 追加内容到现有页面
obsidian append file="ExistingNote" content="\n\n## New Section"

# 追加 callout 格式的重要信息
obsidian append file="ExistingNote" content="\n\n> [!tip] Key Finding\n> 重要发现内容。"

# 追加多个段落
obsidian append file="ExistingNote" content="\n\n段落1\n\n段落2\n\n段落3"
```

### 读取页面

```bash
# 检查现有页面内容
obsidian read file="ExistingNote"

# 读取特定页面的完整内容
obsidian read file="guides/obsidian-workflow"
```

---

## 3. 环境适配命令

### 中文环境（Git Bash）

```bash
# 创建页面（推荐方式）
Write tool + 手写 YAML frontmatter

# 设置属性（手写 YAML）
---
name: page-slug
description: 中文描述完全没问题
type: guide
tags: [tag1, tag2, 中文标签]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/category/file.md
---
```

### 英文环境（PowerShell/CMD）

```bash
# 创建页面
obsidian create path="category/slug" content="# Title" silent

# 设置属性
obsidian property:set name="description" value="English description" path="category/slug"
obsidian property:set name="type" value="concept" path="category/slug"
```

### 文件归档

```bash
# 中文文件名使用通配符（Git Bash）
cd raw/plugins && mv *-使用指南.md ../../archive/plugins/

# 或使用绝对路径（避免中文路径问题）
mv /d/Docs/project/raw/file.md /d/Docs/project/archive/

# 英文文件名直接使用
mv raw/guides/file.md archive/guides/file.md
```

---

## 常用命令组合

### 完整的文档摄取流程（中文环境）

```bash
# 1. 提取网页
defuddle parse https://example.com --md -o raw/temp/article.md

# 2. 检查重复
obsidian search query="article 关键词" limit=5

# 3. 创建 Wiki 页面（使用 Write 工具）
# 在 Write 工具中直接编写 YAML frontmatter + 内容

# 4. 归档源文件
cd raw/temp && mv article.md ../../archive/web/
```

### 完整的文档摄取流程（英文环境）

```bash
# 1. 提取网页
defuddle parse https://example.com --md -o raw/temp/article.md

# 2. 检查重复
obsidian search query="article keywords" limit=5

# 3. 创建页面
obsidian create path="category/article" content="# Title" silent

# 4. 设置属性
obsidian property:set name="description" value="..." path="category/article"
obsidian property:set name="type" value="source" path="category/article"
obsidian property:set name="source" value="../../archive/web/article.md" path="category/article"

# 5. 归档源文件
mv raw/temp/article.md archive/web/
```

---

## 故障排除

### def相关问题

| 问题 | 解决方案 |
|------|----------|
| 提取失败 | 检查 URL 是否可访问，尝试添加 `--encoding utf-8` |
| 中文乱码 | 使用 `--encoding utf-8` 或 `--encoding gbk` |
| 格式错误 | 尝试使用 `-p all` 查看原始元数据 |

### obsidian-cli 问题

| 问题 | 解决方案 |
|------|----------|
| `property:set` 中文失败 | 使用 Write 工具 + 手写 YAML |
| `create name=` 失败 | 改用 `create path=` |
| `search` 无结果 | 检查查询词，尝试更通用的关键词 |

### 环境问题

| 问题 | 解决方案 |
|------|----------|
| Git Bash 中文路径错误 | 使用通配符或绝对路径 |
| PowerShell 特殊字符错误 | 使用单引号包裹路径 |
| 文件权限错误 | 检查文件是否被其他程序占用 |
