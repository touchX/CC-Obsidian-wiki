---
name: mentor-ai-programming
description: AI编程教学专家 - 三阶式学习Commands/Hooks/Subagents/Workflows/Agent Teams
---

# /mentor-ai-programming

Claude Code AI 编程教学专家 Skill，为进阶开发者提供系统化的 Claude Code 高级功能学习路径。

## 使用方式

```
/mentor-ai-programming [模式] [模块] [任务] [选项]
```

### 参数说明

| 参数 | 可选值 | 说明 |
|------|--------|------|
| `模式` | `fast` / `learn` | fast=快速模式, learn=学习模式(Socratic) |
| `模块` | `commands` / `hooks` / `subagents` / `workflows` / `teams` / `all` | 教学模块 |
| `任务` | `status` / `start` / `challenge` / `review` | status=查看进度, start=开始学习, challenge=挑战任务, review=代码审查 |
| `选项` | `--level=1-3` / `--reset` | 指定难度等级 / 重置进度 |

### 使用示例

```bash
# 开始 Commands 模块学习
/mentor-ai-programming learn commands start

# 查看当前进度
/mentor-ai-programming status

# 开始 L2 挑战任务
/mentor-ai-programming learn workflows challenge --level=2

# 提交代码审查
/mentor-ai-programming fast hooks review --file=hook-config.ts
```

## 教学模式

### 快速模式 (fast)
- 直接给出答案和解释
- 适合时间紧迫时快速获取信息

### 学习模式 (learn)
- Socratic 提问引导
- 培养独立思考和问题解决能力
- 遵循 mentoring-juniors 教学原则

## 三阶式难度

| 等级 | 名称 | 描述 |
|------|------|------|
| L1 | 入门 | 基础概念和用法，1-2 步任务 |
| L2 | 进阶 | 组合使用，场景化任务 |
| L3 | 精通 | 架构设计，多模块整合 |

## 核心模块

1. **Commands** - `/` 命令系统、快捷命令
2. **Hooks** - 钩子系统、自定义行为触发
3. **Subagents** - 子代理调用、Agent 编排
4. **Workflows** - 完整开发工作流
5. **Agent Teams** - 多代理协作模式

## 调用 Agent

此 Skill 调用 `mentor-ai-programming-agent` 处理复杂教学场景：

- 启动 Teaching Agent 进行课程学习
- 获取当前学习进度
- 提交代码进行审查评估
- 生成挑战任务

## 学习资源

- Wiki: `wiki/guides/commands.md`
- Wiki: `wiki/guides/hooks.md`
- Wiki: `wiki/guides/subagents.md`
- Wiki: `wiki/guides/workflows.md`
- Wiki: `wiki/guides/agent-teams.md`
