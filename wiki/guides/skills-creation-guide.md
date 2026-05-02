---
name: guides/skills-creation-guide
description: Skills 创建指南：5 步流程构建自定义 Claude 技能，包含实际示例和最佳实践
type: guide
tags: [claude, skills, customization, how-to, examples]
created: 2026-05-01
updated: 2026-05-01
source: ../../archive/guides/skills-creation-2026-05-01.md
---

# Skills 创建指南

## 概述

[Skills](https://www.claude.com/blog/skills) 是扩展 Claude 能力的自定义指令，用于特定任务或领域。

通过创建 [SKILL.md](https://github.com/anthropics/skills) 文件，你教导 Claude 如何更有效地处理特定场景。Skills 的力量在于它们能够编码机构知识、标准化输出，并处理复杂的多步骤工作流程，否则需要重复解释或投资构建自定义 agent。

**关键能力**：
- 编码机构知识
- 标准化输出格式
- 处理复杂多步骤工作流程
- 将通用助手转变为特定工作流专家

## 创建 Skills 的 5 步流程

### 步骤 1：理解核心需求

在编写任何内容之前，阐明你的 skill 解决什么问题。强大的 skill 解决具有可衡量结果的具体需求。

**好的需求示例**：
- ✅ "从 PDF 中提取财务数据并格式化为 CSV"
- ❌ "帮助处理财务事务"

好的需求指定了输入格式、操作和预期输出。

**关键问题**：
- 这个 skill 完成什么特定任务？
- 什么触发器应该激活它？
- 成功是什么样子的？
- 什么是边缘情况或限制？

### 步骤 2：编写名称

你的 skill 需要三个核心组件：**name**（清晰标识符）、**description**（何时激活）和 **instructions**（如何执行）。

**名称和描述**是影响触发的唯一部分。

#### 命名规范

- 使用小写和连字符（如 `pdf-editor`、`brand-guidelines`）
- 保持简短清晰
- 直观且具有描述性

### 步骤 3：编写描述字段

描述决定你的 skill 何时激活，使其成为最关键的组件。从 Claude 的角度编写，专注于触发器、能力和用例。

#### 强描述的要素

平衡以下元素：
- **具体能力**：明确的功能
- **清晰触发器**：激活场景
- **相关上下文**：使用环境
- **明确边界**：不适用场景

#### 弱描述 vs 强描述

**弱描述**：
```markdown
This skill helps with PDFs and documents.
```

**强描述**：
```markdown
Comprehensive PDF manipulation toolkit for extracting text and tables, creating new PDFs, merging/splitting documents, and handling forms. When Claude needs to fill in a PDF form or programmatically process, generate, or analyze PDF documents at scale. Use for document workflows and batch operations. Not for simple PDF viewing or basic conversions.
```

强版本提供多个数据点：特定动词（extract、create、merge）、具体用例（表单填充、批量操作）和清晰边界（非简单查看）。

### 步骤 4：编写主要指令

你的指令应该结构化、可扫描且可操作。使用 markdown 标题、选项的项目符号和代码块的示例。

#### 指令结构

清晰的层次结构：
1. **概述**（Overview）
2. **前提条件**（Prerequisites）
3. **执行步骤**（Execution steps）
4. **示例**（Examples）
5. **错误处理**（Error handling）
6. **限制**（Limitations）

将复杂工作流程分解为具有清晰输入和输出的离散阶段。

#### 最佳实践

- **包含具体示例**：展示正确用法
- **指定不能做什么**：防止误用和管理期望
- **使用渐进式披露**：SKILL.md 可以包含额外的参考文件和资产

### 步骤 5：上传你的 Skill

根据你构建的 Claude 表面，以下是上传 skill 的方法：

#### Claude.ai（Claude 应用）

1. 进入 **Settings**
2. 添加自定义 skill
3. 需要 Pro、Max、Team 或 Enterprise 计划并启用代码执行
4. 上传的 skills 对每个用户都是单独的——不在组织范围内共享，管理员无法集中管理

#### Claude Code

在插件或项目根目录创建 `skills/` 目录并添加包含 SKILL.md 文件的 skill 文件夹。Claude 在安装插件时自动发现并使用它们。

**示例结构**：
```
my-project/
├── skills/
│   └── my-skill/
│       └── SKILL.md
```

#### Claude Developer Platform

通过 Skills API（`/v1/skills` 端点）上传 skills。使用包含所需 beta 标头的 POST 请求：

```bash
curl -X POST "https://api.anthropic.com/v1/skills" \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -H "anthropic-beta: skills-2025-10-02" \
  -F "display_title=My Skill Name" \
  -F "files[]=@my-skill/SKILL.md;filename=my-skill/SKILL.md"
```

## 测试和验证

在部署之前，使用真实场景测试你的 skill。系统性测试揭示指令中的空白、描述中的歧义以及只有在实际使用时才出现的意外边缘情况。

### 测试矩阵

创建涵盖三个场景的测试矩阵：

#### 1. 正常操作

使用 skill 应该完美处理的典型请求进行测试。

**示例**：如果你构建了财务分析 skill
- "分析微软最新的收益"
- "为这个 10-K 文件构建数据包"

这些基线测试确认你的指令按预期工作。

#### 2. 边缘情况

使用不完整或不寻常的输入进行测试。
- 数据丢失时会发生什么？
- 文件格式意外时会发生什么？
- 用户提供模棱两可的指令时会发生什么？

你的 skill 应该优雅地处理这些情况——要么产生退化但有用的输出，要么解释继续进行所需的内容。

#### 3. 超出范围的请求

使用看起来相关但不应该触发你的 skill 的任务进行测试。

**示例**：如果你构建了 NDA 审查 skill
- "审查这份雇佣协议"
- "分析这份租约"

skill 应该保持休眠，让其他 skills 或通用 Claude 能力处理请求。

### 深度验证

考虑实施以下测试以进行更深入的验证：

#### 触发测试

skill 在预期时是否激活？
- 测试显式请求："使用财务数据包 skill 分析这家公司"
- 测试自然请求："帮助我理解这家公司的财务状况"
- 在无关时是否保持不活跃？

良好范围的 skill 知道何时不激活。测试相似但不同的请求以验证边界。

#### 功能测试

- **输出一致性**：多次运行相似输入是否产生可比较的结果？
- **可用性**：不熟悉该领域的人能否成功使用它？
- **文档准确性**：你的示例是否与实际行为匹配？

## 基于使用情况迭代

监控你的 skill 在实际使用中的表现。
- 如果触发不一致，优化描述
- 如果输出意外变化，澄清指令

与提示一样，最好的 skills 通过实际应用演变。

## 通用最佳实践

这些原则帮助你创建可维护、可重用且真正有用的 skills，而不是理论上的。

### 从用例开始

不要投机性地编写 skills。当你有真实的、重复的任务时构建它们。最好的 skills 解决你经常遇到的问题。

**创建 skill 之前，问自己**：
- 我至少做过这个任务五次了吗？
- 我还会做至少十次吗？

如果是，skill 就有意义。

### 定义成功标准——并将其包含在 skill 中

告诉 Claude 良好的输出是什么样子的。

**示例**：如果你创建财务报告
- 指定所需部分
- 格式化标准
- 验证检查
- 质量阈值

在你的指令中包含这些标准，以便 Claude 可以自检。

### 使用 Skill-Creator skill

[skill-creator skill](https://github.com/anthropics/skills/tree/main/skill-creator) 指导你创建结构良好的 skills。它：
- 提出澄清问题
- 建议描述改进
- 帮助正确格式化指令

在 [GitHub 上的 Skills 存储库](https://github.com/anthropics/skills) 和直接通过 [Claude.ai](https://claude.ai) 提供，对于你的前几个 skills 特别有价值。

## Skill 限制和考虑因素

理解 skills 的工作方式及其边界有助于你设计更有效的 skills 并设定适当的期望。

### Skill 触发

Claude 根据你的请求评估 skill 描述以确定相关性。这不是关键词匹配——Claude 理解语义关系。

**触发准确度**：
- 模糊的描述降低触发准确度
- 多个 skills 可以同时激活，如果它们解决复杂任务的不同方面
- 过于通用的描述导致不适当的激活
- 缺少用例导致错过的激活

### 适当的文件大小

编写 skills 时，避免用不必要的内容膨胀上下文窗口。考虑每条信息是否每次都需要加载，还是有条件地加载。

**"菜单"方法**：
- 如果你的 skill 涵盖多个不同的流程或选项
- SKILL.md 应该描述可用的内容
- 使用相对路径引用每个流程的单独文件
- Claude 然后只读取与用户任务相关的文件
- 其他文件在该对话中保持未触及

**关键原则**：将内容分解为合理的块，让 Claude 根据手头的任务选择需要的内容。

## 真实 Skill 示例

### 示例 1：DOCX 创建 skill

**核心特性**：
- 清晰的决策树，根据任务类型将 Claude 路由到正确的工作流程
- 渐进式披露，保持主文件精简，仅在需要时引用详细的实现文件
- 具体的好/坏示例，展示如何实现复杂的模式（如跟踪更改）

**工作流程决策树**：
```
读取/分析内容 → 使用 "文本提取" 或 "原始 XML 访问"
创建新文档 → 使用 "创建新 Word 文档" 工作流程
编辑现有文档 → 根据情况选择：
  - 自己的文档 + 简单更改 → 基础 OOXML 编辑
  - 他人的文档 → Redlining 工作流程
  - 法律/学术/商业/政府文档 → Redlining 工作流程（必需）
```

**关键创新**：
- 批处理策略：将相关更改分组为 3-10 个更改的批次
- 最小、精确编辑原则：只标记实际更改的文本
- 完整的验证流程：转换 → grep 验证 → 检查意外更改

### 示例 2：品牌指南 skill

**核心特性**：
- 提供 Claude 本身不具备的精确、可操作信息（精确的十六进制代码、字体名称、大小阈值）
- 清晰的描述，告诉 Claude 它的作用以及何时触发它

**品牌资源**：
- **主颜色**：Dark (#141413)、Light (#faf9f5)、Mid Gray (#b0aea5)、Light Gray (#e8e6dc)
- **强调色**：Orange (#d97757)、Blue (#6a9bcc)、Green (#788c5d)
- **字体**：标题使用 Poppins（Arial 回退），正文使用 Lora（Georgia 回退）

**智能功能**：
- 智能字体应用：自动回退到系统字体
- 文本样式：24pt+ 使用 Poppins，正文使用 Lora
- 形状和强调色：循环使用橙色、蓝色和绿色强调色

### 示例 3：前端设计 skill

**核心特性**：
- 创造能力，边界清晰
- 内置版权保护
- 非音乐家的技术脚手架
- 质量标准

**设计思维**：
在编码之前，理解上下文并致力于**大胆的美学方向**：
- **目的**：这个界面解决什么问题？谁使用它？
- **基调**：选择一个极端：极简主义、极繁主义、复古未来主义、有机/自然、豪华/精致、俏皮/玩具般、编辑/杂志、野兽派/原始、装饰艺术/几何、柔和/柔和、工业/实用等
- **约束**：技术要求（框架、性能、可访问性）
- **差异化**：什么让人难以忘怀？

**前端美学指南**：
- **字体**：选择美丽、独特和有趣的字体。避免通用字体如 Arial 和 Inter；选择提升前端美学的独特选择
- **颜色和主题**：致力于一致的美学。使用 CSS 变量保持一致性。主导颜色配合锐利强调色优于胆小、均匀分布的调色板
- **运动**：使用动画制作效果和微交互。优先使用 HTML 的纯 CSS 解决方案
- **空间构图**：意外的布局。不对称。重叠。对角线流动。破坏网格的元素。慷慨的负空间或受控的密度

**避免**：
- 通用的 AI 生成美学
- 过度使用的字体系列（Inter、Roboto、Arial、系统字体）
- 陈词滥调的配色方案（特别是白色背景上的紫色渐变）
- 可预测的布局和组件模式
- 缺乏上下文特定特征的千篇一律的设计

## 常见问题

### 如何编写真正触发的描述？

专注于能力和场景，而不是通用关键词。包括动作动词、特定文件类型和清晰的用例。

**不好的**："document processing skill"
**好的**："extract tables from PDFs and convert to CSV format for data analysis workflows"

### Claude 如何决定调用哪些 skills？

Claude 使用语义理解根据 skill 描述评估你的请求。不是关键词匹配——Claude 确定上下文相关性。如果多个 skills 解决你请求的不同方面，可以同时激活。

### 我的描述的正确粒度是什么？

旨在单一用途的 skills。
- **足够聚焦**："博客文章的 SEO 优化"
- **太宽泛**："内容营销助手"
- **太狭窄**："添加元描述"

### 如何在组织内共享 Skills？

#### 对于小团队

使用包含 name、description、instructions 和 version info 的模板格式。

#### 对于中大型团队

建立 skills 治理流程：
- 为每个域指定 skill 所有者（财务、法律、营销）
- 维护中央 wiki 或共享驱动器作为你的 skill 库
- 包括每个 skill 的使用示例和常见故障排除
- 对你的 skills 进行版本控制并在变更日志中记录更改
- 安排季度审查以更新或淘汰过时的 skills

#### 所有团队规模的最佳实践

- 记录每个 skill 的业务目的
- 为维护和更新分配明确的所有权
- 创建入职材料，向新团队成员展示如何实施共享的 skills
- 跟踪哪些 skills 交付最大价值以优先考虑维护工作
- 使用一致的命名约定，以便 skills 易于查找

企业客户可以与 Anthropic 的客户成功团队合作，探索其他部署选项和治理框架。

### 如何调试 skills？

分别测试触发和执行。
- **如果不激活**：扩大描述并添加用例
- **如果结果不一致**：添加指令特异性并包括验证步骤
- 创建涵盖正常使用、边缘情况和超出范围请求的测试用例库

## 开始使用

### Claude.ai 用户

1. 在 Settings → Features 中启用 Skills
2. 在 claude.ai/projects 创建你的第一个项目
3. 尝试将项目知识与 Skills 结合用于下一个分析任务

### API 开发人员

1. 探索 [文档](https://docs.anthropic.com/)中的 Skills 端点
2. 查看 [skills cookbook](https://platform.claude.com/cookbook/skills-notebooks-01-skills-introduction)

### Claude Code 用户

1. 通过 [插件市场](https://code.claude.com/docs/en/plugin-marketplaces)安装 Skills
2. 查看 [skills cookbook](https://platform.claude.com/cookbook/skills-notebooks-01-skills-introduction)

## 相关资源

- [Skills 产品页](https://www.claude.com/blog/skills)
- [Skills GitHub 仓库](https://github.com/anthropics/skills)
- [Skill-Creator 模板](https://github.com/anthropics/skills/tree/main/skill-creator)
- [Claude.ai 应用](https://claude.ai)
- [Claude Code 产品页](https://www.claude.com/product/claude-code)
- [Agent Skills 范式](concepts/agents-skills-paradigm)

## 相关 Wiki 页面

- [[concepts/agents-skills-paradigm|Agent Skills 范式]]
- [[guides/claude-md-configuration-guide|CLAUDE.md 配置指南]]
