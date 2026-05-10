---
name: zhaono1-agent-playbook
description: Agent Playbook - AI Agent 实用指南、提示词和技能集合，支持 Claude Code/Codex/Gemini
type: source
tags: [github, javascript, claude-code, agent, skills, workflow, prompts, mcp]
created: 2026-05-08
updated: 2026-05-08
source: ../../../archive/resources/github/zhaono1-agent-playbook-2026-05-08.json
language: JavaScript
license: null
github_url: https://github.com/zhaono1/agent-playbook
---

# Agent Playbook

> [!info] Repository Overview
> **Agent Playbook** 是一个 AI Agent 实用指南、提示词和技能的集合。为 Claude Code、Codex 和 Gemini 提供可复用的技能、工作流文档和工具。

## 📊 仓库统计

| 指标 | 数值 |
|------|------|
| ⭐ Stars | 51 |
| 🍴 Forks | 8 |
| 💻 语言 | JavaScript |
| 📅 创建时间 | 2026-01-10 |
| 🔗 链接 | [github.com/zhaono1/agent-playbook](https://github.com/zhaono1/agent-playbook) |

## 🎯 核心价值

### 项目概述

这是一个收集 AI Agent 实用构建模块的仓库：
- **可复用技能**：聚焦的 `SKILL.md` 文件和深入的 `references/` 材料
- **安装工具**：通过 `@codeharbor/agent-playbook` 实现生命周期管理
- **MCP 服务器**：用于技能发现的 MCP 服务器
- **工作流文档**：规划、自我改进、自动化和上下文设计

### 设计原则

仓库围绕以下可移植的 Agent 设计规则演进：

| 原则 | 说明 |
|------|------|
| **硬约束常开但简短** | 保持硬约束始终开启，但保持简短 |
| **将可复用方法转为技能** | Turn reusable methods into skills |
| **从 references 和 docs 中检索细节** | Keep detailed facts retrievable |
| **持久化长时间任务状态** | 持久化到聊天外部，使恢复可靠 |

## 🚀 安装方式

### 方式一：一键安装器（PNPM/NPM）

```bash
# 最简单的方式
pnpm dlx @codeharbor/agent-playbook init
# 或
npm exec -- @codeharbor/agent-playbook init

# 项目级安装
pnpm dlx @codeharbor/agent-playbook init --project
```

### 方式二：符号链接（推荐）

```bash
# 创建到全局技能目录的符号链接
ln -s /path/to/agent-playbook/skills/* ~/.claude/skills/
ln -s /path/to/agent-playbook/skills/* ~/.codex/skills/
ln -s /path/to/agent-playbook/skills/* ~/.gemini/skills/
```

### 方式三：复制技能

```bash
cp -r /path/to/agent-playbook/skills/* ~/.claude/skills/
cp -r /path/to/agent-playbook/skills/* ~/.codex/skills/
cp -r /path/to/agent-playbook/skills/* ~/.gemini/skills/
```

### 方式四：项目级技能

```bash
mkdir -p .claude/skills .codex/skills .gemini/skills
cp -r /path/to/agent-playbook/skills/* .claude/skills/
cp -r /path/to/agent-playbook/skills/* .codex/skills/
cp -r /path/to/agent-playbook/skills/* .gemini/skills/
```

## 🛠️ Skills 目录

### Meta Skills（元技能）

| 技能 | 说明 | 自动触发 |
|------|------|---------|
| **skill-router** | 智能路由请求到最合适的技能 | Manual |
| **create-pr** | 创建 PR，自动更新双语文档 | 技能更新后 |
| **session-logger** | 保存对话历史到会话日志文件 | 任何技能后自动 |
| **auto-trigger** | 定义技能间的自动触发关系 | Config only |
| **workflow-orchestrator** | 协调多技能工作流 | Auto |
| **self-improving-agent** | 从所有技能经验中学习的自我改进 | Background |

### Core Development（核心开发）

| 技能 | 说明 | 自动触发 |
|------|------|---------|
| **commit-helper** | 遵循 Conventional Commits 规范的 Git 提交 | Manual |
| **code-reviewer** | 质量、安全和最佳实践的全面代码审查 | Manual / After implementation |
| **debugger** | 系统性调试和问题解决 | Manual |
| **refactoring-specialist** | 代码重构和技术债务减少 | Manual |

### Documentation & Testing（文档与测试）

| 技能 | 说明 | 自动触发 |
|------|------|---------|
| **documentation-engineer** | 技术文档和 README 创建 | Manual |
| **api-documenter** | OpenAPI/Swagger API 文档 | Manual |
| **test-automator** | 自动化测试框架设置和测试创建 | Manual |
| **qa-expert** | 质量保证策略和质量门控 | Manual |

### Architecture & DevOps（架构与运维）

| 技能 | 说明 | 自动触发 |
|------|------|---------|
| **api-designer** | REST 和 GraphQL API 架构设计 | Manual |
| **security-auditor** | 涵盖 OWASP Top 10 的安全审计 | Manual |
| **performance-engineer** | 性能优化和分析 | Manual |
| **deployment-engineer** | CI/CD 流水线部署自动化 | Manual |

### Planning & Architecture（规划与架构）

| 技能 | 说明 | 自动触发 |
|------|------|---------|
| **prd-planner** | 使用持久化文件创建 PRD | Manual (keyword: "PRD") |
| **prd-implementation-precheck** | 实现 PRD 前的预检审查 | Manual |
| **architecting-solutions** | 技术方案和架构设计 | Manual (keyword: "design solution") |
| **planning-with-files** | 多步骤任务的通用文件规划 | Manual |
| **long-task-coordinator** | 协调多会话或委托工作的持久化状态和恢复规则 | Manual |

### Design & Creative（设计与创意）

| 技能 | 说明 | 自动触发 |
|------|------|---------|
| **figma-designer** | 分析 Figma 设计，生成带视觉规格的实施就绪 PRD | Manual (Figma URL) |

## ⚙️ 自动触发机制

### 工作原理

技能可以在完成后自动触发其他技能，形成工作流：

```
┌──────────────┐
│  prd-planner │ 完成
└──────┬───────┘
       │
       ├──→ self-improving-agent (background) → 从 PRD 模式中学习
       │         └──→ create-pr (ask first) ──→ session-logger (auto)
       │
       └──→ session-logger (auto)
```

### 触发模式

| 模式 | 行为 |
|------|------|
| `auto` | 立即执行，阻塞直到完成 |
| `background` | 非阻塞运行，不等待结果 |
| `ask_first` | 执行前询问用户 |

## 📋 工作流示例

### 完整 PRD 到实施流程

```
用户: "Create a PRD for user authentication"
       ↓
prd-planner 执行
       ↓
阶段完成 → 自动触发:
       ├──→ self-improving-agent (background) - 提取模式
       └──→ session-logger (auto) - 保存会话
       ↓
用户: "Implement this PRD"
       ↓
prd-implementation-precheck → implementation
       ↓
code-reviewer → self-improving-agent → create-pr
```

### Skills Manager

使用本地技能管理器检查和管理跨项目和全局范围的技能：

```bash
apb skills list --scope both --target all
apb skills add ./skills/my-skill --scope project --target claude
```

`apb` 是 `agent-playbook` 的短别名。

## 🌐 平台支持

| 平台 | 技能安装 | Hooks/配置自动化 | 当前状态 |
|------|---------|-----------------|---------|
| **Claude Code** | ✅ | 安装 SessionEnd 和 PostToolUse hooks | Full |
| **Codex** | ✅ | 写入 `agent_playbook` 元数据块到 `~/.codex/config.toml` | Partial |
| **Gemini** | ✅ | 尚无 hook 接入 | Skill 分发 |

## 📚 AI Agent 学习路径

**[docs/ai-agent-learning-path.md](./docs/ai-agent-learning-path.md)** — 为 Claude、GLM 和 Codex 构建 Agent 的渐进式学习路径：

| 级别 | 主题 | 时间 | 成果 |
|------|------|------|------|
| 1 | Prompt 工程基础 | 1 周 | 完成单任务工作流 |
| 2 | 技能开发 | 1 周 | 发布第一个可复用技能 |
| 3 | 工作流编排 | 2 周 | 构建完整的自动化工作流 |
| 4 | 自学习系统 | 2-3 周 | 创建从经验中学习的 Agent |
| 5 | 自我进化 Agent | 2-3 周 | 构建更自主的改进循环 |

## 📁 项目结构

```
agent-playbook/
├── prompts/       # 提示词模板和示例
├── skills/        # 自定义技能文档
├── docs/          # 自动化最佳实践和示例
├── mcp-server/    # 技能发现的 MCP 服务器
└── README.md      # 项目文档
```

## 🔗 相关资源

| 资源 | 链接 |
|------|------|
| **GitHub 仓库** | [zhaono1/agent-playbook](https://github.com/zhaono1/agent-playbook) |
| **@codeharbor/agent-playbook** | npm 包 |
| **完整工作流示例** | [docs/complete-workflow-example.md](https://github.com/zhaono1/agent-playbook/blob/main/docs/complete-workflow-example.md) |
| **AI Agent 学习路径** | [docs/ai-agent-learning-path.md](https://github.com/zhaono1/agent-playbook/blob/main/docs/ai-agent-learning-path.md) |
| **上下文分层** | [docs/context-layering-for-agent-playbooks.md](https://github.com/zhaono1/agent-playbook/blob/main/docs/context-layering-for-agent-playbooks.md) |

## 🔮 与本项目的关联

本项目（Claude Code Best Practice）与 Agent Playbook 有以下相似之处：

| 方面 | Agent Playbook | 本项目 |
|------|---------------|--------|
| **技能系统** | 25+ 可复用技能 | Wiki 知识管理 + Skills |
| **自我改进** | self-improving-agent | Memory Hub + 记忆系统 |
| **工作流编排** | workflow-orchestrator | Wiki 工作流（Ingest/Query/Lint） |
| **PRD 规划** | prd-planner | GSD Agents 工作流 |

---

*最后更新: 2026-05-08*
*数据来源: GitHub README + 官方文档*
*AI Agent 实用指南和技能集合*