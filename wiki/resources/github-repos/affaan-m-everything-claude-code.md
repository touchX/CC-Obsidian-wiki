---
name: affaan-m-everything-claude-code
description: AI 代理工具性能优化系统 — 技能、本能、内存优化、持续学习、安全扫描、研发优先方法论
type: source
version: 2.0.0-rc.1
tags: [github, typescript, python, ai, agents, claude-code, skills, productivity]
created: 2026-04-29
updated: 2026-05-01
source: ../../../archive/resources/github/affaan-m-everything-claude-code-2026-05-01.json
stars: 171082
forks: 21000+
language: TypeScript
license: MIT
github_url: https://github.com/affaan-m/everything-claude-code
---

# Everything Claude Code

> AI 代理工具性能优化系统 — Anthropic 黑客松获胜者出品。171K+ Stars | 21K+ Forks | 170+ 贡献者

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code) |
| **Stars** | 171,082+ |
| **Forks** | 21,000+ |
| **版本** | v2.0.0-rc.1 (ECC 2.0 Alpha) |
| **许可证** | MIT |
| **语言** | TypeScript, Python, Go, Java, Perl, Shell |
| **贡献者** | 170+ |

## 核心内容

| 组件 | 数量 | 说明 |
|------|------|------|
| **Agents** | 48 | 专用子智能体用于任务委派 |
| **Skills** | 182 | 工作流定义与领域知识库 |
| **Commands** | 68 | 传统斜杠命令兼容层 |
| **Rules** | 34+ | 语言特定规范（Common/TS/Python/Go/Perl/Java/PHP 等） |

## 核心智能体

| 智能体 | 用途 |
|--------|------|
| `planner.md` | 功能实现规划 |
| `architect.md` | 系统架构设计决策 |
| `tdd-guide.md` | 测试驱动开发 |
| `code-reviewer.md` | 代码质量与安全审查 |
| `security-reviewer.md` | 漏洞分析 |
| `build-error-resolver.md` | 构建错误修复 |
| `e2e-runner.md` | Playwright E2E 测试 |
| `refactor-cleaner.md` | 无效代码清理 |
| `doc-updater.md` | 文档同步更新 |

### 语言专属审查智能体

| 智能体 | 语言 |
|--------|------|
| `typescript-reviewer.md` | TypeScript/JavaScript |
| `python-reviewer.md` | Python |
| `go-reviewer.md` | Go |
| `java-reviewer.md` | Java/Spring Boot |
| `rust-reviewer.md` | Rust |
| `cpp-reviewer.md` | C++ |
| `kotlin-reviewer.md` | Kotlin/Android |
| `database-reviewer.md` | Database/Supabase |

## 核心技能

### 通用技能

| 技能 | 说明 |
|------|------|
| `coding-standards/` | 各语言最佳实践 |
| `backend-patterns/` | API、数据库、缓存设计模式 |
| `frontend-patterns/` | React、Next.js 开发模式 |
| `tdd-workflow/` | 测试驱动开发方法论 |
| `security-review/` | 安全检查清单 |
| `eval-harness/` | 验证循环评估 |
| `verification-loop/` | 持续验证机制 |

### 语言专属技能

| 技能 | 语言/框架 |
|------|-----------|
| `golang-patterns/` | Go |
| `django-patterns/` | Django |
| `laravel-patterns/` | Laravel |
| `python-patterns/` | Python |
| `springboot-patterns/` | Java Spring Boot |
| `cpp-coding-standards/` | C++ |
| `perl-patterns/` | Perl |

### 领域专属技能

| 技能 | 领域 |
|------|------|
| `article-writing/` | 长文本写作 |
| `content-engine/` | 社媒内容创作 |
| `market-research/` | 市场调研 |
| `investor-materials/` | 融资材料 |
| `video-editing/` | 音视频编辑 |
| `api-design/` | REST API 设计 |
| `deployment-patterns/` | CI/CD、Docker |

## AgentShield 安全工具

> Claude Code 黑客松（Cerebral Valley x Anthropic，2026 年 2 月）开发

| 功能 | 说明 |
|------|------|
| **扫描范围** | 1282 项测试、98% 覆盖率 |
| **扫描类别** | 密钥检测（14 种模式）、权限审计、钩子注入分析、MCP 服务风险 |
| **输出格式** | 终端（彩色 A-F）、JSON、Markdown、HTML |
| **CI 集成** | 发现严重问题时返回退出码 2 |

```bash
# 快速扫描
npx ecc-agentshield scan

# 自动修复
npx ecc-agentshield scan --fix

# Opus 深度分析
npx ecc-agentshield scan --opus --stream
```

## Dashboard GUI

**v2.0.0-rc.1 新功能** — 基于 Tkinter 的桌面应用程序，提供可视化组件浏览界面。

```bash
# 启动 Dashboard
npm run dashboard
# 或
python3 ./ecc_dashboard.py
```

**功能特性**:
- 🎨 选项卡界面：Agents、Skills、Commands、Rules、Settings
- 🌓 深色/浅色主题切换
- 🔤 字体自定义（字体族和大小）
- 🏷️ 项目 Logo 显示在标题栏和任务栏
- 🔍 跨所有组件的搜索和过滤功能

## Continuous Learning v2

**基于本能的学习系统** — 自动从会话中提取模式并生成可重用技能。

### 核心命令

| 命令 | 功能 |
|------|------|
| `/instinct-status` | 查看已学习的本能（含置信度评分） |
| `/instinct-import <file>` | 导入他人的本能集合 |
| `/instinct-export` | 导出你的本能用于分享 |
| `/evolve` | 将相关本能聚类为技能 |
| `/prune` | 删除过期的待处理本能（30天 TTL） |

### 与 v1 的区别

| 特性 | v1 (Stop-hook) | v2 (Instinct-based) |
|------|----------------|---------------------|
| 触发时机 | 会话结束时 | 任意时刻 |
| 置信度评分 | ❌ | ✅ (5级评分系统) |
| 导入/导出 | ❌ | ✅ |
| 演化机制 | ❌ | ✅ (自动聚类为技能) |
| 过期清理 | ❌ | ✅ |

## Token 优化建议

### 推荐配置

添加到 `~/.claude/settings.json`:

```json
{
  "model": "sonnet",
  "env": {
    "MAX_THINKING_TOKENS": "10000",
    "CLAUDE_AUTOCOMPACT_PCT_OVERRIDE": "50"
  }
}
```

| 设置 | 默认值 | 推荐值 | 影响 |
|------|--------|--------|------|
| `model` | opus | **sonnet** | ~60% 成本降低；处理 80%+ 编码任务 |
| `MAX_THINKING_TOKENS` | 31,999 | **10,000** | 每次请求的思考成本降低 ~70% |
| `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE` | 95 | **50** | 更早压缩 — 长会话中质量更好 |

### 工作流命令

| 命令 | 使用时机 |
|------|----------|
| `/model sonnet` | 大多数任务的默认设置 |
| `/model opus` | 复杂架构、调试、深度推理 |
| `/clear` | 无关任务之间（免费、即时重置） |
| `/compact` | 逻辑任务断点处（研究完成、里程碑达成） |
| `/cost` | 监控会话期间的 token 消耗 |

### 战略压缩时机

**何时压缩**:
- 研究/探索之后，实现之前
- 完成里程碑之后，开始下一个之前
- 调试之后，继续功能开发之前
- 失败方法之后，尝试新方法之前

**何时不压缩**:
- 实现过程中（会丢失变量名、文件路径、部分状态）

### 上下文窗口管理

**关键原则**: 不要一次启用所有 MCP。每个 MCP 工具描述都会消耗你的 200k 窗口中的 token，可能将其减少到 ~70k。

- 每个项目保持启用少于 10 个 MCP
- 保持少于 80 个工具处于活动状态
- 使用 `/mcp` 禁用未使用的 Claude Code MCP 服务器
- 使用 `ECC_DISABLED_MCPS` 仅在安装/同步流程期间过滤 ECC 生成的 MCP 配置

## 安装方式

### 插件安装（推荐）

```bash
# 添加市场
/plugin marketplace add https://github.com/affaan-m/everything-claude-code

# 安装插件
/plugin install everything-claude-code@everything-claude-code
```

### 手动安装

```bash
# 克隆仓库
git clone https://github.com/affaan-m/everything-claude-code.git

# 复制规则（必须）
mkdir -p ~/.claude/rules
cp -R rules/common ~/.claude/rules/
cp -R rules/typescript ~/.claude/rules/

# 复制技能
cp -r .agents/skills/* ~/.claude/skills/
```

## 快速开始

```bash
# 使用命名空间命令
/ecc:plan "添加用户认证"

# 查看可用命令
/plugin list everything-claude-code@everything-claude-code
```

## 生态工具

| 工具 | 说明 |
|------|------|
| **ECC 2.0 Rust** | 本地构建，提供 dashboard/start/sessions/status 命令 |
| **ecc-universal** | npm 包 |
| **ecc-agentshield** | 安全审计工具 |
| **Skill Creator** | GitHub App，自动从仓库生成 SKILL.md |

## 多平台支持

| 平台 | 支持 |
|------|------|
| **操作系统** | Windows, macOS, Linux |
| **IDE** | Claude Code, Codex, Cursor, OpenCode, Gemini |
| **包管理器** | npm, pnpm, yarn, bun（自动检测） |

## 项目结构

```
everything-claude-code/
├── .agents/           # Agent 插件配置
├── .claude-plugin/    # Claude Code 插件清单
├── agents/            # 48 个子智能体
├── skills/            # 183 个技能模块
├── commands/           # 79 个命令
├── rules/              # 语言规范（common/typescript/python/golang/perl）
├── hooks/              # 自动化钩子
├── scripts/            # 跨平台 Node.js 脚本
├── mcp-configs/        # MCP 服务端配置
├── contexts/           # 动态注入的系统提示
├── examples/           # 项目配置示例
├── tests/              # 测试套件
├── ecc2/               # Rust 控制层 (ECC 2.0)
└── plugins/            # 插件市场配置
```

## 相关资源

| 资源 | 链接 |
|------|------|
| GitHub | https://github.com/affaan-m/everything-claude-code |
| npm (ecc-universal) | https://www.npmjs.com/package/ecc-universal |
| npm (ecc-agentshield) | https://www.npmjs.com/package/ecc-agentshield |
| AgentShield GitHub | https://github.com/affaan-m/agentshield |
| Skill Creator App | https://github.com/apps/skill-creator |
| 作者 Twitter | [@affaanmustafa](https://x.com/affaanmustafa) |
