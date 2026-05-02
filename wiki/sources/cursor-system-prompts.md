---
name: cursor-system-prompts
description: Cursor IDE AI 助手完整系统提示词集合 — 从 v1.0 到 2.0 的演进历史，涵盖 Chat Prompt、Agent Prompt 多版本及工具定义
type: source
tags: [cursor, ide, ai-assistant, system-prompts, gpt-4, gpt-5, claude, prompt-engineering, coding-assistant, agent-tools]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/sources/system-prompts/Cursor Prompts/
github_url: https://github.com/x1xhlol/system-prompts-and-models-of-ai-tools
language: Text
license: GNU GPL v3
---

# Cursor 系统提示词大全

> **Cursor IDE AI 助手完整系统提示词集合** — 从 v1.0 到 2.0 的演进历史，涵盖 Chat Prompt、Agent Prompt 多版本及工具定义

## 基本信息

| 项目 | 信息 |
|------|------|
| **工具** | Cursor IDE |
| **类型** | AI 编程助手 |
| **提示词数量** | 7 个文件（5 个 Agent 版本 + 1 个 Chat + 1 个 Tools 定义）|
| **总行数** | 2,303 行 |
| **模型演进** | Claude Sonnet 4 → GPT-4.1 → GPT-4o → GPT-5 |

## 核心价值

### 📝 版本演进史

Cursor 系统提示词记录了 AI 编程助手的快速演进：

| 版本 | 模型 | 特点 | 行数 |
|------|------|------|------|
| **v1.0** | Claude Sonnet 4 | 早期版本，`<user_query>` 标签 | 83 |
| **v1.2** | GPT-4.1 | 更新知识库（2024-06）| 568 |
| **Chat** | GPT-4o | 聊天模式，简化版 | 119 |
| **2025-08-07 CLI** | GPT-5 | CLI 工具版本 | 206 |
| **2025-09-03** | GPT-5 | 强调自主性 | 229 |
| **2.0** | 未知（支持图片） | OpenAI Chat 格式，详细工具定义 | 772 |

### 🔑 关键演进

1. **交互模式**:
   - v1.0: `<user_query>` 标签
   - v1.2+: 自然对话
   - 2.0: OpenAI Chat 格式 `<|im_start|>`

2. **自主性增强**:
   - v1.0-v1.2: 响应式
   - 2025-09-03: "keep going until query resolved"
   - 2.0: 详细的搜索和工具使用策略

3. **工具定义**:
   - v1.0: 内嵌在提示词中
   - 2.0: 独立的 `Agent Tools v1.0.json`

## 提示词分类

### 1. Chat Prompt（GPT-4o）

**文件**: `Chat Prompt.txt` (119 行)

**核心特点**:
- GPT-4o 驱动
- 轻量级聊天助手
- 简化的工具调用规则（6 条）
- 代码更改策略（简化代码块 + apply model）

**适用场景**: 日常编码问答、简单任务

### 2. Agent Prompt 系列

#### v1.0 (Claude Sonnet 4)

**文件**: `Agent Prompt v1.0.txt` (83 行)

**核心特点**:
- 使用 Claude Sonnet 4
- `<user_query>` 标签
- 基础工具定义

#### v1.2 (GPT-4.1)

**文件**: `Agent Prompt v1.2.txt` (568 行)

**核心特点**:
- 升级到 GPT-4.1
- Knowledge cutoff: 2024-06
- 更详细的工具使用说明
- 增强的代码更改策略

#### 2025-08-07 CLI 版本 (GPT-5)

**文件**: `Agent CLI Prompt 2025-08-07.txt` (206 行)

**核心特点**:
- GPT-5 驱动
- CLI 工具专用
- 交互式命令行界面
- 软件工程任务优化

#### 2025-09-03 (GPT-5)

**文件**: `Agent Prompt 2025-09-03.txt` (229 行)

**核心特点**:
- GPT-5 驱动
- **强调自主性**: "please keep going until the user's query is completely resolved"
- 自动解决问题后再回报
- 减少用户交互

#### 2.0 (OpenAI Chat 格式)

**文件**: `Agent Prompt 2.0.txt` (772 行)

**核心特点**:
- 使用 OpenAI Chat 格式 (`<|im_start|>system`)
- Knowledge cutoff: 2024-06
- **Image input capabilities: Enabled**
- 最详细的工具定义（codebase_search 等）
- 大量示例（good/bad 对比）
- 搜索策略和目标目录说明

### 3. Agent Tools v1.0.json

**文件**: `Agent Tools v1.0.json` (326 行)

**核心内容**:
- 独立的工具定义文件
- JSON 格式
- 可用于 API 集成
- 包含所有可用工具的 schema

## 工具定义演进

### v1.0 内嵌式

工具定义直接写在系统提示词中：

```
You have tools at your disposal to solve the coding task.
Follow these rules regarding tool calls:
1. ALWAYS follow the tool call schema exactly...
```

### 2.0 独立式

工具定义分离到独立的 JSON 文件，系统提示词引用：

```
namespace functions {
  // `codebase_search`: semantic search that finds code by meaning...
  // ... 详细工具说明
}
```

## 使用指南

### 选择合适的提示词版本

| 需求 | 推荐版本 |
|------|----------|
| 日常问答 | Chat Prompt (GPT-4o) |
| 复杂任务 | Agent Prompt 2.0 |
| CLI 工具 | Agent CLI Prompt 2025-08-07 |
| 高自主性 | Agent Prompt 2025-09-03 |
| 研究演进 | 对比所有版本 |

### 自定义提示词

基于这些官方提示词，可以：
1. **添加项目规则**: 在提示词末尾添加项目特定的指导
2. **调整工具权限**: 修改工具定义 JSON
3. **自定义行为**: 覆盖默认的通信风格或代码风格

## 技术架构

### 格式对比

| 格式 | 版本 | 特点 |
|------|------|------|
| 自然语言 | v1.0, v1.2, Chat | 直接文本说明 |
| OpenAI Chat | 2.0 | `<|im_start|>system` |
| 混合 | 2025-08-07, 2025-09-03 | 自然语言 + 特殊标签 |

### 模型支持

| 模型 | 版本 | 用途 |
|------|------|------|
| **Claude Sonnet 4** | v1.0 | 早期 Cursor 集成 |
| **GPT-4.1** | v1.2 | OpenAI 模型 |
| **GPT-4o** | Chat | 多模态（支持图片） |
| **GPT-5** | 2025-08-07, 2025-09-03 | 最新模型 |

## 相关资源

| 链接 | 说明 |
|------|------|
| [Cursor 官网](https://cursor.sh) | Cursor IDE |
| [AI 工具系统提示词大全](../sources/ai-tools-system-prompts.md) | 50+ AI 工具提示词集合 |

## 标签

#cursor #ide #ai-assistant #system-prompts #gpt-4 #gpt-5 #claude #prompt-engineering #coding-assistant #agent-tools

---

*收集时间：2026-04-29*
