---
name: theneoai-awesome-skills
description: 1000+ 专家级 AI 技能库 — 覆盖 60 个职业领域，含企业方法论（Amazon、Tesla、McKinsey 等）
type: source
version: 1.0
tags: [github, javascript, ai, skills, agents, claude-code, prompt-engineering]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/resources/github/theneoai-awesome-skills-2026-04-29.json
stars: 55
forks: 23
language: JavaScript
license: MIT
github_url: https://github.com/theneoai/awesome-skills
homepage: https://theneoai.github.io/awesome-skills/
---

# Awesome Skills

> 人类能力图谱 — 1000+ 专家级 AI 技能，覆盖 60 个职业领域

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [theneoai/awesome-skills](https://github.com/theneoai/awesome-skills) |
| **Stars** | 55 |
| **Forks** | 23 |
| **许可证** | MIT |
| **语言** | JavaScript |
| **官网** | [theneoai.github.io/awesome-skills](https://theneoai.github.io/awesome-skills/) |
| **官方文档** | [📚 CATALOG.md](https://github.com/theneoai/awesome-skills/blob/main/CATALOG.md) |

## 核心特性

### skill-manager v1.0 质量生态系统

与其他仅提供静态内容的社区技能库不同，Awesome Skills 提供**完整的质量生态系统**：

```
┌─────────────────────────────────────────────────────────────┐
│                      QUALITY ECOSYSTEM                      │
├─────────────────────────────────────────────────────────────┤
│                    skill-manager v1.0                       │
├─────────────────────────────────────────────────────────────┤
│  CREATE            EVALUATE            RESTORE            │
│  ──────────────    ──────────────────  ─────────────────── │
│  Tier-based        Dual-track:         Transform 5-7/10     │
│  creation with     Text + Runtime       to 9.5/10 via       │
│  6-dimension      = True quality       7-step methodology   │
│  rubric            score                                    │
└─────────────────────────────────────────────────────────────┘
```

### 6 维度质量评分标准

| 维度 | 权重 | 要求 |
|------|------|------|
| **§1.1 身份认同** | 20% | 带企业背景的角色专属人设 |
| **§1.2 决策框架** | - | 带阈值的加权标准 |
| **§1.3 思维模式** | - | 领域专属心智模型 |
| **领域知识** | 20% | 具体数据、方法论、基准 |
| **工作流程** | 20% | 4-5 个阶段，含完成/失败标准 |
| **错误处理** | 15% | 反模式、风险矩阵 |
| **示例** | 15% | 5+ 个带真实数据的详细场景 |
| **元数据** | 10% | 完整 YAML 含评分 |

### 双轨验证体系

```
┌─────────────────────────────────────────────────────────────┐
│                    DUAL-TRACK VALIDATION                    │
├──────────────────────────┬──────────────────────────────────┤
│       文本质量 (50%)      │        运行时质量 (50%)          │
├──────────────────────────┼──────────────────────────────────┤
│ • 系统提示词       (20%) │ • 角色沉浸度         (20%)        │
│ • 领域知识         (20%) │ • 框架执行力         (20%)        │
│ • 工作流程         (20%) │ • 输出可操作性       (20%)        │
│ • 错误处理         (15%) │ • 知识准确性         (15%)        │
│ • 示例质量         (15%) │ • 对话稳定性         (15%)        │
│ • 元数据           (10%) │ • 抗干扰能力         (10%)        │
└──────────────────────────┴──────────────────────────────────┘
```

**认证阈值**：文本 ≥ 8.0 · 运行时 ≥ 8.0 · 方差 < 1.0

### 3 层架构

| 架构 | 行数 | 说明 |
|------|------|------|
| **Lite** | 50-150 | 单一功能工具 |
| **Standard** | 150-500 | 领域知识库 |
| **Enterprise** | 500-1500 | 完整方法论 |

### 渐进式披露

```
SKILL.md (≤ 300 行)：导航 + 框架
references/：深度内容 + 完整示例（按需加载）
```

**Token 优化**：通过 references-first 架构，Token 消耗降低 50%

## 7 步恢复方法论

| 步骤 | 时间 | 操作 |
|------|------|------|
| 1. 诊断 | 15 分钟 | 分析当前技能，识别缺陷 |
| 2. 研究 | 30-60 分钟 | 收集领域专属数据，替换通用术语 |
| 3. 架构 | 20 分钟 | 规划 §1.1/1.2/1.3、领域知识、工作流程 |
| 4. 渐进披露 | 15 分钟 | 创建 SKILL.md 骨架 (≤300 行) + references/ 结构 |
| 5. 内容生产 | 60-90 分钟 | 用专业、数据驱动的内容填充所有章节 |
| 6. 验证 | 15-30 分钟 | 运行 eval.sh，确认认证阈值达标 |
| 7. 交付 | 10 分钟 | 保存 EVALUATION_REPORT.md，生产环境执行认证 |

**典型提升**：5-7/10 → 9.5/10 (+3.0 至 +4.0 分)

## 精选企业技能

### 科技与互联网

| 技能 | 公司 | 核心方法论 | 质量 |
|------|------|-----------|------|
| [Tesla Engineer](https://github.com/theneoai/awesome-skills/blob/main/skills/enterprise/tesla/tesla-engineer/SKILL.md) | Tesla | 第一性原理、五步算法、使命驱动 | 9.5/10 |
| [Amazon Engineer](https://github.com/theneoai/awesome-skills/blob/main/skills/enterprise/amazon/amazon-engineer/SKILL.md) | Amazon | 14 条领导力原则、逆向工作、6 页备忘录 | 9.5/10 |
| [SpaceX Engineer](https://github.com/theneoai/awesome-skills/blob/main/skills/enterprise/spacex/spacex-engineer/SKILL.md) | SpaceX | 快速迭代、成本创新 | 9.5/10 |
| [NVIDIA ML Engineer](https://github.com/theneoai/awesome-skills/blob/main/skills/enterprise/nvidia/nvidia-ml-engineer/SKILL.md) | NVIDIA | CUDA 优化、GPU 平台 | 9.5/10 |

### AI 与前沿科技

| 技能 | 公司 | 核心方法论 | 质量 |
|------|------|-----------|------|
| [OpenAI Researcher](https://github.com/theneoai/awesome-skills/blob/main/skills/enterprise/openai/openai-researcher/SKILL.md) | OpenAI | AGI 聚焦、安全优先、RLHF | 9.5/10 |
| [Anthropic Researcher](https://github.com/theneoai/awesome-skills/blob/main/skills/enterprise/anthropic/anthropic-researcher/SKILL.md) | Anthropic | Constitutional AI、可解释性 | 9.5/10 |
| [DeepMind Researcher](https://github.com/theneoai/awesome-skills/blob/main/skills/enterprise/deepmind/deepmind-researcher/SKILL.md) | DeepMind | 科学 AI、AlphaGo/AlphaFold、学术严谨 | 9.5/10 |

### 咨询与金融

| 技能 | 公司 | 核心方法论 | 质量 |
|------|------|-----------|------|
| [McKinsey Consultant](https://github.com/theneoai/awesome-skills/blob/main/skills/enterprise/mckinsey/mckinsey-consultant/SKILL.md) | McKinsey | MECE、金字塔原理、七步成诗 | 9.5/10 |
| [Goldman Sachs Analyst](https://github.com/theneoai/awesome-skills/blob/main/skills/enterprise/goldman-sachs/goldman-sachs-analyst/SKILL.md) | Goldman Sachs | 14 条原则、风险管理、客户服务 | 9.5/10 |

### 制造与工业

| 技能 | 公司 | 核心方法论 | 质量 |
|------|------|-----------|------|
| [Toyota Engineer](https://github.com/theneoai/awesome-skills/blob/main/skills/enterprise/toyota/toyota-engineer/SKILL.md) | Toyota | TPS、JIT、改善、自働化、5 Why | 9.5/10 |
| [Huawei Engineer](https://github.com/theneoai/awesome-skills/blob/main/skills/enterprise/huawei/huawei-engineer/SKILL.md) | Huawei | 狼性文化、压强原则、备胎计划 | 9.5/10 |

### 消费与零售

| 技能 | 公司 | 核心方法论 | 质量 |
|------|------|-----------|------|
| [McDonald's](https://github.com/theneoai/awesome-skills/blob/main/skills/enterprise/mcdonalds/SKILL.md) | McDonald's | 特许经营、运营卓越 | 9.5/10 |
| [LVMH Brand Manager](https://github.com/theneoai/awesome-skills/blob/main/skills/enterprise/lvmh/lvmh-brand-manager/SKILL.md) | LVMH | 品牌管理、稀缺经济学 | 9.5/10 |

## 技能包

预打包的领域合集：

| 合集 | 覆盖 | 说明 |
|------|------|------|
| [tech](./packages/tech.md) | 软件、AI/ML、数据 | 技术团队 |
| [enterprise](./packages/enterprise.md) | 100+ 企业技能 | 商业分析 |
| [finance](./packages/finance.md) | 银行、咨询、投资 | 金融从业者 |
| [healthcare](./packages/healthcare.md) | 临床、医疗管理 | 医疗行业 |
| [executive](./packages/executive.md) | CEO、CTO、CFO、COO、CMO | 高管决策 |
| [software](./packages/software.md) | 后端、前端、DevOps、QA | 软件开发 |

## 项目结构

```
awesome-skills/
├── skills/                    # 967 个技能文件（SKILL.md），分 ~60 个分类
│   └── <category>/<role>/
│       ├── SKILL.md           # Frontmatter + 系统提示词（目标 ≤ 300 行）
│       ├── references/        # 按需加载的深度内容
│       └── EVALUATION_REPORT.md  # 可选：自评质量报告
├── packages/                  # 按领域打包的技能合集
├── roadmap/                   # 职业路径文档
├── external/                  # 第三方 skill 仓库注册表
│   ├── anthropics-skills/
│   ├── awesome-claude-code/
│   └── ...
├── tools/                     # Skill 分析 Python 包
│   └── skill_analyzer/       # 评分、token 统计、反模式扫描
├── scripts/                    # 维护脚本
├── benchmarks/                # 评估数据集 + 评分脚本
└── reports/                   # 评估报告
```

## 快速开始

### 安装单个技能

```
Read https://theneoai.github.io/awesome-skills/skills/enterprise/amazon-engineer/SKILL.md
```

### 各平台安装

| 平台 | 安装方式 |
|------|----------|
| **OpenCode** | `/skills install <url>` |
| **Claude Code** | Read URL → 创建 skills/ 目录 |
| **Cursor** | Read URL → Skill 面板 |
| **Cline** | Read URL → 自动加载 |
| **Codex** | Read URL → 系统提示词 |
| **Kimi** | Read URL → 上下文注入 |

详见 [INSTALL-GUIDE.md](https://github.com/theneoai/awesome-skills/blob/main/INSTALL-GUIDE.md)

## 工具包

仓库附带 Python 分析包：

```bash
pip install -e ./tools/
python -m tools.skill_analyzer.cli score        # 8 维度评分
python -m tools.skill_analyzer.cli tokenizer    # Token 预算与 API 成本
python -m tools.skill_analyzer.cli antipattern  # 反模式扫描
```

CI (`.github/workflows/quality.yml`) 会在修改了 `skills/`、`tools/` 的 PR 上运行这些工具。

## 外部生态

`external/` 是业界优秀 skill / subagent / plugin 仓库的**注册表**（非镜像）：

| 类别 | 仓库 |
|------|------|
| 官方 Anthropic | `anthropics/skills`, `claude-plugins-official` |
| 社区精选 | `VoltAgent/awesome-agent-skills`, `hesreallyhim/awesome-claude-code` |
| Subagent | `VoltAgent/awesome-claude-code-subagents`, `wshobson/agents` |

## 文档

| 文档 | 用途 |
|------|------|
| [CATALOG.md](https://github.com/theneoai/awesome-skills/blob/main/CATALOG.md) | 完整技能目录 |
| [INSTALL-GUIDE.md](https://github.com/theneoai/awesome-skills/blob/main/INSTALL-GUIDE.md) | 各平台安装指南 |
| [CONTRIBUTING.md](https://github.com/theneoai/awesome-skills/blob/main/CONTRIBUTING.md) | 如何贡献或改进技能 |

## 相关资源

| 资源 | 链接 |
|------|------|
| GitHub | https://github.com/theneoai/awesome-skills |
| 官网 | https://theneoai.github.io/awesome-skills/ |
| Skill Writer | https://theneoai.github.io/skill-writer/ |
| Awesome MCPs | https://github.com/theneoai/awesome-mcps |

## 适用场景

| 场景 | 说明 |
|------|------|
| **角色扮演** | 给 LLM 加载专业身份（医生、律师、工程师等） |
| **方法论学习** | 学习顶级公司方法论（Amazon、Tesla、McKinsey 等） |
| **Agent 开发** | 构建专业领域 Agent 的参考模板 |
| **技能评估** | 使用 dual-track 验证体系评估技能质量 |
| **技能优化** | 使用 7 步方法论将低质量技能提升至 9.5/10 |
