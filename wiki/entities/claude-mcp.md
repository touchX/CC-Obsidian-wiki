---
name: entities/claude-mcp
description: MCP 服务器配置与推荐 — Context7、Playwright、Chrome 集成
type: entity
tags: [mcp, plugins, tools, integration]
created: 2026-04-26
source: ../../archive/best-practice/claude-mcp.md
---

# Claude MCP

MCP (Model Context Protocol) 服务器扩展 Claude Code 连接外部工具、数据库和 API。按功能分为：Research → Debug → Document。

## 推荐服务器

| 服务器 | 用途 | 资源 |
|--------|------|------|
| Context7 | 获取最新库文档 | Reddit 热门 |
| Playwright | 浏览器自动化 | 前端必备 |
| Chrome DevTools | 实时调试 | DOM 监控 |
| DeepWiki | GitHub 仓库文档 | 架构分析 |
| Excalidraw | 架构图生成 | 流程图绘制 |

## 配置示例

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"]
    }
  }
}
```

## 作用域

| 级别 | 位置 | 用途 |
|------|------|------|
| Project | `.mcp.json` | 团队共享 |
| User | `~/.claude.json` | 个人配置 |
| Subagent | frontmatter | 隔离环境 |

## 相关页面

- [[entities/claude-cli]] — CLI 工具
- [[guides/power-ups]] — 功能教程