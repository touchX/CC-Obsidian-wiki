---
name: tools/amp-claude-4-sonnet
description: Amp - Sourcegraph 的 AI 编程代理，使用 Claude-4-Sonnet 模型，具备 Agency 能力
type: source
tags: [claude-code, agent, claude-4, sourcegraph, agency]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/system-prompts/Amp/claude-4-sonnet.yaml
---

# Amp (Claude-4-Sonnet)

Amp 是 Sourcegraph 开发的 AI 编程代理，使用 Claude-4-Sonnet 模型，具备完整的 Agency 能力，可以自主规划和执行复杂任务。

## 核心技术

| 组件 | 说明 |
|------|------|
| Claude-4-Sonnet | 强大的推理和代码生成能力 |
| Agency 框架 | 自主任务规划和执行 |
| 并行执行 | 多任务同时处理 |
| Todo 跟踪 | 任务进度管理 |

## Agency 能力

Amp 的核心是 Agency 能力，使其能够：

### 自主决策

```yaml
agency:
  enabled: true
  max_iterations: 100
  self_verification: true
```

### 任务分解

```
复杂任务 → 分解为子任务 → 并行执行 → 结果整合
```

### 验证循环

1. 执行任务步骤
2. 验证结果正确性
3. 如有问题，自我修正
4. 继续下一步骤

## 工具集

### 搜索工具

| 工具 | 用途 |
|------|------|
| oracle | 代码库语义搜索 |
| grep | 模式匹配搜索 |
| find | 文件查找 |

### 执行工具

| 工具 | 用途 |
|------|------|
| bash | Shell 命令执行 |
| todo_write | 任务状态管理 |
| parallel | 并行任务执行 |

## Todo 跟踪系统

Amp 使用结构化的 Todo 系统管理任务：

```yaml
todos:
  - id: "task-1"
    content: "理解代码库结构"
    status: "in_progress"
    depends_on: []
  
  - id: "task-2"
    content: "实现核心功能"
    status: "pending"
    depends_on: ["task-1"]
```

### 状态流转

```
pending → in_progress → completed
                    ↘ failed
```

## 并行执行

Amp 支持多任务并行处理：

```yaml
parallel:
  max_workers: 5
  strategy: "dependency_aware"
```

### 执行模式

1. **依赖分析**：确定任务执行顺序
2. **批量调度**：将无依赖任务分组
3. **并发执行**：同时执行多个任务
4. **结果收集**：汇总各任务结果

## Oracle 工具

Oracle 是 Amp 的语义搜索工具：

```yaml
oracle:
  model: "claude-4-sonnet"
  mode: "codebase_aware"
  context_window: "adaptive"
```

### 使用场景

- 理解代码意图
- 查找相关实现
- 追踪调用链
- 识别代码模式

## 配置选项

```yaml
model:
  name: "claude-4-sonnet"
  temperature: 0.7
  max_tokens: 8192

behavior:
  verbose: true
  explain_reasoning: true
  confirm_destructive: true
```

## 相关链接

- [[tools/amp-gpt-5]] - Amp GPT-5 版本
- [[tools/junie-ai]] - Junie 探索代理
- [[tools/comet-assistant]] - Comet 浏览器自动化代理

---

*来源：[Amp Claude-4-Sonnet System Prompt](https://github.com/sourcegraph-claude/amp)*
