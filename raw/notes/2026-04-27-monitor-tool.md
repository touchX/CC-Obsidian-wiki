---
name: notes/2026-04-27-monitor-tool
description: Claude Code Monitor 工具详解 — 后台监控与状态变化响应
type: insight
tags: [session, tools, monitor, background]
created: 2026-04-27
source: conversation
---

# Claude Code Monitor 工具详解

## 工具概述

Monitor 让 Claude 在后台持续监视指定目标，发生变化时主动通知。

## 核心功能

- 跟踪日志文件并在错误出现时标记
- 轮询 PR 或 CI 作业并在其状态更改时报告
- 监视目录以查找文件更改
- 跟踪长时间运行脚本的输出

## 四大监控场景

| 场景 | 监控内容 | 响应动作 |
|------|---------|---------|
| 日志跟踪 | 日志文件 | 检测到错误时标记 |
| CI/CD 轮询 | PR/CI 作业状态 | 状态变化时报告 |
| 文件系统 | 目录文件变更 | 文件增删改时通知 |
| 进程输出 | 长时间运行脚本 | 实时输出跟踪 |

## 启用方式

直接在对话中请求监控：
```text
"Monitor the test output file and tell me when tests fail"
"Monitor the CI pipeline and notify me when it completes"
```

## 授权配置

### 项目级别 (.claude.json)

```json
{
  "allowedTools": ["Monitor"]
}
```

### 语法说明

| 语法 | 含义 |
|------|------|
| `Monitor` | 需首次确认 |
| `Monitor(*)` | 自动授权 |

## 配置级别

| 级别 | 位置 | 作用域 |
|------|------|--------|
| User | ~/.claude.json | 全局 |
| Project | .claude.json | 当前项目 |
| Subagent | frontmatter | 特定 agent |

## 与 Bash 后台运行的区别

| 维度 | Bash 后台 | Monitor |
|------|----------|--------|
| 通知机制 | 完成时通知 | 状态变化时主动通知 |
| 持续性 | 任务结束即停止 | 可持续监控 |

## 相关 Wiki 页面
- [[wiki/entities/claude-tools]] — 工具完整参考
- [[raw/notes/2026-04-27-claude-code-built-in-capabilities]] — 45+ 内置工具