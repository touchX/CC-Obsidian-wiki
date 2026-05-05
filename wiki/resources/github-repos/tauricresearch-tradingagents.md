---
name: tauricresearch-tradingagents
description: TradingAgents - 多代理 LLM 金融交易框架
type: source
tags: [github, python, llm, trading, finance, multi-agent, langgraph]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/tauricresearch-tradingagents-2026-05-05.json
stars: 68182
language: Python
license: Apache-2.0
github_url: https://github.com/TauricResearch/TradingAgents
---

# TradingAgents

> [!info] Repository Overview
> **TradingAgents** 是一个多代理 LLM 金融交易框架，模仿真实交易公司的运作模式。通过部署专业化的 LLM 驱动代理——从基本面分析师、情绪专家、技术分析师，到交易员、风险管理团队，平台协作评估市场条件并指导交易决策。这些代理通过动态讨论来确定最佳策略。

## 📊 仓库统计

| 指标 | 数值 |
|------|------|
| ⭐ Stars | 68,182 🔥（超高人气！） |
| 🍴 Forks | 13,117 |
| 💻 语言 | Python |
| 🏢 所有者 | Tauric Research (Organization) |
| 📄 许可证 | Apache-2.0 |
| 🔗 链接 | [github.com/TauricResearch/TradingAgents](https://github.com/TauricResearch/TradingAgents) |
| 📄 论文 | [arXiv:2412.20138](https://arxiv.org/pdf/2412.20138) |
| 📅 创建时间 | 2024-12-28 |
| 📅 更新时间 | 2026-05-05 |
| 🔌 Open Issues | 361 |

> [!warning] 免责声明
> TradingAgents 框架专为研究目的设计。交易表现可能因多种因素而异，包括所选骨干语言模型、模型温度、交易周期、数据质量和其他非确定性因素。[它不构成金融、投资或交易建议。](https://tauric.ai/disclaimer/)

## 🎯 核心架构

### 多代理协作系统

框架将复杂的交易任务分解为专业化角色，确保系统实现稳健、可扩展的市场分析和决策方法。

```
┌─────────────────────────────────────────────────────┐
│                  TradingAgents 框架                  │
├─────────────────────────────────────────────────────┤
│                                                     │
│  ┌──────────────┐      ┌──────────────┐           │
│  │ Analyst Team │ ───▶ │ Researcher   │           │
│  │              │      │ Team         │           │
│  │ - Fundaments │      │ - Bullish    │           │
│  │ - Sentiment  │      │ - Bearish    │           │
│  │ - News       │      └──────────────┘           │
│  │ - Technical  │              │                  │
│  └──────────────┘              ▼                  │
│                          ┌──────────────┐         │
│                          │ Trader Agent │         │
│                          └──────────────┘         │
│                                  │                  │
│                          ┌──────────────┐         │
│                          │ Risk &       │         │
│                          │ Portfolio    │         │
│                          │ Manager      │         │
│                          └──────────────┘         │
│                                  │                  │
│                          ┌──────────────┐         │
│                          │ Executed     │         │
│                          │ Order        │         │
│                          └──────────────┘         │
└─────────────────────────────────────────────────────┘
```

### 1. 分析师团队（Analyst Team）

#### 基本面分析师（Fundamentals Analyst）
- **功能**: 评估公司财务和绩效指标
- **职责**:
  - 识别内在价值
  - 发现潜在风险信号
  - 分析财务报表
  - 评估业务模型

#### 情绪分析师（Sentiment Analyst）
- **功能**: 分析社交媒体和公众情绪
- **职责**:
  - 使用情绪评分算法
  - 评估短期市场情绪
  - 监控社交媒体趋势
  - 识别市场情绪转折点

#### 新闻分析师（News Analyst）
- **功能**: 监控全球新闻和宏观经济指标
- **职责**:
  - 解读事件对市场的影响
  - 追踪宏观经济数据
  - 评估新闻重要性
  - 预测市场反应

#### 技术分析师（Technical Analyst）
- **功能**: 利用技术指标检测交易模式
- **职责**:
  - 使用 MACD、RSI 等指标
  - 预测价格走势
  - 识别支撑/阻力位
  - 分析交易量和价格模式

### 2. 研究员团队（Researcher Team）

#### 多空研究员（Bullish & Bearish Researchers）
- **功能**: 批判性评估分析师团队提供的见解
- **职责**:
  - 通过结构化辩论平衡潜在收益和内在风险
  - 看多研究员强调机会
  - 看空研究员强调风险
  - 达成平衡的研究结论

### 3. 交易代理（Trader Agent）

- **功能**: 综合分析师和研究员的报告做出交易决策
- **职责**:
  - 确定交易时机
  - 决定交易规模
  - 基于全面市场洞察制定策略
  - 执行交易订单

### 4. 风险管理和投资组合经理

#### 风险管理团队
- **功能**: 持续评估投资组合风险
- **职责**:
  - 评估市场波动性
  - 评估流动性风险
  - 调整交易策略
  - 提供风险评估报告

#### 投资组合经理（Portfolio Manager）
- **功能**: 最终决策者
- **职责**:
  - 批准/拒绝交易提案
  - 综合所有代理建议
  - 管理整体投资组合
  - 执行最终决策

## 🚀 技术特性

### 基于 LangGraph 构建

- **灵活性**: 模块化设计，易于扩展
- **可扩展性**: 支持添加新的代理类型
- **可配置性**: 丰富的配置选项

### 多 LLM 提供商支持

| 提供商 | 模型系列 | 环境变量 |
|--------|---------|----------|
| **OpenAI** | GPT-5.x | `OPENAI_API_KEY` |
| **Google** | Gemini 3.x | `GOOGLE_API_KEY` |
| **Anthropic** | Claude 4.x | `ANTHROPIC_API_KEY` |
| **xAI** | Grok 4.x | `XAI_API_KEY` |
| **DeepSeek** | DeepSeek-V3 | `DEEPSEEK_API_KEY` |
| **Qwen** (阿里) | Qwen 系列 | `DASHSCOPE_API_KEY` |
| **GLM** (智谱) | GLM 系列 | `ZHIPU_API_KEY` |
| **OpenRouter** | 多模型聚合 | `OPENROUTER_API_KEY` |
| **Ollama** | 本地模型 | 配置 `llm_provider: "ollama"` |
| **Azure OpenAI** | 企业级 | `.env.enterprise` 配置 |

### 数据源支持

- **Alpha Vantage**: `ALPHA_VANTAGE_API_KEY`
- **新闻 API**: 内置新闻数据源
- **社交媒体**: 情绪分析数据源
- **技术指标**: 内置技术分析库

## 📦 安装与使用

### 方式 1: pip 安装

```bash
# 克隆仓库
git clone https://github.com/TauricResearch/TradingAgents.git
cd TradingAgents

# 创建虚拟环境
conda create -n tradingagents python=3.13
conda activate tradingagents

# 安装包和依赖
pip install .
```

### 方式 2: Docker 运行

```bash
# 复制环境变量配置
cp .env.example .env
# 编辑 .env 添加你的 API keys

# 运行
docker compose run --rm tradingagents

# 使用本地模型（Ollama）
docker compose --profile ollama run --rm tradingagents-ollama
```

### 配置 API Keys

```bash
# OpenAI
export OPENAI_API_KEY=your_key_here

# Google
export GOOGLE_API_KEY=your_key_here

# Anthropic
export ANTHROPIC_API_KEY=your_key_here

# xAI
export XAI_API_KEY=your_key_here

# DeepSeek
export DEEPSEEK_API_KEY=your_key_here

# Qwen (阿里)
export DASHSCOPE_API_KEY=your_key_here

# GLM (智谱)
export ZHIPU_API_KEY=your_key_here

# OpenRouter
export OPENROUTER_API_KEY=your_key_here

# Alpha Vantage
export ALPHA_VANTAGE_API_KEY=your_key_here
```

或复制 `.env.example` 到 `.env` 并填写：

```bash
cp .env.example .env
# 编辑 .env 文件
```

## 💻 CLI 使用

### 启动交互式 CLI

```bash
# 使用安装的命令
tradingagents

# 或直接从源码运行
python -m cli.main
```

### CLI 功能

交互式界面提供以下选项：
- 选择股票代码
- 设置分析日期
- 选择 LLM 提供商
- 配置研究深度
- 实时查看代理进度
- 查看交易决策结果

### Python 代码使用

```python
from tradingagents.graph.trading_graph import TradingAgentsGraph
from tradingagents.default_config import DEFAULT_CONFIG

# 使用默认配置
ta = TradingAgentsGraph(debug=True, config=DEFAULT_CONFIG.copy())

# 执行交易分析
_, decision = ta.propagate("NVDA", "2026-01-15")
print(decision)
```

### 自定义配置

```python
from tradingagents.graph.trading_graph import TradingAgentsGraph
from tradingagents.default_config import DEFAULT_CONFIG

config = DEFAULT_CONFIG.copy()

# 选择 LLM 提供商
config["llm_provider"] = "openai"  # openai, google, anthropic, xai, deepseek, qwen, glm, openrouter, ollama, azure

# 设置模型
config["deep_think_llm"] = "gpt-5.4"      # 复杂推理模型
config["quick_think_llm"] = "gpt-5.4-mini" # 快速任务模型

# 配置辩论轮数
config["max_debate_rounds"] = 2

# 启用检查点恢复
config["checkpoint_enabled"] = True

# 初始化并运行
ta = TradingAgentsGraph(debug=True, config=config)
_, decision = ta.propagate("NVDA", "2026-01-15")
print(decision)
```

## 💾 持久化和恢复

### 决策日志（Decision Log）

**始终启用**，每次运行完成后将决策追加到 `~/.tradingagents/memory/trading_memory.md`。

**工作流程**：
1. 下次运行相同股票时
2. TradingAgents 获取已实现收益（原始和相对 SPY 的 Alpha）
3. 生成一段反思
4. 将最近的同股票决策 + 跨股票经验注入投资组合经理提示词
5. 每次分析都携带之前有效和无效的经验

**自定义路径**：
```bash
export TRADINGAGENTS_MEMORY_LOG_PATH=/custom/path/trading_memory.md
```

### 检查点恢复（Checkpoint Resume）

**可选启用**，通过 `--checkpoint` 启用。

**功能**：
- LangGraph 在每个节点后保存状态
- 崩溃或中断的运行从最后成功的步骤恢复
- 避免从头开始重新运行

**使用方法**：
```bash
# 启用检查点
tradingagents analyze --checkpoint

# 清除所有检查点
tradingagents analyze --clear-checkpoints
```

**存储位置**：
- 每个股票的 SQLite 数据库：`~/.tradingagents/cache/checkpoints/<TICKER>.db`
- 自定义基础路径：`export TRADINGAGENTS_CACHE_DIR=/custom/path`

**日志提示**：
- 恢复运行：`Resuming from step N for <TICKER> on <date>`
- 新运行：`Starting fresh`
- 成功完成后自动清除检查点

## 📚 版本历史

### v0.2.4 (2026-04) - 最新版本

**新特性**：
- ✨ 结构化输出代理（研究经理、交易员、投资组合经理）
- ✨ LangGraph 检查点恢复
- ✨ 持久决策日志
- ✨ DeepSeek/Qwen/GLM/Azure 提供商支持
- ✨ Docker 支持
- 🐛 Windows UTF-8 编码修复

**文档**：[CHANGELOG.md](https://github.com/TauricResearch/TradingAgents/blob/main/CHANGELOG.md)

### v0.2.3 (2026-03)

- 多语言支持
- GPT-5.4 系列模型
- 统一模型目录
- 回测日期保真度
- 代理支持

### v0.2.2 (2026-03)

- GPT-5.4/Gemini 3.1/Claude 4.6 模型覆盖
- 五级评级量表
- OpenAI Responses API
- Anthropic effort 控制
- 跨平台稳定性

### v0.2.0 (2026-02)

- 多提供商 LLM 支持（GPT-5.x, Gemini 3.x, Claude 4.x, Grok 4.x）
- 改进的系统架构

### Trading-R1 (2026-01)

- [技术报告](https://arxiv.org/abs/2509.11420)发布
- [Terminal](https://github.com/TauricResearch/Trading-R1) 即将推出

## 🎓 学术论文

### 主论文

**TradingAgents: Multi-Agents LLM Financial Trading Framework**

- **arXiv ID**: 2412.20138
- **链接**: https://arxiv.org/abs/2412.20138
- **PDF**: https://arxiv.org/pdf/2412.20138

### Trading-R1 技术报告

- **arXiv ID**: 2509.11420
- **链接**: https://arxiv.org/abs/2509.11420
- **状态**: Terminal 即将推出

## 🌐 社区资源

> [!links]+ 相关链接
> - [GitHub 仓库](https://github.com/TauricResearch/TradingAgents)
> - [学术论文](https://arxiv.org/pdf/2412.20138)
> - [官方 Discord](https://discord.com/invite/hk9PGKShPK)
> - [官网](https://tauric.ai/)
> - [免责声明](https://tauric.ai/disclaimer/)
> - [YouTube Demo](https://www.youtube.com/watch?v=90gr5lwjIho)
> - [X/Twitter](https://x.com/TauricResearch)

### 多语言文档

- [中文](https://www.readme-i18n.com/TauricResearch/TradingAgents?lang=zh) | [English](https://www.readme-i18n.com/TauricResearch/TradingAgents?lang=en)
- [Deutsch](https://www.readme-i18n.com/TauricResearch/TradingAgents?lang=de) | [Español](https://www.readme-i18n.com/TauricResearch/TradingAgents?lang=es)
- [français](https://www.readme-i18n.com/TauricResearch/TradingAgents?lang=fr) | [日本語](https://www.readme-i18n.com/TauricResearch/TradingAgents?lang=ja)
- [한국어](https://www.readme-i18n.com/TauricResearch/TradingAgents?lang=ko) | [Português](https://www.readme-i18n.com/TauricResearch/TradingAgents?lang=pt)
- [Русский](https://www.readme-i18n.com/TauricResearch/TradingAgents?lang=ru)

## 🤝 贡献指南

欢迎社区贡献！无论是修复 bug、改进文档，还是建议新功能，您的输入都能让这个项目变得更好。

如果您对这条研究线感兴趣，请考虑加入我们的开源金融 AI 研究社区 [Tauric Research](https://tauric.ai/)。

**贡献认可**：过去的贡献（包括代码、设计反馈和 bug 报告）在每个版本的 [`CHANGELOG.md`](https://github.com/TauricResearch/TradingAgents/blob/main/CHANGELOG.md) 中记录。

## 📖 引用

如果 TradingAgents 对您有帮助，请引用我们的工作：

```bibtex
@misc{xiao2025tradingagentsmultiagentsllmfinancial,
      title={TradingAgents: Multi-Agents LLM Financial Trading Framework},
      author={Yijia Xiao and Edward Sun and Di Luo and Wei Wang},
      year={2025},
      eprint={2412.20138},
      archivePrefix={arXiv},
      primaryClass={q-fin.TR},
      url={https://arxiv.org/abs/2412.20138},
}
```

## 💡 使用场景

### 1. 学术研究

```
场景: 研究多代理系统在金融市场的应用
操作:
  1. 配置不同的 LLM 提供商
  2. 调整代理数量和类型
  3. 分析决策质量
  4. 发表研究论文
结果: 深入理解 AI 在金融决策中的作用
```

### 2. 量化交易策略研究

```
场景: 开发基于 AI 的交易策略
操作:
  1. 使用历史数据回测
  2. 分析不同市场条件下的表现
  3. 优化代理配置
  4. 评估风险收益比
结果: 获得数据驱动的交易策略
```

### 3. 金融教育

```
场景: 教授学生金融分析框架
操作:
  1. 展示多代理协作流程
  2. 解释不同分析师角色
  3. 演示决策制定过程
  4. 讨论风险管理重要性
结果: 学生理解专业交易公司的运作
```

### 4. AI Agent 开发

```
场景: 学习多代理系统设计
操作:
  1. 研究 LangGraph 架构
  2. 理解代理通信机制
  3. 分析状态管理
  4. 应用到其他领域
结果: 掌握多代理系统开发技能
```

## 🎯 核心优势

| 特性 | 传统量化交易 | TradingAgents |
|------|-------------|---------------|
| **决策方式** | 预设规则 | AI 多代理协作 |
| **市场理解** | 单一维度 | 多维度（基本面+技术+情绪+新闻） |
| **适应性** | 静态策略 | 动态学习和调整 |
| **风险管理** | 固定参数 | 持续评估和调整 |
| **透明度** | 黑盒 | 可解释的决策过程 |
| **扩展性** | 有限 | 易于添加新代理和数据源 |

## ⚙️ 配置选项

### 默认配置（DEFAULT_CONFIG）

```python
{
    # LLM 配置
    "llm_provider": "openai",
    "deep_think_llm": "gpt-5.4",
    "quick_think_llm": "gpt-5.4-mini",

    # 代理配置
    "max_debate_rounds": 2,
    "temperature": 0.7,

    # 数据配置
    "lookback_days": 30,
    "news_count": 10,

    # 持久化配置
    "checkpoint_enabled": False,
    "memory_log_enabled": True,

    # 风险管理
    "max_position_size": 0.1,  # 最大仓位比例
    "stop_loss": 0.05,          # 止损比例
}
```

## 🚨 注意事项

### 性能因素

交易表现可能因以下因素而异：
- 选择的骨干语言模型
- 模型温度设置
- 交易周期
- 数据质量
- 其他非确定性因素

### 最佳实践

1. **模型选择**: 使用最新的 GPT-5.4 或 Claude 4.6 获得最佳性能
2. **温度设置**: 较低温度（0.3-0.5）产生更一致的决策
3. **数据质量**: 确保高质量的市场数据输入
4. **风险控制**: 始终设置止损和仓位限制
5. **回测验证**: 在实盘前进行充分的历史回测
6. **持续监控**: 定期审查代理决策和投资组合表现

## 📊 性能指标

### 仓库活跃度

- ⭐ **68,182 Stars** - 超高人气（Top 0.1%）
- 🍴 **13,117 Forks** - 活跃社区参与
- 🔧 **361 Open Issues** - 活跃开发中
- 📅 **持续更新** - 2026-05-05 最新更新

### 技术成熟度

- ✅ **生产级代码**: Apache-2.0 许可证
- ✅ **学术背书**: arXiv 论文支持
- ✅ **企业支持**: Azure OpenAI 集成
- ✅ **多语言**: 8 种语言文档
- ✅ **社区**: Discord 活跃社区

---

*最后更新: 2026-05-05*
*数据来源: GitHub API + README.md + arXiv 论文*
