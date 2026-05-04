---
name: a2a-protocol-part1
description: A2A 协议深度解析 - 第 1 部分：双 Agent 同步调用场景
type: external
tags: [a2a, google, agent, protocol, bilibili]
created: 2026-05-04
updated: 2026-05-04
source: ../../../archive/Clippings/Bilibili/2026-05-04-A2A协议深度解析 - 第 1 部分：双Agent同步调用场景.md
external_source: https://www.bilibili.com/video/BV1GC7hzKEX9
author: 马克的技术工作坊
---

# A2A 协议深度解析 - 第 1 部分：双 Agent 同步调用场景

> [!info] 视频来源
> **作者**: 马克的技术工作坊
> **B站**: [BV1GC7hzKEX9](https://www.bilibili.com/video/BV1GC7hzKEX9)
> **上传日期**: 2025-06-03

## 视频章节

- `00:00` 前言
- `00:18` 什么是 Agent
- `01:58` A2A 协议使用场景
- `06:38` 启动 Agents
- `11:02` 抓包分析 A2A 协议
- `27:13` 核心概念回顾
- `29:54` 运行链路流程图
- `34:13` 结束语

## 核心内容

### 1. 什么是 Agent

Agent 是一种能够：
- 自主思考
- 调用外部工具
- 解决用户问题

的智能程序。

例如：我们用来写代码的 client 就是一个典型的 agent。

### 2. A2A 协议使用场景

**场景**：从西雅图飞纽约，选择天气最好的一天

**流程**：
1. 查找西雅图未来三天的天气预报
2. 根据天气预报，选择天气最好的一天
3. 查询那一天从西雅图到纽约的机票信息

**涉及的 Agent**：
- 调度 agent（orchestrator）
- 天气 agent（weather）
- 机票 agent（flight）

### 3. A2A vs MCP

| 协议 | 作用域 |
|------|--------|
| **A2A** | Agent 与 Agent 之间的交互 |
| **MCP** | Agent 内部与大模型和工具的交互 |

### 4. 核心概念

#### Agent Card

用于描述一个 Agent 的基本信息，可通过 `/well-known/agent.json` 访问。

**包含字段**：
- `capabilities`: Agent 的能力（如 streaming）
- `defaultInputModes`: 默认接受的输入格式
- `defaultOutputModes`: 默认的输出格式
- `description`: 描述
- `name`: 名称
- `skills`: 技能列表
- `url`: Agent 的 URL
- `version`: 版本

#### Message

用于在 Agent 之间交换信息的结构体。

**包含字段**：
- `contextId`: 上下文 ID
- `kind`: 结构体类型（message）
- `messageId`: 消息唯一 ID
- `parts`: 消息内容列表（每段内容是一个 part）
- `role`: 发起者（user）

#### Part

代表 message 或 artifacts 里的一段信息。

**类型**：
- `text`: 文本
- `file`: 文件（包括文件名、类型、base64 编码等）
- `data`: 其他数据

#### Task

代表被调用 Agent 根据请求所生成的任务。

**包含字段**：
- `artifacts`: Agent 的产物列表
- `contextId`: 上下文 ID
- `history`: 历史消息列表
- `id`: Task ID
- `kind`: 结构体类型（task）
- `status`: 任务状态（submitted, working, completed 等）

### 5. A2A Client vs A2A Server

| 角色 | 别称 | 说明 |
|------|------|------|
| **A2A Client** | Client Agent | 调用方 Agent（如调度 Agent） |
| **A2A Server** | Remote Agent | 被调用方 Agent（如天气 Agent） |

### 6. 运行链路流程图

#### Agent 注册阶段

1. 用户在平台输入 Agent 的 URL
2. 平台请求 Agent 的 `/well-known/agent.json`
3. Agent 返回 agent card
4. 平台创建调度 Agent，并提供：
   - 职责说明
   - 可用的 Agent 列表
   - 可用的工具

#### 用户问答阶段

1. 用户向平台提问
2. 平台转发给调度 Agent
3. 调度 Agent 寻找可解决问题的 Agent
4. 调度 Agent 使用 A2A 协议调用其他 Agent
5. 其他 Agent 返回结果
6. 调度 Agent 整理答案
7. 平台返回给用户

### 7. JSONRPC 请求格式

```json
{
  "id": "请求ID",
  "jsonrpc": "2.0",
  "method": "messageSend",  // 或 "messageStream"
  "params": {
    "configuration": {
      "acceptedOutputModes": ["text", "image/png"]
    },
    "message": {
      "contextId": "上下文ID",
      "kind": "message",
      "messageId": "消息ID",
      "parts": [
        {
          "kind": "text",
          "text": "西雅图明天的天气怎么样"
        }
      ],
      "role": "user"
    }
  }
}
```

### 8. 关键要点

1. **A2A 协议**作用于 Agent 与 Agent 之间
2. **MCP 协议**作用于 Agent 内部
3. **Agent Card** 描述 Agent 的基本信息
4. **Task** 由被调用方 Agent 生成
5. **决策权**始终在调用方 Agent 手中

## 相关视频

- [[a2a-protocol-part2]] — 第 2 部分：流式返回 + 多 Agent 场景

## 外部资源

- [Google A2A 协议规范](https://github.com/google/a2a)
- [A2A Samples 仓库](https://github.com/google/a2a-samples)

---

*字幕整理于 2026-05-04*
