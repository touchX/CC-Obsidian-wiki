# 自我纠错机制 — Pre-Flight 检查站

> **执行等级**：🔴 强制 — 每次任务开始前必须执行
> **触发条件**：每次收到用户指令后，在任何工具调用之前
> **目标**：杜绝 6 类已知流程违规的重复发生

---

## 一、通用预检（每次任务前，必做）

### 1.0 启动检查（2 秒）

```
[ ] 我读过 .claude/rules/self-correction.md 了吗？
    └─ 如果有任何不确定 → 重新读取此文件
```

### 1.1 类型判断（3 秒）

判断本次任务类型：

```
[ ] Wiki 操作（创建/修改/搜索 Wiki 页面）
[ ] 技术教学（回答技术问题/写教程/代码示例）
[ ] 代码修改（功能开发/Bug 修复/重构）
[ ] 问答（纯信息咨询，无文件操作）
[ ] 配置调整（CLAUDE.md/settings/hooks）
```

### 1.2 技能检查（5 秒）

检查是否有对应 skill，有则**必须先调用 Skill 工具加载**：

```
[ ] docs-ingest  — Wiki 文档摄取（Wiki 操作必用）
[ ] wiki-query   — Wiki 内容查询（Wiki 搜索必用）
[ ] wiki-capture — 会话知识捕获（任务结束后评估）
[ ] wiki-lint    — Wiki 健康检查（创建页面后）
[ ] teaching-accuracy 相关 skill（技术教学时）
```

### 1.3 规则检查（5 秒）

```
[ ] CLAUDE.md 中有相关规则吗？
[ ] .claude/rules/ 中有相关规则文件吗？
[ ] process-compliance.md（本文件前置）读过吗？
```

### 1.4 开始执行

所有检查通过 → 可以开始任务。

---

## 二、6 类违规速查表

当以下工具被使用前，**必须 pause 核查**是否符合规则：

| # | 违规行为 | 正确做法 | 触发 pause 条件 |
|---|---------|---------|----------------|
| 1 | Write 写入 `wiki/` | `obsidian create` 创建页面 | 发现 Write 的 file_path 含 `wiki/` |
| 2 | 手写 YAML frontmatter | `obsidian property:set` | 发现 content 含 `---\nname:\n---` |
| 3 | 跳过教学准确性检查 | 运行 teaching-accuracy 清单 | 涉及技术内容教学 |
| 4 | 未执行三重验证 | Wiki → 示例 → 官方文档 | 涉及技术/教学回答 |
| 5 | Grep/Glob 搜索 Wiki 内容 | `obsidian search` | 搜索词含 Wiki 相关关键词 |
| 6 | 创建页面后未运行 wiki-lint | `wiki-lint.sh` | 刚创建/修改了 Wiki 页面 |

**检测到以上任何情况 → 立即停止 → 执行正确流程 → 然后再继续**

---

## 三、违规发生后的自我恢复流程

如果发现自己已经违规（在工具执行中或执行后发现）：

```
┌─ 发现自己违规 ──────────────────────────┐
│                                          │
│  1. 立即停止当前操作                      │
│  2. 评估影响范围                          │
│  3. 执行修正措施（见下表）                │
│  4. 记录错误到 error-tracking.md          │
│  5. 向用户透明说明：犯了什么错、怎么修正的 │
│  6. 继续任务                              │
│                                          │
└──────────────────────────────────────────┘
```

### 各类违规的修正措施

| 违规 | 已发生后的修正 |
|------|--------------|
| 1. Write 写入 wiki/ | 如已创建 → 用 obsidian 验证内容并修复；如未提交 → 删除重建 |
| 2. 手写 YAML | 用 `obsidian property:set` 重新设置属性 |
| 3. 跳过教学检查 | 立即执行 teaching-accuracy 检查，修正内容 |
| 4. 未三重验证 | 立即执行验证，修正内容 |
| 5. Grep/Glob 搜索 | 改用 `obsidian search` 重新搜索 |
| 6. 未 wiki-lint | 立即运行 `wiki-lint.sh` |

---

## 四、Wiki 操作专项流程

### 4.1 Wiki 页面创建流程

```
Task: 需要创建新的 Wiki 页面

Step 1 ─ 调用 skill
  → Skill(docs-ingest) 加载流程

Step 2 ─ 搜索去重
  → obsidian search "关键词"（非 Grep/Glob）

Step 3 ─ 创建页面
  → obsidian create wiki/{category}/page-name.md --content "..."

Step 4 ─ 设置属性
  → obsidian property:set wiki/{category}/page-name.md name value

Step 5 ─ 配置 source
  → obsidian property:set wiki/{category}/page-name.md source "../../archive/.../..."

Step 6 ─ 更新日志
  → obsidian append wiki/log.md "- YYYY-MM-DD: 创建了 [[page-name]]"

Step 7 ─ 运行 lint
  → cd wiki && ../.claude/skills/wiki-lint/wiki-lint.sh

Step 8 ─ 捕获经验（评估后）
  → Skill(wiki-capture) 判断是否需要记录
```

### 4.2 Wiki 搜索流程

```
Task: 搜索 Wiki 内容

  → obsidian search "搜索词"（非 Grep，非 Glob）
  → 读取 wiki/index.md 确认页面存在
  → 读取相关页面
```

### 4.3 命令速查

| 目标 | 禁用工具 | 强制工具 |
|------|---------|---------|
| 搜索去重 | `Grep`, `Glob` | `obsidian search` |
| 创建页面 | `Write` | `obsidian create` |
| 设置属性 | 手写 YAML | `obsidian property:set` |
| 追加内容 | `Edit`, `Write` | `obsidian append` |
| 读取页面 | `Read` | `obsidian read`（也可 Read） |

---

## 五、技术教学专项流程

### 5.1 教学前强制检查

```
[ ] teaching-accuracy.md 红灯检查全部通过？
    ├─ [ ] Wiki-First 验证（读了 Wiki 吗？）
    ├─ [ ] 事实来源验证（有引用来源吗？）
    └─ [ ] 实际示例验证（跟项目文件一致吗？）

[ ] verification-protocol.md 三重验证执行？
    ├─ [ ] 第一重：Wiki 验证
    ├─ [ ] 第二重：实际示例验证
    └─ [ ] 第三重：官方文档验证

[ ] real-time-monitor.md 自检通过？
    └─ [ ] 快速自检 + 来源验证 + 一致性检查

[ ] 置信度标注？
    ├─ 📌 事实层 — 直接引用 Wiki/文件
    ├─ 💡 洞察层 — 用 [!tip] 标注
    └─ 🔮 推测层 — 用 [!warning] 标注
```

---

## 六、违规行为日志

每次发现自己违规后，必须在 `error-tracking.md` 中记录：

```yaml
error_id: ERR-003
date: YYYY-MM-DD
severity: [critical/high/medium/low]
category: process-violation
status: resolved
violation_type: [1-6 对应上表编号]
description: 简短的违规描述
root_cause: 根因分析
fix: 采取的修正措施
```

---

## 七、与现有规则文件的关系

```
self-correction.md（本文件，顶层预检门禁）
  ├─ 类型判断 → Wiki 操作 → 调用 docs-ingest skill
  ├─ 类型判断 → 技术教学 → teaching-accuracy.md
  ├─ 类型判断 → 技术教学 → verification-protocol.md
  ├─ 类型判断 → 技术教学 → real-time-monitor.md
  └─ 违规发生 → 记录到 error-tracking.md
```

- `process-compliance.md`（wiki/guides/） — 违规教训的永久记录
- `self-correction.md`（本文件） — 行为预检的执行机制
- `error-tracking.md` — 错误的记录系统

---

## 八、Memory Hub 自动存储触发条件

> **目的**：将成熟经验自动存储到记忆系统，避免知识流失
> **执行时机**：满足以下任一条件时自动触发

### 自动存储触发场景

| 场景 | 触发条件 | 存储内容 | 优先级 |
|------|---------|---------|--------|
| **完整 Workflow 完成** | brainstorming → planning → execution 全流程 | 流程经验、最佳实践 | P0 |
| **复杂 Bug 解决** | systematic-debugging >30 分钟 | 根因分析、解决方案 | P0 |
| **新技能首次使用** | 首次成功使用 tool/skill | 使用方法、注意事项 | P1 |
| **重要决策** | 架构/技术栈选型决策 | 决策理由、权衡因素 | P1 |
| **流程优化** | 发现并验证更优工作方式 | 优化前后对比 | P2 |

### 存储命令模板

```bash
# Workflow 经验存储
/memory-hub store "完成 [workflow-name] 流程：[关键经验]"

# Bug 解决存储
/memory-hub store "解决 [bug-description]：根因 [root-cause]，方案 [solution]"

# 新技能存储
/memory-hub store "使用 [tool/skill-name]：[用法总结] + [注意事项]"
```

### 评估标准

在任务完成后，快速评估是否需要存储：

```
[ ] 这次经验是否值得复用？
[ ] 下次遇到类似问题时，这个经验能节省时间吗？
[ ] 这个经验是否属于通用知识（非项目特定）？

✅ 任意一个是 → 执行存储
❌ 全部否 → 跳过
```

### 与现有流程集成

```
任务完成
    ↓
快速评估（3秒）
    ↓
值得存储？
    ↓ 是
使用 /memory-hub store
    ↓
继续
    ↓ 否
```

---

*触发方式：每次工具调用前先 pause → 判断类型 → 执行对应检查 → 然后行动*
*最后更新: 2026-05-05*
