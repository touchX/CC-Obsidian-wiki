---
name: entities/claude-mcp
description: MCP 服务器配置与推荐 — Context7、Playwright、Chrome 集成
type: entity
tags: [mcp, plugins, tools, integration]
created: 2026-04-26
updated: 2026-04-27
source: ../../archive/best-practice/claude-mcp.md
---

# Claude MCP

MCP (Model Context Protocol) 服务器扩展 Claude Code 连接外部工具、数据库和 API。按功能分为：Research → Debug → Document。

## 推荐服务器

| 服务器             | 用途          | 资源        |
| --------------- | ----------- | --------- |
| Context7        | 获取最新库文档     | Reddit 热门 |
| Playwright      | 浏览器自动化      | 前端必备      |
| Chrome DevTools | 实时调试        | DOM 监控    |
| DeepWiki        | GitHub 仓库文档 | 架构分析      |
| Excalidraw      | 架构图生成       | 流程图绘制     |

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
| Subagent | frontmatter `mcpServers` | 隔离环境 |

**优先级**: Subagent > Project > User (累加,非覆盖)

## Token 消耗分析

### 占 Context 的部分

| 内容 | 是否占 Context | 说明 |
|------|---------------|------|
| MCP 工具定义 | ❌ 不占 | 工具定义不消耗 |
| MCP 调用结果 | ✅ 占 | 类似 API 返回 |
| 工具描述 | ⚠️ 极小 | 可忽略不计 |

### Context 消耗排名

1. **对话消息** (最大)
2. **CLAUDE.md** 文件
3. **Skills** (5000 tokens 上限)
4. **MCP 结果**
5. 工具描述

## 无法禁用用户级 MCP

**结论**: MCP 是累加的,无法在项目级禁用用户级已配置的 MCP。

**间接方法**:

1. **Subagent 过滤** — 在 Subagent 中指定 `mcpServers` 只启用需要的
2. **allowedTools 限制** — 在配置中限制 `mcp__*` 工具
3. **Hook 拦截** — 通过 PreToolUse hook 拦截

## 相关页面

- [[claude-cli]] — CLI 工具
- [[claude-subagents]] — Subagent 与 MCP 隔离
- [[power-ups]] — 功能教程
- [[global-vs-project-settings]] — 全局 vs 项目级配置