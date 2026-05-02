---
name: sources/claude-mcp-full
description: MCP 集成完整官方文档 — 将 Claude Code 连接到外部工具和服务
type: source
tags: [source, claude, mcp, integration, tools, servers]
created: 2026-04-27
updated: 2026-04-27
source: ../../../../archive/cc-doc/通过 MCP 将 Claude Code 连接到工具.md
---

# 通过 MCP 将 Claude Code 连接到工具

Model Context Protocol (MCP) 允许 Claude Code 连接外部工具和服务。MCP 服务器提供工具，Claude Code 可以像使用内置工具一样调用它们。

## 配置 MCP 服务器

在 `.mcp.json` 文件中配置 MCP 服务器：

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/dir"]
    }
  }
}
```

## MCP 服务器配置

| 字段 | 说明 |
| --- | --- |
| `command` | 服务器命令 |
| `args` | 命令参数 |
| `env` | 环境变量 |
| `scope` | `user` 或 `project` |

## 使用 MCP 工具

配置后，使用 `/mcp` 查看可用工具：

```shellscript
/mcp
```

## 常用 MCP 服务器

- **文件系统**: 读写本地文件
- **Git**: Git 操作
- **数据库**: 数据库查询
- **API**: 外部 API 集成

## 调试 MCP

```shellscript
# 查看 MCP 状态
/mcp

# 重新连接
/mcp reconnect

# 调试模式
claude --debug mcp
```

## 三级作用域

| 级别 | 配置文件 | 作用域 | 用途 |
|------|----------|--------|------|
| Project | `.mcp.json` | 仅当前项目 | 团队共享 |
| User | `~/.claude.json` | 所有项目 | 个人配置 |
| Subagent | frontmatter `mcpServers` | 特定 Agent | 隔离环境 |

**优先级**: Subagent > Project > User (累加,非覆盖)

## Token 消耗

| 部分 | 是否占 Context |
|------|----------------|
| MCP 工具定义 | ❌ 不占 |
| MCP 调用结果 | ✅ 占 (类似 API 返回) |
| 工具描述 | ⚠️ 极小 |

### Context 消耗排名
1. 对话消息 (最大)
2. CLAUDE.md
3. Skills (5000 tokens 上限)
4. MCP 结果
5. 工具描述

## 无法禁用用户级 MCP

MCP 是累加的，无法在项目级禁用用户级已配置的 MCP。

**间接方法**:
1. Subagent 中指定 `mcpServers` 过滤
2. allowedTools 限制 `mcp__*` 工具
3. Hook 拦截

## 推荐 MCP 服务器

| 服务器 | 用途 |
|--------|------|
| context7 | 获取最新文档 |
| Playwright | 浏览器自动化 |
| Chrome DevTools | 实时调试 |
| DeepWiki | GitHub 仓库分析 |
| Excel | Excel 操作 |

## 相关资源

- [MCP 官方文档](https://modelcontextprotocol.io)
- [故障排除](https://code.claude.com/docs/zh-CN/troubleshooting)
