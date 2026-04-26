---
name: tips/boris-13-tips
description: 13个高效使用技巧：并行处理、Plan Mode、Hooks、MCP、Subagents
type: tips
tags: [tips, boris, parallel, plan-mode, hooks, mcp, subagents]
created: 2026-01-03
---

# 13 Tips from Boris Cherny

> Boris Cherny 分享的个人 Claude Code 设置技巧。2026年1月3日。

## 核心观点

Boris 的设置"surprisingly vanilla" — Claude Code 开箱即用效果很好，无需过多定制化。

---

## 1/ 并行运行 5 个 Claude

在终端中并行运行 5 个 Claude。给标签页编号 1-5，使用系统通知了解 Claude 何时需要输入。

---

## 2/ 使用 claude.ai/code 实现更多并行

在 claude.ai/code 上并行运行 5-10 个 Claude。可以在云端和本地之间切换会话。

---

## 3/ Opus + Thinking 模式

使用 Opus 4.5 + thinking 处理所有任务。这是 Boris 用过的最佳编程模型 — 虽然更大更慢，但因更少需要引导、更好的工具使用，最终反而更快。

---

## 4/ 团队共享单一 CLAUDE.md

将 `CLAUDE.md` 签入 Git，整个团队共享。任何人发现 Claude 行为异常，立即将其添加到 CLAUDE.md。

---

## 5/ PR 时 tag @claude 更新 CLAUDE.md

代码审查时 tag `@claude` 到同事的 PR 上，将改进添加到 `CLAUDE.md`。使用 [Claude GitHub Action](https://github.com/apps/claude)。

---

## 6/ 大多数会话以 Plan Mode 开始

大多数会话以 Plan mode 启动（shift+tab 两次）。好的计划至关重要。

---

## 7/ Slash Commands 处理内部循环

使用 slash commands 处理每天多次执行的"内部循环"工作流。命令签入 Git，位于 `.claude/commands/`。

示例：`/commit-push-pr` — 提交、推送并创建 PR。

---

## 8/ Subagents 自动化常见工作流

定期使用 subagents：`code-simplifier` 简化代码、`verify-app` 进行 E2E 测试等。Subagents 位于 `.claude/agents/`。

---

## 9/ PostToolUse Hook 自动格式化

使用 `PostToolUse` hook 格式化 Claude 的代码：

```json
"PostToolUse": [
  {
    "matcher": "Write|Edit",
    "hooks": [{ "type": "command", "command": "bun run format || true" }]
  }
]
```

---

## 10/ 预批准权限而非 --dangerously-skip-permissions

使用 `/permissions` 预批准常见安全的 bash 命令，避免不必要的权限提示。

---

## 11/ 通过 MCP 让 Claude 使用所有工具

Claude Code 使用所有工具：搜索/发布 Slack（通过 MCP）、运行 BigQuery 查询、抓取 Sentry 错误日志等。

---

## 12/ 后台 Agent 验证长时间任务

对于长时间运行的任务：
- 让 Claude 使用后台 agent 验证
- 或使用 Stop hook 验证
- 或使用 ralph-wiggum 插件

---

## 13/ 给 Claude 验证方式（最重要）

获取出色结果最重要的技巧 — **给 Claude 一种验证其工作的方式**。如果有反馈循环，Claude 会 2-3 倍提升最终结果质量。

Boris 的做法：每个变更都经过测试。

---

## 来源

- [Boris Cherny (@bcherny) on X — January 3, 2026](https://x.com/bcherny/status/2007179832300581177)
