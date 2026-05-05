---
name: msitarzewski-agency-agents
description: The Agency - 100+ 专业化 AI 代理集合，涵盖工程、设计、营销、销售、产品、项目管理、测试、支持、空间计算等领域
type: source
version: 1.0
tags: [github, shell, agents, ai, claude-code, automation, workflows]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/msitarzewski-agency-agents-2026-05-05.json
stars: 92948
language: Shell
license: MIT
github_url: https://github.com/msitarzewski/agency-agents
---

# The Agency: AI Specialists

> [!info]+ 项目概述
> - **类型**: AI Agent Collection
> - **语言**: Shell
> - **许可证**: MIT
> - **Stars**: 92,948
> - **代理数量**: 100+ 专业化 AI 代理

## 🎯 核心价值

**The Agency** 是一个精心打造的 AI 代理个性集合，从 Reddit 线程诞生，经过数月迭代而成。每个代理都是：

- **🎯 专业化**：深度领域专业知识（非通用提示模板）
- **🧠 个性驱动**：独特的声音、沟通风格和方法
- **📋 交付导向**：真实的代码、流程和可衡量的结果
- **✅ 生产就绪**：经过实战测试的工作流程和成功指标

**核心思想**：组建你的梦之队，只不过他们是永不疲倦、永不抱怨、始终交付的 AI 专家。

---

## ⚡ 快速开始

### 方式 1：与 Claude Code 一起使用（推荐）

```bash
# 将所有代理安装到 Claude Code 目录
./scripts/install.sh --tool claude-code

# 或手动复制特定分类
cp engineering/*.md ~/.claude/agents/

# 在 Claude Code 会话中激活任何代理：
# "Hey Claude，激活 Frontend Developer 模式并帮我构建 React 组件"
```

### 方式 2：作为参考使用

每个代理文件包含：
- 身份和个性特征
- 核心使命和工作流程
- 技术交付成果和代码示例
- 成功指标和沟通风格

### 方式 3：与其他工具集成（GitHub Copilot、Cursor、Aider、Windsurf 等）

```bash
# 步骤 1 - 为所有支持的工具生成集成文件
./scripts/convert.sh

# 步骤 2 - 交互式安装（自动检测已安装的工具）
./scripts/install.sh

# 或直接针对特定工具
./scripts/install.sh --tool cursor
./scripts/install.sh --tool aider
./scripts/install.sh --tool windsurf
```

---

## 🎨 The Agency 完整名单

### 💻 工程部门（Engineering Division）

**Building the future, one commit at a time.**

| 代理 | 专长 | 使用场景 |
|------|------|---------|
| 🎨 [Frontend Developer](engineering/engineering-frontend-developer.md) | React/Vue/Angular, UI实现, 性能优化 | 现代Web应用、像素级UI、Core Web Vitals优化 |
| 🏗️ [Backend Architect](engineering/engineering-backend-architect.md) | API设计、数据库架构、可扩展性 | 服务端系统、微服务、云基础设施 |
| 📱 [Mobile App Builder](engineering/engineering-mobile-app-builder.md) | iOS/Android, React Native, Flutter | 原生和跨平台移动应用 |
| 🤖 [AI Engineer](engineering/engineering-ai-engineer.md) | ML模型、部署、AI集成 | 机器学习功能、数据管道、AI驱动应用 |
| 🚀 [DevOps Automator](engineering/engineering-devops-automator.md) | CI/CD、基础设施自动化、云运维 | 流水线开发、部署自动化、监控 |
| ⚡ [Rapid Prototyper](engineering/engineering-rapid-prototyper.md) | 快速POC开发、MVP | 快速概念验证、黑客马拉松项目、快速迭代 |
| 💎 [Senior Developer](engineering/engineering-senior-developer.md) | Laravel/Livewire、高级模式 | 复杂实现、架构决策 |
| 🔧 [Filament Optimization Specialist](engineering/engineering-filament-optimization-specialist.md) | Filament PHP管理UX、表单重构、资源优化 | 重构Filament资源/表单/表格以实现更快、更清洁的管理工作流 |
| 🔒 [Security Engineer](engineering/engineering-security-engineer.md) | 威胁建模、安全代码审查、安全架构 | 应用安全、漏洞评估、安全CI/CD |
| ⚡ [Autonomous Optimization Architect](engineering/engineering-autonomous-optimization-architect.md) | LLM路由、成本优化、影子测试 | 需要智能API选择和成本护栏的自主系统 |
| 🔩 [Embedded Firmware Engineer](engineering/engineering-embedded-firmware-engineer.md) | 裸机、RTOS、ESP32/STM32/Nordic固件 | 生产级嵌入式系统和IoT设备 |
| 🚨 [Incident Response Commander](engineering/engineering-incident-response-commander.md) | 事件管理、事后分析、待命 | 管理生产事件和建立事件准备 |
| ⛓️ [Solidity Smart Contract Engineer](engineering/engineering-solidity-smart-contract-engineer.md) | EVM合约、Gas优化、DeFi | 安全、Gas优化的智能合约和DeFi协议 |
| 🧭 [Codebase Onboarding Engineer](engineering/engineering-codebase-onboarding-engineer.md) | 快速开发者入职、只读代码库探索、事实说明 | 帮助新开发者快速理解不熟悉的仓库 |
| 📚 [Technical Writer](engineering/engineering-technical-writer.md) | 开发者文档、API参考、教程 | 清晰、准确的技术文档 |
| 🎯 [Threat Detection Engineer](engineering/engineering-threat-detection-engineer.md) | SIEM规则、威胁狩猎、ATT&CK映射 | 构建检测层和威胁狩猎 |
| 💬 [WeChat Mini Program Developer](engineering/engineering-wechat-mini-program-developer.md) | 微信生态系统、小程序、支付集成 | 为微信生态系统构建高性能应用 |
| 👁️ [Code Reviewer](engineering/engineering-code-reviewer.md) | 建设性代码审查、安全性、可维护性 | PR审查、代码质量门控、通过审查进行指导 |
| 🗄️ [Database Optimizer](engineering/engineering-database-optimizer.md) | 模式设计、查询优化、索引策略 | PostgreSQL/MySQL调优、慢查询调试、迁移规划 |
| 🌿 [Git Workflow Master](engineering/engineering-git-workflow-master.md) | 分支策略、约定式提交、高级Git | Git工作流设计、历史清理、CI友好的分支管理 |
| 🏛️ [Software Architect](engineering/engineering-software-architect.md) | 系统设计、DDD、架构模式、权衡分析 | 架构决策、领域建模、系统演进策略 |
| 🛡️ [SRE](engineering/engineering-sre.md) | SLO、错误预算、可观测性、混沌工程 | 生产可靠性、减少琐事、容量规划 |
| 🧬 [AI Data Remediation Engineer](engineering/engineering-ai-data-remediation-engineer.md) | 自愈管道、气隙SLM、语义聚类 | 大规模修复损坏的数据，零数据丢失 |
| 🔧 [Data Engineer](engineering/engineering-data-engineer.md) | 数据管道、湖仓架构、ETL/ELT | 构建可靠的数据基础设施和仓储 |
| 🔗 [Feishu Integration Developer](engineering/engineering-feishu-integration-developer.md) | 飞书/开放平台、机器人、工作流 | 为飞书生态系统构建集成 |
| 🧱 [CMS Developer](engineering/engineering-cms-developer.md) | WordPress和Drupal主题、插件/模块、内容架构 | 代码优先的CMS实现和定制 |
| 📧 [Email Intelligence Engineer](engineering/engineering-email-intelligence-engineer.md) | 邮件解析、MIME提取、AI代理的结构化数据 | 将原始邮件线程转换为推理就绪的上下文 |
| 🎙️ [Voice AI Integration Engineer](engineering/engineering-voice-ai-integration-engineer.md) | 语音转文字管道、Whisper、ASR、说话人分离 | 端到端转录管道、音频预处理、结构化转录交付 |

**小计**：23 个工程专家

---

### 🎨 设计部门（Design Division）

**Making it beautiful, usable, and delightful.**

| 代理 | 专长 | 使用场景 |
|------|------|---------|
| 🎯 [UI Designer](design/design-ui-designer.md) | 视觉设计、组件库、设计系统 | 界面创建、品牌一致性、组件设计 |
| 🔍 [UX Researcher](design/design-ux-researcher.md) | 用户测试、行为分析、研究 | 理解用户、可用性测试、设计洞察 |
| 🏛️ [UX Architect](design/design-ux-architect.md) | 技术架构、CSS系统、实现 | 开发者友好的基础、实现指导 |
| 🎭 [Brand Guardian](design/design-brand-guardian.md) | 品牌身份、一致性、定位 | 品牌策略、身份开发、指导方针 |
| 📖 [Visual Storyteller](design/design-visual-storyteller.md) | 视觉叙事、多媒体内容 | 引人入胜的视觉故事、品牌叙事 |
| ✨ [Whimsy Injector](design/design-whimsy-injector.md) | 个性、愉悦、顽皮的交互 | 添加快乐、微交互、彩蛋、品牌个性 |
| 📷 [Image Prompt Engineer](design/design-image-prompt-engineer.md) | AI图像生成提示、摄影 | 为 Midjourney、DALL-E、Stable Diffusion 提供摄影提示 |
| 🌈 [Inclusive Visuals Specialist](design/design-inclusive-visuals-specialist.md) | 代表性、偏见缓解、真实图像 | 生成文化准确的AI图像和视频 |

**小计**：8 个设计专家

---

### 💰 付费媒体部门（Paid Media Division）

**Turning ad spend into measurable business outcomes.**

| 代理 | 专长 | 使用场景 |
|------|------|---------|
| 💰 [PPC Campaign Strategist](paid-media/paid-media-ppc-strategist.md) | Google/Microsoft/Amazon Ads、账户架构、竞价 | 账户构建、预算分配、扩展、性能诊断 |
| 🔍 [Search Query Analyst](paid-media/paid-media-search-query-analyst.md) | 搜索词分析、否定关键词、意图映射 | 查询审计、消除浪费支出、关键词发现 |
| 📋 [Paid Media Auditor](paid-media/paid-media-auditor.md) | 200+点账户审计、竞争分析 | 账户接管、季度审查、竞争推介 |
| 📡 [Tracking & Measurement Specialist](paid-media/paid-media-tracking-specialist.md) | GTM、GA4、转化跟踪、CAPI | 新实施、跟踪审计、平台迁移 |
| ✍️ [Ad Creative Strategist](paid-media/paid-media-creative-strategist.md) | RSA文案、Meta创意、Performance Max资产 | 创意发布、测试程序、广告疲劳刷新 |
| 📺 [Programmatic & Display Buyer](paid-media/paid-media-programmatic-buyer.md) | GDN、DSP、合作伙伴媒体、ABM展示 | 展示规划、合作伙伴外联、ABM程序 |
| 📱 [Paid Social Strategist](paid-media/paid-media-paid-social-strategist.md) | Meta、LinkedIn、TikTok、跨平台社交 | 社交广告程序、平台选择、受众策略 |

**小计**：7 个付费媒体专家

---

### 💼 销售部门（Sales Division）

**Turning pipeline into revenue through craft, not CRM busywork.**

| 代理 | 专长 | 使用场景 |
|------|------|---------|
| 🎯 [Outbound Strategist](sales/sales-outbound-strategist.md) | 基于信号的开拓、多渠道序列、ICP定位 | 通过研究驱动的开拓建立管道，而非数量 |
| 🔍 [Discovery Coach](sales/sales-discovery-coach.md) | SPIN、Gap Selling、Sandler — 问题设计和通话结构 | 准备发现通话、合格机会、指导代表 |
| ♟️ [Deal Strategist](sales/sales-deal-strategist.md) | MEDDPICC资格、竞争定位、赢取规划 | 评分交易、暴露管道风险、构建赢取策略 |
| 🛠️ [Sales Engineer](sales/sales-engineer.md) | 技术演示、POC范围、竞争战斗卡 | 预售技术胜利、演示准备、竞争定位 |
| 🏹 [Proposal Strategist](sales/sales-proposal-strategist.md) | RFP响应、赢取主题、叙事结构 | 撰写有说服力的提案，而非仅仅合规 |
| 📊 [Pipeline Analyst](sales/sales-pipeline-analyst.md) | 预测、管道健康、交易速度、RevOps | 管道审查、预测准确性、收入运营 |
| 🗺️ [Account Strategist](sales/sales-account-strategist.md) | 落地扩展、QBR、利益相关者映射 | 售后扩展、账户规划、NRR增长 |
| 🏋️ [Sales Coach](sales/sales-coach.md) | 代表发展、通话指导、管道审查促进 | 通过结构化指导让每个代表和每个交易更好 |

**小计**：8 个销售专家

---

### 📢 营销部门（Marketing Division）

**Growing your audience, one authentic interaction at a time.**

| 代理 | 专长 | 使用场景 |
|------|------|---------|
| 🚀 [Growth Hacker](marketing/marketing-growth-hacker.md) | 快速用户获取、病毒循环、实验 | 爆炸式增长、用户获取、转化优化 |
| 📝 [Content Creator](marketing/marketing-content-creator.md) | 多平台内容、编辑日历 | 内容策略、文案写作、品牌叙事 |
| 🐦 [Twitter Engager](marketing/marketing-twitter-engager.md) | 实时互动、思想领导力 | Twitter策略、LinkedIn活动、专业社交 |
| 📱 [TikTok Strategist](marketing/marketing-tiktok-strategist.md) | 病毒内容、算法优化 | TikTok增长、病毒内容、Gen Z/千禧一代受众 |
| 📸 [Instagram Curator](marketing/marketing-instagram-curator.md) | 视觉叙事、社区建设 | Instagram策略、美学发展、视觉内容 |
| 🤝 [Reddit Community Builder](marketing/marketing-reddit-community-builder.md) | 真实互动、价值驱动内容 | Reddit策略、社区信任、真实营销 |
| 📱 [App Store Optimizer](marketing/marketing-app-store-optimizer.md) | ASO、转化优化、可发现性 | 应用营销、商店优化、应用增长 |
| 🌐 [Social Media Strategist](marketing/marketing-social-media-strategist.md) | 跨平台策略、活动 | 整体社交策略、多平台活动 |
| 📕 [Xiaohongshu Specialist](marketing/marketing-xiaohongshu-specialist.md) | 生活方式内容、趋势驱动策略 | 小红书增长、美学叙事、Gen Z受众 |
| 💬 [WeChat Official Account Manager](marketing/marketing-wechat-official-account.md) | 订阅者互动、内容营销 | 微信OA策略、社区建设、转化优化 |
| 🧠 [Zhihu Strategist](marketing/marketing-zhihu-strategist.md) | 思想领导力、知识驱动互动 | 知乎权威建设、Q&A策略、潜在客户开发 |
| 🇨🇳 [Baidu SEO Specialist](marketing/marketing-baidu-seo-specialist.md) | 百度优化、中国SEO、ICP合规 | 在百度排名并触达中国搜索市场 |
| 🎬 [Bilibili Content Strategist](marketing/marketing-bilibili-content-strategist.md) | B站算法、弹幕文化、UP主增长 | 通过社区优先内容在Bilibili建立受众 |
| 🎠 [Carousel Growth Engine](marketing/marketing-carousel-growth-engine.md) | TikTok/Instagram轮播、自主发布 | 生成和发布病毒式轮播内容 |
| 💼 [LinkedIn Content Creator](marketing/marketing-linkedin-content-creator.md) | 个人品牌、思想领导力、专业内容 | LinkedIn增长、专业受众建设、B2B内容 |
| 🛒 [China E-Commerce Operator](marketing/marketing-china-ecommerce-operator.md) | 淘宝、天猫、拼多多、直播商务 | 在中国运行多平台电商 |
| 🎥 [Kuaishou Strategist](marketing/marketing-kuaishou-strategist.md) | 快手、老铁社区、草根增长 | 在下沉市场建立真实受众 |
| 🔍 [SEO Specialist](marketing/marketing-seo-specialist.md) | 技术SEO、内容策略、链接建设 | 驱动可持续的有机搜索增长 |
| 📘 [Book Co-Author](marketing/marketing-book-co-author.md) | 思想领导力书籍、代笔、出版 | 为创始人和专家进行战略书籍合作 |
| 🌏 [Cross-Border E-Commerce Specialist](marketing/marketing-cross-border-ecommerce.md) | Amazon、Shopee、Lazada、跨境履约 | 全漏斗跨境电商策略 |
| 🎵 [Douyin Strategist](marketing/marketing-douyin-strategist.md) | 抖音平台、短视频营销、算法 | 在中国领先的短视频平台上增长受众 |
| 🎙️ [Livestream Commerce Coach](marketing/marketing-livestream-commerce-coach.md) | 主播培训、直播间优化、转化 | 构建高性能直播电商运营 |
| 🎧 [Podcast Strategist](marketing/marketing-podcast-strategist.md) | 播客内容策略、平台优化 | 中国播客市场策略和运营 |
| 🔒 [Private Domain Operator](marketing/marketing-private-domain-operator.md) | 企业微信、私域流量、社区运营 | 构建企业微信私域生态系统 |
| 🎬 [Short-Video Editing Coach](marketing/marketing-short-video-editing-coach.md) | 后期制作、编辑工作流、平台规范 | 亲自短视频编辑培训和优化 |
| 🔥 [Weibo Strategist](marketing/marketing-weibo-strategist.md) | 新浪微博、热门话题、粉丝互动 | 全谱微博运营和增长 |
| 🔮 [AI Citation Strategist](marketing/marketing-ai-citation-strategist.md) | AEO/GEO、AI推荐可见性、引用审计 | 在 ChatGPT、Claude、Gemini、Perplexity 上提高品牌可见度 |
| 🇨🇳 [China Market Localization Strategist](marketing/marketing-china-market-localization-strategist.md) | 全栈中国市场本地化、抖音/小红书/微信GTM | 将趋势信号转化为可执行的中国进入市场策略 |
| 🎬 [Video Optimization Specialist](marketing/marketing-video-optimization-specialist.md) | YouTube算法策略、分章、缩略图概念 | YouTube频道增长、视频SEO、受众留存优化 |

**小计**：28 个营销专家

---

### 📊 产品部门（Product Division）

**Building the right thing at the right time.**

| 代理 | 专长 | 使用场景 |
|------|------|---------|
| 🎯 [Sprint Prioritizer](product/product-sprint-prioritizer.md) | 敏捷规划、功能优先级 | 冲刺规划、资源分配、待办事项管理 |
| 🔍 [Trend Researcher](product/product-trend-researcher.md) | 市场情报、竞争分析 | 市场研究、机会评估、趋势识别 |
| 💬 [Feedback Synthesizer](product/product-feedback-synthesizer.md) | 用户反馈分析、洞察提取 | 反馈分析、用户洞察、产品优先级 |
| 🧠 [Behavioral Nudge Engine](product/product-behavioral-nudge-engine.md) | 行为心理学、助推设计、参与度 | 通过行为科学最大化用户动机 |
| 🧭 [Product Manager](product/product-manager.md) | 全生命周期产品所有权 | 发现、PRD、路线图规划、GTM、结果衡量 |

**小计**：5 个产品专家

---

### 🎬 项目管理部门（Project Management Division）

**Keeping the trains running on time (and under budget).**

| 代理 | 专长 | 使用场景 |
|------|------|---------|
| 🎬 [Studio Producer](project-management/project-management-studio-producer.md) | 高层编排、组合管理 | 多项目监督、战略对齐、资源分配 |
| 🐑 [Project Shepherd](project-management/project-management-project-shepherd.md) | 跨职能协调、时间线管理 | 端到端项目协调、利益相关者管理 |
| ⚙️ [Studio Operations](project-management/project-management-studio-operations.md) | 日常效率、流程优化 | 卓越运营、团队支持、生产力 |
| 🧪 [Experiment Tracker](project-management/project-management-experiment-tracker.md) | A/B测试、假设验证 | 实验管理、数据驱动决策、测试 |
| 👔 [Senior Project Manager](project-management/project-manager-senior.md) | 现实范围、任务转换 | 将规范转换为任务、范围管理 |
| 📋 [Jira Workflow Steward](project-management/project-management-jira-workflow-steward.md) | Git工作流、分支策略、可追溯性 | 强制执行Jira链接的Git纪律和交付 |

**小计**：6 个项目管理专家

---

### 🧪 测试部门（Testing Division）

**Breaking things so users don't have to.**

| 代理 | 专长 | 使用场景 |
|------|------|---------|
| 📸 [Evidence Collector](testing/testing-evidence-collector.md) | 基于截图的QA、视觉证明 | UI测试、视觉验证、错误文档 |
| 🔍 [Reality Checker](testing/testing-reality-checker.md) | 基于证据的认证、质量门控 | 生产准备、质量批准、发布认证 |
| 📊 [Test Results Analyzer](testing/testing-test-results-analyzer.md) | 测试评估、指标分析 | 测试输出分析、质量洞察、覆盖报告 |
| ⚡ [Performance Benchmarker](testing/testing-performance-benchmarker.md) | 性能测试、优化 | 速度测试、负载测试、性能调优 |
| 🔌 [API Tester](testing/testing-api-tester.md) | API验证、集成测试 | API测试、端点验证、集成QA |
| 🛠️ [Tool Evaluator](testing/testing-tool-evaluator.md) | 技术评估、工具选择 | 评估工具、软件推荐、技术决策 |
| 🔄 [Workflow Optimizer](testing/testing-workflow-optimizer.md) | 流程分析、工作流改进 | 流程优化、效率增益、自动化机会 |
| ♿ [Accessibility Auditor](testing/testing-accessibility-auditor.md) | WCAG审计、辅助技术测试 | 可访问性合规、屏幕阅读器测试、包容性设计验证 |

**小计**：8 个测试专家

---

### 🛟 支持部门（Support Division）

**The backbone of the operation.**

| 代理 | 专长 | 使用场景 |
|------|------|---------|
| 💬 [Support Responder](support/support-support-responder.md) | 客户服务、问题解决 | 客户支持、用户体验、支持运营 |
| 📊 [Analytics Reporter](support/support-analytics-reporter.md) | 数据分析、仪表板、洞察 | 商业智能、KPI跟踪、数据可视化 |
| 💰 [Finance Tracker](support/support-finance-tracker.md) | 财务规划、预算管理 | 财务分析、现金流、业务绩效 |
| 🏗️ [Infrastructure Maintainer](support/support-infrastructure-maintainer.md) | 系统可靠性、性能优化 | 基础设施管理、系统运营、监控 |
| ⚖️ [Legal Compliance Checker](support/support-legal-compliance-checker.md) | 合规、法规、法律审查 | 法律合规、监管要求、风险管理 |
| 📑 [Executive Summary Generator](support/support-executive-summary-generator.md) | C级沟通、战略总结 | 高管报告、战略沟通、决策支持 |

**小计**：6 个支持专家

---

### 🥽 空间计算部门（Spatial Computing Division）

**Building the immersive future.**

| 代理 | 专长 | 使用场景 |
|------|------|---------|
| 🏗️ [XR Interface Architect](spatial-computing/xr-interface-architect.md) | 空间交互设计、沉浸式UX | AR/VR/XR界面设计、空间计算UX |
| 💻 [macOS Spatial/Metal Engineer](spatial-computing/macos-spatial-metal-engineer.md) | Swift、Metal、高性能3D | macOS空间计算、Vision Pro原生应用 |
| 🌐 [XR Immersive Developer](spatial-computing/xr-immersive-developer.md) | WebXR、基于浏览器的AR/VR | 基于浏览器的沉浸式体验、WebXR应用 |
| 🎮 [XR Cockpit Interaction Specialist](spatial-computing/xr-cockpit-interaction-specialist.md) | 基于驾驶舱的控制、沉浸式系统 | 驾驶舱控制系统、沉浸式控制界面 |
| 🍎 [visionOS Spatial Engineer](spatial-computing/visionos-spatial-engineer.md) | Apple Vision Pro开发 | Vision Pro应用、空间计算体验 |
| 🔌 [Terminal Integration Specialist](spatial-computing/terminal-integration-specialist.md) | 终端集成、命令行工具 | CLI工具、终端工作流、开发者工具 |

**小计**：6 个空间计算专家

---

### 🎯 专业化部门（Specialized Division）

**The unique specialists who don't fit in a box.**

| 代理 | 专长 | 使用场景 |
|------|------|---------|
| 🎭 [Agents Orchestrator](specialized/agents-orchestrator.md) | 多代理协调、工作流管理 | 需要多代理协调的复杂项目 |
| 🔍 [LSP/Index Engineer](specialized/lsp-index-engineer.md) | Language Server Protocol、代码智能 | 代码智能系统、LSP实现、语义索引 |
| 📥 [Sales Data Extraction Agent](specialized/sales-data-extraction-agent.md) | Excel监控、销售指标提取 | 销售数据摄取、MTD/YTD/年底指标 |
| 📈 [Data Consolidation Agent](specialized/data-consolidation-agent.md) | 销售数据聚合、仪表板报告 | 区域摘要、代表绩效、管道快照 |
| 📬 [Report Distribution Agent](specialized/report-distribution-agent.md) | 自动报告分发 | 基于区域的报告分发、定时发送 |
| 🔐 [Agentic Identity & Trust Architect](specialized/agentic-identity-trust.md) | 代理身份、认证、信任验证 | 多代理身份系统、代理授权、审计跟踪 |
| 🔗 [Identity Graph Operator](specialized/identity-graph-operator.md) | 多代理系统的共享身份解析 | 实体去重、合并提案、跨代理身份一致性 |
| 💸 [Accounts Payable Agent](specialized/accounts-payable-agent.md) | 付款处理、供应商管理、审计 | 跨加密、法币、稳定币的自主支付执行 |
| 🛡️ [Blockchain Security Auditor](specialized/blockchain-security-auditor.md) | 智能合约审计、漏洞分析 | 在部署前发现合约中的漏洞 |
| 📋 [Compliance Auditor](specialized/compliance-auditor.md) | SOC 2、ISO 27001、HIPAA、PCI-DSS | 指导组织通过合规认证 |
| 🌍 [Cultural Intelligence Strategist](specialized/specialized-cultural-intelligence-strategist.md) | 全球UX、代表性、文化排斥 | 确保软件跨文化共鸣 |
| 🗣️ [Developer Advocate](specialized/specialized-developer-advocate.md) | 社区建设、DX、开发者内容 | 连接产品和开发者社区 |
| 🔬 [Model QA Specialist](specialized/specialized-model-qa.md) | ML审计、功能分析、可解释性 | 机器学习模型的端到端QA |
| 🗃️ [ZK Steward](specialized/zk-steward.md) | 知识管理、Zettelkasten、笔记 | 构建连接的、验证的知识库 |
| 🔌 [MCP Builder](specialized/specialized-mcp-builder.md) | Model Context Protocol服务器、AI代理工具 | 构建扩展AI代理能力的MCP服务器 |
| 📄 [Document Generator](specialized/specialized-document-generator.md) | PDF、PPTX、DOCX、XLSX从代码生成 | 专业文档创建、报告、数据可视化 |
| ⚙️ [Automation Governance Architect](specialized/automation-governance-architect.md) | 自动化治理、n8n、工作流审计 | 大规模评估和管理业务自动化 |
| 📚 [Corporate Training Designer](specialized/corporate-training-designer.md) | 企业培训、课程开发 | 设计培训系统和学习计划 |
| 🏛️ [Government Digital Presales Consultant](specialized/government-digital-presales-consultant.md) | 中国ToG预售、数字化转型 | 政府数字化转型提案和投标 |
| ⚕️ [Healthcare Marketing Compliance](specialized/healthcare-marketing-compliance.md) | 中国医疗广告合规 | 医疗营销监管合规 |
| 🎯 [Recruitment Specialist](specialized/recruitment-specialist.md) | 人才获取、招聘运营 | 招聘策略、采购和招聘流程 |
| 🎓 [Study Abroad Advisor](specialized/study-abroad-advisor.md) | 国际教育、申请规划 | 美国、英国、加拿大、澳大利亚的留学规划 |
| 🔗 [Supply Chain Strategist](specialized/supply-chain-strategist.md) | 供应链管理、采购策略 | 供应链优化和采购规划 |
| 🗺️ [Workflow Architect](specialized/specialized-workflow-architect.md) | 工作流发现、映射和规范 | 在编写代码之前映射系统中的每条路径 |
| ☁️ [Salesforce Architect](specialized/specialized-salesforce-architect.md) | 多云Salesforce设计、治理限制、集成 | 企业Salesforce架构、组织战略、部署管道 |
| 🇫🇷 [French Consulting Market Navigator](specialized/specialized-french-consulting-market.md) | ESN/SI生态系统、portage salarial、费率定位 | 法国IT市场的自由职业咨询 |
| 🇰🇷 [Korean Business Navigator](specialized/specialized-korean-business-navigator.md) | 韩国商业文化、의사流程、关系机制 | 外国专业人士驾驭韩国商业关系 |
| 🏗️ [Civil Engineer](specialized/specialized-civil-engineer.md) | 结构分析、岩土设计、全球建筑规范 | 跨Eurocode、ACI、AISC等的多种标准结构工程 |
| 🎧 [Customer Service](specialized/customer-service.md) | 全渠道支持、投诉处理、保留、升级 | 零售、SaaS、酒店、金融、物流的任何行业客户支持 |
| 🏥 [Healthcare Customer Service](specialized/healthcare-customer-service.md) | HIPAA感知的患者支持、计费、保险、紧急路由 | 需要合规、同理心患者支持的医疗组织 |
| 🏨 [Hospitality Guest Services](specialized/hospitality-guest-services.md) | 预订、礼宾、投诉恢复、忠诚度、活动 | 酒店、度假村、餐厅和活动场所 |
| 🤝 [HR Onboarding](specialized/hr-onboarding.md) | 预入职、合规、福利登记、30-60-90天计划 | 从初创公司到企业的任何公司入职新员工 |
| 🌐 [Language Translator](specialized/language-translator.md) | 西班牙语↔英语翻译、方言意识、文化背景 | 旅游、商务、医疗和法律翻译需求 |
| ⏱️ [Legal Billing & Time Tracking](specialized/legal-billing-time-tracking.md) | 时间捕获、计费叙述、IOLTA合规、收款 | 律师事务所最大化收入追回和计费准确性 |
| 📋 [Legal Client Intake](specialized/legal-client-intake.md) | 潜在客户资格、冲突筛选、咨询安排 | 律师事务所将咨询转化为保留客户 |
| ⚖️ [Legal Document Review](specialized/legal-document-review.md) | 合同审查、风险标记、版本比较、合规 | 跨任何实践领域的律师就绪的第一遍审查 |

**小计**：33 个专业化专家

---

## 📊 统计数据

### 部门分布

| 部门 | 代理数量 | 占比 |
|------|---------|------|
| 💻 Engineering | 23 | 20% |
| 📢 Marketing | 28 | 25% |
| 🎯 Specialized | 33 | 29% |
| 🧪 Testing | 8 | 7% |
| 💼 Sales | 8 | 7% |
| 🎬 Project Management | 6 | 5% |
| 🛟 Support | 6 | 5% |
| 🎨 Design | 8 | 7% |
| 📊 Product | 5 | 4% |
| 🥽 Spatial Computing | 6 | 5% |

**总计**：**100+ 专业化 AI 代理**

### 项目规模

| 指标 | 数值 |
|------|------|
| **Stars** | 92,948 |
| **Forks** | 15,292 |
| **Open Issues** | 120 |
| **Size** | 2,588 KB |
| **Created** | 2025-10-13 |
| **Last Updated** | 2026-05-05 |
| **License** | MIT |

---

## 🔧 多工具集成支持

**支持的 AI 编码工具**：

- ✅ Claude Code（推荐）
- ✅ GitHub Copilot
- ✅ Cursor
- ✅ Aider
- ✅ Windsurf
- ✅ Antigravity
- ✅ Gemini CLI
- ✅ OpenCode
- ✅ OpenClaw
- ✅ Kimi Code

---

## 💡 核心特性

### 1. 专业化而非通用化

每个代理都是领域专家，而非通用提示模板。例如：
- **Frontend Developer** 专注于 React/Vue/Angular 深度优化
- **Security Engineer** 专注于威胁建模和安全代码审查
- **Reddit Community Builder** 专注于真实的社区互动

### 2. 个性驱动

每个代理都有独特的：
- **声音**：沟通风格和语气
- **方法**：解决问题的方法论
- **交付成果**：具体的技术产出

### 3. 生产就绪

所有代理都包含：
- ✅ 经过实战测试的工作流程
- ✅ 明确的成功指标
- ✅ 可衡量的交付成果
- ✅ 代码示例和最佳实践

### 4. 跨职能协作

通过 **Agents Orchestrator** 协调多个代理，实现：
- 复杂项目的端到端管理
- 跨职能团队协作
- 工作流自动化

---

## 🚀 使用场景

### 场景 1：全栈开发项目

```
Frontend Developer (UI实现)
    +
Backend Architect (API设计)
    +
Security Engineer (安全审查)
    +
DevOps Automator (CI/CD)
```

### 场景 2：产品发布

```
Product Manager (产品规划)
    +
Sprint Prioritizer (优先级)
    +
Growth Hacker (增长策略)
    +
Content Creator (内容营销)
```

### 场景 3：企业级系统

```
Software Architect (系统设计)
    +
SRE (可靠性工程)
    +
Security Engineer (安全)
    +
Incident Response Commander (事件响应)
```

---

## 📚 相关资源

> [!links]+ 相关链接
> - [GitHub 仓库](https://github.com/msitarzewski/agency-agents)
> - [Stars](https://github.com/msitarzewski/agency-agents/stargazers)
> - [Issues](https://github.com/msitarzewski/agency-agents/issues)
> - [Discussions](https://github.com/msitarzewski/agency-agents/discussions)
> - [Sponsor](https://github.com/sponsors/msitarzewski)

---

## 🎯 项目优势

| 优势 | 说明 |
|------|------|
| **规模最大** | 100+ 专业化代理，覆盖所有关键职能 |
| **实战验证** | 每个代理都经过实际项目验证 |
| **易于集成** | 支持 Claude Code、Copilot、Cursor 等主流工具 |
| **个性鲜明** | 每个代理都有独特的个性和方法论 |
| **生产就绪** | 包含完整的代码示例和工作流程 |
| **社区驱动** | 92,948+ Stars，活跃的社区贡献 |
| **持续更新** | 定期添加新的专业化代理 |

---

*归档日期: 2026-05-05*
*数据来源: GitHub API + README.md*
*完整文档: 参见 [[../../../archive/resources/github/msitarzewski-agency-agents-2026-05-05.json]]*
