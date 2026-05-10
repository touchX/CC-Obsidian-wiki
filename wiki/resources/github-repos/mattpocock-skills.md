---
name: mattpocock-skills
description: Skills for Real Engineers - Matt Pocock 的实用技能集合，帮助构建真实工程应用而非 vibe coding
type: source
tags: [github, shell, claude-code, agent, skills, engineering, productivity, tdd]
created: 2026-05-08
updated: 2026-05-08
source: ../../../archive/resources/github/mattpocock-skills-2026-05-08.json
language: Shell
license: MIT
github_url: https://github.com/mattpocock/skills
online_docs: https://skills.sh/mattpocock/skills
stats: ⭐64,836 | 🍴5,584 | 📬60K 订阅者
---

# Matt Pocock Skills — 工程实用主义技能包

> [!info] 项目信息
> - **星标数**: 64,836 🔥
> - **Fork 数**: 5,584
> - **语言**: Shell
> - **许可证**: MIT
> - **订阅者**: ~60,000
> - **定位**: 为真实工程师设计的 Agent Skills，直接来自 Matt Pocock 的 `.claude` 目录

## 核心理念

Matt Pocock 构建这些 Skills 的出发点是**解决实际工程问题**，而非追求"氛围编程"（vibe coding）。

> **"Developing real applications is hard. Approaches like GSD, BMAD, and Spec-Kit try to help by owning the process. But while doing so, they take away your control and make bugs in the process hard to resolve."**

这些 Skills 的设计原则：
- **小而精** — 每个 Skill 专注单一任务，易于理解和修改
- **可组合** — 任意模型都能用，基于数十年工程经验
- **你做主** — 不接管流程，保留工程师的控制权

## 四大问题与解决方案

### 问题一：Agent 没有做你想要的事

**根本原因**：沟通错位。你以为 Agent 理解了你的需求，但它构建出来的东西完全不是你想要的。

**解决方案**：`/grill-me` 和 `/grill-with-docs`

让 Agent 在开始工作前向你详细提问，确保完全理解你的意图。这是最受欢迎的 Skills。

### 问题二：Agent 输出太冗长

**根本原因**：项目和领域专家之间存在术语鸿沟。Agent 被丢进项目后只能自己摸索 jargon。

**解决方案**：`/grill-with-docs` 内置的**共享语言**机制

```markdown
# BEFORE
"There's a problem when a lesson inside a section of a course is made 'real' (i.e. given a spot in the file system)"

# AFTER
"There's a problem with the materialization cascade"
```

好处：
- 变量、函数、文件命名保持一致
- 代码库对 Agent 更容易导航
- Agent 花费更少 token 在思考上

### 问题三：代码不工作

**根本原因**：缺乏反馈循环。没有测试和类型检查，Agent 在盲目飞行。

**解决方案**：
- `/tdd` — 红-绿-重构测试驱动开发
- `/diagnose` — 纪律性诊断循环（复现→最小化→假设→验证→修复→回归测试）

### 问题四：代码变成一团乱麻

**根本原因**：Agent 加速编码的同时也加速了软件熵增。代码库以罕见的速度变得复杂。

**解决方案**：
- `/to-prd` — 在创建 PRD 前询问你涉及哪些模块
- `/zoom-out` — 让 Agent 在整个系统上下文中解释代码
- `/improve-codebase-architecture` — 拯救已经变成一团乱麻的代码库

## Skills 分类速查

### 工程类（Engineering）

| Skill | 功能 |
|-------|------|
| `diagnose` | 硬 Bug 和性能回归的纪律性诊断循环 |
| `grill-with-docs` | 挑战你的计划，更新 `CONTEXT.md` 和 ADR |
| `triage` | 通过状态机对 Issue 进行分类 |
| `improve-codebase-architecture` | 发现代码库深化机会 |
| `setup-matt-pocock-skills` | 初始化每个仓库的配置 |
| `tdd` | 红-绿-重构测试驱动开发 |
| `to-issues` | 将计划/规格分解为独立的 GitHub Issues |
| `to-prd` | 将对话上下文转化为 PRD |
| `zoom-out` | 让 Agent 从更高角度解释代码 |

### 生产力类（Productivity）

| Skill | 功能 |
|-------|------|
| `caveman` | 超压缩通信模式，削减 75% token 使用 |
| `grill-me` | 彻底访谈你的计划或设计 |
| `write-a-skill` | 创建结构良好的新 Skill |

### 杂项（Misc）

| Skill | 功能 |
|-------|------|
| `git-guardrails-claude-code` | 阻止危险 git 命令的 Hooks |
| `migrate-to-shoehorn` | 将测试文件迁移到 `@total-typescript/shoehorn` |
| `scaffold-exercises` | 创建练习目录结构 |
| `setup-pre-commit` | 设置 Husky pre-commit hooks |

## 快速安装

```bash
# 1. 运行安装脚本
npx skills@latest add mattpocock/skills

# 2. 选择要安装的 Skills 和编码 Agent

# 3. 在 Agent 中运行
/setup-matt-pocock-skills

# 4. 配置你的 Issue 追踪器（GitHub / Linear / 本地文件）
```

## 设计哲学

> [!quote] 核心引用
> "Software engineering fundamentals matter more than ever."

Matt Pocock 认为，在 AI 编程时代，软件工程 fundamentals 比以往任何时候都更重要。这些 Skills 是他将这些 fundamentals 浓缩为可重复实践的尝试。

> [!links]+ 相关链接
> - [GitHub 仓库](https://github.com/mattpocock/skills)
> - [Matt Pocock Newsletter](https://www.aihero.dev/s/skills-newsletter) — ~60,000 开发者订阅
> - [Matt Pocock Website](https://www.totaltypescript.com/)
