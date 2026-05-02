---
name: tools/traycer-ai
description: Traycer.AI 分阶段规划 AI 助手系统提示词和工具集
type: source
tags: [traycer-ai, agent, tools, system-prompt, phase-mode, plan-mode]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/Traycer AI/
---

# Traycer.AI

## 概述

Traycer.AI 是一个基于先进架构的大语言模型 AI 助手，扮演技术主管角色。它在**只读访问模式**下工作，不能编辑代码，但可以分解任务、制定计划。

## 两种模式

### Phase Mode（阶段模式）

**角色定位**：纯阅读模式的技术主管
- **不写代码**，只将任务分解为高层阶段
- 使用 `write_phases` 工具输出阶段计划
- 不会覆盖已有计划，遵循"Shadow don't overwrite"原则

**核心约束**：
- 不编辑文件，不运行终端命令
- "NEVER assume that a given library is available"
- 仅负责整体探索，不深入代码库细节

### Plan Mode（计划模式）

**角色定位**：深入规划的技术主管
- 提供高级设计而非具体实现
- 使用 LSP 工具进行代码库探索
- 支持向其他 Agent 移交任务

**移交机制**：
- `hand_over_to_approach_agent` 工具
- 三种角色选择：`planner` | `architect` | `engineering_team`
- 移交条件：任务需要文件级计划

## 工具集

### Phase Mode 工具

| 工具 | 功能 |
|------|------|
| `write_phases` | 将任务分解为阶段计划 |
| `read_partial_file` | 读取文件指定行范围 |
| `find_references` | 查找符号引用 |
| `go_to_definition` | 跳转到定义 |
| `go_to_implementations` | 查找实现位置 |
| `file_outlines` | 获取目录文件符号大纲 |
| `ask_user_for_clarification` | 向用户澄清需求 |

### Plan Mode 工具

| 工具 | 功能 |
|------|------|
| `hand_over_to_approach_agent` | 任务移交 |
| `agent` | 创建专业 Agent |
| `read_file` / `read_partial_file` | 读取文件 |
| `list_dir` | 列出目录 |
| `grep_search` | 正则搜索 |
| `file_search` | 文件搜索 |
| `get_diagnostics` | 获取诊断信息 |
| `think` | 思考工具 |

## write_phases 核心原则

### Phase-by-Phase Integrity

```
Phase 1: [描述] ──────────────────────────────────▶
    │                                                 │
    │  "Each phase is a self-contained unit          │
    │   that should be verifiable on its own"        │
    ▼                                                 │
Phase 2: [描述] ──────────────────────────────────▶
```

### Shadow Don't Overwrite

```
User's Plan:
  Phase 1 ✅  Phase 2 ✅  Phase 3 🔄
                    │
                    ▼
           "Don't add new phases or
            modify completed ones"
```

### 阶段结构

```json
{
  "thoughts": "为什么这个阶段重要",
  "steps": ["步骤1", "步骤2"],
  "successCriteria": "如何验证阶段完成"
}
```

## 设计特点

1. **技术主管角色**：不写代码，只提供高层设计和阶段分解
2. **只读访问**：无法编辑文件或运行终端命令
3. **阶段完整性**：每个阶段独立可验证
4. **移交机制**：Plan Mode 支持向专业 Agent 移交

## 与其他 AI 工具对比

| 维度 | Traycer.AI | Claude Code | Trae AI |
|------|------------|------------|---------|
| 模式 | Phase + Plan | 单一模式 | Chat + Builder |
| 代码编辑 | ❌ 禁止 | ✅ 允许 | ✅ 允许 |
| 任务管理 | write_phases | TodoWrite | TodoWrite |
| 移交机制 | hand_over | 无 | 无 |
| 角色定位 | 技术主管 | 开发者 | 编程助手 |

## 内部思考格式

```xml
<internal_monologue>
<thinking type="ruminate_last_step">
  反思上一步结果
</thinking>
<thinking type="plan_next_step">
  规划下一步
</thinking>
</internal_monologue>
```

## 相关资源

- [[augment-code-gpt5]] — Augment Code GPT-5 版本
- [[augment-code-sonnet4]] — Augment Code Sonnet 4 版本
- [[trae-ai]] — Trae AI
- [[agent-command-skill-comparison]] — 扩展机制对比
