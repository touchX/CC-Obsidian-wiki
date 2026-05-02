---
name: tools/augment-code-sonnet4
description: Augment Code Claude Sonnet 4 版本系统提示词和工具集
type: source
tags: [augment-code, claude-sonnet-4, agent, tools, system-prompt]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/Augment Code/claude-4-sonnet-agent-prompts.txt
---

# Augment Code Claude Sonnet 4 版本

## 概述

Augment Agent 是由 Augment Code 开发的 AI 编程助手，基于 Claude Sonnet 4 模型，拥有 Augment 世界领先上下文引擎的代码库访问能力。

## 核心能力

### 工具集

| 工具 | 功能 |
|------|------|
| `view` | 查看文件/目录，支持行范围 |
| `grep-search` | 跨文件搜索文本或符号 |
| `codebase-retrieval` | 高层次代码库检索 |
| `git-commit-retrieval` | 查找历史变更原因 |
| `str_replace_editor` | 编辑现有文件 |
| `save-file` | 创建新文件 |
| `remove-files` | 删除文件 |
| `launch-process` | 运行 shell 命令 |
| `diagnostics` | 返回 IDE 问题 |
| `read-terminal` | 读取终端输出 |
| `open-browser` | 打开 URL |
| `web-search` | 网页搜索 |
| `web-fetch` | 获取网页内容 |
| `remember` | 存储长期记忆 |
| `render-mermaid` | 渲染 Mermaid 图表 |
| `view_tasklist` | 查看任务列表 |
| `add_tasks` | 添加任务 |
| `update_tasks` | 更新任务状态 |
| `reorganize_tasklist` | 重组任务列表 |

### 任务管理

**Tasklist 触发条件：**
- 用户明确请求规划、任务分解或项目组织
- 复杂多步骤任务需要结构化规划
- 需要跟踪进度或查看下一步
- 需要协调多个相关变更

**任务状态：**
- `[ ]` = 未开始
- `[/]` = 进行中
- `[-]` = 已取消
- `[x]` = 已完成

## 设计特点

1. **任务管理友好**：复杂任务自动建议使用任务管理工具
2. **信息收集优先**：执行任务前先充分了解任务和代码库
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

## 与 GPT-5 版本对比

| 维度 | Claude Sonnet 4 | GPT-5 |
|------|-----------------|-------|
| 基础模型 | Claude Sonnet 4 | GPT 5 |
| 工具数量 | 19 个 | 22 个 |
| 进程管理 | 基础 | 完整（read/write/kill/list） |
| 截断内容 | 无 | 有（untruncated 工具） |

## 相关资源

- [[augment-code-gpt5]] — GPT-5 版本
- [[agent-command-skill-comparison]] — 扩展机制对比
