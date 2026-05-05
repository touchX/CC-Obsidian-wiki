---
auto.mode
name: guides/auto-mode
description: Auto Mode — Claude Code 智能权限决策模式，减少中断且保持安全
type: guide
tags: [claude-code, permissions, auto-mode, security, classifier, team-plan]
created: 2026-05-01
updated: 2026-05-01
source: ../../archive/guides/auto-mode-2026-05-01.md
external_source: https://claude.com/blog/auto-mode
---

# Auto Mode — Claude Code 智能权限模式

> 在减少中断和保持安全之间找到平衡点

> 来源：Anthropic 官方博客 | 功能研究预览版

## 功能概述

### 什么是 Auto Mode

**Auto mode** 是 Claude Code 中的一种新权限模式，Claude 代表你做出权限决策，并在操作运行前通过安全监控措施进行检查。

| 权限模式 | 中断频率 | 风险级别 |
|---------|---------|---------|
| **默认模式** | 频繁请求批准 | ✅ 最安全 |
| **Auto mode** | 减少中断 | 🟡 中等风险 |
| **--dangerously-skip-permissions** | 无中断 | ❌ 高风险 |

**可用性**：
- ✅ Team Plan — **现已推出**（研究预览版）
- 🔄 Enterprise Plan — 即将推出
- 🔄 API 用户 — 即将推出

## 工作原理

### 默认权限的局限

Claude Code 的默认权限是有意保守的：
- 每次文件写入和 bash 命令都请求批准
- ✅ 安全的默认设置
- ❌ 无法启动大型任务后离开
- 需要频繁的人工批准

### Auto Mode 的中间路径

**设计理念**：在减少中断的同时，引入比跳过所有权限更少的风险。

#### 分类器检查机制

在每个工具调用运行之前，**分类器**会审查它以检查潜在破坏性操作：

| 风险类型 | 分类器默认阻止 |
|---------|---------------|
| 🔴 批量删除文件 | ✅ 阻止 |
| 🔴 敏感数据外泄 | ✅ 阻止 |
| 🔴 恶意代码执行 | ✅ 阻止 |

#### 决策流程

```
工具调用请求
   ↓
分类器审查
   ↓
┌─────────────────┬──────────────────┐
│ 安全操作        │ 风险操作          │
│ 自动继续        │ 阻止并重定向      │
│                 │ ↓                │
│                 │ Claude 坚持尝试?   │
│                 │ ↓                │
│                 │ 触发用户权限提示   │
└─────────────────┴──────────────────┘
```

**关键特性**：
- ✅ 分类器认为安全的操作自动进行
- ✅ 风险操作被阻止，重定向 Claude 采用不同方法
- ✅ 如果 Claude 坚持尝试持续被阻止的操作，最终触发用户权限提示

## 预期行为

### 风险评估

**风险降低**：与 `--dangerously-skip-permissions` 相比，Auto mode **降低了风险**，但**没有完全消除**。

**推荐环境**：继续建议在**隔离环境**中使用。

**分类器局限性**：
- ⚠️ 可能仍然允许某些风险操作（例如：用户意图不明确，或 Claude 对环境上下文了解不足）
- ⚠️ 可能偶尔阻止良性操作
- ✅ 团队将持续改进体验

### 性能影响

Auto mode 可能对以下方面有**轻微影响**：
- Token 消耗
- 成本
- 工具调用的延迟

## 使用指南

### 系统要求

**兼容模型**：
- ✅ Claude Sonnet 4.6
- ✅ Claude Opus 4.6

**可用计划**：
- ✅ Claude Team — **现已推出**
- 🔄 Claude Enterprise — 即将推出
- 🔄 Claude API — 即将推出

### 管理员配置

**可用性**：即将为 Enterprise、Team 和 Claude API 计划的所有 Claude Code 用户推出。

**禁用方法**：
在托管设置中设置 `"disableAutoMode": "disable"` 以禁用 CLI 和 VS Code 扩展的 Auto mode。

**桌面应用默认**：
- Auto mode 在 Claude 桌面应用中**默认禁用**
- 可通过 Organization Settings -> Claude Code 切换开启

### 开发者使用

#### CLI 启用

```bash
# 1. 启用 auto mode
claude --enable-auto-mode

# 2. 使用 Shift+Tab 切换到 auto mode
```

#### Desktop 和 VS Code 扩展

1. 在 Settings -> Claude Code 中**切换开启** auto mode
2. 在会话中的权限模式下拉菜单中选择 auto mode

## 对比分析

### 权限模式对比

| 特性 | 默认模式 | Auto Mode | Skip Permissions |
|------|---------|-----------|------------------|
| **中断频率** | 高 | 低 | 无 |
| **安全性** | 最安全 | 中等 | 低（危险） |
| **使用场景** | 敏感操作 | 大型任务 | 隔离环境 |
| **推荐度** | ✅ 推荐 | ✅ 推荐 | ❌ 不推荐 |

### 使用场景建议

**默认模式**：
- ✅ 涉及敏感文件操作
- ✅ 生产环境
- ✅ 需要完全控制的场景

**Auto Mode**：
- ✅ 大型重构任务
- ✅ 批量文件操作
- ✅ 需要离开一段时间的工作
- ✅ 受信任的项目

**Skip Permissions**（危险）：
- ⚠️ 仅在隔离环境
- ⚠️ 沙盒测试环境
- ❌ 不建议在生产环境使用

## 安全保障

### 分类器阻止的默认行为

| 操作类型 | 默认行为 | 说明 |
|---------|---------|------|
| **批量删除** | 🛑 阻止 | 防止意外数据丢失 |
| **敏感数据** | 🛑 阻止 | 防止数据外泄 |
| **恶意代码** | 🛑 阻止 | 防止安全漏洞 |
| **良性操作** | ✅ 允许 | 正常开发流程 |

### 风险缓解策略

**分层安全**：
1. **分类器层**：第一道防线，自动阻止明显风险操作
2. **重定向层**：引导 Claude 采用更安全的方法
3. **用户确认层**：持续被阻止的操作触发人工审查
4. **环境隔离**：建议在隔离环境中使用

**持续改进**：
- 分类器会不断学习和改进
- 团队将持续优化风险检测能力
- 用户反馈将帮助完善分类逻辑

## 最佳实践

### 推荐使用模式

1. **评估任务风险**
   - 敏感操作 → 默认模式
   - 常规开发 → Auto mode
   - 隔离测试 → Skip permissions（谨慎）

2. **环境隔离**
   - 生产代码 → 默认模式
   - 个人项目 → Auto mode
   - 沙盒实验 → Skip permissions（谨慎）

3. **逐步信任**
   - 新项目 → 默认模式
   - 熟悉项目 → Auto mode
   - 高度信任 → 可考虑 Auto mode

### 使用注意事项

⚠️ **重要提醒**：
- Auto mode **不消除风险**，只是降低风险
- 分类器可能偶尔误判（允许风险或阻止良性操作）
- 建议始终在**隔离环境**中使用
- 大型操作前仍应审查计划

✅ **最佳实践**：
- 结合 Git 版本控制使用
- 定期备份重要数据
- 在分支上进行实验性操作
- 监控 Claude 的操作日志

## 相关资源

- **官方文档**: [Permission Modes - Claude Code Docs](https://code.claude.com/docs/en/permission-modes#eliminate-prompts-with-auto-mode)
- **功能发布**: [Auto mode 研究预览版发布](https://claude.com/blog/auto-mode)
- **安全指南**: [What the classifier blocks by default](https://code.claude.com/docs/en/permission-modes#what-the-classifier-blocks-by-default)

## 相关页面

- [[guides/session-management-context-window]] — 会话管理与权限控制
- [[patterns/claude-intelligence-harnessing]] — Claude 智能利用模式
- [[tips/session-context-tips]] — 会话上下文技巧

---

*摄取时间: 2026-05-01*
*来源: Anthropic 官方博客*
*功能状态: Team Plan 研究预览版*
*原文: https://claude.com/blog/auto-mode*
