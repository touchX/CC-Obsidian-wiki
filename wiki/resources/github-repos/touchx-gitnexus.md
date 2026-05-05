---
name: touchx-gitnexus
description: GitNexus - 零服务器代码智能引擎，浏览器中的知识图谱创建器
type: source
tags: [github, code-intelligence, knowledge-graph, rag, browser, mcp]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/touchx-gitnexus-2026-05-05.json
stars: 0
language: 未检测
license: Other
github_url: https://github.com/touchX/GitNexus
---

# GitNexus

> [!info] Repository Overview
> **GitNexus** 是一个零服务器代码智能引擎，完全在浏览器中运行的知识图谱创建器。它可以将任何代码库索引为交互式知识图谱，跟踪每个依赖、调用链、集群和执行流，通过智能工具暴露给 AI 代理，让 AI 助手永不遗漏代码细节。

## 📊 仓库统计

| 指标 | 数值 |
|------|------|
| ⭐ Stars | 0 (Fork 仓库) |
| 🍴 Forks | 0 |
| 💻 语言 | 未检测 |
| 🏢 所有者 | touchX (User) |
| 📄 许可证 | Other |
| 🔗 链接 | [github.com/touchX/GitNexus](https://github.com/touchX/GitNexus) |
| 🌐 主页 | [gitnexus.vercel.app](https://gitnexus.vercel.app) |
| 📅 创建时间 | 2026-05-05 |
| 📅 更新时间 | 2026-05-05 |

> [!warning] 重要提示
> GitNexus **没有官方的加密货币、代币或币**。任何在 Pump.fun 或其他平台上使用 GitNexus 名称的代币/币**均与本项目或其维护者无关**。请勿购买任何声称与 GitNexus 相关的加密货币。

## 🎯 核心功能

### 1. **知识图谱索引**
- **功能**: 将任何代码库索引为知识图谱
- **特性**:
  - 跟踪每个依赖关系
  - 完整的调用链分析
  - 代码集群识别
  - 执行流追踪
- **适用场景**: 代码理解、架构分析、影响范围评估

### 2. **Graph RAG Agent**
- **功能**: 内置检索增强生成代理
- **特性**:
  - 基于知识图谱的智能检索
  - 上下文感知的代码分析
  - 自然语言查询接口
- **适用场景**: 代码问答、智能搜索、自动化文档

### 3. **零服务器架构**
- **功能**: 完全在浏览器/本地运行
- **特性**:
  - 无需后端服务器
  - 数据隐私保护
  - 零网络延迟
- **适用场景**: 隐私敏感项目、离线环境

### 4. **多输入支持**
- **功能**: 灵活的代码库导入方式
- **特性**:
  - GitHub 仓库直接导入
  - ZIP 文件上传
  - 本地文件夹索引
- **适用场景**: 代码审查、项目分析、知识分享

## 🚀 两种使用方式

### CLI + MCP（推荐用于开发）

| 特性 | 说明 |
|------|------|
| **用途** | 本地索引仓库，通过 MCP 连接 AI 代理 |
| **适用场景** | 日常开发，与 Cursor、Claude Code、Codex、Windsurf、OpenCode 集成 |
| **规模** | 支持任意大小的完整仓库 |
| **安装** | `npm install -g gitnexus` |
| **存储** | LadybugDB 原生（快速、持久化） |
| **解析** | Tree-sitter 原生绑定 |
| **隐私** | 一切本地运行，无需网络 |

### Web UI（推荐用于探索）

| 特性 | 说明 |
|------|------|
| **用途** | 可视化图形浏览器 + 浏览器内 AI 聊天 |
| **适用场景** | 快速探索、演示、一次性分析 |
| **规模** | 受浏览器内存限制（约 5k 文件），或通过后端模式无限制 |
| **安装** | 无需安装 — 访问 [gitnexus.vercel.app](https://gitnexus.vercel.app) |
| **存储** | LadybugDB WASM（内存中，会话级别） |
| **解析** | Tree-sitter WASM |
| **隐私** | 一切在浏览器中，无服务器 |

> **Bridge 模式**: `gitnexus serve` 连接两种方式 — Web UI 自动检测本地服务器，无需重新上传或重新索引即可浏览所有 CLI 索引的仓库。

## 🛠️ CLI 命令参考

### 基础命令

```bash
# 配置编辑器的 MCP（一次性）
gitnexus setup

# 索引仓库（从仓库根目录运行）
npx gitnexus analyze

# 强制完整重新索引
gitnexus analyze --force

# 从检测到的社区生成仓库特定的技能文件
gitnexus analyze --skills

# 跳过嵌入生成（更快）
gitnexus analyze --skip-embeddings

# 保留自定义 AGENTS.md/CLAUDE.md gitnexus 部分的编辑
gitnexus analyze --skip-agents-md

# 索引非 Git 仓库的文件夹
gitnexus analyze --skip-git
```

### MCP 服务器

```bash
# 启动 MCP 服务器
npx gitnexus mcp

# 启动桥接服务器（连接 Web UI）
gitnexus serve
```

## 🔌 编辑器集成

### Claude Code（完全支持）

```bash
# macOS / Linux
claude mcp add gitnexus -- npx -y gitnexus@latest mcp

# Windows
claude mcp add gitnexus -- cmd /c npx -y gitnexus@latest mcp
```

**集成特性**:
- ✅ MCP 工具
- ✅ Agent 技能
- ✅ PreToolUse Hooks（用图形上下文增强搜索）
- ✅ PostToolUse Hooks（检测提交后的过期索引并提示重新索引）

### Cursor

配置 `~/.cursor/mcp.json`（全局，适用于所有项目）：

```json
{
  "mcpServers": {
    "gitnexus": {
      "command": "npx",
      "args": ["-y", "gitnexus@latest", "mcp"]
    }
  }
}
```

### Codex

```bash
codex mcp add gitnexus -- npx -y gitnexus@latest mcp
```

### Windsurf

```json
{
  "mcpServers": {
    "gitnexus": {
      "command": "npx",
      "args": ["-y", "gitnexus@latest", "mcp"]
    }
  }
}
```

### OpenCode

配置 `~/.config/opencode/config.json`：

```json
{
  "mcp": {
    "gitnexus": {
      "type": "local",
      "command": ["gitnexus", "mcp"]
    }
  }
}
```

## 👥 社区集成

由社区构建 — 非官方维护，但值得探索。

| 项目 | 作者 | 描述 |
|------|------|------|
| [pi-gitnexus](https://github.com/tintinweb/pi-gitnexus) | [@tintinweb](https://github.com/tintinweb) | GitNexus 的 [pi](https://pi.dev) 插件 — `pi install npm:pi-gitnexus` |
| [gitnexus-stable-ops](https://github.com/ShunsukeHayashi/gitnexus-stable-ops) | [@ShunsukeHayashi](https://github.com/ShunsukeHayashi) | 稳定操作和部署工作流（Miyabi 生态系统） |

> 有基于 GitNexus 的项目吗？欢迎提交 PR 添加！

## 🏢 企业版

GitNexus 提供企业版 — 完全托管的 **SaaS** 或**自托管**部署。也提供 OSS 版本的**商业使用**许可。

### 企业版功能

- **PR 审查** — 拉取请求的自动爆炸半径分析
- **自动更新代码 Wiki** — 始终最新的文档（OSS 版本也可用代码 Wiki）
- **自动重新索引** — 知识图谱保持新鲜
- **多仓库支持** — 跨仓库的统一图谱
- **OCaml 支持** — 额外的语言覆盖
- **优先功能/语言支持** — 请求新语言或功能

### 即将推出

- 自动回归取证
- 端到端测试生成

👉 了解更多信息：[akonlabs.com](https://akonlabs.com)

💬 商业许可或企业咨询，请在 [Discord](https://discord.gg/AAsRVT6fGb) 联系我们或发送邮件至 founders@akonlabs.com

## 🏗️ 架构组件

### 存储引擎

- **LadybugDB 原生** (CLI) — 快速、持久化的本地存储
- **LadybugDB WASM** (Web) — 内存中、会话级别的浏览器存储

### 代码解析

- **Tree-sitter 原生绑定** (CLI) — 高性能代码解析
- **Tree-sitter WASM** (Web) — 浏览器内代码解析

### 知识图谱

- **依赖图** — 跟踪模块和包依赖关系
- **调用图** — 完整的函数调用链
- **集群图** — 代码组织和结构
- **执行流** — 运行时流程分析

## 📖 使用场景

### 1. 代码理解

```
场景: 接手新项目
操作:
  1. 导入仓库到 GitNexus
  2. 浏览知识图谱了解架构
  3. 使用 Graph RAG Agent 查询特定功能
结果: 快速理解代码库结构和设计意图
```

### 2. 影响分析

```
场景: 修改核心函数
操作:
  1. 在知识图谱中定位函数
  2. 查看完整的调用链
  3. 识别所有受影响的下游代码
结果: 精准评估修改影响范围
```

### 3. 代码审查

```
场景: 审查 PR 变更
操作:
  1. 对比变更前后的知识图谱
  2. 检查新增的依赖关系
  3. 验证调用链完整性
结果: 发现潜在的架构问题和副作用
```

### 4. 文档生成

```
场景: 生成代码文档
操作:
  1. 索引代码库
  2. 使用 AGENTS.md 模板
  3. 让 Graph RAG Agent 自动生成
结果: 始终更新的自动化文档
```

## 🔧 开发文档

项目包含详细的开发文档：

- [ARCHITECTURE.md](https://github.com/touchX/GitNexus/blob/main/ARCHITECTURE.md) — 包、索引 → 图谱 → MCP 流程、代码修改位置
- [RUNBOOK.md](https://github.com/touchX/GitNexus/blob/main/RUNBOOK.md) — 分析、嵌入、过期索引、MCP 恢复、CI 片段
- [GUARDRAILS.md](https://github.com/touchX/GitNexus/blob/main/GUARDRAILS.md) — 贡献者和代理的安全规则和操作"标志"
- [CONTRIBUTING.md](https://github.com/touchX/GitNexus/blob/main/CONTRIBUTING.md) — 许可证、设置、提交和拉取请求
- [TESTING.md](https://github.com/touchX/GitNexus/blob/main/TESTING.md) — `gitnexus` 和 `gitnexus-web` 的测试命令

## 🎓 核心概念

### 知识图谱 vs. 传统搜索

| 维度 | 传统搜索 | GitNexus 知识图谱 |
|------|---------|-----------------|
| **理解** | 基于文本匹配 | 基于语义关系 |
| **深度** | 文件级描述 | 代码级关系 |
| **追踪** | 静态快照 | 动态调用链 |
| **洞察** | 表面理解 | 架构洞察 |

### Like DeepWiki, but deeper

> *像 DeepWiki，但更深。* DeepWiki 帮助你**理解**代码。GitNexus 让你**分析**它 — 因为知识图谱跟踪每个关系，而不仅仅是描述。

## 🌐 相关资源

> [!links]+ 相关链接
> - [GitHub 仓库](https://github.com/touchX/GitNexus)
> - [Web 应用](https://gitnexus.vercel.app)
> - [官方 Discord](https://discord.gg/MgJrmsqr62)
> - [NPM 包](https://www.npmjs.com/package/gitnexus)
> - [企业版](https://akonlabs.com)
> - [许可证](https://polyformproject.org/licenses/noncommercial/1.0.0/)

## 💡 最佳实践

### 1. 索引策略

```bash
# 首次索引：完整索引
npx gitnexus analyze

# 日常开发：自动检测过期索引
gitnexus analyze  # 会自动判断是否需要重新索引

# 大型项目：跳过嵌入加速
npx gitnexus analyze --skip-embeddings
```

### 2. MCP 配置

```bash
# 一次性配置所有编辑器
npx gitnexus setup

# 手动配置单个编辑器
# Claude Code
claude mcp add gitnexus -- npx -y gitnexus@latest mcp
```

### 3. 工作流集成

```
开发流程:
  1. 开始项目 → npx gitnexus analyze
  2. 日常编码 → MCP 自动提供上下文
  3. 提交代码 → PostToolUse Hook 提示重新索引
  4. 代码审查 → 使用知识图谱分析影响
```

## 🚦 快速开始

### 1 分钟体验

```bash
# 安装
npm install -g gitnexus

# 索引当前项目
cd your-project
npx gitnexus analyze

# 配置 Claude Code
npx gitnexus setup
```

### Web UI 体验

```
1. 访问 https://gitnexus.vercel.app
2. 输入 GitHub 仓库 URL 或上传 ZIP
3. 探索交互式知识图谱
4. 使用 Graph RAG Agent 聊天
```

## 📊 性能对比

| 场景 | 传统 LLM | GitNexus + 小模型 | GitNexus + 大模型 |
|------|---------|-----------------|-----------------|
| **代码理解** | 表面理解 | 深度架构洞察 | 最深洞察 |
| **依赖追踪** | 容易遗漏 | 完整追踪 | 完整追踪 |
| **调用链** | 部分覆盖 | 全链路 | 全链路 |
| **影响分析** | 不准确 | 精准评估 | 最精准 |
| **成本** | 高（大模型） | 低（小模型） | 中（中模型） |

> **核心优势**: 即使是小模型也能获得完整的架构清晰度，使其能与巨型模型竞争。

## 📝 许可证

本项目使用 **PolyForm Noncommercial 1.0.0** 许可证。

**商业使用**:
- 企业版 SaaS 或自托管部署
- OSS 版本的商业使用许可
- 联系 founders@akonlabs.com

---

*最后更新: 2026-05-05*
*数据来源: GitHub API + README.md*
