---
name: guides/claude-code-parallel-development
description: Claude Code 并行开发完全指南 — Subagents + Agent Teams + Git Worktree + 工作流编排实战
type: guide
tags: [claude-code, parallel-development, subagents, agent-teams, git-worktree, workflow, orchestration, performance]
created: 2026-05-01
updated: 2026-05-01
source: ../../archive/guides/claude-code-parallel-development-2026-05-01.md
external_source: https://zhuanlan.zhihu.com/p/2033183908523718494
---

# Claude Code 并行开发完全指南

> Subagents + Agent Teams + Git Worktree + 工作流编排实战

> 来源：知乎文章（外部教程）

## 核心痛点

单个 Claude 实例处理复杂任务时的三个崩溃节点：

| 痛点 | 表现 | 根本原因 |
|------|------|----------|
| **上下文爆了** | 项目超过几万行，模型开始"失忆" | 长上下文检索质量下降 |
| **任务只能串行** | 必须等一个做完再做另一个 | 单实例无法并行 |
| **多模块无法同时推进** | 前后端任务切换，上下文断裂 | 缺乏隔离的工作单元 |

**共同解法**：让多个工作单元并行跑，彼此隔离但又可以通信。

---

## 四种并行方案对比

| 方案 | 核心作用 | 适用场景 | 上手难度 |
|------|----------|----------|----------|
| **Subagents** | 同项目多角色分工 | 一个人管多个工种（写代码+review+测试） | ★ |
| **Agent Teams** | 多 Agent 同时并行 | 需要真正"多头脑"同时工作 | ★★★ |
| **Git Worktree** | 隔离分支并行 | 长时重构、多人协作场景 | ★★ |
| **工作流编排** | 串联 + 控制各单元 | 全局协调、任务调度 | ★★ |

---

## 一、Subagents：用 Markdown 定义"团队成员"

### 1.1 什么是 Subagent

Subagent 就是一组 Markdown 文件，定义了角色的**指令、工具和职责范围**。

Claude Code 启动时自动加载，对话中直接呼叫名字，以对应角色身份响应。

### 1.2 目录结构

**全局级（跨项目复用）**：
```bash
~/.claude/agents/
├── code-reviewer.md      # 代码审查员
├── test-writer.md       # 测试工程师
└── security-auditor.md # 安全审计员
```

**项目级（团队共享，推荐）**：
```bash
your-project/.claude/agents/
├── frontend-dev.md       # 前端工种
├── backend-dev.md        # 后端工种
└── architect.md          # 架构评审
```

**项目级优势**：提交到 Git 后，新成员 clone 仓库即可获得同一套 AI 工种定义。

### 1.3 Subagent 文件结构

```markdown
# 角色：代码审查员（Code Reviewer）

## 职责
你是一个严格的代码审查员，专注于代码质量、安全性和可维护性。

## 工作原则
- 每次 review 必须包含：逻辑错误、安全漏洞、性能问题、代码风格
- 发现问题必须给出具体修复建议，不只说"有问题"
- 优先审查：权限相关、数据库操作、外部 API 调用

## 输出格式
每次 review 输出：
1. 问题列表（按严重程度排序）
2. 推荐修复方案
3. 本次 review 综合评分（1-10）

## 触发信号
当用户在会话中提到 @code-reviewer 或要求"审查代码"时激活。
```

### 1.4 使用方式

**方法 1：直接呼叫**
```markdown
@code-reviewer 请审查这段代码
```

**方法 2：自动激活**
在对话中提到"审查代码"或触发关键词时自动激活。

---

## 二、Agent Teams：真正"多头脑"并行工作

### 2.1 Agent Teams vs Subagents

| 特性 | Subagents | Agent Teams |
|------|-----------|-------------|
| **工作模式** | 单实例多角色 | 多实例独立运行 |
| **隔离性** | 共享上下文 | 完全隔离 |
| **通信** | 直接访问 | 状态传递 |
| **适用场景** | 快速角色切换 | 长时并行任务 |

### 2.2 Agent Teams 典型场景

**场景：三层架构同时重构**
- Agent 1：前端重构（React 组件拆分）
- Agent 2：后端重构（API 重新设计）
- Agent 3：数据库重构（Schema 迁移）

三个 Agent 完全独立运行，各自维护上下文，通过共享状态同步进度。

---

## 三、Git Worktree：隔离分支并行开发

### 3.1 什么是 Git Worktree

Git Worktree 允许你**同时检出多个分支到不同目录**，每个分支有独立的工作区。

### 3.2 典型应用

**场景：大规模重构**
```bash
# 主工作区（稳定分支）
~/project-main/

# Worktree 1（重构数据库层）
~/project-db-layer/

# Worktree 2（重构 API 层）
~/project-api-layer/
```

每个 Worktree 可以启动独立的 Claude Code 实例，互不干扰。

### 3.3 创建 Worktree

```bash
# 创建新 worktree
git worktree add ../project-db-layer db-layer-branch

# 列出所有 worktree
git worktree list

# 删除 worktree
git worktree remove ../project-db-layer
```

---

## 四、工作流编排：全局协调者

### 4.1 什么是工作流编排

工作流编排是**串联各个工作单元的"总指挥"**，负责任务分发、状态管理和结果聚合。

### 4.2 编排模式

| 模式 | 说明 | 适用场景 |
|------|------|----------|
| **串行编排** | A → B → C 顺序执行 | 有依赖关系的任务链 |
| **并行编排** | A || B || C 同时执行 | 无依赖的独立任务 |
| **混合编排** | A → (B || C) → D | 复杂工作流 |

### 4.3 编排工具

- **Claude Code CLI**：通过脚本编排多个 Agent
- **Make/Task**：定义任务依赖图
- **自定义脚本**：用 Python/Shell 编写编排逻辑

---

## 五、选择建议

### 根据场景选择方案

**如果你的需求是...**

| 需求 | 推荐方案 | 理由 |
|------|----------|------|
| 快速角色切换（写代码 → 审查 → 测试） | Subagents | 轻量级，单实例即可 |
| 真正并行多个大任务 | Agent Teams | 完全隔离，不互相干扰 |
| 同时维护多个长期分支 | Git Worktree | 物理隔离，Git 原生支持 |
| 复杂工作流调度 | 工作流编排 | 全局控制，灵活组合 |

### 组合使用

**典型组合**：Subagents + Git Worktree
- 每个 Worktree 启动一个 Claude Code 实例
- 实例内用 Subagents 快速切换角色
- 实例间完全隔离，避免上下文污染

---

## 六、最佳实践

### DO ✅
- 项目级 Subagents 提交到 Git，团队共享
- 为每个 Worktree 配置独立的 CLAUDE.md
- Agent Teams 间通过共享文件同步状态
- 定期清理不再使用的 Worktree

### DON'T ❌
- 混淆 Subagents 和 Agent Teams 的使用场景
- 在单实例内强行并行（失去隔离意义）
- 忘记删除临时 Worktree（浪费空间）
- Agent Teams 过多（管理复杂度增加）

---

## 相关资源

- [[guides/]] — 更多指南
- [[patterns/]] — 相关模式
- **外部来源**：[知乎原文](https://zhuanlan.zhihu.com/p/2033183908523718494)

---

*摄取时间: 2026-05-01*
*来源: 知乎文章（外部教程）*
