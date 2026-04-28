---
name: tutorial/day1/README
description: Day 1 教程 — Claude Code 使用层级 (Prompting→Agents→Skills)
type: tutorial
tags: [tutorial, prompting, agents, skills, beginner, workflow]
created: 2026-04-26
source: ../../archive/tutorial/day1/README.md
---

# Day 1 — Claude Code 使用层级

> 从基础 Prompting 到 Agent 再到 Skill，掌握 Claude Code 的三层架构。

## 学习路径

```
Level 1: Prompting    (基础对话)
    ↓
Level 2: Commands     (命令增强)
    ↓
Level 3: Agents       (子代理)
    ↓
Level 4: Skills      (技能扩展)
```

---

## Level 1: Prompting（入门）

**核心**：直接对话，描述任务

```markdown
# 示例
修复 login.ts 中的类型错误
```

**特点**：
- 即时反馈
- 简单任务首选
- 无需额外配置

---

## Level 2: Commands（命令）

**核心**：通过 `/` 触发预定义命令

```bash
# 内置命令
/claude-code --help
/skill-create
/agent-create
```

**特点**：
- 标准化工作流
- 可自定义扩展
- 复用最佳实践

---

## Level 3: Agents（代理）

**核心**：创建独立子代理处理复杂任务

```bash
/agent:create weather-agent
```

**特点**：
- 独立上下文
- 持久化记忆
- 并行执行

---

## Level 4: Skills（技能）

**核心**：定义可复用的技能模板

```bash
/skill-create weather-fetcher
```

**特点**：
- 完全自定义
- 共享给团队
- 可发布复用

---

## 进阶路径

完成 Day 1 后：

| 方向 | 教程 |
|------|------|
| 工作流优化 | [[rpi-workflow]] |
| Agent 团队 | [[agent-teams]] |
| 命令编排 | [[commands]] |
| 技能开发 | [[skills]] |

---

## 相关资源

- [[claude-commands]] — Commands 系统
- [[claude-subagents]] — Sub-agents 系统
- [[claude-skills]] — Skills 系统
- [[day0/README]] — Day 0 安装教程