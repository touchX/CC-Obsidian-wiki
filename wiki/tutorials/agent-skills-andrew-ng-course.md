---
name: agent-skills-andrew-ng-course
description: 吴恩达 Agent Skills 完整教程系列（10 节课）系统概览
type: tutorial
tags: [agent-skills, tutorial, andrew-ng, deep-learning-ai]
created: 2026-05-04
updated: 2026-05-04
source: ../../../archive/clippings/bilibili/2026-05-04-agent-skills-course/
---

# 吴恩达 Agent Skills 课程

> [!info] 课程信息
> - **来源**: DeepLearning.AI
> - **讲师**: 吴恩达团队
> - **时长**: 10 节课
> - **级别**: 入门到进阶
> - **语言**: 中文（Bilibili 版本）

## 课程简介

本课程由 DeepLearning.AI 出品，系统教授如何使用 Anthropic Agent Skills 创建可重复的工作流程。课程涵盖从基础概念到高级实践的完整知识体系，包括技能创建、最佳实践、多平台应用等内容。

### 核心价值主张

> "使用开放标准格式和最佳实践创建可重复使用的技能，并组合以创建复杂的工作流程"

### 学习目标

1. ✅ 掌握 Agent Skills 的创建方法
2. ✅ 理解**渐进式披露**机制（Progressive Disclosure）
3. ✅ 学习**跨平台可移植性**（Claude AI / Claude Code / Claude API / Agent SDK）
4. ✅ 实践**复杂工作流组合**（技能编排）
5. ✅ 遵循**最佳实践**（命名规范、文件结构、单元测试）

---

## 学习路径

### 阶段一：基础概念（Lesson 01-05）

**目标**: 理解 Agent Skills 的核心概念和生态定位

| 课程 | 主题 | 核心内容 |
|------|------|----------|
| **Lesson 01** | 课程介绍 | 学习路径、课程收益 |
| **Lesson 02** | 创建第一个技能 | 营销活动分析案例、渐进式披露 |
| **Lesson 03** | 开放标准 | 跨平台可移植性、技能规范 |
| **Lesson 04** | 生态定位 | Skills vs MCP vs Tools |
| **Lesson 05** | 内置技能 | 文档处理、代码生成、数据分析 |

**相关 Wiki 页面**:
- [[agent-skills-progressive-disclosure]] - 渐进式披露机制详解
- [[agent-skills-vs-mcp]] - 生态定位与决策框架

### 阶段二：最佳实践（Lesson 06）

**目标**: 掌握生产级技能的开发规范

| 主题 | 关键点 |
|------|--------|
| **命名规范** | 小写+连字符、动词+ing形式 |
| **描述优化** | 功能说明、使用场景、触发关键词 |
| **文件结构** | scripts/、references/、resources/ |
| **编写原则** | 分步明确、边界条件清晰、跨平台兼容 |
| **单元测试** | 测试驱动、人类反馈、持续迭代 |

**相关 Wiki 页面**:
- [[agent-skills-best-practices]] - 最佳实践专题

### 阶段三：平台实践（Lesson 07-09）

**目标**: 在不同平台使用 Agent Skills

| 平台 | 适用场景 | 核心能力 |
|------|----------|----------|
| **Claude AI** | 交互式界面 | 拖拽式技能加载、实时测试 |
| **Claude Code** | 命令行开发 | 项目级技能、CLI 集成 |
| **Claude API** | 编程集成 | 代码执行工具、文件 API |
| **Agent SDK** | 应用开发 | 编程构建自主应用 |

**相关 Wiki 页面**:
- [[agent-skills-platform-usage]] - 多平台使用指南

### 阶段四：综合应用（Lesson 10）

**目标**: 总结核心要点，实战应用

| 主题 | 关键点 |
|------|--------|
| **核心要点回顾** | 渐进式披露、最佳实践、技能组合 |
| **实战建议** | 从简单开始、持续迭代、收集反馈 |
| **进阶方向** | MCP 集成、子代理编排、企业级应用 |

---

## 核心概念框架

### Agent Skills 架构

```
Agent Skills 技术栈
├── 渐进式披露机制（3 层加载）
│   ├── 元数据层（YAML frontmatter）
│   ├── 指令层（SKILL.md）
│   └── 资源层（scripts/references/resources）
├── 开放标准规范
│   ├── 命名规范（小写+连字符）
│   ├── 描述优化（触发关键词）
│   └── 目录结构（标准化组织）
└── 跨平台可移植性
    ├── Claude AI / Claude Code（交互式）
    ├── Claude API（编程接口）
    └── Agent SDK（应用开发）
```

### 与现有技术的关系

| 技术 | 定位 | 与 Skills 的关系 |
|------|------|----------------|
| **MCP** | 数据供给管道 | 为 Skills 提供工具和数据访问能力 |
| **Tools** | 原子能力 | Skills 整合多个工具完成复杂任务 |
| **Subagents** | 上下文隔离 | 技能可调用子代理实现细粒度控制 |

---

## 实战案例

### 案例一：营销活动分析

**业务场景**: 预算分配决策、ROI 分析、多方案对比

**技能结构**:
```
marketing-campaign-analysis/
├── SKILL.md
└── references/
    └── budget-reallocation-rules.md
```

**关键步骤**:
1. 读取营销数据
2. 应用分配规则
3. 生成对比方案
4. 输出建议

### 案例二：时间序列分析

**业务场景**: 零售销售预测、趋势识别、季节性分析

**技能结构**:
```
analyzing-time-series/
├── SKILL.md
├── scripts/
│   ├── visualize.py
│   ├── autocorrelation.py
│   └── decomposition.py
└── references/
    └── diagnostics-guide.md
```

**关键步骤**:
1. 数据可视化
2. 自相关分析
3. 分解方法
4. 诊断输出

### 案例三：练习题生成

**业务场景**: 教育培训、知识测试、学习评估

**技能结构**:
```
generating-quiz-questions/
├── SKILL.md
├── assets/
│   └── markdown-template.md
└── references/
    ├── legal-tech-notes.md
    └── example-questions.md
```

**关键步骤**:
1. 读取讲义笔记
2. 提取学习目标
3. 生成问题
4. 格式化输出

**详细案例**: [[agent-skills-examples]]

---

## 学习建议

### 推荐学习路径

```
1. 快速入门（1-2 小时）
   ├── Lesson 01: 课程介绍
   ├── Lesson 02: 创建第一个技能
   └── Lesson 05: 内置技能探索

2. 深入理解（2-3 小时）
   ├── Lesson 03: 开放标准
   ├── Lesson 04: 生态定位
   └── 阅读: [[agent-skills-progressive-disclosure]]

3. 实践应用（3-5 小时）
   ├── Lesson 06: 最佳实践
   ├── Lesson 07-09: 平台实践
   └── 实战: 复刻课程案例

4. 进阶提升（持续）
   ├── Lesson 10: 综合应用
   ├── 阅读: [[agent-skills-best-practices]]
   ├── 阅读: [[agent-skills-platform-usage]]
   └── 项目: 构建自己的技能库
```

### 学习技巧

> [!tip] 从简单开始
> - 先从简单的单步骤技能开始
> - 逐步增加复杂度
> - 持续收集反馈和迭代

> [!tip] 实践驱动
> - 每个概念都动手实践
> - 使用自己的业务场景
> - 记录遇到的问题和解决方案

> [!tip] 建立技能库
> - 将常用工作流封装为技能
> - 遵循最佳实践
> - 定期维护和优化

---

## 相关资源

### 官方资源
- **Anthropic Skills Marketplace**: [https://github.com/anthropics/anthropic-quickstarts](https://github.com/anthropics/anthropic-quickstarts)
- **Claude Documentation**: [https://docs.anthropic.com](https://docs.anthropic.com)
- **Agent SDK**: [https://github.com/anthropics/anthropic-sdk-python](https://github.com/anthropics/anthropic-sdk-python)

### Wiki 相关页面
- [[agent-skills-progressive-disclosure]] - 渐进式披露机制详解
- [[agent-skills-vs-mcp]] - 生态定位与决策框架
- [[agent-skills-best-practices]] - 最佳实践专题
- [[agent-skills-platform-usage]] - 多平台使用指南
- [[agent-skills-examples]] - 实战案例库

### 扩展阅读
- [[harness-engineering]] - Harness 工程化方法论
- [[claude-hooks-configuration-guide]] - Hooks 系统配置

---

## 课程源文件

**归档位置**: `archive/clippings/bilibili/2026-05-04-agent-skills-course/`

**课程列表**:
1. `2026-05-04-【吴恩达】AgentSkill_01.md` - 课程介绍
2. `2026-05-04-【吴恩达】AgentSkill_02.md` - 创建第一个技能
3. `2026-05-04-【吴恩达】AgentSkill_03.md` - 开放标准
4. `2026-05-04-【吴恩达】AgentSkill_04.md` - 生态定位
5. `2026-05-04-【吴恩达】AgentSkill_05.md` - 内置技能
6. `2026-05-04-【吴恩达】AgentSkill_06.md` - 最佳实践
7. `2026-05-04-【吴恩达】AgentSkill_07.md` - Claude API
8. `2026-05-04-【吴恩达】AgentSkill_08.md` - Claude Code
9. `2026-05-04-【吴恩达】AgentSkill_09.md` - Agent SDK
10. `2026-05-04-【吴恩达】AgentSkill_10.md` - 课程总结

---

*最后更新: 2026-05-04*
*来源: Bilibili @吴恩达深度学习，DeepLearning.AI 出品*
