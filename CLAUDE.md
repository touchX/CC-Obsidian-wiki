# CLAUDE.md — Claude Code Best Practice Project

## 项目上下文

这是一个 Claude Code 最佳实践项目，结合了：
- **Obsidian Vault** — Wiki 知识管理系统（58+ 页面）
- **Claude CLI** — AI 辅助开发工具
- **Wiki 工作流** — Ingest/Query/Lint 三层架构

## Wiki 操作规范

### 三层架构
```
raw/ → [ingest] → wiki/ + archive/
```

### 操作流程
| 流程 | 命令 | 说明 |
|------|------|------|
| **Ingest** | 读取 raw/ → 创建 wiki/ 页面 → 归档到 archive/ | 添加新知识 |
| **Query** | 读取 wiki/index.md → 相关页面 → 综合回答 | 回答问题 |
| **Lint** | `cd wiki && ../scripts/wiki-lint.sh` | 健康检查 |

### Frontmatter 标准（必须）
```yaml
---
name: page-slug
description: 一句话描述
type: concept | entity | source | synthesis | guide | tutorial | tips
tags: [tag1, tag2]
created: YYYY-MM-DD
updated: YYYY-MM-DD
source: ../../archive/{category}/filename.md
---
```

## 行为规则

### Wiki-First 原则
- **优先查询 Wiki** 而非重新思考 — 先读 `wiki/index.md` 找相关页面
- **遵循 Frontmatter 规范** — 新页面必须包含必需字段
- **使用 Wiki 链接** — 用 `[[page-slug]]` 而非完整路径
- **偏好语言** — 创建文档时，优先使用 **中文**
- **文档查询、修改、创建** — 优先使用 **Obsidian-cli** 及相关 **skills** 来查询或操作文档

### 路径计算规则
```
wiki/{category}/xxx.md       → source: ../../archive/{category}/xxx.md
wiki/{category}/{sub}/xxx.md → source: ../../../archive/{category}/xxx.md
```

### Source 验证
添加 source 字段后，验证指向存在的文件：
```bash
grep "^source:" wiki/**/*.md | while read f; do
  file=$(echo $f | sed 's|.*source: ||')
  [ -f "$file" ] || echo "Missing: $file"
done
```

## WIKI偏好语言
## 相关文件

| 文件 | 说明 |
|------|------|
| `wiki/WIKI.md` | Wiki Schema 规范（完整参考） |
| `wiki/index.md` | Wiki 自动索引（Dataview） |
| `wiki/log.md` | Wiki 操作日志 |
| `scripts/wiki-lint.sh` | Wiki 健康检查工具 |
| `.claude/rules/markdown-docs.md` | Markdown 文档规范 |

## 维护清单

- [ ] 新页面添加正确 frontmatter
- [ ] 新页面更新 wiki/index.md（Dataview 自动处理）
- [ ] 添加 wiki/log.md 操作记录
- [ ] 定期运行 `scripts/wiki-lint.sh` 检查健康状况
- [ ] Source 引用指向 archive/ 中的实际文件

---

*本项目基于 Karpathy 的 LLM Wiki 方法论构建*
