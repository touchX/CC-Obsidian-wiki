# AI 编程教学专家使用指南

**日期**: 2026-04-27
**版本**: 1.0
**状态**: 启用

---

## 1. 概述

AI 编程教学专家（`/mentor-ai-programming`）是一个专为进阶开发者设计的 Claude Code 学习系统，涵盖五大核心模块，采用三阶式难度递进。

### 目标用户

- 有编程经验，想深入掌握 Claude Code
- 希望系统化学习 Commands、Hooks、Subagents 等高级功能
- 想要通过代码审查提升代码质量

### 核心特性

| 特性 | 说明 |
|------|------|
| 双模式 | 快速模式（直接答案）+ 学习模式（Socratic 提问）|
| 三阶难度 | L1 入门 → L2 进阶 → L3 精通 |
| 代码审查 | 提交代码获取专业评估 |
| 进度跟踪 | 支持学习进度持久化 |

---

## 2. 快速开始

### 2.1 基本命令

```bash
# 查看帮助
/mentor-ai-programming

# 查看当前进度
/mentor-ai-programming status

# 开始学习 Commands 模块
/mentor-ai-programming learn commands start

# 开始学习 Hooks 模块
/mentor-ai-programming learn hooks start

# 开始学习 Subagents 模块
/mentor-ai-programming learn subagents start

# 开始学习 Workflows 模块
/mentor-ai-programming learn workflows start

# 开始学习 Agent Teams 模块
/mentor-ai-programming learn teams start
```

### 2.2 命令格式

```
/mentor-ai-programming [模式] [模块] [任务] [选项]
```

| 参数 | 可选值 | 说明 |
|------|--------|------|
| `模式` | `fast` / `learn` | fast=快速模式, learn=学习模式 |
| `模块` | `commands` / `hooks` / `subagents` / `workflows` / `teams` / `all` | 教学模块 |
| `任务` | `status` / `start` / `challenge` / `review` | 操作任务 |
| `选项` | `--level=1-3` / `--reset` | 指定等级 / 重置进度 |

---

## 3. 教学模式详解

### 3.1 快速模式 (fast)

**特点**: 直接给出答案和解释，适合时间紧迫时使用。

```bash
# 快速获取 Commands 最佳实践
/mentor-ai-programming fast commands start

# 快速查看 Hooks 配置示例
/mentor-ai-programming fast hooks start

# 提交代码快速审查
/mentor-ai-programming fast hooks review --file=hook-config.ts
```

### 3.2 学习模式 (learn)

**特点**: 采用 Socratic 提问引导，培养独立思考能力。

**核心原则**:
- 从不直接给答案 — 引导你自己发现
- 分阶段提示 — 根据阻塞程度递进
- 错误转化 — 将错误视为学习机会
- 事后复盘 — 高压任务后必须复盘

```bash
# 开始学习模式
/mentor-ai-programming learn commands start

# 学习 Subagents 进阶内容
/mentor-ai-programming learn subagents start --level=2

# 挑战任务
/mentor-ai-programming learn workflows challenge --level=2
```

---

## 4. 模块学习路径

### 4.1 Commands 模块

学习 Claude Code 的命令系统。

| 等级 | 内容 | 任务数 |
|------|------|--------|
| L1 | `/` 命令基础、快捷命令 | 3 |
| L2 | 命令组合、自定义别名 | 3 |
| L3 | 命令架构设计 | 1 |

```bash
/mentor-ai-programming learn commands start --level=1
/mentor-ai-programming learn commands challenge --level=1
```

### 4.2 Hooks 模块

学习 Claude Code 的钩子系统。

| 等级 | 内容 | 任务数 |
|------|------|--------|
| L1 | 钩子类型、基础使用 | 3 |
| L2 | 自定义钩子、事件处理 | 3 |
| L3 | 钩子系统架构 | 1 |

```bash
/mentor-ai-programming learn hooks start --level=1
/mentor-ai-programming learn hooks challenge --level=2
```

### 4.3 Subagents 模块

学习 Agent 编排和子代理调用。

| 等级 | 内容 | 任务数 |
|------|------|--------|
| L1 | 子代理基础、角色定义 | 3 |
| L2 | 代理编排、任务分配 | 3 |
| L3 | 多代理架构设计 | 1 |

```bash
/mentor-ai-programming learn subagents start --level=1
/mentor-ai-programming learn subagents challenge --level=3
```

### 4.4 Workflows 模块

学习完整开发工作流。

| 等级 | 内容 | 任务数 |
|------|------|--------|
| L1 | 标准工作流、常用场景 | 3 |
| L2 | 调试工作流、自定义流程 | 3 |
| L3 | 工作流架构设计 | 1 |

```bash
/mentor-ai-programming learn workflows start --level=1
/mentor-ai-programming learn workflows challenge --level=2
```

### 4.5 Agent Teams 模块

学习多代理协作系统。

| 等级 | 内容 | 任务数 |
|------|------|--------|
| L1 | 团队概念、通信模式 | 3 |
| L2 | 角色设计、任务分配 | 3 |
| L3 | 团队编排、自组织 | 1 |

```bash
/mentor-ai-programming learn teams start --level=1
/mentor-ai-programming learn teams challenge --level=3
```

---

## 5. 代码审查

### 5.1 提交代码审查

```bash
# 提交单个文件
/mentor-ai-programming fast hooks review --file=hook-config.ts

# 提交多个文件
/mentor-ai-programming learn commands review --file=commands.md,shortcuts.md

# 提交目录
/mentor-ai-programming review --path=./src/hooks/
```

### 5.2 审查维度

| 维度 | 检查项 |
|------|--------|
| **功能性** | 代码是否正确实现需求？边界情况？ |
| **最佳实践** | 是否遵循 Claude Code 最佳实践？ |
| **可读性** | 代码是否清晰易懂？ |
| **安全性** | 是否有安全隐患？ |

---

## 6. 进度管理

### 6.1 查看进度

```bash
/mentor-ai-programming status
```

输出示例:
```
Commands 模块: L1 ✅ L2 🔄 0/3
Hooks 模块: L1 ✅✅✅ L2 🔄 1/3
Subagents 模块: L1 🔄 2/3
```

### 6.2 重置进度

```bash
# 重置单个模块
/mentor-ai-programming --reset --module=hooks

# 重置全部进度
/mentor-ai-programming --reset --all
```

---

## 7. 学习建议

### 7.1 学习路径推荐

```
1. Commands (L1) → Hooks (L1) → Subagents (L1)
2. Workflows (L1) → Agent Teams (L1)
3. 进阶: L2 挑战任务
4. 精通: L3 综合项目
```

### 7.2 时间安排

| 等级 | 建议时间 |
|------|----------|
| L1 入门 | 每模块 30-60 分钟 |
| L2 进阶 | 每模块 1-2 小时 |
| L3 精通 | 每模块 2-4 小时 |

### 7.3 学习模式选择

| 场景 | 推荐模式 |
|------|----------|
| 快速了解概念 | fast 模式 |
| 深入理解原理 | learn 模式 |
| 准备面试/考试 | learn + review |
| 解决实际问题 | fast + review |

---

## 8. 常见问题

### Q: 如何选择模块顺序？

A: 建议按 Commands → Hooks → Subagents → Workflows → Agent Teams 的顺序学习，后者依赖前者的概念。

### Q: fast 和 learn 模式可以切换吗？

A: 可以随时切换。同一任务可用 `fast` 快速获取答案，后续再用 `learn` 深入理解。

### Q: 代码审查可以重复提交吗？

A: 可以。每次审查都会给出新的反馈，适合迭代改进。

### Q: 学习进度会保存吗？

A: 当前版本支持会话内进度跟踪，后续版本将支持持久化。

---

## 9. 相关资源

| 资源 | 路径 |
|------|------|
| 设计文档 | `docs/superpowers/specs/2026-04-27-ai-programming-mentor-design.md` |
| 实施计划 | `docs/superpowers/plans/2026-04-27-ai-programming-mentor-implementation.md` |
| Wiki Commands | `wiki/guides/commands.md` |
| Wiki Hooks | `wiki/guides/hooks.md` |
| Wiki Subagents | `wiki/guides/subagents.md` |
| Wiki Workflows | `wiki/guides/workflows.md` |
| Wiki Agent Teams | `wiki/guides/agent-teams.md` |

---

*本系统基于 Claude Code 最佳实践构建，采用 Socratic 教学法*
