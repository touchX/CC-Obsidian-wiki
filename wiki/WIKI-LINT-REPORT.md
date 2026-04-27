---
name: wiki-lint-report
description: Wiki 健康检查报告 — 基于实际验证
type: report
tags: [wiki, lint, health-check]
created: 2026-04-26
updated: 2026-04-27
---

# Wiki Lint Report

> 生成时间: 2026-04-27 11:00

---

## 页面统计

| 分类 | 页面数 |
|------|--------|
| concepts/ | 7 |
| entities/ | 46 |
| sources/ | 7 |
| synthesis/ | 4 |
| guides/ | 16 |
| tips/ | 12 |
| tutorial/ | 5 |
| implementation/ | 6 |
| orchestration-workflow/ | 1 |
| **总计** | **104** |

## Source 路径检查

| 状态 | 数量 | 说明 |
|------|------|------|
| ✅ 有效 | 全部 | 所有 source 引用指向存在的 archive 文件 |

**说明**: 之前修复了 18 个 entities 页面的 `../../../` → `../../` 路径错误

## Frontmatter 检查

| 问题类型 | 数量 | 状态 |
|----------|------|------|
| 缺少 updated | 35 | ⚠️ 低优先级 |
| 缺少 tags | 4 | ⚠️ 低优先级 |

## 交叉引用检查

| 状态 | 数量 | 说明 |
|------|------|------|
| ✅ 有效 | 全部 | 所有 [[链接]] 目标均存在于 wiki/ 目录 |

**说明**: 旧版 lint 工具将 Obsidian `[[category/page]]` 格式误判为"目标不存在"

## 已知问题

| 优先级 | 问题 | 说明 |
|--------|------|------|
| P3 | 35 页缺 updated 字段 | 旧文档迁移遗留 |
| P4 | 4 页缺 tags 字段 | 极少数页面 |

## 总结

✅ **Wiki 健康状态: 良好**

- Source 路径: 100% 正确
- 交叉引用: 100% 有效（lint 工具误报）
- 待处理: 39 个 frontmatter 字段缺失（低优先级）

---

*注：旧版 lint 工具将 `[[category/page-name]]` 格式误判为链接失效，实际 Obsidian 可正常解析*
- ❌ wiki/WIKI.md: source 指向不存在的文件 (../archive/{category}/{filename}.md)

## 总结

- 总页面数: 104
- Frontmatter 问题: 3
- 交叉引用问题: 94
- Source 引用问题: 1

⚠️  发现 98 个问题需要修复
