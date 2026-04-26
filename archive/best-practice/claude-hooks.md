---
name: claude-hooks
description: Hooks 系统 — 会话生命周期拦截与自动化
type: best-practice
tags: [hooks, lifecycle, automation, pretool, posttool]
created: 2026-04-26
---

# Claude Hooks — 会话生命周期拦截与自动化

Hooks 在会话生命周期关键节点拦截执行，支持 PreToolUse、PostToolUse 和 Stop 三种类型。

> **相关**: [[entities/claude-settings]] | [[concepts/context-management]]

<table width="100%">
<tr>
<td><a href="../">← Back to Claude Code Best Practice</a></td>
<td align="right"><img src="../!/images/claude-jumping.svg" alt="Claude" width="60" /></td>
</tr>
</table>

## Table of Contents

1. [Overview](#overview)
2. [Hook Types](#hook-types)
3. [Configuration](#configuration)
4. [Frontmatter Structure](#frontmatter-structure)
5. [Use Cases](#use-cases)
6. [Best Practices](#best-practices)
7. [Examples](#examples)

---

## Overview

Hooks 在 Claude Code 会话生命周期的关键时刻自动执行自定义逻辑。

| 特性 | 说明 |
|------|------|
| **自动化** | 无需手动触发，关键节点自动执行 |
| **双层级** | 支持全局和项目级配置 |
| **三种类型** | PreToolUse、PostToolUse、Stop |

---

## Hook Types

| 类型 | 时机 | 用途 |
|------|------|------|
| `PreToolUse` | 工具执行前 | 验证、修改参数、阻止操作 |
| `PostToolUse` | 工具执行后 | 格式化、检查、自动修复 |
| `Stop` | 会话结束时 | 最终验证、清理、总结 |

---

## Configuration

### 配置位置

| 级别 | 位置 | 优先级 |
|------|------|--------|
| **项目级** | `.claude/hooks/` | 高（覆盖全局） |
| **用户级** | `~/.claude/hooks/` | 低（默认） |

### 启用 Hook

在 `settings.json` 中配置：

```json
{
  "hooks": [
    {
      "type": "PreToolUse",
      "name": "git-push-review",
      "config": {
        "allowedTools": ["mcp__plugin_github_github__git_push"],
        "message": "You're about to push to GitHub. Open in Zed for review?",
        "requireConfirmation": true
      }
    },
    {
      "type": "PostToolUse",
      "name": "prettier",
      "config": {
        "allowedTools": ["Edit", "Write"],
        "filePatterns": ["**/*.{js,jsx,ts,tsx}"],
        "command": "prettier --write ${file}"
      }
    },
    {
      "type": "Stop",
      "name": "console-log-audit",
      "config": {
        "checkModifiedFiles": true,
        "pattern": "console\\.log",
        "message": "Found console.log in modified files"
      }
    }
  ]
}
```

---

## Frontmatter Structure

Hook 文件使用 YAML frontmatter 定义元数据：

```yaml
---
name: hook-name          # 唯一标识
description: 描述        # 一句话说明
trigger: "tool-name"     # 触发工具
when: "condition"        # 触发条件
mode: allow|block|modify # 行为模式
priority: 100            # 执行优先级（数值越大越早执行）
---
```

### 行为模式

| 模式 | 说明 |
|------|------|
| `allow` | 允许操作继续 |
| `block` | 阻止操作执行 |
| `modify` | 修改参数后继续 |

---

## Use Cases

### 常见场景

| 场景 | Hook 类型 | 示例 |
|------|-----------|------|
| 参数验证 | PreToolUse | 检查文件路径有效性 |
| 强制格式化 | PostToolUse | Prettier 自动格式化 |
| 安全检查 | PreToolUse | 阻止包含敏感信息的提交 |
| 类型检查 | PostToolUse | TypeScript 编译验证 |
| 上下文压缩 | Stop | 会话结束时自动摘要 |
| 文档阻止 | PreToolUse | 阻止创建不必要的 .md 文件 |

### 实际例子

#### Git Push 审查

```yaml
---
name: git-push-review
description: Push 前在 Zed 中审查更改
type: PreToolUse
trigger: mcp__plugin_github_github__git_push
mode: block
priority: 1000
---

在执行 git push 前，自动在 Zed 中打开当前分支的更改供审查。
```

#### Prettier 自动格式化

```yaml
---
name: prettier-formatter
description: JS/TS 文件自动格式化
type: PostToolUse
trigger: Edit|Write
filePatterns: "**/*.{js,jsx,ts,tsx}"
command: prettier --write ${file}
priority: 500
---

编辑 JS/TS 文件后自动运行 Prettier 格式化。
```

#### Console.log 审计

```yaml
---
name: console-log-audit
description: 会话结束时检查 console.log
type: Stop
checkModifiedFiles: true
pattern: "console\\.log"
priority: 100
---

会话结束前扫描所有修改的文件，警告发现的 console.log。
```

---

## Best Practices

### 设计原则

1. **明确职责** — 每个 Hook 只做一件事
2. **快速执行** — 避免长时间阻塞操作
3. **用户友好** — 提供清晰的错误信息
4. **可配置性** — 通过 config 暴露关键参数

### 性能考虑

| 实践 | 说明 |
|------|------|
| **避免 I/O 密集操作** | 文件系统操作应在后台异步进行 |
| **缓存结果** | 重复计算应缓存以提高性能 |
| **条件执行** | 只在必要时执行 Hook |

### 安全考虑

- PreToolUse Hooks 可阻止潜在危险操作
- 验证所有外部输入
- 不要在 Hook 中硬编码密钥

---

## Examples

### 完整示例：TypeScript 检查

```yaml
---
name: typescript-check
description: TypeScript 文件编辑后自动类型检查
type: PostToolUse
trigger: Edit|Write
filePatterns: "**/*.ts"
command: tsc --noEmit ${file}
priority: 600
config:
  showErrorsInTerminal: true
  failOnError: false
---

编辑 .ts 文件后自动运行 TypeScript 编译器检查类型错误。
错误会显示在终端，但不会阻止操作（failOnError: false）。
```

### 完整示例：文档更新提醒

```yaml
---
name: doc-update-reminder
description: 新文档创建后提醒更新索引
type: PostToolUse
trigger: Write
filePatterns: "wiki/**/*.md"
message: "New wiki page created. Remember to update wiki/index.md!"
priority: 400
---

创建新的 wiki 页面后提醒更新索引文件。
```

---

## Cross References

- [[entities/claude-settings]] — 配置系统
- [[entities/claude-commands]] — 命令系统
- [[concepts/context-management]] — 上下文管理
- [[guides/commands]] — Commands 实现
- [[guides/skills]] — Skills 实现

## Related Pages

- [[entities/claude-subagents]] — 子代理系统
- [[synthesis/agent-command-skill-comparison]] — 扩展机制对比

---

*最后更新: 2026-04-26*
