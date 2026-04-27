---
name: wiki-index-manual
description: Wiki 导航索引（手动维护版）- 备份于 Dataview 迁移期间
type: reference
tags: [index, wiki, backup, deprecated]
created: 2026-04-26
updated: 2026-04-26
backup: "备份自 index.md，Dataview 迁移完成后保留作为应急参考"
---

# Wiki Index (Manual Backup)

> ⚠️ **此文件已弃用** — 手动维护版本已于 2026-04-26 被 Dataview 自动索引替代
> 保留此文件作为应急备份，如 Dataview 出现问题可参考此文件恢复

> 上次更新：2026-04-26

本 Wiki 基于 Karpathy LLM Wiki 方法论构建，专注于 Claude Code 最佳实践知识积累。

---

## Concepts (概念)

关于 Claude Code 和 AI 编程的核心概念。

| 页面 | 描述 | 标签 | 更新 |
|------|---------|------|------|
| [[concepts/context-window]] | 上下文窗口原理与管理 | fundamentals, llm | 2026-04-23 |
| [[concepts/context-management]] | Claude Code 上下文管理策略 | workflow, optimization | 2026-04-23 |
| [[concepts/agent-harness]] | Agent Harness 的重要性 | architecture, testing | 2026-04-23 |
| [[concepts/skills-discovery-mono-repos]] | Skills 在大型 Monorepo 中的发现机制 | skills, discovery | 2026-04-26 |
| [[concepts/agent-memory]] | 子 Agent 持久化记忆系统 | memory, agents | 2026-04-26 |
| [[concepts/claude-memory]] | Claude Memory 记忆系统 | memory, context | 2026-04-26 |
| [[concepts/global-vs-project-settings]] | 全局 vs 项目级设置对比 | settings, scope | 2026-04-26 |

---

## Entities (实体)

Claude Code 相关的具体工具、框架和项目。

| 页面                                    | 描述                   | 类型      | 更新         |
| ------------------------------------- | -------------------- | ------- | ---------- |
| [[wiki/entities/claude-code]]              | Anthropic CLI 工具完整指南 | tool    | 2026-04-23 |
| [[wiki/entities/claude-skills]]            | Skills 系统详解          | feature | 2026-04-23 |
| [[wiki/entities/claude-cli]]               | Claude CLI 核心功能      | tool    | 2026-04-26 |
| [[wiki/entities/claude-subagents]]         | 子代理系统                | feature | 2026-04-26 |
| [[wiki/entities/claude-mcp]]               | MCP 服务器集成            | feature | 2026-04-26 |
| [[wiki/entities/claude-settings]]          | 设置配置系统               | feature | 2026-04-26 |
| [[wiki/entities/claude-commands]]          | 自定义 Commands         | feature | 2026-04-26 |
| [[wiki/entities/claude-cli-startup-flags]] | CLI 启动参数参考           | tool    | 2026-04-26 |
| [[wiki/entities/claude-hooks]]             | Hooks 系统             | feature | 2026-04-26 |

---

## Sources (来源)

原始来源摘要和参考。

| 页面 | 来源 | 摘要日期 |
|------|------|----------|
| [[sources/karpathy-llm-wiki]] | Karpathy LLM Wiki 方法论 | 2026-04-23 |
| [[sources/advanced-tool-use]] | API 级别工具调用优化 | 2026-04-26 |
| [[sources/sdk-vs-cli-system-prompts]] | SDK vs CLI 系统提示词对比 | 2026-04-26 |
| [[sources/browser-automation-mcp-comparison]] | 浏览器自动化 MCP 工具对比 | 2026-04-26 |
| [[sources/llm-degradation-analysis]] | LLM 日间性能波动分析 | 2026-04-26 |
| [[sources/usage-rate-limits]] | 用量限制与 Rate Limits 详解 | 2026-04-26 |
| [[sources/learning-journey-redesign]] | Weather Reporter 演示重构计划 | 2026-04-26 |

---

## Synthesis (综合)

跨多个概念和来源的深度分析。

| 页面                                                | 描述                            | 来源数 | 更新         |
| ------------------------------------------------- | ----------------------------- | --- | ---------- |
| [[synthesis/agent-architecture]]                  | Agent 系统架构模式                  | 5   | 2026-04-23 |
| [[synthesis/why-harness-is-important]]            | Harness 为何不是提示词包装器            | 3   | 2026-04-26 |
| [[synthesis/agent-command-skill-comparison]]      | Agent/Command/Skill 三种扩展机制对比  | 2   | 2026-04-26 |
| [[synthesis/cross-model-workflow]]                | Claude Code + Codex 跨模型协作工作流  | 2   | 2026-04-26 |
| [[orchestration-workflow/orchestration-workflow]] | Command → Agent → Skill 编排工作流 | 3   | 2026-04-26 |

---

## Guides (指南)

实用操作指南和教程。

| 页面 | 描述 | 难度 |
|------|---------|------|
| [[guides/quick-start]] | Wiki 快速入门 | 入门 |
| [[guides/power-ups]] | Claude Code 增强功能 | 进阶 |
| [[guides/agent-teams]] | Agent Teams 多会话协调 | 进阶 |
| [[guides/commands]] | Commands 命令实现 | 中级 |
| [[guides/skills]] | Skills 实现指南 | 中级 |
| [[guides/subagents]] | Sub-agents 实现指南 | 中级 |
| [[guides/scheduled-tasks]] | 定时任务 /loop 调度 | 入门 |
| [[guides/rpi-workflow]] | RPI 开发流程 (Research→Plan→Implement) | 进阶 |

### Tutorial (教程)

系统化教程，从安装到高级使用。

| 页面 | 描述 | 难度 |
|------|---------|------|
| [[tutorial/day0/README]] | Day 0 — Claude Code 安装与认证 | 入门 |
| [[tutorial/day0/windows]] | Windows 平台安装指南 | 入门 |
| [[tutorial/day0/linux]] | Linux 平台安装指南 | 入门 |
| [[tutorial/day0/mac]] | macOS 平台安装指南 | 入门 |
| [[tutorial/day1/README]] | Day 1 — 使用层级指南 (Prompting→Agents→Skills) | 入门 |

### Implementation (实现详解)

深入理解 Claude Code 各组件的实现原理与架构模式。

| 页面 | 描述 | 标签 |
|------|---------|------|
| [[implementation/commands-implementation]] | Commands 命令系统实现 | commands, orchestration |
| [[implementation/skills-implementation]] | Skills 系统实现 | skills, agent-skills |
| [[implementation/subagents-implementation]] | Sub-agents 实现 | subagents, weather-agent |
| [[implementation/scheduled-tasks-implementation]] | /loop 定时任务实现 | scheduled-tasks, loop |
| [[implementation/agent-teams-implementation]] | Agent Teams 多会话实现 | agent-teams, tmux |

---

## Tips (技巧)

来自社区和团队的 Claude Code 使用技巧。

| 页面 | 描述 | 更新 |
|------|---------|------|
| [[tips/boris-10-tips]] | 10个团队使用技巧 | 2026-04-26 |
| [[tips/boris-12-tips]] | 12个配置技巧 | 2026-04-26 |
| [[tips/boris-13-tips]] | 13个高效使用技巧 | 2026-04-26 |
| [[tips/boris-15-tips]] | 15个隐藏功能 | 2026-04-26 |
| [[tips/boris-2-tips]] | Code Review 与 Test Time Compute | 2026-04-26 |
| [[tips/boris-6-tips]] | Opus 4.7 技巧 | 2026-04-26 |
| [[tips/boris-squash-tips]] | Squash Merging 与 PR Size | 2026-04-26 |
| [[tips/code-review-tips]] | Code Review 技巧 | 2026-04-26 |
| [[tips/squash-merge-tips]] | Squash Merging 与 PR Size | 2026-04-26 |
| [[tips/opus-47-tips]] | Opus 4.7 技巧 | 2026-04-26 |
| [[tips/session-context-tips]] | Session Management 与 Context | 2026-04-26 |
| [[tips/skills-lessons]] | Skills 实战经验 | 2026-04-26 |
| [[tips/claude-thariq-tips-17-mar-26]] | Thariq Skills 9种类型与最佳实践 | 2026-03-17 |

---

## 统计

| 指标 | 数值 |
|------|------|
| 总页面数 | 60 |
| 概念页面 | 6 |
| 实体页面 | 10 |
| 来源页面 | 7 |
| 综合页面 | 5 |
| 指南页面 | 8 |
| Tutorial 页面 | 5 |
| 实现详解页面 | 5 |
| Tips 页面 | 13 |

---

## 标签云

`fundamentals` `llm` `workflow` `optimization` `architecture` `testing` `tool` `feature` `tips` `memory` `agents` `skills` `discovery` `parallel` `plan-mode` `hooks` `mcp` `subagents` `team` `sdk` `cli` `prompts` `browser` `automation` `usage` `billing` `claoude-md` `monorepo` `project-configuration` `flags` `command-line` `reference` `weather-agent` `frontmatter` `slash-commands` `built-in` `custom-commands` `extension` `lifecycle` `pretool` `posttool` `plugins` `servers` `integration` `context7` `playwright` `cross-model` `claude-code` `codex` `verification` `rpi` `research` `plan` `implement` `commands` `implementation` `agent-skills` `invocation-patterns` `isolated-context` `scheduled-tasks` `loop` `cron` `automation` `multi-session` `coordination` `orchestration` `weather-agent`

---

## 最近更新

1. [[tutorial/day0/README]] — 2026-04-26
2. [[tutorial/day0/windows]] — 2026-04-26
3. [[tutorial/day0/linux]] — 2026-04-26
4. [[tutorial/day0/mac]] — 2026-04-26
5. [[tutorial/day1/README]] — 2026-04-26

---

---

## Meta (元信息)

| 页面 | 描述 | 更新 |
|------|---------|------|
| [[WIKI|WIKI]] | Wiki Schema 定义 | 2026-04-23 |
| [[wiki/WIKI-GAP-ANALYSIS]] | Wiki 覆盖差距分析报告 | 2026-04-26 |

---

*查看 [[WIKI|Wiki Schema]] 了解页面格式规范*
