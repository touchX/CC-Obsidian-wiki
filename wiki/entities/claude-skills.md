---
name: entities/claude-skills
description: Skills 系统详解 — 创建、管理和使用 skills 扩展 Claude 功能
type: entity
tags: [skills, automation, workflow, extension]
created: 2026-04-26
updated: 2026-04-27
source: ../../../archive/cc-doc/使用 skills 扩展 Claude.md
---

# Claude Skills

## 概述

Skills 扩展了 Claude 能做的事情。创建一个 `SKILL.md` 文件，Claude 会将其添加到其工具包中，在相关时自动使用，或通过 `/skill-name` 直接调用。

> 💡 **提示**：Skill 正文仅在使用时加载，长参考资料在你需要它之前几乎不花费任何成本。

## Skill vs Subagent

| 方面 | Skill | Subagent |
|------|-------|----------|
| **它是什么** | 可重用的说明、知识或工作流 | 具有自己上下文的隔离工作者 |
| **关键优势** | 在上下文之间共享内容 | 上下文隔离，仅返回摘要 |
| **最适合** | 参考材料、可调用的工作流 | 读取许多文件的任务、并行工作 |

## Skill 位置

| 范围 | 路径 | 适用 |
|------|------|------|
| **企业** | 托管设置指定 | 组织内所有用户 |
| **用户** | `~/.claude/skills/<name>/SKILL.md` | 用户所有项目 |
| **项目** | `.claude/skills/<name>/SKILL.md` | 仅当前项目 |
| **插件** | `<plugin>/skills/<name>/SKILL.md` | 启用插件的位置 |

> ⚠️ 当各层级共享相同名称时：**企业 > 个人 > 项目**

## 创建第一个 Skill

### 目录结构

```
my-skill/
├── SKILL.md           # 主要说明（必需）
├── template.md        # Claude 要填写的模板
├── examples/
│   └── sample.md      # 显示预期格式的示例
└── scripts/
    └── validate.sh    # Claude 可执行的脚本
```

### 最小示例

```markdown
---
name: api-conventions
description: API design patterns for this codebase
---

When writing API endpoints:
- Use RESTful naming conventions
- Return consistent error formats
- Include request validation
```

## Frontmatter 字段参考

| 字段 | 必需 | 说明 |
|------|------|------|
| `name` | 否 | Skill 显示名称（小写字母、数字、连字符，最多 64 字符） |
| `description` | 推荐 | 功能描述，Claude 据此决定何时应用 |
| `when_to_use` | 否 | 触发短语或示例请求 |
| `argument-hint` | 否 | 自动完成提示（如 `[filename] [format]`） |
| `arguments` | 否 | 命名位置参数，按顺序映射到 `$name` 替换 |
| `disable-model-invocation` | 否 | `true` 时仅你可调用，防止 Claude 自动触发 |
| `user-invocable` | 否 | `false` 时从 `/` 菜单隐藏，仅 Claude 可用 |
| `allowed-tools` | 否 | Skill 激活时无需批准的工具列表 |
| `model` | 否 | 覆盖当前模型 |
| `effort` | 否 | `low`, `medium`, `high`, `xhigh`, `max` |
| `context` | 否 | `fork` 时在分叉的 subagent 上下文中运行 |
| `agent` | 否 | `context: fork` 时使用的 subagent 类型 |
| `hooks` | 否 | 限定于此 skill 生命周期的 hooks |
| `paths` | 否 | Glob 模式，限制 skill 激活的文件范围 |
| `shell` | 否 | `bash`（默认）或 `powershell` |

## 字符串替换

| 变量 | 描述 |
|------|------|
| `$ARGUMENTS` | 调用时传递的所有参数 |
| `$ARGUMENTS[N]` | 按 0 基索引访问（如 `$0` 第一个参数） |
| `$name` | frontmatter `arguments` 列表中声明的命名参数 |

**示例**：运行 `/fix-issue 123` 时，`$ARGUMENTS` 替换为 `123`

## 调用控制

| Frontmatter | 你可调用 | Claude 可调用 | 上下文加载 |
|-------------|----------|---------------|-----------|
| （默认） | ✅ | ✅ | 描述始终在，调用时加载完整内容 |
| `disable-model-invocation: true` | ✅ | ❌ | 你调用时加载完整内容 |
| `user-invocable: false` | ❌ | ✅ | 描述始终在，调用时加载完整内容 |

## 动态上下文注入

使用 `` !`<command>` `` 语法在 skill 内容发送给 Claude 前执行 shell 命令：

```yaml
---
name: pr-summary
description: Summarize changes in a pull request
context: fork
agent: Explore
allowed-tools: Bash(gh *)
---

## Pull request context
- PR diff: !`gh pr diff`
- PR comments: !`gh pr view --comments`
- Changed files: !`gh pr diff --name-only`
```

执行顺序：
1. 每个 `` !`<command>` `` 立即执行
2. 输出替换 skill 内容中的占位符
3. Claude 接收带实际数据的完全呈现的提示

> ⚠️ 要禁用此行为，在设置中设置 `"disableSkillShellExecution": true`

### 多行命令

```markdown
## Environment
```!
node --version
npm --version
git status --short
```
```

## Subagent 中运行 Skill

添加 `context: fork` 在隔离上下文中运行：

```yaml
---
name: deep-research
description: Research a topic thoroughly
context: fork
agent: Explore
---

Research $ARGUMENTS thoroughly:

1. Find relevant files using Glob and Grep
2. Read and analyze the code
3. Summarize findings with specific file references
```

`agent` 字段指定 subagent 配置（`Explore`, `Plan`, `general-purpose` 或自定义）。

## 视觉输出生成

Skills 可捆绑脚本生成视觉输出：

```python
#!/usr/bin/env python3
"""Generate an interactive collapsible tree visualization."""
# 完整示例见 archive/cc-doc/使用 skills 扩展 Claude.md
```

生成交互式 HTML：代码库树视图、依赖图、测试覆盖率报告等。

## 组合模式

| 模式 | 工作原理 |
|------|----------|
| **Skill + MCP** | MCP 提供连接；skill 教导 Claude 如何使用 |
| **Skill + Subagent** | Skill 为并行工作生成 subagents |
| **CLAUDE.md + Skills** | CLAUDE.md 保存始终开启规则；skills 保存按需加载的参考 |

## 上下文成本

| 功能 | 何时加载 | 上下文成本 |
|------|----------|-----------|
| **CLAUDE.md** | 会话开始 | 每个请求完整内容 |
| **Skills** | 启动时 + 使用时 | 低（描述）→ 高（完整内容） |
| **MCP 服务器** | 会话开始 | 每个请求 |
| **Subagents** | 生成时 | 与主会话隔离 |
| **Hooks** | 触发时 | 零 |

**提示**：设置 `disable-model-invocation: true` 将 skill 完全隐藏在 Claude 中，直到你手动调用。

## 故障排除

### Skill 未触发

1. 检查描述是否包含用户会自然说的关键字
2. 验证 skill 是否出现在 `What skills are available?` 中
3. 尝试重新表述请求以更接近描述
4. 使用 `/skill-name` 直接调用

### Skill 触发过于频繁

1. 使描述更具体
2. 添加 `disable-model-invocation: true` 仅手动触发

### 描述被截断

预算在上下文窗口的 1% 处动态扩展（回退 8,000 字符）。设置 `SLASH_COMMAND_TOOL_CHAR_BUDGET` 环境变量提高限制。

## 相关页面

- [[wiki/entities/claude-subagents]] — Subagent 系统
- [[wiki/entities/claude-mcp]] — MCP 服务器
- [[wiki/entities/claude-hooks]] — Hooks 系统
- [[guides/skills]] — Skills 使用指南

## 来源

- [使用 Skills 扩展 Claude](https://code.claude.com/docs/zh-CN/skills) — 官方文档