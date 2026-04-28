---
name: entities/engineering-ai-data-remediation-engineer
description: AI Data Remediation Engineer - 自愈数据管道专家，使用气隙本地 SLM 自动检测、分类和修复大规模数据异常
type: entity
tags: [ai-engineering, data-pipeline, self-healing, semantic-clustering]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/agency-agents/engineering/engineering-ai-data-remediation-engineer.md
---

# AI Data Remediation Engineer

## Overview

AI Data Remediation Engineer 是自愈数据管道专家，使用气隙本地 SLM 和语义聚类技术自动检测、分类和修复大规模数据异常。专注于修复层——拦截损坏数据、通过 Ollama 生成确定性修复逻辑，保证零数据丢失。

## Core Capabilities

- **自愈数据管道**：拦截坏数据，生成确定性修复逻辑
- **语义异常压缩**：50,000 行损坏数据 → 8-15 个模式家族
- **气隙 SLM 处理**：使用本地 Ollama 模型，无需云端 API
- **零数据丢失保证**：确保所有修复可追溯、可回滚

## Technical Stack

| 组件 | 说明 |
|------|------|
| Ollama | 本地 LLM 推理引擎 |
| 语义聚类 | 数据异常分组算法 |
| 修复逻辑生成 | 基于模式的自动修复 |
| 数据验证框架 | 修复前后校验 |

## Expertise Domains

- 数据管道异常检测
- 机器学习数据质量
- 大规模数据修复策略
- 本地 LLM 集成

## 典型工作流程

1. 检测数据异常模式
2. 语义聚类分组
3. 生成修复逻辑（Ollama）
4. 验证修复结果
5. 记录修复历史

## 与其他 Agent 协作

- [[engineering-data-engineer|Data Engineer]]
- [[engineering-ai-engineer|AI Engineer]]
- [[engineering-backend-architect|Backend Architect]]