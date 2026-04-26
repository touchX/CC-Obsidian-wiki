---
name: concepts/global-vs-project-settings
description: Claude Code 全局 vs 项目级设置完整对比 — 作用域层级设计
type: concepts
tags: [settings, architecture, scope, configuration]
created: 2026-03-20
updated: 2026-03-20
sources: 3
---

# Global vs Project-Level Settings

> Claude Code 使用**作用域层级**设计，部分功能仅存在于全局，部分功能可同时存在于两个层级。

## 核心设计原则

- `~/.claude/` 是**用户级主目录**（全局，所有项目共享）
- `.claude/` 是**项目级主目录**（仅该项目）

**设计原则**：*个人状态*或*跨项目协调*放在全局；*团队共享的项目配置*放在项目级。

---

## 全局独有功能

这些功能**仅存在于** `~/.claude/`，不能限定到项目：

| 功能 | 位置 | 用途 |
|------|------|------|
| **Tasks** | `~/.claude/tasks/` | 跨会话和代理的持久化任务列表 |
| **Agent Teams** | `~/.claude/teams/` | 多代理协调配置 |
| **Auto Memory** | `~/.claude/projects/<hash>/memory/` | 每个项目的自动学习记录 |
| **Credentials & OAuth** | System keychain + `~/.claude.json` | API 密钥、OAuth 令牌 |
| **Keybindings** | `~/.claude/keybindings.json` | 自定义键盘快捷键 |
| **MCP User Servers** | `~/.claude.json` (`mcpServers`) | 个人 MCP 服务器 |
| **Preferences/Cache** | `~/.claude.json` | 主题、模型、输出样式 |

---

## 双重作用域功能

这些功能存在于两个层级，**项目级优先于全局**：

| 功能 | 全局 (`~/.claude/`) | 项目 (`.claude/`) | 优先级 |
|------|---------------------|-------------------|--------|
| **CLAUDE.md** | `~/.claude/CLAUDE.md` | `./CLAUDE.md` 或 `.claude/CLAUDE.md` | 项目覆盖全局 |
| **Settings** | `~/.claude/settings.json` | `.claude/settings.json` | 项目 > 全局 |
| **Rules** | `~/.claude/rules/*.md` | `.claude/rules/*.md` | 项目覆盖全局 |
| **Agents/Subagents** | `~/.claude/agents/*.md` | `.claude/agents/*.md` | 项目覆盖全局 |
| **Commands** | `~/.claude/commands/*.md` | `.claude/commands/*.md` | 两者都可用 |
| **Skills** | `~/.claude/skills/` | `.claude/skills/` | 两者都可用 |
| **Hooks** | `~/.claude/hooks/` | `.claude/hooks/` | 两者都执行 |
| **MCP Servers** | `~/.claude.json` (user) | `.mcp.json` (project) | 本地 > 项目 > 用户 |

---

## 设置优先级

用户可写设置按以下顺序覆盖（从高到低）：

| 优先级 | 位置 | 作用域 | 版本控制 | 用途 |
|--------|------|--------|----------|------|
| 1 | 命令行标志 | 会话 | N/A | 单会话覆盖 |
| 2 | `.claude/settings.local.json` | 项目 | 否 (git-ignored) | 个人项目特定 |
| 3 | `.claude/settings.json` | 项目 | 是 (committed) | 团队共享设置 |
| 4 | `~/.claude/settings.local.json` | 用户 | 否 | 个人全局覆盖 |
| 5 | `~/.claude/settings.json` | 用户 | 否 | 全局个人设置 |

---

## 目录结构对比

### 全局作用域 (`~/.claude/`)

```
~/.claude/
├── settings.json              # 用户级设置
├── settings.local.json        # 个人覆盖
├── CLAUDE.md                  # 用户记忆
├── agents/                    # 用户子代理
├── rules/                     # 用户级模块化规则
├── commands/                  # 用户级命令
├── skills/                    # 用户级技能
├── tasks/                     # 全局独有：任务列表
├── teams/                     # 全局独有：Agent 团队
├── projects/                  # 全局独有：项目自动记忆
├── keybindings.json           # 全局独有：键盘快捷键
└── hooks/                    # 用户级钩子

~/.claude.json                 # 全局独有：MCP 服务器、OAuth
```

### 项目作用域 (`.claude/`)

```
.claude/
├── settings.json              # 团队共享设置
├── settings.local.json        # 个人项目覆盖
├── CLAUDE.md                  # 项目记忆
├── agents/                    # 项目子代理
├── rules/                     # 项目级规则
├── commands/                  # 自定义斜杠命令
├── skills/                   # 自定义技能
├── hooks/                    # 项目级钩子
└── plugins/                  # 已安装插件

.mcp.json                     # 项目级 MCP 服务器
```

---

## 设计原则总结

| 类别 | 作用域 | 原因 |
|------|--------|------|
| **协调状态** (tasks, teams) | 仅全局 | 需要超越单个项目持久化 |
| **安全状态** (credentials, OAuth) | 仅全局 | 防止意外提交到版本控制 |
| **个人学习** (auto-memory) | 仅全局 | 用户特定，非团队共享 |
| **输入偏好** (keybindings) | 仅全局 | 用户肌肉记忆，非项目特定 |
| **配置** (settings, rules, agents) | 双重 | 团队需要共享项目行为 |
| **工作流定义** (commands, skills) | 双重 | 可以是个人或团队共享 |

---

## 相关页面

- [[entities/claude-settings]] — 设置系统详解
- [[concepts/context-management]] — 上下文管理策略
- [[entities/claude-hooks]] — Hooks 系统
- [[guides/agent-teams]] — Agent Teams 指南
