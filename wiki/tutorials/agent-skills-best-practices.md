---
name: agent-skills-best-practices
description: Agent Skills 开发最佳实践 - 命名规范、文件结构、编写原则、单元测试
type: guide
tags: [agent-skills, best-practices, guide, tutorial]
created: 2026-05-04
updated: 2026-05-04
source: ../../../archive/clippings/bilibili/2026-05-04-agent-skills-course/2026-05-04-【吴恩达】AgentSkill_06.md
---

# Agent Skills 最佳实践

> [!tip] 核心原则
> **从简单开始，逐步迭代，持续收集反馈**

本指南基于吴恩达 Agent Skills 课程 Lesson 06，总结生产级技能开发的最佳实践。

---

## 一、命名规范

### 1.1 基本规则

| 规范 | 说明 | 示例 |
|------|------|------|
| **小写字母** | 只允许小写字母 | `generating-quiz` ✅ |
| **连字符分隔** | 使用连字符（`-`）分隔单词 | `time-series-analysis` ✅ |
| **动词+ing形式** | 优先使用动词+ing形式 | `analyzing-data` ✅ |
| **字符限制** | 名称有最大长度限制 | 保持简洁 |

### 1.2 好的命名示例

```bash
✅ analyzing-time-series       # 清晰、描述性强
✅ generating-quiz-questions    # 动词+ing、明确功能
✅ marketing-campaign-analysis  # 业务场景明确
✅ budget-reallocation          # 简洁、准确

❌ TimeSeriesAnalysis           # 大写字母（错误）
❌ quiz_generator               # 下划线（不推荐）
❌ skill1                       # 无描述性
❌ analyze                      # 过于泛化
```

### 1.3 命名技巧

> [!tip] 命名公式
> **动词+ing + 业务对象 + 可选修饰语**
> 
> 示例：`analyzing + time-series + data`
> 结果：`analyzing-time-series-data`

**避免过度泛化**：
- ❌ `analyze-data`（太泛化）
- ✅ `analyzing-marketing-campaign-data`（具体场景）

---

## 二、描述优化

### 2.1 描述的重要性

描述是 Claude 判断**何时使用技能**的关键依据。

### 2.2 描述三要素

```markdown
description: |
  【功能说明】生成教育练习题，从讲义到测试理解
  
  【使用场景】当你需要：
  - 从教学笔记生成测试题
  - 创建不同类型的练习题（真伪题、选择题、应用题）
  - 测试学生对特定主题的理解
  
  【触发关键词】生成问题、练习题、测试、quiz、exam
```

### 2.3 描述优化技巧

#### 技巧 1：说明功能+使用场景

```markdown
# ❌ 不好的描述
description: "分析时间序列数据"

# ✅ 好的描述
description: |
  分析时间序列数据特征，包括趋势识别、季节性分析、自相关分析。
  
  使用场景：
  - 零售销售预测
  - 库存需求分析
  - 财务数据趋势识别
  
  输入：CSV 格式的时间序列数据
  输出：可视化图表、诊断报告、转换建议
```

#### 技巧 2：包含触发关键词

```markdown
description: |
  生成教育练习题...
  
  触发关键词：
  - "生成问题"
  - "创建练习题"
  - "测试理解"
  - "quiz"
  - "exam"
```

#### 技巧 3：明确输入输出

```markdown
description: |
  输入：Markdown 格式的讲义笔记或 PDF 文档
  
  输出：
  - 真伪题（True/False）
  - 多选题（Multiple Choice）
  - 应用题（Case Study）
  - 编码题（Coding Problem）
```

---

## 三、文件结构

### 3.1 标准目录结构

```
skill-name/
├── SKILL.md              # 主指令文件（必需，<500行）
├── scripts/              # 可执行代码（可选）
│   ├── analyze.py
│   └── visualize.py
├── references/           # 参考文档（可选）
│   ├── domain-guide.md
│   └── best-practices.md
└── resources/            # 资源文件（可选）
    ├── template.md
    └── schema.json
```

### 3.2 各目录用途

#### SKILL.md（必需）
- **位置**: 技能根目录
- **命名**: 必须大写 `SKILL.md`
- **大小**: <500 行
- **内容**: 技能的核心指令和工作流程

#### scripts/（可选）
- **用途**: 存放可执行代码文件
- **类型**: Python、JavaScript、Bash 等
- **调用**: 技能按需加载，节省 token
- **示例**:
  ```
  scripts/
  ├── visualize.py         # 数据可视化脚本
  ├── autocorrelation.py   # 自相关分析
  └── decomposition.py     # 时间序列分解
  ```

#### references/（可选）
- **用途**: 存放参考文档和指南
- **特点**: 技能通常读取整个文件
- **示例**:
  ```
  references/
  ├── diagnostics-guide.md     # 诊断指南
  ├── domain-knowledge.md      # 领域知识
  └── error-handling.md        # 错误处理指南
  ```

#### resources/（可选）
- **用途**: 存放模板、数据、样式文件
- **特点**: 仅在需要时加载
- **示例**:
  ```
  resources/
  ├── markdown-template.md     # Markdown 输出模板
  ├── latex-template.tex       # LaTeX 输出模板
  └── output-schema.json       # 输出格式定义
  ```

### 3.3 目录结构最佳实践

> [!tip] 渐进式披露原则
> - **元数据层**：YAML frontmatter（始终加载）
> - **指令层**：SKILL.md 核心内容（始终加载）
> - **资源层**：scripts/references/resources（按需加载）

**实践建议**：
1. ✅ 保持 SKILL.md <500 行
2. ✅ 将长代码移到 scripts/
3. ✅ 将参考文档移到 references/
4. ✅ 将模板文件移到 resources/
5. ✅ 使用相对路径引用资源

---

## 四、编写原则

### 4.1 分步明确

```markdown
## 工作流程

### 步骤 1：读取输入文件
- 读取用户提供的讲义笔记
- 提取学习目标和关键概念

### 步骤 2：生成真伪题
- 基于学习目标创建 5-10 道真伪题
- 每道题包含陈述和答案解析

### 步骤 3：生成选择题
- 创建 4 个选项的单选题
- 确保只有一个正确答案

### 步骤 4：生成应用题
- 基于真实场景创建案例
- 要求学生应用概念解决问题

### 步骤 5：格式化输出
- 使用指定模板格式化
- 保存为 Markdown/PDF/LaTeX
```

### 4.2 边界条件清晰

```markdown
## 边界条件

### 跳过条件
如果以下情况，跳过相应步骤：
- 输入文件不包含学习目标 → 跳过步骤 2-4
- 用户未指定输出格式 → 使用默认 Markdown 格式
- 讲义内容 <500 字 → 提示内容不足，无法生成问题

### 错误处理
- 文件读取失败 → 提示检查文件路径
- 格式不支持 → 列出支持的格式
- 生成失败 → 保存错误日志，提供详细错误信息
```

### 4.3 跨平台兼容

```markdown
## 路径规范

### 始终使用正斜杠
```python
# ✅ 正确
file_path = "scripts/analyze.py"

# ❌ 错误（Windows 反斜杠）
file_path = "scripts\\analyze.py"
```

### 相对路径引用
```python
# ✅ 正确（相对于技能根目录）
script_path = "scripts/analyze.py"
ref_path = "references/guide.md"

# ❌ 错误（绝对路径）
script_path = "/usr/local/skills/scripts/analyze.py"
```
```

### 4.4 避免重复

> [!warning] 保持简洁
> - **避免重复说明**：相同内容只说一次
> - **使用外部引用**：长内容引用 references/
> - **模块化设计**：复杂任务拆分为多个子技能

**示例**：
```markdown
# ❌ 重复内容
## 步骤 1：分析数据
...（100 行详细说明）...

## 步骤 2：可视化数据
...（重复说明分析方法）...

# ✅ 引用外部文档
## 步骤 1：分析数据
使用 references/analysis-guide.md 中的分析方法

## 步骤 2：可视化数据
基于步骤 1 的分析结果，生成可视化图表
```

---

## 五、单元测试

### 5.1 测试驱动开发

> [!tip] TDD 流程
> 1. **Red**: 编写测试（预期失败）
> 2. **Green**: 编写最小实现（通过测试）
> 3. **Refactor**: 优化代码（保持通过）

### 5.2 测试用例设计

#### 案例：生成练习题技能

```markdown
## 测试用例

### 测试 1：不同输入格式
**输入**：
- Markdown 讲义（`.md`）
- PDF 文档（`.pdf`）
- LaTeX 文档（`.tex`）

**预期输出**：
- ✅ 正确提取学习目标
- ✅ 生成指定格式的问题
- ✅ 使用对应的输出模板

### 测试 2：问题类型覆盖
**输入**：包含 10 个学习目标的讲义

**预期输出**：
- ✅ 真伪题（True/False）：5-10 道
- ✅ 多选题（Multiple Choice）：3-5 道
- ✅ 应用题（Case Study）：2-3 道
- ✅ 编码题（Coding）：1-2 道（如适用）

### 测试 3：输出格式验证
**输入**：指定 Markdown 输出

**预期输出**：
- ✅ 使用 assets/markdown-template.md 模板
- ✅ 包含正确的 YAML frontmatter
- ✅ 格式化正确（标题、列表、代码块）
```

### 5.3 测试框架示例

```python
# test_generating_quiz.py
import pytest
from pathlib import Path

def test_markdown_input():
    """测试 Markdown 输入"""
    skill = GeneratingQuizSkill()
    result = skill.generate("tests/fixtures/lecture.md")
    
    assert result["total_questions"] >= 10
    assert "true_false" in result
    assert "multiple_choice" in result

def test_pdf_input():
    """测试 PDF 输入"""
    skill = GeneratingQuizSkill()
    result = skill.generate("tests/fixtures/lecture.pdf")
    
    assert result["format"] == "markdown"
    assert len(result["questions"]) > 0

def test_output_format():
    """测试输出格式"""
    skill = GeneratingQuizSkill()
    result = skill.generate(
        "tests/fixtures/lecture.md",
        output_format="latex"
    )
    
    assert "\\documentclass" in result["output"]
    assert "\\begin{document}" in result["output"]
```

### 5.4 人类反馈收集

```markdown
## 反馈收集流程

### 1. 输出质量评估
- 问题是否准确？
- 难度是否合适？
- 覆盖面是否全面？

### 2. 用户满意度
- 输出格式是否符合预期？
- 是否需要调整问题类型？
- 是否需要更多/更少问题？

### 3. 迭代优化
- 收集反馈 → 分析问题 → 优化技能 → 重新测试
- 记录每次迭代的变化和效果
```

---

## 六、常见错误

### 6.1 命名错误

| 错误 | 修正 |
|------|------|
| `TimeSeriesAnalysis` | `analyzing-time-series` |
| `quiz_generator` | `generating-quiz-questions` |
| `skill1` | `marketing-campaign-analysis` |

### 6.2 描述错误

| 错误 | 修正 |
|------|------|
| "分析数据" | "分析营销活动数据，包括 ROI 分析和预算分配建议" |
| "生成问题" | "从讲义笔记生成练习题，支持真伪题、选择题、应用题" |

### 6.3 结构错误

| 错误 | 修正 |
|------|------|
| SKILL.md >500 行 | 拆分为多个文件，移到 scripts/ 或 references/ |
| 使用反斜杠路径 | 改用正斜杠（即使在 Windows） |
| 硬编码绝对路径 | 使用相对路径 |

---

## 七、检查清单

### 发布前检查

```
[ ] 命名规范
  [ ] 全小写字母
  [ ] 连字符分隔
  [ ] 动词+ing形式
  [ ] 描述性强

[ ] 描述优化
  [ ] 说明功能
  [ ] 使用场景清晰
  [ ] 包含触发关键词
  [ ] 明确输入输出

[ ] 文件结构
  [ ] SKILL.md <500 行
  [ ] scripts/ 存放代码
  [ ] references/ 存放文档
  [ ] resources/ 存放资源

[ ] 编写原则
  [ ] 分步明确
  [ ] 边界条件清晰
  [ ] 使用正斜杠
  [ ] 避免重复

[ ] 单元测试
  [ ] 测试不同输入
  [ ] 测试问题类型
  [ ] 测试输出格式
  [ ] 收集人类反馈

[ ] 跨平台兼容
  [ ] 在 Windows 测试
  [ ] 在 macOS 测试
  [ ] 在 Linux 测试
```

---

## 八、相关资源

### 官方文档
- [Anthropic Skills Quickstarts](https://github.com/anthropics/anthropic-quickstarts)
- [Skills Documentation](https://docs.anthropic.com/docs/build-with-claude/skills)

### Wiki 相关页面
- [[agent-skills-progressive-disclosure]] - 渐进式披露机制
- [[agent-skills-andrew-ng-course]] - 吴恩达完整教程
- [[agent-skills-platform-usage]] - 多平台使用指南

### 实战案例
- [[agent-skills-examples]] - 完整实战案例库

---

*最后更新: 2026-05-04*
*来源: 吴恩达 Agent Skills 课程 Lesson 06*
