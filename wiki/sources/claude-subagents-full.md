---
name: sources/claude-subagents-full
description: Claude Code 官方 Subagents 完整文档 - 创建自定义 AI 代理
type: source
tags: [claude, subagents, documentation, official, agent]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/创建自定义 subagents.md
---

Subagents 是处理特定类型任务的专门 AI 助手。当一个辅助任务会用搜索结果、日志或文件内容充斥您的主对话，而您不会再次引用这些内容时，请使用一个 subagent：该 subagent 在自己的上下文中完成这项工作，仅返回摘要。

有关完整的参考文档，请访问：https://code.claude.com/docs/zh-CN/sub-agents

## 核心概念

### Subagent 的优势

- **保留上下文**：通过将探索和实现保持在主对话之外
- **强制执行约束**：通过限制 subagent 可以使用的工具
- **跨项目重用配置**：使用用户级 subagents
- **专门化行为**：为特定领域使用专注的系统提示
- **控制成本**：通过将任务路由到更快、更便宜的模型（如 Haiku）

### 内置 Subagents

| Agent | Model | Tools | Purpose |
| --- | --- | --- | --- |
| Explore | Haiku | 只读 | 文件发现、代码搜索、代码库探索 |
| Plan | Sonnet | 所有 | 规划和架构设计 |
| General-purpose | 继承 | 继承 | 通用任务处理 |

## Subagent 配置

### Frontmatter 字段

```markdown
---
name: code-reviewer
description: Reviews code for quality and best practices
tools: Read, Glob, Grep, Bash
model: sonnet
permissionMode: default
maxTurns: 50
skills: [api-conventions, error-handling]
memory: project
background: false
---
```

### 关键字段说明

| Field | Required | Description |
| --- | --- | --- |
| `name` | Yes | 唯一标识符（小写字母和连字符） |
| `description` | Yes | Claude 何时应该委托给此 subagent |
| `tools` | No | 允许的工具列表 |
| `disallowedTools` | No | 要拒绝的工具 |
| `model` | No | `sonnet`、`opus`、`haiku` 或完整模型 ID |
| `permissionMode` | No | 权限模式 |
| `skills` | No | 启动时加载的技能 |
| `memory` | No | 持久内存范围：`user`、`project`、`local` |
| `background` | No | 是否始终在后台运行 |

## 作用域优先级

| Location | Scope | Priority |
| --- | --- | --- |
| 托管设置 | 组织范围 | 1（最高） |
| `--agents` CLI 标志 | 当前会话 | 2 |
| `.claude/agents/` | 当前项目 | 3 |
| `~/.claude/agents/` | 所有项目 | 4 |
| Plugin agents | 启用 plugin 的位置 | 5（最低） |

## 使用 Subagents

### 调用方式

1. **自然语言**：命名 subagent，Claude 决定是否委托
2. **@-mention**：保证 subagent 为一个任务运行
3. **会话范围**：整个会话使用该 subagent 的配置

```text
Use the test-runner subagent to fix failing tests
@"code-reviewer (agent)" look at the auth changes
```

### 前台 vs 后台运行

- **前台 subagents**：阻塞主对话直到完成
- **后台 subagents**：并发运行，自动拒绝未预先批准的内容

## 完整文档

本页面是完整官方文档的摘要版本。完整内容请参阅：
- [[claude-subagents-full|claude-subagents-full]] - 完整 Subagents 官方文档
- 原始文件：[[../../archive/cc-doc/创建自定义 subagents.md]]
