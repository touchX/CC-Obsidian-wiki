---
name: test.driven.development
description: TDD
type: guide
tags: superpowers,tdd,quality
created: 2026-05-05
updated: 2026-05-05
---
# Test-Driven Development 技能使用完全指南

> 来源：obra/superpowers 插件 v5.0.7
> 整理：2026-05-05

## 概述

先写测试，看它失败，再写最小代码让它通过。

**核心原则：** 如果你没有看测试失败，你不知道它是否测试了正确的东西。

## 铁律

\\\
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
\\\

写代码前先写测试？删除它。从头开始。

## 红绿重构

1. **RED** — 写失败测试
2. **Verify RED** — 看它失败
3. **GREEN** — 写最小代码
4. **Verify GREEN** — 看它通过
5. **REFACTOR** — 清理

## 何时使用

- 新功能
- Bug 修复
- 重构
- 行为变更

## 常见借口

| 借口 | 现实 |
|------|------|
| 太简单不需要测试 | 简单代码也会坏，测试只需 30 秒 |
| 之后测试 | 测试立即通过什么都证明不了 |