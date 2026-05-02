# 教学 Skill 强制性 Wiki-First 验证机制实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 为 mentor-ai-programming 添加 Pre-Teaching Verification Gate，实现分层置信度输出模型，防止教学幻觉。

**Architecture:** 在 Skill 内部强制调用 wiki-query 作为验证门，将教学内容分为事实层/洞察层/推测层，实现透明标注和自动错误追踪。

**Tech Stack:** Claude Code Skills (SKILL.md), Wiki, error-tracking

---

## 文件结构

```
.claude/skills/mentor-ai-programming/SKILL.md   # P0: 核心改动
.claude/rules/teaching-accuracy.md              # P0: 更新分层模型
wiki/log.md                                     # P0: 记录变更
```

---

## Phase 1: P0 - 核心阻塞项（必须先行完成）

### Task 1: 更新 teaching-accuracy.md 添加分层置信度模型

**Files:**
- Modify: `.claude/rules/teaching-accuracy.md`

- [ ] **Step 1: 读取当前文件确认内容**

确认现有 teaching-accuracy.md 的结构，在红灯检查项之后添加分层置信度模型章节。

- [ ] **Step 2: 添加分层置信度模型章节**

在文件末尾"## 🔴 违反后果"章节之后添加：

```markdown
---

## 📊 分层置信度模型

### 三层架构

| 层级 | 定义 | Wiki 有内容 | Wiki 无内容 |
|------|------|------------|-------------|
| **📌 事实层** | 语法、用法、配置项、命令参数 | ✅ 基于 Wiki | ❌ 拒绝 |
| **💡 洞察层** | 场景联想、知识综合、类比 | ✅ Wiki+AI | ⚠️ 标注未验证 |
| **🔮 推测层** | 预测未来、未经证实 | ✅ 谨慎推测 | ⚠️ 加强警告 |

### 标注模板

**洞察层**：
```markdown
> [!tip] AI 洞察
> 💡 此分析基于对 [[page]] 的综合理解，仅供参考。
```

**推测层**：
```markdown
> [!warning] 推测内容
> ⚠️ 此为基于趋势的推测，官方尚未确认。
```

**未验证内容**：
```markdown
> [!caution] 未经验证
> ⚠️ 此内容基于训练数据，Wiki 中暂无相关记录。
```
```

- [ ] **Step 3: 提交变更**

```bash
git add .claude/rules/teaching-accuracy.md
git commit -m "docs: add layered confidence model to teaching-accuracy"
```

---

### Task 2: 修改 mentor-ai-programming SKILL.md 添加 Pre-Teaching Verification Gate

**Files:**
- Modify: `.claude/skills/mentor-ai-programming/SKILL.md`

- [ ] **Step 1: 在 SKILL.md 头部 ## 核心能力 章节之后添加 Pre-Teaching Verification Gate**

找到原文：
```markdown
## 核心能力

- **Vault 集成**: 使用 `obsidian` CLI 直接查询/创建/更新 Wiki 笔记
```

在其后添加：

```markdown
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
```

- [ ] **Step 2: 提交变更**

```bash
git add .claude/skills/mentor-ai-programming/SKILL.md
git commit -m "feat: add Pre-Teaching Verification Gate to mentor-ai-programming"
```

---

### Task 3: 更新 wiki/log.md 记录变更

**Files:**
- Modify: `wiki/log.md`

- [ ] **Step 1: 在 log.md 末尾添加变更记录**

```markdown
## 2026-05-02

### 技术教学质量保障体系建立

- **14:00** ✅ 设计文档完成：`docs/superpowers/specs/2026-05-02-teaching-skill-verification-design.md`
  - 建立分层置信度模型：📌 事实层 / 💡 洞察层 / 🔮 推测层
  - 决策：Skill 内部强制调用 wiki-query

- **14:30** ✅ 实施计划完成：`docs/superpowers/plans/2026-05-02-teaching-skill-verification-plan.md`

- **Phase 1 P0 实施**
  - `.claude/rules/teaching-accuracy.md` — 添加分层置信度模型
  - `.claude/skills/mentor-ai-programming/SKILL.md` — 添加 Pre-Teaching Verification Gate
  - `wiki/log.md` — 本记录

### 相关文档

- 设计文档：`docs/superpowers/specs/2026-05-02-teaching-skill-verification-design.md`
- 实施计划：`docs/superpowers/plans/2026-05-02-teaching-skill-verification-plan.md`
- 错误追踪：`.claude/rules/error-tracking.md`
```

- [ ] **Step 2: 提交变更**

```bash
git add wiki/log.md
git commit -m "docs: record teaching verification mechanism implementation in wiki/log"
```

---

## Phase 2: P1 - 验证和测试（可后续迭代）

### Task 4: 验证 Pre-Teaching Gate 正常工作

**Files:**
- Test: 通过实际调用 `/mentor-ai-programming learn commands start` 验证

- [ ] **Step 1: 测试触发验证门**

执行：`/mentor-ai-programming learn commands start`

**预期行为**：
1. Skill 应该首先调用 wiki-query 搜索 commands 相关 Wiki
2. 找到内容后分层输出
3. 事实层标注来源

- [ ] **Step 2: 测试 Wiki 无内容的处理**

执行：`/mentor-ai-programming learn xyz123 start`（虚构模块）

**预期行为**：
1. wiki-query 返回无结果
2. 如果请求事实层，应明确拒绝
3. 如果是洞察层，应标注"未经验证"

---

## Phase 3: P2 - 高级功能（可选迭代）

### Task 5: 考虑实现自动错误记录

**说明**：当出现未验证内容时，自动追加到 error-tracking.md

- [ ] **评估是否需要技术实现**，或仅依赖规范约束

---

## 实施检查清单

- [ ] Task 1: teaching-accuracy.md 已更新分层模型
- [ ] Task 2: mentor-ai-programming 已添加 Verification Gate
- [ ] Task 3: wiki/log.md 已记录变更
- [ ] Phase 1 所有 P0 项已完成
- [ ] Phase 2 Task 4 验证测试已执行

---

## 依赖关系

```
Task 1 ─┬─→ Task 2 ─┬─→ Task 3
         │            │
         └────────────┴─→ Phase 2 (Task 4)
         
Note: Task 1, 2, 3 可并行执行（文件独立）
```

---

**Plan complete and saved to `docs/superpowers/plans/2026-05-02-teaching-skill-verification-plan.md`**

---

**两个执行选项：**

**1. Subagent-Driven (recommended)** - I dispatch a fresh subagent per task, review between tasks, fast iteration

**2. Inline Execution** - Execute tasks in this session using executing-plans, batch execution with checkpoints

**Which approach?**
