---
name: tutorials/agent-concepts-principles-patterns
description: Agent 概念、原理与构建模式 — 从零打造简化版 Claude Code，涵盖 ReAct 与 Plan-And-Execute 模式
type: tutorial
tags: [tutorial, agent, react, plan-and-execute, llm, gpt-4o, python]
created: 2026-05-04
updated: 2026-05-04
source: ../../../archive/clippings/bilibili/2026-05-04-agent-concepts-principles-patterns/原始字幕.md
related:
  - "[[tutorials/claude-code-complete-guide]]"
  - "[[concepts/agentic-ai-design-patterns]]"
  - "[[tutorials/agentic-ai-course]]"
---

# Agent 概念、原理与构建模式

基于马克的技术工作坊视频教程，BVID: BV1TSg7zuEqR，时长 28 分钟。

## 课程概述

本教程系统讲解 AI Agent 的核心概念、实现原理和构建模式，从零开始打造一个简化版的 Claude Code。

**学习目标**：
1. 理解 Agent 的本质定义和核心组件
2. 掌握 ReAct（Reasoning and Acting）模式的设计与实现
3. 学习 Plan-And-Execute 高级模式
4. 动手实现基于 GPT-4o 的 ReAct Agent

## Agent 概念定义

### 什么是 Agent

> [!tip] 核心定义
> **Agent** 是配备工具的 AI 系统，能够感知外部环境并对外部环境进行改变。

**类比理解**：
- **大模型（LLM）** = 大脑
- **工具（Tools）** = 感官 + 四肢
  - 感官（传感器）：读取文件、搜索网络、查询数据库
  - 四肢（执行器）：写入文件、执行命令、调用 API

**现实世界案例**：
- **Cursor** — AI 编程 Agent，配备代码读取、修改、终端执行等工具
- **Manus** — AI 游戏操作 Agent，配备屏幕识别、鼠标键盘控制等工具

### Agent 三大组件

| 组件 | 作用 | 示例 |
|------|------|------|
| **模型（Model）** | 负责思考和决策 | GPT-4o、Claude 3.5 |
| **工具（Tools）** | 感知和改变外部环境 | read_file、write_to_file、search |
| **主程序（Main Program）** | 协调模型和工具的交互逻辑 | Python 控制流 |

## ReAct 模式详解

### 基本流程

ReAct = **Re**asoning（推理）+ **Act**ing（行动）

```
┌─────────────────────────────────────────────────┐
│                  ReAct 循环                     │
├─────────────────────────────────────────────────┤
│  1. Thought（思考）: 分析当前情况               │
│  2. Action（行动）: 选择并执行工具              │
│  3. Observation（观察）: 获取工具执行结果       │
│  4. 重复 1-3 直到能够给出最终答案              │
└─────────────────────────────────────────────────┘
```

### 关键特性

| 特性 | 说明 |
|------|------|
| **自主决策** | Agent 自己决定下一步做什么 |
| **工具调用** | 通过工具与外部环境交互 |
| **迭代优化** | 根据观察结果调整行动策略 |
| **最终答案** | 完成任务后给出总结性答案 |

### 运行示例

**用户问题**："2025 年澳网男子冠军的家乡是哪里？"

**ReAct 执行流程**：

```
Thought: 我需要先查询当前日期，然后查询澳网男子冠军
Action: search("2025年澳大利亚网球公开赛男子冠军")
Observation: 搜索结果显示：2025年澳网男子冠军是诺瓦克·德约科维奇

Thought: 现在我需要查询德约科维奇的家乡
Action: search("诺瓦克·德约科维奇家乡")
Observation: 搜索结果显示：德约科维奇来自塞尔维亚贝尔格莱德

Thought: 我已经收集到所有需要的信息
Final Answer: 2025年澳网男子冠军诺瓦克·德约科维奇的家乡是塞尔维亚贝尔格莱德
```

## ReAct 实现原理

### System Prompt 设计

使用 XML 标签结构化 Agent 的思考过程：

```xml
你是一个配备工具的 AI Agent。请按照以下格式工作：

<thought>
分析当前情况，决定下一步行动
</thought>

<action>
工具名称(参数)
</action>

<observation>
工具执行结果（由系统自动填充）
</observation>

重复以上步骤，直到你能给出最终答案：

<final_answer>
你的最终答案
</final_answer>
```

### 工具调用机制

**工具定义**：
```python
tools = {
    "read_file": {
        "description": "读取文件内容",
        "parameters": {"file_path": "str"}
    },
    "write_to_file": {
        "description": "写入内容到文件",
        "parameters": {"file_path": "str", "content": "str"}
    },
    "run_terminal_command": {
        "description": "执行终端命令",
        "parameters": {"command": "str"}
    }
}
```

**调用流程**：
1. LLM 输出 `<action>read_file("test.txt")</action>`
2. Agent 主程序解析工具调用
3. 执行实际函数并获取结果
4. 将结果包装为 `<observation>...</observation>` 返回给 LLM
5. LLM 基于观察结果继续思考

## 动手实现 ReAct Agent

### 环境准备

```bash
# 安装依赖
pip install openai

# 设置 API Key
export OPENAI_API_KEY="your-api-key"
```

### 核心代码实现

```python
from openai import OpenAI
import json

client = OpenAI()

# 定义可用工具
tools = {
    "read_file": {
        "description": "读取文件内容",
        "function": lambda file_path: open(file_path).read()
    },
    "write_to_file": {
        "description": "写入内容到文件",
        "function": lambda file_path, content: open(file_path, 'w').write(content)
    },
    "run_terminal_command": {
        "description": "执行终端命令",
        "function": lambda command: subprocess.run(command, shell=True, capture_output=True).stdout
    }
}

# Agent System Prompt
SYSTEM_PROMPT = """你是一个配备工具的 AI Agent。

可用工具：
- read_file(file_path): 读取文件
- write_to_file(file_path, content): 写入文件
- run_terminal_command(command): 执行命令

请按照以下格式工作：

<thought>
你的思考过程
</thought>

<action>
工具名称(参数)
</action>

<observation>
工具执行结果（由系统自动填充）
</observation>

重复以上步骤，直到你能给出最终答案：

<final_answer>
最终答案
</final_answer>
"""

def run_react_agent(user_question):
    messages = [
        {"role": "system", "content": SYSTEM_PROMPT},
        {"role": "user", "content": user_question}
    ]

    while True:
        # 调用 LLM
        response = client.chat.completions.create(
            model="gpt-4o",
            messages=messages
        )

        content = response.choices[0].message.content
        messages.append({"role": "assistant", "content": content})

        # 检查是否给出最终答案
        if "<final_answer>" in content:
            return content

        # 解析工具调用
        if "<action>" in content:
            # 提取工具调用（简化实现）
            # 执行工具并获取结果
            observation = execute_tool(content)

            # 构造 observation
            obs_content = f"<observation>\n{observation}\n</observation>"
            messages.append({"role": "user", "content": obs_content})
```

### 运行演示

```python
# 示例：创建 Python 文件并执行
user_question = """
请创建一个名为 hello.py 的文件，内容是打印"Hello, Agent!"，
然后执行这个文件，告诉我输出结果。
"""

result = run_react_agent(user_question)
print(result)
```

**Agent 执行流程**：

```
<thought>
用户要求我创建一个 Python 文件并执行。我需要：
1. 使用 write_to_file 创建 hello.py
2. 使用 run_terminal_command 执行它
</thought>

<action>
write_to_file("hello.py", "print('Hello, Agent!')")
</action>

<observation>
文件写入成功
</observation>

<thought>
文件已创建，现在执行它
</thought>

<action>
run_terminal_command("python hello.py")
</action>

<observation>
Hello, Agent!
</observation>

<thought>
任务完成，文件已创建并成功执行
</thought>

<final_answer>
已创建文件 hello.py 并执行，输出结果为："Hello, Agent!"
</final_answer>
```

## ReAct 运行时序图

```
用户问题
    ↓
┌─────────────────────────────────────┐
│  Agent 主程序                        │
│  ┌─────────────────────────────┐   │
│  │ 1. 发送消息给 LLM            │   │
│  │    (user_question)          │   │
│  └─────────────────────────────┘   │
│              ↓                      │
│  ┌─────────────────────────────┐   │
│  │ 2. LLM 返回响应              │   │
│  │    <action>tool()</action>   │   │
│  └─────────────────────────────┘   │
│              ↓                      │
│  ┌─────────────────────────────┐   │
│  │ 3. 解析工具调用              │   │
│  │    execute_tool()           │   │
│  └─────────────────────────────┘   │
│              ↓                      │
│  ┌─────────────────────────────┐   │
│  │ 4. 执行实际工具函数          │   │
│  │    (read/write/exec)        │   │
│  └─────────────────────────────┘   │
│              ↓                      │
│  ┌─────────────────────────────┐   │
│  │ 5. 包装为 observation        │   │
│  │    <observation>result</obs>│   │
│  └─────────────────────────────┘   │
│              ↓                      │
│  ┌─────────────────────────────┐   │
│  │ 6. 发送回 LLM                │   │
│  └─────────────────────────────┘   │
│              ↓                      │
│         循环直到 <final_answer>     │
└─────────────────────────────────────┘
    ↓
最终答案
```

## Plan-And-Execute 模式

### 基本概念

Plan-And-Execute = **规划阶段** + **执行阶段**

将复杂任务分解为两阶段：
1. **Plan（规划）**：先生成完整的执行计划
2. **Execute（执行）**：按计划逐步执行，动态调整

### 架构设计

```
┌─────────────────────────────────────────────────┐
│           Plan-And-Execute 流程                 │
├─────────────────────────────────────────────────┤
│                                                  │
│  用户问题                                       │
│    ↓                                             │
│  ┌──────────────────────────────────────┐      │
│  │  Plan 阶段                            │      │
│  │  - 分析用户需求                        │      │
│  │  - 生成执行步骤列表                    │      │
│  └──────────────────────────────────────┘      │
│    ↓                                             │
│  ┌──────────────────────────────────────┐      │
│  │  Execute 阶段（循环）                 │      │
│  │  ┌──────────────────────────────┐    │      │
│  │  │ Step 1: 执行当前步骤           │    │      │
│  │  │   - 使用 ReAct Agent          │    │      │
│  │  │   - 返回执行结果               │    │      │
│  │  └──────────────────────────────┘    │      │
│  │    ↓                                   │      │
│  │  ┌──────────────────────────────┐    │      │
│  │  │ Replan 阶段                    │    │      │
│  │  │   - 根据执行结果调整计划        │    │      │
│  │  │   - 更新剩余步骤                │    │      │
│  │  └──────────────────────────────┘    │      │
│  │    ↓                                   │      │
│  │  检查：所有步骤是否完成？               │      │
│  │    ├─ 是 → 返回最终答案                │      │
│  │    └─ 否 → 继续下一步                  │      │
│  └──────────────────────────────────────┘      │
│                                                  │
└─────────────────────────────────────────────────┘
```

### 执行流程示例

**用户问题**："2025年澳网男子冠军的家乡是哪里？"

**Plan 阶段输出**：
```json
[
  {"step": 1, "action": "查询当前日期"},
  {"step": 2, "action": "查询{当前年份}年澳网男子冠军名字"},
  {"step": 3, "action": "查询{冠军名字}的家乡"}
]
```

**Execute 阶段（三轮循环）**：

**第一轮**：
- **执行**：查询当前日期 → 2025年
- **Replan**：将第二步具体化为"查询2025年澳网男子冠军名字"

**第二轮**：
- **执行**：查询2025年澳网男子冠军 → 诺瓦克·德约科维奇
- **Replan**：将第三步具体化为"查询诺瓦克·德约科维奇的家乡"

**第三轮**：
- **执行**：查询德约科维奇家乡 → 塞尔维亚贝尔格莱德
- **Replan**：所有步骤完成，返回最终答案

### Replan 策略

| 情况 | Replan 行为 |
|------|-------------|
| 获取新信息 | 将后续步骤中的占位符替换为具体值 |
| 执行失败 | 调整策略或尝试替代方案 |
| 发现捷径 | 简化或合并剩余步骤 |
| 任务完成 | 返回最终答案 |

### 代码实现

```python
def plan_and_execute(user_question):
    # Plan 阶段
    plan = generate_plan(user_question)

    execution_history = []

    # Execute 阶段（循环）
    while True:
        # 取出当前要执行的步骤
        current_step = plan[0]

        # 使用 ReAct Agent 执行
        result = execute_step_with_react(current_step)
        execution_history.append(result)

        # Replan 阶段
        response = replan_model(
            user_question=user_question,
            original_plan=plan,
            execution_history=execution_history
        )

        # 检查是否完成
        if response["status"] == "completed":
            return response["final_answer"]
        else:
            # 更新计划
            plan = response["updated_plan"]
```

## 两种模式对比

| 特性 | ReAct | Plan-And-Execute |
|------|-------|------------------|
| **决策方式** | 逐步思考决策 | 先规划后执行 |
| **灵活性** | 高（随时调整） | 中（按计划调整） |
| **复杂任务** | 可能迷失方向 | 结构化执行 |
| **实现难度** | 较简单 | 需要额外 Plan 模型 |
| **适用场景** | 简单到中等任务 | 复杂多步骤任务 |

## 课程资源

- **视频来源**：马克的技术工作坊
- **BVID**：BV1TSg7zuEqR
- **时长**：28 分钟
- **字幕语言**：中文
- **LangChain 官方实现**：Plan-And-Execute 完整代码可从 LangChain 官方文档获取

## 后续学习路径

1. **[[tutorials/agentic-ai-course]]** — 吴恩达 Agentic AI 系统课程
2. **[[concepts/agentic-ai-design-patterns]]** — Agent 设计模式深入
3. **[[tutorials/claude-code-complete-guide]]** — Claude Code 完整使用指南

> [!tip] 学习建议
> 本教程建议配合代码实践学习：
> 1. 先理解 ReAct 模式的基本原理
> 2. 动手实现简化版 ReAct Agent
> 3. 尝试扩展工具集合（文件操作、网络搜索等）
> 4. 学习 Plan-And-Execute 高级模式
> 5. 参考 LangChain 官方实现深入优化

## 相关页面

- [[tutorials/agentic-ai-examples]] — Agent 代码示例集合
- [[concepts/multi-agent-systems]] — 多智能体系统概念
- [[concepts/agentic-coding-benefits]] — Agentic Coding 优势分析
