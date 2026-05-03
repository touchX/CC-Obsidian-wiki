---
name: memu-usage-guide
description: memU 记忆系统的终端用户使用指南，涵盖 MCP 工具、REST API、分类系统、检索策略和最佳实践
type: guide
tags: [memu, memory, mcp, usage-guide]
created: 2026-05-03
updated: 2026-05-03
---

# memU 使用帮助文档

> **memU** 是一个基于 PostgreSQL + pgvector 的 MCP 记忆系统，提供语义化记忆存储和检索能力。它是 Claude Code 四层记忆架构中的长期语义知识层。

← [返回记忆系统文档](./ClaudeCode记忆系统.md)

---

## 目录

1. [什么是 memU](#1-什么是-memu)
2. [Quick Start](#2-quick-start)
3. [MCP 工具参考](#3-mcp-工具参考)
4. [REST API 参考](#4-rest-api-参考)
5. [分类系统](#5-分类系统)
6. [检索指南](#6-检索指南)
7. [最佳实践](#7-最佳实践)
8. [故障排除](#8-故障排除)
9. [集成到工作流](#9-集成到工作流)

---

## 1. 什么是 memU

memU 是一个运行在 Docker 中的记忆服务，提供：

| 特性 | 说明 |
|------|------|
| **语义搜索** | 基于向量相似度（pgvector cosine distance）的内容检索 |
| **双 Provider** | 支持智谱 AI (ZhipuAI) 和 Ollama 本地模型 |
| **自动分类** | LLM 自动对存储内容进行分类 |
| **双重检索** | RAG（纯向量检索）和 LLM（重排序检索）两种模式 |
| **MCP 集成** | 通过 5 个 MCP 工具与 Claude Code 原生集成 |

### 四层记忆架构中的定位

| 层 | 系统 | 用途 |
|----|------|------|
| 长期语义 | **memU** (MCP) | 持久化知识，跨会话可用 |
| 近期活动 | Claude-Mem (Skill) | 当前会话的时间线活动 |
| 环境静态 | Platform Memory | 自动管理的环境信息 |
| 统一入口 | Memory Hub (Skill) | 整合所有记忆层 |

---

## 2. Quick Start

### 2.1 启动服务

memU 以 Docker 容器运行：

```bash
# 进入部署目录
cd D:\OpenPath\MCPServer\memu-deploy

# 启动所有服务
docker-compose up -d

# 检查状态
docker ps --filter "name=memu" --format "{{.Names}}: {{.Status}}"
```

### 2.2 配置 Provider

在 `.env` 文件中配置：

```ini
# Provider 选择: zhipuai 或 ollama
LLM_PROVIDER=zhipuai

# ZhipuAI 配置（默认）
ZHIPUAI_API_KEY=your_api_key_here
LLM_CHAT_MODEL=glm-4-flash
LLM_EMBED_MODEL=embedding-3

# Ollama 配置（备选）
# LLM_PROVIDER=ollama
# OLLAMA_BASE_URL=http://localhost:11434
# OLLAMA_CHAT_MODEL=llama3.2
# OLLAMA_EMBED_MODEL=nomic-embed-text
# OLLAMA_EMBED_DIM=768
```

### 2.3 验证服务

```bash
# 健康检查
curl http://localhost:8000/health

# 预期响应
{"status":"healthy","llm_provider":"zhipuai","models":{"chat":"glm-4-flash","embed":"embedding-3","embed_dim":2048}}
```

---

## 3. MCP 工具参考

memU 注册了 5 个 MCP 工具，可在 Claude Code 中直接使用：

### 3.1 `memu_store`

存储内容到记忆。

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| `content` | string | 是 | 要记忆的内容 |
| `category` | string | 否 | 分类标签（不提供则 LLM 自动分类） |

**使用示例：**

```markdown
> 请记住：Claude Code 的 /compact 命令用于在接近上下文限制时压缩对话历史

> 请记住：项目 X 使用 React 18 + TypeScript 5.0，状态管理使用 Zustand
```

<details>
<summary>技术细节（点击展开）</summary>

**处理流程：**
1. 生成 content 的嵌入向量（调用 Provider 的 embedding API）
2. 如未提供 category，LLM 自动分类（提示词：将以下内容分类到不超过5字的类别）
3. 存储到 PostgreSQL memory_items 表
4. 自动注册分类到 categories 表

**数据库 Schema：**
```sql
memory_items (id SERIAL, item_id TEXT UNIQUE, content TEXT,
              category TEXT, embedding VECTOR(n), metadata JSONB,
              created_at TIMESTAMPTZ)
categories (id SERIAL, category_id TEXT UNIQUE, name TEXT, ...)
```
</details>

### 3.2 `memu_retrieve`

检索相关记忆。

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| `query` | string | 是 | 搜索查询 |
| `method` | string | 否 | 检索方法：`rag`（默认）或 `llm` |
| `max_items` | number | 否 | 返回结果数量上限（默认 5） |
| `category` | string | 否 | 按分类筛选 |

**使用示例：**

```markdown
> 搜索：React 项目使用了什么技术栈

> 搜索关于数据库配置的记忆，限制3条

> 使用 llm 方法搜索与认证相关的配置
```

### 3.3 `memu_categories`

列出所有分类及其条目计数。

**使用示例：**

```markdown
> 列出所有记忆分类
```

**响应示例：**
```json
{
  "success": true,
  "categories": [
    {"category_id": "cat_技术", "name": "技术", "item_count": 42},
    {"category_id": "cat_项目", "name": "项目", "item_count": 28}
  ]
}
```

### 3.4 `memu_stats`

获取记忆系统统计信息。

| 返回字段 | 说明 |
|----------|------|
| `total_items` | 总记忆条目数 |
| `total_categories` | 分类总数 |
| `llm_provider` | 当前 LLM Provider |
| `models` | 使用的模型配置 |
| `recent_items` | 最近 5 条记忆 |

**使用示例：**

```markdown
> 查看记忆系统状态
```

### 3.5 `memu_health`

检查服务健康状态。

**使用示例：**

```markdown
> 检查 memU 服务是否正常
```

---

## 4. REST API 参考

memU 提供完整的 REST API（端口 8000），可用于自定义集成。

### 4.1 健康检查

```
GET /health
```

**响应：** `{"status": "healthy", "llm_provider": "zhipuai", "models": {...}}`

### 4.2 存储记忆

```
POST /api/v1/memorize
Content-Type: application/json

{
  "content": "要记忆的内容",
  "category": "技术",       // 可选，不提供则自动分类
  "metadata": {"source": "chat", "priority": "high"}  // 可选
}
```

**响应：** `{"success": true, "item_id": "item_xxx", "category": "技术", "embedding_dimension": 2048}`

### 4.3 检索记忆

```
POST /api/v1/retrieve
Content-Type: application/json

{
  "query": "搜索关键词",
  "method": "rag",          // "rag" 或 "llm"
  "max_items": 5,           // 可选，默认 5
  "category": "技术"         // 可选，按分类筛选
}
```

**响应：** `{"success": true, "method": "rag", "query": "...", "total_items": N, "items": [...]}`

### 4.4 列出分类

```
GET /api/v1/categories
```

### 4.5 获取统计

```
GET /api/v1/stats
```

---

## 5. 分类系统

### 5.1 默认分类

| 分类 | 说明 | 存储内容示例 |
|------|------|-------------|
| **tech** | 技术知识 | 框架版本、库用法、架构决策 |
| **devtools** | 开发工具 | 编辑器配置、CLI 用法、调试技巧 |
| **solutions** | 解决方案 | Bug 修复、问题排查、Workaround |
| **project** | 项目信息 | 项目结构、技术栈、环境配置 |
| **preferences** | 偏好设置 | 编码风格、工作流偏好 |
| **经验技巧** | 经验总结 | 最佳实践、优化经验、教训 |

### 5.2 自动分类

当不提供 category 时，LLM 自动执行分类：
- 使用 system prompt：「将以下内容分类到一个简单的类别（不超过5个字）」
- 返回的类别自动注册到 categories 表
- 分类不限于预定义列表，LLM 可根据内容动态生成

### 5.3 手动分类 vs 自动分类

| 方式 | 优点 | 缺点 |
|------|------|------|
| **手动** | 分类准确，符合预期 | 需要用户主动指定 |
| **自动** | 无需思考分类，省时 | 分类可能不一致 |

**建议**：高价值内容手动分类，快速笔记用自动分类。

---

## 6. 检索指南

### 6.1 RAG 模式（默认）

**原理：** 纯向量相似度搜索
- 将查询文本转为向量
- 计算 cosine distance（`<=>`）
- 相似度公式：`1 - (embedding <=> $1::vector)`
- 返回 Top-N 最相似条目

**适用场景：**
- 快速关键词搜索
- 明确的事实查询
- 实时响应要求高的场景

### 6.2 LLM 模式

**原理：** RAG 候选 + LLM 重排序
1. 先用 RAG 检索 `max_items * 2` 条候选
2. 将候选列表和原始查询发给 LLM
3. LLM 选择最相关的项目编号
4. 按 LLM 选择重排序并截断

**适用场景：**
- 语义模糊的查询
- 需要理解上下文关联
- 希望获得更精准的结果

### 6.3 模式对比

| 维度 | RAG | LLM |
|------|-----|-----|
| **速度** | 毫秒级 | 秒级（需 LLM 调用） |
| **精度** | 关键词匹配 | 语义理解 |
| **资源消耗** | 低 | 需要 LLM API 调用 |
| **无结果时** | 返回空列表 | 尝试语义联想 |
| **适用查询** | 明确的关键词 | 复杂的自然语言 |

### 6.4 分类筛选

在检索时指定 `category` 可以：
- 缩小搜索范围，提高精度
- 减少不相关结果的干扰
- 加速检索（排除大量无关向量）

---

## 7. 最佳实践

### 7.1 存储时机

| 时机 | 示例 |
|------|------|
| **完成工作流后** | Bug 修复后存储根因和解决方案 |
| **学到新知识** | 发现新的 CLI 技巧或配置 |
| **项目决策** | 技术选型、架构变更 |
| **问题排查** | 复杂问题的排查路径 |

### 7.2 存储格式

**好的格式：**
```
项目 X 使用 React 18 + TypeScript 5.0，状态管理使用 Zustand，
UI 组件库使用 Ant Design 5.x，构建工具使用 Vite
```

**不好的格式：**
```
React18
```

**原则：** 一条记忆应包含完整的上下文，让未来的自己能理解。

### 7.3 检索技巧

- **使用具体的关键词**：`数据库连接配置` 优于 `配置`
- **结合分类筛选**：明确的分类减少噪声
- **先 RAG 后 LLM**：RAG 不够精确时换 LLM 模式
- **限制返回数量**：`max_items: 3-5` 避免信息过载

### 7.4 维护建议

- **每周检查**：运行 `memu_stats` 检查条目增长
- **定期清理**：删除过时或错误的记忆（通过 REST API）
- **分类整理**：使用 `memu_categories` 监控分类分布
- **去重**：发现重复内容时保留更完整的一条

---

## 8. 故障排除

### 8.1 memU 服务未运行

**现象：** `memu_health` 返回失败

**解决：**
```bash
cd D:\OpenPath\MCPServer\memu-deploy
docker-compose up -d
docker-compose logs -f
```

### 8.2 数据库连接失败

**现象：** 服务启动日志显示数据库错误

**解决：**
- 检查 PostgreSQL 是否正常运行：`docker ps | findstr postgres`
- 检查 `.env` 中的 DATABASE_URL 是否正确
- 检查端口 5432 是否被占用

### 8.3 Provider 调用失败

**现象：** 存储/检索时返回 Provider 错误

**解决：**
- **ZhipuAI**：检查 `ZHIPUAI_API_KEY` 是否有效且未过期
- **Ollama**：检查 `OLLAMA_BASE_URL` 是否可达，模型是否已下载
- 检查网络连接

### 8.4 检索结果不准确

**现象：** 返回内容与查询不相关

**解决：**
- 尝试切换到 `method: "llm"`（LLM 重排序）
- 使用更具体的关键词
- 指定 `category` 缩小范围
- 增加数据库中的相关条目数量

---

## 9. 集成到工作流

### 9.1 与 Memory Hub 集成

Memory Hub 是统一入口，调用 memU 的 MCP 工具：

```
/memory-hub store "内容"   → 调用 memu_store
/memory-hub search "查询"  → 调用 memu_retrieve
/memory-hub stats         → 调用 memu_stats
```

### 9.2 与 Claude-Mem 配合

| 系统 | 用途 | 生命周期 |
|------|------|----------|
| Claude-Mem | 当前会话活动追踪 | 会话内（可跨会话检索） |
| memU | 长期知识存储 | 永久（需主动存储） |

**工作流：** 会话结束前，将 Claude-Mem 中的高价值信息手动存储到 memU。

### 9.3 与 Knowledge Radar Hook 配合

Knowledge Radar 是 PreToolUse hook，在特定工具调用后自动存储上下文到 memU：

```
编辑文件后 → 自动存储变更摘要到 memU
Git 提交后 → 自动存储提交信息到 memU
```

通过 Knowledge Radar 实现零摩擦的知识积累。

### 9.4 MCP 配置参考

在 `mcp.json` 中的配置：

```json
{
  "memu": {
    "command": "docker",
    "args": ["exec", "-i", "memu-memu-server-1", "python", "-m", "mcp_server"],
    "env": {
      "LLM_PROVIDER": "zhipuai",
      "ZHIPUAI_API_KEY": "${ZHIPUAI_API_KEY}"
    }
  }
}
```

---

## 附录：快速参考卡

```markdown
# 存储
> 请记住：{内容}

# 检索（RAG，默认）
> 搜索：{查询}

# 检索（LLM 重排序）
> 使用 llm 方法搜索：{查询}

# 检索+分类筛选
> 搜索项目相关的记忆

# 查看分类
> 列出所有记忆分类

# 查看统计
> 查看记忆系统状态

# 健康检查
> 检查 memU 服务是否正常
```

---

> **相关文档：**
> - [Claude Code 记忆系统架构](./ClaudeCode记忆系统.md)
> - [记忆系统重建手册](./Memory-System-Rebuild-Handbook.md)
> - [记忆策略规则](/.claude/rules/memory-strategy.md)
