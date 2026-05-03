---
name: nevamind-memu
description: 24/7 主动式 AI 代理记忆系统 — 三层分层记忆，支持 RAG 和 LLM 双模式检索
type: source
version: 1.0
tags: [github, python, agent-memory, mcp, claude, proactive, skills, sandbox]
created: 2026-05-03
updated: 2026-05-03
source: ../../../archive/resources/github/nevamind-memu-2026-05-03.json
stars: 13514
language: Python
license: Other
github_url: https://github.com/NevaMind-AI/memU
homepage: https://memu.pro
---

# memU

> **Memory for 24/7 proactive agents like OpenClaw.** — 为全天候主动式 AI 代理打造的持久化记忆引擎，支持意图捕获、分层记忆和双模式检索。

## 基本信息

| 字段 | 值 |
|------|-----|
| 作者 | [NevaMind-AI](https://github.com/NevaMind-AI) |
| 语言 | Python (+ Rust 组件) |
| Stars | ![](https://img.shields.io/github/stars/NevaMind-AI/memU) |
| Forks | 1,011 |
| 许可证 | Other |
| Topics | `agent-memory` `agentic-workflow` `claude` `claude-skills` `mcp` `memory` `openclaw` `proactive` `sandbox` `skills` |

## 链接

- **GitHub**: https://github.com/NevaMind-AI/memU
- **官网**: https://memu.pro
- **API**: https://api.memu.so (v3)
- **Issue**: https://github.com/NevaMind-AI/memU/issues
- **讨论**: https://github.com/NevaMind-AI/memU/discussions

## 核心特性

### 🧠 24/7 主动式记忆

持续在后台运行，与主代理并行工作，实现"监控 → 记忆 → 主动智能"的闭环。自动跨会话保持目标、偏好和上下文。

### 🎯 用户意图捕获

自动理解并保留用户的长期目标和偏好，无需显式命令即可在合适时机主动提供相关信息。

### 💰 Token 成本优化

通过智能缓存和洞察复用，显著减少冗余 LLM 调用 — 上下文大小约为同类方案的 **1/10**。

### 📂 记忆即文件系统

采用三层分层架构组织记忆：

| 层级 | 类比 | 说明 |
|------|------|------|
| **Resource** | 挂载点 | 原始数据源（对话、文档、图片） |
| **Item** | 文件 | 提取的事实、偏好、技能 |
| **Category** | 文件夹 | 自动组织的话题分组 |

支持交叉引用（符号链接）和资源挂载机制。

### 🔍 双模式检索

| 模式 | 速度 | 适用场景 |
|------|------|----------|
| **RAG** (Embedding) | 亚秒级 | 持续后台监控、上下文装配 |
| **LLM** (深度推理) | 几秒 | 意图预测、查询演进、深度分析 |

## 生态项目

| 项目 | 说明 |
|------|------|
| **memU** | 核心主动式记忆引擎 |
| **memU-server** | 后端服务，实时同步和 Webhook |
| **memU-ui** | 可视化记忆面板 |
| **memUBot** | 企业级 OpenClaw，可直接部署的主动式 AI 助手 |

## 项目结构

```
NevaMind-AI/memU/
├── .github/            # GitHub Actions 工作流
├── assets/             # 资源文件
├── docs/               # 文档
├── examples/           # 使用示例
├── readme/             # README 多语言版本
├── src/                # Python 源码
├── tests/              # 测试套件
├── AGENTS.md           # Agent 配置
├── CHANGELOG.md        # 变更日志
├── CONTRIBUTING.md     # 贡献指南
├── Cargo.toml          # Rust 组件配置
├── LICENSE.txt         # 许可证
├── Makefile            # 构建脚本
├── pyproject.toml      # Python 项目配置
└── README.md           # 项目说明
```

## 快速开始

### 安装

```bash
pip install -e .
```

**要求**: Python 3.13+ 和 OpenAI API Key（或自定义 LLM/Embedding 提供商）

### 快速测试（内存模式）

```bash
export OPENAI_API_KEY=your_api_key
cd tests
python test_inmemory.py
```

### 持久化存储（PostgreSQL + pgvector）

```bash
docker run -d --name memu-postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=memu \
  -p 5432:5432 pgvector/pgvector:pg16

cd tests
python test_postgres.py
```

### API 使用示例

**记忆存储（memorize）**：

```python
result = await service.memorize(
    resource_url="path/to/file.json",
    modality="conversation",  # 或 document | image | video | audio
    user={"user_id": "123"}
)
```

**智能检索（retrieve）**：

```python
result = await service.retrieve(
    queries=[
        {"role": "user", "content": {"text": "What are their preferences?"}},
    ],
    where={"user_id": "123"},
    method="rag"  # 或 "llm"
)
```

### 自定义 LLM

支持 OpenAI、OpenRouter 和自定义端点（如 Qwen、Voyage），嵌入和对话模型可使用不同提供商。OpenRouter 允许通过单一 API 使用 `anthropic/claude-3.5-sonnet` 等模型。

## 与本项目的关联

memU 已被本项目用于 **memU MCP 服务器** 实现语义长期记忆存储。其核心工作流已集成到：

- [[memory-hub-skill]] — 作为统一记忆中心的 Layer 1 语义层
- 三层记忆架构中的长期语义知识存储
- 遵循"完成成熟工作流后，主动存储经验到 memU"的策略

## 标签

#agent-memory #agentic-workflow #claude #claude-skills #mcp #memory #openclaw #proactive-ai #sandbox #skills #python #rust

---

*收集时间：2026-05-03* | Stars: 13,514 | Forks: 1,011
