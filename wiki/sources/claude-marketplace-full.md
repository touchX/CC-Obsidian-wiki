---
name: sources/claude-marketplace-full
description: 插件市场完整官方文档 — 发现和安装预构建 Claude Code 插件
type: source
tags: [source, claude, marketplace, plugins, discovery, installation]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/通过市场发现和安装预构建插件.md
---

# 通过市场发现和安装预构建插件

Claude Code Plugin Marketplace 提供了社区创建的预构建插件。无需从头编写，可以直接安装并使用。

## 访问市场

访问 [claude.com/plugins](https://claude.com/plugins) 浏览可用插件。

## 安装插件

使用 `/plugins` 命令浏览和安装：

```shellscript
# 浏览插件
/plugins browse

# 安装插件
/plugins install <plugin-name>

# 搜索插件
/plugins search <keyword>
```

## 插件管理

```shellscript
# 列出已安装插件
/plugins list

# 更新插件
/plugins update

# 卸载插件
/plugins uninstall <plugin-name>
```

## 插件来源

插件可以从以下来源安装：

- **Marketplace**: 官方市场
- **GitHub**: 直接从 GitHub 安装
- **本地**: 本地开发的插件

## 贡献插件

创建插件后，可以提交到 Marketplace 与社区分享：

1. 创建符合规范的插件
2. 测试插件功能
3. 提交到 Marketplace

## 相关资源

- [创建插件](https://code.claude.com/docs/zh-CN/create-plugin)
- [Plugin SDK](https://platform.claude.com/docs/zh-CN/plugins)
