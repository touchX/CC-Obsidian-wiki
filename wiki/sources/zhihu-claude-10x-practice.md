---
name: sources/zhihu-claude-10x-practice
description: 知乎文章：.claude 配置实战指南，揭秘为何别人用 Claude 比你强10倍
type: source
tags: [zhihu, claude, configuration, .claude, rules, hooks, skills, agents]
created: 2026-05-01
updated: 2026-05-01
source: ../../archive/zhihu/这个周末我研究了 .claude，终于知道为什么别人用 Claude 比我强10倍.md
---

# .claude 配置实战：为何别人用 Claude 比你强10倍

> 来源：[知乎 - 这个周末我研究了 .claude，终于知道为什么别人用 Claude 比我强10倍](https://zhuanlan.zhihu.com/p/2031875168843329845)

## 核心观点

大多数 Claude Code 用户把 `.claude` 文件夹当作一个"黑盒"。他们知道它的存在，也见过它出现在项目根目录中，但从未打开过，更别说理解里面每个文件的作用。

**这其实错失了一个很大的机会。**

`.claude` 文件夹是控制 Claude 在你的项目中如何行为的核心中枢。一旦你弄清楚每个内容的位置及其作用，你就可以将 Claude Code 配置成完全符合团队需求的样子。

## 两个文件夹架构

存在**两个** `.claude` 目录：

```
project/.claude/     # 项目级：团队配置，提交到 Git
~/.claude/          # 全局：个人偏好和本机状态
```

## CLAUDE.md：Claude 的说明手册

这是整个系统中**最重要**的文件。Claude Code 会话启动时，首先读取的就是 CLAUDE.md，并将其直接加载进系统提示中。

**简单来说：你在 CLAUDE.md 里写什么，Claude 就会遵循什么。**

### CLAUDE.md 中应该写什么

#### 可以写
- 构建、测试和 lint 命令（如 `npm run test`、`make build` 等）
- 关键架构决策（例如"我们使用基于 Turborepo 的 monorepo"）
- 不明显的注意事项（例如"启用了 TypeScript 严格模式"）
- 导入规范、命名模式、错误处理风格
- 主要模块的文件和目录结构

#### 不要写
- 本应写在 linter 或 formatter 配置里的内容
- 已经可以通过链接获取的完整文档
- 大段理论性解释

**将 CLAUDE.md 控制在 200 行以内。** 文件太长会占用过多上下文，反而降低 Claude 对指令的遵循效果。

### 局部覆盖：CLAUDE.local.md

创建 `CLAUDE.local.md` 可以存放个人偏好，该文件会被自动 gitignored，不会提交到仓库。

## rules/ 文件夹：模块化指令系统

随着团队规模扩大，CLAUDE.md 很容易变成 300 行的"没人维护"文件。

**rules/ 文件夹**正是为了解决这个问题：

```
.claude/rules/
├── code-style.md
├── testing.md
├── api-conventions.md
└── security.md
```

### 按路径生效的规则

真正强大的功能是"路径作用域"——可以在规则文件中添加 YAML frontmatter，让规则只在特定路径下生效：

```yaml
---
paths:
  - "src/api/**/*.ts"
  - "src/handlers/**/*.ts"
---
# API 设计规则

- 所有处理器返回 { data, error } 结构
- 使用 zod 进行请求体校验
```

当 Claude 在编辑 React 组件时，它不会加载这个文件；只有在处理 `src/api/` 或 `src/handlers/` 下的文件时才会启用这些规则。

## Hooks 系统：确定性控制

CLAUDE.md 中的指令是"建议"，大多数时候会遵守，但并非每一次都绝对执行。

**Hooks 可以让这些行为变得"确定"。**

### 退出码规则（关键！）

| 退出码 | 含义 | 效果 |
|--------|------|------|
| 0 | 成功 | 继续执行 |
| 1 | 报错 | **不阻止执行** |
| 2 | 阻止 | 阻止执行，返回 stderr 给 Claude |

**最常犯的错误**：在安全类 hook 中使用 exit 1——这只会记录错误日志，但不会真正阻止操作。

### 常用 Hook 类型

| Hook | 触发时机 | 常见用途 |
|------|---------|---------|
| PreToolUse | 工具执行前 | 安全关卡、拦截危险命令 |
| PostToolUse | 工具成功后 | 自动格式化、lint |
| Stop | Claude 完成任务时 | 质量检查、必须通过测试 |
| UserPromptSubmit | 提交提示时 | 提示词校验 |
| SessionStart/End | 会话开始/结束时 | 注入上下文、清理环境 |

### Matcher 语法

```json
{
  "matcher": "Write|Edit|MultiEdit"  // 匹配文件修改
}
```

## skills/ 文件夹：可复用工作流

Skills 是 Claude 可以根据上下文**自动调用**的工作流：

```
.claude/skills/
├── security-review/
│   ├── SKILL.md
│   └── DETAILED_GUIDE.md
└── deploy/
    ├── SKILL.md
    └── templates/
```

与 commands 的关键区别：
- **commands**：单个文件
- **skills**：可以打包多个辅助文件

## agents/ 文件夹：专用子代理

当任务复杂到需要"专家"处理时，可以定义子代理（subagent）：

```yaml
---
name: code-reviewer
description: 代码审查专家
model: sonnet
tools: Read, Grep, Glob
---
```

**tools 字段用于权限控制**——安全审计 agent 只需要读取权限。

**model 字段用于成本优化**：
- Haiku：适合快速只读分析
- Sonnet/Opus：用于复杂任务

## settings.json：权限与配置

```json
{
  "permissions": {
    "allow": [
      "Bash(npm run *)",
      "Bash(git status)",
      "Bash(git diff *)",
      "Read", "Write", "Edit", "Glob", "Grep"
    ],
    "deny": [
      "Bash(rm -rf *)",
      "Bash(curl *)",
      "Read(./.env)",
      "Read(./.env.*)"
    ]
  }
}
```

使用 `.claude/settings.local.json` 存放个人权限配置，会被自动 gitignored。

## 实用入门配置流程

### Step 1
在 Claude Code 中运行 `/init` 自动生成初始 CLAUDE.md，然后精简成核心内容

### Step 2
创建 `.claude/settings.json` 至少含权限配置

### Step 3
创建 1-2 个常用 commands（比如代码审查、修复 issue）

### Step 4
当 CLAUDE.md 变臃肿时，拆分到 `.claude/rules/`，并按路径作用域管理

### Step 5
创建 `~/.claude/CLAUDE.md` 写个人偏好

## 总结

**.claude 文件夹本质上是一套"协议"，告诉 Claude：**

- **你是谁**（你的习惯）
- **项目是做什么的**（架构与规则）
- **应该遵守哪些约束**（权限与流程）

**优先把 CLAUDE.md 写好。这是杠杆最高的部分，其它都是优化。**

从简单开始，逐步迭代，把它当作项目基础设施的一部分来维护。

## 相关 Wiki 页面

- [[guides/claude-directory]] - .claude 目录结构详解
- [[guides/claude-md-configuration-guide]] - CLAUDE.md 配置指南
- [[guides/claude-hooks-configuration-guide]] - Hooks 高级配置
- [[entities/claude-skills]] - Skills 系统
- [[entities/claude-subagents]] - Subagents 系统
