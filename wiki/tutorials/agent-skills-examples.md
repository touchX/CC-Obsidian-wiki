---
name: agent-skills-examples
description: Agent Skills 实战案例集 - 营销分析、时间序列、练习题生成、技能创建器
type: tutorial
tags: [agent-skills, examples, tutorial, case-study]
created: 2026-05-04
updated: 2026-05-04
source: ../../../archive/clippings/bilibili/2026-05-04-agent-skills-course/
---

# Agent Skills 实战案例集

> [!info] 案例来源
> - 基于吴恩达 Agent Skills 课程 Lesson 02-05
> - 包含完整的代码示例和目录结构
> - 涵盖数据集成、可视化、内容生成等场景

本页面汇总 4 个完整的 Agent Skills 实战案例，展示如何在实际业务中应用技能。

---

## 案例一：营销活动分析

### 业务场景

**需求**：分析营销渠道 ROI，提供预算重新分配建议

**核心功能**：
- 数据读取（CSV/BigQuery）
- ROI 分析
- 多方案对比
- 可视化输出

### 技能结构

```
marketing-campaign-analysis/
├── SKILL.md
└── references/
    └── budget-reallocation-rules.md
```

### 工作流程

#### 步骤 1：读取输入数据

**CSV 方式**：
```python
import pandas as pd

# 读取营销数据
df = pd.read_csv('marketing_data.csv')
```

**BigQuery 方式**（推荐）：
```python
from google.cloud import bigquery

client = bigquery.Client()

# 查询营销数据
query = """
SELECT
    channel,
    campaign,
    spend,
    revenue,
    date
FROM `project.dataset.marketing`
WHERE date BETWEEN '2026-01-01' AND '2026-01-31'
"""

df = client.query(query).to_dataframe()
```

#### 步骤 2：应用分配规则

```python
# references/budget-reallocation-rules.md
rules = {
    "high_performer": {
        "roi_threshold": 3.0,
        "action": "increase_budget",
        "percentage": 0.20
    },
    "low_performer": {
        "roi_threshold": 1.0,
        "action": "decrease_budget",
        "percentage": 0.30
    },
    "new_channel": {
        "min_data_points": 100,
        "action": "continue_monitoring"
    }
}
```

#### 步骤 3：生成对比方案

```python
# 计算各渠道 ROI
df['roi'] = df['revenue'] / df['spend']

# 应用规则
for channel, data in df.groupby('channel'):
    roi = data['roi'].mean()
    
    if roi >= rules['high_performer']['roi_threshold']:
        action = rules['high_performer']['action']
        pct = rules['high_performer']['percentage']
    elif roi <= rules['low_performer']['roi_threshold']:
        action = rules['low_performer']['action']
        pct = rules['low_performer']['percentage']
    else:
        action = "maintain"
        pct = 0.0
    
    print(f"{channel}: ROI={roi:.2f} → {action} ({pct*100:.0f}%)")
```

#### 步骤 4：输出建议

```markdown
## 预算重新分配建议

### 高效渠道（ROI ≥ 3.0）
- **Google Ads**: ROI=4.2 → 增加 20% 预算
- **Facebook**: ROI=3.8 → 增加 20% 预算

### 低效渠道（ROI ≤ 1.0）
- **Display**: ROI=0.8 → 减少 30% 预算
- **Print**: ROI=0.6 → 减少 30% 预算

### 新渠道（数据不足）
- **TikTok**: 继续监测（仅 50 个数据点）

### 预期影响
- 总 ROI 预计提升：15%
- 预算节省：10%
```

### MCP 集成（BigQuery）

**配置 MCP 服务器**：
```json
{
  "name": "bigquery-mcp",
  "command": "npx",
  "args": ["-y", "@anthropic-ai/mcp-server-bigquery"],
  "env": {
    "GOOGLE_APPLICATION_CREDENTIALS": "/path/to/credentials.json",
    "PROJECT_ID": "your-project-id"
  }
}
```

**在技能中使用**：
```markdown
## 使用 BigQuery

### 步骤 1：列出可用表
使用 MCP 工具查询 BigQuery 数据集

### 步骤 2：读取表结构
了解字段名称和数据类型

### 步骤 3：执行分析查询
应用分析逻辑生成建议
```

### 完整 SKILL.md 示例

```markdown
---
name: marketing-campaign-analysis
description: |
  分析营销活动数据，提供预算重新分配建议。
  
  使用场景：
  - 营销渠道 ROI 分析
  - 预算优化决策
  - 多方案对比
  
  触发关键词：
  - "营销分析"
  - "预算分配"
  - "ROI 分析"
type: marketing
tags: [analytics, business-intelligence]
---

# 营销活动分析技能

## 功能描述

读取营销数据，应用分配规则，生成预算重新分配建议。

## 工作流程

### 步骤 1：数据读取
- 从 CSV 文件或 BigQuery 读取数据
- 验证数据完整性

### 步骤 2：ROI 计算
- 计算各渠道 ROI（收入/支出）
- 识别高/低效渠道

### 步骤 3：规则应用
- 应用 references/budget-reallocation-rules.md
- 生成预算调整建议

### 步骤 4：输出
- Markdown 格式的分析报告
- 对比表格和可视化建议

## 边界条件

### 跳过条件
- 数据不足 50 个数据点 → 提示"数据不足，无法分析"
- 缺少关键字段（spend/revenue）→ 提示"数据格式错误"

### 错误处理
- BigQuery 连接失败 → 提示检查 MCP 配置
- CSV 读取失败 → 提示检查文件路径

## 输出格式

使用 Markdown 格式，包含：
- 执行摘要
- 渠道对比表
- 预算调整建议
- 预期影响分析
```

---

## 案例二：时间序列分析

### 业务场景

**需求**：分析零售销售数据，识别趋势和季节性模式

**核心功能**：
- 数据可视化
- 趋势识别
- 季节性分解
- 自相关分析

### 技能结构

```
analyzing-time-series/
├── SKILL.md
├── scripts/
│   ├── visualize.py         # 数据可视化
│   ├── autocorrelation.py   # 自相关分析
│   └── decomposition.py     # 时间序列分解
└── references/
    └── diagnostics-guide.md # 诊断指南
```

### 工作流程

#### 步骤 1：数据可视化

**scripts/visualize.py**：
```python
import pandas as pd
import matplotlib.pyplot as plt

def plot_time_series(df, date_col, value_col):
    """
    绘制时间序列图
    
    参数:
        df: DataFrame 包含时间序列数据
        date_col: 日期列名
        value_col: 值列名
    """
    df[date_col] = pd.to_datetime(df[date_col])
    df = df.sort_values(date_col)
    
    plt.figure(figsize=(12, 6))
    plt.plot(df[date_col], df[value_col])
    plt.xlabel('Date')
    plt.ylabel('Sales')
    plt.title('Time Series Plot')
    plt.grid(True)
    plt.savefig('time_series_plot.png')
    plt.close()
    
    return 'time_series_plot.png'
```

#### 步骤 2：自相关分析

**scripts/autocorrelation.py**：
```python
from pandas.plotting import autocorrelation_plot

def analyze_autocorrelation(df, value_col, lags=50):
    """
    分析自相关性
    
    参数:
        df: DataFrame
        value_col: 值列名
        lags: 滞后期数
    
    返回:
        自相关图路径
    """
    plt.figure(figsize=(12, 6))
    autocorrelation_plot(df[value_col])
    plt.title('Autocorrelation Plot')
    plt.savefig('autocorrelation.png')
    plt.close()
    
    return 'autocorrelation.png'
```

#### 步骤 3：时间序列分解

**scripts/decomposition.py**：
```python
from statsmodels.tsa.seasonal import seasonal_decompose

def decompose_series(df, date_col, value_col, model='additive', period=12):
    """
    时间序列分解
    
    参数:
        df: DataFrame
        date_col: 日期列名
        value_col: 值列名
        model: 'additive' 或 'multiplicative'
        period: 季节性周期（月度数据=12）
    
    返回:
        分解结果图路径
    """
    df[date_col] = pd.to_datetime(df[date_col])
    df.set_index(date_col, inplace=True)
    
    decomposition = seasonal_decompose(
        df[value_col],
        model=model,
        period=period
    )
    
    fig, axes = plt.subplots(4, 1, figsize=(12, 10))
    decomposition.observed.plot(ax=axes[0], title='Observed')
    decomposition.trend.plot(ax=axes[1], title='Trend')
    decomposition.seasonal.plot(ax=axes[2], title='Seasonal')
    decomposition.resid.plot(ax=axes[3], title='Residual')
    
    plt.tight_layout()
    plt.savefig('decomposition.png')
    plt.close()
    
    return 'decomposition.png'
```

#### 步骤 4：诊断输出

**references/diagnostics-guide.md**：
```markdown
# 时间序列诊断指南

## 趋势分析

### 上升趋势
- 销售持续增长
- 建议：扩大库存，增加营销投入

### 下降趋势
- 销售持续下滑
- 建议：分析原因，调整策略

### 无趋势
- 销售平稳
- 建议：维持现状，关注季节性

## 季节性分析

### 强季节性（季节性成分 > 趋势成分）
- 明显的周期性波动
- 建议：提前备货，应对旺季

### 弱季节性（季节性成分 < 趋势成分）
- 周期性波动不明显
- 建议：关注长期趋势

## 自相关分析

### 正自相关（lag 1-5 显著）
- 数据具有持续性
- 建议：使用 ARIMA 模型

### 负自相关（lag 显著为负）
- 数据具有振荡性
- 建议：检查外部因素影响
```

### 使用示例

```markdown
## 分析结果

### 数据概览
- 数据范围：2025-01-01 至 2025-12-31
- 数据点数：365
- 平均销售额：$10,234

### 趋势分析
![趋势图](time_series_plot.png)

**结论**：数据呈现明显上升趋势（月增长率 5%）

### 季节性分解
![分解图](decomposition.png)

**发现**：
- 趋势成分：+15% 年增长
- 季节性成分：12 月周期，峰值在 7 月
- 残差：随机波动，无明显模式

### 自相关分析
![自相关图](autocorrelation.png)

**结论**：lag 1-3 显著正自相关，适合 ARIMA 建模

### 建议
1. **库存管理**：在 6 月增加库存应对 7 月旺季
2. **营销策略**：在淡季（1-3 月）增加促销力度
3. **预测模型**：使用 ARIMA(3,1,2) 进行短期预测
```

---

## 案例三：练习题生成

### 业务场景

**需求**：从教学讲义自动生成多种类型的练习题

**核心功能**：
- 讲义解析
- 学习目标提取
- 多题型生成
- 多格式输出

### 技能结构

```
generating-quiz-questions/
├── SKILL.md
├── assets/
│   ├── markdown-template.md
│   ├── latex-template.tex
│   └── pdf-template.md
└── references/
    ├── legal-tech-notes.md
    └── example-questions.md
```

### 工作流程

#### 步骤 1：读取讲义

```python
def extract_learning_objectives(lecture_file):
    """
    从讲义中提取学习目标
    
    参数:
        lecture_file: 讲义文件路径
    
    返回:
        学习目标列表
    """
    with open(lecture_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # 提取学习目标部分
    objectives = []
    in_objectives = False
    
    for line in content.split('\n'):
        if '学习目标' in line or 'Learning Objectives' in line:
            in_objectives = True
            continue
        
        if in_objectives:
            if line.startswith('#') or line.startswith('##'):
                break
            if line.strip():
                objectives.append(line.strip())
    
    return objectives
```

#### 步骤 2：生成问题

```python
def generate_questions(objectives, question_types):
    """
    基于学习目标生成问题
    
    参数:
        objectives: 学习目标列表
        question_types: 问题类型列表
    
    返回:
        问题字典
    """
    questions = {
        'true_false': [],
        'multiple_choice': [],
        'case_study': [],
        'coding': []
    }
    
    for obj in objectives:
        # 真伪题
        if 'true_false' in question_types:
            questions['true_false'].append({
                'statement': f"{obj} 是正确的。",
                'answer': 'True',
                'explanation': f"基于讲义内容，{obj}"
            })
        
        # 多选题
        if 'multiple_choice' in question_types:
            questions['multiple_choice'].append({
                'question': f"以下哪项最能描述 {obj}？",
                'options': [
                    'A. 选项 A',
                    'B. 选项 B',
                    'C. 选项 C',
                    'D. 选项 D'
                ],
                'correct': 'A',
                'explanation': f"根据讲义，正确答案是 A"
            })
        
        # 应用题
        if 'case_study' in question_types:
            questions['case_study'].append({
                'scenario': f"某公司需要实现 {obj}，请分析...",
                'questions': [
                    "1. 主要挑战是什么？",
                    "2. 你会如何解决？",
                    "3. 预期结果是什么？"
                ],
                'rubric': '评分标准：...'
            })
    
    return questions
```

#### 步骤 3：格式化输出

**Markdown 模板**：
```markdown
# 练习题：{{topic}}

## 学习目标
{{objectives}}

## 真伪题
{{#each true_false}}
{{@index}}. {{statement}}
   - 答案：{{answer}}
   - 解析：{{explanation}}
{{/each}}

## 多选题
{{#each multiple_choice}}
{{@index}}. {{question}}
   A. {{options.[0]}}
   B. {{options.[1]}}
   C. {{options.[2]}}
   D. {{options.[3]}}
   
   答案：{{correct}}
   解析：{{explanation}}
{{/each}}

## 应用题
{{#each case_study}}
### 案例 {{@index}}
{{scenario}}

{{#each questions}}
{{this}}
{{/each}}

评分标准：{{rubric}}
{{/each}}
```

#### 步骤 4：输出文件

```python
def output_questions(questions, template_file, output_format, output_file):
    """
    格式化输出问题
    
    参数:
        questions: 问题字典
        template_file: 模板文件
        output_format: 输出格式（markdown/latex/pdf）
        output_file: 输出文件路径
    """
    # 读取模板
    with open(template_file, 'r', encoding='utf-8') as f:
        template = f.read()
    
    # 填充模板
    if output_format == 'markdown':
        content = render_markdown(questions, template)
    elif output_format == 'latex':
        content = render_latex(questions, template)
    elif output_format == 'pdf':
        # 先生成 Markdown，再转换为 PDF
        md_content = render_markdown(questions, template)
        content = markdown_to_pdf(md_content)
    
    # 写入文件
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(content)
    
    return output_file
```

### 完整示例

**输入讲义**：
```markdown
# Python 函数式编程

## 学习目标
1. 理解 lambda 表达式的语法和用法
2. 掌握 map、filter、reduce 三个高阶函数
3. 能够应用函数式编程解决实际问题
```

**输出练习题**：
```markdown
# 练习题：Python 函数式编程

## 学习目标
1. 理解 lambda 表达式的语法和用法
2. 掌握 map、filter、reduce 三个高阶函数
3. 能够应用函数式编程解决实际问题

## 真伪题
1. lambda 表达式可以包含多个语句。
   - 答案：False
   - 解析：lambda 表达式只能包含单个表达式，不能包含多个语句。

2. map 函数返回一个列表。
   - 答案：False
   - 解析：在 Python 3 中，map 返回一个迭代器对象，不是列表。

## 多选题
1. 以下哪项最能描述 lambda 表达式的特点？
   A. 匿名函数
   B. 可以包含多个语句
   C. 必须有 return 语句
   D. 只能有一个表达式
   
   答案：D
   解析：lambda 表达式是匿名函数，只能包含一个表达式，不需要 return 语句。

## 应用题
### 案例 1
某公司需要处理一个包含 1000 个员工薪资的列表，需要：
1. 过滤掉薪资低于 5000 的员工
2. 对剩余员工薪资增加 10%
3. 计算调整后的总薪资

请使用 map、filter、reduce 实现上述需求。

1. 主要挑战是什么？
2. 你会如何解决？
3. 预期结果是什么？

评分标准：
- 正确使用 filter：3 分
- 正确使用 map：3 分
- 正确使用 reduce：4 分
```

---

## 案例四：技能创建器（Meta-Skill）

### 业务场景

**需求**：程序化创建 Agent Skills，自动化技能开发流程

**核心功能**：
- 技能结构初始化
- 自动填充模板
- 技能验证
- 技能打包

### 技能结构

```
skill-creator/
├── SKILL.md
└── scripts/
    ├── initialize_skill.py    # 初始化技能
    ├── package_skill.py       # 打包技能
    └── validate_skill.py      # 验证技能
```

### 工作流程

#### 步骤 1：初始化技能

**scripts/initialize_skill.py**：
```python
import os
from pathlib import Path

def initialize_skill(skill_name, description, category):
    """
    初始化技能目录结构
    
    参数:
        skill_name: 技能名称（小写+连字符）
        description: 技能描述
        category: 技能分类
    
    返回:
        创建的文件列表
    """
    # 创建目录结构
    skill_dir = Path(skill_name)
    skill_dir.mkdir(exist_ok=True)
    
    (skill_dir / 'scripts').mkdir(exist_ok=True)
    (skill_dir / 'references').mkdir(exist_ok=True)
    (skill_dir / 'resources').mkdir(exist_ok=True)
    
    # 创建 SKILL.md
    skill_md_content = f"""---
name: {skill_name}
description: |
  {description}
  
  使用场景：
  - 场景 1
  - 场景 2
  
  触发关键词：
  - "关键词1"
  - "关键词2"
type: {category}
tags: [{category}]
---

# {skill_name.replace('-', ' ').title()}

## 功能描述
{description}

## 工作流程

### 步骤 1：[步骤名称]
- 任务描述
- 执行方法

### 步骤 2：[步骤名称]
- 任务描述
- 执行方法

## 边界条件

### 跳过条件
- 条件 1
- 条件 2

### 错误处理
- 错误 1：处理方法
- 错误 2：处理方法
"""
    
    with open(skill_dir / 'SKILL.md', 'w', encoding='utf-8') as f:
        f.write(skill_md_content)
    
    return [str(skill_dir / 'SKILL.md')]
```

#### 步骤 2：打包技能

**scripts/package_skill.py**：
```python
import shutil
import zipfile

def package_skill(skill_name, output_dir='dist'):
    """
    打包技能为 ZIP 文件
    
    参数:
        skill_name: 技能名称
        output_dir: 输出目录
    
    返回:
        ZIP 文件路径
    """
    skill_dir = Path(skill_name)
    output_path = Path(output_dir)
    output_path.mkdir(exist_ok=True)
    
    zip_path = output_path / f'{skill_name}.zip'
    
    with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for file in skill_dir.rglob('*'):
            if file.is_file():
                arcname = file.relative_to(skill_dir.parent)
                zipf.write(file, arcname)
    
    return str(zip_path)
```

#### 步骤 3：验证技能

**scripts/validate_skill.py**：
```python
import yaml
from pathlib import Path

def validate_skill(skill_name):
    """
    验证技能结构
    
    参数:
        skill_name: 技能名称
    
    返回:
        (is_valid, errors)
    """
    skill_dir = Path(skill_name)
    errors = []
    
    # 检查 SKILL.md 存在
    skill_md = skill_dir / 'SKILL.md'
    if not skill_md.exists():
        errors.append('SKILL.md 文件不存在')
        return False, errors
    
    # 检查 YAML frontmatter
    with open(skill_md, 'r', encoding='utf-8') as f:
        content = f.read()
        if not content.startswith('---'):
            errors.append('缺少 YAML frontmatter')
            return False, errors
        
        # 提取 frontmatter
        end = content.find('---', 3)
        frontmatter = content[3:end]
        
        try:
            metadata = yaml.safe_load(frontmatter)
            
            # 检查必需字段
            required_fields = ['name', 'description', 'type']
            for field in required_fields:
                if field not in metadata:
                    errors.append(f'缺少必需字段: {field}')
            
            # 检查命名规范
            if 'name' in metadata:
                name = metadata['name']
                if name != name.lower():
                    errors.append('技能名称必须小写')
                if ' ' in name or '_' in name:
                    errors.append('技能名称应使用连字符分隔')
        
        except yaml.YAMLError as e:
            errors.append(f'YAML 解析错误: {e}')
    
    # 检查目录结构
    required_dirs = ['scripts', 'references', 'resources']
    for dir_name in required_dirs:
        if not (skill_dir / dir_name).exists():
            errors.append(f'缺少目录: {dir_name}')
    
    is_valid = len(errors) == 0
    return is_valid, errors
```

### 使用示例

```markdown
## 创建技能

### 输入
- 技能名称：`analyzing-customer-data`
- 描述：分析客户数据，识别购买模式
- 分类：`analytics`

### 执行
1. 运行 initialize_skill.py
2. 生成目录结构和 SKILL.md
3. 运行 validate_skill.py
4. 验证通过
5. 运行 package_skill.py
6. 生成 analyzing-customer-data.zip

### 输出
```
analyzing-customer-data/
├── SKILL.md          # ✅ 自动生成
├── scripts/          # ✅ 自动创建
├── references/       # ✅ 自动创建
└── resources/        # ✅ 自动创建

dist/
└── analyzing-customer-data.zip  # ✅ 打包完成
```

---

## 五、技能组合工作流

### 完整流程：从数据到演示

```
数据源（BigQuery）
    ↓
营销分析技能（分析 ROI）
    ↓
品牌指南技能（应用样式）
    ↓
PowerPoint 技能（生成演示）
    ↓
最终输出：专业演示文稿
```

### 实施步骤

#### 1. 配置 MCP 服务器

```json
{
  "mcpServers": {
    "bigquery": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-server-bigquery"],
      "env": {
        "GOOGLE_APPLICATION_CREDENTIALS": "/path/to/credentials.json"
      }
    }
  }
}
```

#### 2. 创建技能

**营销分析技能**：
```bash
# 使用技能创建器
/skill-create marketing-campaign-analysis
```

**品牌指南技能**：
```bash
# 上传品牌指南文件
/skill-create brand-guidelines
```

#### 3. 执行工作流

```markdown
请帮我完成以下任务：

1. 从 BigQuery 查询 2026 年 1 月的营销数据
2. 使用营销分析技能分析各渠道 ROI
3. 应用品牌指南技能的样式要求
4. 使用 PowerPoint 技能生成演示文稿
```

#### 4. 输出结果

```markdown
✅ 步骤 1：数据查询完成
- 表：marketing_data
- 行数：10,234
- 日期范围：2026-01-01 至 2026-01-31

✅ 步骤 2：营销分析完成
- 高效渠道：Google Ads（ROI=4.2）
- 低效渠道：Display（ROI=0.8）
- 建议：增加 Google Ads 预算 20%

✅ 步骤 3：品牌样式应用完成
- 主色：#0066CC
- 字体：Roboto
- Logo：已嵌入

✅ 步骤 4：演示文稿生成完成
- 文件：marketing_analysis.pptx
- 幻灯片数：12
- 包含：数据图表、建议、品牌元素
```

---

## 六、故障排查

### 常见问题

| 问题 | 原因 | 解决方案 |
|------|------|----------|
| 技能不触发 | 描述不清 | 优化 description，添加触发关键词 |
| 脚本执行失败 | 路径错误 | 使用相对路径，避免硬编码 |
| MCP 连接失败 | 配置错误 | 检查环境变量和网络连接 |
| 输出格式错误 | 模板问题 | 验证模板语法，检查变量名 |

### 调试技巧

**查看技能日志**：
```bash
# Claude Code
/skills

# 查看技能详情
/skill-info marketing-campaign-analysis
```

**测试技能**：
```markdown
请使用营销分析技能分析以下数据：
[上传 CSV 文件或指定 BigQuery 表]
```

**验证 MCP**：
```bash
# 测试 BigQuery 连接
echo "SELECT * FROM \`project.dataset.table\` LIMIT 1" | bq query
```

---

## 七、相关资源

### Wiki 相关页面
- [[agent-skills-andrew-ng-course]] - 课程总览
- [[agent-skills-best-practices]] - 最佳实践
- [[agent-skills-platform-usage]] - 平台使用指南
- [[agent-skills-progressive-disclosure]] - 渐进式披露机制

### 官方资源
- [Anthropic Skills Quickstarts](https://github.com/anthropics/anthropic-quickstarts)
- [Claude API Documentation](https://docs.anthropic.com)

### 扩展阅读
- [[time-series-analysis]] - 时间序列分析完整指南
- [[marketing-analytics]] - 营销分析方法论

---

*最后更新: 2026-05-04*
*来源: 吴恩达 Agent Skills 课程 Lesson 02-05*
