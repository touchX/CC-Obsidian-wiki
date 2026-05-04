---
name: tutorials/a2a-protocol-guide
description: A2A 协议深度解析 — Google Agent-to-Agent 协议、流式返回与多 Agent 协作
type: tutorial
tags: [tutorial, a2a, agent, google, protocol, multi-agent]
created: 2026-05-04
updated: 2026-05-04
source: ../../../archive/clippings/bilibili/2026-05-04-a2a-protocol/原始字幕.md
related:
  - "[[tutorials/agent-concepts-principles-patterns]]"
  - "[[tutorials/rag-mechanism-guide]]"
  - "[[concepts/agentic-ai-design-patterns]]"
---

# A2A 协议深度解析

基于马克的技术工作坊视频教程系列，共两期。

| 期数 | 主题 | BVID | 时长 | 上传日期 |
|------|------|------|------|----------|
| 第 1 部分 | 双 Agent 同步调用场景 | BV1GC7hzKEX9 | 35:43 | 2025-06-03 |
| 第 2 部分 | 流式返回 + 多 Agent 场景 | BV1dRTRzUED3 | 17:16 | 2025-06-08 |

## 课程概述

本教程系统讲解 Google 推出的 **A2A（Agent-to-Agent）协议**，涵盖核心概念、协议规范、抓包分析以及多 Agent 协作模式。

**学习目标**：
1. 理解 A2A 协议的定义和适用场景
2. 掌握 A2A 与 MCP 的区别与联系
3. 学习 A2A 协议的五大核心结构（Agent Card、Task、Artifact、Part、Message）
4. 掌握同步调用与流式返回两种模式
5. 理解多 Agent 协作流程（调度 Agent + 专业 Agent）

## A2A 协议概念

### 什么是 A2A

> [!tip] 核心定义
> **A2A（Agent-to-Agent）协议** 是 Google 于 2025 年 4 月 9 日发布的，规定了 Agent 与 Agent 之间沟通的规范和标准。

**类比理解**：
- **MCP** = 个人工具接口（Agent 调用外部工具）
- **A2A** = 团队协作接口（Agent 与 Agent 协同工作）

### 为什么需要 A2A

**单一 Agent 的局限**：
- 每个 Agent 设计目标不同（如 Cline 擅长写代码，不擅长订机票）
- 工具越多，系统提示词越长，Token 消耗越大
- 不同任务需要不同专业能力

**A2A 解决方案**：
- 各司其职：创建专业 Agent（天气 Agent、机票 Agent）
- 调度协作：调度 Agent 拆解任务并分发给专业 Agent
- 降低成本：减少单个 Agent 的工具数量和提示词长度

### A2A vs MCP

| 维度 | A2A | MCP |
|------|-----|-----|
| **作用范围** | Agent **之间**（Agent ↔ Agent） | Agent **内部**（Agent ↔ Tool） |
| **目的** | 多 Agent 协作与通信 | Agent 调用外部工具 |
| **类比** | 团队协作规范 | 个人使用工具规范 |
| **设计者** | Google | Anthropic |
| **通信方式** | JSON-RPC over HTTP | 多样化传输协议 |

```
┌─────────────────────────────────────────────────────────┐
│                     A2A 范围                             │
│  ┌─────────────┐                  ┌─────────────┐      │
│  │ 调度 Agent  │◄──── A2A ──────►│ 天气 Agent  │      │
│  │             │                  │             │      │
│  │  ┌───────┐  │                  │  ┌───────┐  │      │
│  │  │ LLM   │  │                  │  │ LLM   │  │      │
│  │  └───┬───┘  │                  │  └───┬───┘  │      │
│  │      │ MCP  │                  │      │ MCP  │      │
│  │  ┌───▼───┐  │                  │  ┌───▼───┐  │      │
│  │  │ Tools │  │                  │  │ Tools │  │      │
│  │  └───────┘  │                  │  └───────┘  │      │
│  └─────────────┘                  └─────────────┘      │
└─────────────────────────────────────────────────────────┘
```

## A2A 协议五大核心结构

### 1. Agent Card

Agent 的"自我介绍"，通过 `/.well-known/agent.json` 路径访问。

```json
{
  "capabilities": {
    "streaming": false
  },
  "defaultInputModes": ["text"],
  "defaultOutputModes": ["text"],
  "description": "负责处理天气相关任务",
  "name": "Weather Agent",
  "skills": [
    {
      "description": "提供天气预报",
      "examples": ["给我纽约未来七天的天气预告"],
      "id": "weather_forecast",
      "name": "天气预报",
      "tags": ["天气", "预告"]
    }
  ],
  "url": "http://127.0.0.1:10000",
  "version": "1.0.0"
}
```

| 字段 | 说明 |
|------|------|
| **capabilities** | 能力声明（如 streaming 是否支持流式返回） |
| **description** | Agent 描述 |
| **skills** | 技能列表（功能+触发示例+标签） |
| **url** | Agent 访问地址 |
| **version** | 版本号 |

### 2. Message（消息）

Agent 之间交换信息的结构体。

```json
{
  "id": "msg_001",
  "kind": "message",
  "parts": [
    {
      "type": "text",
      "text": "西雅图明天的天气怎么样？"
    }
  ],
  "role": "user",
  "contextId": "conv_001"
}
```

### 3. Part（片段）

Message 或 Artifact 中的一段内容，支持多种类型：

| 类型 | 说明 | 示例 |
|------|------|------|
| **text** | 文本内容 | `"天气晴朗"` |
| **file** | 文件（含 base64） | 图片、文档 |
| **data** | 结构化数据 | JSON 数据 |

### 4. Task（任务）

被调用 Agent 创建的异步任务，跟踪执行状态。

| 状态 | 说明 |
|------|------|
| **submitted** | 任务已提交，正在处理 |
| **working** | 任务执行中 |
| **completed** | 任务已完成 |
| **input_required** | 需要用户提供更多输入 |

### 5. Artifact（产物）

Agent 执行任务后产出的结果。

```json
{
  "id": "artifact_001",
  "description": "天气预报结果",
  "name": "weather_report",
  "parts": [
    {
      "type": "text",
      "text": "明天西雅图天气晴朗，温度20-25°C"
    }
  ]
}
```

## 同步调用模式（第 1 部分）

### 概念

同步调用（`messages_send`）指被调用 Agent 一次性返回完整结果，适用于短时间可完成的任务。

### 调用流程

```
调度 Agent                          天气 Agent
    │                                   │
    ├──────── messages_send ───────────►│
    │      method: "messages_send"      │
    │      params.message: 用户问题     │
    │                                   │
    │◄─────── JSON-RPC 返回 ────────────┤
    │      id: 与请求相同               │
    │      result.task:                 │
    │        - status.state: completed  │
    │        - artifacts[].parts: 答案  │
    │                                   │
```

### 同步调用 JSON-RPC 请求

```json
{
  "id": "req_001",
  "jsonrpc": "2.0",
  "method": "messages_send",
  "params": {
    "configuration": {
      "acceptedOutputModes": ["text", "text/plain"]
    },
    "message": {
      "contextId": "conv_001",
      "kind": "message",
      "messageId": "msg_001",
      "parts": [
        { "type": "text", "text": "西雅图明天的天气怎么样？" }
      ],
      "role": "user"
    }
  }
}
```

### 同步调用返回

```json
{
  "id": "req_001",
  "jsonrpc": "2.0",
  "result": {
    "kind": "task",
    "status": { "state": "completed" },
    "artifacts": [
      {
        "id": "art_001",
        "description": "天气预报",
        "name": "weather_report",
        "parts": [
          { "type": "text", "text": "明天西雅图天气晴朗..." }
        ]
      }
    ],
    "history": [
      {
        "kind": "message",
        "parts": [/* 原始请求 */],
        "role": "user"
      }
    ]
  }
}
```

## 流式返回模式（第 2 部分）

### 概念

流式返回（`messages_stream`）指服务器连续发送多次响应，适用于长时间运行或逐步输出结果的任务。

### 流式消息序列（5 条消息模式）

```
消息 1  [status: submitted]
    ── 任务已提交，正在处理
    │
消息 2  [artifacts_update, last_chunk: false]
    ├── 产物片段 1/3
    │
消息 3  [artifacts_update, last_chunk: false]
    ├── 产物片段 2/3
    │
消息 4  [artifacts_update, last_chunk: true]
    ├── 产物片段 3/3（最后一个片段）
    │
消息 5  [status: completed]
    ── 任务已完成，整个流结束
```

### 流式调用请求

```json
{
  "id": "req_002",
  "jsonrpc": "2.0",
  "method": "messages_stream",
  "params": {
    "configuration": {
      "acceptedOutputModes": ["text"]
    },
    "message": {
      "parts": [
        { "type": "text", "text": "查询5月1日西雅图飞纽约的航班" }
      ],
      "role": "user"
    }
  }
}
```

> [!tip] 关键差异
> - **同步调用**：method = `messages_send`，一次性返回
> - **流式返回**：method = `messages_stream`，分多次返回
> - Agent Card 中的 `capabilities.streaming` 声明是否支持流式返回

## 双阶段运行流程

### 第一阶段：Agent 注册

```
用户                   平台               调度 Agent          天气 Agent
 │                      │                    │                  │
 ├── 输入 Agent URL ──►│                    │                  │
 │                      ├── GET /.well-known/agent.json ──────►│
 │                      │◄── Agent Card ───────────────────────┤
 │                      │                    │                  │
 │                      ├── 创建调度 Agent ──►│                  │
 │                      │                    │                  │
 │◄── 注册完成 ─────────┤                    │                  │
```

注册阶段中，只有 **Agent Card 的获取过程**使用了 A2A 协议。

### 第二阶段：问答阶段

```
用户                   平台               调度 Agent          天气 Agent
 │                      │                    │                  │
 ├── 提问 ────────────►│                    │                  │
 │                      ├── 转发问题 ───────►│                  │
 │                      │                    │                  │
 │                      │                    ├── messages_send ─►│
 │                      │                    │◄── 天气结果 ─────┤
 │                      │                    │                  │
 │                      │◄── 整理答案 ───────┤                  │
 │◄── 最终答案 ────────┤                    │                  │
```

问答阶段中，只有 **调度 Agent ↔ 天气 Agent 的通信**使用了 A2A 协议。

## 多 Agent 协作流程（第 2 部分）

### 架构

```
                    调度 Agent
                    ┌───────┐
                    │ LLM   │
                    │  +    │
                    │ Tools │
                    └───┬───┘
                        │
           ┌────────────┼────────────┐
           │ A2A        │ A2A        │
           ▼             ▼             │
     ┌──────────┐   ┌──────────┐      │
     │ 天气 Agent│   │ 机票 Agent│      │
     │ (端口1万) │   │(端口1万01)│      │
     └──────────┘   └──────────┘      │
```

### 完整执行示例

**用户问题**："我计划在5月1日至3日之间从西雅图飞往纽约，想选择出发当天阳光明媚的日子，请帮我查看天气并提供机票信息。"

```
Step 1: 调度 Agent → 天气 Agent
        "请提供5月1日至3日的西雅图天气预报"
        ← 5/1晴天、5/2小雨、5/3大雨

Step 2: 调度 Agent 决策
        选择 5月1日（唯一晴天）作为出发日

Step 3: 调度 Agent → 机票 Agent（流式返回）
        "请提供5月1日从西雅图飞往纽约的航班信息"
        ← [流式5条消息] 航班信息逐步返回

Step 4: 调度 Agent 整理
        综合天气和机票信息 → 最终答案
```

### 多 Agent 扩展

- 当 Agent 数量超过 3 个时，调度 Agent 承担任务拆解和分发职责
- 调度 Agent 拥有可用 Agent 列表（注册时由平台提供）
- 调度 Agent 使用 `send_message` 工具与其他 Agent 通信
- 只要 Agent 数量不过于夸张，此方案可线性扩展

## 技术栈与环境

### 依赖组件

| 组件 | 说明 |
|------|------|
| **Python / UV** | Agent 运行环境，UV 为 Python 包管理器 |
| **Google AI Studio API Key** | 调度 Agent 使用 Google ADK（Agent Development Kit） |
| **Wireshark** | 网络抓包工具，分析 A2A 协议通信内容 |
| **Google A2A Samples** | 官方示例仓库，包含调度 Agent + 平台 UI |

### 关键端口

| Agent | 端口 |
|-------|------|
| 天气 Agent | 10000 |
| 机票 Agent | 10001 |
| 调度 Agent + 平台 | 12000 |

## 课程资源

- **视频来源**：马克的技术工作坊
- **第 1 部分 BVID**：BV1GC7hzKEX9
- **第 2 部分 BVID**：BV1dRTRzUED3
- **字幕语言**：中文
- **上传日期**：2025-06-03 / 2025-06-08
- **官方规范**：[Google A2A 协议规范](https://google.a2a/protocol)

## 相关页面

- [[tutorials/agent-concepts-principles-patterns]] — Agent 概念与构建模式
- [[tutorials/rag-mechanism-guide]] — RAG 工作机制详解
- [[concepts/agentic-ai-design-patterns]] — Agent 设计模式深入
- [[concepts/multi-agent-systems]] — 多智能体系统概念

> [!tip] 学习建议
> 本教程建议结合实践学习：
> 1. 先理解 A2A 与 MCP 的区别（概念基础）
> 2. 掌握五大核心结构（Agent Card / Task / Artifact / Part / Message）
> 3. 理解同步调用 vs 流式返回的差异
> 4. 搭建多 Agent 系统尝试实际通信
> 5. 参考 Google A2A Samples 仓库深入学习
