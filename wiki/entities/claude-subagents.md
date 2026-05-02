---
name: entities/claude-subagents
description: 子代理系统 — 多 Agent 并行协作与任务分发
type: entity
tags: [subagents, multi-agent, parallel]
created: 2026-04-26
updated: 2026-05-01
source: ../../archive/best-practice/claude-subagents.md
---

# Claude Subagents

子代理系统支持多 Agent 并行协作，通过 `[[subagents]]` 语法和前端字段配置实现复杂任务分解。

## 前端字段

```yaml
---
name: agent-name
description: 代理描述
agent: agent-type      # 5 种内置类型
model: sonnet         # 可选模型覆盖
tools: [Read, Write]  # 工具白名单
mcpServers: [...]    # MCP 服务范围
---
```

## 内置 Agent 类型

| 类型 | 用途 |
|------|------|
| `general-purpose` | 通用任务处理 |
| `code-reviewer` | 代码审查 |
| `frontend-developer` | 前端开发 |
| `backend-architect` | 后端架构 |
| `test-engineer` | 测试工程 |

## 协作模式

- **并行执行**: 多 Agent 同时工作
- **层级传递**: 结果逐层汇总
- **工具限制**: 隔离敏感操作

## 相关页面

- [[claude-mcp]] — MCP 服务配置
- [[claude-skills]] — 技能系统