---
name: guides/process-compliance
description: 项目流程遵守规范 - 违规教训与预防机制
type: guide
tags:
  - process
  - compliance
  - workflow
created: 2026-05-04
updated: 2026-05-04
source: ../../archive/notes/2026-05-04-process-compliance-reflection.md
aliases:
  - process-compliance
  - 流程遵守规范
---
# 项目流程遵守规范

> **创建日期**: 2026-05-04
> **目的**: 记录项目流程违规教训，建立预防机制，确保每次操作严格遵守项目规则

---

## 一、违规清单

### 违规 1：使用 Write 工具创建 Wiki 页面

| 维度 | 内容 |
|------|------|
| **违反规则** | CLAUDE.md + docs-ingest SKILL.md |
| **要求** | ALL wiki 操作必须使用 obsidian create |
| **实际行为** | 使用 Write 工具直接写入 wiki/tutorials/a2a-protocol-guide.md |
| **根因** | 习惯性使用熟悉工具(Write)，未先读取技能文件确认工具链 |

### 违规 2：手写 YAML Frontmatter

| 维度 | 内容 |
|------|------|
| **违反规则** | docs-ingest SKILL.md |
| **要求** | 使用 obsidian property:set |
| **实际行为** | 在 Write 的内容中手写 frontmatter |
| **根因** | 不知道 CLI 有 property:set 命令，未完整阅读技能文件 |

### 违规 3：跳过教学准确性强制检查清单

| 维度 | 内容 |
|------|------|
| **违反规则** | teaching-accuracy.md 红灯检查项 |
| **要求** | 每次提供教学/技术内容前必须运行强制检查清单 |
| **实际行为** | 直接创建教程页面，未执行任何检查 |
| **根因** | 未将 teaching-accuracy.md 内化为工作流程的一部分 |

### 违规 4：未执行三重验证

| 维度 | 内容 |
|------|------|
| **违反规则** | verification-protocol.md |
| **要求** | Wiki 验证 → 实际示例验证 → 官方文档验证 |
| **实际行为** | 凭记忆总结 A2A 协议内容，未验证准确性和完整性 |
| **根因** | 过度自信 — 认为已看过的视频内容不需要验证 |

### 违规 5：使用 Grep/Glob 替代 obsidian search

| 维度 | 内容 |
|------|------|
| **违反规则** | CLAUDE.md Wiki 操作规范 |
| **要求** | 优先使用 obsidian-cli 及相关 skills |
| **实际行为** | 使用 Glob 和 Grep 搜索已有页面 |
| **根因** | Grep/Glob 更熟悉，未尝试使用 obsidian search |

### 违规 6：未运行 wiki-lint

| 维度 | 内容 |
|------|------|
| **违反规则** | CLAUDE.md 维护清单 |
| **要求** | 每次新页面创建后运行 wiki-lint.sh |
| **实际行为** | 创建页面后直接结束 |
| **根因** | 忘记维护清单的存在 |

---

## 二、根因分析

### 根本问题 1：工具习惯定势

遇到 Wiki 操作时自动选择 Write/Edit/Grep/Glob 而非 obsidian-cli。

### 根本问题 2：技能文件未加载

涉及 Wiki 操作时，未先调用 docs-ingest/wiki-query/wiki-capture 技能获取正确流程。

### 根本问题 3：多层验证未内化

teaching-accuracy.md + verification-protocol.md + real-time-monitor.md 形成递进安全网，但一层都没有触发。

### 根本问题 4：缺少执行前 Pause

所有违规的共同特征是：在行动前没有 pause 思考"这个操作是否符合项目规则"。

---

## 三、预防机制

### 3.1 通用预检流程

每次任务前：
1. **类型判断** — Wiki 操作/技术教学/问答？
2. **技能检查** — 有对应 skill 吗？调用 Skill 工具加载
3. **规则检查** — CLAUDE.md 有相关规则吗？
4. **开始执行**

### 3.2 Wiki 操作专项清单

- [ ] 调用 docs-ingest 或 wiki-query skill
- [ ] 使用 obsidian search 去重(非 Grep/Glob)
- [ ] 使用 obsidian create 创建(非 Write)
- [ ] 使用 obsidian property:set 设属性(非手写 YAML)
- [ ] 配置正确的 source 路径
- [ ] 更新 wiki/log.md
- [ ] 运行 wiki-lint.sh 验证
- [ ] 使用 wiki-capture 记录经验

### 3.3 技术教学专项清单

- [ ] teaching-accuracy 红灯检查全部通过
- [ ] 三重验证执行：Wiki → 实际文件 → 官方文档
- [ ] 置信度标注(事实层/洞察层/推测层)
- [ ] 来源引用：标注 [[page-slug]] 或文件路径

### 3.4 任务完成清单

- [ ] wiki-capture 检查：是否值得捕获到 raw/notes/？
- [ ] error-tracking 检查：是否有错误需要记录？

---

## 四、命令速查

取代传统工具：

| 目标 | 旧方式(禁用) | 新方式(强制) |
|------|-------------|-------------|
| 搜索去重 | Grep/Glob | obsidian search |
| 创建页面 | Write | obsidian create |
| 设置属性 | 手写 YAML | obsidian property:set |
| 追加内容 | Edit/Write | obsidian append |
| 读取页面 | Read | obsidian read |

---

## 五、相关页面

- CLAUDE.md — 项目全局规则
- wiki/WIKI.md — Wiki Schema 规范
- .claude/rules/teaching-accuracy.md — 教学准确性检查清单
- .claude/rules/verification-protocol.md — 三重验证协议
- .claude/rules/error-tracking.md — 错误追踪系统
- .claude/rules/real-time-monitor.md — 实时监控清单
- .claude/skills/docs-ingest/SKILL.md — 文档摄取流程
- .claude/skills/wiki-capture/SKILL.md — 会话知识捕获
- [[tutorials/a2a-protocol-guide]] — 触发本次反思的原始页面
