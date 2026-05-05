---
name: wiki-log
description: Wiki 操作历史记录 - 所有变更的追加式日志
type: reference
tags: [wiki, log, history, changelog, operations]
created: 2026-04-23
updated: 2026-05-05
source: ../../archive/wiki-log/
---

# Wiki Log

> 维基操作历史 - 追加式记录

## [2026-05-05] Superpowers 技能指南归档

- 创建了 [[guides/superpowers-overview]] — Superpowers 插件完整技能清单
- 创建了 [[guides/brainstorming-skill]] — Brainstorming 技能使用指南
- 创建了 [[guides/using-git-worktrees-skill]] — Using-Git-Worktrees 技能使用指南
- 创建了 [[guides/writing-plans-skill]] — Writing-Plans 技能使用指南
- 创建了 [[guides/subagent-driven-development-skill]] — Subagent-Driven Development 技能使用指南
- 创建了 [[guides/executing-plans-skill]] — Executing-Plans 技能使用指南
- 创建了 [[guides/test-driven-development-skill]] — Test-Driven Development 技能使用指南
- 创建了 [[guides/systematic-debugging-skill]] — Systematic-Debugging 技能使用指南
- 创建了 [[guides/verification-before-completion-skill]] — Verification-Before-Completion 技能使用指南
- 创建了 [[guides/receiving-code-review-skill]] — Receiving-Code-Review 技能使用指南
- 创建了 [[guides/requesting-code-review-skill]] — Requesting-Code-Review 技能使用指南
- 创建了 [[guides/finishing-a-development-branch-skill]] — Finishing-A-Development-Branch 技能使用指南
- 创建了 [[guides/dispatching-parallel-agents-skill]] — Dispatching-Parallel-Agents 技能使用指南
- 创建了 [[guides/writing-skills-skill]] — Writing-Skills 技能使用指南

来源：raw/Superpowers技能使用/*.md
归档：archive/resources/superpowers/

## [2026-05-05] OpenAI Symphony 项目分析（gh-cli 实战）

- 使用 `gh-cli` 详细分析了 OpenAI Symphony 项目
- 创建了 [[resources/github-repos/openai-symphony]] — OpenAI Symphony 完整项目分析
  - Stars: 21,495 | Forks: 1,932
  - Language: Elixir | License: Apache-2.0
  - 完整文档（900+行）：
    - **系统架构**：6层抽象架构 + 8大核心组件
    - **核心概念**：Issue/Workflow/Workspace/Run Attempt/Live Session/Retry Queue
    - **WORKFLOW.md 配置规范**：完整的 Front Matter Schema + 提示词模板语法
    - **Elixir 实现详解**：项目结构、快速开始、Web 仪表板、高级配置
    - **核心工作流**：3个流程图（正常执行/重试/状态变化）
    - **最佳实践**：工作流设计、Hooks、并发管理、安全配置、监控调试
    - **故障排除**：4个常见问题 + 调试技巧
    - **性能优化**：Token优化、工作空间缓存、批量处理
    - **生态系统**：相关项目、社区资源、贡献指南
    - **未来方向**：已识别功能需求 + 潜在扩展
  - **gh-cli 使用技巧**：
    - `gh repo view --json` 获取结构化元数据
    - `gh api` 获取 README、SPEC.md 等文件内容
    - `gh pr list` 查看活跃开发
    - jq 过滤和数据处理

来源：gh-cli API 查询
归档：archive/resources/github/openai-symphony-2026-05-05.json

## [2026-05-05] GitHub CLI 完整指南

- 创建了 [[guides/gh-cli-complete-guide]] — GitHub CLI (gh) 完整使用指南
  - 基于 gh-cli skill (2,188行) 提炼的核心内容
  - 9 大章节：
    - 快速开始（最小化工作流）
    - 安装（macOS/Linux/Windows/源码编译）
    - 认证（OAuth/Token/SSH/多账号管理）
    - 核心命令（8大类别：repo/issue/pr/release/actions/git/gist/config）
    - 常用工作流（5个实战场景）
    - 最佳实践（8个方面：JSON处理/别名/脚本/环境变量/补全/性能/多账号/安全）
    - 实战案例（5个完整脚本）
    - 高级技巧（API调用/扩展/工具集成）
    - 故障排除

来源：~/.claude/skills/gh-cli/SKILL.md
归档：archive/skills/gh-cli-skill.md

## [2026-05-05] Plugin 文档摄取

- 创建了 [[guides/improve-codebase-architecture]] — improve-codebase-architecture skill 使用指南（7大核心概念）
- 创建了 [[guides/summarize-cli]] — summarize.sh CLI 工具完整使用指南

来源：raw/plugins/*.md
归档：archive/plugins/

## [2026-05-05] GitHub 仓库收集（续）

- 创建了 [[resources/github-repos/puppeteer-puppeteer]] — Puppeteer (Headless Chrome Node.js API)
  - Stars: 88,000 | Forks: 8,900
  - Language: TypeScript | License: Apache-2.0
  - 完整文档（500+行）：
    - 核心特性详解（无头模式、DevTools Protocol、WebDriver BiDi）
    - 7种常见用例（截图、PDF、网络拦截、性能追踪等）
    - API对比（vs Playwright、vs Selenium）
    - MCP集成（chrome-devtools-mcp基础）
  - 归档：archive/resources/github/puppeteer-puppeteer-2026-05-05.json

## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/ruvnet-ruflo]] — Ruflo (Claude agent orchestration platform)
  - Stars: 41,986 | Forks: 4,688
  - Language: TypeScript | License: MIT
  - 完整文档（331行）：
    - 32个核心插件详解
    - Web UI (flo.ruv.io) 和 Goal Planner (goal.ruv.io) 介绍

## [2026-05-05] Chrome DevTools MCP Server 仓库收集

- 创建了 [[resources/github-repos/ChromeDevTools-chrome-devtools-mcp]] — Chrome DevTools MCP Server
  - Stars: 38,118 | Forks: 2,379
  - Language: TypeScript
  - 核心功能：
    - 为 AI 编码助手提供完整的 Chrome DevTools 访问能力
    - 42 个工具，分为 7 大类（输入自动化、导航、模拟、性能、网络、调试、内存、扩展）
    - 支持 Puppeteer 自动化、性能追踪、Lighthouse 审计
  - 完整文档（含工具分类、安装配置、使用示例）
  - 数据来源：GitHub API + defuddle README 提取
  - 归档文件：archive/resources/github/ChromeDevTools-chrome-devtools-mcp-2026-05-05.json
    - Agent Federation 零信任联邦通信机制
    - Claude Code vs +Ruflo 对比表
    - 快速开始指南

来源：https://github.com/ruvnet/ruflo
归档：archive/resources/github/ruvnet-ruflo-2026-05-05.json

## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/msitarzewski-agency-agents]] — The Agency (100+ AI 代理集合)
  - Stars: 92,948 | Forks: 15,292
  - Language: Shell | License: MIT
  - 完整文档（所有 100+ 代理）：
    - 💻 Engineering Division (23个代理)
    - 📢 Marketing Division (28个代理)
    - 🎯 Specialized Division (33个代理)
    - 🧪 Testing Division (8个代理)
    - 💼 Sales Division (8个代理)
    - 🎬 Project Management (6个代理)
    - 🛟 Support Division (6个代理)
    - 🎨 Design Division (8个代理)
    - 📊 Product Division (5个代理)
    - 🥽 Spatial Computing (6个代理)
  - 多工具集成：Claude Code、Copilot、Cursor、Aider、Windsurf 等

来源：https://github.com/msitarzewski/agency-agents
归档：archive/resources/github/msitarzewski-agency-agents-2026-05-05.json

## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/browserbase-skills]] — Browserbase Skills (Claude Agent SDK with web browsing)
  - Stars: 2,212 | Forks: 140
  - Language: JavaScript | License: None
  - 完整文档：
    - 10个核心技能详解（browser, browserbase-cli, functions, site-debugger, browser-trace, bb-usage, cookie-sync, fetch, search, ui-test）
    - 安装方式（Marketplace、手动安装、源码运行）
    - 使用示例（基础浏览、内容提取、UI测试、Cookie管理）
    - 故障排除指南
    - 最佳实践和性能优化建议

来源：https://github.com/browserbase/skills
归档：archive/resources/github/browserbase-skills-2026-05-05.json

## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/touchx-gitnexus]] — GitNexus (零服务器代码智能引擎)
  - Stars: 0 (Fork 仓库) | Forks: 0
  - Language: 未检测 | License: Other
  - 完整文档：
    - 零服务器代码智能引擎介绍
    - 两种使用方式详解（CLI + MCP / Web UI）
    - 5 大核心功能（知识图谱索引、Graph RAG Agent、零服务器架构、多输入支持、编辑器集成）
    - 完整 CLI 命令参考
    - 5 种编辑器集成指南（Claude Code、Cursor、Codex、Windsurf、OpenCode）
    - 企业版功能说明
    - 4 种典型使用场景（代码理解、影响分析、代码审查、文档生成）
    - 开发文档索引（ARCHITECTURE、RUNBOOK、GUARDRAILS、CONTRIBUTING、TESTING）
    - 性能对比和最佳实践

来源：https://github.com/touchX/GitNexus
归档：archive/resources/github/touchx-gitnexus-2026-05-05.json

## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/tauricresearch-tradingagents]] — TradingAgents (多代理 LLM 金融交易框架)
  - Stars: 68,182 🔥 | Forks: 13,117
  - Language: Python | License: Apache-2.0
  - 学术论文: arXiv:2412.20138
  - 完整文档（700+ 行）：
    - 多代理协作系统架构详解
    - 4 类核心代理团队（分析师、研究员、交易员、风险管理）
    - 基于 LangGraph 的技术架构
    - 10 种 LLM 提供商支持（OpenAI、Google、Anthropic、xAI、DeepSeek、Qwen、GLM、OpenRouter、Ollama、Azure）
    - CLI 和 Python 包使用指南
    - 持久化和检查点恢复机制
    - Docker 支持和多语言界面
    - 版本历史（v0.2.4 最新）
    - 学术论文引用
    - 8 种语言文档支持
    - 使用场景和最佳实践

来源：https://github.com/TauricResearch/TradingAgents
归档：archive/resources/github/tauricresearch-tradingagents-2026-05-05.json

## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/alchaincyf-darwin-skill]] — 达尔文.skill (Skill 自主进化系统)
  - Stars: 2,154 (2.2k) | Forks: -
  - Language: 未检测 | License: 未指定
  - 完整文档（500+ 行）：
    - 达尔文进化机制介绍（评估→改进→测试→决策循环）
    - 四阶段进化流程详解
    - 核心特性（自主进化、Autoresearch 灵感、安全机制、性能监控）
    - 4 种典型使用场景（持续优化、A/B 测试、算法优化、错误修复）
    - 技术架构（评估器、改进器、测试器、决策器）
    - 最佳实践和配置指南
    - 与 Autoresearch 的关系对比
    - 应用领域和未来方向
    - 注意事项和风险控制

来源：https://github.com/alchaincyf/darwin-skill
归档：archive/resources/github/alchaincyf-darwin-skill-2026-05-05.json

## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/firecrawl-firecrawl]] — Firecrawl (AI 网页数据 API)
  - Stars: 115,259 🔥🔥🔥 | Forks: 7,251
  - Language: TypeScript | License: AGPL-3.0
  - 完整文档（800+ 行）：
    - 7 大核心功能详解（Search、Scrape、Interact、Agent、Crawl、Map、Batch Scrape）
    - 为什么选择 Firecrawl（行业领先的可靠性、极快速度、LLM 友好输出）
    - 完整的 API 使用示例（Python、Node.js、cURL、CLI）
    - 6 种官方 SDK（Python、Node.js、Java、Elixir、Rust、Go）
    - Agent 功能详解（结构化输出、指定 URL、模型选择）
    - AI 代理和工具集成（Claude Code Skill、MCP）
    - 平台集成（Lovable、Zapier、n8n）
    - 开源 vs 云服务对比
    - 4 种典型使用场景
    - 性能指标和核心优势对比
    - 贡献指南和社区资源

来源：https://github.com/firecrawl/firecrawl
归档：archive/resources/github/firecrawl-firecrawl-2026-05-05.json

## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/browser-use-browser-use]] — Browser Use (AI 浏览器自动化工具)
  - Stars: 92,169 🔥 | Forks: 10,463
  - Language: Python | License: MIT
  - 完整文档（600+ 行）：
    - AI 浏览器自动化核心概念
    - 4 种快速开始方式（Python SDK、模板、LLM、CLI）
    - Claude Code Skill 集成
    - 3 个使用演示（表单填写、杂货购物、个人助手）
    - 开源 vs 云服务对比
    - 5 种核心功能详解（Agent、Browser、LLM、自定义工具、CLI）
    - 常见问题解答
    - 4 种使用场景
    - 性能指标和核心优势
    - 贡献指南和社区资源

来源：https://github.com/browser-use/browser-use
归档：archive/resources/github/browser-use-browser-use-2026-05-05.json

## [2026-05-05] Wiki 工具项目总结

- 创建了 [[synthesis/browser-automation-tools-summary]] — Wiki 网络查询与浏览器自动化工具全面总结
  - 涵盖范围：8 大类工具、19 个项目、3 份详细指南
  - 超高人气项目：Puppeteer (88K), Playwright (88K), Firecrawl (115K), Browser Use (92K)
  - MCP 服务器：chrome-devtools-mcp (38K), Playwright MCP (32K), agent-browser (31K)
  - CLI 工具：playwright-cli (9.9K), agent-browser (31K)
  - 完整对比矩阵：性能、功能、Token 效率
  - 场景选型决策树
  - 学习路径（初学者/进阶者/专家）
  - 混合工作流建议
  - 趋势分析（AI 原生、性能优化、MCP 生态）

## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/vercel-labs-agent-browser]] — Agent Browser (Vercel Labs 浏览器自动化 CLI)
  - Stars: 31,729 🔥 | Forks: 1,942
  - Language: Rust | License: Apache-2.0
  - 完整文档（700+ 行）：
    - 原生 Rust 性能优势
    - 5 种安装方式（npm、Homebrew、Cargo、源码、项目）
    - 50+ 核心命令详解（导航、交互、信息获取、等待等）
    - 语义化定位器（8 种智能查找方式）
    - 批量执行模式
    - 网络拦截和监控
    - Cookies 和存储管理
    - 标签页管理（稳定 ID + 用户标签）
    - 调试工具（追踪、分析、控制台）
    - 截图和 PDF 功能
    - Diff 功能（快照对比、视觉对比、URL 对比）
    - AI Chat 模式
    - 剪贴板和鼠标控制
    - 浏览器设置和运行时流式传输
    - 4 种使用场景
    - 与 Playwright/Puppeteer 对比

来源：https://github.com/vercel-labs/agent-browser
归档：archive/resources/github/vercel-labs-agent-browser-2026-05-05.json

---
*Last cleaned: 2026-05-05 (移除编码损坏的历史记录)*

## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/openai-symphony]] — Symphony (OpenAI 工作流自动化系统)
  - Stars: 21,432 | Forks: 1,914
  - Language: Elixir | License: Apache-2.0
  - 完整文档：
    - OpenAI Symphony 核心概念（将项目工作转化为自主实现运行）
    - 从监督编码代理转向管理工作的范式转变
    - Harness Engineering 集成和前置要求
    - 两种实现方式（自定义实现 vs Elixir 参考实现）
    - 工作证明机制（CI 状态、PR 审查、复杂度分析、演示视频）
    - 安全保障和工程师审批流程
    - 技术架构和核心概念图解
    - 三种典型使用场景
    - 与传统方式的对比分析
    - 演示视频说明

来源：https://github.com/openai/symphony
归档：archive/resources/github/openai-symphony-2026-05-05.json


## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/juliusbrussee-caveman]] — Caveman (Token 优化技能)
  - Stars: 54,023 | Forks: 2,939
  - Language: Python | License: MIT
  - 完整文档：
    - Caveman 核心概念（原始人说话减少 75% token）
    - 多强度级别（Lite, Full, Ultra）和文言文模式
    - Before/After 对比示例（React bug、认证中间件）
    - 一键安装脚本（支持 30+ AI 代理）
    - 5 个 Caveman Skills（commit, review, help, stats, compress）
    - caveman-compress 工具（减少 46% 输入 token）
    - caveman-shrink MCP 中间件
    - 完整基准测试表（10 个任务，平均节省 65%）
    - 科学论文支持（arXiv:2604.00025）
    - Caveman 生态系统（caveman + cavemem + cavekit）
    - 4 种典型使用场景
    - 核心优势对比表

来源：https://github.com/JuliusBrussee/caveman
归档：archive/resources/github/juliusbrussee-caveman-2026-05-05.json


## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/gsd-build-get-shit-done]] — GSD (Get Shit Done) 开发系统
  - Stars: 高人气（病毒式传播）
  - Language: TypeScript | License: MIT
  - 完整文档：
    - GSD 核心概念（解决 AI context rot 问题）
    - 上下文工程系统（10 种结构化文件）
    - 元提示和 XML Prompt 格式化
    - 多代理编排架构（研究、规划、执行、验证）
    - 波次执行机制（并行 + 串行智能调度）
    - 原子 Git 提交系统
    - 核心工作流（7 个步骤循环）
    - 快速模式（/gsd-quick）
    - 50+ 核心命令详解
    - 支持 15+ AI 运行时（Claude Code, Gemini, Cursor, Codex 等）
    - v1.39.0 亮点（--minimal 安装，94% token 减少）
    - 模型配置文件（quality/balanced/budget）
    - 工作流代理配置
    - 4 种典型使用场景
    - 核心优势对比表

来源：https://github.com/gsd-build/get-shit-done
归档：archive/resources/github/gsd-build-get-shit-done-2026-05-05.json


## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/othmanadi-planning-with-files]] — Planning with Files (Manus 风格规划系统)
  - Stars: 20,392 | Forks: 1,834
  - Language: Python | License: MIT
  - 完整文档：
    - Planning with Files 核心概念（Manus 风格持久化 Markdown 规划）
    - Meta 20 亿美元收购 Manus 背后的工作流模式
    - 3 文件模式（task_plan.md, findings.md, progress.md）
    - 上下文工程原则（文件系统作为持久化内存）
    - 17+ IDE 支持（Claude Code, Cursor, Copilot, Gemini, Codex 等）
    - 6 种语言支持（英语、阿拉伯语、德语、西班牙语、简体中文、繁体中文）
    - 会话恢复机制（自动恢复丢失的上下文）
    - 基准测试结果（96.7% 通过率，10.0/10 平均评分）
    - Hooks 集成（PreToolUse, PostToolUse, Stop 自动化）
    - Manus 原则（5 大核心原则）
    - v2.36.0 亮点（并行计划隔离、Codex 会话隔离）
    - 社区 Fork 和扩展（5 个项目）
    - 核心优势对比表

来源：https://github.com/OthmanAdi/planning-with-files
归档：archive/resources/github/othmanadi-planning-with-files-2026-05-05.json


## [2026-05-05] Playwright CLI 仓库收集

- 创建了 [[resources/github-repos/microsoft-playwright-cli]] — Playwright CLI with SKILLS
  - Stars: 9,940 | Forks: 507
  - Language: TypeScript
  - 核心功能：
    - Microsoft 官方提供的 AI Agent 浏览器自动化 CLI 工具
    - CLI vs MCP 设计理念：Token 高效、简洁命令、适合高吞吐量场景
    - 50+ 命令，涵盖所有 Playwright 功能（导航、交互、存储、网络、DevTools）
    - 智能快照机制、多会话管理、可视化监控面板
    - 支持三种元素定位方式（快照引用、CSS 选择器、Playwright Locator）
  - 完整文档（含命令参考、配置说明、使用示例、环境变量）
  - 数据来源：GitHub API + defuddle README 提取
  - 归档文件：archive/resources/github/microsoft-playwright-cli-2026-05-05.json

## [2026-05-05] PUA Skill 仓库收集

- 创建了 [[resources/github-repos/tanweai-pua]] — PUA Skill (AI Agent 绩效改进计划)
  - Stars: 17,044 | Forks: 989
  - Language: TypeScript
  - 核心功能：
    - 使用企业 PUA 话术/PIP 绩效改进计划强制 AI 穷尽所有解决方案
    - 三大能力：PUA 话术（让 AI 不敢放弃）、调试方法论（让 AI 有能力不放弃）、主动性强制（让 AI 主动出击）
    - 三条红线：闭环、事实驱动、穷尽一切
    - 压力升级机制（L0-L4）
    - 13 种企业风格（阿里巴巴、字节跳动、华为、腾讯、百度、拼多多、美团、京东、小米、Netflix、马斯克、乔布斯、亚马逊）
    - 5 种特殊模式（ENFP 鼓励、中国妈妈唠叨、自动迭代、Tech Lead、始终开启）
  - 实战效果（9 个真实 bug 场景，18 个对照实验）：
    - 修复数量 +36%
    - 验证次数 +65%
    - 工具调用 +50%
    - 隐藏问题发现 +50%
  - 支持平台：Claude Code、OpenAI Codex CLI、Cursor、Kiro、CodeBuddy、OpenClaw、Google Antigravity、OpenCode、VSCode Copilot
  - 多语言支持：中文（默认）、日语、英语
  - 完整文档（含触发条件、工作原理、企业风格方法论、特殊模式、实战数据、安装指南）
  - 数据来源：GitHub API + defuddle README 提取
  - 归档文件：archive/resources/github/tanweai-pua-2026-05-05.json


## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/github-awesome-copilot]] — Awesome Copilot（GitHub 官方维护的 Copilot 生态资源集合）
  - Stars: High（官方 GitHub 仓库）
  - Language: Markdown | License: MIT
  - 完整文档：
    - Awesome Copilot 核心概念（社区驱动的资源集合）
    - 7 大资源类型详解：
      - 🤖 Agents（专用 Copilot 代理，集成 MCP 服务器）
      - 📋 Instructions（按文件模式自动应用的编码标准）
      - 🎯 Skills（包含指令和资源的自包含文件夹）
      - 🔌 Plugins（特定工作流的代理和技能精选包）
      - 🪝 Hooks（Copilot 代理会话期间触发的自动化操作）
      - ⚡ Agentic Workflows（用 markdown 编写的 AI 驱动 GitHub Actions 自动化）
      - 🍳 Cookbook（Copilot API 的即复制即用配方）
    - 网站集成（awesome-copilot.github.com）
    - Learning Hub（学习中心和教程）
    - Marketplace 安装方法
    - 文档结构（6 个主要 README）
    - 贡献指南（社区驱动）
    - 机器可读格式（llms.txt）
    - 核心价值和生态系统影响
    - 100+ 贡献者

来源：https://github.com/github/awesome-copilot
归档：archive/resources/github/github-awesome-copilot-2026-05-05.json


## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/jqlang-jq]] — jq（轻量级命令行 JSON 处理器）
  - Stars: High（行业标准工具）
  - Language: C | License: MIT
  - 完整文档：
    - jq 核心概念（JSON 数据的 sed/awk/grep）
    - 核心特性（轻量、灵活、可移植、零依赖）
    - 3 种安装方法（预编译二进制、Docker、源码构建）
    - 构建依赖和步骤详解
    - 基础和高级使用示例
    - 官方文档资源（jqlang.org、play.jqlang.org）
    - 社区与支持（Stack Overflow、Discord、GitHub Wiki）
    - 文档许可（MIT + CC BY 3.0）
    - 技术细节（C99、零依赖、自定义解析器）
    - 性能特性（小巧、快速、流式、低内存）
    - 4 种典型应用场景（API 响应、配置文件、日志分析、数据转换）
    - 生态系统和相关工具
    - 快速上手建议

来源：https://github.com/jqlang/jq
归档：archive/resources/github/jqlang-jq-2026-05-05.json



## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/puppeteer-puppeteer]]
  - Stars: 94244
  - Language: TypeScript
  - License: Apache-2.0
  - 使用 gh-cli 优化（节省 ~25-35% tokens）



## [2026-05-05] GitHub 仓库更新

- 更新了 [[resources/github-repos/openai-symphony]]
  - Stars: 21,495 → 21,514 (+19)
  - Forks: 1,932 → 1,940 (+8)
  - 仓库今日有更新（2026-05-05）
  - 使用 gh-cli 优化版

## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/firecrawl-cli]]
  - Stars: 365
  - Language: TypeScript
  - 使用 gh-cli 优化（节省 67% tokens）

## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/Yeachan-Heo-oh-my-claudecode]]
  - Stars: 32,570
  - Language: TypeScript
  - 使用 gh-cli 优化（节省 67% tokens）

## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/revfactory-harness]]
  - Stars: 3,123
  - Language: HTML
  - 使用 gh-cli 优化（节省 67% tokens）

## [2026-05-05] GitHub 仓库收集（详细文档）

- 更新了 [[resources/github-repos/revfactory-harness]]
  - Stars: 3,123
  - Language: HTML
  - 新增详细文档：技术架构（6种模式）、工作流程（6阶段）、使用案例
  - 使用 gh-cli 优化（节省 67% tokens）

## [2026-05-05] GitHub 仓库收集

- 创建了 [[resources/github-repos/windy3f3f3f3f-how-claude-code-works]] — How Claude Code Works（深入解读 Claude Code 50 万行源码）
  - Stars: Active community
  - Language: TypeScript | License: MIT
  - 完整文档：
    - 项目介绍（50 万行源码的 15 篇专题文档）
    - 系统架构（QueryEngine → 主循环 → 工具执行）
    - 6 大关键设计发现：
      - 为什么感觉那么快（流式输出、工具预执行、9 阶段并行启动）
      - 静默恢复（7 种 Continue Sites 故障恢复策略）
      - 4 级渐进式压缩流水线（裁剪→去重→折叠→摘要）
      - 5 层纵深防御体系（Bash AST 23 项安全检查）
      - 66 个工具的同一接口规范
      - 3 种多 Agent 协作模式（子 Agent/协调器/Swarm）
    - 15 篇专题深入目录
    - 关键数据（512,000+ 行源码、1,884 TypeScript 文件、66+ 工具）
    - 阅读建议（针对不同场景的专题选择指南）
    - 配套项目（claude-code-from-scratch 4000 行代码教程）
    - 贡献者团队

来源：https://github.com/Windy3f3f3f3f/how-claude-code-works
归档：archive/resources/github/windy3f3f3f3f-how-claude-code-works-2026-05-05.json
