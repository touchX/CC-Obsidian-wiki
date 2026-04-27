---
name: sources/claude-plugins-full
description: 插件开发完整官方文档 — 创建 Claude Code 插件扩展功能
type: source
tags: [source, claude, plugins, extension, development, marketplace]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/创建插件.md
---

# 创建插件

插件扩展了 Claude Code 的功能。插件是一个包含 `SKILL.md` 和其他资源的目录结构。

## 插件结构

```
my-plugin/
├── SKILL.md          # 插件定义和元数据
├── scripts/          # 可选脚本
├── templates/        # 可选模板
└── assets/           # 可选资源
```

## SKILL.md 结构

```markdown
---
name: my-plugin
description: 插件描述
author: your-name
version: 1.0.0
---

# 插件功能

这里描述插件提供的功能...
```

## 插件市场

发布插件到 [Plugin Marketplace](https://claude.com/plugins) 与社区分享。

## 相关资源

- [通过市场发现和安装预构建插件](https://code.claude.com/docs/zh-CN/plugin-marketplace)
- [Plugin SDK 参考](https://platform.claude.com/docs/zh-CN/plugins)
