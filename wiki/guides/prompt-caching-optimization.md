---
name: guides/prompt-caching-optimization
description: Prompt Caching 优化完全指南 — 缓存命中率提升的五个关键实践
type: guide
tags: [claude-code, prompt-caching, optimization, performance, cost, best-practices]
created: 2026-05-01
updated: 2026-05-01
source: ../../archive/guides/prompt-caching-optimization-2026-05-01.md
external_source: https://claude.com/blog/lessons-from-building-claude-code-prompt-caching-is-everything
---

# Prompt Caching 优化完全指南

> Prompt Caching 是 Agent 性能与成本的核心 — 从 Claude Code 的实战经验中学习

> 来源：Anthropic 官方博客

## 核心原则

> **"Cache rules everything around me"** — 缓存决定一切

长运行 Agent 产品（如 Claude Code）的可行性依赖于 **Prompt Caching**：
- 重用先前轮次的计算
- 显著降低延迟和成本
- 高缓存命中率 = 更慷慨的速率限制

在 Claude Code，我们整个 harness 都围绕 prompt caching 构建。我们对缓存命中率设置警报，命中率过低时触发 SEV。

## Prompt Caching 工作原理

### 前缀匹配机制

Prompt Caching 通过**前缀匹配**工作：
- API 缓存从请求开始到每个 `cache_control` 断点的所有内容
- **顺序至关重要** — 你希望尽可能多的请求共享前缀
- 前缀中的任何更改都会使之后的所有缓存失效

### Claude Code 的提示词布局

```
1. 静态系统提示 & Tools（全局缓存）
   ↓
2. CLAUDE.md（项目内缓存）
   ↓
3. Session context（会话内缓存）
   ↓
4. Conversation messages（对话消息）
```

这种方法最大化了会话间共享缓存命中的数量。

## 五大优化实践

### 1. 为缓存而设计提示词

**静态内容优先，动态内容最后**

#### 常见错误（破坏缓存）

- ❌ 在静态系统提示中放置详细时间戳
- ❌ 非确定性地打乱工具顺序定义
- ❌ 更新工具参数（如 Agent tool 可调用的代理列表）

#### 正确做法

- ✅ 将稳定内容放在前面
- ✅ 将动态内容（对话）放在最后
- ✅ 维护一致的工具顺序

### 2. 使用消息进行更新

#### 场景
提示词中的信息变得过时（如时间变化、用户修改文件）

#### 错误做法
```python
# 直接编辑系统提示词 → 缓存失效
update_system_prompt(new_time)
```

#### 正确做法
```python
# 在下一条消息中添加 <system-reminder>
add_system_reminder(message, f"<system-reminder>Current time: {new_time}</system-reminder>")
```

**好处**：保持缓存完整性

### 3. 会话中不要更换模型

#### 非直观的数学

**场景**：与 Opus 进行了 100k tokens 的对话，想问一个简单问题

| 选项 | 成本分析 |
|------|----------|
| 切换到 Haiku | ❌ 需要重建 Haiku 的提示词缓存 |
| 继续使用 Opus | ✅ 利用已有缓存，成本更低 |

#### 正确做法：使用 Subagents

如果需要切换模型，最佳方式是使用子代理：

```python
# Opus 准备"交接"消息给另一个模型
handoff = opus.create_handoff_message(task)
haiku_agent.execute(handoff)
```

**示例**：Claude Code 的 Explore 代理使用 Haiku，但通过 Opus 交接任务。

### 4. 会话中绝不增删工具

#### 为什么会破坏缓存

工具是缓存前缀的一部分，添加或删除工具会使整个对话的缓存失效。

#### 直觉但错误的做法
```
用户进入 Plan Mode
→ 交换工具集为只读工具
❌ 缓存失效
```

#### 正确做法：工具本身作为状态转换

**Plan Mode 设计案例**：

```python
# 保持所有工具在请求中
tools = [all_tools]  # 永远不变

# 使用工具本身来建模状态转换
def enter_plan_mode():
    system_message = """
    你处于 Plan Mode：
    - 探索代码库
    - 不要编辑文件
    - 计划完成后调用 ExitPlanMode
    """

# Agent 可以自主进入 Plan Mode
if detects_hard_problem():
    call_tool("EnterPlanMode")
```

**额外好处**：因为 EnterPlanMode 是工具，模型可以检测难题时自主调用，无需破坏缓存。

#### 使用 Tool Search 延迟加载

**场景**：Claude Code 可能有几十个 MCP 工具

**问题**：在每个请求中包含所有工具会很昂贵，但移除工具会破坏缓存

**解决方案**：`defer_loading`

```python
# 发送轻量级存根
stub_tool = {
    "name": "database_query",
    "defer_loading": True  # 仅包含工具名
}

# 模型通过 tool search "发现"完整模式
full_schema = {
    "name": "database_query",
    "parameters": {
        "query": {"type": "string"},
        "limit": {"type": "integer"}
    }
}
```

**优势**：
- 存根始终以相同顺序存在
- 缓存前缀保持稳定
- 完整工具架构仅在需要时加载

### 5. 缓存安全的压缩操作

#### 压缩的缓存陷阱

**场景**：上下文窗口填满时，需要总结对话

#### 错误做法
```python
# 独立的 API 调用
summarization = api_call(
    system_prompt="Summarize this",  # ❌ 不同的系统提示
    tools=[],                        # ❌ 没有工具
    messages=full_conversation
)
# 前缀从第一个 token 开始分歧
# 无法应用任何缓存
```

**问题**：主对话在一个系统提示和工具集下缓存，总结调用使用不同的系统提示和无工具，前缀从最开始就分歧。

#### 正确做法：缓存安全分支

```python
# 使用完全相同的系统提示、用户上下文、系统上下文、工具定义
compaction_request = {
    "system_prompt": parent.system_prompt,      # ✅ 相同
    "user_context": parent.user_context,        # ✅ 相同
    "system_context": parent.system_context,    # ✅ 相同
    "tools": parent.tools,                      # ✅ 相同
    "messages": [
        *parent.messages,        # 父对话的消息
        compaction_prompt        # 压缩提示作为新的用户消息
    ]
}
```

**从 API 角度**：这个请求与父级的最后一次请求几乎完全相同 — 相同前缀、相同工具、相同历史记录 — 所以复用缓存前缀。唯一的新 tokens 是压缩提示本身。

**权衡**：需要保存"压缩缓冲区"，以便在上下文窗口中有足够空间包含压缩消息和摘要输出 tokens。

## 实战经验总结

### 优化检查清单

| 实践 | 关键点 | 影响 |
|------|--------|------|
| **前缀匹配** | 任何前缀中的更改都会使之后的所有内容失效 | 设计整个系统时围绕此约束 |
| **消息更新** | 使用消息而非系统提示词更改 | 插入计划模式、时间更新等 |
| **工具稳定** | 会话中不更改工具或模型 | 使用工具建模状态转换 |
| **延迟加载** | 使用 `defer_loading` 而非移除工具 | 保持存根顺序稳定 |
| **缓存安全分支** | 侧计算共享父级前缀 | 压缩、总结、技能执行 |

### 监控缓存命中率

> **将缓存命中率视为正常运行时间**

- 🔔 对缓存破坏设置警报
- 🚨 将其视为事件（Incident）
- 📊 缓存命中率的几个百分点变化会显著影响成本和延迟

## 缓存破坏的成本案例

### 场景 1：时间戳更新

```python
# 错误：在静态系统提示中
system_prompt = f"""
Current time: {datetime.now()}  # ❌ 每次调用都不同
"""
# 缓存命中率：~0%
```

```python
# 正确：在消息中
messages = [
    {"role": "system", "content": static_prompt},
    {"role": "user", "content": f"<system-reminder>Time: {now}</system-reminder>"}
]
# 缓存命中率：~95%
```

### 场景 2：工具动态加载

```python
# 错误：动态添加工具
if needs_database():
    tools.append(database_tool)  # ❌ 破坏缓存
```

```python
# 正确：延迟加载存根
tools = [
    {"name": "database", "defer_loading": True},  # ✅ 始终存在
    # ... 其他工具
]
```

## 最佳实践清单

在构建 Agent 时优化 Prompt Caching：

- [ ] **提示词布局**：静态内容优先，动态内容最后
- [ ] **消息更新**：使用 `<system-reminder>` 而非编辑系统提示
- [ ] **模型稳定性**：会话中不更换模型（使用 Subagents）
- [ ] **工具稳定性**：会话中不增删工具（使用 defer_loading）
- [ ] **缓存监控**：将缓存命中率作为关键指标监控
- [ ] **分支操作**：确保侧计算共享父级前缀（压缩、总结、技能）

## 技术实现要点

### Compaction 实现细节

虽然压缩很棘手，但幸运的是你不需要自己学习这些课程。基于我们在 Claude Code 中的学习，我们直接将 [compaction](https://platform.claude.com/docs/en/build-with-claude/compaction#prompt-caching) 构建到 API 中，因此你可以在自己的应用程序中应用这些模式。

### Tool Search API

你也可以通过我们的 API 使用 [tool search tool](https://platform.claude.com/docs/en/agents-and-tools/tool-use/tool-search-tool) 来简化延迟加载实现。

## 相关页面

- [[guides/session-management-context-window]] — 会话管理完整指南
- [[patterns/claude-intelligence-harnessing]] — Claude 智能利用模式
- [[tips/session-context-tips]] — 会话上下文技巧

---

*摄取时间: 2026-05-01*
*来源: Anthropic 官方博客*
*作者: Thariq Shihipar (Claude Code 技术团队成员)*
*原文: https://claude.com/blog/lessons-from-building-claude-code-prompt-caching-is-everything*
