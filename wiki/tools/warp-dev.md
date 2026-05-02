---
name: tools/warp-dev
description: Warp 终端 AI 代理系统提示词、工具集和问题分类器
type: source
tags: [warp, agent, tools, system-prompt, terminal, ai-mode, command, workflow]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/Warp.dev/Prompt.txt
---

# Warp 终端 AI 代理

## 概述

Warp 是一个现代化的终端工具，其 Agent Mode 利用 AI 能力帮助用户更高效地完成命令行任务。Warp Agent 直接在终端环境中工作，专注于命令执行、代码搜索和文件操作。Warp 的核心理念是将 AI 能力与命令行工作流深度融合，让开发者能够在终端中完成复杂任务。

## 核心定位

| 维度 | 说明 |
|------|------|
| **运行环境** | Warp 终端（AI Mode） |
| **访问方式** | Cmd+K → AI Mode |
| **调用格式** | JSON function calling |
| **核心能力** | 命令执行、文件操作、代码搜索 |

## 身份规范

Warp Agent 没有固定身份名称，以任务完成为导向：

> 你是一个 AI 编程助手，帮助用户在 Warp 终端中完成任务。

## 问题分类器

Warp Agent 内置智能分类器，将用户输入分为两类：

### Question（问题）

**定义**：用户需要指导、解释或信息的任务。

**触发词**：
- 疑问词：「如何」「为什么」「什么」
- 解释性：「告诉我」「解释一下」
- 学习性：「教我」「学一下」

**输出格式**：
```json
{
  "type": "question",
  "response": "详细的解释和指导..."
}
```

**Question 示例**：

| 用户输入 | 分类 | 响应类型 |
|----------|------|----------|
| 「git rebase 是什么？」 | Question | 概念解释 |
| 「如何撤销上次的 commit？」 | Question | 操作步骤 |
| 「解释一下 SSH 密钥」 | Question | 原理说明 |

### Task（任务）

**定义**：用户需要实际执行的行动。

**触发词**：
- 动作词：「创建」「删除」「运行」「修改」
- 目标导向：「把...」「帮我...」
- 命令请求：完整或部分的 Shell 命令

**输出格式**：
```json
{
  "type": "task",
  "tools": ["run_command", "read_files"],
  "commands": ["git status"]
}
```

**Task 示例**：

| 用户输入 | 分类 | 执行动作 |
|----------|------|----------|
| 「创建一个 React 项目」 | Task | 执行 create-react-app |
| 「帮我查看当前目录」 | Task | 执行 ls/pwd |
| 「部署到生产环境」 | Task | 执行部署脚本 |

## 工具集详解

Warp Agent 提供 5 个核心工具。

### 1. run_command

在终端中执行 Shell 命令。

```json
{
  "command": "git status",
  "workingDirectory": "/home/user/project",
  "timeout": 30000
}
```

**参数**：
| 参数 | 说明 | 默认值 |
|------|------|--------|
| `command` | 要执行的命令 | 必需 |
| `workingDirectory` | 工作目录 | 当前目录 |
| `timeout` | 超时时间（毫秒） | 30000 |
| `environment` | 环境变量 | inherit |

**示例**：

```json
// 查看文件列表
{ "command": "ls -la" }

// 搜索文件
{ "command": "find . -name '*.ts'" }

// 执行 npm 脚本
{ "command": "npm run build", "timeout": 120000 }
```

### 2. read_files

读取一个或多个文件内容。

```json
{
  "paths": [
    "/home/user/project/src/main.ts",
    "/home/user/project/package.json"
  ],
  "showLineNumbers": true
}
```

**参数**：
| 参数 | 说明 | 默认值 |
|------|------|--------|
| `paths` | 文件路径数组 | 必需 |
| `showLineNumbers` | 显示行号 | false |

**用途**：
- 查看代码文件
- 检查配置文件
- 读取日志

### 3. grep

在项目中搜索文本。

```json
{
  "query": "TODO",
  "paths": ["/home/user/project/src"],
  "filePattern": "*.ts",
  "caseSensitive": false
}
```

**参数**：
| 参数 | 说明 | 默认值 |
|------|------|--------|
| `query` | 搜索关键词 | 必需 |
| `paths` | 搜索路径 | 当前目录 |
| `filePattern` | 文件模式 | * |
| `caseSensitive` | 区分大小写 | false |
| `useRegex` | 使用正则 | false |

### 4. file_glob

根据模式查找文件。

```json
{
  "pattern": "**/*.test.ts",
  "workingDirectory": "/home/user/project"
}
```

**参数**：
| 参数 | 说明 | 默认值 |
|------|------|--------|
| `pattern` | glob 模式 | 必需 |
| `workingDirectory` | 搜索目录 | 当前目录 |
| `ignore` | 忽略模式 | node_modules |

**常用模式**：
```
*.js          // 所有 JS 文件
**/*.ts       // 所有 TypeScript 文件
src/**/*.jsx  // src 下所有 JSX 文件
!test/**      // 排除 test 目录
```

### 5. edit_files

编辑文件内容。

```json
{
  "filePath": "/home/user/project/src/main.ts",
  "oldString": "const VERSION = '1.0'",
  "newString": "const VERSION = '2.0'"
}
```

**参数**：
| 参数 | 说明 | 默认值 |
|------|------|--------|
| `filePath` | 文件路径 | 必需 |
| `oldString` | 原内容 | 必需 |
| `newString` | 新内容 | 必需 |

**规则**：
- `oldString` 必须唯一匹配
- 自动处理缩进

### 6. create_file

创建新文件。

```json
{
  "path": "/home/user/project/src/utils/helper.ts",
  "content": "export function helper() {\n  return 'hello'\n}"
}
```

**参数**：
| 参数 | 说明 | 默认值 |
|------|------|--------|
| `path` | 文件路径 | 必需 |
| `content` | 文件内容 | 必需 |
| `overwrite` | 覆盖已存在文件 | false |

## 环境限制

### 可访问的环境

| 功能 | 状态 |
|------|------|
| Shell 命令 | ✅ 完全支持 |
| 文件系统 | ✅ 完全支持 |
| Git 操作 | ✅ 支持 |
| Docker | ✅ 支持 |
| 包管理器 | ✅ 支持 |
| Web 浏览器 | ❌ 不可用 |

### 环境特性

**优点**：
- 完整 Shell 环境
- 所有系统命令可用
- 环境变量继承

**限制**：
- 无图形界面
- 无浏览器自动化
- 命令输出有限制

## 工作流示例

### 1. 问题解答

```
用户: 如何查看 Git 分支？

Agent:
{
  "type": "question",
  "response": "查看 Git 分支有以下几种方式:\n\n1. 本地分支: git branch\n2. 远程分支: git branch -r\n3. 所有分支: git branch -a\n4. 详细列表: git branch -vv"
}
```

### 2. 任务执行

```
用户: 创建一个新的 React 项目

Agent:
{
  "type": "task",
  "tools": ["run_command"],
  "commands": ["npx create-react-app my-app"]
}
```

### 3. 复杂任务

```
用户: 找出所有包含 'TODO' 注释的文件，并创建一个列表

Agent:
{
  "type": "task",
  "tools": ["grep", "file_glob"],
  "steps": [
    { "tool": "grep", "query": "TODO", "filePattern": "*.ts" },
    { "tool": "create_file", "path": "todo-list.md", "content": "# TODO Items\n..." }
  ]
}
```

## 最佳实践

### 1. 命令执行

- 使用完整路径避免歧义
- 设置合理的超时时间
- 检查命令退出码

### 2. 文件操作

- 先读取再编辑
- 使用唯一字符串匹配
- 备份重要文件

### 3. 搜索优化

- 指定具体路径减少范围
- 使用文件模式过滤
- 组合使用 grep 和 file_glob

## 与其他工具对比

| 维度 | Warp | Claude Code | Cursor | Same.dev |
|------|------|-------------|--------|----------|
| 运行环境 | 终端 | 命令行 | IDE | 云端 IDE |
| 主要功能 | 命令执行 | 通用编程 | 代码编辑 | 云端开发 |
| 图形界面 | ❌ | ❌ | ✅ | ✅ |
| Web 部署 | ❌ | ❌ | ❌ | ✅ |
| AI 模式 | 原生 | Agent Mode | AI Complete | 原生 |

## 相关资源

- [[claude-code]] — Claude Code 编程助手
- [[cursor]] — Cursor AI IDE
- [[same-dev]] — Same.dev 云端 IDE
- [[replit]] — Replit 在线 IDE
- [[agent-command-skill-comparison]] — 扩展机制对比
