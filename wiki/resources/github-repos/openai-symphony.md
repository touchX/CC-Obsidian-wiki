---
name: openai-symphony
description: OpenAI Symphony - 将项目工作转化为隔离的自主实现运行，让团队管理工作而非监督编码代理
type: source
version: 1.0
tags: [github, elixir, ai, automation, workflow, orchestration, codex]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/openai-symphony-2026-05-05.json
stars: 21514
language: Elixir
license: Apache-2.0
github_url: https://github.com/openai/symphony
---

# OpenAI Symphony

> [!tip] 项目亮点
> ⭐ **21,514 Stars** | 🔥 **AI 工作流自动化标准** | 🤖 **OpenAI 官方出品** | 📊 **1,940 Forks**

Symphony 是一个长期运行的自动化服务，将持续读取 issue 追踪器（当前版本为 Linear）中的工作，为每个 issue 创建隔离的工作空间，并在工作空间内运行编码代理会话。

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [openai/symphony](https://github.com/openai/symphony) |
| **语言** | Elixir |
| **Stars** | ⭐ 21,514 |
| **Forks** | 1,940 |
| **License** | Apache-2.0 |
| **创建时间** | 2026-02-26 |
| **主要标签** | ai, automation, workflow, orchestration, codex, elixir |
| **状态** | 🔥 活跃开发中（Engineering Preview）|

## 核心特性

### 🚀 工作流自动化

- **持续轮询**：以固定间隔从 issue 追踪器获取候选任务
- **隔离执行**：为每个 issue 创建独立工作空间，确保代理命令仅在指定目录内运行
- **并发控制**：支持有界并发，可配置最大同时运行的代理数量
- **自动重试**：使用指数退避策略从瞬态故障中恢复

### 🎯 策略即代码

- **WORKFLOW.md**：将工作流策略和代理提示词保存在代码库中
- **版本控制**：团队可以版本化代理提示词和运行时设置
- **可扩展性**：支持自定义 YAML front matter 配置和 Markdown 提示词模板

### 📊 可观测性

- **结构化日志**：提供运行时操作和调试的可见性
- **实时仪表板**：Phoenix LiveView 提供的 Web 界面（可选）
- **JSON API**：`/api/v1/*` 端点用于操作调试
- **Token 追踪**：监控 Codex 输入/输出 token 使用情况

### 🛡️ 安全与隔离

- **工作空间隔离**：每个 issue 有独立文件系统
- **Sandbox 策略**：支持 `read-only`、`workspace-write`、`danger-full-access`
- **审批策略**：可配置的 Codex 审批策略（`untrusted`、`on-failure`、`on-request`、`never`）
- **Hooks 机制**：`after_create`、`before_run`、`after_run`、`before_remove` 生命周期钩子

## 系统架构

### 6 层抽象架构

```
┌─────────────────────────────────────────────────────────────┐
│  Policy Layer (策略层)                                       │
│  WORKFLOW.md - 提示词模板 + 团队规则                         │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│  Configuration Layer (配置层)                                │
│  类型化 getter - 默认值、环境变量、路径规范化                │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│  Coordination Layer (协调层)                                 │
│  Orchestrator - 轮询循环、资格检查、并发、重试、对账        │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│  Execution Layer (执行层)                                    │
│  Workspace Manager + Agent Runner - 文件系统生命周期        │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│  Integration Layer (集成层)                                  │
│  Linear Adapter - API 调用和数据规范化                       │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│  Observability Layer (可观测性层)                            │
│  Logs + Status Surface - 运行时可见性                       │
└─────────────────────────────────────────────────────────────┘
```

### 8 大核心组件

| 组件 | 职责 | 关键功能 |
|------|------|---------|
| **Workflow Loader** | 读取 WORKFLOW.md | 解析 YAML front matter 和提示词模板 |
| **Config Layer** | 配置管理 | 应用默认值、环境变量解析、验证 |
| **Issue Tracker Client** | 追踪器交互 | 获取候选 issues、状态查询、数据规范化 |
| **Orchestrator** | 编排器 | 调度、重试、状态管理、并发控制 |
| **Workspace Manager** | 工作空间管理 | 创建、清理、生命周期钩子 |
| **Agent Runner** | 代理运行器 | 构建 prompt、启动 Codex、流式更新 |
| **Status Surface** | 状态展示 | 终端输出、仪表板（可选）|
| **Logging** | 日志系统 | 结构化日志输出 |

## 核心概念

### 1. Issue（工作单元）

规范化的 issue 记录，用于编排、提示词渲染和可观测性输出。

**核心字段**：
```elixir
%{
  id: "ISSUE-ID",
  identifier: "ABC-123",
  title: "Issue title",
  description: "Issue description",
  priority: 1,
  state: "In Progress",
  branch_name: "feature/abc-123",
  url: "https://linear.app/issue/ABC-123",
  labels: ["bug", "high-priority"],
  blocked_by: [%{id: "BLOCKER-ID", identifier: "XYZ-789"}],
  created_at: ~U[2026-05-05 10:00:00Z],
  updated_at: ~U[2026-05-05 12:00:00Z]
}
```

### 2. Workflow Definition（工作流定义）

从 `WORKFLOW.md` 解析的配置和提示词模板。

**结构**：
```yaml
---
tracker:
  kind: linear
  project_slug: "ABC"
  active_states: ["Todo", "In Progress"]
  terminal_states: ["Done", "Closed", "Cancelled"]
workspace:
  root: ~/code/workspaces
hooks:
  after_create: |
    git clone git@github.com:org/repo.git .
agent:
  max_concurrent_agents: 10
  max_turns: 20
codex:
  command: codex app-server
  thread_sandbox: workspace-write
---

You are working on Linear issue {{ issue.identifier }}.

Title: {{ issue.title }}
Description: {{ issue.description }}
```

### 3. Workspace（工作空间）

为每个 issue 分配的隔离文件系统工作空间。

**生命周期**：
1. **创建**：基于 `issue.identifier` 创建目录
2. **初始化**：执行 `after_create` hook（如 git clone）
3. **运行**：执行 `before_run` hook → 启动 Codex → 执行 `after_run` hook
4. **清理**：issue 到达终止状态时执行 `before_remove` hook → 删除目录

**命名规则**：
```
workspace_key = sanitize(issue.identifier)
# 将非 [A-Za-z0-9._-] 字符替换为 _
# "ABC-123" -> "ABC-123"
# "feat/backend!" -> "feat_backend_"
```

### 4. Run Attempt（运行尝试）

一次 issue 执行尝试。

**状态转换**：
```
pending → running → success | failure | timeout | cancelled
              ↓
           retry (with exponential backoff)
```

### 5. Live Session（实时会话）

编码代理子进程运行时跟踪的状态。

**追踪指标**：
- **Token 使用**：`codex_input_tokens`、`codex_output_tokens`、`codex_total_tokens`
- **Turn 计数**：`turn_count`（当前 worker 生命周期内的编码代理轮次）
- **速率限制**：`codex_rate_limits`（从代理事件获取的最新快照）
- **会话 ID**：`<thread_id>-<turn_id>`

### 6. Retry Queue（重试队列）

管理失败尝试的指数退避重试。

**字段**：
```elixir
%{
  issue_id: "ISSUE-ID",
  identifier: "ABC-123",
  attempt: 2,
  due_at_ms: System.monotonic_time(:millisecond) + backoff_ms,
  error: "Connection timeout"
}
```

## WORKFLOW.md 配置规范

### Front Matter 完整 Schema

```yaml
---
# Issue 追踪器配置
tracker:
  kind: linear                          # 必需：当前仅支持 linear
  endpoint: https://api.linear.app/graphql  # 默认值
  api_key: $LINEAR_API_KEY              # 环境变量或字面值
  project_slug: "ABC"                  # Linear 项目 slug
  active_states:                        # 候选状态
    - Todo
    - In Progress
  terminal_states:                      # 终止状态
    - Done
    - Closed
    - Cancelled
    - Duplicate

# 轮询配置
polling:
  interval_ms: 30000                    # 默认 30 秒

# 工作空间配置
workspace:
  root: ~/code/workspaces               # 支持 ~ 和 $VAR

# 生命周期钩子
hooks:
  after_create: |                       # 工作空间新建时执行
    git clone --depth 1 $REPO_URL .
    mise install
  before_run: |                        # 每次尝试前执行
    git pull origin main
  after_run: |                         # 每次尝试后执行
    git status
  before_remove: |                     # 删除前执行
    git push origin HEAD

# 代理配置
agent:
  max_concurrent_agents: 10             # 全局并发限制
  max_turns: 20                        # 单次会话最大轮次

# Codex 配置
codex:
  command: codex app-server             # Codex 启动命令
  thread_sandbox: workspace-write       # read-only | workspace-write | danger-full-access
  turn_sandbox_policy:                 # 每轮 sandbox 策略
    workspaceWrite:
      root: "."
  approval_policy:                      # 审批策略
    reject:
      sandbox_approval: true
      rules: true
      mcp_elicitations: true

# Web 服务器（可选）
server:
  port: 4000                           # 启用 Phoenix LiveView 仪表板
---
```

### 提示词模板语法

使用 Mustache 风格的变量插值：

```markdown
You are working on {{ issue.identifier }}.

## Issue Details
- **Title**: {{ issue.title }}
- **Description**: {{ issue.description }}
- **Priority**: {{ issue.priority }}
- **Labels**: {{ issue.labels }}
- **Branch**: {{ issue.branch_name }}

## Blocked By
{{#issue.blocked_by}}
- {{ identifier }}: {{ state }}
{{/issue.blocked_by}}

## Instructions
1. Analyze the issue
2. Implement the solution
3. Test thoroughly
4. Submit PR for review
```

## Elixir 实现详解

### 项目结构

```
elixir/
├── lib/                 # 应用代码和 Mix 任务
│   ├── symphony/       # 核心应用
│   └── mix/            # 自定义 Mix 任务
├── test/               # ExUnit 测试
├── priv/               # 私有资源
├── config/             # 运行时配置
│   ├── config.exs      # 主配置
│   └── dev.exs         # 开发环境
├── WORKFLOW.md         # 示例工作流
├── mix.exs             # 依赖管理
├── Makefile            # 构建任务
└── mise.toml           # mise 版本管理
```

### 快速开始

#### 1. 安装依赖

```bash
# 使用 mise 管理 Elixir/Erlang 版本
mise install
mise exec -- elixir --version

# 安装项目依赖
mise exec -- mix setup
```

#### 2. 构建项目

```bash
mise exec -- mix build
```

#### 3. 配置 Linear API

```bash
# 在 Linear 创建 Personal API Key
# Settings → Security & access → Personal API keys
export LINEAR_API_KEY=your_token_here
```

#### 4. 复制工作流文件

```bash
# 将 WORKFLOW.md 复制到你的代码库
cp symphony/elixir/WORKFLOW.md your-repo/WORKFLOW.md

# 自定义配置
vim your-repo/WORKFLOW.md
```

#### 5. 启动服务

```bash
# 基础模式（仅终端输出）
./bin/symphony ./WORKFLOW.md

# 带仪表板模式
./bin/symphony ./WORKFLOW.md --port 4000

# 自定义日志目录
./bin/symphony ./WORKFLOW.md --logs-root ./logs
```

### Web 仪表板

启动时使用 `--port` 参数即可启用 Phoenix LiveView 仪表板：

- **主页**：`http://localhost:4000/` — 实时运行状态
- **State API**：`/api/v1/state` — 完整编排器状态
- **Issue API**：`/api/v1/{issue_identifier}` — 特定 issue 详情
- **Refresh API**：`/api/v1/refresh` — 手动触发轮询

**仪表板功能**：
- 🔄 实时显示运行中的会话
- 📊 Token 使用统计
- 🔄 重试队列状态
- 📋 最近完成的任务
- ⚠️ 错误和警告日志

### 高级配置

#### SSH Workers

支持远程 SSH worker 执行：

```yaml
# WORKFLOW.md
workspace:
  root: ~/code/workspaces

codex:
  command: ssh user@worker "codex app-server"
```

#### 多项目支持

通过环境变量区分不同项目：

```bash
export SYMPHONY_WORKSPACE_ROOT=~/workspaces/project-a
./bin/symphony project-a/WORKFLOW.md

export SYMPHONY_WORKSPACE_ROOT=~/workspaces/project-b
./bin/symphony project-b/WORKFLOW.md
```

#### Hooks 实战示例

```yaml
hooks:
  # 完整的 Git 仓库设置
  after_create: |
    git clone --depth 1 git@github.com:org/repo.git .
    git config user.email "bot@example.com"
    git config user.name "Symphony Bot"

  # 安装依赖
  before_run: |
    npm ci
    mise install

  # 运行测试
  after_run: |
    npm test
    npm run lint

  # 清理前备份
  before_remove: |
    tar -czf /tmp/backups/{{ issue.identifier }}.tar.gz .
```

## 核心工作流

### 1. 正常执行流程

```
[轮询开始]
    ↓
[从 Linear 获取候选 issues]
    ↓
[检查资格（状态、阻塞、并发）]
    ↓
[创建/复用工作空间]
    ↓
[执行 before_run hook]
    ↓
[启动 Codex app-server]
    ↓
[发送工作流提示词]
    ↓
[流式接收 Codex 更新]
    ↓
[检查 issue 状态]
    ↓
[仍活跃？] → 是 → [继续下一轮]
    ↓ 否
[执行 after_run hook]
    ↓
[标记完成]
```

### 2. 重试流程

```
[执行失败]
    ↓
[记录错误]
    ↓
[计算退避时间（指数退避）]
    ↓
[添加到重试队列]
    ↓
[等待 due_at_ms]
    ↓
[重新尝试]
    ↓
[达到最大重试次数？] → 是 → [标记失败]
    ↓ 否
[继续重试]
```

### 3. 状态变化处理

```
[检测到 issue 状态变化]
    ↓
[变为终止状态？] → 是 → [停止活跃会话]
    ↓                   ↓
    否              [清理工作空间]
    ↓                   ↓
[继续执行]        [从 claimed 移除]
```

## 最佳实践

### 1. 工作流设计

```markdown
---
agent:
  max_concurrent_agents: 5          # 根据团队容量调整
  max_turns: 30                     # 给代理足够轮次完成工作
codex:
  approval_policy: on-failure       # 仅失败时需要人工审批
  thread_sandbox: workspace-write   # 平衡安全性和功能性
---

## 角色定义
你是一个高级软件工程师，负责实现 Linear issues。

## 工作流程
1. **理解需求**：仔细阅读 issue 标题和描述
2. **分析影响**：评估变更范围和潜在风险
3. **实现方案**：编写高质量、可测试的代码
4. **验证测试**：确保所有测试通过
5. **提交审核**：创建 PR 并附带清晰的描述

## 质量标准
- 代码必须通过所有测试
- 遵循项目代码风格
- 添加必要的文档注释
- 更新相关的 CHANGELOG

Issue: {{ issue.identifier }}
{{ issue.title }}
{{ issue.description }}
```

### 2. Hooks 最佳实践

```yaml
hooks:
  # ✅ 好的 after_create：幂等、快速、失败时明确
  after_create: |
    if [ ! -d ".git" ]; then
      git clone --depth 1 "$REPO_URL" . || exit 1
    fi

  # ❌ 避免的 after_create：重复克隆、无错误处理
  after_create: |
    git clone "$REPO_URL" .
    git clone "$REPO_URL" .  # 重复！
```

### 3. 并发管理

```yaml
# 根据资源调整
agent:
  max_concurrent_agents: 10    # 高性能机器
  # max_concurrent_agents: 3   # 资源受限环境

# 根据团队工作流调整
polling:
  interval_ms: 30000           # 快速响应（30秒）
  # interval_ms: 300000        # 低频轮询（5分钟）
```

### 4. 安全配置

```yaml
# ⚠️ 高风险配置（仅用于可信环境）
codex:
  approval_policy: never
  thread_sandbox: danger-full-access

# ✅ 推荐配置（平衡安全与效率）
codex:
  approval_policy:
    reject:
      sandbox_approval: true    # 需要 sandbox 审批
      rules: true               # 需要 rule 审批
      mcp_elicitations: true    # 需要 MCP 审批
  thread_sandbox: workspace-write
  turn_sandbox_policy:
    workspaceWrite:
      root: "."                 # 限制在工作空间内
```

### 5. 监控和调试

```bash
# 启用详细日志
export LOG_LEVEL=debug
./bin/symphony ./WORKFLOW.md

# 查看实时状态
curl http://localhost:4000/api/v1/state | jq '.'

# 监控特定 issue
watch -n 5 'curl -s http://localhost:4000/api/v1/ABC-123 | jq .'

# 检查日志
tail -f log/symphony.log
```

## 故障排除

### 常见问题

**问题 1：Linear API 认证失败**
```bash
# 检查 token
echo $LINEAR_API_KEY

# 测试连接
curl -X POST https://api.linear.app/graphql \
  -H "Authorization: $LINEAR_API_KEY" \
  -d '{"query":"{viewer{id}}"}'
```

**问题 2：工作空间创建失败**
```bash
# 检查磁盘空间
df -h

# 检查权限
ls -la ~/code/workspaces

# 手动测试 hook
bash -c 'git clone git@github.com:org/repo.git test-repo'
```

**问题 3：Codex 连接超时**
```yaml
# 增加 timeout
codex:
  command: timeout 600 codex app-server
```

**问题 4：并发限制导致任务排队**
```yaml
# 临时增加并发
agent:
  max_concurrent_agents: 20
```

### 调试技巧

```elixir
# 在 IEx 中调试
iex -S mix phx.server

# 检查编排器状态
:sys.get_state(Symphony.Orchestrator)

# 查看所有进程
:observer.start()

# 追踪消息流
:dbg.trace(:symphony_orchestrator)
```

## 性能优化

### 1. Token 优化

```yaml
# 减少 token 消耗的提示词
---
agent:
  max_turns: 10  # 降低轮次
---

简洁的指令，避免冗余描述。

Issue: {{ issue.identifier }} - {{ issue.title }}
```

### 2. 工作空间缓存

```yaml
hooks:
  after_create: |
    # 使用本地缓存镜像
    git clone --reference /path/to/mirror "$REPO_URL" .
```

### 3. 批量处理

```bash
# 启动多个 Symphony 实例处理不同项目
./bin/symphony project-a/WORKFLOW.md --logs-root logs/a &
./bin/symphony project-b/WORKFLOW.md --logs-root logs/b &
./bin/symphony project-c/WORKFLOW.md --logs-root logs/c &
```

## 生态系统

### 相关项目

- [Codex](https://openai.com/codex) — OpenAI 编码代理
- [Linear](https://linear.app) — Issue 追踪和项目管理
- [Harness Engineering](https://openai.com/index/harness-engineering/) — 适配代理的代码库实践

### 社区资源

- **GitHub Issues**：项目已禁用 issues，使用 PRs 进行讨论
- **Pull Requests**：20+ 个活跃 PRs，涵盖功能开发、Bug 修复、文档改进
- **SPEC.md**：完整的语言无关规范文档
- **Elixir 实现**：参考实现（非生产就绪）

### 贡献指南

由于项目处于 Engineering Preview 阶段：

1. **实现自己的版本**：基于 SPEC.md 实现 hardened 版本
2. **提交 PR**：改进 Elixir 参考实现
3. **反馈问题**：通过 PRs 报告 bug 和建议

## 未来方向

### 已识别的功能需求

从活跃 PRs 可以看出：

1. **网络访问支持**：允许特定工作流轮次访问网络（PR #65）
2. **Token 使用持久化**：记录每个 issue 的 token 消耗（PR #60）
3. **工作空间策略**：明确 issue root 的隐式工作空间写入策略（PR #58）
4. **规范澄清**：持续改进 SPEC.md 的清晰度（PR #61）

### 潜在扩展

- 支持更多 issue 追踪器（Jira、GitHub Issues）
- 增强的 sandbox 和安全策略
- 分布式编排和任务分发
- 更丰富的 Web UI 和分析工具

## 适用场景

| 场景 | 推荐度 | 说明 |
|------|--------|------|
| **AI 驱动的自动化开发** | ⭐⭐⭐⭐⭐ | 核心用例：将 issues 转化为代码 |
| **CI/CD 集成** | ⭐⭐⭐⭐⭐ | 自动测试、PR 创建、合并 |
| **重复性任务自动化** | ⭐⭐⭐⭐⭐ | 文档生成、代码迁移、依赖升级 |
| **多项目管理** | ⭐⭐⭐⭐ | 并发处理多个项目的工作项 |
| **团队协作** | ⭐⭐⭐⭐ | 高层管理工作，而非监督编码 |

## 项目状态

| 指标 | 状态 |
|------|------|
| **活跃度** | 🔥 高度活跃（OpenAI 官方维护）|
| **社区参与** | ⭐ 超高人气（21K+ Stars，1.9K+ Forks）|
| **维护状态** | ✅ 积极维护（Engineering Preview）|
| **生产就绪** | ⚠️ 需要基于 SPEC.md 实现生产版本 |
| **文档质量** | ✅ 文档完善（SPEC.md、README、AGENTS.md）|

---

## 与其他工具的关系

```
Symphony（编排层）
    ↓
Codex（执行层）
    ↓
代码库（目标）
    ↓
Linear（追踪器）
```

**关键区别**：
- **Symphony** ≠ 编码代理，而是**代理的编排器**
- **Codex** = 编码代理，执行具体任务
- **Linear** = Issue 追踪器，提供工作输入
- **代码库** = 工作输出，受版本控制

---

**文档版本**：v1.0
**最后更新**：2026-05-05
**维护者**：Claude Code Best Practice 项目
**来源**：GitHub 仓库收集 + gh-cli API 查询

## 相关文档

- [[guides/gh-cli-complete-guide]] — gh-cli 完整使用指南
- [SPEC.md](https://github.com/openai/symphony/blob/main/SPEC.md) — Symphony 官方规范
- [Elixir README](https://github.com/openai/symphony/blob/main/elixir/README.md) — Elixir 实现说明
