---
name: sources/claude-channels-full
description: Channels 完整官方文档 — 将事件推送到运行中的 Claude Code 会话
type: source
tags: [source, claude, channels, events, streaming, realtime]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/使用 channels 将事件推送到运行中的会话.md
---

# 使用 channels 将事件推送到运行中的会话

Channels 允许您通过 HTTP 将事件直接发送到运行中的 Claude Code 会话。当会话正在运行时，Claude Code 会启动一个本地 HTTP 服务器，监听来自工具调用或用户操作的事件。您可以使用这个服务器向活动会话发送事件，例如在长时间运行的任务完成时收到通知。

## Channels 服务器

当 Claude Code 启动时，它会创建一个 channels 服务器，监听 `http://localhost:<port>/channels` 。端口号在会话开始时显示。您可以使用 `claude --verbose` 找到当前会话的端口，或使用 `--channel-port` 指定端口。

```shellscript
claude --verbose | grep "Channel server"
claude --channel-port 3100
```

## 发送事件

使用 curl 或任何 HTTP 客户端向 channels 服务器发送事件：

```shellscript
curl -X POST http://localhost:3100/channels \
  -H "Content-Type: application/json" \
  -d '{"type": "notification", "message": "Build complete"}'
```

## 事件类型

| 事件类型 | 说明 |
| --- | --- |
| `notification` | 向会话发送通知消息 |
| `user_message` | 向会话添加用户消息 |
| `tool_result` | 提供工具调用的结果 |
| `cancel` | 取消正在运行的操作 |

## 使用场景

- 外部构建完成后通知 Claude Code
- 在长时间运行的测试完成后获取结果
- 从其他工具或服务集成事件
