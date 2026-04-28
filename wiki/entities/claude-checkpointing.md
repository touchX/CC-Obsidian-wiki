---
name: entities/claude-checkpointing
description: 会话状态管理 — 断点、rewind 和自动保存机制
type: entity
tags: [checkpoint, rewind, session, state, recovery]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/checkpointing.md
---

# Checkpointing

Checkpointing 允许您将对话和/或代码倒回到上一个点，或从选定的消息进行总结。

## 核心功能

| 功能 | 命令 | 说明 |
| --- | --- | --- |
| 断点创建 | 自动 | 每次工具执行后自动创建 |
| 倒回对话 | `/rewind` | 返回上一个检查点或选定消息 |
| 会话摘要 | `/recap` | 按需生成当前会话的单行摘要 |
| 自动摘要 | Recap | 离开后出现的自动摘要 |

## 工作原理

Claude Code 在每次工具执行后自动创建检查点。这些检查点包含：

- 对话历史记录
- 当前工作目录状态
- 已修改的文件快照

## 使用场景

| 场景 | 操作 |
| --- | --- |
| 恢复误删内容 | `/rewind` 返回检查点 |
| 清理对话 | `/clear` 新对话，保留旧对话供 `/resume` |
| 释放上下文 | `/compact` 总结当前对话 |

## 自动恢复

使用 `--continue` 或 `--resume` 恢复会话时：

- 检查点自动加载
- 如果检查点未过期，会话从检查点状态恢复
- 过期检查点被清理

## 交叉引用

- [[claude-cli]] — CLI 基础
- [[claude-commands]] — 命令参考
- [[context-management]] — 上下文管理

## 相关页面

- [[commands]] — Commands 实现
- [[commands-implementation]] — Commands 详细实现
