---
name: sources/claude-error-reference-full
description: 错误参考完整官方文档 — Claude Code 错误代码和解决方案
type: source
tags: [source, claude, errors, reference, troubleshooting, debug]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/错误参考.md
---

# 错误参考

## 认证错误

### `ANTHROPIC_API_KEY_NOT_SET`
API 密钥未设置。

```shellscript
export ANTHROPIC_API_KEY="sk-ant-..."
```

### `INVALID_API_KEY`
API 密钥无效或已过期。

检查 API 密钥是否正确，或在 Anthropic 控制台生成新密钥。

### `API_KEY_EXPIRED`
API 密钥已过期。

续订或生成新的 API 密钥。

## 连接错误

### `CONNECTION_TIMEOUT`
连接超时。

检查网络连接和代理设置。

### `CONNECTION_REFUSED`
连接被拒绝。

确保 Claude Code 服务正在运行。

### `NETWORK_ERROR`
网络错误。

检查防火墙和代理设置。

## 上下文错误

### `CONTEXT_LENGTH_EXCEEDED`
超出上下文长度限制。

减少对话历史或开始新对话。

### `TOO_MANY_MESSAGES`
消息数超限。

开始新对话以重置计数器。

## 工具错误

### `TOOL_NOT_FOUND`
工具不存在。

检查工具名称是否正确。

### `TOOL_PERMISSION_DENIED`
工具权限被拒绝。

检查 permissions 配置。

### `TOOL_EXECUTION_FAILED`
工具执行失败。

检查工具参数和依赖项。

## 文件系统错误

### `FILE_NOT_FOUND`
文件不存在。

检查文件路径是否正确。

### `PERMISSION_DENIED`
文件权限被拒绝。

检查文件权限设置。

### `FILE_TOO_LARGE`
文件过大。

减小文件大小或使用压缩。

## MCP 错误

### `MCP_SERVER_NOT_FOUND`
MCP 服务器未找到。

检查 `.mcp.json` 配置。

### `MCP_SERVER_FAILED`
MCP 服务器启动失败。

检查服务器命令和参数。

### `MCP_TOOL_NOT_FOUND`
MCP 工具未找到。

检查 MCP 服务器是否正常启动。

## 速率限制

### `RATE_LIMIT_EXCEEDED`
超出速率限制。

等待后重试或联系 Anthropic 增加限额。

### `QUOTA_EXCEEDED`
配额超限。

检查订阅计划限制。

## 相关资源

- [故障排除](https://code.claude.com/docs/zh-CN/troubleshooting)
- [调试配置](https://code.claude.com/docs/zh-CN/debug-your-config)
