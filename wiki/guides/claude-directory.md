---
name: guides/claude-directory
description: .claude 目录结构详解：配置、记忆、扩展系统文件位置与作用
type: guide
tags: [configuration, directory, setup]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/探索 .claude 目录.md
---

# 探索 .claude 目录

## 概述

Claude Code 从项目目录的 `.claude/` 和用户主目录的 `~/.claude` 读取指令、设置、skills、subagents 和内存。

在 Windows 上，`~/.claude` 解析为 `%USERPROFILE%\.claude`。

## 目录结构

```
~/.claude/                    # 用户级配置（全局）
├── CLAUDE.md                 # 个人指令
├── settings.json             # 权限、hooks、环境变量
├── settings.local.json       # 个人覆盖（gitignored）
├── rules/                    # 模块化规则
├── skills/                    # Skills 目录
├── commands/                  # 单文件命令
├── agents/                    # Subagent 定义
├── agents-memory/             # Subagent 持久内存
├── output-styles/             # 自定义输出样式
├── plugins/                    # 已安装 plugins
├── projects/                  # 项目数据
│   └── <project>/memory/       # 自动内存
└── themes/                     # 终端主题

project/.claude/               # 项目级配置（可提交）
├── CLAUDE.md                  # 项目指令
├── settings.json              # 项目设置
├── rules/                     # 项目规则
├── skills/                     # 项目 skills
├── commands/                   # 项目命令
├── agents/                     # 项目 subagents
└── .mcp.json                   # MCP 服务器配置
```

## 文件参考表

| 文件 | 范围 | 提交 | 作用 |
|------|------|------|------|
| `CLAUDE.md` | 项目/全局 | ✓ | 每个会话加载的指令 |
| `rules/*.md` | 项目/全局 | ✓ | 主题范围指令，可路径门控 |
| `settings.json` | 项目/全局 | ✓ | 权限、hooks、环境变量 |
| `settings.local.json` | 仅项目 | | 个人覆盖，自动 gitignored |
| `.mcp.json` | 仅项目 | ✓ | 团队共享的 MCP 服务器 |
| `skills/<name>/SKILL.md` | 项目/全局 | ✓ | 可重用提示，使用 `/name` 调用 |
| `commands/*.md` | 项目/全局 | ✓ | 单文件提示 |
| `output-styles/*.md` | 项目/全局 | ✓ | 自定义系统提示部分 |
| `agents/*.md` | 项目/全局 | ✓ | Subagent 定义 |
| `agent-memory/<name>/` | 项目/全局 | ✓ | Subagent 持久内存 |

## 选择正确的文件

| 您想要 | 编辑 | 范围 |
|--------|------|------|
| 提供项目上下文和约定 | `CLAUDE.md` | 项目或全局 |
| 允许或阻止特定工具调用 | `settings.json` / `hooks` | 项目或全局 |
| 在工具调用前后运行脚本 | `settings.json` / `hooks` | 项目或全局 |
| 设置会话环境变量 | `settings.json` / `env` | 项目或全局 |
| 个人覆盖（不提交） | `settings.local.json` | 仅项目 |
| 使用 `/name` 调用的功能 | `skills/<name>/SKILL.md` | 项目或全局 |
| 定义专门的 subagent | `agents/*.md` | 项目或全局 |
| 连接外部工具 | `.mcp.json` | 仅项目 |
| 自定义响应格式 | `output-styles/*.md` | 项目或全局 |

## 应用数据

`~/.claude` 保存 Claude Code 在会话期间写入的数据：

### 自动清理（30 天后删除）

| 路径 | 内容 |
|------|------|
| `projects/<project>/<session>.jsonl` | 完整对话记录 |
| `projects/<project>/<session>/tool-results/` | 大型工具输出 |
| `file-history/<session>/` | 文件编辑前快照（检查点恢复） |
| `plans/` | Plan mode 期间的计划文件 |
| `debug/` | 调试日志（`--debug` 启动时） |
| `paste-cache/` / `image-cache/` | 大型粘贴和图像 |

### 保留直到删除

| 路径 | 内容 |
|------|------|
| `history.jsonl` | 每个提示记录（向上箭头回忆） |
| `stats-cache.json` | 令牌和成本计数 |

## 配置优先级

1. **托管设置** — 组织部署，优先级最高
2. **CLI 标志** — `--permission-mode` 等
3. **环境变量** — 部分配置优先于 settings.json
4. **settings.json** — 项目或用户级设置
5. **settings.local.json** — 个人覆盖，仅项目

## 排查配置问题

如果设置、hook 或文件未生效，参阅 [调试您的配置](https://code.claude.com/docs/zh-CN/debug-your-config)。

## 相关页面

- [[context-management]] — 上下文管理
- [[claude-skills]] — Skills 系统
- [[claude-subagents]] — Subagents 系统
- [[claude-settings]] — 设置系统

## 来源

- [探索 .claude 目录](https://code.claude.com/docs/zh-CN/claude-directory) — 官方文档
