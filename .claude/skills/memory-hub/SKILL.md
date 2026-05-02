---
name: memory-hub
description: 四层记忆系统的统一访问入口 — 跨层索引、搜索、存储、优化
user-invocable: true
---

# Memory Hub Skill

## Overview

Memory Hub 是 Claude Code 四层记忆系统的统一访问接口，提供跨层索引、搜索、存储和维护功能。激活后可通过 `/memory-hub <command>` 调用。

### 四层架构

| 层级 | 系统 | 类型 | 位置 |
|------|------|------|------|
| L1 | **memU** | MCP 语义记忆 | Ollama 本地索引 (287 条目) |
| L2 | **Claude-Mem** | MCP 知识图谱 | 端口 37778 (50 条记录) |
| L3 | **Platform Memory** | 文件系统 | `~/.claude/projects/<slug>/memory/` |
| L4 | **Memory Hub** | Skill | 本文件 |

## Commands

| 命令 | 功能 | 执行内容 |
|------|------|----------|
| `/memory-hub index` | 跨层索引所有记忆 | 读取各层状态 → 汇总报告 |
| `/memory-hub search <query>` | 统一搜索所有层级 | L3 → L1 → L2 顺序检索 |
| `/memory-hub store <content>` | 存储到合适层级 | 自动判断层级并写入 |
| `/memory-hub stats` | 各层使用统计 | 条目数、Token 量、健康状态 |
| `/memory-hub optimize` | 去重→迁移→压缩→验证 | 四步维护流程 |
| `/memory-hub health` | 各层健康状态 | 连通性、条目数、异常检测 |

## Search Strategy

搜索按查询成本升序执行：

```
L3 (Platform Memory)  →  最轻量，文件读取
L1 (memU)             →  RAG 语义检索
L2 (Claude-Mem)       →  知识图谱遍历（最重）
```

### 搜索场景

| 场景 | 策略 |
|------|------|
| 查询项目架构 | L3 — 读 MEMORY.md |
| 回忆之前解决过的问题 | L2 — 搜索近期活动 |
| 查询最佳实践 | L1 — 搜索长期记忆 |
| 日常快速参考 | L3 + L1 组合 |

## Store Logic

根据内容类型自动路由到合适的层级：

| 内容类型 | 目标层级 | 示例 |
|----------|----------|------|
| 长期知识、最佳实践 | L1 (memU) | "记住：使用 git stash -u" |
| 近期决策、活动记录 | L2 (Claude-Mem) | "决定采用 TDD 流程" |
| 项目静态信息 | L3 (Platform Memory) | 架构文档、项目结构 |

## Maintenance

### 日常
- 完成工作流后存储关键经验到 memU
- 记录重要决策到 Claude-Mem

### 每周
- 运行 `/memory-hub optimize`（去重→迁移→压缩→验证）
- 运行 `/memory-hub health` 检查各层状态

### 按需
- 条目 > 50 时触发优化
- 发现矛盾或过时内容时立即修正

## Related

- `wiki/guides/memory-usage.md` — 记忆系统使用指南
- `~/.claude/rules/memory-strategy.md` — 记忆策略规则
- `~/.claude/projects/<slug>/memory/MEMORY.md` — 项目记忆索引
