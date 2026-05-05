---
name: ruvnet-ruflo
description: Ruflo - Claude 多智能体编排平台，提供100+专业化AI代理、自学习记忆、联邦通信和企业级安全
type: source
version: 1.0
tags: [github, typescript, agent, orchestration, claude, swarm, federation, rag]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/ruvnet-ruflo-2026-05-05.json
stars: 41986
language: TypeScript
license: MIT
github_url: https://github.com/ruvnet/ruflo
homepage: https://Cognitum.One
---

# Ruflo

> [!info]+ 项目概述
> - **类型**: Multi-Agent Orchestration Platform for Claude
> - **语言**: TypeScript
> - **许可证**: MIT
> - **Stars**: 41,986
> - **官网**: https://Cognitum.One
> - **演示**: https://flo.ruv.io (Web UI) · https://goal.ruv.io (Goal Planner)

## 核心价值主张

**Ruflo 为 Claude Code 添加神经系统**：一个 `init` 命令让 AI 智能体自组织成群体、从每个任务中学习、跨会话记忆，并通过联邦机制安全地与其他机器上的智能体协作。你继续写代码，Ruflo 处理协调。

### 解决的核心问题

| 问题 | Claude Code 原生 | Ruflo 解决方案 |
|------|------------------|--------------|
| **智能体隔离** | 各智能体独立运行，无共享上下文 | 🐝 **Swarm Coordination** - 群体共享记忆 + 共识机制 |
| **手动协调** | 需要人工编排智能体工作流 | 👑 **Queen-led Hierarchy** - Raft/Byzantine/Gossip 协议 |
| **无记忆持久化** | 会话结束后记忆丢失 | 💾 **Vector Memory** - AgentDB + HNSW 索引（150x-12,500x 更快） |
| **单机限制** | 只能运行在本地机器 | 🌐 **Agent Federation** - 跨机器/组织的零信任智能体协作 |
| **缺乏学习** | 无法从成功模式中学习 | 🧠 **Self-Learning** - SONA 神经模式 + ReasoningBank |
| **工具散乱** | 314个MCP工具，26个CLI命令 | 🧩 **Plugin Marketplace** - 32个原生插件自动集成 |

## 架构设计

### 系统架构图

```
Self-Learning / Self-Optimizing Agent Architecture

User --> Ruflo (CLI/MCP) --> Router --> Swarm --> Agents --> Memory --> LLM Providers
                          ^                           |
                          +---- Learning Loop <-------+
```

### 核心能力矩阵

| 能力 | 描述 | 技术实现 |
|------|------|---------|
| 🤖 **100+ Agents** | 编码、测试、安全、文档、架构专业化智能体 | Agent Registry + Skill System |
| 📡 **Comms Layer** | 零信任联邦 - 跨机器/组织智能体发现、认证、交换工作 | mTLS + ed25519 + Federation Protocol |
| 🐝 **Swarm Coordination** | 分层、网状、自适应拓扑 + 共识 | Raft/Byzantine/Gossip |
| 🧠 **Self-Learning** | SONA 神经模式、ReasoningBank、轨迹学习 | Trajectory Analysis + Pattern Mining |
| 💾 **Vector Memory** | HNSW 索引的 AgentDB（150x-12,500x 更快搜索） | HNSW + Vector Embeddings |
| ⚡ **Background Workers** | 12个自动触发工作器（审计、优化、测试覆盖等） | Cron + Event Triggers |
| 🧩 **Plugin Marketplace** | 32个原生 Claude Code 插件 + 21个 npm 插件 | Plugin System + Registry |
| 🔌 **Multi-Provider** | Claude、GPT、Gemini、Cohere、Ollama 智能路由 | Provider Abstraction + Load Balancing |
| 🛡️ **Security** | AIDefence、输入验证、CVE修复、路径遍历防护 | Security Pipeline + Audit Logs |
| 🌐 **Agent Federation** | 跨安装智能体协作 + 零信任安全 | Federation Protocol + Trust Scoring |

## 32个核心插件

### 核心与编排（Core & Orchestration）

| 插件 | 功能 |
|------|------|
| **ruflo-core** | 基础 - 服务器、健康检查、插件发现 |
| **ruflo-swarm** | 协调多个智能体作为团队工作 |
| **ruflo-autopilot** | 让智能体在循环中自主运行 |
| **ruflo-loop-workers** | 定时调度后台任务 |
| **ruflo-workflows** | 可重用的多步骤任务模板 |
| **ruflo-federation** | 不同机器上的智能体安全协作 |

### 记忆与知识（Memory & Knowledge）

| 插件 | 功能 |
|------|------|
| **ruflo-agentdb** | 智能体记忆的快速向量数据库 |
| **ruflo-rag-memory** | 智能检索 - 混合搜索、图跳转、多样性排序 |
| **ruflo-rvf** | 跨会话保存和恢复智能体记忆 |
| **ruflo-ruvector** | GPU加速搜索、Graph RAG、103个工具 |
| **ruflo-knowledge-graph** | 构建和遍历实体关系图 |

### 智能与学习（Intelligence & Learning）

| 插件 | 功能 |
|------|------|
| **ruflo-intelligence** | 智能体从过去的成功中学习并变得更聪明 |
| **ruflo-daa** | 动态智能体行为和认知模式 |
| **ruflo-ruvllm** | 运行本地LLM（Ollama等）+ 智能路由 |
| **ruflo-goals** | 将大目标分解为计划并跟踪进度 |

### 代码质量与测试（Code Quality & Testing）

| 插件 | 功能 |
|------|------|
| **ruflo-testgen** | 查找缺失的测试并自动生成 |
| **ruflo-browser** | 使用 Playwright 自动化浏览器测试 |
| **ruflo-jujutsu** | 分析 git diff、评分风险、建议审查者 |
| **ruflo-docs** | 自动生成和维护文档 |

### 安全与合规（Security & Compliance）

| 插件 | 功能 |
|------|------|
| **ruflo-security-audit** | 扫描漏洞和CVE |
| **ruflo-aidefence** | 阻止提示注入、检测PII、安全扫描 |

### 架构与方法论（Architecture & Methodology）

| 插件 | 功能 |
|------|------|
| **ruflo-adr** | 使用活记录跟踪架构决策 |
| **ruflo-ddd** | 领域驱动设计脚手架 - 上下文、聚合、事件 |
| **ruflo-sparc** | 5阶段开发方法论 + 质量门控 |

### DevOps 与可观测性（DevOps & Observability）

| 插件 | 功能 |
|------|------|
| **ruflo-migrations** | 安全管理数据库模式变更 |
| **ruflo-observability** | 结构化日志、追踪和指标统一管理 |
| **ruflo-cost-tracker** | 跟踪 token 使用、设置预算、获取成本警报 |

### 扩展性（Extensibility）

| 插件 | 功能 |
|------|------|
| **ruflo-wasm** | 运行沙箱化的 WebAssembly 智能体 |
| **ruflo-plugin-creator** | 脚手架、验证和发布自己的插件 |

### 领域特定（Domain-Specific）

| 插件 | 功能 |
|------|------|
| **ruflo-iot-cognitum** | IoT设备管理 - 信任评分、异常检测、集群 |
| **ruflo-neural-trader** | AI交易 - 4个智能体、回测、112+工具 |
| **ruflo-market-data** | 摄取市场数据、向量化OHLCV、检测模式 |

## Web UI Beta - flo.ruv.io

### 多模型 AI 聊天

**RuFlo 的 Web UI 是内置 MCP 工具调用的多模型 AI 聊天**。与 Qwen、Claude、Gemini 或 OpenAI 对话，Ruflo 调用与 CLI 相同的 MCP 工具 - 智能体编排、持久化记忆、群体协调、代码审查、GitHub 操作 - 直接从聊天中。

| 特性 | 说明 |
|------|------|
| 🧠 **任意模型，本地或远程** | 6个精选前沿模型 - Qwen 3.6 Max（默认）、Claude Sonnet 4.6、Claude Haiku 4.5、Gemini 2.5 Pro、Gemini 2.5 Flash、OpenAI。添加自己的：任何 OpenAI 兼容端点 |
| 🦾 **ruvLLM 自学习 AI** | 原生支持 ruvLLM - Ruflo 的自改进本地模型层。路由到 MicroLoRA 适配器，通过 SONA 从你的轨迹中学习 |
| 🛠️ **~210 工具，随时调用** | 5个服务器组（Core、Intelligence、Agents、Memory、DevTools）+ 18个完全在浏览器中运行的工具库 - 可离线工作 |
| 🔌 **自带 MCP 服务器** | 点击聊天输入中的 **MCP (n)** 药丸 → *添加服务器* 并粘贴任何 MCP 端点。你的工具加入 Ruflo 的原生工具 |
| ⚡ **工具并行运行** | 一个模型响应可以同时触发 4-6+ 个工具。UI 将它们显示为带有 *Step 1 — 2 tools completed* 徽章的卡片 |
| 💾 **持久化记忆** | 说 *"记住我最喜欢的颜色是靛蓝色"* 并在几周后询问 - Ruflo 会回忆起来。由 AgentDB + HNSW 向量搜索支持 |
| 📘 **内置能力导览** | 点击侧边栏中的问号图标 - 打开 "RuFlo Capabilities" 模态窗口 |
| 🏠 **可自托管** | Web UI 作为 Docker（`ruflo/src/ruvocal/Dockerfile`）发货，内嵌 Mongo。部署到自己的 Cloud Run/Fly/Kubernetes/docker-compose |
| 🚀 **零安装试用** | 打开托管 URL，选择模型，输入问题。这就是整个入门过程 |

**访问**: [https://flo.ruv.io/](https://flo.ruv.io/) - 无需账户，无需 API 密钥

## Goal Planner UI - goal.ruv.io

### 目标导向行动规划（GOAP）

**将高层目标转化为可执行的智能体计划**。`goal.ruv.io` 是 Ruflo 的托管目标导向行动规划前端 - 用纯英语描述结果，观看 Ruflo 将其分解为前置条件、行动和通过状态空间的 A* 路径，然后将工作分派给 [`/agents`](https://goal.ruv.io/agents) 的实时智能体。

| 特性 | 说明 |
|------|------|
| 🎯 **纯英语目标** | 输入 *"使用测试和PR重构认证功能"* - Ruflo 提取成功标准、约束和隐含前置条件 |
| 🧭 **GOAP A* 规划器** | 经典游戏AI规划移植到软件工作：通过具有前置条件/效果的行动进行状态空间搜索 |
| 🤖 **实时智能体仪表板** | [goal.ruv.io/agents](https://goal.ruv.io/agents) 显示每个生成的智能体 - 角色、当前步骤、记忆命名空间、token预算、状态 |
| 🌳 **可视化计划树** | 目标渲染为可折叠的行动树，带有进度、阻塞分支和回滚高亮 |
| ♻️ **自适应重规划** | 当行动失败或新信息到达时，规划器从当前状态重新运行 A* |
| 🧠 **共享记忆 + SONA** | 计划、轨迹和结果流入 AgentDB。未来计划通过 HNSW 检索过去的解决方案 |
| 🔗 **连接到 MCP 工具** | 每个行动节点映射到工具调用（Ruflo 的 ~210 个 MCP 工具） |

**访问**: [https://goal.ruv.io/](https://goal.ruv.io/) 目标 · [https://goal.ruv.io/agents](https://goal.ruv.io/agents) 实时智能体

## Agent Federation - 智能体的 Slack

### 零信任跨机器协作

```
Your Agent --> [ Remove secrets ] --> [ Sign message ] --> [ Encrypted channel ]
                 Emails, SSNs,        Proves it came       No one reads it
                 keys stripped         from you              in transit
                                                                |
                                                                v
Their Agent <-- [ Block attacks ] <-- [ Check identity ] <------+
                 Stops prompt          Rejects forgeries
                 injection

                          Audit trail on both sides.
                  Trust builds over time. Bad behavior = instant downgrade.
```

Slack 给团队频道。Federation 给智能体同样的东西 - **跨信任边界的共享工作空间**，不同机器、组织或云区域的智能体可以相互发现、证明身份并协作完成任务。

**关键特性**：

| 能力 | 工作原理 |
|------|---------|
| 🔒 **零信任联邦** | 远程智能体启动不受信任。通过 mTLS + ed25519 挑战-响应证明身份 |
| 🛡️ **PII 门控数据流** | 14种检测管道扫描每条出站消息。每信任级别策略：BLOCK、REDACT、HASH 或 PASS |
| 📊 **行为信任评分** | 公式（`0.4×success + 0.2×uptime + 0.2×threat + 0.2×integrity`）持续评估对等点 |
| 📋 **内置合规** | HIPAA、SOC2、GDPR 审计踪迹作为合规模式 |
| 🤝 **9个MCP工具 + 10个CLI命令** | 完整生命周期：`federation_init`、`federation_join`、`federation_send` 等 |

**示例：两个团队共享欺诈信号而不共享客户数据**

```bash
# Team A: 初始化联邦并生成密钥对
npx claude-flow@latest federation init

# Team A: 加入 Team B 的联邦端点
npx claude-flow@latest federation join wss://team-b.example.com:8443

# Team A: 发送任务 - PII在离开前自动剥离
npx claude-flow@latest federation send --to team-b --type task-request \
  --message "分析交易模式以发现账户异常"

# Team A: 检查对等信任级别和会话健康
npx claude-flow@latest federation status
```

## 快速开始

### Claude Code 插件（推荐）

```bash
# 添加市场
/plugin marketplace add ruvnet/ruflo

# 安装核心 + 任何你需要的插件
/plugin install ruflo-core@ruflo
/plugin install ruflo-swarm@ruflo
/plugin install ruflo-autopilot@ruflo
/plugin install ruflo-federation@ruflo
```

### CLI 安装

```bash
# 一行安装
curl -fsSL https://cdn.jsdelivr.net/gh/ruvnet/ruflo@main/scripts/install.sh | bash

# 或通过 npx
npx ruflo@latest init --wizard

# 或全局安装
npm install -g ruflo@latest
```

### MCP 服务器

```bash
# 在 Claude Code 中添加 Ruflo 作为 MCP 服务器
claude mcp add ruflo -- npx -y @claude-flow/cli@latest
```

## Claude Code: 有无 Ruflo 对比

| 能力 | Claude Code 原生 | + Ruflo |
|------|------------------|---------|
| **智能体协作** | 隔离，无共享上下文 | 带共享记忆和共识的 Swarms |
| **协调** | 手动编排 | Queen-led 层次结构（Raft、Byzantine、Gossip） |
| **记忆** | 会话内 | 跨会话持久化（AgentDB + HNSW） |
| **联邦** | 不支持 | 跨机器零信任协作 |
| **学习** | 无 | 从轨迹中自我改进（SONA） |
| **工具** | 手动管理 | 210+ MCP 工具自动集成 |
| **工作流** | 手动步骤 | 可重用模板 + 后台工作器 |
| **安全** | 基础 | AIDefence + CVE 扫描 + PII 检测 |

## 项目规模

| 指标 | 数值 |
|------|------|
| **Stars** | 41,986 |
| **Forks** | 4,688 |
| **Open Issues** | 505 |
| **Size** | 518 KB |
| **Created** | 2025-06-02 |
| **Last Updated** | 2026-05-05 |
| **Plugins** | 32 native + 21 npm |
| **MCP Tools** | ~210 tools |
| **Models Supported** | 6 frontier models + local |

## 相关链接

> [!links]+ 相关链接
> - [GitHub 仓库](https://github.com/ruvnet/ruflo)
> - [官方网站](https://Cognitum.One)
> - [Web UI Demo](https://flo.ruv.io)
> - [Goal Planner](https://goal.ruv.io)
> - [Live Agents Dashboard](https://goal.ruv.io/agents)
> - [Issues](https://github.com/ruvnet/ruflo/issues)
> - [Discussions](https://github.com/ruvnet/ruflo/discussions)
> - [Federation RFC](https://github.com/ruvnet/ruflo/issues/1669)

## 技术栈

| 组件 | 技术 |
|------|------|
| **语言** | TypeScript |
| **运行时** | Node.js, WebAssembly (Rust kernels) |
| **数据库** | MongoDB (Web UI), AgentDB (Vector) |
| **向量搜索** | HNSW indexing |
| **协议** | MCP (Model Context Protocol), Federation Protocol |
| **集成** | Claude Code, Claude API, OpenAI, Gemini, Cohere, Ollama |

## 项目状态

- ✅ 测试: Open Issues: 505
- ✅ 覆盖率: 未提供
- ✅ Forks: 4,688
- ✅ 许可证: MIT
- ✅ Web UI: Beta (flo.ruv.io)
- ✅ Goal Planner: Beta (goal.ruv.io)

---

*归档日期: 2026-05-05*
*数据来源: GitHub API + README.md*
*完整文档: 参见 [[../../../archive/resources/github/ruvnet-ruflo-2026-05-05.json]]*
