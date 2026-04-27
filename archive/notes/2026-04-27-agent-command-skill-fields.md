---
name: notes/2026-04-27-agent-command-skill-fields
description: Agent/Command/Skill 字段完整对比
type: pattern
tags: [commands, skills, agents, architecture, fields, session]
created: 2026-04-27
source: conversation
---

# Agent / Command / Skill 字段对比

## 调用关系总结

| 关系对 | 方向 | 说明 |
|--------|------|------|
| Command ↔ Agent | 双向 | 互相触发/编排 |
| Agent → Skill | 单向 | Agent 调用 Skill |
| Skill → Agent | ❌ | 不能主动调用 |

---

## AGENT 字段（最完整）

```yaml
---
name: weather-agent                    # 唯一标识
description: 获取迪拜天气的专用 Agent     # 描述
model: sonnet                          # 模型: haiku/sonnet/opus
allowedTools: [Bash, Read, Write]     # 工具白名单
mcpServers: [github]                   # MCP 服务范围
maxTurns: 5                            # 最大轮次
permissionMode: acceptEdits            # 权限模式
color: green                          # 标识颜色
memory: project                        # 记忆范围
skills: [weather-fetcher]              # 预加载 Skills
hooks:                                 # 钩子配置
  PreToolUse: [...]
  PostToolUse: [...]
---
```

### Agent 字段详解

| 字段 | 说明 | 可用值 |
|------|------|--------|
| `name` | 唯一标识 | 字符串 |
| `description` | 描述文本 | 字符串 |
| `model` | 指定模型 | `haiku` / `sonnet` / `opus` |
| `allowedTools` | 工具白名单 | 数组，支持 `*` 通配符 |
| `mcpServers` | MCP 服务范围 | 服务名数组 |
| `maxTurns` | 最大对话轮次 | 整数 |
| `permissionMode` | 权限模式 | `prompt` / `acceptEdits` / `limitEdits` |
| `color` | 可视化颜色 | 颜色名 / HEX |
| `memory` | 记忆持久化 | `project` / `global` / `off` |
| `skills` | 预加载 Skills | Skill 名称数组 |
| `hooks` | 生命周期钩子 | PreToolUse / PostToolUse / PostToolUseFailure |

---

## COMMAND 字段（轻量）

```yaml
---
description: 获取迪拜天气并创建 SVG 卡片   # 描述
model: haiku                              # 模型
allowed-tools:                             # 工具白名单
  - AskUserQuestion
  - Agent
  - Skill
---
```

### Command 字段详解

| 字段 | 说明 | 可用值 |
|------|------|--------|
| `description` | 命令描述 | 字符串 |
| `model` | 指定模型 | `haiku` / `sonnet` / `opus` |
| `allowed-tools` | 允许工具 | 工具名数组 |

---

## SKILL 字段（最精简）

```yaml
---
name: weather-fetcher                    # 唯一标识
description: Instructions for fetching...  # 描述
user-invocable: false                    # 是否可被用户调用
---
```

### Skill 字段详解

| 字段 | 说明 | 可用值 |
|------|------|--------|
| `name` | 唯一标识 | 字符串 |
| `description` | 描述文本 | 字符串 |
| `user-invocable` | 用户可调用 | `true` / `false` |

---

## 字段速查表

| 字段 | Agent | Command | Skill |
|------|:-----:|:-------:|:-----:|
| name | ✅ | ❌ | ✅ |
| description | ✅ | ✅ | ✅ |
| model | ✅ | ✅ | ❌ |
| allowedTools | ✅ | ✅ | ❌ |
| skills | ✅ | ❌ | ❌ |
| memory | ✅ | ❌ | ❌ |
| hooks | ✅ | ❌ | ❌ |
| mcpServers | ✅ | ❌ | ❌ |
| maxTurns | ✅ | ❌ | ❌ |
| permissionMode | ✅ | ❌ | ❌ |
| color | ✅ | ❌ | ❌ |
| user-invocable | ❌ | ❌ | ✅ |

---

## 核心 Insight

1. **Agent 最完整**：控制执行环境，10+ 配置项
2. **Command 中等**：5 个字段，入口编排
3. **Skill 最精简**：3 个字段，纯知识模块

4. **字段复杂度递进**：Agent > Command > Skill

5. **调用关系**：
   - Command ↔ Agent：双向
   - Agent → Skill：单向
   - Skill 不能调用 Agent/Command

---

## 相关 Wiki 页面
- [[synthesis/agent-command-skill-comparison]]
- [[implementation/commands-implementation]]
- [[implementation/subagents-implementation]]
- [[implementation/skills-implementation]]
- [[guides/subagents]]
- [[guides/commands]]