---
name: synthesis/cross-model-workflow
description: Claude Code + Codex 跨模型协作工作流 — Plan→QA→Implement→Verify 四步循环
type: synthesis
tags: [workflow, cross-model, claude-code, codex, plan-mode, verification]
created: 2026-04-26
updated: 2026-04-26
source: ../../../archive/workflows/cross-model-workflow/cross-model-workflow.md
---

# Cross-Model (Claude Code + Codex) Workflow

基于 [claude-code-best-practice](https://github.com/shanraisshan/claude-code-best-practice) 和 [codex-cli-best-practice](https://github.com/shanraisshan/codex-cli-best-practice)。

## 交叉引用

- [[concepts/context-management]] — 上下文管理
- [[synthesis/agent-architecture]] — Agent 架构模式

## Workflow

```
┌─────────────────────────────────────────────────────────────────────────┐
│              CROSS-MODEL CLAUDE CODE + CODEX WORKFLOW                   │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  STEP 1: PLAN                                          Claude Code      │
│  ─────────────                                         Opus 4.6         │
│  Open Claude Code in plan mode (Terminal 1).           Plan Mode        │
│  Claude interviews you via AskUserQuestion.                             │
│  Produces a phased plan with test gates.                                │
│                                                                         │
│  Output: plans/{feature-name}.md                                        │
│                                                                         │
│                              ▼                                          │
│                                                                         │
│  STEP 2: QA REVIEW                                     Codex CLI        │
│  ──────────────────                                    GPT-5.4          │
│  Open Codex CLI in another terminal (Terminal 2).                       │
│  Codex reviews plan against the actual codebase.                        │
│  Inserts intermediate phases ("Phase 2.5")                              │
│  with "Codex Finding" headings.                                         │
│  Adds to the plan — never rewrites original phases.                     │
│                                                                         │
│  Output: plans/{feature-name}.md (updated)                              │
│                                                                         │
│                              ▼                                          │
│                                                                         │
│  STEP 3: IMPLEMENT                                     Claude Code      │
│  ──────────────────                                    Opus 4.6         │
│  Start a new Claude Code session (Terminal 1).                          │
│  You implement phase-by-phase                                           │
│  with test gates at each phase.                                         │
│                                                                         │
│                              ▼                                          │
│                                                                         │
│  STEP 4: VERIFY                                        Codex CLI        │
│  ────────────────                                      GPT-5.4          │
│  Start a new Codex CLI session (Terminal 2).                            │
│  Codex verifies the implementation                                      │
│  against the plan.                                                      │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

## 四步循环说明

| 步骤 | 工具 | 模型 | 职责 |
|------|------|------|------|
| **Plan** | Claude Code | Opus 4.6 | 需求分析、分解任务、制定计划 |
| **QA Review** | Codex CLI | GPT-5.4 | 审查计划、发现遗漏、补充中间阶段 |
| **Implement** | Claude Code | Opus 4.6 | 按计划分阶段实现、测试门控 |
| **Verify** | Codex CLI | GPT-5.4 | 验证实现是否符合计划 |

## 设计原则

1. **不覆盖原计划** — Codex 只补充，不重写 Claude 的原始阶段
2. **测试门控** — 每个阶段完成后进行验证再进入下一阶段
3. **双模型互补** — Claude 擅长规划与实现，Codex 擅长审查与验证
4. **并行终端** — 两个终端分别运行不同模型，保持上下文独立

*最后更新：2026-04-26*
