---
name: superpowers.overview
description: Superpowers插件完整技能清单与核心设计思想概述
type: guide
tags: superpowers,skill,workflow
created: 2026-05-05
updated: 2026-05-05
source: ../../archive/resources/superpowers/Superpowers技能使用.md
---
# Superpowers 技能使用完全指南

> 来源：obra/superpowers 插件 v5.0.7
> 整理：2026-05-05

## 核心设计思想

1. **流程先于实现** — 任何功能开发都必须先经过 design → plan → execute 的完整流程
2. **子代理驱动开发** — 每次任务使用全新子代理，避免上下文污染，保证高质量快速迭代
3. **双重审查机制** — spec 合规性审查 + 代码质量审查，两阶段缺一不可

## 完整技能清单

### 核心流程技能（按使用顺序）

| 技能 | 触发时机 | 核心功能 |
|------|----------|----------|
| **brainstorming** | 任何创意工作之前 | 需求澄清 → 设计方案 → 用户审批 |
| **using-git-worktrees** | 设计批准后开始实现前 | 创建隔离工作空间 |
| **writing-plans** | 设计批准后 | 将设计分解为 2-5 分钟的原子任务 |
| **subagent-driven-development** | 执行计划时（推荐） | 子代理驱动 + 两阶段审查 |
| **executing-plans** | 替代方案 | 同一会话批量执行 + 检查点 |

### 质量保障技能

| 技能 | 核心原则 |
|------|----------|
| **test-driven-development** | RED-GREEN-REFACTOR |
| **systematic-debugging** | 4 阶段根因分析 |
| **verification-before-completion** | 证据优先 |
| **requesting-code-review** | 每任务后必审查 |

### 协作与收尾技能

| 技能 | 用途 |
|------|------|
| **receiving-code-review** | 审查反馈的技术评估 |
| **finishing-a-development-branch** | 验证测试 → 4 选项 → 清理 |
| **dispatching-parallel-agents** | 并行分发独立任务 |

### 元技能

| 技能 | 用途 |
|------|------|
| **writing-skills** | TDD 方式编写新技能 |
| **using-superpowers** | 技能系统入门 |