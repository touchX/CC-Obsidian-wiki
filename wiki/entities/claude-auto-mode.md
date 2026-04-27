---
name: entities/claude-auto-mode
description: 自动模式配置 — 让 Claude 自主操作时设置权限和行为
type: entity
tags: [auto-mode, permissions, automation, autonomous]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/配置自动模式.md
---

# 配置自动模式

自动模式 (Auto Mode) 让 Claude 自主操作，配置权限和行为设置。

## 权限模式

使用 `Shift+Tab` 在权限模式间循环：

| 模式 | 说明 |
| --- | --- |
| `default` | 默认权限（每次询问） |
| `acceptedEdits` | 接受编辑类操作 |
| `plan` | Plan Mode 后执行 |
| `auto` | 自主模式（配置后生效） |
| `bypassPermissions` | 绕过权限检查 |

## 自动模式配置

```json
{
  "auto": {
    "permissions": "acceptEdits",
    "reviewPlan": false,
    "maxEdits": 10,
    "confirmEdits": false
  }
}
```

## 配置选项

| 选项 | 类型 | 说明 |
| --- | --- | --- |
| `permissions` | string | 默认权限模式 |
| `reviewPlan` | boolean | 执行前是否审核计划 |
| `maxEdits` | number | 最大编辑数 |
| `confirmEdits` | boolean | 每次编辑前确认 |

## 使用场景

| 场景 | 推荐配置 |
| --- | --- |
| 快速修复 | `acceptedEdits` |
| 重构项目 | `plan` + `reviewPlan: true` |
| 批量更改 | `auto` + `maxEdits: N` |

## 交叉引用

- [[wiki/entities/claude-permissions]] — 权限系统
- [[wiki/entities/claude-commands]] — 命令参考
- [[concepts/context-management]] — 上下文管理

## 相关页面

- [[guides/commands]] — Commands 实现
- [[implementation/commands-implementation]] — 详细实现
