---
name: tips/boris-12-tips
description: 12个自定义配置技巧：Terminal、插件、权限、沙箱、Status Line
type: tips
tags: [tips, boris, custom, settings, permissions, sandbox, statusline]
created: 2026-02-12
---

# 12 Ways to Customize Claude Code

> Boris Cherny 分享的 12 种自定义配置技巧。2026年2月12日。

## 1/ 配置终端

- **主题**: `/config` 设置 light/dark
- **通知**: iTerm2 通知或自定义 hook
- **换行符**: `/terminal-setup` 启用 shift+enter
- **Vim 模式**: `/vim`

---

## 2/ 调整 Effort Level

- **Low** — 更少 tokens，响应更快
- **Medium** — 平衡行为
- **High** — 更多 tokens，更高智能

Boris 的选择：所有任务都用 High。

---

## 3/ 安装插件、MCP 和 Skills

插件让你安装 LSP、MCP、skills、agents 和自定义 hooks。

- 官方 Anthropic 插件市场
- 或为企业创建自己的市场
- 签入 `settings.json` 让团队共享

运行 `/plugin` 开始。

---

## 4/ 创建自定义 Agents

在 `.claude/agents` 中放置 `.md` 文件创建 agents。可自定义：
- 名称、颜色
- 工具集
- 预批准/预禁用工具
- 权限模式、模型

运行 `/agents` 开始。

---

## 5/ 预批准常见权限

运行 `/permissions` 添加到允许/阻止列表。签入团队 `settings.json`。

支持完整通配符语法：`Bash(bun run *)` 或 `Edit(/docs/**)`

---

## 6/ 启用沙箱

运行 `/sandbox` 启用开源沙箱运行时，提高安全性同时减少权限提示。

---

## 7/ 添加 Status Line

Status line 显示在 composer 下方，显示模型、目录、剩余 context、成本等信息。

使用 `/statusline` 让 Claude 根据你的 `.bashrc`/`.zshrc` 生成。

---

## 8/ 自定义快捷键

每个快捷键都可自定义。运行 `/keybindings` 重新映射任何键。设置实时重载。

---

## 9/ 设置 Hooks

Hooks 让你确定性接入 Claude 的生命周期：
- 自动路由权限请求到 Slack 或 Opus
- 在 turn 结束时 nudge Claude 继续
- 预处理/后处理工具调用

让 Claude 添加 hook。

---

## 10/ 自定义 Spinner Verbs

自定义 spinner verbs 添加或替换默认列表。签入 `settings.json` 与团队共享。

---

## 11/ 使用 Output Styles

运行 `/config` 设置 output style：
- **Explanatory** — 熟悉新代码库时推荐
- **Learning** — 让 Claude 指导你进行代码修改
- **Custom** — 创建自定义 output style

---

## 12/ 自定义所有设置！

37 个设置 + 84 个环境变量。配置支持多层级：
- 代码库
- 子文件夹
- 个人
- 企业策略

将 `settings.json` 签入 Git 让团队受益。

---

## 来源

- [Boris Cherny (@bcherny) on X — February 12, 2026](https://x.com/bcherny/status/2021699851499798911)
