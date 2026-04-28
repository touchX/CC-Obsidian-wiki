# Claude Code Best Practice

Claude Code 最佳实践知识库 — 基于 Karpathy LLM Wiki 方法论构建的 Obsidian Wiki 系统。

## 目录结构

```
├── wiki/              # Wiki 知识库 (65 页面)
│   ├── concepts/      # 核心概念
│   ├── entities/      # 实体文档
│   ├── guides/        # 操作指南
│   ├── synthesis/      # 综合分析
│   ├── tutorial/      # 教程
│   └── tips/           # 实用技巧
├── archive/           # 归档文件 (216 文件)
├── raw/               # 待处理原始文档
├── docs/              # 项目文档
└── .claude/skills/    # Claude Code Skills
```

## Wiki 工作流

```
raw/ → [ingest] → wiki/ + archive/
```

| 流程 | 命令 | 说明 |
|------|------|------|
| **Ingest** | 读取 raw/ → 创建 wiki/ 页面 → 归档到 archive/ | 添加新知识 |
| **Query** | 读取 wiki/index.md → 相关页面 → 综合回答 | 回答问题 |
| **Lint** | `bash .claude/skills/wiki-lint/wiki-lint.sh` | 健康检查 |

## Skills 系统

| Skill | 用途 |
|-------|------|
| `docs-ingest` | 文档摄取 — raw → wiki |
| `wiki-query` | Wiki 查询 — 回答问题 |
| `wiki-lint` | 健康检查 — 验证完整性 |
| `inspool` | 灵感沉淀 — 会话 → 笔记 |

## 快速开始

### 添加新知识

```bash
# 1. 将文档放入 raw/ 目录
# 2. 使用 docs-ingest skill 摄取
# 3. 文档自动归档到 archive/
```

### 查询 Wiki

```bash
# 使用 wiki-query skill 搜索相关页面
# 系统自动查询并综合回答
```

### 健康检查

```bash
bash .claude/skills/wiki-lint/wiki-lint.sh
```

## 核心概念

| 概念 | 说明 |
|------|------|
| [Agent 架构](wiki/synthesis/agent-architecture.md) | Agent 系统设计 |
| [Context 管理](wiki/concepts/context-management.md) | 上下文窗口策略 |
| [Skills 系统](wiki/entities/claude-skills.md) | 技能发现与使用 |
| [Memory 使用](wiki/guides/memory-usage.md) | 记忆策略 |

## 相关资源

- [使用指南](docs/usage-guide.md) — 项目操作详解
- [维护指南](docs/maintenance-guide.md) — Wiki 维护流程
- [Wiki Schema](wiki/WIKI.md) — 页面规范

---

*Built with Claude Code + Obsidian*