---
name: tools/augment-code-gpt5
description: Augment Code GPT-5 版本系统提示词和工具集
type: source
tags: [augment-code, gpt-5, agent, tools, system-prompt]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/Augment Code/gpt-5-agent-prompts.txt
---

# Augment Code GPT-5 版本

## 概述

Augment Agent 是由 Augment Code 开发的 AI 编程助手，基于 GPT 5 模型，拥有 Augment 世界领先上下文引擎的代码库访问能力。

## 核心能力

### 工具集

| 工具 | 功能 |
|------|------|
| `view` | 查看文件/目录，支持正则搜索和行范围 |
| `grep-search` | 跨文件搜索文本或符号 |
| `codebase-retrieval` | 高层次代码库检索 |
| `git-commit-retrieval` | 查找历史变更原因 |
| `str-replace-editor` | 编辑现有文件 |
| `save-file` | 创建新文件 |
| `remove-files` | 删除文件 |
| `launch-process` | 运行 shell 命令 |
| `read-process` | 读取进程输出 |
| `write-process` | 向进程 stdin 写入 |
| `kill-process` | 终止进程 |
| `list-processes` | 列出终端进程 |
| `diagnostics` | 返回 IDE 问题 |
| `open-browser` | 打开 URL |
| `web-search` | 网页搜索 |
| `web-fetch` | 获取网页内容 |
| `view-range-untruncated` | 查看截断内容 |
| `search-untruncated` | 搜索截断内容 |
| `remember` | 存储长期记忆 |
| `render-mermaid` | 渲染 Mermaid 图表 |
| `view_tasklist` | 查看任务列表 |
| `add_tasks` | 添加任务 |
| `update_tasks` | 更新任务状态 |
| `reorganize_tasklist` | 重组任务列表 |

### 任务管理

**Tasklist 触发条件：**
- 多文件或跨层修改
- 超过 2 次编辑/验证循环
- 超过 5 次信息收集迭代
- 用户请求规划/进度/下一步

**任务状态：**
- `[ ]` = 未开始
- `[/]` = 进行中
- `[-]` = 已取消
- `[x]` = 已完成

## 设计特点

1. **Tasklist First**：满足触发条件时优先使用任务列表
2. **保守编辑**：编辑前先收集所有必要信息
3. **包管理器优先**：使用 npm/pip/cargo 等而非手动编辑配置文件
4. **代码片段格式**：使用 `<augment_code_snippet>` XML 标签展示代码

## 代码展示格式

```xml
<augment_code_snippet path="foo/bar.py" mode="EXCERPT">
```python
class Example:
    pass
```
</augment_code_snippet>
```

## 与 Claude Code 对比

| 维度 | Augment Code GPT-5 | Claude Code |
|------|-------------------|-------------|
| 基础模型 | GPT 5 | Claude |
| 上下文引擎 | Augment 专有 | Claude 原生 |
| 任务管理 | 显式 Tasklist | TodoWrite |
| 代码格式 | XML snippet | Markdown |

## 相关资源

- [[augment-code-sonnet4]] — Claude Sonnet 4 版本
- [[agent-command-skill-comparison]] — 扩展机制对比
