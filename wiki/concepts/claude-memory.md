---
name: concepts/claude-memory
description: CLAUDE.md 与自动记忆详解：持久指令与跨会话学习机制
type: concept
tags: [memory, context, claude-md, auto-memory]
created: 2026-04-26
updated: 2026-04-27
source: ../../archive/cc-doc/Claude 如何记住你的项目.md
---

# Claude Memory

## 概述

每个 Claude Code 会话都从一个全新的上下文窗口开始。两种机制可以跨会话传递知识：

- **CLAUDE.md 文件** — 你编写的持久指令
- **自动记忆** — Claude 根据你的更正和偏好自动编写的笔记

## CLAUDE.md 与自动记忆对比

| | CLAUDE.md | 自动记忆 |
|---|-----------|----------|
| **谁编写** | 你 | Claude |
| **包含内容** | 指令和规则 | 学习和模式 |
| **范围** | 项目、用户或组织 | 每个工作树 |
| **加载到** | 每个会话（前 200 行或 25KB） |
| **用于** | 编码标准、工作流、项目架构 | 构建命令、调试见解、偏好 |

## CLAUDE.md 文件

### 何时添加

将 CLAUDE.md 视为"你本来会重新解释的内容"：
- Claude 第二次犯同样的错误
- 代码审查发现 Claude 应该了解的内容
- 你在聊天中输入的相同更正是你上个会话输入的
- 新队友需要相同的上下文

### 文件位置与优先级

| 范围 | 位置 | 目的 |
|------|------|------|
| **托管策略** | `C:\Program Files\ClaudeCode\CLAUDE.md` | IT/DevOps 管理的组织范围指令 |
| **项目指令** | `./CLAUDE.md` 或 `./.claude/CLAUDE.md` | 项目团队共享指令 |
| **用户指令** | `~/.claude/CLAUDE.md` | 所有项目的个人偏好 |
| **本地指令** | `./CLAUDE.local.md` | 个人项目偏好（添加到 .gitignore） |

**加载顺序**：从当前目录向上遍历，子目录中的文件按需加载。更具体的位置优先。

### 编写有效的 CLAUDE.md

| 原则 | 说明 |
|------|------|
| **大小** | 目标 200 行以下；超过会降低遵循度 |
| **结构** | 使用标题和项目符号；Claude 扫描结构与读者相同 |
| **具体性** | "使用 2 空格缩进" 而非 "正确格式化代码" |
| **一致性** | 避免相互矛盾的规则；定期审查删除过时指令 |

### 路径范围规则

使用 YAML frontmatter 的 `paths` 字段将规则范围限定到特定文件：

```markdown
---
paths:
  - "src/api/**/*.ts"
---

# API 开发规则

- 所有 API 端点必须包括输入验证
- 使用标准错误响应格式
```

### 导入其他文件

```markdown
See @README.md for overview and @package.json for npm commands.
```

## 自动记忆

自动记忆让 Claude 跨会话积累知识，无需你编写内容。Claude 保存构建命令、调试见解、架构笔记、代码样式偏好。

### 存储位置

```
~/.claude/projects/<project>/memory/
├── MEMORY.md          # 索引，每个会话加载
├── debugging.md       # 详细笔记
└── ...
```

**限制**：MEMORY.md 前 200 行或 25KB 在会话开始时加载。详细笔记按需读取。

### 启用/禁用

```json
{ "autoMemoryEnabled": false }
```

或环境变量：`CLAUDE_CODE_DISABLE_AUTO_MEMORY=1`

## 使用 /memory

`/memory` 命令：
- 列出加载的 CLAUDE.md、CLAUDE.local.md 和规则文件
- 切换自动记忆开/关
- 提供打开记忆文件夹的链接

## 故障排除

| 问题 | 解决方案 |
|------|----------|
| Claude 不遵循 CLAUDE.md | 使指令更具体；检查文件是否在正确位置 |
| 不知道自动记忆保存了什么 | 运行 `/memory` 浏览记忆文件夹 |
| CLAUDE.md 太大 | 使用路径范围规则；将参考内容移到 skills |
| `/compact` 后指令丢失 | 仅对话的指令在压缩后丢失；添加到 CLAUDE.md 使其持久化 |

## 相关页面

- [[claude-settings]] — 设置详解
- [[context-window]] — 上下文窗口原理
- [[claude-skills]] — Skills 系统
- [[claude-directory]] — .claude 目录结构

## 来源

- [Claude 如何记住你的项目](https://code.claude.com/docs/zh-CN/memory) — 官方文档