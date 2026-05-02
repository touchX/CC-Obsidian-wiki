---
name: implementation/commands-implementation
description: Commands 命令系统实现详解 — Weather Orchestrator 示例
type: implementation
tags: [implementation, commands, orchestration, weather-orchestrator]
created: 2026-03-02
updated: 2026-05-01
---

# Commands Implementation

> Commands 是 Claude Code 的命令入口点，通过 YAML frontmatter 定义元数据，支持 `/command` 触发。Weather Orchestrator 命令展示了 Command → Agent → Skill 架构模式的多步工作流编排实现。

## 核心概念

Commands 是在 `.claude/commands/` 目录下的 Markdown 文件，通过 YAML frontmatter 定义元数据：

```yaml
---
description: 命令描述
model: haiku  # 可选：指定模型
---
```

## Weather Orchestrator 示例

**文件位置**: `.claude/commands/weather-orchestrator.md`

### 工作流设计

| 步骤 | 操作 | 工具 |
|------|------|------|
| Step 1 | 询问用户偏好 | `AskUserQuestion` |
| Step 2 | 获取天气数据 | `Agent` (weather-agent) |
| Step 3 | 创建 SVG 卡片 | `Skill` (weather-svg-creator) |

### 架构角色

| 组件 | 角色 | 本项目实现 |
|------|------|-----------|
| **Command** | 入口点、用户交互 | `/weather-orchestrator` |
| **Agent** | 数据获取（预加载 skill） | `weather-agent` + `weather-fetcher` |
| **Skill** | 独立输出 | `weather-svg-creator` |

## 相关页面

- [[claude-commands]] — Commands 实体
- [[commands]] — Commands 使用指南
- [[agent-command-skill-comparison]] — Agent/Command/Skill 对比
- [[skills-implementation]] — Skills 实现
- [[subagents-implementation]] — Sub-agents 实现
