---
name: freedomintelligence-openclaw-medical-skills
description: 目前最大的开源医疗 AI 技能库 — 869 个 AI Agent 模块，转化 Claude 为专业生物医学研究平台
type: source
version: 1.0
tags: [github, python, ai, agents, claude-code, medical, healthcare, bioinformatics, clinical, skills]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/resources/github/FreedomIntelligence-OpenClaw-Medical-Skills-2026-04-29.json
stars: 2200
forks: 280
language: Python
license: MIT
github_url: https://github.com/FreedomIntelligence/OpenClaw-Medical-Skills
---

# OpenClaw Medical Skills

> 目前现存最大的开源医疗 AI 技能库 — 869 个独立的 AI Agent 模块

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [FreedomIntelligence/OpenClaw-Medical-Skills](https://github.com/FreedomIntelligence/OpenClaw-Medical-Skills) |
| **Stars** | 2,200+ |
| **Forks** | 280+ |
| **许可证** | MIT |
| **语言** | Python |
| **技能数量** | 869 |
| **来源仓库** | 12+ 开源技能库聚合 |

## 核心价值

| 无技能状态 | 配备 OpenClaw Medical Skills |
|---|---|
| 针对医学的泛泛 AI 回答 | 真实的 PubMed / ClinicalTrials.gov / FDA 查询 |
| 缺乏生物信息学能力 | RNA-seq、scRNA-seq、GWAS、变异检测流程 |
| 缺乏药物情报 | ChEMBL、DrugBank、DDI 预测 |

## 项目结构

```
OpenClaw-Medical-Skills/
├── README.md              # 英文文档
├── README_zh.md           # 中文文档
├── scripts/
│   └── validate_skill.py  # 技能验证脚本
└── skills/                # 869 个技能目录
    └── <skill-name>/
        └── SKILL.md       # 核心指令文件
```

## 技能架构

### 技能加载层级

| 优先级 | 路径 | 作用域 |
|--------|------|--------|
| **高** | `<workspace>/skills/` | 单个工作区（推荐） |
| **低** | `~/.openclaw/skills/` | 全局共享 |

**注意**：工作区级技能优先于全局技能

### 技能命名规范

| 模式 | 示例 | 来源/领域 |
|------|------|-----------|
| `kebab-case` | `pubmed-search`, `clinical-reports` | 原始 OpenClaw |
| `bio-*` | `bioinformatics-rnaseq`, `bio-alignment` | gptomics 生物信息学 |
| `bioos-*` | `bioos-oncology`, `bioos-immunology` | BioOS 扩展套件 |
| `tooluniverse-*` | `tooluniverse-drug-research` | 工具宇宙综合技能 |
| `*-workflow` | `bio-workflows-variant-calling` | 端到端流水线 |
| `*-database` | `clinvar-database`, `alphafold-database` | 数据库访问技能 |

## 主要技能领域

### 技能分布概览

| 领域 | 技能数量 | 核心功能 |
|------|----------|----------|
| **BioOS 扩展套件** | 285 | 肿瘤学、免疫学、临床 AI、研究基础设施 |
| **生物信息学套件** | 239 | FASTQ QC、比对、变异检测、CRISPR 筛选 |
| **临床与医学** | 119 | HIPAA/FDA 合规报告、SOAP 病历、出院小结 |
| **药物情报** | 15+ | ChEMBL、DrugBank、药物警戒、DDI 预测 |
| **其他** | ~200 | 医疗数据库访问、精准医学、监管科学 |

### 临床与医学技能（119 个）

使 Agent 具备真实的医疗工作流能力：
- **临床报告**：HIPAA/FDA 合规的 SOAP 病历、出院小结、病例报告
- **医学影像**：DICOM 解析、病理切片 AI 诊断
- **药物标签**：FDA 药品标签查询与解析
- **临床决策支持**：诊断推理、试验设计

### 生物信息学套件（239 个）

涵盖完整测序分析生命周期：
```
原始数据 → 质量控制 → 接头修剪 → 比对 → 变异检测 → 注释 → 临床解读
```

主要领域：
- FASTQ 质量控制与预处理
- 序列比对（BWA、MEM 等）
- 变异检测与 VCF 注释
- RNA-seq 差异表达分析
- 单细胞 scRNA-seq 分析
- CRISPR 筛选命中鉴定

### 药物情报与药物警戒（15+ 个）

贯穿整个药物生命周期：
- **化合物鉴定**：ChEMBL、DrugBank 数据库查询
- **靶点验证**：药物-靶点相互作用分析
- **DDI 预测**：药物-药物相互作用预测
- **药物警戒**：FDA 不良事件数据库（FAERS）分析
- **药物重定位**：老药新用分析

### 精准医学与变异解读（8 个集成技能）

完整解读流程：
1. **VCF 变异调用** → 原始数据处理
2. **ACMG 分类** → 胚系突变分类
3. **CIViC/OncoKB** → 体细胞突变评估
4. **多基因风险量化**
5. **结构变异分析**
6. **治疗建议生成**
7. **临床试验匹配**
8. **患者分层**

**证据分级**：生成 0-100 致病性评分（非简单五级标签）

### BioOS 扩展套件（285 个）

最大的主题技能集合，划分为八个能力域：

| 领域 | 技能数 | 核心功能 |
|------|--------|----------|
| **肿瘤学与精准医疗** | 21 | 肿瘤图谱、液体活检、MRD、多模态影像 AI |
| **血液学与血液疾病** | 7 | 血液系统疾病分析 |
| **免疫学与细胞疗法** | 9 | 免疫疗法设计、CAR-T |
| **单细胞与空间组学** | 16 | scRNA-seq、空间转录组 |
| **药物发现与设计** | - | 化合物筛选、先导优化 |
| **临床 AI** | - | 临床决策支持、电子病历 |
| **研究基础设施** | 18 | 数据管理、版本控制、再现性 |

## ClawBio 流水线编排

将独立生物信息学工具技能转化为可组合的端到端分析工作流：

```
Agent 框架 → 内核调度 → 流水线技能 → 底层生物信息学原语
```

### 支持的工作流语言

| 语言 | 用途 | 执行引擎 |
|------|------|----------|
| **Snakemake** | Python原生工作流 | 本地/HPC |
| **Nextflow** | 云原生管道 | nf-core/云 |
| **WDL** | 临床级工作流 | Cromwell/miniwdl |
| **CWL** | 标准化可移植工作流 | cwltool/Toil |

## 快速开始

### 安装方式

```bash
# 步骤 1：克隆仓库
git clone https://github.com/MedClaw-Org/OpenClaw-Medical-Skills.git

# 步骤 2a：安装到特定工作区（推荐）
cp -r OpenClaw-Medical-Skills/skills/* <your-workspace>/skills/

# 步骤 2b：全局安装
cp -r OpenClaw-Medical-Skills/skills/* ~/.openclaw/skills/
```

### NanoClaw 安装

```bash
# 步骤 1：克隆仓库
git clone https://github.com/MedClaw-Org/OpenClaw-Medical-Skills.git

# 步骤 2：复制到容器目录
cp -r OpenClaw-Medical-Skills/skills/* /path/to/nanoclaw/container/skills/

# 步骤 3：重新构建容器
cd /path/to/nanoclaw
docker build -t nanoclaw .
```

### 额外目录配置（无需复制）

在 `~/.openclaw/openclaw.json` 中配置：

```json
{
  "skills": {
    "load": {
      "extraDirs": ["/path/to/OpenClaw-Medical-Skills/skills"]
    }
  }
}
```

**优势**：运行 `git pull` 即可更新所有技能

### 选择性安装

```bash
# 只安装临床技能
for skill in "clinical-reports" "pubmed-search" "clinical-trials"; do
  cp -r OpenClaw-Medical-Skills/skills/$skill ~/.openclaw/skills/
done

# 只安装生物信息学技能
for skill in "bio-fastqc" "bio-alignment" "bio-variant-calling"; do
  cp -r OpenClaw-Medical-Skills/skills/$skill ~/.openclaw/skills/
done
```

## 验证安装

### 交互式验证

启动新对话会话，向 Agent 发送：

```
What medical and clinical skills do you have available?
```

**预期**：Agent 回复已安装技能的分类列表及其功能

### 批量验证脚本

```bash
# 验证所有已安装的技能
for skill_dir in ~/.openclaw/skills/*/; do
  skill_name=$(basename "$skill_dir")
  python OpenClaw-Medical-Skills/scripts/validate_skill.py "$skill_name"
done
```

## 依赖关系与交叉引用

技能之间形成隐式依赖链：

```
PubMed Search → Clinical Reports → Clinical Decision Support
     ↓              ↓                    ↓
Clinical Trials → SOAP Notes → Discharge Summary
     ↓              ↓                    ↓
Drug Labels  → Drug-Drug Interaction → Pharmacovigilance
```

**建议**：安装完整医学技能集以确保所有依赖可用

## 相关资源

| 资源 | 链接 |
|------|------|
| GitHub | https://github.com/FreedomIntelligence/OpenClaw-Medical-Skills |
| OpenClaw | https://github.com/MedClaw-Org/OpenClaw |
| NanoClaw | https://github.com/MedClaw-Org/NanoClaw |
| ClawHub CLI | OpenClaw 包管理器 |
| BioOS | mdbabumiamssm/LLMs-Universal-Life-Science-and-Clinical-Skills |
| gptomics | 生物信息学套件来源 |

## 适用场景

| 场景 | 适用技能 |
|------|----------|
| **临床文档** | `clinical-reports` + `soap-notes` |
| **医学研究** | `pubmed-search` + `clinical-trials` |
| **生物信息学** | `bio-*` 套件 + `bio-workflows-*` |
| **药物发现** | `tooluniverse-*` + `drug-*` 技能 |
| **精准医学** | `precision-medicine-*` + `variant-*` |
| **药物警戒** | `adverse-event-detection` + `drug-interaction` |
| **工作流编排** | `bio-orchestrator` + `bio-workflow-management-*` |
