---
memory.usage
name: memory-usage
description: Claude Code 记忆系统使用指南 — memU、Claude-Mem、Platform Memory、Memory Hub 四层架构的日常操作与最佳实践
type: guide
tags: [memory, memu, claude-mem, platform-memory, memory-hub, guide]
created: 2026-04-28
updated: 2026-05-03
source: ../../archive/guides/memory-usage.md
---

# Claude Code 记忆系统使用指南

> 本文档完整介绍四层记忆架构的日常使用、检索策略和维护流程。

## 四层架构概览

| 层级 | 系统 | 存储位置 | 用途 | 持久性 |
|------|------|----------|------|--------|
| L1 | **memU** (MCP) | Ollama 本地语义索引 | 长期语义知识、经验技巧 | 跨会话持久 |
| L2 | **Claude-Mem** (MCP) | 知识图谱 (端口 37778) | 近期活动、决策记录 | 跨会话持久 |
| L3 | **Platform Memory** | `~/.claude/projects/<slug>/memory/` | 项目静态信息、架构文档 | 会话自动加载 |
| L4 | **Memory Hub** | Skill (已注册激活) | 统一入口 | 已安装 |

## L1: memU — 长期语义记忆

### 存储

```markdown
<!-- 方式一：自然语言指令 -->
请记住：使用 `git stash -u` 同时暂存未跟踪文件

<!-- 方式二：通过 MCP 工具 -->
memU store → content: "内容" + category: "tech"
```

### 检索

```markdown
<!-- RAG 模式（快速，默认） -->
请搜索关于 X 的记忆

<!-- LLM 模式（深度理解） -->
请深入搜索关于 X 的记忆
```

### 管理

| 操作 | 命令 |
|------|------|
| 查看统计 | `memU stats` |
| 查看分类 | `memU categories` |
| 健康检查 | `memU health` |

### 10 个分类

`tech`, `devtools`, `project`, `solutions`, `preferences`, `经验技巧`, `devops`, `workflow`, `architecture`, `learning`

### 存储触发时机

- **完成成熟工作流后**：立即存储关键经验
- **发现解决方案后**：记录问题 → 解决方案 → 关键命令
- **会话结束前**：主动询问 "是否需要存储此次经验"

## L2: Claude-Mem — 近期活动图谱

### 三层搜索流程

```
1. search(query)     → 获取索引 + ID（≈50-100 tokens）
2. timeline(anchor)  → 查看上下文
3. get_observations  → 获取完整细节
```

### 实体类型

`decision`, `bugfix`, `feature`, `refactor`, `discovery`, `change`

### 优化建议

- 每周运行 `/memory-optimize` 去重压缩
- 当前 50 条记录，40% 压缩率 — 持续关注

## L3: Platform Memory — 项目静态知识

### 存储位置

```
C:\Users\Admin\.claude\projects\<project-slug>\memory\
  ├── MEMORY.md                    # 索引文件（自动加载）
  ├── architecture-overview.md     # 架构概览
  ├── teaching-accuracy-system.md  # 教学准确性系统
  ├── wiki-first-principle.md      # Wiki-First 原则
  ├── project-structure.md         # 项目结构
  ├── memu-config.md               # memU 配置
  ├── claude-mem-knowledge-graph.md # 知识图谱说明
  └── memory-hub-skill.md          # Memory Hub Skill
```

### 维护规则

- **MEMORY.md** 是唯一索引入口，自动加载到会话上下文
- 内容应保持简洁（单文件 <200 行）
- 指向外部资源的路径使用绝对路径
- 及时清理过时或冗余文件

## L4: Memory Hub — 统一入口（已激活）

### 命令

| 命令 | 功能 |
|------|------|
| `index` | 跨层索引所有记忆 |
| `search` | 统一搜索所有层级 |
| `store` | 存储到合适的层级 |
| `stats` | 各层使用统计 |
| `optimize` | 去重 → 迁移 → 压缩 → 验证 |
| `health` | 各层健康状态 |

### 当前状态

已在 `.claude/skills/memory-hub/SKILL.md` 中注册激活。通过 `/memory-hub <command>` 调用。

## 检索策略

### 搜索顺序

```
Platform Memory (L3) → memU (L1) → Claude-Mem (L2)
```

因为 L3 最轻量（文件读取），L1 次之（RAG 检索），L2 最重（知识图谱遍历）。

### 场景示例

| 场景 | 搜索策略 |
|------|----------|
| 查询项目架构 | L3 — 读 MEMORY.md |
| 回忆之前解决过的问题 | L2 — 搜索近期活动 |
| 查询最佳实践 | L1 — 搜索长期记忆 |
| 全面检索 | L4 — Memory Hub |
| 日常快速参考 | L3 + L1 组合 |

## 维护工作流

### 日常

- 完成工作流后存储关键经验到 memU
- 记录重要决策到 Claude-Mem

### 每周

- 运行 `memory-optimize` 去重 → 迁移 → 压缩 → 验证
- 检查各层健康状态

### 按需

- 条目 > 50 时触发优化
- 发现矛盾或过时内容时立即修正

## 最佳实践

1. **先查后写**：检索已有记忆再存储，避免重复
2. **分类一致**：存储时使用统一的 10 个分类
3. **精简内容**：每条记忆聚焦一个知识点，便于检索
4. **定期维护**：防止记忆膨胀降低检索效率
5. **交叉引用**：将记忆与 Wiki 页面、规则文件关联

## 相关资源

- [[../WIKI|Wiki Schema 规范]]
- [[../../index|Wiki 索引]]
- [[teaching-accuracy|教学准确性系统]]
- `~/.claude/rules/memory-strategy.md` — 记忆策略规则
- `~/.claude/rules/hooks.md` — 钩子系统配置
