# 学习系统协同改进路线

> 记录 wiki-query + learning-tracker + mentor-ai-programming 三者协同的改进历程和使用效果

## 改进概述

### 改进时间
2026-05-02

### 改进动因
三个 Skill 相互独立，数据未打通，导致：
- mentor 完成挑战后，学习行为未被 learning-tracker 追踪
- learning-tracker 的遗忘提醒未结合 mentor 的学习路径
- wiki-query 的推荐未利用 mentor 的三阶难度体系

### 改进方案
**方案A：增量整合** — 在现有 Skill 上增加协同逻辑，最小改动快速见效

---

## 协同架构

### 整合前（各自独立）

```
mentor-ai-programming ──┐
                        ├── 独立运行，数据不互通
wiki-query ─────────────┤
                        │
learning-tracker ───────┘
```

### 整合后（增量协同）

```
┌─────────────────────────────────────────────────────────────┐
│                      mentor-ai-programming                     │
│                    (学习路径 + 难度控制)                       │
│                              │                               │
│                    挑战完成 → tracker.sh record              │
└──────────────────────────────┼───────────────────────────────┘
                               │
┌──────────────────────────────┼───────────────────────────────┐
│                              ▼                               │
│                         wiki-query                            │
│                   (信息检索 + Wiki-First)                     │
│                              │                               │
│              语义搜索 ← ─── ┼ ───→ 遗忘检查                    │
│                              │                               │
│                              ▼                               │
│                    learning-tracker                           │
│              (查询追踪 + 遗忘提醒 + 主动推荐)                  │
└─────────────────────────────────────────────────────────────┘
```

---

## 具体改动

### 1. wiki-query/SKILL.md 新增内容

#### mentor-ai-programming 协同感知

当检测到用户正在学习以下模块时，增强搜索和推荐：

| 模块 | Wiki 标签 | 推荐策略 |
|------|-----------|----------|
| commands | `commands` | 优先推荐 [[claude-commands]] |
| hooks | `hooks` | 优先推荐 [[hooks]] 进阶内容 |
| subagents | `subagents` | 优先推荐 [[subagents]] 编排模式 |
| workflows | `workflows` | 优先推荐 [[workflows]] 完整流程 |
| teams | `agent-teams` | 优先推荐 [[agent-teams]] 协作模式 |

#### Learning Tracker 集成完善

- **遗忘提醒**：7+ 天未复习的主题自动添加复习提示
- **主动推荐**：基于 learning-tracker 数据推荐下一步学习

### 2. mentor-ai-programming/SKILL.md 新增内容

#### Learning Tracker 协同（自动触发）

挑战完成后自动触发学习追踪：

| 场景 | 触发动作 | 数据记录 |
|------|----------|----------|
| 开始模块学习 | `learn <module> start` | module, difficulty=1 |
| 完成挑战 | `challenge` 完成 | module, difficulty=L级别 |
| 代码审查 | `review` 提交 | module, avg_difficulty |
| 查看进度 | `status` | 更新 last_active |

#### 整合展示格式

挑战完成后，结合 learning-tracker 数据展示学习成果、遗忘提醒和下一步推荐。

---

## 预期效果

### 短期（1-2周）

| 指标 | 预期 |
|------|------|
| 学习数据完整性 | mentor 挑战完成率自动记录 |
| 遗忘提醒准确度 | 基于实际学习路径，而非泛化查询 |
| 推荐相关性 | 结合三阶难度体系，推荐更精准 |

### 中期（1个月）

| 指标 | 预期 |
|------|------|
| 学习连续性 | 通过遗忘提醒维持学习连续 |
| 知识覆盖度 | 薄弱模块被优先推荐复习 |
| Wiki 更新频率 | 学习过程自动沉淀到 Wiki |

---

## 使用效果记录

### 记录模板

```markdown
### [日期] 使用场景

**触发**: 用户执行了...
**协同流程**: ...
**追踪数据**: ...
**效果评估**: ...
```

### 待填充记录

（首次使用后填写）

---

## 方案B 深度整合构想

> 以下为持续思考和积累的深度整合方案，待方案A验证后评估是否执行

### 核心问题

1. **数据格式不统一**
   - learning-tracker: `user-activity.json` (轻量) + frontmatter 扩展
   - mentor: `obsidian-bases` (learning-progress.base)
   - wiki-query: frontmatter `query_count`

2. **触发机制分散**
   - wiki-query: 用户提问时触发
   - mentor: 用户调用 `/mentor-ai-programming` 时触发
   - learning-tracker: 脚本手动/自动调用

### 深度整合架构构想

```
┌─────────────────────────────────────────┐
│            learning-hub (协调层)           │
│  (路由 + 数据聚合 + 统一触发)              │
└────────────────┬────────────────────────┘
                  │
     ┌────────────┼────────────┐
     ▼            ▼            ▼
mentor    wiki-query    learning-tracker
```

**learning-hub 职责**：
- 统一接收用户输入（提问/学习/挑战）
- 协调各 Skill 执行顺序
- 聚合学习数据，统一展示
- 触发遗忘提醒和学习推荐

### 待验证假设

1. 增量整合是否足够满足需求？
2. 用户是否频繁使用 `/mentor-ai-programming`？
3. Wiki 数据沉淀是否成为负担？
4. 统一协调层是否带来显著收益？

---

## 维护日志

| 日期 | 变更内容 | 理由 |
|------|----------|------|
| 2026-05-02 | 初始版本，方案A增量整合 | 最小改动快速见效 |
