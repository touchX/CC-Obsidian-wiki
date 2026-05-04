---
name: a2a-protocol-part2
description: A2A 协议深度解析 - 第 2 部分：流式返回 + 多 Agent 场景
type: external
tags: [a2a, google, agent, protocol, streaming, bilibili]
created: 2026-05-04
updated: 2026-05-04
source: ../../../archive/Clippings/Bilibili/2026-05-04-A2A协议深度解析 - 第 2 部分：流式返回 + 多Agent场景.md
external_source: https://www.bilibili.com/video/BV1dRTRzUED3
author: 马克的技术工作坊
---

# A2A 协议深度解析 - 第 2 部分：流式返回 + 多 Agent 场景

> [!info] 视频来源
> **作者**: 马克的技术工作坊
> **B站**: [BV1dRTRzUED3](https://www.bilibili.com/video/BV1dRTRzUED3)
> **上传日期**: 2025-06-08

## 视频章节

- `00:00` 视频内容介绍
- `00:34` 什么是流式返回
- `01:40` 抓包分析 A2A 的流式响应规范
- `11:18` 更多数量的 Agent 协作流程

## 核心内容

### 1. 什么是流式返回

**传统 HTTP 交互**：
- 浏览器发送请求
- 服务器返回结果
- 一去一回，一次交互完成

**流式返回**：
- 浏览器只需请求一次
- 服务器连续发送多次响应
- 每次响应包含几个字
- 浏览器接收到就显示
- 用户体验更好

**大模型聊天页面**：
- 结果都是几个字几个字返回
- 使用流式返回
- 用户可以及时看到模型输出

### 2. A2A 流式返回规范

#### 请求方法

```json
{
  "method": "messageStream"  // 期望流式返回
}
```

对比非流式：
```json
{
  "method": "messageSend"  // 期望一次性返回
}
```

#### 流式返回的消息序列

**第 1 条消息**：Task 已提交
```json
{
  "kind": "statusUpdate",
  "status": {
    "state": "submitted"
  }
}
```

**第 2-N 条消息**：Artifacts 更新
```json
{
  "kind": "artifactsUpdate",
  "artifacts": [...],
  "lastChunk": false  // 表示还有更多内容
}
```

**最后一条 artifacts 消息**：
```json
{
  "kind": "artifactsUpdate",
  "artifacts": [...],
  "lastChunk": true  // 所有 artifacts 信息已返回完毕
}
```

**最后一条消息**：Task 完成
```json
{
  "kind": "statusUpdate",
  "status": {
    "state": "completed"
  }
}
```

#### 流式返回模式

```
1. 提交任务 (submitted)
   ↓
2. 更新 artifacts (artifactsUpdate, lastChunk: false)
   ↓
3. 更新 artifacts (artifactsUpdate, lastChunk: false)
   ↓
4. 更新 artifacts (artifactsUpdate, lastChunk: true)
   ↓
5. 完成任务 (completed)
```

### 3. 多 Agent 协作流程

#### 场景：选择天气最好的一天并查询机票

**用户问题**：
```
我计划在 5月1日至3日之间从西雅图飞往纽约，
想选择出发当天阳光明媚的日子。
请帮我查看这三天的天气，选择最好的一天，
并提供当天的机票信息。
```

**涉及的 Agent**：
- 调度 agent（orchestrator）
- 天气 agent（weather）
- 机票 agent（flight）

#### 协作流程

```
用户
  ↓ 提问
平台
  ↓ 转发
调度 Agent
  ↓ 1. 查询天气（5月1-3日）
天气 Agent
  ↓ 返回：5月1日晴天，2日小雨，3日大雨
调度 Agent
  ↓ 2. 查询机票（5月1日）
机票 Agent
  ↓ 流式返回 5 条消息
调度 Agent
  ↓ 整理答案
平台
  ↓ 返回
用户
```

#### 关键点

1. **调度 Agent 的职责**：
   - 拆解用户问题
   - 决定调用哪些 Agent
   - 整理 Agent 的返回结果
   - 生成最终答案

2. **Agent 数量扩展**：
   - 3 个 Agent：1 个调度 + 2 个专业
   - 10-20 个 Agent：同样模式，1 个调度 + N 个专业
   - 调度 Agent 是核心

3. **流式返回的处理**：
   - 调度 Agent 会等待所有流式返回完成
   - 然后整理出一份完整答案
   - 用户看到的是最终结果，看不到中间流式过程

### 4. 关键要点

1. **流式返回的优势**：
   - 用户体验更好
   - 可以及时看到输出
   - 适合长时间运行的任务

2. **A2A 流式返回规范**：
   - 使用 `messageStream` 方法
   - 先提交任务
   - 分块返回 artifacts
   - 最后更新任务状态

3. **多 Agent 协作**：
   - 必须有调度 Agent
   - 调度 Agent 负责任务拆解和分发
   - 专业 Agent 负责具体任务执行
   - 调度 Agent 整合所有结果

4. **扩展性**：
   - 模式可扩展到更多 Agent
   - 调度 Agent 是关键
   - 每个 Agent 专注自己的领域

## 相关视频

- [[a2a-protocol-part1]] — 第 1 部分：双 Agent 同步调用场景

## 外部资源

- [Google A2A 协议规范](https://github.com/google/a2a)
- [A2A Samples 仓库](https://github.com/google/a2a-samples)

---

*字幕整理于 2026-05-04*
