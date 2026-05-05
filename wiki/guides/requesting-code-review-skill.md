---
name: requesting.code.review
description: 请求代码审查技能
type: guide
tags: superpowers,code-review,collaboration
created: 2026-05-05
updated: 2026-05-05
---
# Requesting-Code-Review 技能使用完全指南

> 来源：obra/superpowers 插件 v5.0.7
> 整理：2026-05-05

## 概述

早审查，常审查。

**核心原则：** 分发 superpowers:code-reviewer 子代理。审查者获得精确构建的上下文进行评估。

## 何时请求审查

**强制：**
- subagent-driven development 中每个任务后
- 重大功能完成后
- 合并到 main 前

**可选但有价值：**
- 卡住时（新鲜视角）
- 重构前（基线检查）
- 复杂 bug 修复后

## 如何请求

1. **获取 Git SHA**
2. **分发 Code Reviewer 子代理**
3. **处理反馈**

## 与工作流集成

- Subagent-Driven Development：每任务后审查
- Executing Plans：每批（3 任务）后审查