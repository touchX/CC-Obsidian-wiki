---
name: sources/claude-mcp-full
description: MCP 集成完整官方文档 — 将 Claude Code 连接到外部工具和服务
type: source
tags: [source, claude, mcp, integration, tools, servers]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/通过 MCP 将 Claude Code 连接到工具.md
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

## 相关资源

- [MCP 官方文档](https://modelcontextprotocol.io)
- [故障排除](https://code.claude.com/docs/zh-CN/troubleshooting)
