---
name: tools/trae-ai
description: Trae AI 编程助手系统提示词和工具集
type: source
tags: [trae-ai, agent, tools, system-prompt, ide]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/Trae/
---

# Trae AI

## 概述

Trae AI 是运行在 Trae IDE 中的强大代理式 AI 编程助手，基于 AI Flow 范式，支持独立和协作两种工作模式。

## 两种模式

### Chat 模式
用于简单问答和快速响应，工具集精简。

### Builder 模式
用于复杂任务，支持完整工具集，包括 TodoWrite 任务管理。

## 核心能力

### 工具集

| 工具 | 功能 | 模式 |
|------|------|------|
| `todo_write` | 创建和管理任务列表 | Builder |
| `search_codebase` | Trae 上下文引擎，自然语言检索代码 | 两者 |
| `search_by_regex` | 基于正则的快速文本搜索 | 两者 |
| `view_files` | 批量查看文件（最多 3 个） | 两者 |
| `list_dir` | 查看目录结构 | 两者 |
| `write_to_file` | 创建/重写文件 | 两者 |
| `update_file` | 块级编辑（支持多块替换） | 两者 |
| `edit_file_fast_apply` | 快速编辑（<1000 行） | 两者 |
| `rename_file` | 重命名/移动文件 | 两者 |
| `delete_file` | 删除文件 | 两者 |
| `run_command` | 运行 Shell 命令 | 两者 |
| `check_command_status` | 检查命令状态 | 两者 |
| `stop_command` | 停止运行中的命令 | 两者 |
| `open_preview` | 打开预览 URL | 两者 |
| `web_search` | 网页搜索 | 两者 |
| `finish` | 标记任务完成 | 两者 |

### search_codebase 特点

> Trae 的上下文引擎特性：
> 1. 自然语言描述检索需求
> 2. 专有检索/嵌入模型套件
> 3. 实时索引代码库，结果始终最新
> 4. 支持跨编程语言检索
> 5. 仅反映磁盘当前状态，无版本控制信息

## 设计理念

1. **AI Flow 范式**：支持独立和协作两种工作模式
2. **最少化工具调用**：优先使用高效策略解决问题
3. **TodoWrite 任务管理**：复杂任务使用任务列表跟踪进度
4. **引用格式**：使用 `<mcfile>`, `<mcsymbol>`, `<mcurl>` 等 XML 标签

## 代码编辑格式

```cpp:absolute%2Fpath%2Fto%2Ffile
// ... existing code ...
{{ edit_1 }}
// ... existing code ...
{{ edit_2 }}
// ... existing code ...
```

## 与 Claude Code 对比

| 维度 | Trae AI | Claude Code |
|------|---------|-------------|
| 范式 | AI Flow（独立+协作） | 原生代理 |
| 上下文引擎 | 专有 search_codebase | 语义检索 |
| 任务管理 | TodoWrite | TodoWrite |
| 引用格式 | XML 标签 | Wiki 链接 |
| 编辑工具 | update_file（多块） | Edit（单块） |

## 相关资源

- [[augment-code-gpt5]] — Augment Code GPT-5 版本
- [[agent-command-skill-comparison]] — 扩展机制对比
