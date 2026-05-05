# Writing-Skills 技能使用完全指南

> 来源：obra/superpowers 插件 v5.0.7
> 整理：2026-05-05

---

## 概述

Writing Skills 是将 **TDD 应用于流程文档** 的技能。

```
★ 核心原则：
- 如果没有观察代理在没有技能的情况下失败，你不知道技能是否教了正确的东西
★ TDD 映射：
  - Test case → 压力场景 + 子代理
  - Production code → SKILL.md 技能文档
  - Test fails → 无技能时代理违反规则（基线）
  - Test passes → 有技能时代理遵守
```

---

## 什么是 Skill？

**Skill** 是经过验证的技术、模式或工具的参考指南。帮助未来的 Claude 实例找到并应用有效方法。

| 是 | 不是 |
|---|---|
| 可重用技术 | 关于如何一次解决问题的叙述 |
| 模式 |  |
| 工具 |  |
| 参考指南 |  |

---

## TDD 映射

| TDD 概念 | Skill 创建 |
|---------|-----------|
| **Test case** | 压力场景 + 子代理 |
| **Production code** | SKILL.md 技能文档 |
| **Test fails (RED)** | 无技能时代理违反规则（基线） |
| **Test passes (GREEN)** | 有技能时代理遵守 |
| **Refactor** | 关闭漏洞同时保持遵守 |
| **Write test first** | 写技能前运行基线场景 |
| **Watch it fail** | 记录代理使用的确切合理化 |
| **Minimal code** | 写解决那些具体违规的技能 |
| **Watch it pass** | 验证代理现在遵守 |
| **Refactor cycle** | 发现新合理化 → 插入 → 重新验证 |

---

## 何时创建 Skill

**创建当：**
- 技术对你不是直观明显的
- 你会在项目间参考这个
- 模式应用广泛（不是特定项目）
- 其他人会受益

**不要创建：**
- 一次性解决方案
- 在其他地方有良好文档记录的标准实践
- 特定项目约定（放在 CLAUDE.md）
- 机械约束（如果可以用 regex/验证强制执行，用自动化 — 把文档留给判断）

---

## Skill 类型

### Technique
有步骤要遵循的具体方法（condition-based-waiting, root-cause-tracing）

### Pattern
思考问题的方式（flatten-with-flags, test-invariants）

### Reference
API 文档、语法指南、工具文档（office docs）

---

## 目录结构

```
skills/
  skill-name/
    SKILL.md              # 主参考（必需）
    supporting-file.*     # 仅在需要时
```

**扁平命名空间** - 所有技能在一个可搜索命名空间

---

## SKILL.md 结构

### Frontmatter (YAML)

```yaml
---
name: Skill-Name-With-Hyphens
description: Use when [specific triggering conditions and symptoms]
---
```

**要求：**
- 两个必需字段：`name` 和 `description`
- 最多 1024 字符
- `name`：只用字母、数字和连字符
- `description`：第三人称，只描述何时使用（不是做什么）

### 主体结构

```markdown
# Skill Name

## Overview
这是什么？1-2 句核心原则。

## When to Use
[如果决策不明显，小型内联流程图]

触发条件和用例的项目符号列表
何时不使用

## Core Pattern (for techniques/patterns)
前后代码比较

## Quick Reference
扫描常见操作的表格或项目符号

## Implementation
简单模式的内联代码
对于重型引用链接到文件

## Common Mistakes
什么出错 + 修复

## Real-World Impact (optional)
具体结果
```

---

## Claude Search Optimization (CSO)

### 描述字段

**关键：** 描述以 "Use when..." 开头，描述触发条件，不是工作流总结。

```yaml
# ❌ 坏：总结工作流 - 代理可能跟随这个而非阅读技能
description: Use when executing plans - dispatches subagent per task with code review

# ❌ 坏：太多流程细节
description: Use for TDD - write test first, watch it fail, write minimal code

# ✅ 好：只有触发条件，无工作流总结
description: Use when executing implementation plans with independent tasks in the current session
```

### 关键词覆盖

使用 Claude 会搜索的词：
- 错误消息："Hook timed out", "ENOTEMPTY", "race condition"
- 症状："flaky", "hanging", "zombie", "pollution"
- 同义词："timeout/hang/freeze", "cleanup/teardown/afterEach"

---

## Token 效率

**目标字数：**
- getting-started 工作流：<150 词每个
- 频繁加载的技能：<200 词总计
- 其他技能：<500 词

**技术：**
- 移动细节到工具帮助
- 使用交叉引用
- 压缩示例

---

## 红绿重构用于 Skills

### RED: 写失败测试（基线）

运行压力场景 WITHOUT skill。记录确切行为：
- 他们做什么选择？
- 他们使用什么合理化（逐字）？
- 哪些压力触发了违规？

### GREEN: 写最小 Skill

写解决那些具体合理化的技能。不要为假设案例添加额外内容。

运行相同场景 WITH skill。代理现在应该遵守。

### REFACTOR: 关闭漏洞

代理发现新合理化？添加明确的反制。重新测试直到无懈可击。

---

## 常见合理化

| 借口 | 现实 |
|------|------|
| "技能显然清楚" | 对你清楚 ≠ 对其他代理清楚。测试它。 |
| "只是参考" | 参考可能有差距、不清楚部分。测试检索。 |
| "测试是杀鸡用牛刀" | 未测试技能有问题。总是。15 分钟测试节省数小时。 |
| "有问题再测试" | 问题 = 代理无法使用技能。在部署前测试。 |
| "太乏味不测试" | 测试比在生产中调试坏技能更不乏味。 |
| "我有信心它是好的" | 过度自信保证有问题。还是要测试。 |
| "学术审查就够了" | 阅读 ≠ 使用。测试应用场景。 |
| "没时间测试" | 部署未测试技能浪费更多时间稍后修复。 |

---

## Red Flags - 停止并重新开始

- 测试前写代码
- 实现后写测试
- 测试立即通过
- 无法解释为什么测试失败
- "之后"添加测试
- "就这一次"合理化
- "我已经手动测试了"
- "之后测试达到相同目的"
- "这是关于精神不是仪式"
- "保留为参考"或"适应现有代码"
- "已经花了 X 小时，删除是浪费"
- "TDD 是教条的，我是务实的"
- "这个不一样因为..."

**所有这些意味着：删除代码。用 TDD 从头开始。**

---

## 技能创建检查表

### RED Phase - 写失败测试
- [ ] 创建压力场景（纪律技能 3+ 组合压力）
- [ ] 无技能运行场景 - 记录基线行为逐字
- [ ] 识别合理化/失败中的模式

### GREEN Phase - 写最小 Skill
- [ ] 名称只用字母、数字、连字符
- [ ] YAML frontmatter 与必需 `name` 和 `description` 字段
- [ ] 描述以 "Use when..." 开头并包含具体触发条件/症状
- [ ] 第三人称书写描述
- [ ] 关键词贯穿用于搜索
- [ ] 清晰概述与核心原则
- [ ] 解决 RED 中识别的具体基线失败
- [ ] 代码内联或链接到单独文件
- [ ] 一个优秀示例（非多语言）
- [ ] 有技能运行场景 - 验证代理现在遵守

### REFACTOR Phase - 关闭漏洞
- [ ] 从测试识别新合理化
- [ ] 添加明确反制（如果是纪律技能）
- [ ] 从所有测试迭代构建合理化表
- [ ] 创建红flags 列表
- [ ] 重新测试直到无懈可击

### 质量检查
- [ ] 小型流程图仅当决策不明显时
- [ ] 快速参考表
- [ ] 常见错误部分
- [ ] 无叙事性讲故事
- [ ] 仅当工具或重型引用时支持文件

### 部署
- [ ] 提交技能到 git 并推送到你的 fork
- [ ] 考虑通过 PR 贡献回（如果广泛有用）

---

## 与其他技能的关系

| 技能 | 关系 |
|------|------|
| **test-driven-development** | 是基础，定义 RED-GREEN-REFACTOR 循环 |
| **brainstorming** | 使用 writing-skills 创建新技能 |

---

## 快速参考

```
★ 核心：写技能是 TDD 应用于流程文档
★ 铁律：没有失败的测试就不写技能
★ 循环：RED（基线）→ GREEN（写技能）→ REFACTOR（关闭漏洞）
★ 描述：以 "Use when..." 开头，只描述触发条件
★ 测试：每个技能必须测试才能部署
```
