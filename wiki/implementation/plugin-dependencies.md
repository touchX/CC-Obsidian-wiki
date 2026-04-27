---
name: implementation/plugin-dependencies
description: Plugin 依赖版本约束管理
type: implementation
tags: [plugins, dependencies, versioning, semver]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/约束插件依赖版本.md
---

# Plugin 依赖版本约束

插件可以声明依赖其他插件，版本约束确保依赖在经过测试的版本范围内。

## 声明依赖

在 `.claude-plugin/plugin.json` 的 `dependencies` 数组中列出：

```json
{
  "name": "deploy-kit",
  "version": "3.1.0",
  "dependencies": [
    "audit-logger",
    { "name": "secrets-vault", "version": "~2.1.0" }
  ]
}
```

## 版本约束字段

| 字段 | 类型 | 描述 |
| --- | --- | --- |
| `name` | string | 插件名称 |
| `version` | string | semver 范围，如 `~2.1.0`、`^2.0` |
| `marketplace` | string | 跨 marketplace 依赖 |

## Semver 范围

支持 Node `semver` 包的所有表达式：

| 范围 | 说明 |
| --- | --- |
| `~2.1.0` | 补丁版本范围 |
| `^2.0` | 次版本范围 |
| `>=1.4` | 最低版本 |
| `=2.1.0` | 精确版本 |

## 跨 Marketplace 依赖

在根 marketplace 的 `marketplace.json` 中添加：

```json
{
  "allowCrossMarketplaceDependenciesOn": ["acme-shared"]
}
```

## 发布版本

使用命名约定标记发布：

```bash
claude plugin tag --push
# 生成: plugin-name--v{version}
```

## 相关页面

- [[implementation/plugin-marketplace]] — Marketplace 创建
- [[implementation/plugins-reference]] — Plugin 参考
