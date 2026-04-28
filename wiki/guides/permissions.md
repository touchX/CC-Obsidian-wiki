---
name: guides/permissions
description: Claude Code 权限模式详解：default、acceptEdits、plan、auto、dontAsk、bypassPermissions
type: guide
tags: [permissions, security, workflow]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/选择权限模式.md
---

# 选择权限模式

## 概述

权限模式控制 Claude 在编辑文件或运行命令前是否询问。选择模式塑造会话流程：默认模式让您在操作进行时审查每个操作，而更宽松的模式让 Claude 在更长的不间断时间内工作。

## 权限模式对比

| 模式 | 无需询问即可运行的操作 | 最适合 |
|------|----------------------|--------|
| `default` | 仅读取 | 入门、敏感工作 |
| `acceptEdits` | 读取、文件编辑和常见文件系统命令 | 迭代您正在审查的代码 |
| `plan` | 仅读取 | 在更改代码库前进行探索 |
| `auto` | 所有操作，带后台安全检查 | 长时间任务、减少提示疲劳 |
| `dontAsk` | 仅预先批准的工具 | 锁定的 CI 和脚本 |
| `bypassPermissions` | 除受保护路径外的所有操作 | 仅隔离容器和 VM |

## 模式详解

### acceptEdits Mode

`acceptEdits` 让 Claude 在工作目录中创建和编辑文件而无需提示。状态栏显示 `⏵⏵ accept edits on`。

自动批准的文件系统命令：`mkdir`、`touch`、`rm`、`rmdir`、`mv`、`cp`、`sed`（带安全环境变量前缀时）。

**启动方式**：
```bash
claude --permission-mode acceptEdits
```

### plan Mode

Plan mode 告诉 Claude 研究并提议更改而不进行更改。Claude 读取文件、运行命令探索，并编写计划，但不编辑源代码。

**进入方式**：
- 按 `Shift+Tab` 或在提示前加 `/plan`
- 启动时：`claude --permission-mode plan`

**批准选项**：
- 批准并在 auto mode 中启动
- 批准并接受编辑
- 批准并手动审查每个编辑
- 继续规划并提供反馈

### auto Mode

Auto mode 让 Claude 执行而无需权限提示。分类器模型在操作运行前审查操作，阻止超出范围的危险操作。

**可用要求**：
- **计划**：Max、Team、Enterprise 或 API
- **管理员**：在 Team/Enterprise 上启用
- **模型**：Claude Sonnet 4.6+、Opus 4.6+ 或 Opus 4.7（Max）
- **提供商**：仅 Anthropic API

**默认阻止**：
- 下载和执行代码（如 `curl | bash`）
- 向外部端点发送敏感数据
- 生产部署和迁移
- 云存储大规模删除
- 强制推送或直接推送到 `main`

**回退机制**：
- 连续阻止 3 次或总共 20 次时，auto mode 暂停
- 批准被阻止的操作后恢复

### dontAsk Mode

自动拒绝每个会提示的工具调用。仅与 `permissions.allow` 规则匹配的操作可执行。适合 CI 管道或受限环境。

```bash
claude --permission-mode dontAsk
```

### bypassPermissions Mode

禁用权限提示和安全检查。仅在隔离环境（容器、VM、devcontainers）中使用。

```bash
claude --permission-mode bypassPermissions
```

## 切换权限模式

| 操作方式 | 方法 |
|----------|------|
| 会话中切换 | `Shift+Tab` 循环：`default` → `acceptEdits` → `plan` |
| 启动时 | `claude --permission-mode <mode>` |
| 默认设置 | 在 settings.json 中设置 `permissions.defaultMode` |

## 受保护的路径

以下路径的写入在每种模式中都永远不会自动批准：

**受保护目录**：
- `.git`
- `.vscode`
- `.idea`
- `.husky`
- `.claude`（除 `.claude/commands`、`skills`、`agents`、`worktrees`）

## 相关页面

- [[claude-settings]] — 设置系统
- [[claude-hooks]] — Hooks 系统
- [[best-practices]] — 最佳实践

## 来源

- [选择权限模式](https://code.claude.com/docs/zh-CN/permission-modes) — 官方文档
