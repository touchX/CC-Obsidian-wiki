---
name: verification.before.completion
description: 证据优先验证技能
type: guide
tags: superpowers,verification,quality
created: 2026-05-05
updated: 2026-05-05
---
# Verification-Before-Completion 技能使用完全指南

> 来源：obra/superpowers 插件 v5.0.7
> 整理：2026-05-05

## 概述

声称工作完成而未验证是不诚实，不是效率。

**核心原则：** 证据优先，总是。

## 铁律

\\\
NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE
\\\

如果没有运行验证命令，不能声称通过。

## 门控功能

在声称任何状态或表达满意之前：

1. **识别** — 什么命令证明这个声明？
2. **运行** — 执行完整命令
3. **读取** — 完整输出，检查退出码
4. **验证** — 输出是否确认声明？
5. **然后** — 做出声明

## 常见失败

| 声明 | 需要 | 不充分 |
|------|------|--------|
| 测试通过 | 测试输出：0 failures | 之前运行 |
| Linter 干净 | Linter 输出：0 errors | 部分检查 |
| 构建成功 | 构建命令：exit 0 | Linter 通过 |