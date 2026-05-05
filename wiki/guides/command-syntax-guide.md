---
command.syntax.guide
name: command-syntax-guide
description: Claude Code Commands 正确语法指南 - 纯 Markdown 自然语言，不使用 XML 标签
type: guide
tags: [commands, syntax, tutorial, best-practices]
created: 2026-05-02
updated: 2026-05-04
source: ../../../archive/notes/2026-05-02-command-correct-guide.md
---

# Claude Code Commands 正确指南

> [!warning] 重要更正
> **之前的版本包含严重错误**：之前错误地使用了 XML 标签语法（`<invoke>`, `<parameter>`），这是**完全错误的**。
>
> **正确语法**：Command 使用**纯 Markdown 自然语言**，没有任何 XML 标签。

## 1. Command 简介

### 1.1 什么是 Command

Command 是 Claude Code 的**命令入口点**，通过 Markdown 文件 + YAML frontmatter 定义，触发后同步执行并返回结果。

### 1.2 核心特征

| 特性 | 说明 |
|------|------|
| **触发方式** | `/command-name` 斜杠命令 |
| **执行模式** | 同步执行，返回结果 |
| **文件格式** | 纯 Markdown + 自然语言 |
| **工具调用** | 用自然语言描述 + 项目符号参数 |

## 2. 文件结构

### 2.1 目录位置

```
.claude/commands/<command-name>.md
```

### 2.2 命名规范

| 规范 | 示例 |
|------|------|
| 目录 | `.claude/commands/` |
| 文件名 | `kebab-case` 格式 |
| 触发名 | 文件名去掉 `.md` |

### 2.3 示例

```
.claude/commands/
├── weather-orchestrator.md    → /weather-orchestrator
├── wiki-lint.md              → /wiki-lint
└── memory-store.md           → /memory-store
```

## 3. YAML Frontmatter

### 3.1 必需字段

```yaml
---
description: 命令描述，用于 /help 显示
---
```

### 3.2 可选字段

```yaml
---
description: 命令功能描述
model: haiku              # 指定模型：haiku | sonnet | opus
allowed-tools:            # 允许使用的工具列表
  - Agent
  - Skill
  - AskUserQuestion
---
```

### 3.3 字段说明

| 字段 | 必需 | 类型 | 说明 |
|------|:----:|------|------|
| `description` | ✅ | string | 命令功能描述 |
| `model` | ❌ | enum | 指定使用的模型 |
| `allowed-tools` | ❌ | array | 限制可用的工具 |

## 4. 正确的语法格式

### 4.1 核心原则

**Command 使用纯自然语言，没有任何特殊标签或 XML 语法。**

### 4.2 正确示例

```markdown
---
description: 获取天气数据
model: haiku
---

# Weather Command

获取当前天气信息。

使用 Agent 工具调用 weather agent：

- subagent_type: weather-agent
- description: 获取天气数据
- prompt: 获取上海的当前天气数据
```

### 4.3 错误示例（不要这样做）

```markdown
<!-- ❌ 错误：使用了 XML 标签 -->
<invoke name="Agent">
  <parameter name="prompt">获取天气</parameter>
</invoke>
```

## 5. 工具调用方式

### 5.1 Agent 工具

**正确语法**：

```markdown
使用 Agent 工具调用 code-reviewer：

- subagent_type: code-reviewer
- description: 审查代码安全性
- prompt: 请审查以下代码的安全性问题
- model: haiku
```

### 5.2 Skill 工具

**正确语法**：

```markdown
使用 Skill 工具调用 wiki-lint：

- skill: wiki-lint
- args: 运行健康检查
```

### 5.3 AskUserQuestion 工具

**正确语法**：

```markdown
使用 AskUserQuestion 工具询问用户偏好：

- questions:
  - question: "请问您想查看哪个城市的天气？"
    header: "城市"
    multiSelect: false
    options:
      - label: "迪拜"
        description: "阿联酋迪拜"
      - label: "上海"
        description: "中国上海"
```

### 5.4 Bash 工具

**正确语法**：

```markdown
执行 Bash 命令运行 Wiki 健康检查：

- command: cd wiki && ../.claude/skills/wiki-lint/wiki-lint.sh
- description: 运行 Wiki 健康检查脚本
- timeout: 60000
```

### 5.5 Read/Write 工具

**正确语法**：

```markdown
读取 wiki/index.md 文件：

- file_path: wiki/index.md

写入新文件：

- file_path: wiki/concepts/new-concept.md
- content: |
  # 新概念页面

  这是新页面的内容。
```

## 6. 完整示例

### 6.1 Weather Orchestrator（真实示例）

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

Fetch the current temperature for Dubai, UAE and create a visual SVG weather card.

## Execution Contract (non-negotiable)

You MUST complete this command by delegating to the `weather-agent` subagent. You are forbidden from:

- Fetching weather data yourself via Bash, WebFetch, or any other tool
- Skipping Step 1 (the user's unit preference is required input to the agent)
- Calling `weather-svg-creator` before the agent returns a temperature

## Workflow

### Step 1: Ask User Preference

Use the AskUserQuestion tool to ask the user whether they want the temperature in Celsius or Fahrenheit. Capture the selected unit before proceeding.

### Step 2: Fetch Weather Data via Agent

Use the Agent tool to invoke the weather agent:

- subagent_type: weather-agent
- description: Fetch Dubai weather data
- prompt: Fetch the current temperature for Dubai, UAE in [unit requested by user]. Return the numeric temperature value and unit.
- model: haiku

Wait for the agent to complete and capture the returned temperature value and unit.

**Fail-closed guardrail**: If the agent does not return a numeric temperature and unit, DO NOT proceed to Step 3. Report the failure to the user and stop.

### Step 3: Create SVG Weather Card

Use the Skill tool to invoke the weather-svg-creator skill:

- skill: weather-svg-creator

The skill will use the temperature value and unit from Step 2 to create the SVG card.

## Output Summary

Provide a clear summary to the user showing:

- Temperature unit requested
- Temperature fetched from Dubai
- SVG card created at `orchestration-workflow/weather.svg`
```

### 6.2 Wiki Lint Command

```markdown
---
description: 运行 Wiki 健康检查
---

# Wiki Lint

执行 Wiki 健康检查，验证所有页面是否符合规范。

执行以下命令：

- command: cd wiki && ../.claude/skills/wiki-lint/wiki-lint.sh
- description: 运行 Wiki 健康检查脚本
- timeout: 60000

检查完成后，返回验证结果和修复建议。
```

## 7. 最佳实践

### 7.1 命名规范

| 建议 | 示例 |
|------|------|
| 使用动词开头 | `wiki-lint`, `memory-store` |
| 避免缩写 | `weather` 而非 `wth` |
| 小写连字符 | `my-command` 而非 `MyCommand` |

### 7.2 Frontmatter 规范

```yaml
---
description: 简洁明确的功能描述
model: haiku    # 根据任务复杂度选择
allowed-tools:  # 明确限制可用工具
  - Agent
  - Skill
---
```

### 7.3 命令内容结构

```markdown
---
description: 命令描述
---

# 命令标题

命令功能概述。

## 执行步骤

1. 第一步：使用 XX 工具...
2. 第二步：调用 YY Agent...
3. 第三步：输出结果...
```

### 7.4 错误处理

```markdown
---
description: 安全执行命令
---

# Safe Executor

执行操作前：
1. 检查 Git 状态
2. 验证分支名称
3. 确认操作安全性

如果发现问题，立即停止并报告用户。
```

### 7.5 性能优化

| 技巧 | 说明 |
|------|------|
| 使用 `haiku` | 简单任务用轻量模型 |
| 限制并行 | 避免过多并发调用 |
| 明确工具列表 | 使用 `allowed-tools` 限制 |

## 8. 快速参考表

| 你想... | 正确语法 |
|--------|----------|
| 调用 Agent | 使用 Agent 工具调用...<br>- subagent_type: xxx<br>- prompt: xxx |
| 调用 Skill | 使用 Skill 工具调用...<br>- skill: xxx<br>- args: xxx |
| 问用户 | 使用 AskUserQuestion 工具询问...<br>- questions: [...] |
| 执行命令 | 执行以下命令：<br>- command: xxx |
| 读文件 | 读取文件：<br>- file_path: xxx |
| 写文件 | 写入文件：<br>- file_path: xxx<br>- content: xxx |

## 9. 相关资源

### 9.1 Wiki 页面

- [[command-complete-guide]] — Command 完整指南
- [[agent-command-skill-comparison]] — Agent/Command/Skill 对比

### 9.2 示例 Commands

- `.claude/commands/weather-orchestrator.md` — 天气编排器
- `.claude/commands/wiki-lint.md` — Wiki 健康检查
- `.claude/commands/memory-store.md` — 记忆存储

### 9.3 下一步学习

1. **实战练习**：创建你的第一个 Command
2. **深入研究**：研究 Agent 调用机制
3. **探索更多**：学习 Hooks 和 Workflows

---

> [!tip] 重要提醒
> - ✅ Command 使用**纯 Markdown 自然语言**
> - ❌ **不要使用**任何 XML 标签或特殊语法
> - ✅ 用**自然语言描述** + **项目符号参数**

---

*本文档创建于 2026-05-02*
*最后更新：2026-05-04（修正严重语法错误）*
