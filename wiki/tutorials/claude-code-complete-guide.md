---
name: tutorials/claude-code-complete-guide
description: Claude Code 从 0 到 1 全攻略 — MCP、SubAgent、Agent Skill、Hook、图片处理、上下文管理完整教程
type: tutorial
tags: [tutorial, claude-code, mcp, subagent, agent-skill, hook, background-task, context]
created: 2026-05-04
updated: 2026-05-04
source: ../../archive/clippings/bilibili/2026-05-04-claude-code-complete-guide/原始字幕.md
related:
  - "[[tutorials/mcp-basics]]"
  - "[[tutorials/mcp-advanced]]"
  - "[[entities/claude-auto-mode]]"
  - "[[concepts/claude-memory]]"
  - "[[concepts/context-management]]"
  - "[[concepts/claude-hooks-guide]]"
---

# Claude Code 从 0 到 1 全攻略

基于马克的技术工作坊视频教程，BVID: BV14rzQB9EJj，时长 44:43 分钟。

## 课程概述

本教程系统讲解 Claude Code 从入门到进阶的核心功能，适合希望将 AI 编程工具落地到生产环境的开发者。

**学习目标**：
1. 掌握 Claude Code 三种模式及其切换方法
2. 学会使用后台任务、版本回滚等进阶功能
3. 集成 MCP Server 实现多工具协作
4. 配置 Hook、Agent Skill、SubAgent 实现自动化工作流

## 三种运行模式

Claude Code 支持三种运行模式，通过 `Shift+Tab` 循环切换：

| 模式 | 状态显示 | 行为特点 |
|------|----------|----------|
| **默认模式** | 显示 `? For shortcuts` | 每次操作前询问用户，最谨慎 |
| **自动模式** | 显示 `Accept edits on` | 自动执行文件操作，最方便 |
| **规划模式** | 显示 `Plan mode` | 只讨论方案不执行，适合构思 |

### 模式切换操作

```
Shift+Tab    — 循环切换三种模式
!            — 进入 Bash 模式，执行终端命令
Ctrl+G       — 打开 VS Code 标签页编辑（需安装 VS Code）
```

### Shift+Enter 换行

在终端输入多行内容时，使用 `Shift+Enter` 换行，回车会直接提交。

## 权限系统

### 三种授权选项

| 选项 | 作用范围 |
|------|----------|
| Yes | 单次授权，只允许当前操作 |
| Yes, allow all edits this session | 本次会话内所有编辑自动通过 |
| No | 拒绝，请求 Claude 重新生成 |

### dangerously-skip-permissions

使用 `--dangerously-skip-permissions` 参数跳过所有权限检测，适合自动化脚本场景。

```bash
claude --dangerously-skip-permissions "执行复杂任务"
```

## 后台任务管理

### 基本操作

| 操作 | 命令/快捷键 |
|------|-------------|
| 后台运行 | `Ctrl+B` |
| 查看任务 | `/tasks` |
| 关闭服务 | `K` |

### 使用场景

- 长时间运行的服务（开发服务器、构建进程）
- 需要并行处理多个任务
- 避免占用主会话上下文

## 版本回滚 (Rewind)

### 触发方式

| 方式 | 操作 |
|------|------|
| 命令 | `/rewind` |
| 快捷键 | 按两下 `ESC` |

### 限制条件

> [!warning] 重要限制
> 只能回滚 Claude Code 写入的文件，无法回滚用户手动修改或外部工具修改的文件。

### 使用场景

- 发现 Claude 的修改不符合预期
- 需要回到之前的代码版本
- 撤销错误的批量修改

## 图片处理

### 导入方式

| 方式 | 操作 |
|------|------|
| 拖拽 | 将图片拖入 Claude Code 窗口 |
| 粘贴 | `Ctrl+V` 粘贴剪贴板中的图片 |

### 应用场景

- 设计稿还原（配合 MCP 使用）
- Bug 报告附图
- 文档插图

## MCP Server 集成

### 安装流程（以 Figma 为例）

1. 在 Claude Code 中安装 MCP server
2. 配置 Figma API 访问权限
3. 使用 MCP 工具读取设计稿
4. 根据设计稿生成代码

### MCP 核心概念

| 概念 | 说明 |
|------|------|
| **Server** | 提供特定功能的 MCP 服务 |
| **Tools** | MCP server 暴露的工具函数 |
| **Resources** | MCP server 提供的静态资源 |

### 相关教程

- [[tutorials/mcp-basics]] — MCP 协议基础
- [[tutorials/mcp-advanced]] — MCP 高级应用

## 上下文管理

### 压缩与清除

| 命令 | 功能 |
|------|------|
| `/compact` | 压缩上下文，减少 token 占用 |
| `/clear` | 清空所有上下文，重新开始 |

### 触发时机

- 上下文使用率达到 60-70% 时自动提示
- `/compact` 可手动触发

### 项目记忆文件

详见 [[concepts/claude-memory]] 和 [[concepts/context-management]]。

## CLAUDE.md 配置

### 文件位置与优先级

| 范围 | 位置 | 用途 |
|------|------|------|
| 组织级 | `C:\Program Files\ClaudeCode\CLAUDE.md` | IT 托管的组织指令 |
| 项目级 | `./CLAUDE.md` 或 `./.claude/CLAUDE.md` | 项目团队共享 |
| 用户级 | `~/.claude/CLAUDE.md` | 个人偏好 |
| 本地级 | `./CLAUDE.local.md` | 本地偏好（gitignore） |

### 路径范围规则

```markdown
---
paths:
  - "src/api/**/*.ts"
---

# API 开发规则
- 所有端点必须包含输入验证
- 使用标准错误响应格式
```

### 有效编写原则

| 原则 | 说明 |
|------|------|
| 大小 | 目标 200 行以下 |
| 结构 | 使用标题和项目符号 |
| 具体性 | 明确指令而非模糊描述 |
| 一致性 | 避免相互矛盾的规则 |

## Hook 系统

### 配置文件级别

| 级别 | 位置 |
|------|------|
| 本地 | `./.claude/hooks.json` |
| 项目 | `./.claude/.claude/hooks.json` |
| 用户 | `~/.claude/settings.json` |

### 钩子类型

| 类型 | 触发时机 | 用途 |
|------|----------|------|
| **PreToolUse** | 工具执行前 | 验证、参数修改 |
| **PostToolUse** | 工具执行后 | 自动格式化、检查 |
| **Stop** | 会话结束时 | 最终验证 |

### 配置示例

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "name": "prettier",
        "matchers": ["*.ts", "*.js"],
        "action": "format"
      }
    ]
  }
}
```

详见 [[concepts/claude-hooks-guide]]。

## Agent Skill

### 与 Hook 的区别

| 特性 | Hook | Agent Skill |
|------|------|-------------|
| **触发时机** | 工具事件 | 用户请求 |
| **用途** | 自动化处理 | 扩展能力 |
| **加载方式** | 配置文件 | 动态加载 |

### 存储位置

```
~/.claude/skills/
├── skill-name/
│   ├── SKILL.md      # Skill 定义
│   └── ...           # 其他资源
```

### 使用方式

直接对话中触发，Claude 自动识别并加载相关 Skill。

## SubAgent

### 核心特性

| 特性 | 说明 |
|------|------|
| **独立上下文** | 拥有自己的上下文窗口 |
| **独立工具** | 可配置不同的工具集 |
| **独立模型** | 可使用不同的 AI 模型 |
| **适用场景** | 复杂任务、多轮对话 |

### 与 Skill 的区别

| 对比项 | Agent Skill | SubAgent |
|--------|-------------|----------|
| 上下文 | 共享主会话 | 独立上下文 |
| 并行执行 | 不可 | 可 |
| 适用场景 | 简单扩展 | 复杂任务 |
| 资源消耗 | 低 | 高 |

### 使用示例

```markdown
/subagent 分析代码库架构
/agent review 代码审查
```

## Plugin 系统

### 概念

Plugin 是打包多个功能的全家桶：
- 多个 Agent Skill
- 多个 SubAgent
- 多个 Hook 配置
- 一键安装

### 安装方式

通过 Claude Code 的插件市场安装，或手动配置 `settings.json`。

## 快捷键速查表

| 快捷键 | 功能 |
|--------|------|
| `Shift+Tab` | 循环切换模式（默认/自动/规划） |
| `Shift+Enter` | 换行（不提交） |
| `Ctrl+G` | 打开 VS Code 编辑标签页 |
| `Ctrl+B` | 后台运行当前服务 |
| `K` | 关闭后台服务 |
| `?` | 显示快捷键帮助 |
| `ESC` × 2 | 打开版本回滚页面 |
| `!` | 进入 Bash 模式 |

## 课程资源

- **视频来源**：马克的技术工作坊
- **BVID**：BV14rzQB9EJj
- **时长**：44:43
- **字幕**：中文

## 相关页面

- [[entities/claude-auto-mode]] — 自动模式配置
- [[tutorials/mcp-basics]] — MCP 基础教程
- [[tutorials/mcp-advanced]] — MCP 进阶教程
- [[concepts/claude-hooks-guide]] — Hook 配置指南
- [[concepts/claude-memory]] — 记忆系统详解

> [!tip] 学习建议
> 建议按课程顺序学习，从基础模式切换开始，逐步掌握后台任务、MCP 集成等进阶功能。
> 重点理解 Hook、Agent Skill、SubAgent 三者的区别和适用场景。