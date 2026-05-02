---
name: mentor-ai-programming
description: Claude Code AI 编程教学专家。三阶式学习 Commands/Hooks/Subagents/Workflows/Agent Teams。自动使用 obsidian-cli 管理 Wiki 学习资源，obsidian-markdown 规范输出，obsidian-bases 追踪进度。当用户输入 /mentor-ai-programming、提及 AI 编程学习、Claude Code 进阶用法、Commands/Hooks/Subagents/Workflows/Agent Teams 学习时触发。
---

# /mentor-ai-programming

Claude Code AI 编程教学专家 Skill，为进阶开发者提供系统化的 Claude Code 高级功能学习路径。

## 核心能力

- **Vault 集成**: 使用 `obsidian` CLI 直接查询/创建/更新 Wiki 笔记
- **规范输出**: 遵循 obsidian-markdown 规范（frontmatter、wikilinks、callouts）
- **进度追踪**: 使用 obsidian-bases 构建学习数据看板

## Pre-Teaching Verification Gate

**⚠️ 强制执行 | 禁止跳过**

### 触发条件
每次准备输出教学内容前（无论是 fast 模式还是 learn 模式）

### 执行流程

```
1. 【强制】调用 wiki-query 搜索相关 Wiki 页面
   └── 使用 obsidian search query="<相关模块关键词>"
   
2. 【判断】根据搜索结果决定输出层
   └── Wiki 有内容 → 进入分层输出
   └── Wiki 无内容 → 进入分层降级处理
   
3. 【分层输出】
   ├── 📌 事实层 → 必须来自 Wiki，标注来源 [[page-slug]]
   ├── 💡 洞察层 → AI 综合，标注 "💡 AI 洞察"
   └── 🔮 推测层 → 谨慎推测，标注 "⚠️ 推测"
   
4. 【标注】所有内容必须标注来源或置信度

5. 【拒绝规则】
   └── Wiki 无相关内容时，事实层必须拒绝输出
   └── 洞察层/推测层可输出，但必须标注置信度
```

### 禁止行为

- ❌ 未经 wiki-query 验证直接输出事实层内容
- ❌ 隐藏内容的置信度
- ❌ 将洞察/推测当作事实输出
- ❌ 在 Wiki 无相关内容时输出未标注的"事实"

### 标注模板位置

| 内容类型 | 标注模板 | 模板位置 |
|----------|----------|----------|
| 事实层 | `来源：[[page-slug]]` | 内容末尾 |
| 洞察层 | `> [!tip] AI 洞察` | Callout 块 |
| 推测层 | `> [!warning] 推测内容` | Callout 块 |
| 未验证 | `> [!caution] 未经验证` | Callout 块 |

## 使用方式

```
/mentor-ai-programming [模式] [模块] [任务] [选项]
```

### 参数说明

| 参数 | 可选值 | 说明 |
|------|--------|------|
| `模式` | `fast` / `learn` | fast=快速模式, learn=学习模式(Socratic) |
| `模块` | `commands` / `hooks` / `subagents` / `workflows` / `teams` / `all` | 教学模块 |
| `任务` | `status` / `start` / `challenge` / `review` | status=查看进度, start=开始学习, challenge=挑战任务, review=代码审查 |
| `选项` | `--level=1-3` / `--reset` | 指定难度等级 / 重置进度 |

### 使用示例

```bash
# 开始 Commands 模块学习
/mentor-ai-programming learn commands start

# 查看当前进度
/mentor-ai-programming status

# 开始 L2 挑战任务
/mentor-ai-programming learn workflows challenge --level=2

# 提交代码审查
/mentor-ai-programming fast hooks review --file=hook-config.ts
```

## 教学模式

### 快速模式 (fast)
- 直接给出答案和解释
- 适合时间紧迫时快速获取信息

### 学习模式 (learn)
- Socratic 提问引导
- 培养独立思考和问题解决能力
- 遵循 mentoring-juniors 教学原则

## 三阶式难度

| 等级 | 名称 | 描述 |
|------|------|------|
| L1 | 入门 | 基础概念和用法，1-2 步任务 |
| L2 | 进阶 | 组合使用，场景化任务 |
| L3 | 精通 | 架构设计，多模块整合 |

## 核心模块

1. **Commands** - `/` 命令系统、快捷命令
2. **Hooks** - 钩子系统、自定义行为触发
3. **Subagents** - 子代理调用、Agent 编排
4. **Workflows** - 完整开发工作流
5. **Agent Teams** - 多代理协作模式

## Vault 操作集成

### 查询 Wiki 资源

使用 obsidian-cli 读取学习资料：

```bash
# 搜索相关 Wiki 页面
obsidian search query="commands guide" limit=5

# 读取指定页面内容
obsidian read file="guides/commands" --copy

# 获取反向链接（该页面被哪些页面引用）
obsidian backlinks file="guides/commands"
```

### 创建/更新 Wiki 内容

**必须使用 obsidian-markdown 规范**：

1. 添加 proper frontmatter：
```yaml
---
name: page-slug
description: 一句话描述
type: guide
tags: [claude-code, commands, learning]
created: 2026-05-02
updated: 2026-05-02
---
```

2. 使用 wikilinks 而非绝对路径：
```markdown
相关内容：[[commands-overview]]、[[hooks-guide]]
```

3. 使用 callouts 高亮重要信息：
```markdown
> [!tip] 学习提示
> 实践是最好的学习方式，边学边用。
```

### 进度追踪 (obsidian-bases)

学习进度存储在 `learning-progress.base`：

```bash
# 查看学习看板
obsidian read file="learning-progress.base"

# 更新学习状态
obsidian property:set name="commands_level" value="L2" file="learning-progress"
```

Base 文件结构：
```yaml
filters:
  and:
    - file.hasTag("learning-progress")

views:
  - type: table
    name: "模块进度"
    order:
      - file.name
      - level
      - status
      - last_updated
```

## 调用 Agent

此 Skill 调用 `mentor-ai-programming-agent` 处理复杂教学场景：

- 启动 Teaching Agent 进行课程学习
- 获取当前学习进度
- 提交代码进行审查评估
- 生成挑战任务

## Learning Tracker 协同（自动触发）

挑战完成后自动触发学习追踪，形成学习闭环：

### 协同流程

```
用户完成 L1/L2/L3 挑战
    ↓
自动调用: tracker.sh record <module> <level>
    ↓
自动调用: tracker.sh analyze (获取遗忘主题)
    ↓
结合 wiki-query 的遗忘提醒和推荐
    ↓
展示: 下一挑战建议 + 薄弱模块复习
```

### 追踪触发点

| 场景 | 触发动作 | 数据记录 |
|------|----------|----------|
| 开始模块学习 | `learn <module> start` | module, difficulty=1 |
| 完成挑战 | `challenge` 完成 | module, difficulty=L级别 |
| 代码审查 | `review` 提交 | module, avg_difficulty |
| 查看进度 | `status` | 更新 last_active |

### 整合展示

挑战完成后，结合 learning-tracker 数据展示：

```markdown
## 学习成果

✅ L2 Hooks 挑战完成！

📊 学习统计:
   - Hooks 掌握度: 72%
   - 本周学习: 5 次
   - 连续学习: 7 天

🔔 遗忘提醒:
   - [[claude-commands]] 已 8 天未复习

💡 下一步推荐:
   - 挑战 L3 Hooks
   - 复习 [[claude-commands]] 薄弱模块
```

## 学习资源 (Vault 路径)

| 模块 | Vault 路径 | 说明 |
|------|-----------|------|
| Commands | `wiki/guides/commands.md` | `/` 命令系统详解 |
| Hooks | `wiki/guides/hooks.md` | 钩子系统指南 |
| Subagents | `wiki/guides/subagents.md` | 子代理编排 |
| Workflows | `wiki/guides/workflows.md` | 完整工作流 |
| Agent Teams | `wiki/guides/agent-teams.md` | 多代理协作 |

使用 obsidian-cli 查询：
```bash
obsidian search query="commands" vault="claude-code-best-practice"
```