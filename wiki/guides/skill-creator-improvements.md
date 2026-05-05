---
skill.creator.improvements
name: guides/skill-creator-improvements
description: Skill Creator 新增 Evals 测试、Benchmark 评估和 Description 优化功能
type: guide
tags: [skill-creator, evals, testing, skills, benchmark, agents]
created: 2026-05-01
updated: 2026-05-01
---

# Skill Creator 改进 — 测试、衡量和优化 Agent Skills

> 为技能作者带来软件开发的严谨性，无需编写代码

> 来源：Anthropic 官方博客 | 功能现已推出

## 功能概述

### 什么是 Skill Creator 改进

Skill-creator 现在帮助你编写 evals、运行基准测试，并确保技能在模型演进时持续有效。这些更新现已可在 Claude.ai 和 Cowork 中使用，作为 [Claude Code 插件](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/skill-creator)，或[在我们的代码库中](https://github.com/anthropics/skills/tree/main/skills/skill-creator)。

**核心价值**：
- ✅ **Evals 测试系统**：验证技能按预期工作
- ✅ **Benchmark 模式**：标准化评估性能
- ✅ **Multi-agent 支持**：并行运行测试
- ✅ **Description 优化**：改进触发准确性

**目标用户**：大多数技能作者是领域专家，而非工程师。他们了解工作流程但缺乏工具来验证技能是否有效。

## 两种技能类型

### Capability Uplift（能力提升型）

**定义**：帮助 Claude 做到基础模型无法做到或无法一致做到的事情。

**特点**：
- 编码技术和模式，产生比单独提示更好的输出
- 示例：[文档创建技能](https://github.com/anthropics/skills/tree/main/skills)
- **模型进步影响**：可能随着模型改进而变得不再必要

**测试意义**：
- Evals 告诉你何时模型已内置这些能力
- 基础模型开始通过 evals 时，技能可能已过时

### Encoded Preference（偏好编码型）

**定义**：记录 Claude 已经能做到各个部分，但技能按照团队流程排序的工作流程。

**特点**：
- 编码团队特定流程
- 示例：NDA 审查技能、周报起草技能
- **持久性**：更耐用，价值取决于与实际工作流程的保真度

**测试意义**：
- Evals 验证对工作流程的保真度
- 确保技能准确反映团队流程

## Evals 测试系统

### 什么是 Evals

Evals 是检查 Claude 对给定提示是否按预期工作的测试。如果你编写过软件测试，这会很熟悉：

1. **定义测试提示**（以及需要的文件）
2. **描述好的输出是什么样**
3. **Skill-creator 告诉你技能是否有效**

### 真实案例：PDF 技能修复

**问题**：PDF 技能之前难以处理非可填充表单
**挑战**：Claude 必须在没有定义字段引导的情况下将文本精确定位在坐标上
**解决**：Evals 隔离了失败，我们发布了修复，将定位锚定到提取的文本坐标

### 两个关键用途

#### 1. 捕获质量回退

**场景**：随着模型和基础设施的演进，上个月工作良好的技能今天可能会有不同的表现。

**价值**：
- 在影响团队工作之前获得早期信号
- 持续监控技能健康状况
- 快速发现模型更新引起的问题

#### 2. 识别模型进步

**适用**：主要针对 Capability Uplift 型技能

**信号**：
- 如果基础模型**在未加载技能**时开始通过你的 evals
- 说明技能的技术可能已被纳入模型的默认行为
- 技能没有损坏，只是不再必要

## Benchmark 模式

### 标准化评估

**功能**：运行使用你的 evals 的标准化评估

**适用场景**：
- 模型更新后
- 迭代技能本身时

**跟踪指标**：
- 📊 Evals 通过率
- ⏱️ 经过时间
- 🔖 Token 使用量

**数据所有权**：
- ✅ Evals 和结果归你所有
- ✅ 可以本地存储
- ✅ 集成到仪表板
- ✅ 插入 CI 系统

## Multi-agent 支持

### 并行评估

**问题**：顺序运行 evals 可能很慢，累积上下文可能在不同测试运行之间泄露

**解决方案**：Skill-creator 现在启动独立代理并行运行 evals

**优势**：
- ⚡ **更快的结果**：并行执行
- 🎯 **干净上下文**：每个代理在自己的上下文中
- 📊 **独立指标**：每个代理有自己的 token 和计时指标
- 🛡️ **无交叉污染**：测试之间不泄漏

### Comparator Agents（比较代理）

**功能**：A/B 比较

**比较类型**：
- 两个技能版本
- 技能 vs 无技能

**特点**：
- 盲判：不知道哪个是哪个
- 客观判断变化是否有帮助
- 避免偏见影响评估

## Description 优化

### 触发准确性问题

**挑战**：随着技能数量增长，描述精度变得关键

**问题**：
- 太宽泛 → 错误触发（false positives）
- 太狭窄 → 永不触发（false negatives）

**解决方案**：Skill-creator 现在帮助你调整描述以实现更可靠的触发

### 优化流程

1. **分析**当前描述与示例提示
2. **建议**减少误报和漏报的编辑
3. **改进**触发准确性

**真实效果**：
- 在文档创建技能上运行
- 6 个公共技能中 5 个看到改进的触发

## 未来展望

### 从 "How" 到 "What"

**当前状态**：
- SKILL.md 文件本质上是实施计划
- 提供详细指令告诉 Claude **如何**做某事

**未来方向**：
- 自然语言描述**应该做什么**可能就足够了
- 模型自己弄清楚其余部分

**第一步**：
- 今天发布的 eval 框架是朝这个方向迈出的一步
- Evals 已经描述了 "what"
- 最终，该描述可能就是技能本身

## 开始使用

### 可用平台

**所有 skill-creator 更新现已推出**：
- ✅ **Claude.ai**：直接使用
- ✅ **Cowork**：企业环境
- ✅ **Claude Code**：[安装插件](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/skill-creator)
- ✅ **GitHub Repo**：[下载源码](https://github.com/anthropics/skills/tree/main/skills/skill-creator)

### 快速开始

**Claude.ai 和 Cowork**：
1. 要求 Claude 使用 skill-creator
2. 开始编写你的第一个 eval

**Claude Code**：
1. 安装插件或下载技能
2. 按照 skill-creator 指南操作

## 相关资源

- **官方文档**: [Skill Creator - GitHub](https://github.com/anthropics/skills/tree/main/skills/skill-creator)
- **Claude Code Plugin**: [claude-plugins-official](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/skill-creator)
- **原始发布**: [Introducing Agent Skills](https://claude.com/blog/skills)

## 相关页面

- [[guides/auto-mode]] — Auto Mode 权限决策
- [[guides/code-review]] — Code Review 多 Agent 审查
- [[patterns/claude-intelligence-harnessing]] — Claude 智能利用模式

---

*摄取时间: 2026-05-01*
*来源: Anthropic 官方博客*
*功能状态: 现已推出*
*原文: https://claude.com/blog/improving-skill-creator-test-measure-and-refine-agent-skills
