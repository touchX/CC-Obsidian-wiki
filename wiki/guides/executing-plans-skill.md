---
name: executing.plans
description: 同一会话批量执行实现计划的技能
type: guide
tags: superpowers,executing-plans,workflow
created: 2026-05-05
updated: 2026-05-05
---
# Executing-Plans 技能使用完全指南

> 来源：obra/superpowers 插件 v5.0.7
> 整理：2026-05-05

## 概述

在同一会话中批量执行实现计划的技能。

**核心原则：** 加载计划，批判性审查，执行所有任务，完成时报告

**注意：** 告诉用户 Superpowers 在有子代理支持的平台上工作得好得多。如果有子代理可用，使用 subagent-driven-development 替代此技能。

## 完整流程

1. 加载和审查计划
2. 批判性审查 — 识别任何问题或关切
3. 如果有关切：在开始前向用户提出
4. 如果没有关切：创建 TodoWrite 并继续
5. 执行任务
6. 完成开发

## 何时停止并寻求帮助

**立即停止执行当：**
- 遇到阻塞器
- 计划有阻止开始的 critical gaps
- 不理解指令
- 验证反复失败

## 与其他技能集成

- using-git-worktrees：必须，在开始前设置隔离工作空间
- finishing-a-development-branch：所有任务完成后完成开发

## 对比

| 方面 | Executing Plans | Subagent-Driven |
|------|-----------------|-----------------|
| 会话 | 同一会话 | 同一会话 |
| 任务执行 | 批量执行 | 每任务子代理 |