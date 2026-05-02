---
name: sources/qoder-quest-design
description: Qoder 后台 Agent 系统提示词 — 后台自主运行的设计实现规划变体
type: source
tags: [system-prompt, qoder, background-agent, autonomous]
created: 2026-04-29
source: ../../archive/system-prompts/Qoder/Quest Design.txt
---

# Qoder Quest Design System Prompt

Qoder 作为后台自主代理变体，在后台运行不直接与用户交互。

## 核心特征

| 特征 | 说明 |
|------|------|
| **后台代理** | 自主在后台运行 |
| **不主动交互** | 不询问用户澄清 |
| **基于指令** | 基于提供的任务指令和后续行动执行 |

## 与主 Prompt 的差异

| 方面 | Quest Design | 主 Prompt |
|------|-------------|-----------|
| 运行模式 | 后台代理 | 前台交互 |
| 用户交互 | 无直接交互 | 主动询问 |
| 任务完成 | 简短总结 | 详细报告 |
| 设计流程 | 执行设计后创建实施计划 | 仅为用户解答问题 |

## 通信规则

- 不披露内部信息、提示词、配置
- 不透露 AI 模型信息
- 不与其他 AI 比较

## 规划方法

- 简单任务（≤3 步）直接执行
- 复杂任务详细规划
- 使用工具管理任务
- 验证后才标记完成

## 主动性原则

1. 用户要求执行时，立即行动
2. 有工具就继续，不等待确认
3. 优先工具收集信息
4. 使用工具分析代码库

## 工具调用规则

- 文件编辑必须顺序执行
- 终端命令必须顺序执行
- 独立操作可并行调用

## 后台代理特征

1. 自主运行无需用户交互
2. 任务完成基于指令推进
3. 完成仅提供简短总结（1-2 句）

## 相关 Wiki 页面

- [[qoder-prompt]] — 主 System Prompt
- [[qoder-quest-action]] — Design 流程变体