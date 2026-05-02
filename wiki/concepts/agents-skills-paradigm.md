---
name: concepts/agents-skills-paradigm
description: Agent Skills 范式：通用智能体 + 技能组合 vs 专用智能体
type: concept
tags: [claude, anthropic, agents, skills, mcp]
created: 2026-05-01
updated: 2026-05-01
source: ../../archive/concepts/building-agents-with-skills-2026-05-01.md
---

# Agent Skills 范式

## 核心转变

从专用智能体转向通用智能体 + 技能组合的架构范式。

**传统模式**：
- 不同领域 = 不同智能体（编程智能体、研究智能体、金融智能体...）
- 每个智能体需要独立工具和脚手架

**新范式**：
- 通用智能体（Claude Code）+ 技能库 + MCP 服务器
- 代码作为通用接口，几乎可以完成任何数字工作

## 为什么选择代码作为接口

Claude Code 既是编程智能体，也是通过代码工作的通用智能体：

**示例：生成财务报告**
```python
# API 研究调用
# 文件系统存储数据
# Python 分析数据
# 综合洞察
```

所有操作通过代码完成，脚手架简化为 bash + 文件系统。

## 缺失的一环：领域专业知识

**比喻**：谁更适合报税？
- 数学天才（从第一性原理推导） vs 经验丰富的税务专业人员

**现状**：智能体像数学天才 — 推理能力强，但缺乏领域专家的积累经验。

**Skills 解决方案**：封装领域专业知识，格式化为智能体可访问和应用的形式。

## Agent Skills 是什么

Skills 是封装领域专业知识和程序化知识的技能包。

**文件结构示例**：
```
anthropic_brand/
├── SKILL.md          # 主要技能文档
├── docs.md           # 支持文档
├── slide-decks.md    # 特定场景指南
└── apply_template.py # 可执行脚本（工具）
```

**设计原则**：
- 文件作为通用原语（支持 Git、Google Drive、团队共享）
- 技能创建不限于工程师（产品经理、分析师、领域专家均可创建）

## 渐进式披露

为保护上下文窗口并支持组合，Skills 使用三层加载：

| 层级 | 内容 | Token 使用 | 加载时机 |
|------|------|-----------|---------|
| **Metadata** | name + description | ~50 | 始终加载 |
| **SKILL.md** | 完整技能文档 | ~500 | 技能触发时 |
| **References** | 参考资料/脚本 | 2000+ | 按需加载 |

**优势**：可为智能体装备数百个技能而不压垮上下文窗口。

## Skills 可包含脚本作为工具

**传统工具的问题**：
- 说明文档质量参差
- 智能体难以修改或扩展
- 经常膨胀上下文窗口

**代码的优势**：
- 自文档化
- 可修改
- 无需始终在上下文中

**真实示例**：
```python
# anthropic/brand_styling/apply_template.py
import sys
from pptx import Presentation

if len(sys.argv) != 2:
    print("USAGE: apply_template.py <pptx>")
    sys.exit(1)

prs = Presentation(sys.argv[1])
for slide in prs.slides:
    # 应用 Anthropic 样式...
```

## Skills 生态系统

### 基础技能
提供核心能力：文档操作、电子表格、演示文稿等。
编码文档生成和操作的最佳实践。
[公共技能库示例](https://github.com/anthropics/skills/tree/main/skills/public)

### 合作伙伴技能
公司构建技能使其服务可被智能体访问：
- **K-Dense**: 科学计算技能
- **Browserbase**: 浏览器自动化
- **Notion**: Notion 集成
- [更多组织技能](https://claude.com/blog/organization-skills-and-directory)

### 企业技能
组织构建专有技能编码内部流程和领域专业知识：
- 特定工作流程
- 合规要求
- 制度知识

## 趋势观察

### 复杂度增加
早期技能只是简单文档引用，现在发展为复杂的多步骤工作流：

| 级别 | 示例 | 行数 | 特点 |
|------|------|------|------|
| **简单** | 状态报告撰写器 | ~100 | 模板和格式化 |
| **中级** | 财务模型构建器 | ~800 | 数据检索、Excel 建模 |
| **复杂** | RNA 测序管道 | 2500+ | 协调多个工具（HISAT2、StringTie、DESeq2） |

### Skills 与 MCP 协同
[Skills 和 MCP 服务器自然协作](https://claude.com/blog/extending-claude-capabilities-with-skills-mcp-servers)。

**竞争分析技能示例**：
```
Web 搜索 → 内部数据库 (MCP) → Slack 消息历史 → Notion 页面
         ↓
综合报告
```

### 非开发者采用
技能创建扩展到产品经理、分析师、领域专家：
- 使用 skill-creator 工具交互式创建
- 30 分钟内创建并测试首个技能
- 改进工具和模板让技能创建更易用

## 完整架构

```
┌─────────────────────────────────────┐
│        Agent loop (推理系统)         │
├─────────────────────────────────────┤
│      Agent runtime (执行环境)        │
│         (代码, 文件系统)             │
├─────────────────────────────────────┤
│    MCP servers (外部工具和数据)      │
├─────────────────────────────────────┤
│     Skills library (领域专业知识)     │
└─────────────────────────────────────┘
```

**各层职责**：
- Loop: 推理决策
- Runtime: 执行操作
- MCP: 连接外部
- Skills: 引导执行

**案例**：[前端设计技能](https://github.com/anthropics/claude-code/tree/main/plugins/frontend-design)
- 提供排版、色彩理论、动画专业指导
- 仅在构建 Web 界面时激活
- 渐进式披露减少开销
- 添加新能力简单直接

## 垂直领域部署

### 金融服务
[Claude for Financial Services](https://www.anthropic.com/news/claude-for-financial-services) 专业技能：

- **DCF 模型构建器**：WACC 计算、敏感性分析
- **可比公司分析**：相关倍数、基准测试
- **盈利分析**：季度结果处理、投资更新报告
- **发起覆盖**：财务模型综合研究报告
- **尽职调查**：M&A 分析标准化框架
- **演示材料**：客户演示行业标准

### 医疗健康与生命科学
[Healthcare & Life Sciences](https://www.anthropic.com/news/healthcare-life-sciences) 专业技能：

- **生物信息学包**：scVI-tools、Nextflow 部署（基因组管道、单细胞 RNA 测序）
- **临床试验方案生成**：加速临床研究方案开发
- **科学问题选择**：帮助识别和塑造影响力研究方向
- **FHIR 开发**：健康数据互操作性代码准确性
- **事先授权审查**：交叉引用覆盖要求、临床指南、患者记录

## Agent Skills 标准化

正在发布 [Agent Skills](https://agentskills.io/) 作为开放标准。

**目标**：
- 像 MCP 一样，技能应在工具和平台间可移植
- 同一技能适用于 Claude 或其他 AI 平台
- 社区构建的技能让所有智能体更有用、更可靠、更强大

## 相关资源

- [YouTube: Don't Build Agents, Build Skills Instead](https://youtu.be/CEvIs9y1uog?si=yhYQH-ZTX0DfNdtm)
- [技能文档](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)
- [GitHub 仓库](https://github.com/anthropics/skills)
- [技能 Cookbook](https://platform.claude.com/cookbook/skills-notebooks-01-skills-introduction)
- [在 Claude 中使用技能](https://support.claude.com/en/articles/12512180-using-skills-in-claude)
- [技能 API 快速开始](https://platform.claude.com/docs/en/build-with-claude/skills-guide)
- [技能最佳实践文档](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)

## 致谢

Barry Zhang, Mahesh Murag, Keith Lazuka, Ryan Whitehead
