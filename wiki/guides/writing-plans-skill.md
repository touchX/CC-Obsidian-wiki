---
name: writing.plans
description: 将设计方案分解为可执行计划的技能
type: guide
tags: superpowers,writing-plans,workflow
created: 2026-05-05
updated: 2026-05-05
---
# Writing-Plans 技能使用完全指南

> 来源：obra/superpowers 插件 v5.0.7
> 整理：2026-05-05

## 概述

将设计方案分解为可执行计划，假设工程师对代码库零上下文且品味可疑。

**核心原则：** 记录他们需要知道的一切：文件路径、代码、测试方法

## 何时使用

设计批准后，使用 brainstorming 或设计阶段之后。

## 文件结构

规划任务前，先映射将创建或修改的文件及各自职责。设计单元要有清晰的边界和定义良好的接口。

## Bite-Sized 任务粒度

每步是一个操作（2-5 分钟）：
- 写失败测试
- 运行确保失败
- 写最小实现
- 运行确保通过
- 提交

## Plan 文档头部

\\\
# [功能名称] Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: superpowers:subagent-driven-development