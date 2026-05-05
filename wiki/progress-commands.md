# Commands 模块教学总结
name: progress_commands

## 1. Commands 核心概念

> [!IMPORTANT] Commands 是什么
> Commands 是 Claude Code 的**命令入口点**，通过 Markdown 文件 + YAML frontmatter 定义，触发后同步执行并返回结果。

### 文件结构

```
.claude/commands/weather-orchestrator.md
---
description: 获取天气数据并创建 SVG 天气卡片
model: haiku
allowed-tools:
  - Agent
  - Skill
---

# Weather Orchestrator Command
[命令内容...]
```

### 核心特征

| 特性 | 说明 |
|------|------|
| **触发方式** | `/command-name` 斜杠命令 |
| **执行模式** | 同步执行，返回结果 |
| **语法格式** | **纯 Markdown 自然语言**（无 XML 标签） |
| **工具调用** | 自然语言描述 + 项目符号参数 |

### ⚠️ 重要语法更正

**错误语法（不要使用）**：
```markdown
<!-- ❌ 错误：使用了 XML 标签 -->
<invoke name="Agent">
  <parameter name="prompt">获取天气</parameter>
</invoke>
```

**正确语法**：
```markdown
<!-- ✅ 正确：使用自然语言 + 项目符号 -->
使用 Agent 工具调用 weather agent：

- subagent_type: weather-agent
- description: 获取迪拜天气数据
- prompt: 获取阿联酋迪拜的当前温度
```

---

## 2. Commands vs Agents vs Skills 区别

> [!TIP] 三种扩展机制对比
> 选择困难时记住：**需要推理** → Agent；**需要快捷调用** → Command；**需要知识注入** → Skill

### 核心差异矩阵

| 维度 | [[agents]] | [[commands]] | [[skills]] |
|------|:----------:|:-------------:|:-----------:|
| **上下文** | 独立、有状态 | 共享、同步 | 注入到 Agent |
| **触发方式** | 工具调用 | `/` 斜杠命令 | Agent 决定 |
| **记忆** | 有 memory | 无 | 无 |
| **自主决策** | 完全自主 | 被动执行 | 被动被调用 |
| **适用场景** | 复杂推理任务 | 快捷工作流 | 知识复用 |

### 调用关系图

```
Command ──── 触发 ───→ Agent
    ↑                      │
    │                      │
    └──── 调用 ────────────┘
              ↓
         Agent
         ├── skills: [weather-fetcher]
         └── Skill 不能主动调用 Agent
```

---

## 3. Weather Orchestrator 示例

> [!EXAMPLE] 完整工作流示例
> Weather Orchestrator 展示了 Command → Agent → Skill 的经典编排模式

### 工作流步骤

| 步骤 | 操作 | 使用工具 |
|------|------|----------|
| Step 1 | 询问用户偏好 | `AskUserQuestion` |
| Step 2 | 获取天气数据 | `Agent` (weather-agent) |
| Step 3 | 创建 SVG 卡片 | `Skill` (weather-svg-creator) |

### 架构角色分工

| 组件 | 角色 | 说明 |
|------|------|------|
| **Command** | 入口点、用户交互 | `/weather-orchestrator` 触发 |
| **Agent** | 数据获取、推理决策 | weather-agent + weather-fetcher |
| **Skill** | 独立输出能力 | weather-svg-creator |

### 代码结构

```yaml
---
description: Fetch weather data for Dubai and create an SVG weather card
model: haiku
allowed-tools:
  - AskUserQuestion
  - Agent
  - Skill
---

# Weather Orchestrator Command

## Step 1: Ask User Preference

Use the AskUserQuestion tool to ask the user whether they want the temperature in Celsius or Fahrenheit.

## Step 2: Fetch Weather Data via Agent

Use the Agent tool to invoke the weather agent:

- subagent_type: weather-agent
- description: Fetch Dubai weather data
- prompt: Fetch the current temperature for Dubai, UAE in [unit requested by user].
- model: haiku

## Step 3: Create SVG Weather Card

Use the Skill tool to invoke the weather-svg-creator skill:

- skill: weather-svg-creator
```

---

## 4. L1 挑战任务

> [!WARNING] 挑战任务
> 完成以下任务以通过 L1 级别：

### 任务清单

- [x] **Task 1**: 在 `.claude/commands/` 目录下创建一个新 Command 文件 ✅
- [x] **Task 2**: 编写符合规范的 YAML frontmatter（description + model）✅
- [x] **Task 3**: 命令内容使用正确的自然语言语法（不是 XML 标签）✅
- [ ] **Task 4**: 使用 `cd wiki && ../.claude/skills/wiki-lint/wiki-lint.sh` 验证 Wiki 健康
- [ ] **Task 5**: 在 [[progress-commands]] 中更新任务状态

### 验收标准

1. ✅ Command 文件位于正确目录
2. ✅ Frontmatter 包含必需字段
3. ✅ 使用**正确的 Markdown 自然语言语法**（无 XML 标签）
4. ⏳ 可以通过 `/命令名` 触发执行
5. ⏳ Wiki lint 检查通过

### 重要学习点

**语法更正（2026-05-02）**：
- ❌ 之前错误地认为 Command 使用 XML 标签语法
- ✅ 实际上 Command 使用**纯 Markdown 自然语言**
- ✅ 工具调用用**自然语言描述 + 项目符号参数**

---

## 5. 下一步

> [!QUESTION] 你准备好了吗？
> 完成 L1 挑战后，你将解锁：
> - **L2 进阶**: 多步编排与条件分支
> - **L3 大师**: 完整 Weather Orchestrator 实现

### 相关资源

- [[guides/commands]] — Commands 使用指南
- [[implementation/commands-implementation]] — 命令实现详解
- [[synthesis/agent-command-skill-comparison]] — 三种机制对比
- [[skills/weather-fetcher]] — 天气获取 Skill
- [[skills/weather-svg-creator]] — SVG 创建 Skill
- [[raw/notes/2026-05-02-command-correct-guide]] — **已修正的完整指南**

---

**准备好接受挑战了吗？** 🚀

*最后更新：2026-05-02（修正严重语法错误）*
