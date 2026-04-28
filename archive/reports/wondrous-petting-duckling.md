# Wiki-lint Skill 重构计划

## Context

**问题**：当前 wiki-lint.sh 散落在 `scripts/` 目录，用户需要知道具体路径才能调用。

**需求**：用户只需调用 `/wiki-lint`，AI 自动执行健康检查，用户无需关心脚本位置。

**方案**：重构 SKILL.md，使其成为用户与脚本之间的唯一接口。

---

## 设计原则

| 层级 | 职责 | 用户感知 |
|------|------|----------|
| **Skill (SKILL.md)** | 描述工作流、命令、输出格式 | `/wiki-lint` |
| **脚本 (wiki-lint.sh)** | 具体检查逻辑、报告生成 | 不可见 |

---

## 实现步骤

### 1. 更新 SKILL.md — 增强工作流描述

文件：`.claude/skills/wiki-lint/SKILL.md`

**新增内容**：
- 明确触发时机（用户调用 `/wiki-lint`）
- 简化的执行命令（用户只需知道调用方式）
- 输出格式说明

```markdown
## How to Execute

当用户调用 `/wiki-lint` 或说"运行 wiki lint"时：

1. 执行健康检查脚本
2. 读取报告文件
3. 向用户展示结果

```bash
cd wiki && ../.claude/skills/wiki-lint/wiki-lint.sh
```

## Output

报告生成到 `wiki/WIKI-LINT-REPORT.md`，包含：
- 页面统计
- Frontmatter 问题
- 交叉引用问题
- Source 路径问题
```

### 2. 更新所有文档中的引用

将所有直接调用 `scripts/wiki-lint.sh` 改为：
- **推荐**：`/wiki-lint` skill
- **备选**：`.claude/skills/wiki-lint/wiki-lint.sh`

**需更新的文件**：
- [x] `CLAUDE.md` — ✅ 已更新
- [x] `README.md` — ✅ 已更新
- [x] `wiki/WIKI.md` — ✅ 已更新
- [ ] `wiki/log.md` — 历史记录可保留原样
- [x] `.claude/skills/github-collect/SKILL.md` — ✅ 已更新
- [ ] `docs/superpowers/obsidian-wiki/` — TEMPLATE 目录（模板文档）

### 3. 删除空的 scripts/ 目录（如存在）

检查 `scripts/` 是否还有其他文件，若为空则可删除。

---

## 验证

1. 运行 `/wiki-lint` skill
2. 确认报告生成到 `wiki/WIKI-LINT-REPORT.md`
3. 检查报告中无错误路径

---

## 关键文件

| 文件 | 操作 |
|------|------|
| `.claude/skills/wiki-lint/SKILL.md` | 更新执行说明 |
| `.claude/skills/wiki-lint/wiki-lint.sh` | 已移动（无需修改） |
| `CLAUDE.md`, `README.md`, `wiki/WIKI.md` | 已更新路径引用 |
| `docs/superpowers/obsidian-wiki/TEMPLATE/` | 更新模板文档 |

---

## 状态

- [x] 脚本已移动到 skill 目录
- [ ] 更新 SKILL.md 增加执行流程
- [ ] 更新其他文档引用
- [ ] 验证执行
