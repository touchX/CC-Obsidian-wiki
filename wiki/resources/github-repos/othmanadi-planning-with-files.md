---
name: othmanadi-planning-with-files
description: Planning with Files — Manus 风格持久化 Markdown 规划系统，20 亿美元收购背后的工作流模式
type: source
tags: [github, python, claude-code, workflow, planning, context-engineering, manuscript-style, agent-skills]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/othmanadi-planning-with-files-2026-05-05.json
stars: 20392
language: Python
license: MIT
github_url: https://github.com/OthmanAdi/planning-with-files
---

# Planning with Files

> [!info] Repository Overview
> **Planning with Files** 是一个实现 Manus 风格持久化 Markdown 规划的 Claude Code 技能 — 这是 Meta 以 **20 亿美元收购 Manus** 背后的工作流模式。通过将文件系统作为持久化内存，解决了 AI 代理的上下文丢失、目标漂移和隐藏错误问题。

## 📊 仓库统计

| 指标 | 数值 |
|------|------|
| ⭐ Stars | 20,392 🔥🔥（超高人气！） |
| 🍴 Forks | 1,834 |
| 💻 语言 | Python |
| 📄 许可证 | MIT |
| 🔗 链接 | [github.com/OthmanAdi/planning-with-files](https://github.com/OthmanAdi/planning-with-files) |
| 🏢 所有者 | Ahmad Othman Ammar Adi |
| 📅 版本 | v2.36.3 |
| 📅 创建时间 | 2026-01-03 |
| 📅 更新时间 | 2026-05-05 |
| 🔌 Open Issues | 7 |

## 🎯 核心特性

### Manus 工作流模式

- **上下文工程** — 文件系统作为持久化内存
- **3 文件模式** — task_plan.md, findings.md, progress.md
- **目标追踪** — 防止 50+ 工具调用后的目标漂移
- **错误持久化** — 记录所有失败以避免重复
- **完成验证** — Stop hook 检查所有阶段

### IDE 集成

**增强支持**（hooks + 生命周期自动化）：
- Claude Code（Plugin + SKILL.md + Hooks）
- Cursor（Skills + hooks.json）
- GitHub Copilot（Hooks + errorOccurred）
- Mastra Code（Skills + Hooks）
- Gemini CLI（Skills + Hooks）
- Kiro（Agent Skills）
- Codex（Skills + Hooks）
- Hermes Agent（Skill + Project Plugin）
- CodeBuddy（Skills + Hooks）
- FactoryAI Droid（Skills + Hooks）
- OpenCode（Skills + Custom session storage）

**标准 Agent Skills 支持**：
- Continue, Pi Agent, OpenClaw, Antigravity, Kilocode, AdaL CLI

### 多语言支持

- 🇺🇸 English（默认）
- 🇸🇦 العربية / Arabic
- 🇩🇪 Deutsch / German
- 🇪🇸 Español / Spanish
- 🇨🇳 中文版 / Chinese (Simplified)
- 🇹🇼 正體中文版 / Chinese (Traditional)

### 会话恢复

当上下文填满并运行 `/clear` 时，此技能**自动恢复**之前的会话：

1. 检查活跃 IDE 的会话存储中的先前会话数据
2. 查找规划文件最后更新时间
3. 提取之后发生的对话（可能丢失的上下文）
4. 显示追赶报告以便同步

## 🚀 快速开始

### 一键安装

```bash
npx skills add OthmanAdi/planning-with-files --skill planning-with-files -g
```

### 多语言安装

**中文简体版**：
```bash
npx skills add OthmanAdi/planning-with-files --skill planning-with-files-zh -g
```

**其他语言**：
- Arabic: `planning-with-files-ar`
- German: `planning-with-files-de`
- Spanish: `planning-with-files-es`
- Traditional Chinese: `planning-with-files-zht`

### Claude Code Plugin（高级功能）

```bash
/plugin marketplace add OthmanAdi/planning-with-files
/plugin install planning-with-files@planning-with-files
```

### 使用命令

| 命令 | 自动完成 | 说明 |
|------|---------|------|
| `/planning-with-files:plan` | `/plan` | 开始规划会话（v2.11.0+） |
| `/planning-with-files:status` | `/plan:status` | 显示规划进度（v2.15.0+） |
| `/planning-with-files:start` | `/planning` | 原始开始命令 |

## 💡 为什么使用这个技能？

### Manus 的成功故事

2025 年 12 月 29 日，[Meta 以 20 亿美元收购 Manus](https://techcrunch.com/2025/12/29/meta-just-bought-manus-an-ai-startup-everyone-has-been-talking-about/)。仅 8 个月，Manus 从启动到 1 亿美元以上收入。他们的秘诀？**上下文工程**。

> "Markdown 是我在磁盘上的'工作内存'。由于我迭代处理信息且活动上下文有限，Markdown 文件作为笔记的草稿板、进度的检查点和最终交付物的构建块。"
> — Manus AI

### 解决的问题

Claude Code（和大多数 AI 代理）存在以下问题：

- **易失内存** — TodoWrite 工具在上下文重置时消失
- **目标漂移** — 50+ 工具调用后，原始目标被遗忘
- **隐藏错误** — 失败未被跟踪，同样的错误重复
- **上下文填充** — 所有内容塞进上下文而不是存储

### 解决方案：3 文件模式

对于每个复杂任务，创建三个文件：

```
task_plan.md      → 跟踪阶段和进度
findings.md       → 存储研究和发现
progress.md       → 会话日志和测试结果
```

### 核心原则

```
上下文窗口 = RAM（易失、有限）
文件系统 = 磁盘（持久、无限）

→ 重要的内容写入磁盘。
```

## 📋 Manus 原则

| 原则 | 实现 |
|------|------|
| **文件系统即内存** | 存储在文件中，不在上下文中 |
| **注意力操作** | 在决策前重新读取计划（hooks） |
| **错误持久化** | 在计划文件中记录失败 |
| **目标追踪** | 复选框显示进度 |
| **完成验证** | Stop hook 检查所有阶段 |

## 🔄 工作流程

安装后，AI 代理将：

1. **询问您的任务**（如果未提供描述）
2. **创建 `task_plan.md`, `findings.md`, 和 `progress.md`** 在项目目录中
3. **重新读取计划** 在重大决策之前（via PreToolUse hook）
4. **提醒您** 文件写入后更新状态（via PostToolUse hook）
5. **存储发现** 在 `findings.md` 中而不是填充上下文
6. **记录错误** 供将来参考
7. **验证完成** 在停止之前（via Stop hook）

## 📊 基准测试结果

使用 Anthropic 的 [skill-creator](https://github.com/anthropics/skills/tree/main/skills/skill-creator) 框架正式评估（v2.22.0）。10 个并行子代理，5 种任务类型，30 个客观可验证断言，3 次盲 A/B 比较。

| 测试 | with_skill | without_skill |
|------|-----------|---------------|
| **通过率（30 断言）** | **96.7%** (29/30) | 6.7% (2/30) |
| **3 文件模式遵循** | 5/5 evals | 0/5 evals |
| **盲 A/B 获胜** | **3/3 (100%)** | 0/3 |
| **平均评分** | **10.0/10** | 6.8/10 |

徽章：
- [![Benchmark](https://img.shields.io/badge/Benchmark-96.7%25_pass_rate-brightgreen)](https://github.com/OthmanAdi/planning-with-files/blob/main/docs/evals.md)
- [![A/B Verified](https://img.shields.io/badge/A%2FB_Blind-3%2F3_wins-brightgreen)](https://github.com/OthmanAdi/planning-with-files/blob/main/docs/evals.md)
- [![SkillCheck Validated](https://img.shields.io/badge/SkillCheck-Validated-4c1)](https://getskillcheck.com)
- [![Security Verified](https://img.shields.io/badge/Security-Audited_%26_Fixed_v2.21.0-blue)](https://github.com/OthmanAdi/planning-with-files/blob/main/docs/evals.md)

## 🎯 关键规则

1. **首先创建计划** — 从不在没有 `task_plan.md` 的情况下开始
2. **2 行动规则** — 每 2 次 view/browser 操作后保存发现
3. **记录所有错误** — 它们有助于避免重复
4. **永不重复失败** — 跟踪尝试，变更方法

## 💡 使用场景

### 适用于：

- **多步骤任务**（3+ 步骤）
- **研究任务**
- **构建/创建项目**
- **跨越许多工具调用的任务**

### 跳过用于：

- **简单问题**
- **单文件编辑**
- **快速查找**

## 📁 项目结构

```
planning-with-files/
├── commands/                # 插件命令
│   ├── plan.md              # /planning-with-files:plan 命令
│   └── start.md             # /planning-with-files:start 命令
├── templates/               # 根级模板
├── scripts/                 # 根级脚本
├── docs/                    # 文档
│   ├── installation.md
│   ├── quickstart.md
│   ├── workflow.md
│   └── [各平台设置指南]
├── examples/                # 集成示例
├── planning-with-files/     # 插件技能文件夹
├── skills/                  # 技能变体（多语言）
│   ├── planning-with-files/     # 英语（默认）
│   ├── planning-with-files-ar/   # 阿拉伯语
│   ├── planning-with-files-de/   # 德语
│   ├── planning-with-files-es/   # 西班牙语
│   ├── planning-with-files-zh/   # 简体中文
│   └── planning-with-files-zht/  # 繁体中文
├── .claude-plugin/          # 插件清单
├── .cursor/                 # Cursor skills + hooks
├── .github/                 # GitHub Copilot hooks
├── .gemini/                 # Gemini CLI skills + hooks
├── .codex/                  # Codex CLI skills + hooks
└── [其他 IDE 配置]
```

## 🆕 v2.36.0 亮点

### 主要新特性

1. **并行计划隔离** — `.planning/YYYY-MM-DD-slug/` 目录结构
2. **Codex 会话隔离** — 所有 Codex hooks 通过解析器路由
3. **会话附件门控** — 防止跨会话污染
4. **Hermes 文档** — 集成说明添加到 `docs/hermes.md`
5. **34 个新测试** — 提高稳定性
6. **Shebang 可移植性** — 修复 NixOS 兼容性
7. **安全加固** — Stop hook 缓存搜索移除，ExecutionPolicy Bypass 更改
8. **多语言扩展** — 阿拉伯语、德语、西班牙语变体

## 🤝 社区贡献

### Fork 和扩展

| Fork | 作者 | 构建内容 |
|------|------|---------|
| [devis](https://github.com/st01cs/devis) | [@st01cs](https://github.com/st01cs) | 面试优先工作流，`/devis:intv` 和 `/devis:impl` 命令 |
| [multi-manus-planning](https://github.com/kmichels/multi-manus-planning) | [@kmichels](https://github.com/kmichels) | 多项目支持，SessionStart git 同步 |
| [plan-cascade](https://github.com/Taoidle/plan-cascade) | [@Taoidle](https://github.com/Taoidle) | 多级任务编排，并行执行 |
| [agentfund-skill](https://github.com/RioTheGreat-ai/agentfund-skill) | [@RioTheGreat-ai](https://github.com/RioTheGreat-ai) | AI 代理众筹，基于里程碑的托管 |
| [openclaw-github-repo-commander](https://github.com/wd041216-bit/openclaw-github-repo-commander) | [@wd041216-bit](https://github.com/wd041216-bit) | 7 阶段 GitHub 仓库审计工作流 |

### 野外使用

| 项目 | 内容 |
|------|------|
| [lincolnwan/Planning-with-files-copilot-agent](https://github.com/lincolnwan/Planning-with-files-copilot-agent) | 整个 Copilot 代理仓库围绕 planning-with-files 技能构建 |
| [cooragent/ClarityFinance](https://github.com/cooragent/ClarityFinance) | AI 金融代理框架 — 直接归功于 Planning-with-Files 方法 |
| [oeftimie/vv-claude-harness](https://github.com/oeftimie/vv-claude-harness) | Claude Code harness 基于 Manus 风格持久化 markdown 规划 |
| [jessepwj/CCteam-creator](https://github.com/jessepwj/CCteam-creator) | 使用基于文件规划的多代理团队编排技能 |

## 🎯 核心优势

| 特性 | 传统方式 | Planning with Files |
|------|---------|---------------------|
| **内存** | 易失（上下文重置丢失） | 持久化（文件系统） |
| **目标追踪** | 目标漂移 | 复选框追踪 |
| **错误处理** | 隐藏错误 | 记录所有失败 |
| **上下文管理** | 填充上下文 | 存储到文件 |
| **完成验证** | 无验证 | Stop hook 检查 |
| **会话恢复** | 丢失上下文 | 自动恢复 |
| **多 IDE 支持** | 单一平台 | 17+ 平台 |
| **多语言** | 英语 | 6 种语言 |

## 📈 性能指标

### 仓库活跃度

- ⭐ **20,392 Stars** - 病毒式传播（24 小时内爆发）
- 🍴 **1,834 Forks** - 活跃社区参与
- 🔧 **7 Open Issues** - 稳定维护
- 📅 **持续更新** - v2.36.3（2026-05-05）

### 技术成熟度

- ✅ **生产级代码**: Python，企业级质量
- ✅ **17+ IDE 支持**: Claude Code, Cursor, Copilot, Gemini, Codex 等
- ✅ **完整文档**: 详细安装指南、快速开始、故障排除
- ✅ **基准验证**: 96.7% 通过率，10.0/10 平均评分
- ✅ **安全审计**: SkillCheck 验证，安全审计通过
- ✅ **活跃社区**: Discord, Discussions, Star History

## 🔮 核心价值

Planning with Files 的核心价值在于：

1. **Manus 工作流** — 20 亿美元收购背后的模式
2. **上下文工程** — 文件系统作为持久化内存
3. **高通过率** — 96.7% 基准测试通过率
4. **多平台支持** — 17+ IDE 无缝集成
5. **会话恢复** — 自动恢复丢失的上下文
6. **多语言** — 6 种语言版本
7. **Hooks 自动化** — PreToolUse, PostToolUse, Stop 自动化
8. **社区生态** — 多个 Fork 和扩展

## 🚀 快速上手建议

### 新手推荐

1. **阅读快速开始** — docs/quickstart.md 5 步指南
2. **使用 `/plan` 命令** — 开始第一次规划会话
3. **遵循 3 文件模式** — task_plan.md, findings.md, progress.md
4. **启用 hooks** — 自动化工作流
5. **体验会话恢复** — `/clear` 后自动恢复

### 进阶用户

1. **自定义模板** — 修改 templates/ 目录
2. **多项目管理** — 使用并行计划隔离
3. **集成到 CI/CD** — 自动化验证
4. **创建 Fork** — 构建自定义扩展
5. **贡献社区** — 提交 PR 改进技能

## 🤝 贡献与社区

### 如何贡献

1. **Fork 仓库**
2. **创建功能分支**
3. **提交 Pull Request**

### 学习资源

- **GitHub 仓库**: [OthmanAdi/planning-with-files](https://github.com/OthmanAdi/planning-with-files)
- **文档**: [docs/](https://github.com/OthmanAdi/planning-with-files/tree/main/docs)
- **基准测试**: [docs/evals.md](https://github.com/OthmanAdi/planning-with-files/blob/main/docs/evals.md)
- **技术文章**: [docs/article.md](https://github.com/OthmanAdi/planning-with-files/blob/main/docs/article.md)
- **Star History**: [repostars.dev](https://repostars.dev/?repos=OthmanAdi%2Fplanning-with-files&theme=copper)

## 📄 许可证

MIT License — 开源、免费、商业友好。

## 🌟 总结

Planning with Files 是一个**革命性的 AI 工作流增强工具**，具有以下特点：

1. **Manus 模式** — 20 亿美元收购背后的工作流
2. **超高人气** — 20K+ Stars，24 小时内病毒式传播
3. **上下文工程** — 文件系统作为持久化内存
4. **3 文件模式** — 简单而强大
5. **96.7% 通过率** — 基准测试验证
6. **17+ IDE 支持** — Claude Code, Cursor, Copilot 等
7. **会话恢复** — 自动恢复丢失上下文
8. **多语言** — 6 种语言版本
9. **Hooks 自动化** — 无缝工作流集成
10. **社区生态** — 多个 Fork 和扩展

**特别适合**：
- 使用 AI 代理进行复杂任务
- 需要持久化内存的工作流
- 跨多工具调用的任务
- 需要目标追踪的项目
- 研究和构建工作

这是一个**改变游戏规则的工具**，让 AI 代理工作流变得可靠、可追溯、可恢复！🚀

---

*最后更新: 2026-05-05*
*数据来源: GitHub API + README.md + 官方文档*
*基于 Manus AI 的上下文工程模式*
