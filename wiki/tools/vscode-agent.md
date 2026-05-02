---
name: tools/vscode-agent
description: VSCode Agent 编程助手系统提示词、工具集和多模型变体
type: source
tags: [vscode, copilot, agent, tools, system-prompt, github, multi-model]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/VSCode Agent/
---

# VSCode Agent 编程助手

## 概述

VSCode Agent 是嵌入在 VS Code 编辑器中的 GitHub Copilot 代理系统，通过自然语言交互帮助开发者完成编程任务。它具备多模型支持（Claude Sonnet 4、GPT-4o、GPT-5、Gemini 2.5 Pro 等），提供代码编辑、搜索、执行终端命令等能力。VSCode Agent 的核心理念是将 AI 能力与 IDE 深度集成，让开发者在熟悉的编辑环境中获得智能辅助。

## 核心定位

| 维度 | 说明 |
|------|------|
| **开发者** | Microsoft / GitHub |
| **产品** | GitHub Copilot in VS Code |
| **运行环境** | VS Code 编辑器 |
| **调用格式** | JSON function calling |
| **核心能力** | 代码编辑、搜索、终端命令、项目创建 |

## 身份规范

VSCode Agent 必须遵守以下身份规则：

| 规则 | 说明 |
|------|------|
| **名称响应** | 当被问及姓名时，必须回答「GitHub Copilot」 |
| **内容策略** | 遵守 Microsoft 内容政策 |
| **版权规避** | 避免生成侵犯版权的内容 |
| **拒绝有害内容** | 有害、仇恨、种族歧视、性别歧视、淫秽、暴力内容 → 「Sorry, I can't assist with that.」 |
| **响应风格** | 简短、非人格化 |

## 核心指令

### 基础指令

| 指令 | 说明 |
|------|------|
| 遵循要求 | 严格按照用户要求执行，不偏离 |
| 收集上下文 | 先收集上下文，再执行任务 |
| 使用工具 | 优先使用工具而非询问用户手动操作 |
| 持续执行 | 持续调用工具直到任务完成，不要放弃 |
| 避免重复 | 调用工具后继续执行，不重复已完成的工作 |

### 编辑规范

| 规范 | 说明 |
|------|------|
| 使用工具 | 使用 `insert_edit_into_file` 工具编辑文件，不要打印代码块 |
| 最小提示 | 提供最小提示，让工具智能推断变更 |
| 不显示变更 | 不要向用户展示变更内容，工具会自动应用并显示 |
| 验证错误 | 编辑后必须调用 `get_errors` 验证变更 |

### 终端规范

| 规范 | 说明 |
|------|------|
| 替代命令执行 | 使用 `run_in_terminal` 工具而非打印命令让用户执行 |
| 背景进程 | 长时间运行的命令使用 `isBackground=true` 参数 |
| 顺序执行 | 不并行调用终端命令，等待输出后再执行下一个 |
| 绝对路径 | 工具参数使用绝对路径 |

## 工具集详解

VSCode Agent 提供 17+ 个工具，采用 JSON schema 格式定义。

### 搜索类工具

| 工具 | 说明 | 参数 |
|------|------|------|
| `semantic_search` | 语义搜索代码和文档 | query（必需） |
| `grep_search` | 文本搜索 | includePattern, isRegexp, query |
| `file_search` | 文件名 glob 搜索 | query（最多 20 结果） |
| `list_code_usages` | 查找符号引用 | filePaths（可选）, symbolName |

### 文件操作类工具

| 工具 | 说明 | 参数 |
|------|------|------|
| `read_file` | 读取文件内容 | filePath, startLineNumberBaseZero, endLineNumberBaseZero |
| `insert_edit_into_file` | 编辑文件 | explanation, filePath, code |
| `list_dir` | 列出目录内容 | path |

### 终端类工具

| 工具 | 说明 | 参数 |
|------|------|------|
| `run_in_terminal` | 执行 Shell 命令 | command, explanation, isBackground |
| `get_terminal_output` | 获取后台进程输出 | id |

### 项目类工具

| 工具 | 说明 | 参数 |
|------|------|------|
| `create_new_workspace` | 创建项目脚手架 | query |
| `get_project_setup_info` | 获取项目设置信息 | language, projectType |
| `install_extension` | 安装 VS Code 扩展 | id, name |
| `create_new_jupyter_notebook` | 创建 Jupyter 笔记本 | query |

### 其他工具

| 工具 | 说明 | 参数 |
|------|------|------|
| `get_errors` | 获取编译/lint 错误 | filePaths |
| `get_changed_files` | 获取 Git 变更 | repositoryPath, sourceControlState |
| `get_vscode_api` | 获取 VS Code API 文档 | query |
| `test_search` | 查找测试文件 | filePaths |
| `fetch_webpage` | 获取网页内容 | urls, query |

### 用户偏好工具

| 工具 | 说明 | 参数 |
|------|------|------|
| `update_user_preferences` | 保存用户偏好 | 用户的修正和偏好 |

## 多模型变体

VSCode Agent 针对不同 AI 模型有专门的提示词优化。

### Claude Sonnet 4 — Tab 补全模式

专门用于代码补全，使用特殊的 `<|code_to_edit|>` 标签：

```xml
<|code_to_edit|>
{开发者正在编辑的代码区域}
<|/code_to_edit|>
```

**工作流程**：
1. 审查上下文（最近查看的代码、编辑历史、光标位置）
2. 评估当前代码是否需要修正或增强
3. 预测并完成开发者接下来要做的更改
4. 保持代码风格一致性

**输出格式**：
- 仅返回 `<|code_to_edit|>` 标签内的修订代码
- 不包含行号标记 `#|`
- 不输出标签本身

### GPT-5 — Proactive Agent 模式

最具主动性的变体，强调端到端完成任务：

| 特性 | 说明 |
|------|------|
| **持续执行** | 不停止直到任务完成或真正被阻塞 |
| **主动行动** | 不要不必要的提问，直接行动 |
| **要求覆盖** | 提取每个需求为清单项，确保不遗漏 |
| **质量门控** | 构建/Lint/类型检查/单元测试 |
| **提前交付** | 满足明确要求后实施小的相邻改进 |

### GPT-4o — 标准模式

标准的代理行为，平衡主动性和用户控制：

- 简短前置语说明要做什么
- 每 3-5 个工具调用后检查进度
- 保持对话风格友好、自信

### Gemini 2.5 Pro — 轻量模式

精简的指令集，适合快速任务：

- 省略详细的工程思维提示
- 简化质量门控要求
- 保持核心编辑能力

## 响应风格指南

### GPT-5 风格（最完整）

| 维度 | 指南 |
|------|------|
| **开场白** | 简短友好的任务确认 + 一句话说明计划 |
| **进度更新** | 工具批次间提供简洁进度 |
| **避免重复** | 不重复未变更的计划或章节 |
| **清单** | 多步骤任务保持轻量清单 |
| **沟通风格** | 友好、自信、会话式，短句优先 |

### 标准风格

| 维度 | 指南 |
|------|------|
| **代码引用** | 文件名和符号用反引号包裹 |
| **文件路径** | 使用反引号包裹工作区中的路径 |
| **输出格式** | 使用标准 Markdown 格式 |

### 禁止事项

| 禁止 | 正确做法 |
|------|----------|
| 打印代码块变更 | 使用 insert_edit_into_file 工具 |
| 打印终端命令 | 使用 run_in_terminal 工具 |
| 重复自己 | 继续执行，不重复 |
| 放弃 | 持续调用工具直到完成 |

## 与其他工具对比

| 维度 | VSCode Agent | Claude Code | Notion AI | Kiro |
|------|--------------|-------------|-----------|------|
| 运行环境 | VS Code | 命令行 | Notion | 命令行 |
| 工具数量 | 17+ | 多模式 | 8 | 6+ |
| 多模型 | ✅ 5+ 模型 | ❌ | ❌ | ❌ |
| Tab 补全 | ✅ Claude 专用 | ❌ | ❌ | ❌ |
| 项目创建 | ✅ 完整脚手架 | ❌ | ❌ | ❌ |
| Jupyter 支持 | ✅ | ❌ | ❌ | ❌ |
| 身份响应 | GitHub Copilot | 无 | 无 | 无 |

## 相关资源

- [[kiro]] — Kiro AI 编程助手
- [[notion-ai]] — Notion AI 编程助手
- [[devin-ai]] — Devin AI 软件工程师
- [[manus-ai]] — Manus AI 智能代理
- [[windsurf-ai]] — Windsurf Cascade
- [[trae-ai]] — Trae AI
- [[agent-command-skill-comparison]] — 扩展机制对比