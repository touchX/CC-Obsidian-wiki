---
name: resources/github-repos/iamzhihuix-skills-manage
description: Desktop app to manage AI coding agent skills across Claude Code, Cursor, Gemini CLI, Codex, and 20+ platforms from one place.
type: source
version: 1.0
tags: [github, tauri, react, typescript, rust, desktop-app, claude-code]
created: 2026-04-28
updated: 2026-04-28
source: ../../../../archive/resources/github/iamzhihuix-skills-manage-2026-04-28.json
stars: 1271
language: TypeScript
license: Apache-2.0
github_url: https://github.com/iamzhihuix/skills-manage
---

# skills-manage

Tauri 桌面应用，从一个地方管理多个 AI 编码 Agent 的 Skills。支持 Claude Code、Cursor、Gemini CLI、Codex 等 20+ 平台。

## 核心特点

| 功能 | 描述 |
|------|------|
| **中央技能库** | 统一管理所有平台的 skills |
| **跨平台安装/卸载** | 一处安装，多平台同步 |
| **Claude Code 原生 + 市场插件** | 统一视图展示 |
| **完整技能详情** | Markdown 预览、源码查看、AI 解释生成 |
| **收藏集管理** | 组织 skills 并批量安装 |
| **本地项目技能发现** | 扫描项目级技能库 |
| **市场浏览** | 浏览和搜索技能市场 |
| **GitHub 导入** | 从 GitHub 仓库导入 skills |
| **快速搜索** | 延迟查询、懒索引、虚拟化渲染 |
| **双语 UI** | 中文/英文界面 |
| **Catppuccin 主题** | 多彩主题支持 |

## 支持的平台

| 类别 | 平台 |
|------|------|
| **Coding** | Claude Code, Codex CLI, Cursor, Gemini CLI, Trae, Factory Droid, Junie, Qwen, Windsurf, Qoder, Augment, OpenCode, KiloCode, OB1, Amp, Kiro, CodeBuddy, Hermes, Copilot, Aider |
| **Lobster** | OpenClaw, QClaw, EasyClaw, AutoClaw, WorkBuddy |

## 技术栈

| 层级 | 技术 |
|------|------|
| 桌面框架 | Tauri v2 |
| 前端 | React 19, TypeScript, Tailwind CSS 4 |
| UI 组件 | shadcn/ui, Lucide icons |
| 状态管理 | Zustand |
| Markdown | react-markdown |
| 国际化 | react-i18next |
| 主题 | Catppuccin 4-flavor palette |
| 后端 | Rust (serde, sqlx, chrono, uuid) |
| 数据库 | SQLite (WAL mode) |

## 安装

### 下载最新版本
- macOS Apple Silicon: `.dmg` / `.app.zip`
- 其他平台: 从源码构建

### macOS 未签名构建处理
```bash
xattr -dr com.apple.quarantine "/Applications/skills-manage.app"
```

## 隐私与安全

- **本地优先存储** — 元数据、收藏、设置均存储在 `~/.skillsmanage/db.sqlite`
- **无遥测** — 无分析、崩溃报告或使用跟踪
- **凭证本地存储** — GitHub PAT 和 AI API 密钥存储在本地 SQLite 设置表中

## 相关资源

- GitHub: [[https://github.com/iamzhihuix/skills-manage]]
- 下载: [[https://github.com/iamzhihuix/skills-manage/releases/latest]]

---

*归档时间: 2026-04-28*