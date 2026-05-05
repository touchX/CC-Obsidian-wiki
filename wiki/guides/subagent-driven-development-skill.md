---
name: subagent.driven.development
description: 子代理驱动开发技能
type: guide
tags: superpowers,subagent,workflow
created: 2026-05-05
updated: 2026-05-05
---
# Subagent-Driven Development 技能使用完全指南

> 来源：obra/superpowers 插件 v5.0.7
> 整理：2026-05-05

## 概述

通过每次任务分发全新子代理进行计划执行，配合两阶段审查：spec 合规性审查，然后代码质量审查。

**核心原则：** 全新子代理 + 两阶段审查 = 高质量快速迭代

## 何时使用

- 有实施计划
- 任务大部分独立
- 留在同一会话

## 流程

1. 读取计划，提取所有任务及上下文，创建 TodoWrite
2. 每任务：分发实现者子代理 → spec 审查 → 代码质量审查
3. 所有任务完成后：分发最终代码审查
4. 使用 finishing-a-development-branch 完成

## 模型选择

- 机械实现任务：使用快速廉价模型
- 集成和判断任务：使用标准模型
- 架构和设计任务：使用最强模型

## 优势

vs 手动执行：子代理自然遵循 TDD，新鲜上下文，无干扰
vs 执行计划：同一会话，持续进展，自动检查点