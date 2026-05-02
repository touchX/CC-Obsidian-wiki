---
name: gastownhall-beads
description: Beads - 你的 AI 编程 Agent 的记忆升级系统
type: source
tags: [github, go, agents, claude-code, issue-tracker]
created: 2026-05-02
updated: 2026-05-02
source: ../../../archive/resources/github/gastownhall-beads-2026-05-02.json
stars: 22958
forks: 1505
language: Go
license: MIT
github_url: https://github.com/gastownhall/beads
---

# Beads — AI 编程 Agent 的记忆系统

> [!info] 项目信息
> - **星标数**: 22,958
> - ** Fork 数**: 1,505
> - **语言**: Go
> - **许可证**: MIT
> - **主题标签**: `agents` `claude-code` `coding`

## 是什么

Beads 是一个**分布式图结构 Issue 追踪器**，为 AI Agent 设计。它基于 Dolt（版本控制 SQL 数据库）构建，提供了传统 Issue 追踪器无法实现的强大能力。

**核心定位**：让 AI Agent 在处理复杂多文件任务时，能够可靠地跟踪和管理跨文件的依赖关系与上下文。

## 核心特性

| 特性 | 说明 |
|------|------|
| **Dolt 驱动** | 内置版本控制 SQL 数据库，天然支持分支、合并、cell-level 冲突解决 |
| **Agent 优化** | 输出格式专为 AI 设计（JSON），Agent 可直接理解结构化数据 |
| **零冲突** | 基于哈希的 ID（bd-a1b2 格式），分布式环境无 ID 冲突 |
| **语义压缩** | 自动识别并合并相关 Issue，减少重复信息 |
| **消息系统** | 支持带线程的讨论，可用于跨 Agent 通信 |
| **图连接** | 支持 `relates_to`、`duplicates`、`supersedes`、`replies_to` 等关系类型 |

## 工作层级

```
Session（会话层）
├── Project（项目层）
│   ├── File Graph（文件图）
│   ├── Issue Graph（Issue 图）
│   └── Message Graph（消息图）
└── Storage（存储层，支持多后端）
```

## 使用场景

**传统 Issue 追踪器的局限**：
- Figma、Linear、GitHub Issues 都是为人设计的，AI 无法可靠理解任务依赖
- 多 Agent 协作时，无法追踪跨会话的上下文

**Beads 的优势**：
- 结构化 JSON 输出，AI 可直接解析
- 图结构天然支持复杂依赖关系
- Dolt 版本控制提供完整审计追踪

## 安装与使用

```bash
# 安装 beads CLI
brew install gastownhall/tap/beads

# 初始化项目
beads init

# 创建 Issue
beads issue create "实现用户认证" --priority high

# 查看图结构
beads graph show
```

## 存储后端

Beads 支持多种存储后端：

| 后端 | 适用场景 |
|------|----------|
| **Dolt** | 生产环境，需要版本控制和分支协作 |
| **SQLite** | 单机使用，轻量级 |
| **内存** | 临时测试，演示 |

> [!links]+ 相关链接
> - [GitHub 仓库](https://github.com/gastownhall/beads)
> - [官方文档](https://gastownhall.github.io/beads)
> - [Dolt 官网](https://www.dolthub.com/)
