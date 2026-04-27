---
name: sources/claude-agent-teams-full
description: Agent Teams 完整官方文档 — 协调多个 Claude Code 会话团队协作
type: source
tags: [source, claude, agent-teams, multi-agent, orchestration, collaboration]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/协调 Claude Code 会话团队.md
---

# 协调 Claude Code 会话团队

Agent Teams 允许您同时运行多个 Claude Code 会话并协调它们的工作。通过团队协调器，您可以定义角色、分配任务并管理会话之间的通信。

## 团队配置

在 `.claude/agents/` 目录中定义团队：

```json
{
  "teams": {
    "code-review": {
      "coordinator": "planner",
      "members": ["security-reviewer", "perf-reviewer"],
      "tasks": ["analyze", "report"]
    }
  }
}
```

## 会话协调

- **coordinator**: 管理任务分配和进度跟踪
- **members**: 执行具体任务的专门代理
- **communication**: 会话之间通过共享上下文协调

## 使用场景

- 大型代码库的并行审查
- 复杂任务的多方面分析
- 持续集成中的自动化工作流

## 相关资源

- [子代理配置](https://code.claude.com/docs/zh-CN/sub-agents)
- [Agent SDK](https://platform.claude.com/docs/zh-CN/agent-sdk/overview)
