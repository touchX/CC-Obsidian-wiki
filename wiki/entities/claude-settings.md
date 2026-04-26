---
name: entities/claude-settings
description: 60+ settings 和 175+ 环境变量完整参考
type: entity
tags:
  - settings
  - configuration
  - environment
created: 2026-04-26
source: ../../archive/best-practice/claude-settings.md
---

# Claude Settings 

Claude Code 配置系统包含 60+ 设置项和 175+ 环境变量，按功能分为 12 个主要类别。

## 主要类别

| 类别 | 数量 | 说明 |
|------|------|------|
| 模型配置 | 8 | 模型选择、温度、token 限制 |
| 上下文设置 | 12 | 窗口大小、压缩策略 |
| MCP 配置 | 15 | 服务器管理、权限控制 |
| Hooks 配置 | 10 | 生命周期钩子 |
| 输出格式 | 8 | 响应格式、日志级别 |
| 路径配置 | 6 | 工作目录、配置文件路径 |

## 核心设置

```json
{
  "model": "sonnet",
  "maxTokens": 8192,
  "temperature": 0.7,
  "enableAllProjectMcpServers": true
}
```

## 相关页面

- [[entities/claude-cli]] — CLI 工具
- [[concepts/claude-memory]] — 内存管理