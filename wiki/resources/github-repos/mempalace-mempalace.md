---
name: mempalace-mempalace
description: 本地优先 AI 记忆系统 - 逐字存储，可插拔后端，LongMemEval 上 96.6% R@5 召回率，零 API 调用
type: source
version: 1.0
tags: [github, python, ai, memory, llm, rag, mcp, chromadb]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/resources/github/mempalace-2026-04-29.json
stars: 50283
forks: 6611
language: Python
license: MIT
github_url: https://github.com/MemPalace/mempalace
homepage: https://mempalaceofficial.com
---

# MemPalace

> 本地优先 AI 记忆系统。逐字存储，可插拔后端，LongMemEval 上 **96.6% R@5** 召回率 — 零 API 调用。

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [MemPalace/mempalace](https://github.com/MemPalace/mempalace) |
| **Stars** | 50,283 |
| **Forks** | 6,611 |
| **语言** | Python 3.9+ |
| **许可证** | MIT |
| **版本** | 3.3.3 |
| **官方文档** | [mempalaceofficial.com](https://mempalaceofficial.com) |

## 核心特性

### 逐字存储架构

MemPalace 将对话历史存储为**逐字原文**，而非摘要或提取物。索引结构化组织：

- **Wings（翅膀）**：人和项目
- **Rooms（房间）**：主题
- **Drawers（抽屉）**：原始内容

这种组织方式允许搜索时**限定范围**，而非在扁平语料库中搜索。

### 设计原则（7大核心）

| 原则 | 描述 |
|------|------|
| **逐字优先** | 始终保留原文，压缩仅用于索引 |
| **增量优先** | 增量更新，不做全量重建 |
| **实体优先** | 先识别实体，再组织内容 |
| **本地零API** | 无需 LLM API Key，完全本地运行 |
| **性能预算** | 每个查询 <10ms，内存 <100MB |
| **隐私架构** | 数据不出本地，架构即隐私 |
| **后台执行** | 所有操作异步后台运行 |

### Palace 结构详解

```
Palace (宫殿)
├── Wings (翅膀)     # 顶级组织：人、项目、Agent
│   └── Rooms (房间) # 次级组织：天、会话、主题
│       └── Drawers (抽屉) # 底层存储：逐字原文
```

### AAAK 压缩

AAAK（"Anything Anywhere As Keys"）是一种**压缩索引格式**：
- 将原始文本压缩为短键值对
- LLM 可快速扫描全部记忆
- 压缩率高达 90%+

### 知识图谱

时序实体关系图（Temporal Entity Graph）：
- 支持添加、查询、失效、时间线操作
- 后端为本地 SQLite
- 带有效性窗口的时间感知查询

### 可插拔检索层

当前默认使用 **ChromaDB** 作为向量存储后端。接口定义在 `mempalace/backends/base.py`，可轻松替换为其他后端。

### 基准测试成绩

| 基准 | 指标 | 分数 | 备注 |
|------|------|------|------|
| LongMemEval (Raw) | R@5 | **96.6%** | 无 LLM，无需 API Key |
| LongMemEval (Hybrid v4, held-out) | R@5 | **98.4%** | 在 50 个开发问题上调优 |
| LongMemEval (Hybrid v4 + LLM rerank) | R@5 | ≥99% | 任意 capable 模型 |
| LoCoMo (Hybrid v5) | R@10 | 88.9% | 1,986 问题 |
| ConvoMem | Avg recall | 92.9% | 50 每类别 |
| MemBench (ACL 2025) | R@5 | 80.3% | 8,500 项目 |

### MCP Server

提供 **29 个 MCP 工具**，覆盖：
- Palace 读写操作
- 知识图谱操作
- 跨 Wing 导航
- Drawer 管理
- Agent 日记

### Agent 支持

每个专家 Agent 在 Palace 中拥有自己的 Wing 和日记。可通过 `mempalace_list_agents` 在运行时发现，无需在 System Prompt 中添加冗余信息。

### 知识图谱

包含时序实体关系图（带有效性窗口），支持添加、查询、失效、时间线操作，后端为本地 SQLite。

### Auto-save Hooks

提供两个 Claude Code Hook，周期性保存并在上下文压缩前保存。会话级记忆命令：`mempalace sweep <transcript-dir>` — 为每条用户/助手消息创建逐字 Drawer，支持幂等和断点续传。

## 项目结构

```
mempalace/
├── .agents/              # Agent 配置
├── .claude-plugin/       # Claude Code 插件
├── .codex-plugin/       # Codex 插件
├── benchmarks/          # 基准测试
├── docs/                # 文档
├── examples/            # 示例代码
│   ├── basic_mining.py  # 基础挖掘示例
│   ├── convo_import.py  # 对话导入示例
│   ├── gemini_cli_setup.md
│   ├── HOOKS_TUTORIAL.md
│   └── mcp_setup.md     # MCP 服务器配置
├── hooks/               # Claude Code Hooks
├── integrations/        # 集成
├── mempalace/           # 核心代码
│   └── backends/       # 可插拔后端 (ChromaDB 默认)
├── tests/               # 测试 (pytest + coverage ≥80%)
└── website/             # 官方网站
```

### 关键文件说明

| 文件 | 用途 |
|------|------|
| `CLAUDE.md` | AI 助手指南，设计原则与架构 |
| `AGENTS.md` | Agent 角色定义 |
| `MISSION.md` | 项目使命与愿景 |
| `ROADMAP.md` | 路线图与未来规划 |
| `pyproject.toml` | 项目配置与依赖 |

### 代码规范

- **Python**: 3.9+
- **Linter**: ruff
- **Formatter**: ruff (with `ruff format`)
- **测试**: pytest
- **覆盖率阈值**: ≥80%

## 安装使用

### CLI 命令参考

| 命令 | 说明 | 示例 |
|------|------|------|
| `mempalace init` | 初始化新项目 | `mempalace init ~/projects/myapp` |
| `mempalace mine` | 挖掘内容 | `mempalace mine ~/projects/myapp` |
| `mempalace mine --mode convos` | 挖掘对话记录 | `mempalace mine ~/.claude/projects/` |
| `mempalace search` | 语义搜索 | `mempalace search "why did we switch"` |
| `mempalace wake-up` | 加载上下文到 LLM | `mempalace wake-up` |
| `mempalace sweep` | 整理会话记录 | `mempalace sweep ~/.claude/projects/` |
| `mempalace agents` | 列出所有 Agent | `mempalace agents` |

### 示例代码

**基础挖掘 (basic_mining.py):**
```python
from mempalace import Palace

palace = Palace("~/myproject")
palace.mine("src/")  # 挖掘项目文件
palace.mine("docs/")  # 挖掘文档
```

**对话导入 (convo_import.py):**
```python
from mempalace import Palace

palace = Palace("~/myproject")
palace.mine("~/.claude/projects/", mode="convos")
```

**MCP 服务器设置:**
```python
# mcp_setup.md - MCP Server 集成
from mempalace.mcp import MCP_SERVER

# 29 个 MCP 工具覆盖：
# - Palace 读写操作
# - 知识图谱操作
# - 跨 Wing 导航
# - Drawer 管理
# - Agent 日记
```

### Claude Code Hooks

```bash
# 自动保存 Hook（hooks/ 目录）
# 配置在 .claude/settings.json 中
# 周期性自动保存 + 上下文压缩前保存

# 会话级整理
mempalace sweep <transcript-dir>
# 为每条用户/助手消息创建逐字 Drawer
# 支持幂等和断点续传
```

## 技术栈

| 组件 | 技术 |
|------|------|
| 核心依赖 | chromadb>=1.5.4 |
| 配置格式 | pyyaml, tomli |
| 构建工具 | hatchling |
| 默认后端 | ChromaDB |
| 可选加速 | ONNX Runtime (GPU/DML/CoreML) |

## 相关资源

- 官方文档：https://mempalaceofficial.com
- GitHub：https://github.com/MemPalace/mempalace
- PyPI：https://pypi.org/project/mempalace/
- Discord：https://discord.com/invite/ycTQQCu6kn

## 适用场景

| 场景 | 说明 |
|------|------|
| **Claude Code 会话记忆** | 挖掘 Claude Code 对话历史，保持长期上下文 |
| **Gemini CLI 集成** | 支持 Gemini CLI 的会话挖掘 |
| **多 Agent 协作** | 每个专家 Agent 有独立 Wing，共享记忆 |
| **本地 LLM 应用** | 无 API 调用，完全本地运行 |
| **项目级上下文** | 高召回率检索，支持增量更新 |

### 与传统 RAG 对比

| 特性 | MemPalace | 传统 RAG |
|------|-----------|----------|
| 存储方式 | 逐字原文 | 摘要/提取 |
| API 依赖 | **零 API** | 需要 LLM API |
| 召回率 | 96.6%+ R@5 | 通常 70-85% |
| 索引更新 | 增量 | 往往全量重建 |
| 隐私 | 数据不出本地 | 可能上传云端 |

## 相关资源

| 资源 | 链接 |
|------|------|
| 官方文档 | https://mempalaceofficial.com |
| GitHub | https://github.com/MemPalace/mempalace |
| PyPI | https://pypi.org/project/mempalace/ |
| Discord | https://discord.com/invite/ycTQQCu6kn |
| Claude Code 插件 | `.claude-plugin/` |
| Codex 插件 | `.codex-plugin/` |
