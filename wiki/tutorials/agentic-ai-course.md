---
name: tutorials/agentic-ai-course
description: 吴恩达 Agentic AI 教程 — 大模型入门到进阶完整课程笔记
type: tutorial
tags: [tutorial, agent, ai, andrew-ng, deeplearning-ai, multi-agent, knowledge-graph]
created: 2026-05-04
updated: 2026-05-04
source: ../../archive/clippings/bilibili/2026-05-04-llm-agent-course/
related:
  - "[[concepts/agentic-ai-design-patterns]]"
  - "[[tutorials/mcp-basics]]"
  - "[[tutorials/mcp-advanced]]"
---

# Agentic AI 教程 — 大模型入门到进阶

基于 DeepLearning.AI 吴恩达老师的 Agentic AI 课程，BV1DfrdByE2H，共 43 个视频。

## 课程概述

本课程学习目标：
1. 构建智能体设计模式：反射、工具使用、规划与多智能体工作流
2. 将人工智能与外部工具集成：数据库、API、网络搜索与代码执行
3. 评估并优化人工智能系统：性能指标、错误分析与生产部署

## 设计模式概览

### 智能体自主等级

| 等级 | 能力 | 应用场景 |
|------|------|----------|
| **Level 1** | 固定步骤执行 | 简单问答、结构化输出 |
| **Level 2** | 工具选择 | RAG、数据库查询、API 调用 |
| **Level 3** **推荐** | 自主规划步骤序列 | 复杂任务、代码生成 |

### 四大核心模式

1. **反射模式 (Reflection)** — LLM 自我批判输出
2. **工具使用模式 (Tool Use)** — 函数调用与结果处理
3. **规划模式 (Planning)** — 自主决定行动序列
4. **多智能体模式 (Multi-Agent)** — 多角色协作系统

## 课程模块

### 模块一：设计模式基础 (视频 1-10)

| 视频 | 主题 | 关键内容 |
|------|------|----------|
| 1-4 | Agent 概述 | 自主等级、循环执行 vs 批量处理 |
| 5-6 | 反射模式 | 自我批判、输出优化 |
| 7-8 | 工具使用 | 函数调用、API 集成 |
| 9-10 | 规划模式 | JSON 输出 vs 代码执行 |

### 模块二：工具集成 (视频 11-20)

| 视频 | 主题 | 关键内容 |
|------|------|----------|
| 11-13 | RAG 与搜索 | 向量检索、语义搜索 |
| 14-16 | 代码执行 | 沙箱环境、错误反馈 |
| 17-18 | 网络搜索 | 实时信息获取 |
| 19-20 | API 与函数调用 | OpenAI SDK、参数提取 |

### 模块三：评估方法 (视频 21-30)

| 视频 | 主题 | 关键内容 |
|------|------|----------|
| 21-23 | 评估指标 | 精确率、召回率、F1 |
| 24-26 | LLM-as-Judge | AI 评估AI、提示工程 |
| 27-28 | 轨迹分析 | 错误追踪、问题定位 |
| 29-30 | 端到端评估 | 生产环境监控 |

### 模块四：多智能体系统 (视频 31-43)

| 视频 | 主题 | 关键内容 |
|------|------|----------|
| 31-34 | 架构设计 | Agent 分层、状态管理 |
| 35-36 | Google ADK | Agent 开发套件、工具定义 |
| 37-38 | 文件建议 Agent | 用户意图理解、文件采样 |
| 39-40 | 模式提案 Agent | 提议-批评-迭代循环 |
| 41-42 | 知识图谱构建 | Neo4j、实体识别、关系抽取 |
| 43 | 课程总结 | 系统整合、实际应用 |

## 核心实现

### 反射模式实现

```python
def reflection_agent(user_input):
    # 第一次生成
    initial_response = generate_response(user_input)
    
    # 自我批判
    critique = critique_response(initial_response)
    
    # 基于批评改进
    improved_response = improve_response(initial_response, critique)
    
    return improved_response
```

### 工具使用模式实现

```python
# 定义工具
tools = [
    {
        "name": "search_database",
        "description": "Search product database",
        "parameters": {
            "type": "object",
            "properties": {
                "query": {"type": "string"}
            }
        }
    }
]

# Agent 执行
result = agent.run(user_input, tools=tools)
```

### 多智能体协作

```
┌─────────────────────────────────────────┐
│           Coordinator Agent              │
│         (意图理解与任务分发)              │
└─────────────┬───────────────────────────┬─┘
             │                           │
    ┌────────▼────────┐         ┌────────▼────────┐
    │ File Suggestor │         │ Pattern Proposer│
    │   Agent       │         │    Agent        │
    └────────┬────────┘         └────────┬────────┘
             │                           │
    ┌────────▼────────┐         ┌────────▼────────┐
    │  Entity NER    │         │ Pattern Critic │
    │   Agent       │         │    Agent       │
    └────────────────┘         └────────────────┘
```

## Google ADK 实现

### Agent 定义

```python
from google.adk.agents import Agent

file_suggestion_agent = Agent(
    name="file_suggestion_agent",
    model="gemini-2.0-flash",
    description="Suggest relevant files for knowledge graph construction",
    tools=[
        list_import_files,
        sample_file,
        set_suggested_files,
        get_suggested_files,
        approve_suggested_files
    ]
)
```

### 工具定义模式

```python
def list_import_files():
    """列出可导入的文件"""
    return [f for f in os.listdir("data/") if f.endswith((".csv", ".md"))]

def sample_file(filename: str) -> str:
    """采样文件内容"""
    with open(f"data/{filename}") as f:
        lines = f.readlines()
    return "".join(lines[:100])  # 前100行
```

### 状态管理

```python
session_state = {
    "user_goal": "将产品评论添加到知识图谱",
    "approved_files": ["reviews.csv", "products.csv"],
    "construction_plan": {...}
}
```

## 知识图谱构建

### Neo4j 集成

```python
from neo4j import GraphDatabase

class KnowledgeGraphBuilder:
    def create_uniqueness_constraint(self, label: str, property: str):
        """创建唯一性约束"""
        query = f"""
        CREATE CONSTRAINT IF NOT EXISTS FOR (n:{label}) 
        REQUIRE n.{property} IS UNIQUE
        """
        self.driver.execute_query(query)
    
    def load_nodes_from_csv(self, filepath: str, label: str):
        """从CSV加载节点"""
        query = """
        LOAD CSV WITH HEADERS FROM '{filepath}' AS row
        MERGE (n:{label} {{{property}: row.{property}}})
        SET n += row
        """
        self.driver.execute_query(query)
```

### 实体解析

```python
from jellyfish import jaro_winkler_similarity

def resolve_entity(entity: str, known_entities: list) -> str:
    """使用 Jaro-Winkler 距离匹配实体"""
    best_match = None
    best_score = 0.1  # 阈值
    
    for known in known_entities:
        score = jaro_winkler_similarity(entity, known)
        if score > best_score:
            best_score = score
            best_match = known
    
    return best_match or entity
```

### 文本分块

```python
import re

def chunk_markdown(content: str) -> list[str]:
    """使用正则表达式分块"""
    pattern = r'^##\s+(.+)$'
    sections = re.split(pattern, content, flags=re.MULTILINE)
    
    chunks = []
    for i in range(1, len(sections), 2):
        title = sections[i]
        body = sections[i + 1] if i + 1 < len(sections) else ""
        chunks.append({"title": title, "content": body})
    
    return chunks
```

## 评估系统

### LLM-as-Judge 提示

```python
judge_prompt = """
你是一个专家评估员。请评估以下回答的质量：

问题：{question}
回答：{response}

评估维度：
1. 准确性 - 回答是否正确？
2. 完整性 - 是否覆盖所有要点？
3. 相关性 - 是否针对问题回答？
4. 清晰度 - 表达是否清晰？

请给出 0-10 的评分和详细理由。
"""
```

### 错误追踪

```python
def analyze_trajectory(trajectory: list) -> dict:
    """分析 Agent 执行轨迹"""
    errors = []
    for step in trajectory:
        if step.get("error"):
            errors.append({
                "step": step["index"],
                "error_type": classify_error(step["error"]),
                "context": step["state"]
            })
    
    return {
        "total_steps": len(trajectory),
        "error_count": len(errors),
        "errors": errors,
        "success_rate": 1 - len(errors) / len(trajectory)
    }
```

## MCP 协议集成

| MCP 服务器 | 用途 | 资源 |
|-----------|------|------|
| [[claude-mcp]] | 获取最新库文档 | Reddit 热门 |
| Playwright | 浏览器自动化 | 前端测试 |
| Chrome DevTools | 实时调试 | DOM 监控 |
| DeepWiki | GitHub 仓库文档 | 架构分析 |

## 课程资源

- **视频来源**：DeepLearning.AI
- **BVID**：BV1DfrdByE2H
- **课件代码**：评论区自取
- **字幕语言**：中文

## 后续学习路径

1. **[[tutorials/mcp-basics]]** — MCP 协议基础
2. **[[tutorials/mcp-advanced]]** — MCP 高级应用

> [!tip] 学习建议
> 本课程建议按顺序学习，每个模块都包含理论讲解和代码实现。
> 重点关注多智能体系统的状态管理和 Agent 协作模式。

## 相关页面

- [[tutorials/mcp-protocol-analysis]] — MCP 协议深入分析
