---
name: agent-harness
description: Agent Harness 的概念与重要性
type: concept
tags:
  - architecture
  - testing
  - llm
  - quality
created: 2026-04-23
updated: 2026-04-23
sources: 2
---

# Agent Harness (Agent 测试框架)

## 定义

Harness 是用于测试和验证 AI Agent 行为的框架。它提供：
- **可重复的测试环境**
- **标准化的评估标准**
- **自动化验证流程**

## 为什么重要

### 问题：LLM 输出不稳定

LLM 的输出具有概率性，同样的输入可能产生不同结果。这导致：
- ❌ 难以复现 Bug
- ❌ 难以验证修复
- ❌ 难以保证质量

### 解决方案：Harness

```
输入 → Agent → 输出
         ↓
     Harness
         ↓
     Pass/Fail + 报告
```

## Harness 的核心组件

| 组件 | 作用 | 示例 |
|------|------|------|
| Test Cases | 定义输入和期望输出 | 100 个测试用例 |
| Evaluator | 判断输出是否符合标准 | 相似度、格式、结构 |
| Runner | 执行测试并收集结果 | 批量运行 |
| Reporter | 生成报告和统计 | 通过率、覆盖率 |

## 相关概念

- [[synthesis/agent-architecture]] — Agent 系统架构
- [[entities/claude-code]] — 实际使用场景
- [[concepts/context-window]] — 测试时的上下文管理

## 实践建议

1. **从小开始** — 先创建 5-10 个核心测试用例
2. **渐进扩展** — 随发现新问题增加测试
3. **关注质量** — 通过率不是唯一指标
4. **维护测试** — 丢弃不稳定的测试

## 来源

- Claude Code 官方研究
- 项目实战经验
