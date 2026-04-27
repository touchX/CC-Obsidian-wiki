---
name: claude-code
description: Anthropic Claude Code CLI 工具完整指南
type: entity
tags: [tool, cli, anthropic]
created: 2026-04-23
updated: 2026-04-23
sources: 3
---

# Claude Code

Anthropic 官方 CLI 工具，将 Claude 作为结对编程伙伴集成到本地开发环境。

## 核心功能

| 功能 | 命令 | 描述 |
|------|------|------|
| 交互式编程 | `claude` | 启动对话式编程会话 |
| 文件编辑 | 编辑/创建/读取 | 完整的文件操作能力 |
| 终端执行 | Bash 工具 | 执行命令和脚本 |
| Git 操作 | 内置 Git 工具 | 提交、分支、推送 |

## 工作流命令

| 命令 | 功能 |
|------|------|
| `/help` | 查看所有命令 |
| `/compact` | 压缩上下文 |
| `/clear` | 清空上下文 |
| `/plan` | 进入计划模式 |
| `/review` | 请求代码审查 |

## 配置系统

### CLAUDE.md
项目级指令文件，在目录根目录定义：
- 核心编码规范
- 技术栈约定
- 特定项目规则

### .claude.json
```json
{
  "disabledPlugins": [],
  "contextStrategy": "auto",
  "maxInputTokens": 4000
}
```

## 代理循环 (Agent Loop)

Claude Code 核心架构基于**代理循环**，当您给 Claude 一个任务时，它经历三个阶段：

### 三个阶段

| 阶段 | 描述 | 示例 |
|------|------|------|
| **收集上下文** | 搜索文件、读取代码、理解项目结构 | 搜索相关文件、读取配置 |
| **采取行动** | 使用工具执行任务 | 编辑文件、运行命令、创建文件 |
| **验证结果** | 检查工作是否完成 | 运行测试、比较输出 |

### 循环特性

- **自适应**：简单问题可能只经历收集阶段；复杂任务会循环多次
- **链式操作**：可将数十个操作链接在一起并沿途纠正
- **用户可中断**：可随时引导 Claude 朝不同方向发展

### 驱动组件

| 组件 | 作用 |
|------|------|
| **模型** | 进行推理，理解代码并决定行动 |
| **工具** | 采取行动，与项目/终端/外部服务交互 |

### 内置工具类别

| 类别 | 能力 |
|------|------|
| **文件操作** | 读取、编辑、创建、重命名文件 |
| **搜索** | 模式搜索、正则表达式、代码库探索 |
| **执行** | Shell 命令、构建工具、Git 操作 |
| **网络** | 搜索文档、获取资源、查找错误信息 |
| **代码智能** | 类型检查、定义跳转、引用查找 |

## Claude 可访问的资源

当您在目录中运行 `claude` 时，Claude Code 可以访问：

- **您的项目**：目录和子目录中的文件
- **您的终端**：任何可从命令行运行的命令
- **您的 git 状态**：当前分支、未提交的更改、提交历史
- **CLAUDE.md**：项目特定说明和约定
- **自动内存**：Claude 自动学习的内容（MEMORY.md 前200行或25KB）
- **配置的扩展**：MCP servers、skills、subagents

## 会话管理

| 功能 | 命令 | 说明 |
|------|------|------|
| 恢复会话 | `claude --continue` | 从中断处继续 |
| 分叉会话 | `claude --continue --fork-session` | 创建新分支保留历史 |
| 并行会话 | Git worktrees | 为各分支创建独立目录 |

## 相关概念

- [[concepts/context-window]] — 上下文限制与管理
- [[concepts/context-management]] — 上下文管理策略
- [[wiki/entities/claude-skills]] — Skills 扩展系统
- [[wiki/entities/claude-subagents]] — 子代理系统
- [[wiki/entities/claude-mcp]] — MCP 服务器集成
- [[wiki/entities/claude-hooks]] — Hooks 系统

## 来源

- [Claude Code 如何工作](https://code.claude.com/docs/zh-CN/how-claude-code-works) — 官方文档
