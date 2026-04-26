---
name: tips/boris-10-tips
description: 10个团队使用技巧：并行、Plan Mode、CLAUDE.md、Subagents
type: tips
tags: [tips, boris, team, parallel, plan-mode, skills, subagents]
created: 2026-02-01
---

# 10 Tips from the Claude Code Team

> Boris Cherny 分享来自 Claude Code 团队的 10 个技巧。2026年2月1日。

## 1/ 更多并行

一次启动 3-5 个 git worktrees，每个运行自己的 Claude 会话。这是最大的生产力提升。

- 命名 worktrees，设置 shell aliases (`2a`, `2b`, `2c`)
- 一个专门的"analysis" worktree 仅用于读取日志和运行 BigQuery

---

## 2/ 每个复杂任务从 Plan Mode 开始

精力投入到计划，Claude 才能一次性完成实现。

- 一个人让 Claude 写计划，第二个人作为 staff engineer 审查
- 出问题时切回 Plan mode 重新规划

---

## 3/ 投资你的 CLAUDE.md

每个修正后结束于："更新你的 CLAUDE.md，这样你就不会再犯那个错误。"

无情地编辑 `CLAUDE.md`，直到 Claude 的错误率可衡量地下降。

---

## 4/ 创建你自己的 Skills 并签入 Git

如果某事每天做一次以上，就把它变成 skill 或 command：

- `/techdebt` 查找和消除重复代码
- 同步 7 天 Slack、GDrive、Asana、GitHub
- 构建分析工程师风格的 agents 写 dbt models、review 代码

---

## 5/ Claude 自己修复大多数 Bug

- 启用 Slack MCP，粘贴 Slack bug 线程说"fix"
- "Go fix the failing CI tests" — 不要微观管理怎么做
- 指向 docker logs 排查分布式系统

---

## 6/ 提升 Prompting 水平

a. **挑战 Claude**: "Grill me on these changes" 让 Claude 做 reviewer

b. **平庸的修复后**: "Knowing everything you know now, scrap this and implement the elegant solution"

c. **写详细 spec** 减少模糊度

---

## 7/ 终端和环境设置

- **Ghostty** — 同步渲染、24-bit 颜色、proper unicode
- `/statusline` 自定义状态栏显示 context 使用和 git 分支
- tmux — 每任务/worktree 一个标签页
- **语音听写** — 说比打字快 3x

---

## 8/ 使用 Subagents

a. 追加 "use subagents" 让 Claude 使用更多计算

b. 将单独任务 offload 到 subagents 保持主 agent 上下文干净

c. 通过 hook 将权限请求路由到 Opus 4.5 进行安全扫描

---

## 9/ 用 Claude 做数据和分析

让 Claude Code 使用 "bq" CLI 拉取和分析指标：
- 团队有 BigQuery skill 签入代码库
- 任何有 CLI、MCP、API 的数据库都可以

Boris 6+ 个月没写一行 SQL。

---

## 10/ 用 Claude 学习

a. 启用 **"Explanatory"** 或 **"Learning"** output style

b. 让 Claude 生成可视 HTML 演示来解释不熟悉的代码

c. 让 Claude 画 ASCII 图解新协议和代码库

d. 构建间隔重复学习 skill：解释理解 → Claude 追问填补空白 → 存储

---

## 来源

- [Boris Cherny (@bcherny) on X — February 1, 2026](https://x.com/bcherny/status/2017742741636321619)
