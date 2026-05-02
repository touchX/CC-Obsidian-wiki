---
name: claude-dot-folder-guide
description: Claude Code .claude 文件夹结构与配置完全指南
type: concept
tags: [claude-code, configuration, hooks, skills, agents]
created: 2026-05-02
updated: 2026-05-02
source: ../../archive/zhihu/claude-dot-folder-2026-05-02.md
---

# Claude Code .claude 文件夹完全指南

大多数 Claude Code 用户把 .claude 文件夹当作一个"黑盒"。它们知道它的存在，也见过它出现在项目根目录中，但从未打开过，更别说理解里面每个文件的作用。

.claude 文件夹是控制 Claude 在你的项目中如何行为的核心中枢。它包含你的指令、自定义命令、权限规则，甚至还有 Claude 在不同会话之间的记忆。

## 两个文件夹，而不是一个

存在两个 .claude 目录：

- **项目级文件夹**：用于存放团队配置，提交到 Git
- **全局 ~/.claude/**：用于存放个人偏好和本机状态

## 核心文件说明

### CLAUDE.md — Claude 的说明手册

整个系统中最重要的文件。启动 Claude Code 会话时首先读取的就是 CLAUDE.md。它会将其直接加载进系统提示并在整对话中持续参考。

**CLAUDE.md 中应该写什么**：

可以写：
- 构建、测试和 lint 命令
- 关键架构决策
- 不明显的注意事项
- 导入规范、命名模式、错误处理风格

不要写：
- 本应写在 linter 或 formatter 配置里的内容
- 已经可以通过链接获取的完整文档
- 大段理论性解释

将 CLAUDE.md 控制在 200 行以内。

### rules/ 文件夹 — 可扩展的模块化指令

在 `.claude/rules/` 目录下的每一个 Markdown 文件都会自动和 CLAUDE.md 一起被加载。可以按关注点拆分指令。

支持"按路径生效"的规则，使用 YAML 前置块。

### hooks 系统 — 对 Claude 行为的确定性控制

hooks 是绑定在 Claude 工作流程特定节点上的事件处理器。一旦触发，shell 脚本就会执行。

**关键事件类型**：
- **PreToolUse**：工具执行前触发（安全关卡）
- **PostToolUse**：工具执行成功后触发
- **Stop**：Claude 完成任务时触发

**退出码含义**：
- 0：成功
- 1：报错，但不会阻止执行
- 2：阻止执行，并将 stderr 返回给 Claude 用于自我修正

### skills/ 文件夹 — 可复用的按需工作流

Skills 是 Claude 可以根据上下文自动调用的工作流。当任务符合描述时，它会主动触发。

### agents/ 文件夹 — 专用子代理

当任务复杂到需要"专家"处理时，可以定义子代理（subagent）。

### settings.json — 权限与项目配置

控制 Claude 可以做什么、不能做什么。

## 全局结构总览

项目级：
- `CLAUDE.md` — 团队指令（提交到仓库）
- `CLAUDE.local.md` — 个人覆盖（git 忽略）
- `.claude/settings.json` — 权限、hooks、配置
- `.claude/settings.local.json` — 个人权限覆盖
- `.claude/hooks/` — hook 脚本
- `.claude/rules/` — 模块化规则
- `.claude/skills/` — 自动触发的工作流
- `.claude/agents/` — 专用子代理

全局 ~/.claude/：
- `CLAUDE.md` — 全局指令
- `settings.json` — 全局设置 + hooks
- `skills/` — 全局技能
- `agents/` — 全局代理
- `projects/` — 会话历史 + 自动记忆

## 入门配置流程

1. 运行 `/init` 自动生成初始 CLAUDE.md，然后精简成核心内容
2. 创建 `.claude/settings.json` 至少含有基础权限配置
3. 创建 1–2 个常用 commands
4. 当 CLAUDE.md 变臃肿时，拆分到 `.claude/rules/`，并按路径作用域管理
5. 创建 `~/.claude/CLAUDE.md` 写个人偏好

**优先把 CLAUDE.md 写好。这是杠杆最高的部分，其它都是优化。**

从简单开始，逐步迭代，把它当作项目基础设施的一部分来维护——一旦配置好，它每天都会为你持续产生价值。