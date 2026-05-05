---
name: writing.skills
description: TDD方式编写技能
type: guide
tags: superpowers,writing-skills,meta
created: 2026-05-05
updated: 2026-05-05
---
# Writing-Skills 技能使用完全指南

> 来源：obra/superpowers 插件 v5.0.7
> 整理：2026-05-05

## 概述

Writing Skills 是将 TDD 应用于流程文档的技能。

**核心原则：** 如果你没有观察代理在没有技能的情况下失败，你不知道技能是否教了正确的东西。

## TDD 映射

| TDD 概念 | Skill 创建 |
|---------|-----------|
| Test case | 压力场景 + 子代理 |
| Production code | SKILL.md 技能文档 |
| Test fails | 无技能时代理违反规则（基线） |
| Test passes | 有技能时代理遵守 |

## 何时创建 Skill

**创建当：**
- 技术对你不是直观明显的
- 你会在项目间参考这个
- 模式应用广泛（不是特定项目）

**不要创建：**
- 一次性解决方案
- 在其他地方有良好文档记录的标准实践
- 特定项目约定

## 铁律

\\\
NO SKILL WITHOUT A FAILING TEST FIRST
\\\

没有失败测试就不写技能。