---
name: Yeachan-Heo-oh-my-claudecode
description: 面向韩国开发者的 Claude Code 全能工具集 — 技能、代理、钩子、任务和本地化配置
type: source
version: 1.0
tags: [github, typescript, claude-code, skills, agents, korean, localization, productivity]
created: 2026-05-01
updated: 2026-05-01
source: ../../../archive/resources/github/Yeachan-Heo-oh-my-claudecode-2026-05-01.json
stars: 0
language: TypeScript
license: MIT
github_url: https://github.com/Yeachan-Heo/oh-my-claudecode
---

# Oh My Claude Code

> Everything for Claude Code — 为韩国开发者量身定制的全能工具集

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [Yeachan-Heo/oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode) |
| **语言** | TypeScript |
| **许可证** | MIT |
| **平台支持** | Claude Code |

## 核心特色

### 🇰🇷 韩国开发者优先

- **完整韩语支持** — README.zh.md、文档、技能描述全韩语
- **本地化工作流** — 针对韩国开发环境优化
- **社区支持** — 韩语社区和文档

### 📦 核心组件

| 组件 | 说明 |
|------|------|
| **Agents** | 专业代理定义 |
| **Skills** | 可重用技能模块 |
| **Hooks** | 自动化钩子脚本 |
| **Missions** | 预定义任务模板 |
| **CLAUDE.md** | 项目专属配置 |

### 🌍 多语言支持

支持 12+ 语言文档：

| 语言 | 文件 |
|------|------|
| 🇨🇳 中文 | README.zh.md |
| 🇯🇵 日语 | README.ja.md |
| 🇰🇷 韩语 | README.ko.md |
| 🇩🇪 德语 | README.de.md |
| 🇪🇸 西班牙语 | README.es.md |
| 🇫🇷 法语 | README.fr.md |
| 🇮🇹 意大利语 | README.it.md |
| 🇵🇹 葡萄牙语 | README.pt.md |
| 🇷🇺 俄语 | README.ru.md |
| 🇹🇷 土耳其语 | README.tr.md |
| 🇻🇳 越南语 | README.vi.md |

## 项目结构

```
oh-my-claudecode/
├── .claude-plugin/    # Claude Code 插件配置
├── agents/            # Agent 定义
├── skills/            # 技能模块
├── hooks/             # 自动化钩子
├── missions/          # 任务模板
├── AGENTS.md          # Agent 文档
├── CLAUDE.md          # 项目配置
├── CONTRIBUTING.md    # 贡献指南
└── README.ko.md       # 韩语文档
```

## 快速开始

### 安装

```bash
# 克隆仓库
git clone https://github.com/Yeachan-Heo/oh-my-claudecode.git

# 进入目录
cd oh-my-claudecode

# 安装依赖
npm install
```

### 配置 Claude Code

将 `CLAUDE.md` 和 `agents/` 复制到项目根目录：

```bash
cp CLAUDE.md ~/your-project/
cp -r agents/ ~/your-project/.claude/agents/
cp -r skills/ ~/your-project/.claude/skills/
```

## 使用场景

| 场景 | 推荐组件 |
|------|----------|
| 韩国项目开发 | CLAUDE.md + 韩语 skills |
| 自动化工作流 | hooks/ |
| 复杂任务拆解 | missions/ |
| 代码审查 | agents/reviewer |

## 本地化优势

### 为什么选择 Oh My Claude Code？

1. **语言无障碍** — 全韩语文档和技能描述
2. **文化适配** — 针对韩国开发习惯优化
3. **社区支持** — 韩语社区活跃
4. **持续更新** — 跟进 Claude Code 最新功能

## 相关资源

| 资源 | 链接 |
|------|------|
| GitHub | https://github.com/Yeachan-Heo/oh-my-claudecode |
| Issues | https://github.com/Yeachan-Heo/oh-my-claudecode/issues |
| 许可证 | MIT License |

## 对标项目

| 项目 | Stars | 特色 |
|------|-------|------|
| [[affaan-m-everything-claude-code]] | 171K+ | 英语社区，最大规模 |
| [[garrytan-gstack]] | 87K+ | CEO 视角，初创公司导向 |
| **Yeachan-Heo/oh-my-claudecode** | - | 🇰🇷 韩国开发者优先 |

---

*归档时间: 2026-05-01*
