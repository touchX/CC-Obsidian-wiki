---
name: harness-engineering
description: AI 工程第三次演进：从表达问题到信息供给再到执行稳定性的系统性工程化
type: concept
tags: [harness, ai-engineering, agent, system-design]
created: 2026-05-04
updated: 2026-05-04
source: ../../../archive/clippings/bilibili/2026-05-04-harness-engineering.md
---

# Harness Engineering

> [!summary] AI 工程领域的第三次重心迁移：从表达问题到信息供给再到执行稳定性的系统性工程化

**视频来源**：[code秘密花园 - Bilibili](https://www.bilibili.com/video/BV1Zk9FBwELs)
**上传日期**：2026-04-02

---

## 核心概念

**Harness Engineering** 是 AI 工程领域的**第三次重心迁移**：

```
Prompt Engineering → Context Engineering → Harness Engineering
    (表达问题)         (信息供给)          (执行稳定性)
```

> [!quote] 关键洞察
> 同样的模型在不同产品中表现差异巨大，决定上限的是模型，但决定能否落地的是 Harness。

---

## 三代工程对比

### 🎯 第一代：Prompt Engineering

**核心问题**：模型有没有听懂你在说什么

**本质**：塑造局部概率空间
- 角色设定、风格约束、少样本示例
- **局限**：只能激发已有能力，无法弥补缺失知识

### 📚 第二代：Context Engineering  

**核心问题**：模型有没有拿到足够且正确的信息

**本质**：在合适的时机把正确的信息送进去
- RAG、历史对话管理、工具返回处理
- **渐进式披露**（Skills 机制）：按需暴露，而非一次性全给

### 🛠️ 第三代：Harness Engineering

**核心问题**：模型在真实执行力能不能持续做对

**本质**：驾驭整个执行过程
- 监督、约束、纠偏
- 当模型从回答问题走向执行任务，系统不只要负责喂信息，还要能够驾驭过程

---

## Harness 六层架构

### 第一层：上下文管理
让模型在正确的思考边界内工作
- **角色目标定义**：我是谁、任务是什么、成功标准
- **信息裁剪选择**：越相关越好，不是越多越好
- **结构化组织**：规则/任务/状态/证据分层清晰

### 第二层：工具系统
让模型接触真实世界
- **工具选择**：太少能力不够，太多容易乱用
- **调用时机**：不该查别乱查，该查别硬答
- **结果回传**：提炼筛选，保持相关性

### 第三层：执行编排
解决"不会把步骤串起来"的问题
- 理解目标 → 判断信息是否足够 → 补充 → 分析 → 生成 → 检查 → 修正或重试

### 第四层：记忆和状态
避免每轮"失忆"
- **当前任务状态**：做到哪了
- **会话中间结果**：哪些确认了，哪些未解决
- **长期记忆**：用户偏好和历史知识

### 第五层：评估和观测
避免"自我感觉良好"
- 输出验证、自动测试、日志指标
- 错误归因分析

### 第六层：约束校验失败和恢复
**决定能否上线的关键**
- **约束**：哪些能做、哪些不能做
- **校验**：输出前后如何检查
- **恢复**：失败后如何从最近的稳定状态切入

---

## 真实实践案例

### Anthropic 的实践

#### 1. Context Reset（进程重启式清空）
- **问题**：上下文太长，模型开始丢重点、甚至"着急收尾"
- **方案**：不压缩上下文，而是换一个干净的 agent 并交接工作
- **类比**：像内存泄漏后直接重启进程，而非继续清缓存

#### 2. 分离 Planner/Generator/Evaluator
- **问题**：自评失真（既当运动员又当裁判）
- **方案**：
  - Planner：需求 → 完整规格
  - Generator：逐步实现
  - Evaluator：真实操作页面验证（带环境的验证，非抽象审查）
- **原则**：生产验收必须分离

### OpenAI 的实践

#### 1. 工程师角色转变
- ❌ 不写代码
- ✅ 设计环境
  - 拆解产品目标为 agent 理解的小任务
  - Agent 失败时问"环境缺了什么能力"而非"让 agent 更努力"
  - 建立反馈链路让 agent 看到自己的工作结果

#### 2. 渐进式披露
- **错误做法**：巨大的 agent.md 填满所有规范
- **正确做法**：目录页 + 子文档（架构/设计/计划/质量/安全），按需钻取

#### 3. 自主验证系统
- Agent 接浏览器能截图、点页面
- 接日志和指标系统
- 独立隔离环境运行
- **资深工程师经验 → 系统规则**（不只报错，还反馈怎么修）

---

## 关键原则

### 1. 三者包含关系

```
Prompt ⊂ Context ⊂ Harness
```

- 简单单轮生成 → Prompt 重要
- 依赖外部知识 → Context 关键
- 长链路可执行低容错 → Harness 不可避免

### 2. 现实挑战迁移

```
从：让模型看起来更聪明
到：让模型在真实世界里稳定工作
```

### 3. 修复思维转变

```
❌ "让 agent 更努力一点"
✅ "确定 agent 缺了什么样的结构性能力"
```

---

## 实战类比：新人客户拜访

**Prompt Engineering**：
> "见面先寒暄，再介绍方案，记录需求，最后确认下一步"

**Context Engineering**：
> "客户背景、沟通记录、产品报价、竞品情况、会议目标"

**Harness Engineering**：
> "带着 checklist、关键节点实时汇报、会后核实纪要和录音、发现偏差立即纠正、按明确标准验收结果"

---

## 推荐资源

- 📖 [OpenClaw 完全指南（花园版）](https://my.feishu.cn/wiki/QzGAwOH4LiZOYXktGyhcHoLUnRe)
- 📚 [code秘密花园 AI 教程资源合集](https://my.feishu.cn/wiki/U9rYwRHQoil6vBkitY8cbh5tnL9)
- 💻 [Easy AI 项目](https://github.com/ConardLi/easy-learn-ai)

---

## 相关页面

- [[subagents]] - Subagents 是 Harness 的一部分
- [[agent-teams]] - Agent Teams 也是 Harness 实践
- [[workflows]] - 工作流编排与 Harness 第三层相关

---

> [!info] 来源
> - **视频**：Bilibili - code秘密花园 (BV1Zk9FBwELs)
> - **字幕**：2026-05-04 捕获
> - **类型**：Synthesis + Concepts
> - **价值**：⭐⭐⭐⭐⭐ 系统性框架 + 顶级公司实践案例