---
name: gsd-build-get-shit-done
description: GSD (Get Shit Done) — 轻量级元提示、上下文工程和规范驱动开发系统，解决 AI context rot 问题
type: source
tags: [github, typescript, claude-code, workflow-automation, context-engineering, spec-driven-development, meta-prompting]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/gsd-build-get-shit-done-2026-05-05.json
stars: high
language: TypeScript
license: MIT
github_url: https://github.com/gsd-build/get-shit-done
---

# GSD (Get Shit Done)

> [!info] Repository Overview
> **GSD** 是一个轻量级但强大的元提示、上下文工程和规范驱动开发系统，专为 Claude Code、OpenCode、Gemini CLI、Kilo、Codex、Copilot、Cursor、Windsurf、Antigravity、Augment、Trae、Qwen Code、Hermes Agent、Cline 和 CodeBuddy 设计。**解决 context rot** — Claude 填充上下文窗口时发生的质量下降问题。

## 📊 仓库统计

| 指标 | 数值 |
|------|------|
| ⭐ Stars | 高人气（病毒式传播） |
| 🍴 Forks | 活跃社区 |
| 💻 语言 | TypeScript |
| 📄 许可证 | MIT |
| 🔗 链接 | [github.com/gsd-build/get-shit-done](https://github.com/gsd-build/get-shit-done) |
| 📦 NPM | [get-shit-done-cc](https://www.npmjs.com/package/get-shit-done-cc) |
| 📅 版本 | v1.39.0 |
| 💬 Discord | [加入社区](https://discord.gg/mYzfVNfA2r) |
| 🐦 X | [@gsd_foundation](https://x.com/gsd_foundation) |

## 🎯 核心特性

### 上下文工程

- **解决 Context Rot** — 防止 Claude 填充上下文窗口时的质量下降
- **智能文件管理** — 每个文件都有明确用途和大小限制
- **结构化知识** — PROJECT.md, research/, REQUIREMENTS.md, ROADMAP.md, STATE.md, PLAN.md, SUMMARY.md

### 元提示系统

- **XML Prompt 格式化** — 每个计划都是优化的 XML 结构
- **多代理编排** — 薄编排器生成专业代理，收集结果，路由到下一步
- **原子 Git 提交** — 每个任务立即提交，可追溯、可回滚

### 工作流自动化

- **波次执行** — 独立计划并行，依赖计划串行
- **新鲜上下文** — 每个计划 200k token，零累积垃圾
- **质量门控** — 内置质量门捕获真实问题

## 🚀 快速开始

### 一键安装

```bash
npx get-shit-done-cc@latest
```

安装程序提示您选择：
1. **运行时** — Claude Code, OpenCode, Gemini, Kilo, Codex, Copilot, Cursor, Windsurf, Antigravity, Augment, Trae, Qwen Code, Hermes Agent, Cline, CodeBuddy 或全部
2. **位置** — 全局（所有项目）或本地（当前项目）

### 验证安装

- Claude Code / Gemini / Copilot / Antigravity / Qwen Code / Hermes Agent: `/gsd-help`
- OpenCode / Kilo / Augment / Trae / CodeBuddy: `/gsd-help`
- Codex: `$gsd-help`
- Cline: 检查 `.clinerules` 是否存在

### 推荐配置

GSD 专为无摩擦自动化设计，运行 Claude Code 时使用：

```bash
claude --dangerously-skip-permissions
```

## 🔄 工作流程

### 核心循环

```
┌─────────────────────────────────────────────────────────────┐
│                    GSD 工作流                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. /gsd-new-project                                       │
│     └─ 问题 → 研究 → 需求 → 路线图                         │
│                                                             │
│  2. /gsd-discuss-phase 1                                   │
│     └─ 捕获实现决策，生成 CONTEXT.md                       │
│                                                             │
│  3. /gsd-plan-phase 1                                      │
│     └─ 研究 → 计划 → 验证（XML 结构）                      │
│                                                             │
│  4. /gsd-execute-phase 1                                   │
│     └─ 波次执行（并行 + 串行）→ 原子提交                   │
│                                                             │
│  5. /gsd-verify-work 1                                     │
│     └─ 用户验收测试 → 自动诊断 → 修复计划                 │
│                                                             │
│  6. /gsd-ship 1                                            │
│     └─ 创建 PR                                            │
│                                                             │
│  7. 重复 → /gsd-complete-milestone → /gsd-new-milestone    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 快速模式

对于不需要完整规划的临时任务：

```bash
/gsd-quick
```

- **相同代理** — Planner + executor，相同质量
- **跳过可选步骤** — 无研究、无计划检查、无验证器
- **独立跟踪** — 存在于 `.planning/quick/`，不在阶段中

**标志组合**：
- `--discuss` — 轻量级讨论
- `--research` — 聚焦研究
- `--validate` — 计划检查 + 验证
- `--full` — 所有阶段（讨论 + 研究 + 计划检查 + 验证）

## 🛠️ 核心命令

### 工作流命令

| 命令 | 说明 |
|------|------|
| `/gsd-new-project [--auto]` | 完整初始化：问题 → 研究 → 需求 → 路线图 |
| `/gsd-discuss-phase [N] [--auto] [--analyze] [--chain]` | 规划前捕获实现决策 |
| `/gsd-plan-phase [N] [--auto] [--reviews]` | 阶段研究 + 计划 + 验证 |
| `/gsd-execute-phase <N>` | 并行波次执行所有计划，完成时验证 |
| `/gsd-verify-work [N]` | 手动用户验收测试 |
| `/gsd-ship [N] [--draft]` | 从验证的阶段工作创建 PR |
| `/gsd-progress --next` | 自动前进到下一个逻辑工作流步骤 |
| `/gsd-fast <text>` | 内联微任务 — 跳过规划，立即执行 |

### 里程碑管理

| 命令 | 说明 |
|------|------|
| `/gsd-audit-milestone` | 验证里程碑达到其完成定义 |
| `/gsd-complete-milestone` | 归档里程碑，标记发布 |
| `/gsd-new-milestone [name]` | 开始下一版本 |
| `/gsd-milestone-summary [version]` | 生成项目摘要用于团队入职和审查 |

### 工作流管理

| 命令 | 说明 |
|------|------|
| `/gsd-add-phase` | 追加阶段到路线图 |
| `/gsd-insert-phase [N]` | 在阶段之间插入紧急工作 |
| `/gsd-edit-phase [N] [--force]` | 原位修改现有阶段的任何字段 |
| `/gsd-remove-phase [N]` | 移除未来阶段，重新编号 |
| `/gsd-list-phase-assumptions [N]` | 查看规划前 Claude 的预期方法 |

### Brownfield 项目

| 命令 | 说明 |
|------|------|
| `/gsd-map-codebase [area]` | 新项目前分析现有代码库 |
| `/gsd-ingest-docs [dir]` | 扫描混合 ADR、PRD、SPEC、DOC 仓库，一次性引导完整 `.planning/` 设置 |

### 代码质量

| 命令 | 说明 |
|------|------|
| `/gsd-review` | 当前阶段或分支的跨 AI 同行评审 |
| `/gsd-secure-phase [N]` | 基于威胁模型的安全验证 |
| `/gsd-pr-branch` | 创建过滤 `.planning/` 提交的干净 PR 分支 |
| `/gsd-audit-uat` | 审计验证债务 — 查找缺失 UAT 的阶段 |

## 📦 配置

### 核心设置

| 设置 | 选项 | 默认 | 控制内容 |
|------|------|------|----------|
| `mode` | `yolo`, `interactive` | `interactive` | 自动批准 vs 每步确认 |
| `granularity` | `coarse`, `standard`, `fine` | `standard` | 阶段粒度 |
| `project_code` | 字符串 | `""` | 阶段目录前缀 |

### 模型配置文件

控制每个代理使用的 Claude 模型。平衡质量 vs token 开销：

| 配置文件 | 规划 | 执行 | 验证 |
|---------|------|------|------|
| `quality` | Opus | Opus | Sonnet |
| `balanced`（默认） | Opus | Sonnet | Sonnet |
| `budget` | Sonnet | Sonnet | Haiku |
| `inherit` | Inherit | Inherit | Inherit |

切换配置文件：
```
/gsd-set-profile budget
```

### 工作流代理

| 设置 | 默认 | 说明 |
|------|------|------|
| `workflow.research` | `true` | 规划前研究领域 |
| `workflow.plan_check` | `true` | 执行前验证计划达到阶段目标 |
| `workflow.verifier` | `true` | 执行后确认必须项已交付 |

## 🎯 v1.39.0 亮点

### 主要新特性

1. **`--minimal` 安装配置** — 别名 `--core-only`，仅写入 6 个主循环技能（`new-project`, `discuss-phase`, `plan-phase`, `execute-phase`, `help`, `update`）和零 `gsd-*` 子代理。将冷启动系统提示开销从 ~12k token 减少到 ~700（≥94% 减少）

2. **`/gsd-edit-phase`** — 原位修改 `ROADMAP.md` 中现有阶段的任何字段，不改变其编号或位置。`--force` 跳过确认差异；`depends_on` 引用被验证，写入时更新 `STATE.md`

3. **后合并构建和测试门控** — `execute-phase` 步骤 5.6 现在从 `workflow.build_command` 自动检测构建命令，然后回退到 Xcode (`.xcodeproj`)、Makefile、Justfile、Cargo、Go、Python 或 npm。Xcode/iOS 项目自动获得 `xcodebuild build` + `xcodebuild test`。并行和串行模式都运行

4. **每运行时审查模型选择** — `review.models.<cli>` 让每个外部审查 CLI（codex, gemini 等）独立选择自己的模型，独立于规划器/执行器配置文件

5. **工作流配置继承** — 设置 `GSD_WORKSTREAM` 时，首先加载根 `.planning/config.json` 并与工作流配置深度合并（冲突时工作流获胜）。工作流配置中的显式 `null` 现在正确覆盖根值

6. **技能整合：86 → 59** — 四个新的分组技能（`capture`, `phase`, `config`, `workspace`）吸收 31 个微技能。六个现有父级技能将收尾和子操作吸收为标志：`update --sync/--reapply`, `sketch --wrap-up`, `spike --wrap-up`, `map-codebase --fast/--query`, `code-review --fix`, `progress --do/--next`。零功能损失

## 💡 为什么有效

### 上下文工程

| 文件 | 功能 |
|------|------|
| `PROJECT.md` | 项目愿景，始终加载 |
| `research/` | 生态系统知识（栈、功能、架构、陷阱） |
| `REQUIREMENTS.md` | 范围化的 v1/v2 需求，阶段可追溯性 |
| `ROADMAP.md` | 目标方向，已完成内容 |
| `STATE.md` | 决策、阻塞、位置 — 跨会话记忆 |
| `PLAN.md` | 原子任务，XML 结构，验证步骤 |
| `SUMMARY.md` | 发生什么，改变什么，提交历史 |
| `todos/` | 捕获的想法和任务供后续工作 |
| `threads/` | 跨会话工作的持久上下文线程 |
| `seeds/` | 前瞻性想法在适当时机浮现 |

### XML Prompt 格式化

每个计划都是为 Claude 优化的结构化 XML：

```xml
<task type="auto">
  <name>创建登录端点</name>
  <files>src/app/api/auth/login/route.ts</files>
  <action>
    使用 jose for JWT（不是 jsonwebtoken - CommonJS 问题）。
    根据 users 表验证凭据。
    成功时返回 httpOnly cookie。
  </action>
  <verify>curl -X POST localhost:3000/api/auth/login 返回 200 + Set-Cookie</verify>
  <done>有效凭据返回 cookie，无效返回 401</done>
</task>
```

精确指令。无猜测。内置验证。

### 多代理编排

每个阶段使用相同模式：薄编排器生成专业代理，收集结果，路由到下一步。

| 阶段 | 编排器操作 | 代理操作 |
|------|-----------|----------|
| **研究** | 协调，呈现发现 | 4 个并行研究员调查栈、功能、架构、陷阱 |
| **规划** | 验证，管理迭代 | Planner 创建计划，checker 验证，循环直到通过 |
| **执行** | 分组为波次，跟踪进度 | Executors 并行实现，每个都有新鲜 200k 上下文 |
| **验证** | 呈现结果，路由下一步 | Verifier 检查代码库与目标，debuggers 诊断失败 |

**结果**：您可以运行整个阶段 — 深度研究、多个计划创建和验证、数千行代码跨并行 executors 编写、自动验证目标 — 而主上下文窗口保持在 30-40%。工作发生在新鲜子代理上下文中。会话保持快速响应。

### 波次执行

计划基于依赖关系分组为"波次"。每个波次内，计划并行运行。波次串行运行。

```
┌────────────────────────────────────────────────────────────────────┐
│  阶段执行                                                           │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│  WAVE 1 (并行)          WAVE 2 (并行)          WAVE 3              │
│  ┌─────────┐ ┌─────────┐    ┌─────────┐ ┌─────────┐    ┌─────────┐ │
│  │ Plan 01 │ │ Plan 02 │ →  │ Plan 03 │ │ Plan 04 │ →  │ Plan 05 │ │
│  │         │ │         │    │         │ │         │    │         │ │
│  │ User    │ │ Product │    │ Orders  │ │ Cart    │    │ Checkout│ │
│  │ Model   │ │ Model   │    │ API     │ │ API     │    │ UI      │ │
│  └─────────┘ └─────────┘    └─────────┘ └─────────┘    └─────────┘ │
│       │           │              ↑           ↑              ↑      │
│       └───────────┴──────────────┴───────────┘              │      │
│              依赖：Plan 03 需要 Plan 01                       │      │
│                          Plan 04 需要 Plan 02               │      │
│                          Plan 05 需要 Plans 03 + 04         │      │
│                                                                    │
└────────────────────────────────────────────────────────────────────┘
```

**为什么波次重要**：
- 独立计划 → 同一波次 → 并行运行
- 依赖计划 → 后续波次 → 等待依赖
- 文件冲突 → 串行计划或同一计划

### 原子 Git 提交

每个任务完成后立即提交：

```bash
abc123f docs(08-02): complete user registration plan
def456g feat(08-02): add email confirmation flow
hij789k feat(08-02): implement password hashing
lmn012o feat(08-02): create registration endpoint
```

**好处**：Git bisect 找到精确失败任务。每个任务独立可回滚。Claude 在未来会话中的清晰历史。AI 自动工作流中的更好可观察性。

每个提交都是外科手术式的、可追溯的、有意义的。

## 🎯 使用场景

### 场景 1: 新项目开发

```
场景: 从零开始新项目
操作:
  1. /gsd-new-project — 初始化项目
  2. /gsd-discuss-phase 1 — 捕获设计决策
  3. /gsd-plan-phase 1 — 创建实现计划
  4. /gsd-execute-phase 1 — 并波次执行
  5. /gsd-verify-work 1 — 验证功能
  6. /gsd-ship 1 — 创建 PR
结果: 清晰的 git 历史，完整的文档，可验证的代码
```

### 场景 2: Brownfield 项目

```
场景: 现有代码库添加功能
操作:
  1. /gsd-map-codebase — 分析现有架构
  2. /gsd-new-project — 基于代码库地图初始化
  3. 继续标准工作流
结果: GSD 理解现有模式，新功能一致集成
```

### 场景 3: 快速任务

```
场景: 不需要完整规划的临时任务
操作:
  1. /gsd-quick — 快速执行
  2. 可选标志：--discuss, --research, --validate
结果: GSD 保证，更快路径
```

### 场景 4: 多项目工作空间

```
场景: 并行处理多个项目
操作:
  1. /gsd-workspace --new — 创建隔离工作空间
  2. /gsd-workstreams create <name> — 创建命名工作流
  3. /gsd-workstreams switch <name> — 切换活动工作流
结果: 有条理的多项目管理
```

## 🎯 核心优势

| 特性 | 传统方式 | GSD |
|------|---------|-----|
| **上下文管理** | 手动追踪 | 自动化上下文工程 |
| **代码质量** | 不一致 | 内置质量门控 |
| **Git 历史** | 混乱提交 | 原子提交 |
| **规划** | 口头描述 | XML 结构化计划 |
| **执行** | 手动实现 | 波次并行执行 |
| **验证** | 手动测试 | 自动验证 + UAT |
| **文档** | 过时或缺失 | 自动生成和更新 |
| **代理使用** | 单一上下文 | 多代理编排 |

## 📈 性能指标

### Token 优化

- **冷启动开销**：~12k tokens（默认）→ ~700 tokens（`--minimal`，减少 94%）
- **主上下文**：保持在 30-40%，工作在子代理上下文中
- **每计划**：200k tokens 纯实现，零累积垃圾

### 质量保证

- **Schema 漂移检测** — ORM 更改缺少迁移的标志
- **安全执行** — 基于威胁模型的验证
- **范围减少检测** — 防止规划器静默删除需求

## 🔮 核心价值

GSD 的核心价值在于：

1. **解决 Context Rot** — 防止 AI 质量随上下文填充而下降
2. **上下文工程** — 自动管理 AI 需要的所有上下文
3. **结构化方法** — XML 格式化、原子任务、验证步骤
4. **多代理编排** — 专业代理处理专门任务
5. **波次执行** — 独立任务并行，依赖任务串行
6. **原子提交** — 每个任务可追溯、可回滚
7. **质量门控** — 内置验证和安全检查
8. **模块化设计** — 添加阶段、插入工作、调整计划

## 🚀 快速上手建议

### 新手推荐

1. **从 `/gsd-new-project` 开始** — 完整项目初始化
2. **使用 `/gsd-progress --next`** — 自动检测并运行下一步
3. **启用 `workflow.research`** — 规划前研究
4. **运行 `/gsd-verify-work`** — 验证交付成果

### 进阶用户

1. **自定义配置** — 调整模型配置文件和工作流代理
2. **使用工作流** — 并行里程碑工作
3. **Brownfield 项目** — `/gsd-map-codebase` + `/gsd-ingest-docs`
4. **快速模式** — `/gsd-quick` 处理临时任务

## 🤝 贡献与社区

### 社区资源

- **Discord**: [加入 GSD 社区](https://discord.gg/mYzfVNfA2r)
- **X (Twitter)**: [@gsd_foundation](https://x.com/gsd_foundation)
- **NPM**: [get-shit-done-cc](https://www.npmjs.com/package/get-shit-done-cc)

### 用户评价

> *"If you know clearly what you want, this WILL build it for you. No bs."*

> *"I've done SpecKit, OpenSpec and Taskmaster — this has produced the best results for me."*

> *"By far the most powerful addition to my Claude Code. Nothing over-engineered. Literally just gets shit done."*

**受信任的工程师来自**：Amazon, Google, Shopify, Webflow

## 📄 许可证

MIT License — 开源、免费、商业友好。

## 🌟 总结

GSD 是一个**革命性的 AI 驱动开发系统**，具有以下特点：

1. **解决 Context Rot** — 防止 AI 质量下降
2. **15+ 运行时支持** — Claude Code, Gemini, Cursor, Codex 等
3. **上下文工程** — 自动管理 AI 所需上下文
4. **多代理编排** — 专业代理处理专门任务
5. **波次执行** — 并行 + 串行智能执行
6. **原子提交** — 每个任务可追溯
7. **质量门控** — 内置验证和安全
8. **模块化设计** — 灵活适应
9. **快速模式** — 临时任务的快速路径
10. **工作流支持** — 多项目并行管理

**特别适合**：
- 使用 AI 编码工具的开发者
- 需要结构化方法的团队
- 希望提高代码质量的个人
- 想要自动化工作流的组织

这是一个**改变游戏规则的开发系统**，让 AI 驱动开发变得可靠、高效、可维护！

---

*最后更新: 2026-05-05*
*数据来源: README.md + 官方文档*
*Get Shit Done — 轻松搞定项目开发* 🚀
