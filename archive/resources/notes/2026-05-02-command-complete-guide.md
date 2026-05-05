---
name: notes/2026-05-02-command-complete-guide
description: Claude Code Command 完整指南 - 语法、工作流、最佳实践
type: tips
tags: [commands, tutorial, claude-code, skill]
created: 2026-05-02
source: conversation
related:
  - "[[claude-commands]]"
  - "[[claude-agents]]"
---

# Claude Code Command 完整指南

> 重要说明：Command 使用纯 Markdown 自然语言语法，不是 XML 标签。这是官方标准格式。

## 1. Command 简介

Command 是 Claude Code 中的可复用任务脚本，允许你：
- 定义标准化工作流程
- 组合多个工具和 Agent
- 创建可参数化的任务模板
- 通过 /command-name 快速调用

### Command vs Agent

| 特性 | Command | Agent |
|------|---------|-------|
| 调用方式 | /command-name | 直接使用 Agent 工具 |
| 复杂度 | 轻量级任务脚本 | 复杂多角色编排 |
| 用途 | 快速执行、参数化任务 | 深度协作、多步骤决策 |
| 适用场景 | 日常任务、模板化操作 | 复杂系统设计、代码审查 |

## 2. 文件结构

存放位置：.claude/commands/

命名规范：
- kebab-case（小写 + 连字符）
- 描述性名称
- 避免空格、大写、特殊字符

## 3. YAML Frontmatter

每个 Command 文件开头必须包含 YAML frontmatter：

```yaml
---
description: 简洁描述 Command 的功能
model: haiku | sonnet | opus
allowed-tools:
  - ToolName1
  - ToolName2
---
```

字段说明：
- description: 一句话描述功能（必需）
- model: 指定使用的模型（必需）
- allowed-tools: 允许使用的工具列表（必需）

模型选择：
- haiku: 轻量快速，适合简单任务
- sonnet: 平衡性能，适合大部分场景
- opus: 深度推理，适合复杂决策

## 4. 语法格式详解

核心原则：Command 使用纯 Markdown 自然语言 + 项目符号参数

正确语法示例：
```
Use the Agent tool:
- subagent_type: weather-agent
- description: Fetch weather data
- prompt: Fetch current temperature for Dubai
- model: haiku
```

错误语法（不要使用）：
- XML 标签如 <invoke name="Agent"> 是错误的
- 应该使用 Markdown 自然语言

## 5. 工具调用方式

### Agent 工具
```
Use the Agent tool:
- subagent_type: agent-name
- description: 任务描述
- prompt: 具体的 prompt 内容
- model: haiku
```

### Skill 工具
```
Use the Skill tool:
- skill: skill-name
- args: 可选参数
```

### AskUserQuestion 工具
```
Use the AskUserQuestion tool:
- questions: 问题数组
```

### Bash 工具
```
Use Bash to run command:
- command: 要执行的命令
```

## 6. 完整示例

### 简单示例 (time-command)
```markdown
---
description: Get current time in multiple time zones
model: haiku
allowed-tools:
  - Bash
---

# Time Command

Use Bash to get current time:
- command: date +"%Y-%m-%d %H:%M:%S"
```

### 复杂示例 (weather-orchestrator)
```markdown
---
description: Fetch Dubai weather and create an SVG weather card
model: haiku
allowed-tools:
  - AskUserQuestion
  - Agent
  - Skill
---

# Weather Orchestrator Command

## Step 1: Ask User for Temperature Unit

Use the AskUserQuestion tool:
- questions:
    - header: Temperature
    options:
      - label: Celsius
      - label: Fahrenheit
    multiSelect: false

## Step 2: Fetch Weather Data via Agent

Use the Agent tool:
- subagent_type: weather-agent
- description: Fetch Dubai weather data
- prompt: Fetch the current temperature for Dubai, UAE in [unit requested by user].
- model: haiku

## Step 3: Create Weather Card

Use the Skill tool:
- skill: svg-generator
- args: Create a weather card with temperature and conditions
```

## 7. 最佳实践

1. 保持简洁：每个 Command 专注于一个任务
2. 清晰的步骤：使用 ## 标题分隔步骤
3. 正确的语法：始终使用 Markdown 自然语言
4. 适当的模型：根据任务复杂度选择模型
5. 限制工具：只允许必要的工具
6. 文档化：在 description 中清晰描述功能

## 8. 快速参考表

| 工具 | 用途 | 参数 |
|------|------|------|
| Agent | 调用子 Agent | subagent_type, description, prompt, model |
| Skill | 调用技能 | skill, args |
| AskUserQuestion | 向用户提问 | questions |
| Bash | 执行命令 | command |
| Read | 读取文件 | file_path |
| Write | 写入文件 | content, file_path |

---

来源：基于 .claude/commands/ 中的实际示例