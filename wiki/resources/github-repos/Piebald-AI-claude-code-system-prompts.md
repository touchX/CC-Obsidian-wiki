---
name: Piebald-AI-claude-code-system-prompts
description: All parts of Claude Code's system prompt - builtin tool descriptions, sub agent prompts, utility prompts. Updated for each Claude Code version.
type: source
tags: [github, javascript, claude-code, system-prompts, prompt-engineering]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/Piebald-AI-claude-code-system-prompts-2026-05-05.md
stars: 9926
language: JavaScript
license: mit
github_url: https://github.com/Piebald-AI/claude-code-system-prompts
---

# Claude Code System Prompts

> [!tip] Repository Overview
> ⭐ **9926 Stars** | 🔥 **All parts of Claude Code's system prompt**

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [Piebald-AI/claude-code-system-prompts](https://github.com/Piebald-AI/claude-code-system-prompts) |
| **Stars** | ⭐ 9926 |
| **语言** | JavaScript |
| **许可证** | MIT License |
| **创建时间** | 2025-11-18 |
| **更新时间** | 2026-05-05 |
| **Fork 数** | 1771 |

## 项目介绍

这是一个收录 Claude Code 所有系统提示词的权威仓库，由 [Piebald.ai](https://piebald.ai/) 团队维护。

### 核心定位

- **系统提示词全集**：包含 Claude Code 内置工具描述、子代理提示词（Plan/Explore/Task）、工具提示词
- **版本跟踪**：记录了从 v2.0.14 至今 168 个版本的系统提示词变更（CHANGELOG.md）
- **社区资源**：被 Awesome Claude Code 列表收录

### 解决的问题

1. **透明度**：让用户深入了解 Claude Code 行为机制
2. **定制基础**：为创建自定义 agent 和工具提供参考
3. **版本追踪**：跟踪 Claude Code 每次更新的系统提示词变化

## 技术架构

### 仓库结构

```
claude-code-system-prompts/
├── README.md           # 主说明文档
├── CHANGELOG.md        # 168 个版本的变更记录
├── prompts/
│   ├── CLAUDE.md/              # CLAUDE.md 模板提示词
│   ├── compact/                 # 上下文压缩提示词
│   ├── statusline/             # 状态栏提示词
│   ├── magic docs/              # 魔法文档提示词
│   ├── WebFetch/               # WebFetch 工具提示词
│   ├── Bash cmd/               # Bash 命令提示词
│   ├── security review/        # 安全审查提示词
│   ├── agent creation/         # Agent 创建提示词
│   ├── builtin tools/          # 内置工具描述（24 个）
│   ├── subagents/              # 子代理提示词
│   │   ├── Plan/
│   │   ├── Explore/
│   │   └── Task/
│   └── system reminders/       # ~40 个系统提醒
└── package.json
```

### 核心组件

| 组件 | 说明 |
|------|------|
| **内置工具描述** | 24 个 builtin tool 的完整描述 |
| **子代理提示词** | Plan、Explore、Task 三个子代理的系统提示词 |
| **工具提示词** | CLAUDE.md、compact、statusline、magic docs 等 |
| **系统提醒** | Claude Code 运行时显示的 ~40 个系统提醒 |
| **CHANGELOG** | 详细的版本历史记录 |

## 安装与使用

### 基本使用

```bash
# 克隆仓库
git clone https://github.com/Piebald-AI/claude-code-system-prompts.git

# 查看最新版本
cd claude-code-system-prompts
cat prompts/subagents/Plan/SKILL.md

# 查看版本变更
cat CHANGELOG.md
```

### 使用场景

1. **学习 Claude Code 机制**：阅读系统提示词理解 AI 行为
2. **开发 Claude 工具**：参考内置工具描述创建自定义工具
3. **创建自定义 Agent**：基于子代理提示词构建自己的 agent
4. **调试和追踪**：对比不同版本的系统提示词变化

## 使用案例

### 案例 1：理解 Plan Agent 行为

```bash
# 查看 Plan agent 的完整系统提示词
cat prompts/subagents/Plan/SKILL.md

# 了解它如何分解任务、调用工具
```

### 案例 2：创建自定义 Agent

参考 `prompts/subagents/` 下的提示词模板，创建一个专门用于代码审查的 agent：

```javascript
const systemPrompt = {
  name: "code-reviewer",
  description: "專門進行代碼審查的 Agent",
  instructions: readFileSync("prompts/subagents/Task/SKILL.md", "utf-8")
  // 添加自定義規則...
}
```

### 案例 3：追踪 Claude Code 更新

查看 CHANGELOG.md 了解每次 Claude Code 更新带来的系统提示词变化：

```bash
# 查看最近的变更
tail -100 CHANGELOG.md

# 对比两个版本的差异
diff prompts/builtin-tools/TODO.md version-168/ prompts/builtin-tools/TODO.md
```

## 核心特性

- **完整性**：收录 Claude Code 所有系统提示词，无遗漏
- **版本追踪**：168 个版本的 CHANGELOG，了解每次更新
- **分类清晰**：按功能模块组织，便于查找
- **社区认可**：被 Awesome Claude Code 列为推荐资源
- **活跃维护**：跟随 Claude Code 最新版本持续更新

## 相关链接

- [GitHub 仓库](https://github.com/Piebald-AI/claude-code-system-prompts)
- [Piebald.ai 官网](https://piebald.ai)
- [Awesome Claude Code](https://github.com/hesreallyhim/awesome-claude-code)
- [Discord 社区](https://piebald.ai/discord)
- [X @PiebaldAI](https://x.com/PiebaldAI)
