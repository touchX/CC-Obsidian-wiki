---
name: agent-skills-platform-usage
description: Agent Skills 多平台使用指南 - Claude AI、Claude Code、Claude API、Agent SDK
type: guide
tags: [agent-skills, guide, platform, tutorial]
created: 2026-05-04
updated: 2026-05-04
source: ../../../archive/clippings/bilibili/2026-05-04-agent-skills-course/
---

# Agent Skills 平台使用指南

> [!info] 适用场景
> - 选择合适的平台开发和测试技能
> - 理解不同平台的技能加载机制
> - 实现跨平台技能迁移

本指南综合吴恩达 Agent Skills 课程 Lesson 07-09，系统讲解如何在 Claude AI、Claude Code、Claude API 和 Agent SDK 四个平台上使用 Agent Skills。

---

## 一、平台概览

### 1.1 平台对比

| 平台 | 类型 | 适用场景 | 核心能力 | 技能加载方式 |
|------|------|----------|----------|-------------|
| **Claude AI** | Web 界面 | 交互式测试、快速验证 | 拖拽式技能加载、实时测试 | 拖拽文件夹到界面 |
| **Claude Code** | CLI 工具 | 项目级开发、自动化 | 项目技能、子代理协作 | 项目 `.claude/skills/` 目录 |
| **Claude API** | 编程接口 | 自动化工作流、批量处理 | 代码执行工具、文件 API | API 上传技能目录 |
| **Agent SDK** | 应用框架 | 构建自主应用、企业级 | MCP 集成、多代理编排 | 编程配置技能工具 |

### 1.2 选择决策树

```
需要交互式测试？
├─ 是 → Claude AI（拖拽即用）
└─ 否 → 需要编程集成？
    ├─ 是 → 需要复杂编排？
    │   ├─ 是 → Agent SDK（多代理、MCP）
    │   └─ 否 → Claude API（简单自动化）
    └─ 否 → Claude Code（项目级开发）
```

---

## 二、Claude AI

### 2.1 界面操作

#### 技能加载步骤

1. **准备技能目录**
   ```
   my-skill/
   ├── SKILL.md
   └── references/
   ```

2. **拖拽上传**
   - 直接将技能文件夹拖拽到 Claude AI 界面
   - 系统自动识别 SKILL.md 和相关资源

3. **验证加载**
   - 查看已加载技能列表
   - 测试技能是否正常触发

### 2.2 使用场景

**最佳场景**：
- ✅ 快速原型验证
- ✅ 交互式调试
- ✅ 演示和教学

**限制**：
- ❌ 不支持自动化批量处理
- ❌ 无法集成到现有应用
- ❌ 无编程接口

### 2.3 技能继承规则

> [!warning] 重要
> **子代理不继承父代理的技能**
>
> 在 Claude AI 中创建子代理时，子代理不会自动继承父代理加载的技能。需要显式为子代理加载所需技能。

---

## 三、Claude Code

### 3.1 项目配置

#### CLAUDE.md 配置

```markdown
# CLAUDE.md

## 项目技能

本项目使用以下 Agent Skills：

### 技能目录结构
```
.claude/skills/
├── analyzing-time-series/
│   ├── SKILL.md
│   ├── scripts/
│   └── references/
└── generating-quiz-questions/
    ├── SKILL.md
    └── assets/
```

### 启用技能
- 技能自动从 `.claude/skills/` 目录加载
- 使用 `/skills` 命令查看已加载技能
```

### 3.2 技能开发工作流

#### 步骤 1：创建技能目录

```bash
mkdir -p .claude/skills/my-skill/{scripts,references}
```

#### 步骤 2：编写 SKILL.md

```markdown
# My Skill

## 功能描述
分析数据并生成报告

## 使用场景
- 数据分析
- 报告生成

## 工作流程
1. 读取数据
2. 执行分析
3. 生成报告
```

#### 步骤 3：测试技能

```bash
# 在 Claude Code 中
/skills  # 查看已加载技能
```

#### 步骤 4：调试和迭代

- 使用 Claude Code 的交互式测试
- 查看技能日志输出
- 根据反馈优化技能

### 3.3 子代理协作

#### 子代理配置

```markdown
# 在 SKILL.md 中调用子代理

## 子代理配置

创建专门的子代理执行特定任务：

```
agent: code-reviewer
description: 代码审查专家
tools: [read, grep]
skills: []
```

调用子代理执行审查任务。
```

### 3.4 CLI 命令

| 命令 | 功能 |
|------|------|
| `/skills` | 列出已加载技能 |
| `/skill-info <name>` | 查看技能详情 |
| `/reload-skills` | 重新加载技能 |

---

## 四、Claude API

### 4.1 技能上传

#### Python SDK 示例

```python
import anthropic

client = anthropic.Anthropic(api_key="your-api-key")

# 上传技能目录
skill_path = "path/to/skill-folder"
response = client.beta.skills.create(
    name="generating-quiz-questions",
    path=skill_path
)

skill_id = response.id
print(f"Skill uploaded: {skill_id}")
```

### 4.2 技能调用

#### 基本调用

```python
# 使用技能生成内容
message = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    beta=["skills-2024-10-22"],
    skills=[skill_id],
    max_tokens=1024,
    messages=[
        {
            "role": "user",
            "content": "使用技能生成练习题"
        }
    ]
)

print(message.content)
```

### 4.3 代码执行工具

```python
# 技能中执行代码
message = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    beta=["skills-2024-10-22", "code-exec-2024-10-22"],
    skills=[skill_id],
    tools=[
        {
            "type": "code_execution",
            "code": "import pandas as pd\ndf = pd.read_csv('data.csv')\nprint(df.describe())"
        }
    ],
    max_tokens=1024,
    messages=[{"role": "user", "content": "分析数据"}]
)
```

### 4.4 文件 API

```python
# 读取文件内容
with open("lecture.md", "rb") as f:
    file_content = f.read()

message = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    beta=["skills-2024-10-22"],
    skills=[skill_id],
    max_tokens=1024,
    messages=[
        {
            "role": "user",
            "content": [
                {
                    "type": "image",
                    "source": {
                        "type": "base64",
                        "media_type": "text/markdown",
                        "data": file_content
                    }
                },
                {
                    "type": "text",
                    "text": "生成练习题"
                }
            ]
        }
    ]
)
```

---

## 五、Agent SDK

### 5.1 架构概述

```
Agent SDK 应用
├── 主代理（Orchestrator）
│   ├── 技能工具（Skill Tools）
│   └── 子代理（Subagents）
└── MCP 服务器
    ├── 数据访问
    └── 外部工具
```

### 5.2 技能工具配置

```python
from anthropic import Anthropic
from anthropic.types import SkillTool

client = Anthropic(api_key="your-api-key")

# 定义技能工具
skill_tool = SkillTool(
    name="generating-quiz",
    description="生成教育练习题",
    skill_path="skills/generating-quiz-questions/",
    type="skill"
)

# 创建代理
agent = client.agents.create(
    name="quiz-generator",
    model="claude-3-5-sonnet-20241022",
    tools=[skill_tool],
    instructions="使用技能生成练习题"
)
```

### 5.3 MCP 集成

#### Notion MCP 示例

```python
# 配置 MCP 服务器
mcp_server = {
    "name": "notion-mcp",
    "command": "npx",
    "args": ["-y", "@notionhq/client", "mcp-server"],
    "env": {
        "NOTION_API_KEY": "your-api-key",
        "NOTION_DATABASE_ID": "your-database-id"
    }
}

# 创建带 MCP 的代理
agent = client.agents.create(
    name="notion-integration",
    model="claude-3-5-sonnet-20241022",
    tools=[skill_tool],
    mcp_servers=[mcp_server],
    instructions="使用 Notion MCP 访问数据库并生成报告"
)
```

### 5.4 子代理编排

#### 定义子代理

```python
from anthropic.types import AgentDefinition

# 子代理 1：文档研究员
doc_researcher = AgentDefinition(
    name="doc-researcher",
    description="文档研究专家",
    model="claude-3-5-sonnet-20241022",
    tools=["web-search", "web-fetch"],
    skills=[],
    instructions="搜索和提取文档信息"
)

# 子代理 2：内容生成器
content_generator = AgentDefinition(
    name="content-generator",
    description="内容生成专家",
    model="claude-3-5-sonnet-20241022",
    tools=[skill_tool],
    skills=["generating-quiz-questions"],
    instructions="基于研究结果生成内容"
)

# 主代理编排
main_agent = client.agents.create(
    name="research-and-generate",
    model="claude-3-5-sonnet-20241022",
    subagents=[doc_researcher, content_generator],
    instructions="协调子代理完成研究和生成任务"
)
```

#### 并行执行

```python
# 并行调用多个子代理
async def parallel_research(query):
    tasks = [
        doc_researcher.ainvoke(query),
        content_generator.ainvoke(query)
    ]
    results = await asyncio.gather(*tasks)
    return results
```

### 5.5 研究代理架构

```python
# 研究代理示例
research_agent = client.agents.create(
    name="learning-guide-generator",
    model="claude-3-5-sonnet-20241022",
    tools=[
        SkillTool(
            name="generating-quiz",
            skill_path="skills/generating-quiz-questions/"
        )
    ],
    mcp_servers=[
        {
            "name": "notion-mcp",
            "command": "npx",
            "args": ["-y", "@notionhq/client", "mcp-server"],
            "env": {
                "NOTION_API_KEY": os.getenv("NOTION_API_KEY"),
                "NOTION_DATABASE_ID": os.getenv("NOTION_DATABASE_ID")
            }
        }
    ],
    subagents=[
        AgentDefinition(
            name="doc-researcher",
            description="文档研究员",
            tools=["web-search", "web-fetch"],
            skills=[]
        )
    ],
    instructions="""
    使用 Notion MCP 访问文档数据库，
    协调子代理进行研究，
    使用技能生成学习指南
    """
)
```

---

## 六、跨平台迁移

### 6.1 技能可移植性

**核心原则**：
- ✅ 技能目录结构标准化
- ✅ SKILL.md 格式统一
- ✅ 使用相对路径
- ✅ 避免平台特定功能

### 6.2 迁移检查清单

```
[ ] 目录结构符合标准
[ ] SKILL.md <500 行
[ ] 使用正斜杠路径
[ ] 无硬编码绝对路径
[ ] 描述包含使用场景
[ ] 测试跨平台兼容性
```

### 6.3 平台差异处理

| 特性 | Claude AI | Claude Code | Claude API | Agent SDK |
|------|-----------|-------------|------------|-----------|
| 技能加载 | 拖拽 | 自动 | API | 编程 |
| 子代理 | 支持 | 支持 | 不支持 | 支持 |
| MCP | 不支持 | 支持 | 支持 | 支持 |
| 代码执行 | 不支持 | 支持 | 支持 | 支持 |

---

## 七、实战案例

### 案例 1：学习指南生成器

**需求**：从 Notion 数据库读取文档，生成学习指南和练习题

**实现**：
```python
# Agent SDK 实现
agent = client.agents.create(
    name="learning-guide-generator",
    model="claude-3-5-sonnet-20241022",
    tools=[
        SkillTool(
            name="generating-quiz",
            skill_path="skills/generating-quiz-questions/"
        )
    ],
    mcp_servers=[
        {
            "name": "notion-mcp",
            "command": "npx",
            "args": ["-y", "@notionhq/client", "mcp-server"],
            "env": {
                "NOTION_API_KEY": os.getenv("NOTION_API_KEY"),
                "NOTION_DATABASE_ID": os.getenv("NOTION_DATABASE_ID")
            }
        }
    ],
    subagents=[
        AgentDefinition(
            name="doc-researcher",
            description="文档研究员",
            tools=["web-search", "web-fetch"],
            skills=[]
        )
    ],
    instructions="""
    1. 使用 Notion MCP 访问文档数据库
    2. 协调子代理进行研究
    3. 使用技能生成学习指南和练习题
    """
)

# 执行
result = agent.agents.invoke(
    agent_id="learning-guide-generator",
    messages=[{"role": "user", "content": "生成 Python 学习指南"}]
)
```

### 案例 2：营销活动分析

**需求**：分析营销数据，提供预算重新分配建议

**实现**：
```bash
# Claude Code 实现
# 1. 创建技能目录
mkdir -p .claude/skills/marketing-campaign-analysis/references

# 2. 编写 SKILL.md
cat > .claude/skills/marketing-campaign-analysis/SKILL.md << 'EOF'
# 营销活动分析技能

## 功能
分析营销数据，提供预算重新分配建议

## 工作流程
1. 读取营销数据
2. 应用分配规则（references/rules.md）
3. 生成对比方案
4. 输出建议
EOF

# 3. 使用技能
# 在 Claude Code 中直接使用
```

---

## 八、故障排查

### 8.1 常见问题

| 问题 | 可能原因 | 解决方案 |
|------|----------|----------|
| 技能未加载 | 路径错误 | 检查 `.claude/skills/` 路径 |
| 技能不触发 | 描述不清 | 优化 description 字段 |
| 子代理无技能 | 未显式加载 | 为子代理单独加载技能 |
| MCP 连接失败 | 配置错误 | 检查 MCP 服务器配置 |

### 8.2 调试技巧

**Claude AI**：
- 查看已加载技能列表
- 测试技能触发条件
- 检查技能日志

**Claude Code**：
- 使用 `/skills` 命令
- 查看 `.claude/skills/` 目录
- 检查 CLAUDE.md 配置

**Claude API**：
- 使用 `client.beta.skills.list()` 查看技能
- 检查技能 ID 是否正确
- 查看 API 响应错误信息

**Agent SDK**：
- 使用 `client.agents.get()` 查看代理配置
- 检查 MCP 服务器状态
- 查看子代理日志

---

## 九、最佳实践

### 9.1 开发流程

```
1. 在 Claude AI 中快速原型
2. 迁移到 Claude Code 进行项目级开发
3. 使用 Claude API 实现自动化
4. 必要时使用 Agent SDK 构建复杂应用
```

### 9.2 技能设计原则

- **渐进式披露**：元数据 → 指令 → 资源
- **跨平台兼容**：避免平台特定功能
- **描述优化**：包含使用场景和触发关键词
- **测试驱动**：在多个平台测试技能

---

## 十、相关资源

### 官方文档
- [Claude API Documentation](https://docs.anthropic.com)
- [Agent SDK GitHub](https://github.com/anthropics/anthropic-sdk-python)

### Wiki 相关页面
- [[agent-skills-andrew-ng-course]] - 课程总览
- [[agent-skills-best-practices]] - 最佳实践
- [[agent-skills-progressive-disclosure]] - 渐进式披露机制
- [[agent-skills-examples]] - 实战案例

---

*最后更新: 2026-05-04*
*来源: 吴恩达 Agent Skills 课程 Lesson 07-09*
