---
name: notes/2026-04-27-skill-design-principles
description: Claude Skill 设计原则 — 核心原则、创建时机、Description 最佳实践
type: pattern
tags: [session, skills, design, principles]
created: 2026-04-27
source: conversation
---

# Claude Skill 设计原则

## 核心原则

| 原则 | 说明 | 反例 |
|------|------|------|
| 别写显而易见的 | 专注 Claude 常规思维得不到的信息 | 写通用编程指导 |
| 写 Gotchas | 常见失败点汇总 | 写标准流程 |
| Description = 触发条件 | 描述何时调用，而非 skill 做什么 | 描述技术实现 |

## Design Principles 图谱

```
识别重复 → 判断：事实 OR 程序 → Description 触发条件 → 添加 Gotchas
```

## 创建时机

- 同一剧本粘贴 3+ 次 → ✅ 创建
- 有明确多步骤流程 → ✅ 创建
- 纯事实/知识 → ❌ 存 CLAUDE.md
- 一次性任务 → ❌ 不创建

## Description 最佳实践

```yaml
# ❌ 不好
description: 解释代码如何工作

# ✅ 好
description: 使用视觉图表解释代码结构和关系
```

## Skill vs CLAUDE.md

| 维度 | Skill | CLAUDE.md |
|------|-------|--------|
| 加载时机 | 按需/调用时 | 会话始终 |
| 作用域 | 按目录级别 | 全局/项目 |
| 触发 | /name 或自动 | 始终生效 |
| 用途 | 程序化操作 | 事实/规则 |

## 目录结构

```
my-skill/
├── SKILL.md           # 必需：主说明
├── template.md        # 可选：Claude 填写模板
├── examples/
│   └── sample.md    # 可选：示例输出
└── scripts/
    └── validate.sh  # 可选：可执行脚本
```

## 六不要

- ❌ 写显而易见的编程概念
- ❌ 把 Skill 当 CLAUDE.md 用
- ❌ Description 写实现细节
- ❌ 创建只用一次的技能
- ❌ 把事实性内容写成 Skill
- ❌ 忽略 Gotchas

## 典型类型

| 类型 | 特征 | 示例 |
|------|------|------|
| 工作流 | 多步骤程序化 | /commit, /deploy |
| 检查清单 | 验证步骤集合 | code-reviewer |
| 专家知识 | 特定领域知识 | weather-fetcher |
| 模板 | 输出格式规范 | create-pr-template |

## 相关 Wiki 页面
- [[wiki/entities/claude-skills]] — 完整技能文档
- [[wiki/sources/claude-skills-full]] — 官方完整参考
- [[wiki/implementation/skills-implementation]] — 实现指南