---
name: addyosmani-agent-skills
description: Production-grade engineering skills for AI coding agents. 20 skills covering the full development lifecycle.
type: source
version: 2.0
tags: [github, shell, agent-skills, claude-code, development-lifecycle]
created: 2026-04-28
updated: 2026-04-28
source: ../../../archive/resources/github/addyosmani-agent-skills-2026-04-28-v2.json
stars: 24701
forks: 0
language: Shell
license: MIT
github_url: https://github.com/addyosmani/agent-skills
platforms: [Claude Code, Cursor, Gemini CLI, Windsurf, OpenCode, GitHub Copilot]
author: Addy Osmani
---

# Agent Skills

Production-grade engineering skills for AI coding agents.

Skills encode the workflows, quality gates, and best practices that senior engineers use when building software. These ones are packaged so AI agents follow them consistently across every phase of development.

## 基本信息

| 字段 | 值 |
|------|-----|
| 作者 | [Addy Osmani](https://github.com/addyosmani) |
| Stars | ![24701](https://img.shields.io/github/stars/addyosmani/agent-skills) |
| 语言 | Shell |
| 许可证 | MIT |
| 技能数 | 20 |
| 平台支持 | 7 个平台 |

## 开发生命周期

```
  DEFINE          PLAN           BUILD          VERIFY         REVIEW          SHIP
 ┌──────┐      ┌──────┐      ┌──────┐      ┌──────┐      ┌──────┐      ┌──────┐
 │ Idea │ ───▶ │ Spec │ ───▶ │ Code │ ───▶ │ Test │ ───▶ │  QA  │ ───▶ │  Go  │
 │Refine│      │  PRD │      │ Impl │      │Debug │      │ Gate │      │ Live │
 └──────┘      └──────┘      └──────┘      └──────┘      └──────┘      └──────┘
  /spec          /plan          /build        /test         /review       /ship
```

## 7 个 Slash Commands

| 你在做什么 | 命令 | 核心原则 |
|-----------|------|----------|
| 定义要做什么 | `/spec` | Spec before code |
| 规划如何构建 | `/plan` | Small, atomic tasks |
| 增量构建 | `/build` | One slice at a time |
| 证明它有效 | `/test` | Tests are proof |
| 合并前审查 | `/review` | Improve code health |
| 简化代码 | `/code-simplify` | Clarity over cleverness |
| 发布到生产 | `/ship` | Faster is safer |

## 20 个核心技能

### Define - Clarify what to build

| 技能 | 功能 | 使用场景 |
|------|------|----------|
| [idea-refine](skills/idea-refine/) | 结构化发散/收敛思维 | 模糊概念需要探索 |
| [spec-driven-development](skills/spec-driven-development/) | PRD 驱动开发 | 新项目/功能/重大变更 |

### Plan - Break it down

| 技能 | 功能 | 使用场景 |
|------|------|----------|
| [planning-and-task-breakdown](skills/planning-and-task-breakdown/) | 分解为可验证任务 | 有规格需要实现 |

### Build - Write the code

| 技能 | 功能 | 使用场景 |
|------|------|----------|
| [incremental-implementation](skills/incremental-implementation/) | 薄垂直切片 | 任何跨文件变更 |
| [test-driven-development](skills/test-driven-development/) | 红绿重构 | 实现逻辑/修复 bug |
| [context-engineering](skills/context-engineering/) | 正确时间给正确信息 | 启动会话/切换任务 |
| [source-driven-development](skills/source-driven-development/) | 官方文档驱动 | 权威源码引用代码 |
| [frontend-ui-engineering](skills/frontend-ui-engineering/) | 组件架构 | 构建 UI |
| [api-and-interface-design](skills/api-and-interface-design/) | 契约优先设计 | API 设计 |

### Verify - Prove it works

| 技能 | 功能 | 使用场景 |
|------|------|----------|
| [browser-testing-with-devtools](skills/browser-testing-with-devtools/) | Chrome DevTools MCP | 浏览器调试 |
| [debugging-and-error-recovery](skills/debugging-and-error-recovery/) | 五步排查法 | 测试失败/构建中断 |

### Review - Quality gates

| 技能 | 功能 | 使用场景 |
|------|------|----------|
| [code-review-and-quality](skills/code-review-and-quality/) | 五轴审查 | 合并前审查 |
| [code-simplification](skills/code-simplification/) | Chesterton's Fence | 代码可读性差 |
| [security-and-hardening](skills/security-and-hardening/) | OWASP Top 10 | 处理用户输入/认证 |
| [performance-optimization](skills/performance-optimization/) | Core Web Vitals | 性能要求 |

### Ship - Deploy with confidence

| 技能 | 功能 | 使用场景 |
|------|------|----------|
| [git-workflow-and-versioning](skills/git-workflow-and-versioning/) | 原子提交 | 任何代码变更 |
| [ci-cd-and-automation](skills/ci-cd-and-automation/) | Pipeline 质量门 | CI/CD 配置 |
| [deprecation-and-migration](skills/deprecation-and-migration/) | 代码遗产管理 | 移除旧系统 |
| [documentation-and-adrs](skills/documentation-and-adrs/) | ADR 记录 | 架构决策 |
| [shipping-and-launch](skills/shipping-and-launch/) | 发布清单 | 部署准备 |

## Agent Personas

| Agent | 角色 | 视角 |
|-------|------|------|
| [code-reviewer](agents/code-reviewer.md) | Staff Engineer | 五轴代码审查 |
| [test-engineer](agents/test-engineer.md) | QA Specialist | 测试策略/覆盖率 |
| [security-auditor](agents/security-auditor.md) | Security Engineer | OWASP 评估 |

## Reference Checklists

| 参考 | 内容 |
|------|------|
| [testing-patterns.md](references/testing-patterns.md) | 测试结构/命名/ mocking |
| [security-checklist.md](references/security-checklist.md) | OWASP Top 10 |
| [performance-checklist.md](references/performance-checklist.md) | Core Web Vitals |
| [accessibility-checklist.md](references/accessibility-checklist.md) | WCAG 2.1 AA |

## 项目结构

```
agent-skills/
├── skills/                    # 20 个核心技能
│   ├── idea-refine/          # Define
│   ├── spec-driven-development/
│   ├── planning-and-task-breakdown/
│   ├── incremental-implementation/
│   ├── test-driven-development/
│   ├── context-engineering/
│   ├── source-driven-development/
│   ├── frontend-ui-engineering/
│   ├── api-and-interface-design/
│   ├── browser-testing-with-devtools/
│   ├── debugging-and-error-recovery/
│   ├── code-review-and-quality/
│   ├── code-simplification/
│   ├── security-and-hardening/
│   ├── performance-optimization/
│   ├── git-workflow-and-versioning/
│   ├── ci-cd-and-automation/
│   ├── deprecation-and-migration/
│   ├── documentation-and-adrs/
│   ├── shipping-and-launch/
│   └── using-agent-skills/
├── agents/                    # 3 个专业 Agent
├── references/               # 4 个检查清单
├── hooks/                    # 会话生命周期 Hooks
└── docs/                    # 各平台安装指南
```

## 快速安装

### Claude Code（推荐）

```bash
/plugin marketplace add addyosmani/agent-skills
/plugin install agent-skills@addy-agent-skills
```

### Gemini CLI

```bash
gemini skills install https://github.com/addyosmani/agent-skills.git --path skills
```

## 技能设计原则

1. **Process, not prose** — 技能是工作流，不是参考文档
2. **Anti-rationalization** — 每个技能都有"借口 + 反驳"表格
3. **Verification non-negotiable** — 每个技能以证据要求结束
4. **Progressive disclosure** — SKILL.md 是入口，按需加载引用

## 链接

- **GitHub**: https://github.com/addyosmani/agent-skills
- **文档**: https://github.com/addyosmani/agent-skills/blob/master/README.md

## 相关资源

<!-- Dataview 自动填充 -->
