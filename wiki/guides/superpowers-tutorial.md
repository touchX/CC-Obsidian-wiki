---
name: guides/superpowers-tutorial
description: Superpowers 详细用法教程 - 大量提示词实例和实战指南
type: guide
tags: [superpowers, tutorial, claude-code, skills, examples, prompts]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/cnblogs/Superpowers 详细用法教程.md
---

# Superpowers 详细用法教程

## 概述

本文档是 [obra/superpowers](https://github.com/obra/superpowers) 的详细中文教程，聚焦于**大量提示词实例**，帮助你直接复制使用。

## 核心工作流

```
Brainstorming → Git Worktrees → Writing Plans → TDD → Subagent Execution → Code Review → Finish Branch
```

## 快速提示词实例

### 新项目起步

```
我想用 Python 写一个命令行 Todo List 应用，支持 add、list、done、delete 命令，用 JSON 文件存数据。
```

**预期行为**：AI 自动触发 brainstorming，问技术栈细节，呈现设计方案。

### 强制 Brainstorming

```
/superpowers:brainstorm
我有一个粗糙的想法：建一个 React 的天气 App，用免费 API 显示当前天气和预报。
```

**预期行为**：直接进入交互式需求精炼。

### 生成实施计划

```
设计批准了，请生成实施计划。
```

或手动：

```
/superpowers:write-plan
基于上面的设计，生成详细计划。
```

### 执行计划

```
计划看起来好，去执行吧。
```

或选择 subagent 模式：

```
用 subagent-driven-development 执行计划，让它自主工作。
```

### 修复 Bug

```
我的代码在添加任务时偶尔崩溃，帮我调试。
```

**预期行为**：触发 systematic-debugging + TDD，强制写失败测试。

### 代码审查

```
这个功能写完了，请做代码审查。
```

或手动：

```
/superpowers:request-code-review
审查下面这些变更。
```

### 完成分支

```
全部搞定，准备合并。
```

**预期行为**：触发 finishing-a-development-branch，验证测试，提供合并/PR/保留/丢弃选项。

## 技能速查表

| 技能 | 触发时机 | 用途 |
|------|----------|------|
| `brainstorming` | 新项目、创意工作 | 需求精炼、设计方案 |
| `writing-plans` | 设计确认后 | 拆分 2-5 分钟任务 |
| `executing-plans` | 计划生成后 | 批量执行 + 检查点 |
| `subagent-driven-development` | 复杂任务 | 子代理自主开发 |
| `test-driven-development` | 实现前 | RED-GREEN-REFACTOR |
| `systematic-debugging` | Bug 修复 | 4 阶段根因分析 |
| `requesting-code-review` | 任务间/完成后 | 代码质量审查 |
| `finishing-a-development-branch` | 分支完成 | 合并决策 |

## 安装方式

### Claude Code（推荐）

```bash
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
```

验证安装：

```bash
/help
```

应该看到新命令：
- `/superpowers:brainstorm` - 交互式设计精炼
- `/superpowers:write-plan` - 创建实施计划
- `/superpowers:execute-plan` - 批量执行计划

### 其他平台

**Codex**:
```
Fetch and follow instructions from https://raw.githubusercontent.com/obra/superpowers/refs/heads/main/.codex/INSTALL.md
```

**OpenCode**:
```
Fetch and follow instructions from https://raw.githubusercontent.com/obra/superpowers/refs/heads/main/.opencode/INSTALL.md
```

## TDD 强制示例

### RED：写失败测试

```typescript
test('rejects empty email', async () => {
  const result = await submitForm({ email: '' });
  expect(result.error).toBe('Email required');
});
```

### 运行测试（预期失败）

```bash
$ npm test
// 预期：FAIL
```

### GREEN：最小实现

```typescript
function submitForm(data: FormData) {
  if (!data.email?.trim()) {
    return { error: 'Email required' };
  }
}
```

### 运行测试（预期通过）

```bash
$ npm test
// 预期：PASS
```

## 常见坑

| 坑 | 说明 | 解决方案 |
|----|------|----------|
| 跳过 TDD | AI 拒绝直接写代码 | 等待测试失败后再实现 |
| AI 没触发技能 | 手动用 `/superpowers:xxx` | 强制调用技能 |
| 简单任务也触发 | 这是设计意图 | 任何任务都需要流程 |

## 更多信息

- 官方仓库：https://github.com/obra/superpowers
- 详细博客：https://blog.fsck.com/2025/10/09/superpowers/
- 配套 Wiki 页面：[[resources/github-repos/obra-superpowers]]

---

*教程来源：博客园 - https://www.cnblogs.com/thinkerGC/p/19510203*
