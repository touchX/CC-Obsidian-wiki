# Learning Tracker 使用指南

> 让 Wiki 越用越智能，越用越了解用户

## 概述

Learning Tracker 是本项目的智能学习进化系统，通过追踪用户的查询行为，自动构建知识画像，识别学习缺口，并在适当时机主动推荐相关内容，实现"知识复利"的持续累积。

## 核心能力

- **查询追踪** — 记录每次 Wiki 查询，自动统计热门主题
- **难度评估** — 用户可标记理解难度，识别知识缺口
- **遗忘提醒** — 7 天未复习的主题主动提醒
- **个性化推荐** — 基于查询历史推荐下一步学习内容
- **学习连续追踪** — 激励持续学习

## 快速开始

### 1. 初始化系统（首次使用）

```bash
bash .claude/skills/learning-tracker/tracker.sh init
```

这将创建：
- `config/user-activity.json` — 用户活动数据
- `wiki/synthesis/user-learning/` — Wiki 学习页面

### 2. 正常进行 Wiki 查询（自动追踪）

Learning Tracker 与 [[wiki-query]] 深度集成，**无需手动执行**。每次查询都会自动记录：

```
用户问问题 → wiki-query 执行 → tracker.sh record 自动调用 → 主题被追踪
```

### 3. 查看学习分析

```bash
bash .claude/skills/learning-tracker/tracker.sh analyze
```

输出示例：
```
═══════════════════════════════════════
        用户学习分析报告
═══════════════════════════════════════

📊 基础统计
   总查询数: 156
   学习连续: 7 天
   最近活跃: 2026-05-02

🔥 热门主题 TOP5
   claude-commands: 45 次
   hooks: 32 次
   subagents: 28 次

⚠️  知识缺口检测
   async-await: 询问 5 次，平均难度 4.2

🔔 遗忘提醒
   ⏰ [8 天前] context-window — 建议复习
```

### 4. 获取推荐

```bash
bash .claude/skills/learning-tracker/tracker.sh recommend
```

## 手动调用场景

通常情况下你不需要手动调用。但在以下场景可以手动执行：

| 场景 | 命令 |
|------|------|
| 离线学习记录 | `tracker.sh record <topic> [difficulty]` |
| 查看详细分析 | `tracker.sh analyze` |
| 获取推荐 | `tracker.sh recommend` |
| 重置追踪数据 | `rm config/user-activity.json && tracker.sh init` |

## 难度等级说明

| 等级 | 含义 | 示例 |
|------|------|------|
| 1 | 完全不懂 | 第一次接触某个概念 |
| 2 | 初步了解 | 看过文档但未实践 |
| 3 | 基本掌握 | 能完成简单任务 |
| 4 | 熟练理解 | 能解决常见问题 |
| 5 | 精通 | 能教别人 |

## 与 Wiki-Query 集成（自动执行）

Learning Tracker 与 [[wiki-query]] 深度集成，**用户无感知地自动执行**：

```
用户提问
    ↓
wiki-query 执行搜索
    ↓
读取 Wiki 页面
    ↓
自动追踪 ← tracker.sh record 在后台调用
    ↓
返回答案 + 来源引用 [[page-slug]]
    ↓
自动评估是否需要推荐 / 复习提醒
```

**用户只需正常提问，系统自动完成所有追踪。**

## 数据结构

### 轻量层 — user-activity.json

位置：`.claude/skills/learning-tracker/config/user-activity.json`

```json
{
  "_comment": "用户学习活动追踪 - 轻量积分系统",
  "schema_version": "1.0",
  "user_id": "default",
  "last_active": "2026-05-02",
  "created": "2026-04-01",
  "topic_frequencies": {
    "claude-commands": 45,
    "hooks": 32,
    "subagents": 28
  },
  "weak_areas": [
    {"topic": "async-await", "count": 5, "avg_difficulty": 4.2}
  ],
  "learning_streak": 7,
  "total_queries": 156,
  "query_history": [...],
  "recent_topics": [...]
}
```

### Wiki 层 — frontmatter 扩展

Learning Tracker 会在 Wiki 页面的 frontmatter 中添加扩展字段：

```yaml
---
name: hooks
description: Claude Code 钩子系统详解
type: guide
tags: [claude-code, hooks, advanced]
created: 2026-04-15
updated: 2026-05-01
source: ../../archive/guides/hooks.md
# --- 智能进化字段（可选） ---
query_count: 32        # 被查询次数
last_queried: 2026-05-02  # 最后查询时间
difficulty_level: 3     # 用户理解难度评分
learning_path: next     # 学习路径标记
---
```

> [!NOTE] Schema 声明
> 这些扩展字段已在 `wiki/WIKI.md` 中正式声明，与项目 frontmatter 标准完全兼容。

### 图谱层 — Wiki 页面

自动生成的 Wiki 页面位于 `wiki/synthesis/user-learning/`：

- **knowledge-graph.md** — 主题关系图谱
- **recommendations.md** — 个性化推荐

## 触发机制

| 场景 | 频率策略 | 操作 |
|------|----------|------|
| 用户连续问 3+ 个相关问题 | 立即 | 提议创建该主题概念页 |
| 用户问基础问题（difficulty 1-2） | 中频 | 提议创建基础概念页 |
| 用户完成一个主题讨论 | 低频 | 追加学习路径，推荐下一个 |
| 用户超过 7 天未问某曾问主题 | 遗忘提醒 | 主动提议复习 |

## 完整工作流示例

### 场景：学习 Hooks 系统

1. **第一天：开始学习**
   ```bash
   # 记录首次查询
   bash .claude/skills/learning-tracker/tracker.sh record hooks 2
   ```

2. **第三天：深入学习**
   ```bash
   # 记录进步，难度降低
   bash .claude/skills/learning-tracker/tracker.sh record hooks 3
   ```

3. **第七天：复习**
   ```bash
   # 查看分析
   bash .claude/skills/learning-tracker/tracker.sh analyze
   
   # 获取推荐
   bash .claude/skills/learning-tracker/tracker.sh recommend
   ```

4. **遗忘提醒触发**
   ```
   ⏰ [8 天前] hooks — 建议复习
   ```

## 命令参考

### tracker.sh

| 命令 | 说明 | 示例 |
|------|------|------|
| `init` | 初始化追踪系统 | `tracker.sh init` |
| `record <topic> [difficulty]` | 记录查询事件 | `tracker.sh record hooks 3` |
| `analyze` | 生成学习分析报告 | `tracker.sh analyze` |
| `recommend` | 获取个性化推荐 | `tracker.sh recommend` |

### analyzer.sh

| 命令 | 说明 | 示例 |
|------|------|------|
| `init` | 初始化 Wiki 学习结构 | `analyzer.sh init` |
| `update-graph` | 更新知识图谱 | `analyzer.sh update-graph` |
| `update-rec` | 更新推荐页面 | `analyzer.sh update-rec` |
| `report` | 生成会话总结 | `analyzer.sh report` |
| `analyze` | 执行完整分析 | `analyzer.sh analyze` |

## 文件清单

```
.claude/skills/learning-tracker/
├── SKILL.md                      # 技能定义
├── tracker.sh                     # 追踪主脚本
├── analyzer.sh                    # 分析器脚本
└── config/                       # 运行时目录
    └── user-activity.json        # 用户活动数据

wiki/synthesis/user-learning/     # Wiki 层
├── knowledge-graph.md            # 知识图谱
└── recommendations.md           # 个性化推荐
```

## 依赖

- **jq** — JSON 处理工具（已安装）
- **bash** — Unix shell（Windows 使用 Git Bash 或 WSL）
- **obsidian-cli** — Obsidian CLI（可选，用于 Wiki 操作）

## 常见问题

### Q: 如何重置学习数据？

```bash
rm .claude/skills/learning-tracker/config/user-activity.json
bash .claude/skills/learning-tracker/tracker.sh init
```

### Q: 难度评分是主观的吗？

是，难度评分完全基于用户自我评估。系统会追踪多次评分并计算平均值，更准确反映实际掌握程度。

### Q: 数据存储在哪里？

- **轻量层**: `.claude/skills/learning-tracker/config/user-activity.json`
- **Wiki 层**: 各 Wiki 页面的 frontmatter 扩展字段
- **图谱层**: `wiki/synthesis/user-learning/`

### Q: 支持多用户吗？

当前版本仅支持单用户（user_id: default）。多用户支持在路线图中。

---

*本文档由 Learning Tracker 自动维护*
