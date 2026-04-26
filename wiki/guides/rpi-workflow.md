---
name: guides/rpi-workflow
description: RPI 开发流程 — Research→Plan→Implement 三阶段系统化开发方法论
type: guide
tags: [workflow, rpi, research, plan, implement, agents, commands]
created: 2026-04-26
---

# RPI Workflow

**RPI** = **R**esearch → **P**lan → **I**mplement

> 系统化开发流程，每个阶段设有验证门控，防止在不可行功能上浪费精力。

## 概述

RPI 是一种系统化的开发方法论，通过三个阶段和验证门控确保开发质量：

```
描述功能 → 研究可行性 → 制定计划 → 执行实现
```

## 三阶段流程

| 阶段 | 输出 | 门控 |
|------|------|------|
| **Research** | 可行性分析报告 | GO/NO-GO |
| **Plan** | 实施路线图 | 评审通过 |
| **Implement** | 完整功能实现 | 验证通过 |

---

## 快速示例：用户认证功能

### Step 1: 描述
```
用户: "添加 Google 和 GitHub 的 OAuth2 认证"
```

### Step 2: Research
```bash
/rpi:research rpi/oauth2-authentication/REQUEST.md
```
输出:
- `research/RESEARCH.md` — 分析报告
- 判定: **GO** (可行)

### Step 3: Plan
```bash
/rpi:plan oauth2-authentication
```
输出:
- `plan/PLAN.md` — 3 阶段 15 任务
- `plan/pm.md` — 产品需求
- `plan/ux.md` — UX 设计
- `plan/eng.md` — 技术规格

### Step 4: Implement
```bash
/rpi:implement oauth2-authentication
```
进度:
- Phase 1: 后端基础 → PASS
- Phase 2: 前端集成 → PASS
- Phase 3: 测试优化 → PASS

结果: 功能完成，可发起 PR

---

## 目录结构

```
rpi/{feature-slug}/
├── REQUEST.md              # Step 1: 初始功能描述
├── research/
│   └── RESEARCH.md         # Step 2: 可行性分析
├── plan/
│   ├── PLAN.md             # Step 3: 实施路线图
│   ├── pm.md               # 产品需求
│   ├── ux.md               # UX 设计
│   └── eng.md              # 技术规格
└── implement/
    └── IMPLEMENT.md        # Step 4: 实施记录
```

---

## Agent 与 Command 映射

| Command | 调用的 Agent |
|---------|-------------|
| `/rpi:research` | requirement-parser, product-manager, Explore, senior-software-engineer |
| `/rpi:plan` | senior-software-engineer, product-manager, ux-designer |
| `/rpi:implement` | Explore, senior-software-engineer, code-reviewer |

---

## 相关资源

- [[guides/agent-teams]] — Agent 团队协作
- [[synthesis/agent-architecture]] — Agent 架构模式
- [[tutorial/day1/README]] — Day 1 使用层级