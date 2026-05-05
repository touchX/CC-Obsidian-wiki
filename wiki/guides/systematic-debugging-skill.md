---
name: systematic.debugging
description: 系统化调试四阶段根因分析
type: guide
tags: superpowers,debugging,quality
created: 2026-05-05
updated: 2026-05-05
---
# Systematic-Debugging 技能使用完全指南

> 来源：obra/superpowers 插件 v5.0.7
> 整理：2026-05-05

## 概述

随机修复浪费时间和创建新 bug。快速补丁掩盖潜在问题。

**核心原则：** 总是先找到根因再尝试修复。症状修复是失败。

## 铁律

\\\
NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST
\\\

如果没有完成第 1 阶段，不能提出修复。

## 四个阶段

1. **根因调查** — 仔细阅读错误信息，一致重现，检查最近变更
2. **模式分析** — 找到工作示例，比较差异，理解依赖
3. **假设和测试** — 形成单一假设，最小化测试
4. **实现** — 创建失败测试用例，修复根因，验证

## 何时使用

- 测试失败
- 生产 bug
- 意外行为
- 性能问题
- 构建失败

## 关键原则

- 不找到根因绝不修复
- 一次测试一个变量
- 3+ 修复失败 = 质疑架构