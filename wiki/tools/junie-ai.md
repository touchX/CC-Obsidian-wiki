---
name: tools/junie-ai
description: Junie - Claude Code 的只读代码探索代理，使用 XML 格式与特殊命令
type: source
tags: [claude-code, agent, readonly, code-exploration, xml]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/system-prompts/Junie/Prompt.txt
---

# Junie

Junie 是 Claude Code 的只读代码探索代理，专注于快速探索和澄清用户想法、调查项目结构、检索相关代码片段。

## 核心特征

- **只读模式**：不能修改、创建或删除任何文件
- **XML 响应格式**：使用 `<THOUGHT>` 和 `<COMMAND>` 标签
- **交互式命令**：支持文件浏览、搜索、结构分析
- **无交互命令**：不支持 vim、python 等交互式命令

## XML 响应格式

```xml
<THOUGHT>
解释你的推理和下一步操作
</THOUGHT>
<COMMAND>
单个命令执行
</COMMAND>
```

## 特殊命令

### search_project

模糊搜索项目中的各类内容：
- 类定义
- 符号（类、方法、变量等）
- 文件名
- 纯文本内容

```bash
search_project "<search_term>" [<path>]
# 示例
search_project "class User"
search_project "def query_with_retries"
search_project "authorization" pathToFile/example.doc
```

### get_file_structure

显示文件的代码结构，包括所有符号（类、方法、函数）定义和导入语句。

```bash
get_file_structure <file>
# 输出示例
- User (class): lines 1-50
  - authenticate (method): params [username, password], lines 10-25
  - authorize (method): params [role], lines 27-45
```

### open

在编辑器中打开指定文件的 100 行，从指定行号开始。

```bash
open <path> [<line_number>]
```

### open_entire_file

尝试显示整个文件内容（仅在需要时使用，大文件会很慢）。

```bash
open_entire_file <path>
```

### goto

滚动当前文件到指定行号。

```bash
goto <line_number>
```

### scroll_down / scroll_up

每次移动 100 行查看文件。

```bash
scroll_down
scroll_up
```

### answer

提供问题的完整答案并终止会话。答案必须格式化为有效的 Markdown。

```bash
answer <full_answer>
```

## 使用场景

| 场景 | 适用命令 |
|------|----------|
| 查找类定义 | `search_project "class ClassName"` |
| 分析文件结构 | `get_file_structure <file>` |
| 定位特定代码段 | `open <path> <line>` → `goto <line>` |
| 快速搜索 | `search_project "keyword"` |
| 获取完整答案 | `answer` 命令 |

## 限制

- **只读**：不能执行修改操作
- **非交互**：不支持需要用户输入的命令（如 vim）
- **单命令**：每个响应只能执行一个命令

## 相关链接

- [[tools/leap-new]] - Leap.new 全栈开发代理
- [[tools/lovable]] - Lovable 前端开发代理
- [[tools/orchids-app]] - Orchids.app Next.js 代理
- [[tools/perplexity]] - Perplexity 搜索代理

---

*来源：[Claude Code Plugin - Junie](https://github.com/claude-code/claude-code-plugins)*