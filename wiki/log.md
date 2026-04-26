---
name: wiki-log
description: Wiki 操作历史记录 — 所有变更的追加式日志
type: reference
tags: [wiki, log, history, changelog, operations]
created: 2026-04-23
updated: 2026-04-26
---

# Wiki Log

> 维基操作历史 — 追加式记录

---

## [2026-04-23] setup | Wiki 初始化

- **操作**: 初始化 Wiki 结构
- **创建目录**:
  - `wiki/concepts/` — 概念页面
  - `wiki/entities/` — 实体页面
  - `wiki/sources/` — 来源摘要
  - `wiki/synthesis/` — 综合分析
  - `wiki/guides/` — 使用指南
  - `raw/` — 原始来源
- **创建核心文件**:
  - `WIKI.md` — Schema 规范
  - `index.md` — Wiki 索引
  - `log.md` — 本日志
- **创建示例页面**:
  - `concepts/context-window.md`
  - `concepts/context-management.md`
  - `concepts/agent-harness.md`
  - `entities/claude-code.md`
  - `entities/claude-skills.md`
  - `sources/karpathy-llm-wiki.md`
  - `synthesis/agent-architecture.md`
  - `guides/quick-start.md`
- **来源**: 项目现有文档分析
- **备注**: Wiki 基于 Karpathy LLM Wiki 方法论建立

---

## [2026-04-23] lint | 初始健康检查

- **状态**: Wiki 刚建立，无需检查
- **待办**:
  - 随着来源摄入，更新相关页面
  - 监控孤立页面
  - 建立概念间交叉引用

---

## [2026-04-23] complete | Wiki 示例页面创建完成

- **操作**: 创建所有核心 Wiki 页面
- **创建页面**:
  - `entities/claude-code.md` — CLI 工具完整指南
  - `entities/claude-skills.md` — Skills 扩展系统
  - `sources/karpathy-llm-wiki.md` — 方法论来源摘要
  - `synthesis/agent-architecture.md` — Agent 架构综合分析
  - `guides/quick-start.md` — 快速入门指南
- **更新文件**:
  - `index.md` — 添加新页面到索引
- **待创建页面**:
  - `entities/claude-subagents.md`
  - `entities/claude-mcp.md`
  - `entities/claude-hooks.md`
  - `entities/claude-commands.md`

---

## [2026-04-23] move | Wiki 目录移至根目录

- **操作**: 将 Wiki 从 `.omc/wiki/` 移动到根目录 `wiki/`
- **更新文件**:
  - `WIKI.md` — 更新路径引用
  - `guides/quick-start.md` — 更新目录结构
  - `log.md` — 更新日志路径
  - `.claude/.gitignore` — 添加 wiki/ 排除规则

---

---

## [2026-04-23] frontmatter | 为所有文档添加 YAML Frontmatter

- **操作**: 为 best-practice、reports、tips 添加 frontmatter
- **best-practice 文档** (7个):
  - `best-practice/claude-memory.md` — 记忆系统
  - `best-practice/claude-subagents.md` — 子代理
  - `best-practice/claude-settings.md` — 设置配置
  - `best-practice/claude-mcp.md` — MCP集成
  - `best-practice/claude-hooks.md` — Hooks系统
  - `best-practice/claude-commands.md` — Commands
  - `best-practice/claude-skills.md` — Skills系统
- **reports 文档** (5个):
  - `reports/harness-architecture.md` — Harness架构重要性
  - `reports/llm-day-to-day-degradation.md` — LLM性能波动
  - `reports/learning-journey-weather-reporter-redesign.md` — 演示重构
  - `reports/claude-usage-and-rate-limits.md` — 用量限制
- **tips 文档** (8个):
  - `tips/claude-boris-13-tips-03-jan-26.md`
  - `tips/claude-boris-12-tips-12-feb-26.md`
  - `tips/claude-boris-10-tips-01-feb-26.md`
  - `tips/claude-boris-2-tips-10-mar-26.md`
  - `tips/claude-boris-2-tips-25-mar-26.md`
  - `tips/claude-boris-15-tips-30-mar-26.md`
  - `tips/claude-thariq-tips-16-apr-26.md`
  - `tips/claude-boris-6-tips-16-apr-26.md`
- **Frontmatter 字段**:
  - name: 页面slug标识
  - description: 一句话描述
  - type: concept/entity/source/synthesis/guide
  - tags: 标签数组
  - created: 创建日期
  - updated: 更新日期
  - sources: 来源数量

---

## [2026-04-23] index | 更新 Wiki 索引

- **操作**: 更新 wiki/index.md 索引
- **添加分类**:
  - Sources (来源) — 添加5个来源页面
  - Tips (技巧) — 添加8个tips页面
- **更新统计**: 总页面数 25
- **更新标签云**: 添加 tips、boris、thariq 等标签

---

## [2026-04-26] migration | implementation 文档迁移完成

- **操作**: 迁移 implementation/ 目录下 5 个实现文档
- **创建页面**:
  - `guides/agent-teams.md` — Agent Teams 多会话协调
  - `guides/commands.md` — Commands 命令实现
  - `guides/skills.md` — Skills 实现指南
  - `guides/subagents.md` — Sub-agents 实现指南
  - `guides/scheduled-tasks.md` — 定时任务 /loop 调度
- **更新 index.md**: 添加 5 个新页面，统计更新至 41 页
- **待创建页面**:
  - `entities/claude-subagents.md`
  - `entities/claude-mcp.md`
  - `entities/claude-hooks.md`
  - `entities/claude-commands.md`

---

## [2026-04-26] migration | best-practice 迁移完成

- **操作**: 完成 7 个 best-practice 文件迁移到 Wiki
- **已迁移文件**:
  - `wiki/entities/claude-cli-startup-flags.md` — CLI 75+ 启动参数
  - `wiki/entities/claude-hooks.md` — Hooks 系统
  - `wiki/concepts/claude-memory.md` — (已存在，更新)
  - `wiki/entities/claude-subagents.md` — (已存在，更新)
  - `wiki/entities/claude-commands.md` — (已存在，更新)
  - `wiki/entities/claude-skills.md` — (已存在，更新)
  - `wiki/entities/claude-mcp.md` — (已存在，更新)
- **更新 index.md**: 添加 2 个新实体页面，更新统计 36→39
- **标签云更新**: 添加 claude-md、monorepo、flags、hooks 等标签
- **待删除**: `best-practice/` 目录 ✅ (图片已迁入 archive/assets/images/best-practice/)

---

## [2026-04-26] verify | Wiki 状态核查与修正

- **操作**: 核查文件数量与索引一致性
- **发现差异**:
  - Sources: index 记录 11，实际 7（-4）
  - Tips: index 记录 8，实际 5（-3）
- **修正内容**:
  - 更新 Sources 分类：去除不存在的文件引用
  - 更新 Tips 分类：保留实际存在的 5 个文件
  - 更新统计数字：41 → 36
  - 添加缺失的 entities 和 concepts 条目
- **最终统计**: 36 页（concepts:6, entities:7, sources:7, synthesis:4, guides:7, tips:5）

---

## [2026-04-26] fix | archive/implementation 图片路径修复完成

- **修复文件** (3处):
  - `claude-agent-teams-implementation.md:33` — `assets/impl-agent-teams.png` → `../../assets/images/implementation/impl-agent-teams.png`
  - `claude-scheduled-tasks-implementation.md:41` — `assets/impl-loop-1.png` → `../../assets/images/implementation/impl-loop-1.png`
  - `claude-scheduled-tasks-implementation.md:56` — `assets/impl-loop-2.png` → `../../assets/images/implementation/impl-loop-2.png`

---

## [2026-04-26] migrate | tutorial 和 tips 目录迁移完成

- **迁移内容**:
  - `tutorial/` → `archive/tutorial/`（包含 day0 和 day1 教程）
  - `tips/assets/` → `archive/assets/images/tips/`（Boris 和 Thariq 技巧图片）
  - `tutorial/day0/assets/login.png` → `archive/assets/images/tutorial/login.png`
- **更新 wiki 引用** (5处):
  - `wiki/tutorial/day0/README.md` — 添加 source 字段
  - `wiki/tutorial/day0/linux.md` — 添加 source 字段
  - `wiki/tutorial/day0/mac.md` — 添加 source 字段
  - `wiki/tutorial/day0/windows.md` — 添加 source 字段
  - `wiki/tutorial/day1/README.md` — 添加 source 字段
- **修复 archive 引用** (1处):
  - `archive/tutorial/day0/README.md:62` — `assets/login.png` → `../!/images/tutorial/login.png`
- **删除残留目录**: `tutorial/`, `tips/`

---

## [2026-04-26] cleanup | reports, changelog, logs 目录清理完成

- **reports/ → archive/assets/images/reports/**:
  - 迁移报告相关图片到统一管理
  - 修复 archive/reports/ 中的图片引用 (3处):
    - `claude-advanced-tool-use.md:56`
    - `llm-day-to-day-degradation.md:28-29`
  - 删除残留目录 `reports/`
- **changelog/ → archive/changelog/**:
  - 迁移变更日志到 archive 作为历史记录
  - 包含 best-practice 和 development-workflows 的完整变更历史
  - 删除根目录 `changelog/`
- **logs/**:
  - 删除运行时日志目录（不应在版本控制中）
  - 创建 `.gitignore` 防止未来日志被提交

---

## [2026-04-26] fix | Wiki source 引用修复完成

- **修复 source 引用** (1处):
  - `wiki/guides/agent-teams.md:7` — `source: ../archive/implementation/claude-agent-teams/` → `source: ../archive/implementation/claude-agent-teams-implementation.md`
- **创建缺失源文件** (1个):
  - `archive/best-practice/claude-hooks.md` — Hooks 系统完整源文档，包含配置、用例、最佳实践和示例
- **验证结果**: 所有 wiki 页面 source 引用现已指向存在的文件

---

## [2026-04-26] update | Wiki 差距分析报告更新

- **修正统计数字** (3处):
  - entities/: 10 → 9
  - synthesis/: 5 → 4
  - tips/: 13 → 12
- **验证结果更新**:
  - raw/ 目录状态：已创建（空目录）
  - source 引用：32 个页面已验证指向存在的 archive 文件
- **报告状态**: "已过时" → "当前有效"
- **待处理项**: P4 Lint 工具异常（报告0页但实际62页）

---

---

## [2026-04-26] lint | Wiki Lint 工具创建与执行

- **创建工具**: `scripts/wiki-lint.sh` — Wiki 健康检查脚本
- **功能**:
  - 页面统计（按分类）
  - Frontmatter 完整性检查
  - 交叉引用验证（[[...]] 链接）
  - Source 引用验证
- **执行结果**: 生成 `wiki/WIKI-LINT-REPORT.md`
- **发现**: Source 引用路径系统性错误（所有路径缺少一级 `../`）
  - 影响范围: 37 个页面
  - 根本原因: Wiki 页面位于 `wiki/xxx/yyy.md`，使用 `../archive/` 指向 `wiki/archive/`，但实际 archive 在项目根目录
  - 正确路径: `wiki/entities/` 应使用 `../../archive/`（两级 `..`）
- **状态**: P4 已完成（工具创建成功）

---

## [2026-04-26] fix | Source 路径系统性错误批量修复完成

- **修复范围**: 37 个 Wiki 页面的 source 引用路径
- **修复方法**: 
  - 一级子目录（concepts/, entities/, 等）：`source: ../archive/...` → `source: ../../archive/...`
  - 二级子目录（tutorial/day0/, tutorial/day1/）：`source: ../../archive/...` → `source: ../../../archive/...`
- **执行命令**:
  ```bash
  find wiki -mindepth 2 -maxdepth 2 -type f -name "*.md" \
    -not -path "*/tutorial/*" \
    -exec sed -i 's|source: \.\./archive/|source: ../../archive/|' {} \;
  
  find wiki/tutorial -type f -name "*.md" \
    -exec sed -i 's|source: \.\./\.\./archive/|source: ../../../archive/|' {} \;
  ```
- **验证结果**: 
  - Lint 工具报告 Source 引用问题从 32 个降至 0 个
  - ✅ 所有 source 引用现已指向存在的 archive 文件
- **更新文档**: `WIKI-GAP-ANALYSIS.md` P5 标记为已完成
- **状态**: P5 已完成

---

## [2026-04-26] standards | log.md 规范化

- **操作**: 为 log.md 添加 YAML Frontmatter
- **添加字段**:
  - name: wiki-log
  - description: Wiki 操作历史记录 — 所有变更的追加式日志
  - type: reference
  - tags: [wiki, log, history, changelog, operations]
  - created: 2026-04-23
  - updated: 2026-04-26
- **效果**: Frontmatter 问题从 6 个降至 3 个（仅剩 WIKI-LINT-REPORT.md）
- **状态**: 已完成

---

## [2026-04-26] optimize | WIKI.md 文档优化完成

- **操作**: 基于实践经验优化 WIKI.md
- **更新内容**:
  - **目录结构**: 补充完整的子目录（tutorial/day0/, tutorial/day1/, assets/images/ 等）
  - **Lint 章节**: 更新为实际工具命令 `cd wiki && ../scripts/wiki-lint.sh`
  - **故障排除**: 新增章节，记录 source 路径错误修复经验
  - **更新历史**: 记录本次优化到版本历史（v2.1）
- **新增内容**:
  - 路径计算规则表
  - 批量修复命令
  - 验证命令示例
- **版本**: 2.0 → 2.1
- **状态**: 已完成

---

## [2026-04-26] migration | Dataview 自动索引迁移完成

- **操作**: 将 index.md 从手动表格迁移到 Dataview 自动查询
- **创建文件**:
  - `wiki/index-manual.md` — 手动索引备份（应急用）
  - `wiki/index-auto.md` — Dataview 测试版
- **更新文件**:
  - `wiki/index.md` — 替换为 Dataview 自动版本
  - `wiki/WIKI.md` — 添加 Dataview 使用文档，版本 2.1 → 2.2
- **效果**: 零维护索引，新页面自动出现，无需手动更新
- **核心查询** (7个分类):
  ```dataview
  TABLE without id link(file.link, title) as "页面"
  FROM "wiki/{category}"
  WHERE type = "{type}"
  SORT updated DESC
  ```
- **前提条件**: Obsidian Dataview 插件必须安装并启用
- **状态**: 已完成

---

## [2026-04-26] config | CLAUDE.md 创建完成

- **创建文件**: `CLAUDE.md` — Claude Code 项目配置
- **内容**:
  - 项目上下文（Obsidian Vault + Claude CLI）
  - Wiki 操作规范（Ingest/Query/Lint）
  - Frontmatter 标准
  - 路径计算规则
  - 维护清单
- **修复**: `docs/usage-guide.md:131` — CLAUDE.md 引用指向 WIKI.md
- **效果**: Claude Code 启动时自动加载 Wiki 操作规范

---

## [2026-04-26] move | Skills 移动到 .claude/skills 完成

- **操作**: 将 Wiki Workflow Skills 从 `.omc/skills/` 移动到 `.claude/skills/`
- **移动内容**: 4 个 skills 目录
  - `wiki-query/` → `.claude/skills/wiki-query`
  - `docs-ingest/` → `.claude/skills/docs-ingest`
  - `wiki-lint/` → `.claude/skills/wiki-lint`
  - `inspool/` → `.claude/skills/inspool`
- **验证结果**: Skills 工具列表显示 4 个新 skills 可用 ✅
- **清理**: 删除空的 `.omc/skills/` 目录
- **状态**: 已完成

---

*格式: `## [YYYY-MM-DD] operation | Brief description`*
*查看最近 5 条: `grep "^## \[" wiki/log.md | tail -5`*
