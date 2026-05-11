---
name: agent-teams
description: Claude Code 子代理团队 — 多实例协调工作，共享任务列表和代理间通信
type: concept
tags: [claude-code, agent-teams, multi-agent, team-lead, 官方文档]
created: 2026-05-11
updated: 2026-05-11
source: ../../../raw/claude/Orchestrate teams of Claude Code sessions.md
external_url: https://code.claude.com/docs/en/agent-teams
---

# Claude Code 子代理团队 (Agent Teams)

> [!info] 来源
> [官方文档：Orchestrate teams of Claude Code sessions](https://code.claude.com/docs/en/agent-teams)

> [!warning] 实验性功能
> 子代理团队默认禁用，需要设置环境变量启用。存在会话恢复、任务协调和关闭行为的已知限制。

---

## 核心概念

子代理团队让你协调多个 Claude Code 实例协同工作：

- **团队领导 (Team Lead)**：一个会话担任领导，协调工作、分配任务、综合结果
- **团队成员 (Teammates)**：每个成员独立工作，有自己的上下文窗口，相互直接通信

### 与子代理的区别

| 维度 | 子代理 | 子代理团队 |
|------|--------|-----------|
| **上下文** | 独立上下文，结果返回调用者 | 独立上下文，完全独立 |
| **通信** | 只向主代理报告结果 | 成员之间直接消息传递 |
| **协调** | 主代理管理所有工作 | 共享任务列表，自主协调 |
| **最佳场景** | 只需要结果的重点任务 | 需要讨论和协作的复杂工作 |
| **Token 成本** | 较低 | 较高 |

---

## 启用子代理团队

### 方式一：settings.json

```json
{
  "env": {
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  }
}
```

### 方式二：环境变量

```bash
# macOS/Linux/WSL
export CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1

# Windows PowerShell
$env:CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1
```

> [!tip] 版本要求
> 需要 Claude Code v2.1.32 或更高版本。使用 `claude --version` 检查版本。

---

## 适用场景

子代理团队最有效的场景：

| 场景 | 说明 |
|------|------|
| **研究和审查** | 多个成员同时调查问题的不同方面，分享和质疑彼此的发现 |
| **新模块或功能** | 每个成员独立负责一部分工作，互不干扰 |
| **竞争假设调试** | 多个成员并行测试不同理论，更快地收敛到答案 |
| **跨层协调** | 涉及前端、后端、测试的变更，由不同成员分别负责 |

> [!warning] 注意事项
> 子代理团队增加协调开销，Token 消耗显著高于单个会话。适用于成员可以独立操作的场景。对于顺序任务、同文件编辑或有大量依赖的工作，单个会话或子代理更有效。

---

## 团队结构

```
用户 → Team Lead → 协调工作 → 分配任务
                   ↓
        ┌─────────┼─────────┐
        ↓         ↓         ↓
    Teammate  Teammate  Teammate
    （独立）  （独立）  （独立）
        ↑         ↑         ↑
        └─────────┴─────────┘
              直接通信
```

---

## 创建第一个团队

启用后，用自然语言告诉 Claude 创建团队并描述任务和团队结构：

```text
I'm designing a CLI tool that helps developers track TODO comments across
their codebase. Create an agent team to explore this from different angles: one
teammate on UX, one on technical architecture, one playing devil's advocate.
```

Claude 会：
1. 创建团队
2. 生成共享任务列表
3. 为每个角色生成成员
4. 让成员探索问题
5. 综合发现结果

---

## 显示模式

| 模式 | 说明 |
|------|------|
| **In-process** | 所有成员在主终端内运行。使用 Shift+Down 在成员间切换 |
| **Split panes** | 每个成员获得独立窗格。需要 tmux 或 iTerm2 |

### tmux 配置

```json
{
  "teammateMode": "in-process"
}
```

或通过 CLI：

```bash
claude --teammate-mode in-process
```

---

## 任务管理

### 任务状态

| 状态 | 说明 |
|------|------|
| **pending** | 待处理，等待成员领取 |
| **in_progress** | 成员正在执行 |
| **completed** | 任务完成 |

### 任务分配

- **领导分配**：告诉领导将哪个任务分配给哪个成员
- **自我领取**：成员完成一个任务后，自动领取下一个未分配、无阻塞的任务

任务领取使用文件锁防止竞争条件。

### 任务依赖

任务可以依赖其他任务：有未解决依赖的待处理任务在被依赖任务完成前无法被领取。

---

## 计划审批

对于复杂或风险任务，可以要求成员在实施前先做计划：

```text
Spawn an architect teammate to refactor the authentication module.
Require plan approval before they make any changes.
```

流程：
1. 成员以只读计划模式工作
2. 计划完成后，发送审批请求给领导
3. 领导审核并批准或拒绝
4. 如果拒绝，成员修订计划并重新提交
5. 批准后，成员退出计划模式开始实施

---

## 与成员直接对话

每个成员都是完整的独立 Claude Code 会话。可以直接消息任何成员：

- **In-process 模式**：Shift+Down 切换成员，键入消息发送
- **Split-pane 模式**：点击成员窗格直接交互

---

## 子代理定义的使用

子代理团队可以使用子代理定义来生成成员：

```yaml
---
name: code-reviewer
description: Expert code reviewer
tools: Read, Grep, Glob
model: sonnet
---

# 系统提示词内容...
```

当生成成员时，可以引用子代理类型，成员会使用其 `tools` 和 `model`，定义的内容作为附加指令追加到成员的系统提示词。

---

## 团队清理

任务完成后，领导会尝试清理团队。

---

## 相关资源

- [官方文档](https://code.claude.com/docs/en/agent-teams)
- [[subagents]] — 子代理（无通信的独立任务）
- [[claude-commands]] — Claude Code 命令参考
- [[tmux-terminal-multiplexer]] — 终端复用器（团队显示需要）

---

*文档创建于 2026-05-11*
*来源：code.claude.com*
