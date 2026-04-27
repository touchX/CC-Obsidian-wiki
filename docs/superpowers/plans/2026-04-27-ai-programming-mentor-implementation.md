# AI 编程教学专家 Agent 实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 创建 `/mentor-ai-programming` Skill 和 Teaching Agent，实现 Claude Code 五大核心模块（Commands、Hooks、Subagents、Workflows、Agent Teams）的三阶式教学系统。

**Architecture:** Skill 作为前端入口处理命令解析和模式切换；Agent 处理复杂教学场景和代码审查；Wiki 内容通过 Obsidian CLI 按需查询。

**Tech Stack:** Claude Code Skill + Agent + Obsidian CLI + Markdown 课程文件

---

## 文件结构

```
.claude/
├── skills/
│   └── mentor-ai-programming/
│       └── SKILL.md                    # Skill 入口文件
├── agents/
│   └── mentor-ai-programming-agent.md  # Teaching Agent 定义
│   └── mentor-ai-programming/
│       ├── SYSTEM.md                   # Agent 系统提示词
│       ├── modules/
│       │   ├── commands.md             # Commands 模块课程
│       │   ├── hooks.md                # Hooks 模块课程
│       │   ├── subagents.md            # Subagents 模块课程
│       │   ├── workflows.md            # Workflows 模块课程
│       │   └── teams.md                # Agent Teams 模块课程
│       └── progress/
│           └── template.md             # 进度模板
```

---

## Phase 1: 基础框架

### Task 1: 创建 Skill 目录结构和入口文件

**Files:**
- Create: `.claude/skills/mentor-ai-programming/SKILL.md`

- [ ] **Step 1: 创建目录结构**

```bash
mkdir -p .claude/skills/mentor-ai-programming
mkdir -p .claude/agents/mentor-ai-programming/modules
mkdir -p .claude/agents/mentor-ai-programming/progress
```

- [ ] **Step 2: 编写 Skill 入口文件**

```markdown
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
```

- [ ] **Step 3: 提交**

```bash
git add .claude/skills/mentor-ai-programming/SKILL.md
git commit -m "feat(skill): add mentor-ai-programming skill entry point"
```

---

### Task 2: 创建 Agent 定义文件

**Files:**
- Create: `.claude/agents/mentor-ai-programming-agent.md`

- [ ] **Step 1: 编写 Agent 定义文件**

```markdown
---
name: mentor-ai-programming-agent
description: Teaching agent for AI programming education with Claude Code - Socratic method, code review, and progressive challenges
allowedTools:
  - "Bash(*)"
  - "Read"
  - "Write"
  - "Edit"
  - "Glob"
  - "Grep"
  - "Agent"
  - "mcp__*"
model: sonnet
color: yellow
maxTurns: 50
permissionMode: acceptEdits
memory: project
skills:
  - obsidian:obsidian-cli
  - mentoring-juniors
---

# AI Programming Mentor Agent

读取系统提示词文件获取完整指令：`.claude/agents/mentor-ai-programming/SYSTEM.md`
```

- [ ] **Step 2: 提交**

```bash
git add .claude/agents/mentor-ai-programming-agent.md
git commit -m "feat(agent): add mentor-ai-programming-agent definition"
```

---

### Task 3: 创建 Agent 系统提示词

**Files:**
- Create: `.claude/agents/mentor-ai-programming/SYSTEM.md`

- [ ] **Step 1: 编写系统提示词**

```markdown
# AI Programming Mentor - Teaching Agent System

## 角色定义

你是一位拥有 15+ 年编程和教育经验的高级 Lead Developer。你专精于 Claude Code 的高级功能教学，擅长通过提问引导而非直接给答案来培养学习者的独立思考能力。

你结合了：
- **Socratic 教学法**：通过提问引导发现答案
- **Code Review 评估**：实战中学习最佳实践
- **三阶式学习**：入门→进阶→精通

## 教学模式

### 快速模式 (fast)
- 直接讲解概念和用法
- 提供代码示例和最佳实践
- 适合时间紧迫或需要快速参考

### 学习模式 (learn)
- 遵循 Socratic 教学原则
- 通过提问引导学习者自己发现解决方案
- 错误视为学习机会
- 🔴 高压交付后必须复盘

## Socratic 核心原则

| 原则 | 说明 |
|------|------|
| 从不给答案 | 引导而非告知 |
| 从不盲抄 | 学习者必须理解每一行 |
| 从不居高临下 | 每个问题都合理 |
| 从不急躁 | 学习时间是最宝贵的投资 |

## 三阶式难度

### L1 - 入门
- 基础概念理解
- 单步/两步任务
- 评估：概念问答 + 简单代码

### L2 - 进阶
- 组合使用多个概念
- 场景化任务
- 评估：代码审查 + 挑战任务

### L3 - 精通
- 架构设计和最佳实践
- 多模块整合
- 评估：完整项目 + Code Review

## 五大教学模块

### 1. Commands 模块
- `/` 命令系统
- 快捷命令创建
- 命令组合使用

### 2. Hooks 模块
- 钩子系统原理
- 自定义行为触发
- 常见钩子场景

### 3. Subagents 模块
- 子代理调用
- Agent 编排模式
- 任务分解策略

### 4. Workflows 模块
- 完整开发工作流
- 调试工作流
- 代码审查工作流

### 5. Agent Teams 模块
- 多代理协作模式
- 角色分工设计
- 通信和协调

## 评估系统

### 代码审查维度

| 维度 | 检查项 |
|------|--------|
| 功能性 | 代码是否正确实现需求？边界情况？ |
| 最佳实践 | 是否遵循 Claude Code 最佳实践？ |
| 可读性 | 代码是否清晰易懂？ |
| 安全性 | 是否有安全隐患？ |

### 挑战任务结构

每个模块每等级包含：
- **L1**: 3-5 个基础任务
- **L2**: 3-5 个进阶任务
- **L3**: 1-2 个综合项目

## 工作流程

### 开始学习
1. 确认模块和难度等级
2. 加载模块课程内容
3. 介绍学习目标和路径
4. 开始第一个任务

### 挑战模式
1. 呈现挑战任务
2. 学习者尝试解决
3. 提供分阶段提示（如需要）
4. 代码审查评估
5. 总结和下一步建议

### 代码审查
1. 接收提交的代码
2. 按照四个维度审查
3. 给出具体改进建议
4. 提供优秀示例

## 响应格式

### 快速模式响应
```
## [概念名称]

**简要说明**: ...

**用法示例**:
\`\`\`typescript
// 示例代码
\`\`\`

**最佳实践**:
- ...
```

### 学习模式响应
```
🎯 **学习目标**: ...

🤔 **引导问题**: ...

💡 **提示** (如需要):
- ...

✅ **检查点**: ...
```

## 课程内容

详细课程内容在同级目录的 `modules/` 文件夹中：
- `commands.md` - Commands 模块
- `hooks.md` - Hooks 模块
- `subagents.md` - Subagents 模块
- `workflows.md` - Workflows 模块
- `teams.md` - Agent Teams 模块

## Wiki 查询

使用 obsidian-cli 查询 wiki 资料：

```bash
# 查询相关页面
obsidian search query="Claude Commands"

# 读取页面内容
obsidian read file="claude-commands"

# 查看链接
obsidian backlinks file="commands"
```
```

- [ ] **Step 2: 提交**

```bash
git add .claude/agents/mentor-ai-programming/SYSTEM.md
git commit -m "feat(agent): add mentor-ai-programming system prompt"
```

---

## Phase 2: 课程模块内容

### Task 4: Commands 模块课程

**Files:**
- Create: `.claude/agents/mentor-ai-programming/modules/commands.md`

- [ ] **Step 1: 编写 Commands 模块课程**

```markdown
# Commands 模块课程

## 模块概述

学习 Claude Code 的 `/` 命令系统，掌握如何通过命令提高开发效率。

## L1 - 入门

### 学习目标
- 理解 Commands 的基本概念
- 掌握常用内置命令
- 能够使用命令完成简单任务

### 核心内容

#### 1. 什么是 Commands
Commands 是以 `/` 开头的快捷方式，用于触发特定行为：
- `/help` - 获取帮助
- `/clear` - 清除对话
- `/undo` - 撤销更改
- `/task` - 创建任务列表

#### 2. 内置命令分类
| 类别 | 命令 | 用途 |
|------|------|------|
| 导航 | `/cd`, `/goto` | 切换目录/文件 |
| 编辑 | `/edit`, `/write` | 代码编辑 |
| 搜索 | `/search`, `/grep` | 内容搜索 |
| Git | `/commit`, `/branch` | Git 操作 |
| 配置 | `/settings`, `/config` | 配置管理 |

#### 3. 挑战任务 L1

**任务 1.1**: 使用 `/search` 命令搜索项目中的某个函数
**任务 1.2**: 使用 `/help` 查看可用的内置命令
**任务 1.3**: 使用 `/goto` 跳转到指定文件

### 自测问题
- Commands 和普通对话输入有什么区别？
- 如何发现项目可用的自定义命令？

---

## L2 - 进阶

### 学习目标
- 掌握命令组合使用
- 能够创建快捷命令
- 理解命令参数传递

### 核心内容

#### 1. 命令组合
多个命令可以组合使用实现复杂操作：
```
/search "TODO" + /edit 组合 = 搜索并修改
```

#### 2. 创建自定义命令
在 `settings.json` 中配置：
```json
{
  "commands": {
    "build": "npm run build && npm run test"
  }
}
```

#### 3. 命令参数
| 参数类型 | 示例 | 说明 |
|---------|------|------|
| 位置参数 | `/goto src/app.ts` | 文件路径 |
| 命名参数 | `--force` | 布尔选项 |
| 值参数 | `--name=value` | 键值对 |

#### 4. 挑战任务 L2

**任务 2.1**: 创建一个自定义命令，实现"运行测试并打开报告"
**任务 2.2**: 分析项目中的 Git 工作流，识别可以用命令自动化的步骤
**任务 2.3**: 编写一个命令组合，完成 PR 创建流程

---

## L3 - 精通

### 学习目标
- 掌握命令系统架构
- 能够深度定制命令行为
- 理解命令与 Agent 的协作

### 核心内容

#### 1. 命令系统架构
```
用户输入 → 命令解析器 → 参数验证 → 命令执行 → 结果输出
```

#### 2. 高级命令设计
- 命令执行上下文管理
- 命令链和依赖处理
- 错误恢复机制

#### 3. 命令与 Agent 协作
命令可以作为 Agent 的触发器：
```typescript
const agent = new Agent({
  commands: ['analyze', 'refactor', 'test']
});
```

#### 4. 综合项目 L3

**项目**: 为团队设计一套完整的开发工作流命令集
- 分析团队开发流程
- 设计命令集
- 实现并测试
- 文档化

---

## Wiki 参考资料

- `wiki/guides/commands.md`
- `wiki/entities/claude-commands.md`
- `wiki/implementation/commands-implementation.md`
```

- [ ] **Step 2: 提交**

```bash
git add .claude/agents/mentor-ai-programming/modules/commands.md
git commit -m "feat(content): add Commands module course"
```

---

### Task 5: Hooks 模块课程

**Files:**
- Create: `.claude/agents/mentor-ai-programming/modules/hooks.md`

- [ ] **Step 1: 编写 Hooks 模块课程**

```markdown
# Hooks 模块课程

## 模块概述

学习 Claude Code 的钩子系统，掌握如何通过钩子自动化工作流和扩展功能。

## L1 - 入门

### 学习目标
- 理解 Hooks 的基本概念
- 掌握常用钩子类型
- 能够配置简单的钩子

### 核心内容

#### 1. 什么是 Hooks
Hooks 是在特定事件发生时自动触发的脚本：
- **PreToolUse** - 工具执行前
- **PostToolUse** - 工具执行后
- **Stop** - 会话结束时

#### 2. 钩子配置结构
```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "git push",
        "hooks": [{ "type": "command", "command": "echo 'Review changes'" }]
      }
    ]
  }
}
```

#### 3. 挑战任务 L1

**任务 1.1**: 配置一个 PreToolUse 钩子，在 git 命令前打印提示
**任务 1.2**: 配置一个 PostToolUse 钩子，在编辑文件后自动格式化
**任务 1.3**: 配置一个 Stop 钩子，在会话结束时保存进度

### 自测问题
- PreToolUse 和 PostToolUse 的区别是什么？
- 钩子可以执行哪些类型的操作？

---

## L2 - 进阶

### 学习目标
- 掌握钩子参数和条件匹配
- 能够编写复杂的钩子逻辑
- 理解钩子链和错误处理

### 核心内容

#### 1. Matcher 条件匹配
| 模式 | 示例 | 匹配 |
|------|------|------|
| 精确匹配 | `"git push"` | 精确命令 |
| 通配符 | `"git *"` | git 开头 |
| 正则 | `"^npm.*"` | npm 命令 |

#### 2. 钩子类型
| 类型 | 用途 |
|------|------|
| `command` | 执行 shell 命令 |
| `edit` | 自动修改文件 |
| `confirm` | 请求确认 |

#### 3. 错误处理
```json
{
  "hooks": {
    "PostToolUseFailure": [
      {
        "matcher": ".*",
        "hooks": [{ "type": "command", "command": "echo 'Error occurred'" }]
      }
    ]
  }
}
```

#### 4. 挑战任务 L2

**任务 2.1**: 编写一个钩子，在 TypeScript 文件修改后自动运行类型检查
**任务 2.2**: 创建一个钩子链：PreToolUse 检查 → PostToolUse 验证 → Stop 记录
**任务 2.3**: 实现一个带条件的钩子，只有在特定条件下才触发

---

## L3 - 精通

### 学习目标
- 掌握钩子系统架构
- 能够深度定制钩子行为
- 理解钩子与 Skill 的协作

### 核心内容

#### 1. 钩子系统架构
```
事件触发 → Matcher 匹配 → 钩子执行器 → 结果处理 → 继续/中断
```

#### 2. 高级钩子模式
- 异步钩子执行
- 钩子间数据共享
- 条件分支逻辑

#### 3. 钩子与 Skill
```typescript
const hook = {
  type: 'skill',
  skill: 'my-custom-hook-skill',
  params: { mode: 'strict' }
};
```

#### 4. 综合项目 L3

**项目**: 为团队设计一套开发流程钩子系统
- 代码风格检查钩子
- 自动化测试钩子
- 文档更新钩子
- 部署前验证钩子

---

## Wiki 参考资料

- `wiki/entities/claude-hooks.md`
- `wiki/sources/claude-hooks-full.md`
```

- [ ] **Step 2: 提交**

```bash
git add .claude/agents/mentor-ai-programming/modules/hooks.md
git commit -m "feat(content): add Hooks module course"
```

---

### Task 6: Subagents 模块课程

**Files:**
- Create: `.claude/agents/mentor-ai-programming/modules/subagents.md`

- [ ] **Step 1: 编写 Subagents 模块课程**

```markdown
# Subagents 模块课程

## 模块概述

学习 Claude Code 的子代理系统，掌握如何通过代理分工提高复杂任务的处理效率。

## L1 - 入门

### 学习目标
- 理解 Subagent 的基本概念
- 掌握子代理的创建和调用
- 能够使用子代理分解简单任务

### 核心内容

#### 1. 什么是 Subagents
Subagent 是从主会话中派生的独立代理：
- 独立的工作上下文
- 可以并行执行
- 结果返回主会话

#### 2. 调用子代理
```typescript
const result = await Agent({
  description: "代码审查专家",
  tools: ["Read", "Grep"],
  prompt: "审查以下代码..."
});
```

#### 3. 子代理参数
| 参数 | 说明 |
|------|------|
| `description` | 代理角色描述 |
| `tools` | 可用工具列表 |
| `prompt` | 具体任务指令 |

#### 4. 挑战任务 L1

**任务 1.1**: 创建一个代码审查子代理，审查指定文件
**任务 1.2**: 创建一个文档生成子代理，为代码生成注释
**任务 1.3**: 尝试并行调用两个子代理

### 自测问题
- Subagent 和普通函数调用有什么区别？
- 什么时候应该使用子代理？

---

## L2 - 进阶

### 学习目标
- 掌握子代理间的数据传递
- 能够设计代理协作模式
- 理解代理生命周期管理

### 核心内容

#### 1. 数据传递模式
```typescript
// 模式1: 上下文注入
const agent = new Agent({
  context: { files: fileList }
});

// 模式2: 结果聚合
const results = await Promise.all(agents);
const merged = results.reduce(...)
```

#### 2. 代理编排模式
| 模式 | 适用场景 |
|------|----------|
| 并行 | 独立任务同时执行 |
| 串行 | 任务有依赖关系 |
| 分支 | 根据条件选择代理 |
| 聚合 | 多个代理结果合并 |

#### 3. 生命周期管理
- 代理启动和初始化
- 中间状态检查点
- 超时和错误处理
- 结果验证

#### 4. 挑战任务 L2

**任务 2.1**: 设计一个并行代码分析流程：语法检查 + 安全扫描 + 性能分析
**任务 2.2**: 实现一个串行文档处理流程：提取 → 转换 → 验证 → 生成
**任务 2.3**: 创建一个带重试机制的子代理调用

---

## L3 - 精通

### 学习目标
- 掌握多代理系统设计
- 能够设计复杂的代理协作
- 理解代理架构最佳实践

### 核心内容

#### 1. 多代理架构
```
Orchestrator Agent
├── Code Reviewer Agent
├── Security Auditor Agent
├── Performance Analyzer Agent
└── Documentation Agent
```

#### 2. 代理通信协议
```typescript
interface AgentMessage {
  from: string;
  to: string;
  type: 'task' | 'result' | 'error';
  payload: any;
}
```

#### 3. 代理状态管理
- 共享状态 vs 私有状态
- 状态同步机制
- 一致性保证

#### 4. 综合项目 L3

**项目**: 设计一个自动化代码质量分析系统
- 架构设计
- 代理角色定义
- 协作流程实现
- 结果聚合和报告

---

## Wiki 参考资料

- `wiki/guides/subagents.md`
- `wiki/entities/claude-subagents.md`
- `wiki/implementation/subagents-implementation.md`
```

- [ ] **Step 2: 提交**

```bash
git add .claude/agents/mentor-ai-programming/modules/subagents.md
git commit -m "feat(content): add Subagents module course"
```

---

### Task 7: Workflows 模块课程

**Files:**
- Create: `.claude/agents/mentor-ai-programming/modules/workflows.md`

- [ ] **Step 1: 编写 Workflows 模块课程**

```markdown
# Workflows 模块课程

## 模块概述

学习 Claude Code 的完整开发工作流，掌握如何高效地完成日常开发任务。

## L1 - 入门

### 学习目标
- 理解标准开发工作流
- 掌握基本操作流程
- 能够处理常见的开发场景

### 核心内容

#### 1. 标准开发工作流
```
需求理解 → 代码实现 → 测试验证 → 代码审查 → 提交部署
```

#### 2. 常用工作流场景
| 场景 | 工作流 |
|------|--------|
| Bug 修复 | 复现 → 定位 → 修复 → 验证 → 提交 |
| 新功能 | 理解需求 → 方案设计 → 实现 → 测试 → PR |
| 代码审查 | 查看变更 → 分析代码 → 提出建议 → 讨论 |

#### 3. Claude Code 工作流命令
- `/dev` - 开发模式
- `/test` - 测试模式
- `/review` - 审查模式

#### 4. 挑战任务 L1

**任务 1.1**: 使用 Claude Code 完成一个简单的 Bug 修复流程
**任务 1.2**: 实现一个新功能并创建 PR
**任务 1.3**: 进行一次完整的代码审查

### 自测问题
- 你的团队目前的开发流程是怎样的？
- 哪些步骤可以用 Claude Code 自动化？

---

## L2 - 进阶

### 学习目标
- 掌握调试工作流
- 能够设计自定义工作流
- 理解工作流与工具的配合

### 核心内容

#### 1. 调试工作流
```
发现问题 → 收集信息 → 形成假设 → 验证假设 → 修复 → 确认
```

**Claude Code 调试工具**:
- `/debug` - 启动调试模式
- `grep` - 搜索问题线索
- `Read` - 查看上下文

#### 2. 自定义工作流设计
```json
{
  "workflows": {
    "quick-fix": {
      "steps": ["grep", "read", "edit", "test"]
    }
  }
}
```

#### 3. 工作流最佳实践
| 实践 | 说明 |
|------|------|
| 原子性 | 每步尽可能独立 |
| 可验证 | 每步有明确的成功标准 |
| 可回滚 | 支持撤销操作 |

#### 4. 挑战任务 L2

**任务 2.1**: 设计一个自动化调试工作流
**任务 2.2**: 创建一个自定义的 PR 审查工作流
**任务 2.3**: 实现一个多环境部署工作流

---

## L3 - 精通

### 学习目标
- 掌握复杂系统的工作流设计
- 能够构建团队级工作流
- 理解工作流与 Agent 的结合

### 核心内容

#### 1. 复杂系统工作流
- 微服务协调工作流
- 数据处理管道
- 自动化运维流程

#### 2. 团队级工作流
```typescript
const teamWorkflow = {
  stages: [
    { role: 'architect', task: 'design' },
    { role: 'developer', task: 'implement', depends: ['design'] },
    { role: 'reviewer', task: 'review', depends: ['implement'] },
    { role: 'tester', task: 'test', depends: ['implement'] }
  ]
};
```

#### 3. 工作流与 Agent Teams
工作流可以作为 Agent Teams 的执行骨架

#### 4. 综合项目 L3

**项目**: 为团队设计完整的 CI/CD 工作流
- 代码检查阶段
- 测试阶段
- 构建阶段
- 部署阶段
- 监控阶段

---

## Wiki 参考资料

- `wiki/guides/workflows.md`
- `wiki/guides/workflow-examples.md`
- `wiki/guides/workflow-book-chapter.md`
```

- [ ] **Step 2: 提交**

```bash
git add .claude/agents/mentor-ai-programming/modules/workflows.md
git commit -m "feat(content): add Workflows module course"
```

---

### Task 8: Agent Teams 模块课程

**Files:**
- Create: `.claude/agents/mentor-ai-programming/modules/teams.md`

- [ ] **Step 1: 编写 Agent Teams 模块课程**

```markdown
# Agent Teams 模块课程

## 模块概述

学习 Claude Code 的多代理协作系统，掌握如何通过代理团队完成复杂任务。

## L1 - 入门

### 学习目标
- 理解 Agent Teams 的基本概念
- 掌握团队创建和角色定义
- 能够设计简单的多代理协作

### 核心内容

#### 1. 什么是 Agent Teams
Agent Team 是多个专门代理的组合：
- 每个代理有特定角色
- 代理间可以通信
- 共同完成复杂任务

#### 2. 团队结构
```typescript
const team = {
  agents: [
    { role: 'coordinator', description: '任务协调' },
    { role: 'developer', description: '代码开发' },
    { role: 'reviewer', description: '代码审查' }
  ],
  communication: 'hierarchical' // hierarchical | peer
};
```

#### 3. 团队通信模式
| 模式 | 说明 | 适用场景 |
|------|------|----------|
| Hierarchical | 层级通信，Coordinator 中转 | 任务明确 |
| Peer | 对等通信，代理直接交互 | 协作复杂 |

#### 4. 挑战任务 L1

**任务 1.1**: 创建一个两人团队：开发者 + 审查者
**任务 1.2**: 设计一个三人团队完成新功能开发
**任务 1.3**: 实现团队内的结果传递

### 自测问题
- Agent Team 和多个 Subagent 调用的区别是什么？
- 什么时候应该使用团队而不是单个代理？

---

## L2 - 进阶

### 学习目标
- 掌握团队协作模式
- 能够设计复杂的团队结构
- 理解团队生命周期管理

### 核心内容

#### 1. 协作模式
| 模式 | 说明 |
|------|------|
| 流水线 | A → B → C 顺序处理 |
| 并行执行 | A ‖ B ‖ C 同时处理 |
| 辩论协商 | A 提出，B 反驳，达成共识 |
| 角色轮换 | 根据任务动态调整角色 |

#### 2. 团队角色设计
| 角色 | 职责 | 典型技能 |
|------|------|----------|
| Coordinator | 任务分解和分配 | 任务管理 |
| Developer | 代码实现 | 编程语言 |
| Reviewer | 代码审查 | 最佳实践 |
| Researcher | 信息收集 | 搜索和分析 |

#### 3. 生命周期管理
- 团队初始化
- 任务分配和跟踪
- 中间协调和冲突解决
- 结果汇总和验证

#### 4. 挑战任务 L2

**任务 2.1**: 设计一个四角色团队完成端到端功能开发
**任务 2.2**: 实现一个辩论协商模式的质量审查团队
**任务 2.3**: 创建一个能够处理动态任务重分配的系统

---

## L3 - 精通

### 学习目标
- 掌握大规模多代理系统设计
- 能够构建企业级代理团队
- 理解团队架构最佳实践

### 核心内容

#### 1. 大规模代理架构
```
Executive Team
├── Backend Team
│   ├── API Team
│   ├── Database Team
│   └── Infrastructure Team
├── Frontend Team
│   ├── Components Team
│   └── Integration Team
└── QA Team
```

#### 2. 团队间通信协议
```typescript
interface TeamMessage {
  from: { team: string; agent: string };
  to: { team: string; agent?: string };
  type: 'task' | 'result' | 'query';
  payload: any;
  priority: 'low' | 'normal' | 'high';
}
```

#### 3. 团队治理
- 权限和访问控制
- 资源分配和调度
- 监控和日志
- 错误恢复

#### 4. 综合项目 L3

**项目**: 设计一个自动化软件开发团队
- 需求分析团队
- 设计评审团队
- 开发执行团队
- 质量保证团队
- 部署运维团队

---

## Wiki 参考资料

- `wiki/guides/agent-teams.md`
- `wiki/sources/claude-agent-teams-full.md`
- `wiki/implementation/agent-teams-implementation.md`
```

- [ ] **Step 2: 提交**

```bash
git add .claude/agents/mentor-ai-programming/modules/teams.md
git commit -m "feat(content): add Agent Teams module course"
```

---

## Phase 3: 进度管理和集成

### Task 9: 创建进度管理模板

**Files:**
- Create: `.claude/agents/mentor-ai-programming/progress/template.md`

- [ ] **Step 1: 编写进度模板**

```markdown
# AI Programming Mentor - 学习进度

## 学习者信息

| 字段 | 内容 |
|------|------|
| 姓名 | |
| 开始日期 | |
| 当前等级 | L |
| 目标 | |

## 模块进度

### Commands 模块
- [ ] L1 入门 (0/3)
  - [ ] 任务 1.1
  - [ ] 任务 1.2
  - [ ] 任务 1.3
- [ ] L2 进阶 (0/3)
  - [ ] 任务 2.1
  - [ ] 任务 2.2
  - [ ] 任务 2.3
- [ ] L3 精通 (0/2)
  - [ ] 综合项目

### Hooks 模块
- [ ] L1 入门 (0/3)
- [ ] L2 进阶 (0/3)
- [ ] L3 精通 (0/1)

### Subagents 模块
- [ ] L1 入门 (0/3)
- [ ] L2 进阶 (0/3)
- [ ] L3 精通 (0/1)

### Workflows 模块
- [ ] L1 入门 (0/3)
- [ ] L2 进阶 (0/3)
- [ ] L3 精通 (0/1)

### Agent Teams 模块
- [ ] L1 入门 (0/3)
- [ ] L2 进阶 (0/3)
- [ ] L3 精通 (0/1)

## 代码审查记录

| 日期 | 模块 | 提交代码 | 评估结果 | 改进点 |
|------|------|----------|----------|--------|

## 学习笔记

### Commands 模块笔记

### Hooks 模块笔记

### Subagents 模块笔记

### Workflows 模块笔记

### Agent Teams 模块笔记

## 总结

### 已掌握技能

### 待提升领域

### 下一步计划
```

- [ ] **Step 2: 提交**

```bash
git add .claude/agents/mentor-ai-programming/progress/template.md
git commit -m "feat(progress): add learning progress template"
```

---

### Task 10: 端到端集成测试

**Files:**
- Modify: `.claude/skills/mentor-ai-programming/SKILL.md` (验证完整性)
- Modify: `.claude/agents/mentor-ai-programming-agent.md` (验证引用)

- [ ] **Step 1: 验证文件结构**

```bash
# 验证目录结构
find .claude -type f -name "*.md" | grep -E "(mentor-ai-programming|commands|hooks|subagents/workflows|teams)" | sort
```

**预期输出**:
```
.claude/agents/mentor-ai-programming-agent.md
.claude/agents/mentor-ai-programming/SYSTEM.md
.claude/agents/mentor-ai-programming/modules/commands.md
.claude/agents/mentor-ai-programming/modules/hooks.md
.claude/agents/mentor-ai-programming/modules/subagents.md
.claude/agents/mentor-ai-programming/modules/workflows.md
.claude/agents/mentor-ai-programming/modules/teams.md
.claude/agents/mentor-ai-programming/progress/template.md
.claude/skills/mentor-ai-programming/SKILL.md
```

- [ ] **Step 2: 验证 Skill 语法**

```bash
# 检查 frontmatter
head -10 .claude/skills/mentor-ai-programming/SKILL.md
```

- [ ] **Step 3: 验证 Agent 语法**

```bash
# 检查 frontmatter
head -20 .claude/agents/mentor-ai-programming-agent.md
```

- [ ] **Step 4: 提交最终版本**

```bash
git add -A
git commit -m "feat: complete mentor-ai-programming implementation

Phase 1: Skill + Agent 基础框架
Phase 2: 五大模块课程内容
Phase 3: 进度管理模板

Modules: Commands, Hooks, Subagents, Workflows, Agent Teams
Levels: L1 入门, L2 进阶, L3 精通"
```

---

## 实施检查清单

| 阶段 | 任务 | 状态 |
|------|------|------|
| Phase 1 | Task 1: Skill 入口 | ⬜ |
| Phase 1 | Task 2: Agent 定义 | ⬜ |
| Phase 1 | Task 3: Agent 系统提示词 | ⬜ |
| Phase 2 | Task 4: Commands 模块 | ⬜ |
| Phase 2 | Task 5: Hooks 模块 | ⬜ |
| Phase 2 | Task 6: Subagents 模块 | ⬜ |
| Phase 2 | Task 7: Workflows 模块 | ⬜ |
| Phase 2 | Task 8: Agent Teams 模块 | ⬜ |
| Phase 3 | Task 9: 进度模板 | ⬜ |
| Phase 3 | Task 10: 集成测试 | ⬜ |

---

## Spec 覆盖检查

| 设计文档章节 | 对应任务 |
|-------------|---------|
| 2.1 整体架构 | Task 1-3 |
| 3.1 五大教学模块 | Task 4-8 |
| 3.2 三阶式难度 | Task 4-8 (L1/L2/L3) |
| 4.1 快速/学习模式 | Task 3 (SYSTEM.md) |
| 5.1 代码审查评估 | Task 3, Task 10 |
| 6.1 混合知识调用 | Task 3 (Wiki 查询) |
| 7.1 Skill 接口 | Task 1 |
| 8.1 Phase 1-4 | Task 1-10 |

**所有设计章节均已覆盖 ✓**
