---
name: using.git.worktrees
description: Git
type: guide
tags: superpowers,git-worktrees,workflow
created: 2026-05-05
updated: 2026-05-05
---
# Using-Git-Worktrees 技能使用完全指南

> 来源：obra/superpowers 插件 v5.0.7
> 整理：2026-05-05

## 概述

Git worktrees 创建隔离的工作空间，允许多分支同时工作而无需切换。

**核心原则：** 系统化目录选择 + 安全验证 = 可靠隔离

## 何时使用

- brainstorming（设计批准后实施前）必用
- subagent-driven-development 执行前必用
- executing-plans 执行前必用
- 任何需要隔离工作空间的场景

## 目录选择优先级

1. 检查现有目录：.worktrees 或 worktrees
2. 检查 CLAUDE.md 中的偏好设置
3. 询问用户

## 安全验证

对于项目本地目录，必须验证目录是否被 gitignore：
\git check-ignore -q .worktrees\

## 创建步骤

1. 检测项目名称
2. 创建 worktree（使用新分支）
3. 运行项目设置
4. 验证清洁基线
5. 报告位置

## Quick Reference

| 情况 | 行动 |
|------|------|
| .worktrees/ 存在 | 使用它（验证忽略） |
| worktrees/ 存在 | 使用它（验证忽略） |
| 两者都存在 | 使用 .worktrees/ |
| 都不存在 | 检查 CLAUDE.md → 询问 |