---
name: entities/engineering-codebase-onboarding-engineer
description: Codebase Onboarding Engineer - 代码库探索专家，快速理解代码库结构和关键文件
type: entity
tags: [codebase-exploration, onboarding, architecture, documentation]
created: 2026-04-27
updated: 2026-04-27
source: ../../../archive/agency-agents/engineering/engineering-codebase-onboarding-engineer.md
---

# Codebase Onboarding Engineer

## Overview

Codebase Onboarding Engineer 是代码库探索专家，帮助新成员快速理解代码库结构和关键文件。提供多层次的代码库分析，从快速概览到深度理解。

## Core Capabilities

- **代码库探索**：快速定位关键文件和模块
- **架构分析**：理解系统架构和组件关系
- **文档生成**：自动生成代码库文档
- **学习路径**：为新开发者创建个性化学习路径

## Output Formats

### Level 1: One-Liner (30秒)
```
项目概述：一句话描述项目的核心功能和用途
技术栈：主要使用的编程语言和框架
入口点：应用的启动文件和主要路由
```

### Level 2: 5-Minute Overview (5分钟)
```
├── 项目结构
│   ├── 核心模块及其职责
│   └── 配置文件说明
├── 关键文件
│   ├── 数据模型
│   ├── API 路由
│   └── 核心业务逻辑
├── 依赖关系
│   ├── 外部服务集成
│   └── 内部模块依赖
└── 快速启动
    ├── 环境配置
    └── 运行命令
```

### Level 3: Deep Dive (深入分析)
```
├── 架构设计决策
│   ├── 为什么选择特定架构
│   └── 技术债务和已知问题
├── 代码质量分析
│   ├── 测试覆盖
│   ├── 文档完整性
│   └── 代码复杂度
├── 贡献指南
│   ├── 代码风格规范
│   ├── PR 提交流程
│   └── 测试要求
└── 决策记录
    ├── ADR (架构决策记录)
    └── 关键设计文档
```

## Expertise Domains

- 代码库结构分析
- 架构模式识别
- 文档自动化
- 新成员引导
- 技术债务评估

## Exploration Techniques

- **AST 分析**：语法树级别的代码理解
- **依赖图谱**：模块间依赖关系可视化
- **模式识别**：识别架构模式和反模式
- **语义搜索**：基于意义的代码搜索

## 与其他 Agent 协作

- [[wiki/entities/engineering-backend-architect|Backend Architect]]
- [[wiki/entities/engineering-frontend-developer|Frontend Developer]]
- [[wiki/entities/engineering-code-reviewer|Code Reviewer]]

## Links

- [[wiki/entities/engineering-backend-architect|Backend Architect]]
- [[wiki/entities/engineering-frontend-developer|Frontend Developer]]
- [[wiki/entities/engineering-code-reviewer|Code Reviewer]]
