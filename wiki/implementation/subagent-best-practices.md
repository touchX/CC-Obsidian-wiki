---
name: implementation/subagent-best-practices
description: Subagent 完整最佳实践 — Frontmatter 字段、设计模式、三层复杂度
type: implementation
tags: [implementation, subagents, best-practices, frontmatter, patterns]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/cc-doc/子 Agent 最佳实践  shanraisshanclaude-code-best-practice.md
---

# Subagent 最佳实践

完整 Frontmatter 参考、内置 Agent 类型、设计模式，以及从实战中提炼的真实世界最佳实践。

## 架构概述

Subagent 被定义为 Markdown 文件，通过 YAML Frontmatter 控制其行为。Claude 通过 `Agent` 工具调用时，会创建**独立的上下文窗口**——Subagent 无法看到父级对话，反之亦然。

```
Main Session → Agent Tool → Subagent (Isolated Context)
                                    ↓
                              Own context window
                              Own tools/memory/skills
```

**隔离是关键特征**：Subagent **始终** 在自己的上下文中运行，这与 Skill 不同（默认内联运行）。

## Frontmatter 字段速查

| 字段 | 类型 | 必填 | 描述 |
|------|------|------|------|
| `name` | string | 是 | 唯一标识符，小写字母和连字符 |
| `description` | string | 是 | 何时调用，包含 PROACTIVELY 实现自动触发 |
| `tools` | string/list | 否 | 工具允许列表，省略则继承所有工具 |
| `model` | string | 否 | sonnet/haiku/opus，默认继承 |
| `maxTurns` | integer | 否 | 最大 Agent 轮次，防止失控 |
| `memory` | string | 否 | 持久化记忆：local/global/shared |
| `skills` | list | 否 | 预加载技能，启动时注入上下文 |
| `mcpServers` | list | 否 | MCP 服务器配置 |
| `hooks` | object | 否 | 生命周期钩子 |
| `background` | boolean | 否 | 始终后台运行 |
| `worktree` | string | 否 | 临时 git worktree 中运行 |

## 三层复杂度模式

### 第一层级：极简 Agent（轻量级实用工具）

```yaml
name: time-agent
description: 获取当前时间的专用 Agent
model: haiku
maxTurns: 3
```

特点：
- **Haiku 模型** 用于简单 bash 命令
- **maxTurns: 3** 防止失控执行
- **无记忆或技能** 因为任务不需要领域知识
- **无工具限制** 默认继承所有工具

### 第二层级：特色 Agent（领域专家）

```yaml
name: weather-agent
description: 获取迪拜天气的专用 Agent
model: sonnet
tools: WebFetch, Read, Write, Edit
maxTurns: 5
memory: project
skills:
  - weather-fetcher
hooks:
  PreToolUse:
    - sound-notify
```

特点：
- **显式 tools 列表** 用于细粒度控制
- **PROACTIVELY** 在描述中实现自动调用
- **项目记忆** 用于跨会话历史跟踪
- **预加载技能** 用于特定 API 指令
- **异步钩子** 用于声音反馈

### 第三层级：研究 Agent（只读分析）

```yaml
name: research-agent
description: 检测官方文档与本地报告漂移的 Agent
model: opus
tools: Read, Glob, Grep
maxTurns: 30
```

特点：
- **Opus 模型** 用于复杂分析推理
- **只读工具** 无写入风险
- **无状态** 每次运行独立

## Agent 设计最佳实践

### 1. 编写显式工具允许列表

**修改前**（继承所有内容——有风险）：
```yaml
# 省略 tools 字段 = 继承所有工具！
```

**修改后**（显式的、可审计的）：
```yaml
tools: Read, Glob, Grep  # 只读，最小权限
tools: WebFetch, Read, Write, Edit  # 根据需要调整
```

### 2. 正确设置 maxTurns

| Agent 类型 | 建议值 | 理由 |
|------------|--------|------|
| 单个 bash 命令 | 2–3 | 一次执行，一次返回 |
| API 获取 + 转换 | 5–8 | 获取、解析、格式化、返回 |
| 多文件代码搜索 | 10–15 | 多次 Glob/Grep 迭代 |
| 复杂分析或生成 | 20–30 | 多次读/写循环 |
| 无限制研究 | 50+ | 谨慎使用，配合 monitoring |

### 3. 模型与任务复杂度匹配

- **Haiku**：简单实用工具、时间/日期查询、简单格式化
- **Sonnet**：大多数 Agent——API 调用、代码搜索、中等分析
- **Opus**：复杂推理、多文档分析、架构决策

### 4. Command → Agent → Skill 编排模式

| 组件 | 角色 | 特点 |
|------|------|------|
| Command | 入口点，用户交互 | 只读工具，编排逻辑 |
| Agent | 数据获取 | 独立上下文，预加载技能 |
| Agent Skill | 领域指令 | 启动时注入上下文 |
| Standalone Skill | 输出渲染 | 按需调用，隔离执行 |

## 常见陷阱与解决方案

| 陷阱 | 症状 | 解决方案 |
|------|------|----------|
| 通过 bash "启动"另一个 Agent | Agent 挂起 | 使用 `Agent` 工具，明确说明 |
| 没有设置 maxTurns | 无限期运行 | 始终设置与复杂度成正比的值 |
| 描述中缺少 PROACTIVELY | Claude 从不自动调用 | 包含 PROACTIVELY 触发词 |
| 引用不存在的技能 | Agent 缺少领域知识 | 验证 skills 名称与目录匹配 |
| 工具列表过于严格 | 任务无法完成 | 包含所有必要工具 |

## Subagent vs Agent Teams

| 维度 | Subagents | Agent Teams |
|------|-----------|-------------|
| 上下文 | 单会话内隔离分支 | 完全独立会话 |
| 协调 | Agent 工具、提示词参数 | 共享任务列表 |
| 开销 | 低——共享进程 | 高——各自加载配置 |
| 最适合 | 单任务隔离 | 多组件并行构建 |

## 相关 Wiki 页面

- [[entities/claude-subagents]] — Subagent 系统完整参考
- [[entities/claude-agents]] — 内置 Agent 类型
- [[implementation/skill-design-principles]] — Skill 设计原则
- [[implementation/weather-orchestrator-walkthrough]] — 编排模式实战
