---
name: revfactory-harness
description: Claude Code 的 Team-Architecture Factory — 元技能框架，自动生成特定领域智能体团队和专业技能
type: source
tags: [github, html, claude-code, multi-agent, harness, skill-generation, agent-teams]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/revfactory-harness-2026-05-05.json
stars: 3123
language: HTML
license: Apache-2.0
github_url: https://github.com/revfactory/harness
website: https://revfactory.github.io/harness/
---

# Harness — Team-Architecture Factory

> [!tip] Repository Overview
> ⭐ **3,123 Stars** | 🔥 **Claude Code 的元技能框架，自动设计和生成智能体团队**

## 📖 项目介绍

**Harness** 是一个 **Team-Architecture Factory（智能体团队架构工厂）**。只需说一句 `"build a harness for this project"`，插件就会将你的领域描述转化为一个智能体团队和它们使用的专业技能。

### 核心定位

Harness 位于 Claude Code 生态系统的 **L3 Meta-Factory** 层：

| 层级 | 功能 | 相邻项目 |
|------|------|----------|
| **L3 — Meta-Factory / Team-Architecture Factory**（当前） | 领域描述 → 智能体团队 + 技能 | — |
| L3 — Meta-Factory / Runtime-Configuration Factory | 确定性运行时配置 | [coleam00/Archon](https://github.com/coleam00/Archon) |
| L3 — Meta-Factory / Codex Runtime Port | 相同概念，Codex 运行时 | [SaehwanPark/meta-harness](https://github.com/SaehwanPark/meta-harness) |
| L2 — Cross-Harness Workflow | 跨 Harness 的标准化技能/规则/钩子 | [affaan-m/ECC](https://github.com/affaan-m/everything-claude-code) |

## 🏗️ 技术架构

### 架构模式（6 种）

| 模式 | 描述 | 适用场景 |
|------|------|----------|
| **Pipeline** | 顺序依赖任务 | 线性工作流 |
| **Fan-out/Fan-in** | 并行独立任务 | 批量处理 |
| **Expert Pool** | 上下文相关的选择性调用 | 多专家协作 |
| **Producer-Reviewer** | 生成后质量审查 | 代码审查 |
| **Supervisor** | 中央智能体动态分发任务 | 协调调度 |
| **Hierarchical Delegation** | 自上而下的递归委托 | 分层管理 |

### 工作流程（6 阶段）

```
Phase 1: 领域分析 (Domain Analysis)
    ↓
Phase 2: 团队架构设计 (Agent Teams vs Subagents)
    ↓
Phase 3: 智能体定义生成 (.claude/agents/)
    ↓
Phase 4: 技能生成 (.claude/skills/)
    ↓
Phase 5: 集成与编排 (Integration & Orchestration)
    ↓
Phase 6: 验证与测试 (Validation & Testing)
```

### 插件结构

```
harness/
├── .claude-plugin/
│   └── plugin.json              # 插件清单
├── skills/
│   └── harness/
│       ├── SKILL.md             # 主技能定义（6 阶段工作流）
│       └── references/
│           ├── agent-design-patterns.md    # 6 种架构模式
│           ├── orchestrator-template.md    # 团队/子智能体编排模板
│           ├── team-examples.md            # 5 个真实团队配置
│           ├── skill-writing-guide.md      # 技能编写指南
│           ├── skill-testing-guide.md      # 测试与评估方法论
│           └── qa-agent-guide.md          # QA 智能体集成指南
└── README.md
```

### 进化机制

Harness 具有**进化机制**，将使用中的反馈（什么有效/什么无效）反馈到工厂，下一代会显著改进：

```
初始 harness ──▶ 实际项目使用 ──▶ 交付的 harness
                                          │
                                          ▼ (通过 /harness:evolve 捕获 delta)
                                    ┌───────────────┐
                                    │   工厂       │◀── 更好的下一代草案
                                    └───────────────┘
```

## 📦 安装

### 方式一：通过 Marketplace 安装

```bash
# 添加 marketplace
/plugin marketplace add revfactory/harness

# 安装插件
/plugin install harness@harness
```

### 方式二：直接安装为全局技能

```bash
# 将 skills 目录复制到 ~/.claude/skills/harness/
cp -r skills/harness ~/.claude/skills/harness
```

## 🚀 使用方法

### 触发方式

在 Claude Code 中使用以下提示词触发：

```
Build a harness for this project
Design an agent team for this domain
Set up a harness
```

### 执行模式

| 模式 | 描述 | 推荐场景 |
|------|------|----------|
| **Agent Teams**（默认） | TeamCreate + SendMessage + TaskCreate | 需要协作的 2+ 智能体 |
| **Subagents** | 直接 Agent 工具调用 | 一次性任务，无需智能体间通信 |

## 💡 使用案例

### 深度研究
```
Build a harness for deep research. I need an agent team that can investigate
any topic from multiple angles — web search, academic sources, community
sentiment — then cross-validate findings and produce a comprehensive report.
```

### 网站开发
```
Build a harness for full-stack website development. The team should handle
design, frontend (React/Next.js), backend (API), and QA testing in a
coordinated pipeline from wireframe to deployment.
```

## 📁 生成的文件

Harness 生成的文件结构：

```
your-project/
├── .claude/
│   ├── agents/          # 智能体定义文件
│   │   ├── analyst.md
│   │   ├── builder.md
│   │   └── qa.md
│   └── skills/          # 技能文件
│       ├── analyze/
│       │   └── SKILL.md
│       └── build/
│           ├── SKILL.md
│           └── references/
```

## 🎯 核心特性

| 特性 | 说明 |
|------|------|
| **智能体团队设计** | 6 种架构模式：Pipeline、Fan-out/Fan-in、Expert Pool、Producer-Reviewer、Supervisor、Hierarchical Delegation |
| **技能生成** | 自动生成带渐进式披露（Progressive Disclosure）的技能，高效管理上下文 |
| **编排** | 智能体间数据传递、错误处理和团队协调协议 |
| **验证** | 触发验证、试运行测试、有技能 vs 无技能对比测试 |

## 🌐 相关链接

| 资源 | 链接 |
|------|------|
| **GitHub 仓库** | https://github.com/revfactory/harness |
| **官网** | https://revfactory.github.io/harness/ |
| **版本** | v1.2.0 |

## 🏷️ 技术标签

`claude-code` `claude-code-plugin` `harness` `harness-engineering` `agentic-coding` `ai-agents` `multi-agent-systems` `vibe-coding`
