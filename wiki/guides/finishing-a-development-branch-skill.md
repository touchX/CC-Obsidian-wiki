---
name: finishing.a.development.branch
description: 开发分支完成技能
type: guide
tags: superpowers,finishing,workflow
created: 2026-05-05
updated: 2026-05-05
---
# Finishing-A-Development-Branch 技能使用完全指南

> 来源：obra/superpowers 插件 v5.0.7
> 整理：2026-05-05

## 概述

完成开发工作的结构化指导。

**核心原则：** 验证测试 → 呈现选项 → 执行选择 → 清理

## 完整流程

1. **验证测试** — 运行项目测试套件
2. **确定基础分支** — git merge-base
3. **呈现 4 个选项**
4. **执行选择**
5. **清理 Worktree**

## 4 个选项

1. 本地合并到基础分支
2. 推送并创建 Pull Request
3. 保持原样（稍后处理）
4. 丢弃此工作

## 选项处理

| 选项 | 合并 | 推送 | 保持 Worktree | 清理分支 |
|------|------|------|---------------|----------|
| 1. 本地合并 | ✓ | - | - | ✓ |
| 2. 创建 PR | - | ✓ | ✓ | - |
| 3. 保持原样 | - | - | ✓ | - |
| 4. 丢弃 | - | - | - | ✓ |