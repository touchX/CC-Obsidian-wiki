---
name: implementation/plugin-marketplace
description: Plugin Marketplace 创建和分发指南
type: implementation
tags: [plugins, marketplace, distribution, deployment]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/创建和分发 plugin marketplace.md
---

# Plugin Marketplace

Plugin marketplace 是一个目录，让你能够将 plugins 分发给他人。Marketplace 提供集中式发现、版本跟踪、自动更新以及对多种源类型的支持。

## 创建流程

1. **创建 plugins** — 使用 skills、agents、hooks、MCP servers 或 LSP servers
2. **创建 marketplace 文件** — 定义 `marketplace.json`
3. **托管 marketplace** — 推送到 GitHub/GitLab
4. **与用户共享** — 使用 `/plugin marketplace add`

## Marketplace 文件结构

在存储库根目录创建 `.claude-plugin/marketplace.json`：

```json
{
  "name": "company-tools",
  "owner": {
    "name": "DevTools Team",
    "email": "devtools@example.com"
  },
  "plugins": [
    {
      "name": "code-formatter",
      "source": "./plugins/formatter",
      "description": "Automatic code formatting",
      "version": "2.1.0"
    }
  ]
}
```

## 必需字段

| 字段 | 类型 | 描述 |
| --- | --- | --- |
| `name` | string | Marketplace 标识符 (kebab-case) |
| `owner` | object | 维护者信息 |
| `plugins` | array | 可用 plugins 列表 |

## Plugin Source 类型

| 类型 | 示例 |
| --- | --- |
| 本地路径 | `"./plugins/formatter"` |
| GitHub | `{ "source": "github", "repo": "company/plugin" }` |

## 托管和分发

推送 marketplace 到 git 主机，用户通过以下方式添加：

```text
/plugin marketplace add https://github.com/company/marketplace
/plugin install