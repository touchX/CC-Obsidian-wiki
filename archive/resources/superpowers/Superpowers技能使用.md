# Superpowers 技能使用完全指南

> 来源：obra/superpowers 插件 v5.0.7
> 整理：2026-05-05

---

## 核心设计思想

1. **流程先于实现** — 任何功能开发都必须先经过 design → plan → execute 的完整流程
2. **子代理驱动开发** — 每次任务使用全新子代理，避免上下文污染，保证高质量快速迭代
3. **双重审查机制** — spec 合规性审查 + 代码质量审查，两阶段缺一不可

---

## 完整技能清单

### 🔵 核心流程技能（按使用顺序）

| 技能                              | 触发时机       | 核心功能               |
| ------------------------------- | ---------- | ------------------ |
| **brainstorming**               | 任何创意工作之前   | 需求澄清 → 设计方案 → 用户审批 |
| **using-git-worktrees**         | 设计批准后开始实现前 | 创建隔离工作空间           |
| **writing-plans**               | 设计批准后      | 将设计分解为 2-5 分钟的原子任务 |
| **subagent-driven-development** | 执行计划时（推荐）  | 子代理驱动 + 两阶段审查      |
| **executing-plans**             | 替代方案       | 同一会话批量执行 + 检查点     |

### 🔴 质量保障技能

| 技能 | 核心原则 |
|------|----------|
| **test-driven-development** | RED-GREEN-REFACTOR — 先写测试，看它失败，再写最小代码让它通过 |
| **systematic-debugging** | 4 阶段根因分析 — 不找到根因绝不修复 |
| **verification-before-completion** | 证据优先 — 运行验证命令后再声称成功 |
| **requesting-code-review** | 每任务后必审查，按严重程度处理问题 |

### 🟢 协作与收尾技能

| 技能 | 用途 |
|------|------|
| **receiving-code-review** | 审查反馈的技术评估，不盲目接受 |
| **finishing-a-development-branch** | 验证测试 → 呈现 4 选项 → 执行清理 |
| **dispatching-parallel-agents** | 并行分发独立任务到多个子代理 |

### 🟣 元技能

| 技能 | 用途 |
|------|------|
| **writing-skills** | TDD 方式编写新技能 — 先测试再写文档 |
| **using-superpowers** | 技能系统入门，优先级和调用规则 |

---

## 技能详解

### 1. brainstorming — 设计阶段的正确用法

```
★ 核心原则：一次只问一个问题，多选优于开放
★ 必做：检查项目上下文 → 视觉伴侣（如需）→ 逐个澄清问题
★ 输出：设计文档保存到 docs/superpowers/specs/
★ 门控：未经用户批准绝不开始实现
```

**流程：**
1. 探索项目上下文（文件、文档、最近提交）
2. 提供视觉伴侣（如涉及 UI 问题）
3. 逐个问澄清问题
4. 提出 2-3 个方案及权衡
5. 呈现分节设计
6. 写设计文档到 `docs/superpowers/specs/YYYY-MM-DD-<topic>-design.md`
7. 自检：占位符、内部一致性、范围、歧义
8. 用户审批
9. 调用 writing-plans

**最大化策略：**
- 大型项目先分解为子项目，每个子项目独立走完整流程
- 设计分解为独立单元，每个单元有清晰边界
- 使用 Visual Companion 处理 UI/架构图问题

---

### 2. using-git-worktrees — 创建隔离工作空间

```
★ 目录优先级：.worktrees/ > worktrees/ > CLAUDE.md 配置 > 询问用户
★ 必做：验证目录在 .gitignore 中
★ 必做：运行项目设置和基线测试
```

**流程：**
1. 检查现有目录
2. 检查 CLAUDE.md 偏好
3. 询问用户（如需要）
4. 验证目录被忽略（项目本地目录）
5. 创建 worktree 和新分支
6. 运行项目设置（npm install / cargo build 等）
7. 验证基线测试通过

---

### 3. writing-plans — 任务分解

```
★ 每个任务 2-5 分钟
★ 必须包含：完整代码、精确文件路径、验证步骤
★ 禁止：TBD、TODO、"类似 Task N"、空泛描述
```

**Plan 文档结构：**
```markdown
# [功能名] Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: superpowers:subagent-driven-development

**Goal:** [一句话描述]
**Architecture:** [2-3 句方法]
**Tech Stack:** [关键技术和库]

---

### Task N: [组件名]

**Files:**
- Create: `exact/path/to/file.py`
- Modify: `exact/path/to/existing.py:123-145`
- Test: `tests/exact/path/to/test.py`

- [ ] **Step 1: Write the failing test**

```python
def test_specific_behavior():
    result = function(input)
    assert result == expected
```

- [ ] **Step 2: Run test to verify it fails**
- [ ] **Step 3: Write minimal implementation**
- [ ] **Step 4: Run test to verify it passes**
- [ ] **Step 5: Commit**
```

---

### 4. subagent-driven-development — 最高效的实现方式

```
★ 核心原则：新鲜子代理 + 两阶段审查
★ 审查顺序：spec 合规性审查 → 代码质量审查
★ 模型选择：机械任务用便宜模型，集成/判断任务用标准模型，架构/设计用最强模型
```

**每任务流程：**
```
dispatch implementer subagent
    ↓
implementer 问问题？→ 是 → 提供上下文，重新分发
    ↓ 否
implementer 实现、测试、提交、自检
    ↓
dispatch spec reviewer subagent
    ↓
spec 合规？→ 否 → implementer 修复 → 重新审查
    ↓ 是
dispatch code quality reviewer subagent
    ↓
code 质量？→ 否 → implementer 修复 → 重新审查
    ↓ 是
标记任务完成
```

**实现者状态处理：**
- **DONE** → 进入 spec 审查
- **DONE_WITH_CONCERNS** → 先读关注点再决定
- **NEEDS_CONTEXT** → 提供缺失信息重新分发
- **BLOCKED** → 评估原因后重新分发或升级

---

### 5. test-driven-development — 铁律

```
★ 铁律：没有先失败的测试，绝不写生产代码
★ 违反 = 删除代码，重新开始
★ 循环：RED → GREEN → REFACTOR
```

**RED - 写失败测试：**
```typescript
test('retries failed operations 3 times', async () => {
  let attempts = 0;
  const operation = () => {
    attempts++;
    if (attempts < 3) throw new Error('fail');
    return 'success';
  };
  const result = await retryOperation(operation);
  expect(result).toBe('success');
  expect(attempts).toBe(3);
});
```

**GREEN - 最小代码：**
```typescript
async function retryOperation<T>(fn: () => Promise<T>): Promise<T> {
  for (let i = 0; i < 3; i++) {
    try {
      return await fn();
    } catch (e) {
      if (i === 2) throw e;
    }
  }
  throw new Error('unreachable');
}
```

---

### 6. systematic-debugging — 不找到根因不修复

```
★ 4 阶段：Root Cause → Pattern → Hypothesis → Implementation
★ 铁律：在完成第 1 阶段前，不能提出任何修复方案
★ 3+ 次修复失败 = 架构问题，停止并质疑基础
```

**Phase 1: Root Cause Investigation**
- 仔细阅读错误信息
- 稳定复现问题
- 检查最近变更
- 多组件系统：添加诊断日志

**Phase 2: Pattern Analysis**
- 找类似工作的例子
- 对比参考实现
- 找出差异
- 理解依赖

**Phase 3: Hypothesis and Testing**
- 形成单一假设
- 最小化测试
- 验证后再继续

**Phase 4: Implementation**
- 创建失败测试用例
- 实施单一修复
- 验证修复

---

### 7. verification-before-completion — 证据优先

```
★ 铁律：没有运行验证命令，不能声称通过
★ 流程：识别验证命令 → 运行 → 读取输出 → 确认 → 声称
```

| 声称 | 需要 | 不充分 |
|------|------|--------|
| Tests pass | 测试命令输出：0 failures | 上次运行、"应该通过" |
| Linter clean | Linter 输出：0 errors | 部分检查、外推 |
| Build succeeds | Build 命令：exit 0 | Linter 通过、日志看起来好 |
| Bug fixed | 测试原始症状：通过 | 代码改了、假设修复 |

---

### 8. dispatching-parallel-agents — 并行加速

```
★ 核心原则：一个子代理处理一个独立问题域
★ 触发条件：2+ 独立任务，无共享状态
★ 禁止：同一文件/相关问题使用并行
```

**适用场景：**
- 3+ 测试文件失败，不同根因
- 多个子系统独立损坏
- 每个问题可独立理解

**每个代理获得：**
- 具体范围：一个测试文件或子系统
- 明确目标：让这些测试通过
- 约束：不改其他代码
- 期望输出：发现和修复的总结

---

### 9. requesting-code-review — 代码审查

**触发时机：**
- 强制：每个任务后、重大功能完成后、合并前
- 可选：卡住时、重构前、修复复杂 bug 后

**流程：**
1. 获取 git SHA
2. 分发 code-reviewer 子代理
3. 按严重程度处理：
   - Critical：立即修复
   - Important：继续前修复
   - Minor：后续处理

---

### 10. receiving-code-review — 审查反馈处理

```
★ 核心原则：技术评估，不盲目接受
★ 禁止：表演性同意（"太对了！"、"好观点！"）
★ 推荐：陈述技术需求或合理反驳
```

**收到反馈时：**
1. 完整阅读，不反应
2. 理解用自己的话重述（如需要问）
3. 对 codebase 现实验证
4. 评估：这个 codebase 技术上合理吗？
5. 回应：技术确认或合理反驳
6. 实施：一次一个，测试每个

---

### 11. finishing-a-development-branch — 收尾工作

```
★ 流程：验证测试 → 呈现 4 选项 → 执行选择 → 清理
★ 选项 1: 本地合并
★ 选项 2: 推送并创建 PR
★ 选项 3: 保持原样
★ 选项 4: 丢弃（需确认）
```

**丢弃必须确认：**
```
这将永久删除：
- 分支 <name>
- 所有提交：<commit-list>
- Worktree 在 <path>

输入 'discard' 确认。
```

---

### 12. writing-skills — 创建新技能

```
★ TDD 方式：先测试再写文档
★ RED：运行压力场景 WITHOUT skill，记录基线行为
★ GREEN：写 skill 解决那些具体问题
★ REFACTOR：关闭漏洞，测试直到无懈可击
```

**目录结构：**
```
skills/
  skill-name/
    SKILL.md              # 主引用（必需）
    supporting-file.*     # 仅在需要时
```

**Frontmatter 要求：**
- 必需字段：`name`、`description`
- `description` 以 "Use when..." 开头
- 描述触发条件，不是工作流总结

---

## 完整开发流程示例

```
用户：我想添加用户认证功能

1. brainstorming 激活
   → 探索上下文
   → 问：我需要了解你的具体需求...
   → 呈现设计方案（分节，用户批准）
   → 保存到 docs/superpowers/specs/2026-05-05-auth-design.md

2. writing-plans 激活
   → 分析设计，分解任务
   → 输出：docs/superpowers/plans/2026-05-05-auth-implementation.md

3. using-git-worktrees 激活
   → 创建隔离工作空间 .worktrees/auth
   → 运行 npm install
   → 验证基线测试通过

4. subagent-driven-development 激活
   → 提取所有任务，创建 TodoWrite
   → Task 1: 实现认证模块
      - dispatch implementer
      - spec reviewer 审查
      - code quality reviewer 审查
   → Task 2: 实现会话管理
      ...
   → 所有任务完成

5. finishing-a-development-branch 激活
   → 验证测试
   → 呈现 4 选项（Merge/PR/Keep/Discard）
   → 用户选择 → 执行 → 清理工作空间
```

---

## 技能调用优先级

```
1. brainstorming（如需创意工作）
2. systematic-debugging（如遇 bug）
3. 其他技能（按需）
```

**当任何技能适用时 → 必须调用 Skill 工具加载**

---

## 资源链接

- 官方文档：https://github.com/obra/superpowers
- 插件市场：https://claude.com/plugins/superpowers
- Discord 社区：https://discord.gg/35wsABTejz
