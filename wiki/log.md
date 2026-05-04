
---

## [2026-05-04] docs-ingest | RAG �����������̴̳���

- **����**: �ĵ���ȡ �� ���� Bilibili ��Ƶ�ű� �� ���� Wiki �̳�ҳ�� �� �鵵Դ�ļ�
- **Դ�ļ�**: `raw/Clippings/Bilibili/2026-05-04-RAG ����������⡪��һ��������֪ʶ�ⱳ��ļ���ȫ����.md` (���˵ļ���������, BV1JLN2z4EZQ, 17:00)
- **��������**:
  - RAG ����壨Retrieval Augmented Generation ������ǿ���ɣ�
  - RAG ������������⣨�����Ĵ������ơ������ɱ��ߡ������ٶ�����
  - �����Ľ׶���⣺
    1. **��Ƭ��Chunking��**��������/����/�½��з��ĵ�
    2. **������Indexing��**��Embedding �� ���� �� �������ݿ�
    3. **�ٻأ�Retrieval��**���������ƶ� �� Top 10 Ƭ��
    4. **���ţ�Reranking��**��CrossEncoder �� Top 3 Ƭ��
    5. **���ɣ�Generation��**��LLM ����Ƭ�����ɴ�
  - �������ĸ��������Vector����Embedding���������ݿ�
  - �������ƶȼ��㷽�����������ƶȡ�ŷʽ���롢�����
  - ��������ʾ��������ǰ����׼�� + ���ʺ��ʴ����̣�
  - ����ջ�ܽᣨEmbedding ģ�͡��������ݿ⡢CrossEncoder��LLM��
  - �����Ż�����
- **�����ļ�**:
  - `wiki/tutorials/rag-mechanism-guide.md` �� �̳�ҳ��
  - `archive/clippings/bilibili/2026-05-04-rag-mechanism/ԭʼ��Ļ.md` �� �鵵Դ�ļ�
- **��� Wiki**: [[tutorials/agent-concepts-principles-patterns]]��[[tutorials/agentic-ai-course]]
---
name: wiki-log
description: Wiki 操作历史记录 �?所有变更的追加式日�?type: reference
tags: [wiki, log, history, changelog, operations]
created: 2026-04-23
updated: 2026-05-04
source: ../../archive/wiki-log/
---

# Wiki Log

> 维基操作历史 �?追加式记�?
---

## [2026-05-04] docs-ingest | Agent 概念、原理与构建模式教程创建

- **操作**: 文档摄取 �?分析 Bilibili 视频脚本 �?创建 Wiki 教程页面 �?归档源文�?- **源文�?*: `raw/Clippings/Bilibili/2026-05-04-Agent 的概念、原理与构建模式 —�?从零打造一个简化版�?Claude Code.md` (马克的技术工作坊, BV1TSg7zuEqR, 28:05)
- **创建内容**:
  - Agent 概念定义（配备工具的 AI 系统，模�?工具+主程序）
  - ReAct 模式详解（Thought �?Action �?Observation 循环�?  - ReAct 实现原理（XML 标签 System Prompt、工具调用机制）
  - 动手实现 ReAct Agent（Python + GPT-4o 完整代码示例�?  - ReAct 运行时序图（六步循环流程�?  - Plan-And-Execute 模式（规划阶�?+ 执行阶段 + Replan 动态调整）
  - 三轮执行循环示例（查询澳网冠军家乡完整案例）
  - 两种模式对比（ReAct vs Plan-And-Execute�?- **新增文件**:
  - `wiki/tutorials/agent-concepts-principles-patterns.md` �?教程页面
  - `archive/clippings/bilibili/2026-05-04-agent-concepts-principles-patterns/原始字幕.md` �?归档源文�?- **相关 Wiki**: [[tutorials/claude-code-complete-guide]]、[[concepts/agentic-ai-design-patterns]]、[[tutorials/agentic-ai-course]]

---

## [2026-05-04] docs-ingest | Claude Code �?0 �?1 全攻略教程创�?
- **操作**: 文档摄取 �?分析 Bilibili 视频脚本 �?创建 Wiki 教程页面 �?归档源文�?- **源文�?*: `raw/Clippings/Bilibili/2026-05-04-Claude Code �?0 �?1 全攻略：MCP _ SubAgent _ Agent Skill _ Hook _ 图片 _ 上下文处理_ 后台任务.md` (马克的技术工作坊, BV14rzQB9EJj, 44:43)
- **创建内容**:
  - 三种运行模式详解（默认模�?自动模式/规划模式）及 Shift+Tab 切换
  - 权限系统（三种授权选项、dangerously-skip-permissions�?  - 后台任务管理（Ctrl+B 后台运行�?tasks 查看任务、K 关闭服务�?  - 版本回滚�?rewind、ESC×2 触发，只能回�?Claude 写入的文件）
  - 图片处理（拖�?Ctrl+V 粘贴�?  - MCP Server 集成（以 Figma 为例�?  - 上下文管理（/compact 压缩�?clear 清空�?  - CLAUDE.md 配置详解（四级位置与优先级、路径范围规则）
  - Hook 系统（PreToolUse/PostToolUse/Stop、三级配置）
  - Agent Skill（与 Hook 的区别、存储位置、使用方式）
  - SubAgent（独立上下文/工具/模型，与 Skill 的区别）
  - Plugin 系统（全家桶安装�?  - 快捷键速查�?- **新增文件**:
  - `wiki/tutorials/claude-code-complete-guide.md` �?教程页面
  - `archive/clippings/bilibili/2026-05-04-claude-code-complete-guide/原始字幕.md` �?归档源文�?- **相关 Wiki**: [[entities/claude-auto-mode]]、[[concepts/claude-memory]]、[[concepts/context-management]]、[[concepts/claude-hooks-guide]]、[[tutorials/mcp-basics]]

---

## [2026-05-04] docs-ingest | Harness Engineering 核心概念创建

- **操作**: 文档摄取 �?分析 Bilibili 视频脚本 �?创建 Wiki 概念页面 �?归档源文�?- **源文�?*: `raw/Clippings/Bilibili/2026-05-04-最近爆火的 Harness Engineering 到底是啥？一期讲透！.md` (code秘密花园, BV1Zk9FBwELs)
- **创建内容**:
  - AI 工程三代演进：Prompt �?Context �?Harness
  - Harness 六层架构详解（上下文管理、工具系统、执行编排、记忆状态、评估观测、约束恢复）
  - Anthropic Workbench �?OpenAI Swarm 真实实践案例
  - 关键原则：从"提示词优�?�?系统工程"的范式转�?  - 实战类比：软件工程演进（脚本 �?框架 �?系统工程�?- **新增文件**:
  - `wiki/concepts/harness-engineering.md` �?核心概念页面
  - `archive/clippings/bilibili/2026-05-04-harness-engineering.md` �?归档源文�?- **相关 Wiki**: [[agent-harness]]（测试框架，不同�?Harness Engineering 系统工程概念�?
---

## [2026-05-04] docs-ingest | Claude Code Hooks 实用指南创建

- **操作**: 文档摄取 �?分析 quickstart guide �?创建 Wiki 页面 �?待归�?- **源文�?*: `raw/claude/Automate workflows with hooks.md` (~700 行实用指�?
- **创建内容**:
  - 7 个常见场景即用型配置（通知、自动格式化、阻止编辑、上下文补充等）
  - direnv 自动环境加载配置
  - 配置变更审计日志脚本
  - Prompt Hook �?Agent Hook 进阶用法
  - HTTP Hook Webhook 配置
  - 故障排除指南（exit codes、JSON 解析问题�?- **归档**: `archive/claude/Automate-workflows-with-hooks-2026-05-04.md` �?源文件已归档

---

## [2026-05-04] docs-ingest | Claude Code Hooks 完整参考指南更�?
- **操作**: 文档摄取 �?分析 comprehensive Hooks reference �?更新 Wiki 页面 �?归档源文�?- **源文�?*: `raw/claude/Hooks reference.md` (2500+ 行官方完整参�?
- **更新内容**:
  - 30+ �?Hook 事件完整参考（生命周期、速查表、阻止行为）
  - 五种 Hook 类型详解（command/http/mcp_tool/prompt/agent�?  - 配置架构（matcher 语法、处理器字段、环境变量）
  - 输入输出格式（exit codes、JSON schema、决策控制模式）
  - PreToolUse/PermissionRequest/PostToolUse 等核心事件完�?schema
  - Async Hooks、HTTP Hooks、MCP Tool Hooks 高级特�?  - 完整配置示例（自动格式化、安全验证、会话初始化、自动批准测试）
  - 调试技巧和 /hooks 菜单使用
- **新增/更新文件**:
  - `wiki/guides/claude-hooks-configuration-guide.md` �?已更�?  - `archive/claude/Hooks-reference-2026-05-04.md` �?归档源文�?- **相关 Wiki**: [[claude-hooks-guide|Claude Hooks 快速入门]]

---

## [2026-05-02] github-collect | mattpocock/skills 仓库更新完成

- **操作**: GitHub 仓库收集 �?元数据获�?�?归档 JSON �?更新 Wiki 页面 �?更新日志
- **仓库**: [mattpocock/skills](https://github.com/mattpocock/skills)
- **元数�?*:
  - Stars: 52,980 | Forks: 4,454 | Language: Shell | License: MIT
  - Description: "Skills for Real Engineers. Straight from my .claude directory."
- **更新内容**:
  - 重新获取最�?README 内容（工程类 9 �?Skills + 生产力类 3 �?+ 杂项 4 个）
  - 修正 Stars �?Forks 数量
  - 更新四大问题与解决方案的解读
- **新增/更新文件**:
  - `archive/resources/github/mattpocock-skills-2026-05-02.json` �?归档元数�?  - `wiki/resources/github-repos/mattpocock-skills.md` �?Wiki 页面（已存在，更新）
- **核心内容**: Matt Pocock 的工程实用主�?Skills 包，解决"Agent 没有做你想要的事"�?输出太冗�?�?代码不工�?�?代码变成乱麻"四大问题

---

## [2026-05-02] github-collect | Beads 仓库收集完成

- **操作**: GitHub 仓库收集 �?元数据获�?�?归档 JSON �?创建 Wiki 页面 �?更新日志
- **仓库**: [gastownhall/beads](https://github.com/gastownhall/beads)
- **元数�?*:
  - Stars: 22,958 | Forks: 1,505 | Language: Go | License: MIT
  - Description: "Beads - A memory upgrade for your coding agent"
  - Topics: `agents` `claude-code` `coding`
- **新增文件**:
  - `archive/resources/github/gastownhall-beads-2026-05-02.json` �?归档元数�?  - `wiki/resources/github-repos/gastownhall-beads.md` �?Wiki 页面
- **核心内容**: Beads 是一个分布式图结�?Issue 追踪器，�?AI Agent 设计，基�?Dolt 版本控制数据库构�?
---

## [2026-05-02] mentor-ai-programming | Learning Progress Base 创建完成

- **操作**: 创建 Learning Progress Base 文件和学习进度追踪页�?- **文件**:
  - `wiki/learning-progress.base` �?Base 看板配置
  - `wiki/progress-commands.md` �?Commands 模块进度 (L1, in-progress)
  - `wiki/progress-hooks.md` �?Hooks 模块进度 (L1, not-started)
  - `wiki/progress-subagents.md` �?Subagents 模块进度 (L1, not-started)
  - `wiki/progress-workflows.md` �?Workflows 模块进度 (L1, not-started)
  - `wiki/progress-agent-teams.md` �?Agent Teams 模块进度 (L1, not-started)
- **状�?*: Commands 已开�?(L1)，其余模块待开�?
---

## [2026-05-01] docs-ingest | 知乎文章批量摄取完成

- **来源**: `raw/zhihu/` (2 篇文�?
- **操作**: docs-ingest 技�?�?去重检�?�?创建 Wiki 页面 �?归档源文�?�?清理空目�?- **摄取文档**:
  1. `Claude Code 并行开发完全指南：Subagents + Agent Teams + Git Worktree + 工作流编排实�?md`
  2. `gstack简析：Claude Code是不是就是通用智能体？.md`
- **新增文件**:
  - `wiki/guides/claude-code-parallel-development.md` �?Claude Code 并行开发指�?  - `wiki/resources/tools/gstack.md` �?gstack 工具完全解析
- **归档文件**:
  - `archive/guides/claude-code-parallel-development-2026-05-01.md`
  - `archive/resources/tools/gstack-analysis-2026-05-01.md`
- **核心内容**:
  - **并行开发指�?*: Subagents、Agent Teams、Git Worktree、工作流编排四种方案对比
  - **gstack 分析**: Y Combinator CEO 开发的虚拟工程团队工具集，完整角色体系
- **清理操作**:
  - 删除所有空�?system-prompts 子目�?  - 删除已摄取的知乎文章源文�?
---

## [2026-05-01] docs-ingest | session-management-context-window 摄取完成

- **来源**: `raw/claude/Using Claude Code session management and 1M context.md`
- **操作**: docs-ingest 技�?�?去重检�?�?创建 Wiki 页面 �?归档源文�?- **归档**: `archive/guides/session-management-context-window-2026-05-01.md`
- **新增文件**:
  - `wiki/guides/session-management-context-window.md` �?Claude Code 会话管理完全指南
- **核心内容**:
  - **上下文窗口与 Context Rot**: 1M token 上下文、性能下降�?300-400K 时显�?  - **五种会话管理策略**: Continue, Rewind, Compact, Clear, Subagents
  - **决策矩阵**: 根据场景选择合适的工具
  - **最佳实�?*: 主动管理、引导压缩、善�?Rewind、隔离噪�?- **相关页面**:
  - [[tips/session-context-tips]] �?精简版决策矩�?  - [[guides/claude-code-parallel-development]] �?并行开发指�?
---

## [2026-05-01] github-collect | rtk-ai/rtk 收集完成

- **仓库**: https://github.com/rtk-ai/rtk
- **Stars**: 39,165
- **语言**: Rust
- **操作**: github-collect 技�?�?获取元数�?�?获取 README �?分析项目结构 �?创建 Wiki 页面 �?归档 JSON
- **归档**: `archive/resources/github/rtk-ai-rtk-2026-05-01.json`
- **新增文件**:
  - `wiki/resources/github-repos/rtk-ai-rtk.md` �?RTK 工具仓库页面
- **核心内容**:
  - **RTK (Rust Token Killer)**: 高性能 CLI 代理，减�?60-90% LLM token 消�?  - **核心特�?*: 单个 Rust 二进制，零依赖，<10ms 开销�?00+ 命令支持
  - **智能优化**: 四种策略（过滤、分组、截断、去重）
  - **广泛支持**: Claude Code, Copilot, Cursor, Gemini CLI 等主�?AI 工具
  - **Token 节省**: 30 分钟会话�?118K �?24K tokens�?80%�?
---

## [2026-05-01] docs-ingest | patterns/github-resource-classification 摄取完成

- **来源**: `raw/notes/2026-05-01-github-resource-classification-pattern.md`
- **操作**: docs-ingest 技�?�?去重检�?�?创建 Wiki 页面 �?归档源文�?- **归档**: `archive/patterns/github-resource-classification-2026-05-01.md`
- **新增文件**:
  - `wiki/patterns/github-resource-classification.md` �?新建模式页面
- **核心内容**:
  - GitHub 仓库分类三角法（Skills/教程/框架/本地化）
  - 差异化定位分析方�?  - 标准�?Wiki 页面结构
  - 最佳实践与常见错误
- **模式价�?*:
  - 快速识别仓库类型（3-5 秒）
  - 选择合适的文档模板
  - 帮助用户理解生态格局
  - 避免重复收集相似项目

---

## [2026-05-01] github-collect | microsoft/agent-lightning 新增完成

- **来源**: https://github.com/microsoft/agent-lightning
- **操作**: GitHub MCP 获取元数�?�?获取目录结构 �?归档 JSON �?创建 Wiki 页面
- **元数�?*:
  - Stars: 0 (Microsoft 新项�?
  - Language: Python
  - License: MIT
  - Topics: agents, ai, python, machine-learning, reinforcement-learning, opentelemetry, llm, claude-code, mcp
  - Updated: 2026-04-30
- **仓库类型**: 框架/应用（Agent 开发框架）
- **新增文件**:
  - `wiki/resources/github-repos/microsoft-agent-lightning.md` �?新建页面
  - `archive/resources/github/microsoft-agent-lightning-2026-05-01.json` �?新归档数�?- **核心内容**:
  - Microsoft 官方 AI Agent 框架
  - 核心组件：开发工具链（client/server/cli）、训练优化（trainer/algorithm/verl）、可观测性（tracer/logger/dashboard�?  - OpenTelemetry 追踪集成、强化学习支�?  - 完整分层架构：应用层→框架层→适配层→LLM Provider
  - Claude Code 深度集成（AGENTS.md + CLAUDE.md�?  - 企业级质量、生产就�?- **技术亮�?*:
  - agentlightning/ 核心框架�?1KB llm_proxy.py, 17KB client/server�?  - 10+ 核心模块：adapter/algorithm/execution/instrumentation/litagent/runner/tracer/trainer
  - 多平台适配器、完整可观测性、RL 算法�?
---

## [2026-05-01] github-collect | luongnv89/claude-howto 新增完成

- **来源**: https://github.com/luongnv89/claude-howto
- **操作**: GitHub MCP 获取元数�?�?获取目录结构 �?归档 JSON �?创建 Wiki 页面
- **元数�?*:
  - Stars: 0 (新兴项目)
  - Language: Markdown
  - License: MIT
  - Topics: claude-code, tutorial, documentation, learning-guide, chinese, japanese, vietnamese, ukrainian
  - Updated: 2026-04-30
- **仓库类型**: 文档/教程仓库（结构化学习指南�?- **新增文件**:
  - `wiki/resources/github-repos/luongnv89-claude-howto.md` �?新建页面
  - `archive/resources/github/luongnv89-claude-howto-2026-05-01.json` �?新归档数�?- **核心内容**:
  - 10章渐进式教程：从 Slash Commands �?CLI
  - 多语言支持：英语、中文、日语、越南语、乌克兰�?  - 完整文档体系：CATALOG.md、INDEX.md、LEARNING-ROADMAP.md、QUICK_REFERENCE.md
  - 结构化学习路径：入门 �?进阶 �?高级 �?专业
  - �?affaan-m/everything-claude-code�?71K stars，技能库）和 Yeachan-Heo/oh-my-claudecode（韩国本地化）形成互�?
---

## [2026-05-01] github-collect | garrytan/gstack 更新完成

- **来源**: https://github.com/garrytan/gstack
- **操作**: GitHub MCP 获取元数�?�?获取目录结构 �?归档 JSON �?更新 Wiki 页面
- **元数�?*:
  - Stars: 87,415 (�?1,943)
  - Forks: 12,503+
  - Language: TypeScript
  - License: MIT
  - Topics: claude-code, claude, anthropic, skills, productivity, tools, ai-assistant
  - Updated: 2026-05-01
- **仓库类型**: Skills 仓库（虚拟工程团队）
- **更新文件**:
  - `wiki/resources/github-repos/garrytan-gstack.md` �?更新页面（stars + 2k�?  - `archive/resources/github/garrytan-gstack-2026-05-01.json` �?新归档数�?- **核心内容**:
  - Garry Tan �?23 �?Claude Code 技能集�?  - 模拟 CEO、设计师、工程经理、发布经理、文档工程师、QA 角色
  - OpenClaw Skills: 4 个核心技能（ceo-review, investigate, office-hours, retro�?  - Browser Skills: 1 个技能（hackernews-frontpage�?  - 生产效率提升 810× 的实战验�?
---

## [2026-05-01] github-collect | Yeachan-Heo/oh-my-claudecode 新增完成

- **来源**: https://github.com/Yeachan-Heo/oh-my-claudecode
- **操作**: GitHub MCP 获取元数�?�?获取目录结构 �?归档 JSON �?创建 Wiki 页面
- **元数�?*:
  - Stars: 0 (新兴项目)
  - Language: TypeScript
  - License: MIT
  - Topics: claude-code, skills, agents, claude, ai, productivity, korean, localization
  - Updated: 2026-04-30
- **仓库类型**: Skills 仓库（韩国开发者优先）
- **新增文件**:
  - `wiki/resources/github-repos/Yeachan-Heo-oh-my-claudecode.md` �?新建页面
  - `archive/resources/github/Yeachan-Heo-oh-my-claudecode-2026-05-01.json` �?新归档数�?- **核心内容**:
  - 面向韩国开发者的 Claude Code 全能工具�?  - 支持 12+ 语言文档（中文、日语、韩语、德语、西班牙语、法语、意大利语、葡萄牙语、俄语、土耳其语、越南语�?  - 核心组件：Agents、Skills、Hooks、Missions、CLAUDE.md
  - 本地化工作流和社区支�?  - �?affaan-m/everything-claude-code�?71K stars）和 garrytan/gstack�?7K stars）形成差异化竞争

---

## [2026-05-01] github-collect | affaan-m/everything-claude-code 更新完成

- **来源**: https://github.com/affaan-m/everything-claude-code
- **操作**: GitHub MCP 获取元数�?�?获取目录结构 �?归档 JSON �?更新 Wiki 页面
- **元数�?*:
  - Stars: 171,082 (�?31,082)
  - Forks: 21,000+
  - Language: TypeScript
  - License: MIT
  - Topics: ai-agents, anthropic, claude, claude-code, developer-tools, llm, mcp, productivity
  - Updated: 2026-05-01
  - Version: v2.0.0-rc.1
- **仓库类型**: Skills/Agents 仓库（性能优化系统�?- **更新文件**:
  - `wiki/resources/github-repos/affaan-m-everything-claude-code.md` �?更新页面（v1.10.0 �?v2.0.0-rc.1�?  - `archive/resources/github/affaan-m-everything-claude-code-2026-05-01.json` �?新归档数�?- **核心内容**:
  - AI 代理工具性能优化系统（Anthropic 黑客松获胜者）
  - 48 智能体�?82 技能�?8 命令�?4+ 规范
  - v2.0.0-rc.1 新特性：Dashboard GUI、Continuous Learning v2、Hermes operator
  - 多平台支持：Claude Code、Codex、Cursor、OpenCode、Gemini
  - Token 优化建议：sonnet 模型�?0000 thinking tokens�?0% 压缩阈�?  - AgentShield 安全工具�?282 项测试�?8% 覆盖率�?02 条规�?
---

## [2026-04-29] github-collect | warpdotdev/warp 收集完成

- **来源**: https://github.com/warpdotdev/Warp
- **操作**: GitHub MCP 搜索 �?zread 获取目录结构 �?zread 搜索文档 �?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 32,000+
  - Forks: 4,500+
  - Language: Rust
  - License: MIT（WarpUI�? AGPL-3.0（其他）
  - Topics: terminal, rust, ai, agent, developer-tools, gpu, gui
- **仓库类型**: Agentic 开发环境（应用/Rust�?- **生成文件**:
  - `wiki/resources/github-repos/warpdotdev-warp.md` �?Wiki 页面
  - `archive/resources/github/warpdotdev-warp-2026-04-29.json` �?归档数据
- **核心内容**:
  - 基于终端�?Agentic 开发环境（ADE�?  - 三大技术支柱：WarpUI 框架、Block-Based 终端、AI 智能体系�?  - 60+ 内部 Rust crate 生态系�?  - OpenAI 创始赞助，GPT 模型驱动智能体工作流

---

## [2026-04-29] github-collect | FreedomIntelligence/OpenClaw-Medical-Skills 收集完成

- **来源**: https://github.com/FreedomIntelligence/OpenClaw-Medical-Skills
- **操作**: GitHub MCP 搜索 �?zread 获取目录结构 �?zread 搜索文档 �?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 2,200+
  - Forks: 280+
  - Language: Python
  - License: MIT
  - Topics: medical, healthcare, ai, claude, bioinformatics, clinical, skills, agent
- **仓库类型**: 医疗 AI 技能库（Skills 仓库�?- **生成文件**:
  - `wiki/resources/github-repos/FreedomIntelligence-OpenClaw-Medical-Skills.md` �?Wiki 页面
  - `archive/resources/github/FreedomIntelligence-OpenClaw-Medical-Skills-2026-04-29.json` �?归档数据
- **核心内容**:
  - 目前最大开源医�?AI 技能库�?69 个独�?AI Agent 模块
  - 四大技能领域：BioOS 扩展套件�?85）、生物信息学套件�?39）、临床与医学�?19）、药物情报（15+�?  - 支持 OpenClaw、NanoClaw、ClawBio 流水线编�?  - 四种工作流语言支持：Snakemake、Nextflow、WDL、CWL
  - 聚合 12+ 开源技能库，覆盖临床医学、基因组学、药物发现、生物信息学

---

## [2026-04-29] github-collect | affaan-m/everything-claude-code 收集完成

- **来源**: https://github.com/affaan-m/everything-claude-code
- **操作**: GitHub MCP 获取元数�?�?下载目录结构 �?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 140,000+
  - Forks: 21,000+
  - Language: TypeScript
  - License: MIT
  - Version: 1.10.0 (ECC 2.0 Alpha)
  - Topics: claude-code, ai, agents, skills, productivity, development
- **仓库类型**: Claude Code 配置集合（Skills 仓库�?- **生成文件**:
  - `wiki/resources/github-repos/affaan-m-everything-claude-code.md` �?Wiki 页面
  - `archive/resources/github/affaan-m-everything-claude-code-2026-04-29.json` �?归档数据
- **核心内容**:
  - Anthropic 黑客松获奖项目，包含 48 个专用子智能体�?83 个技能模块�?9 个命�?  - AgentShield 安全审计工具�?282 项测试�?8% 覆盖率）
  - 多平台支持（Windows/macOS/Linux）和�?IDE 支持（Claude Code/Codex/Cursor/OpenCode/Gemini�?  - 插件安装（推荐）或手动安装两种方�?
---

## [2026-04-29] github-collect | theneoai/awesome-skills 收集完成

- **来源**: https://github.com/theneoai/awesome-skills
- **操作**: GitHub MCP 获取元数�?�?zread 获取目录结构 �?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 55
  - Forks: 23
  - Language: JavaScript
  - License: MIT
  - Topics: agent, ai, skills, claude, cursor, llm, mcp, prompt-engineering
- **仓库类型**: AI 技能库（Skills 仓库�?- **生成文件**:
  - `wiki/resources/github-repos/theneoai-awesome-skills.md` �?Wiki 页面
  - `archive/resources/github/theneoai-awesome-skills-2026-04-29.json` �?归档数据
- **核心内容**:
  - 967 个专家级 AI 技能，覆盖 60 个职业领�?  - skill-manager v1.0 质量生态系统（Create �?Evaluate �?Restore�?  - 6 维度质量评分标准 + 双轨验证体系（文�?50% + 运行�?50%�?  - 35 个精选企业技能（Amazon、Tesla、SpaceX、NVIDIA、McKinsey、Toyota 等）
  - 渐进式披露架构：SKILL.md (�?00 �? + references/ 按需加载
  - Token 优化�?50%（通过 references-first 架构�?
---

## [2026-04-29] github-collect | zilliztech/claude-context 收集完成

- **来源**: https://github.com/zilliztech/claude-context
- **操作**: GitHub MCP 搜索 �?zread 获取目录结构 �?zread 搜索文档 �?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 10,223+
  - Forks: 758+
  - Language: TypeScript
  - License: MIT
  - Topics: agent, agentic-rag, ai-coding, claude-code, mcp, semantic-search, vector-database
- **仓库类型**: MCP 插件（框�?库）
- **生成文件**:
  - `wiki/resources/github-repos/zilliztech-claude-context.md` �?Wiki 页面
  - `archive/resources/github/zilliztech-claude-context-2026-04-29.json` �?归档数据
- **核心内容**:
  - �?AI 编码助手提供语义代码搜索�?MCP 插件
  - 三大技术支柱：混合搜索架构（BM25 + Dense Vector）、Merkle 树增量索引、AST-Based 分块
  - 多平台支持：Claude Code / Codex CLI / Gemini CLI / Cursor / Windsurf / VSCode
  - 向量数据库支持：Zilliz Cloud / Milvus / Pinecone / Qdrant / Chroma / pgvector
  - 性能基准：等效检索质量下 Token 节省 ~40%

---

## [2026-04-29] VSCode Agent 编程助手系统提示词文档摄�?
- **来源**: `raw/system-prompts/VSCode Agent/`
- **操作**: 读取 9 个系统提示词文件 �?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/vscode-agent.md`
- **归档位置**: `archive/system-prompts/VSCode Agent/`
- **内容**:
  - 17+ 工具: semantic_search、grep_search、insert_edit_into_file、run_in_terminal、create_new_workspace �?  - 多模型变�? Claude Sonnet 4 (Tab 补全)、GPT-5 (Proactive Agent)、GPT-4o (标准模式)、Gemini 2.5 Pro (轻量模式)
  - 身份规范: 响应名称「GitHub Copilot」，遵守 Microsoft 内容政策
  - 核心指令: 遵循要求、收集上下文、优先使用工具、持续执行、避免重�?  - 与其他工具对�? Notion AI、Kiro、Claude Code、Windsurf

---

## [2026-04-29] Notion AI 编程助手系统提示词文档摄�?
- **来源**: `raw/system-prompts/NotionAi/`
- **操作**: 读取 2 个系统提示词文件 �?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/notion-ai.md`
- **归档位置**: `archive/system-prompts/NotionAi/`
- **内容**:
  - 工具调用规范: 即时调用、默认搜索、工具循环机�?  - Notion 核心概念: Workspace、Pages、Databases、Data Sources、Views
  - 8 个工�? view、search、create-pages、update-page、delete-pages、query-data-sources、create-database、update-database
  - Notion 风格 Markdown 格式规范
  - 响应风格指南: 语言匹配、避免过度perform、搜索决策、拒绝指�?  - 与其他工具对�? Kiro、Claude Code、Windsurf

---

## [2026-04-29] Kiro AI 编程助手系统提示词文档摄�?
- **来源**: `raw/system-prompts/Kiro/`
- **操作**: 读取 3 个系统提示词文件 �?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/kiro.md`
- **归档位置**: `archive/system-prompts/Kiro/`
- **内容**:
  - 双模式分类器: Do Mode（默认）、Spec Mode（规格文档）、Chat Mode（一般对话）
  - 规格工作流三阶段: Requirements（EARS格式）→ Design（架构设计）�?Tasks（任务清单）
  - 自主性模�? Autopilot（自动修改）vs Supervised（用户确认）
  - Steering 机制: 文件级条件化上下文包含，支持 `#[[relative/path]]` 引用
  - Hooks 事件系统: file.save、manual、pre-commit 触发�?  - MCP 配置: 工作�?`.kiro/settings/mcp.json` 和用户级 `~/.kiro/settings/mcp.json`
  - 响应风格: 知识性而非教导性，支持性而非主导�?
---

## [2026-04-29] Xcode Apple Intelligence 系统提示词文档摄�?
- **来源**: `raw/system-prompts/Xcode/`
- **操作**: 读取 6 个系统提示词文件 �?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/xcode-ai.md`
- **归档位置**: `archive/system-prompts/Xcode/`
- **内容**:
  - 模板系统: `{{filename}}`, `{{filecontent}}`, `{{selected_code}}` 占位�?  - 5 种动作类�? Document（文档生成）、Explain（代码解释）、Message（问答）、Playground（示例生成）、Preview（Preview 生成�?  - SwiftUI #Preview 生成规则: 10+ 条包装条件（NavigationStack、List、@Binding 等）
  - Swift Testing 框架: `@Suite`, `@Test`, `#expect`, `#require` 注解
  - 只读代码库访问模�?
---

## [2026-04-29] Manus AI 智能代理系统提示词文档摄�?
- **来源**: `raw/system-prompts/Manus Agent Tools & Prompt/`
- **操作**: 读取 4 个系统提示词文件 �?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/manus-ai.md`
- **归档位置**: `archive/system-prompts/Manus Agent Tools & Prompt/`
- **内容**:
  - 6 阶段 Agent Loop: 分析事件 �?选择工具 �?等待执行 �?迭代 �?提交结果 �?进入待机
  - 事件流系�? Message, Action, Observation, Plan, Knowledge, Datasource, Other
  - 12 个系统模�? event_stream, agent_loop, planner_module, knowledge_module, datasource_module, todo_rules, message_rules, file_rules, browser_rules, shell_rules, coding_rules, writing_rules
  - 26 个工具（OpenAI function calling 格式�? message(2), file(5), shell(5), browser(11), info(1), deploy(2), misc(2)
  - Sandbox 环境: Ubuntu 22.04, Python 3.10.12, Node.js 20.18.0
  - 写作规范: 避免列表格式，最小数千字输出

---

## [2026-04-29] Devin AI 软件工程代理系统提示词文档摄�?
- **来源**: `raw/system-prompts/Devin AI/`
- **操作**: 读取 2 个系统提示词文件 �?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/devin-ai.md`
- **归档位置**: `archive/system-prompts/Devin AI/`
- **内容**:
  - 两种工作模式: Planning Mode（规划模式）�?Standard Mode（标准模式）
  - 六大命令系统: 推理、Shell、编辑器、搜索、LSP、浏览器、部署、用户交�?  - 核心编辑器命�? open_file, str_replace, create_file, insert, find_and_edit
  - 代码引用系统: `<cite/>` 标签规范，每个声明必须提供引�?  - 最佳实�? 不修改测试、环境问题报告用户、永不假设库已安�?  - DeepWiki 问答模式: 基于代码库上下文的专业问�?
---

## [2026-04-29] github-collect | MemPalace/mempalace 收集完成

- **来源**: https://github.com/MemPalace/mempalace
- **操作**: GitHub MCP 获取元数�?�?下载 README/pyproject.toml �?归档 JSON �?生成增强 Wiki 页面
- **元数�?*:
  - Stars: 50,283
  - Forks: 6,611
  - Language: Python
  - License: MIT
  - Version: 3.3.3
  - Topics: ai, chromadb, llm, mcp, memory, python
- **仓库类型**: AI 记忆系统（框�?库）
- **生成文件**:
  - `wiki/resources/github-repos/mempalace-mempalace.md` �?Wiki 页面
  - `archive/resources/github/mempalace-2026-04-29.json` �?归档数据
- **核心内容**:
  - 本地优先 AI 记忆系统 �?逐字存储，可插拔后端
  - LongMemEval 基准测试: 96.6% R@5 (Raw), 98.4% R@5 (Hybrid held-out), �?9% (LLM rerank)
  - 29 �?MCP 工具覆盖 Palace 读写、知识图谱、跨 Wing 导航、Drawer 管理、Agent 日记
  - 知识图谱: 时序实体关系图（有效性窗口），后�?SQLite
  - Auto-save Hooks: Claude Code 周期性保�?  - 可插拔检索层: ChromaDB 默认，支持自定义后端
- **项目结构**: .agents/, .claude-plugin/, benchmarks/, docs/, hooks/, integrations/, mempalace/ (核心代码)

---

## [2026-04-29] MemPalace Wiki 页面增强

- **来源**: GitHub CLAUDE.md, examples/ 目录
- **操作**: 补充官方文档细节
- **更新内容**:
  - 添加 7 大设计原则（逐字优先、增量优先、实体优先、本地零API、性能预算、隐私架构、后台执行）
  - 添加 Palace 结构详解（Wings/Rooms/Drawers�?  - 添加 AAAK 压缩说明
  - 添加知识图谱架构
  - 添加完整 CLI 命令表（init, mine, search, wake-up, sweep, agents�?  - 添加示例代码参考（Python 挖掘/导入/MCP 集成�?  - 添加 Claude Code Hooks 说明
  - 添加代码规范（ruff, pytest, �?0% coverage�?  - 添加与传�?RAG 对比�?  - 更新相关资源链接�?
---

## [2026-04-29] Augment Code 系统提示词文档摄�?
- **来源**: `raw/system-prompts/Augment Code/`
- **操作**: 读取 4 个系统提示词文件 �?去重检�?�?创建 2 �?Wiki 页面 �?归档
- **创建页面**: `wiki/tools/augment-code-gpt5.md`, `wiki/tools/augment-code-sonnet4.md`
- **归档位置**: `archive/system-prompts/Augment Code/`
- **内容**:
  - GPT-5 版本: 22 个工具，显式 Tasklist，完整进程管�?  - Claude Sonnet 4 版本: 19 个工具，任务管理建议模式
  - 两者都强调 Tasklist 触发条件和包管理器优先原�?
## [2026-04-29] Trae AI 系统提示词文档摄�?
- **来源**: `raw/system-prompts/Trae/`
- **操作**: 读取 3 个系统提示词文件 �?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/trae-ai.md`
- **归档位置**: `archive/system-prompts/Trae/`
- **内容**:
  - 两种模式: Chat 模式（精简）、Builder 模式（完整）
  - 15 个工�? search_codebase 上下文引擎、TodoWrite 任务管理
  - AI Flow 范式: 支持独立和协作工作模�?  - 设计特点: 最少化工具调用、XML 引用格式

---

## [2026-04-29] Qoder System Prompts 文档摄取

- **来源**: `raw/system-prompts/Qoder/`
- **操作**: 读取 3 个系统提示词文件 �?去重检�?�?创建 Wiki 页面 �?归档�?archive
- **创建页面**: `wiki/sources/qoder-prompt.md`, `wiki/sources/qoder-quest-action.md`, `wiki/sources/qoder-quest-design.md`
- **归档位置**: `archive/system-prompts/Qoder/`

## [2026-04-29] github-collect | alishahryar1/free-claude-code 收集完成

- **来源**: https://github.com/Alishahryar1/free-claude-code
- **操作**: GitHub fetch 获取元数�?�?分析目录结构 �?归档 JSON �?生成增强 Wiki 页面
- **仓库类型**: Python 应用（FastAPI 代理服务器）
- **元数�?*:
  - 版本: 2.0.0
  - 语言: Python (�?.14)
  - 许可�? MIT
  - 包管理器: uv
  - Web 框架: FastAPI
- **生成文件**:
  - `wiki/resources/github-repos/alishahryar1-free-claude-code.md` �?Wiki 页面
  - `archive/resources/github/alishahryar1-free-claude-code-2026-04-29.json` �?归档数据
- **核心内容**:
  - **零成�?AI 编程**: NVIDIA NIM 40 req/min 免费额度，无需 Anthropic API key
  - **5 个提供商**: NVIDIA NIM、OpenRouter、DeepSeek、LM Studio、llama.cpp 可混合使�?  - **按模型路�?*: MODEL_OPUS、MODEL_SONNET、MODEL_HAIKU 可路由到不同后端
  - **高级特�?*: 思�?Token 支持、启发式工具解析、请求优化、智能速率限制
  - **Discord/Telegram Bot**: 远程自主编程、基于树的消息线程、实时进度流
  - **Subagent 控制**: Task 工具拦截防止失控子代�?  - **技术栈**: FastAPI、uvicorn、httpx、Pydantic、OpenAI SDK、discord.py、python-telegram-bot、Loguru
  - **开发工�?*: pytest、ty（类型检查）、ruff（格式化�?  - **项目结构**: api/（路由）、providers/（LLM 提供商）、messaging/（Bot）、cli/（会话管理）
  - **即插即用**: 仅需 2 个环境变量（ANTHROPIC_BASE_URL、ANTHROPIC_AUTH_TOKEN�?
---

## [2026-04-29] github-collect | x1xhlol/system-prompts-and-models-of-ai-tools 收集完成

- **来源**: https://github.com/x1xhlol/system-prompts-and-models-of-ai-tools
- **操作**: GitHub fetch 获取元数�?�?分析目录结构 �?归档 JSON �?生成增强 Wiki 页面
- **仓库类型**: 文档/资源集合（系统提示词，非可执行代码）
- **元数�?*:
  - 语言: Text
  - 许可�? GNU GPL v3
  - 特点: 50+ AI 工具的系统提示词集合
- **生成文件**:
  - `wiki/resources/github-repos/x1xhlol-system-prompts-and-models-of-ai-tools.md` �?Wiki 页面
  - `archive/resources/github/x1xhlol-system-prompts-and-models-of-ai-tools-2026-04-29.json` �?归档数据
- **核心内容**:
  - **Anthropic/Claude 系列**: Claude Code, Sonnet 4, 3.5 Sonnet 系统提示�?  - **Google/Gemini 系列**: Gemini Code, Gemini CLI 提示�?  - **开源工具集�?*: Cline (3,928 �?, Codex CLI, Aider, Continue �?  - **商业工具集合**: Cursor, Windsurf, Replit, Xcode, VSCode Agent �?  - **研究价�?*: 深入理解 AI 工具的底层工作机制、提示工程策略、安全约束机�?  - **使用场景**: AI 工具设计学习、提示工程参考、对比分析研�?- **目录结构**: Hierarchical 组织（Anthropic/, Google/, Open Source prompts/, Cursor Prompts/, Windsurf/, 等）
- **许可�?*: GNU GPL v3 (Share-Alike �?衍生作品须使用相同许可证)

---

## [2026-04-29] docs-ingest | Subagent/Skill/Weather Orchestrator 文档摄取完成

- **来源**: `raw/cc-doc/` �?`raw/notes/` (7个文�?
- **操作**: 分析 �?去重检�?�?创建/更新 Wiki 页面 �?归档
- **更新文件**:
  - `entities/claude-tools.md` �?新增 Monitor 工具详解（核心功能、启用方式、授权配置、与 Bash 后台对比�?  - `sources/claude-mcp-full.md` �?新增三级作用域、Token 消耗排名、无法禁用用户级 MCP 的三种方�?- **新建文件**:
  - `implementation/skill-design-principles.md` �?Skill 设计原则�? 核心原则�? 不要、创建时机、Description 最佳实践）
  - `implementation/weather-orchestrator-walkthrough.md` �?Weather Orchestrator 实战演练（Command �?Agent �?Skill 编排模式�?  - `implementation/subagent-best-practices.md` �?Subagent 最佳实践（16 �?Frontmatter 字段、三层复杂度模式、设计最佳实践）
- **归档**: 7 个源文件移动�?`archive/cc-doc/` �?`archive/notes/`
- **Source 路径修复**: 4 个页�?source 字段更新为正确路�?
---

## [2026-04-29] Windsurf Cascade 系统提示词文档摄�?
- **来源**: `raw/system-prompts/Windsurf/`
- **操作**: 读取 2 个系统提示词文件 �?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/windsurf-ai.md`
- **归档位置**: `archive/system-prompts/Windsurf/`
- **内容**:
  - 名称 Cascade，基�?GPT 4.1 模型
  - 21 个工�? codebase_search, create_memory, update_plan, deploy_web_app, 浏览器操作等
  - AI Flow 范式: 独立+协作模式
  - 记忆系统: create_memory 持久化记�?  - 规划系统: update_plan 维护项目行动计划
  - 大文件拆分原�? >300 行拆分为多个编辑

---

## [2026-04-28] github-collect | mattpocock/skills 收集完成

- **来源**: https://github.com/cathrynlavery/diagram-design
- **操作**: GitHub fetch 获取元数�?�?归档 JSON �?生成增强 Wiki 页面
- **元数�?*:
  - Stars: 2,007
  - Forks: 0
  - Language: HTML
  - License: MIT
  - 作�? Cathryn Lavery (BestSelf.co 创始�?
- **生成文件**:
  - `wiki/resources/github-repos/cathrynlavery-diagram-design.md` �?Wiki 页面
  - `archive/resources/github/cathrynlavery-diagram-design-2026-04-28.json` �?归档数据
- **核心内容**:
  - 13 种图类型（Architecture, Flowchart, Sequence, ER, Timeline 等）
  - 品牌匹配功能�?0 秒从网站提取配色+字体�?  - 设计系统规范（语义色彩、字体�?px 网格�?  - 三种变体（Minimal light, Minimal dark, Full editorial�?  - 复杂度预算和质量门槛检�?- **仓库类型**: Skills 仓库
- **平台支持**: Claude Code

---

## [2026-04-28] github-collect | forrestchang/andrej-karpathy-skills v2.0 增强收集

- **来源**: https://github.com/forrestchang/andrej-karpathy-skills
- **操作**: Skill 改进后首次执�?�?增强 Wiki 页面
- **元数�?*:
  - Stars: 95,206
  - Forks: 9,224
  - 许可�? MIT
  - 平台: Claude Code, Cursor
- **生成文件**:
  - `wiki/resources/github-repos/forrestchang-andrej-karpathy-skills.md` �?v2.0 Wiki 页面
  - `archive/resources/github/forrestchang-andrej-karpathy-skills-2026-04-28-v2.json` �?归档数据
- **增强内容**:
  - 四大原则详解（Think Before Coding, Simplicity First, Surgical Changes, Goal-Driven Execution�?  - Karpathy 三大问题分析
  - 快速安装指南（Plugin / CLAUDE.md 两种方式�?  - 项目结构完整列表
  - 衍生项目列表
- **仓库类型**: Skills 仓库

---

## [2026-04-28] github-collect | garrytan/gbrain 收集完成

- **来源**: https://github.com/garrytan/gbrain
- **操作**: GitHub fetch 获取元数�?�?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 12,000
  - Language: TypeScript
  - License: MIT
  - Topics: ai-agent, knowledge-graph, memory-system, openclaw, hermes
- **生成文件**:
  - `wiki/resources/github-repos/garrytan-gbrain.md` �?Wiki 页面
  - `archive/resources/github/garrytan-gbrain-2026-04-28.json` �?归档数据
- **内容**: �?AI Agent 提供知识记忆系统的开源项目，29 项内置技能，自布线知识图谱，混合搜索（向�?BM25+图谱），Benchmark P@5 49.1%, R@5 97.9%

---

## [2026-04-28] github-collect | addyosmani/agent-skills v2.0 收集完成

- **来源**: https://github.com/addyosmani/agent-skills
- **操作**: GitHub fetch 获取元数�?�?归档 JSON �?生成增强 Wiki 页面
- **元数�?*:
  - Stars: 24,701
  - Forks: 0
  - Language: Shell
  - License: MIT
  - 作�? Addy Osmani
- **生成文件**:
  - `wiki/resources/github-repos/addyosmani-agent-skills.md` �?v2.0 Wiki 页面
  - `archive/resources/github/addyosmani-agent-skills-2026-04-28-v2.json` �?归档数据
- **核心内容**:
  - 开发生命周期图（DEFINE �?PLAN �?BUILD �?VERIFY �?REVIEW �?SHIP�?  - 7 �?Slash Commands�?spec, /plan, /build, /test, /review, /code-simplify, /ship�?  - 20 个核心技能按 6 阶段分类
  - 3 �?Agent Personas（code-reviewer, test-engineer, security-auditor�?  - 4 个参考检查清单（testing, security, performance, accessibility�?- **平台支持**: Claude Code, Cursor, Gemini CLI, Windsurf, OpenCode, GitHub Copilot, Kiro IDE
- **仓库类型**: Skills 仓库

---

## [2026-04-29] Traycer.AI 系统提示词文档摄�?
- **来源**: `raw/system-prompts/Traycer AI/`
- **操作**: 读取 4 个系统提示词文件 �?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/traycer-ai.md`
- **归档位置**: `archive/system-prompts/Traycer AI/`
- **内容**:
  - 两种模式: Phase Mode（阶段模式）�?Plan Mode（计划模式）
  - Phase Mode: `write_phases` 分解任务，不编辑代码，技术主管角�?  - Plan Mode: 高级设计，`hand_over_to_approach_agent` 移交机制
  - 核心原则: "Shadow don't overwrite" �?"Phase-by-phase integrity"
  - Plan Mode 工具�? LSP 工具 (find_references, go_to_definition)、Agent 创建、任务移�?
---

## [2026-04-28] github-collect | addyosmani/agent-skills 修复完成

- **来源**: https://github.com/addyosmani/agent-skills
- **操作**: 修复 Wiki 页面缺失问题，重新生�?v2.0 Wiki 页面
- **状�?*: �?完成

- **来源**: https://github.com/garrytan/gstack
- **操作**: GitHub API 获取元数�?�?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 85,472
  - Forks: 12,503
  - Language: TypeScript
  - License: MIT
  - Topics: Claude Code, Skills, Startup, Y Combinator
- **生成文件**:
  - `wiki/resources/github-repos/garrytan-gstack.md` �?Wiki 页面
  - `archive/resources/github/garrytan-gstack-2026-04-28.json` �?归档数据
- **内容**: Garry Tan (YC CEO) 的个�?Claude Code 技能集合，23 个工具担�?CEO、设计师、工程经理、发布经理、文档工程师、QA 等角�?- **效率数据**:
  - 810× 代码产出提升 vs 2013 年（11,417 vs 14 逻辑�?天）
  - 60 天内交付 3 个生产服务�?0+ 功能（兼职运�?YC�?  - 2026 年产出已�?240× 整个 2013 年全�?- **作�?*: Garry Tan (President & CEO, Y Combinator)

---

## [2026-04-28] github-collect | obra/superpowers 收集完成

- **来源**: https://github.com/obra/superpowers
- **操作**: GitHub CLI 获取元数�?�?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 170,260
  - Language: Shell
  - License: MIT
  - Topics: Agentic Skills Framework, Software Development Methodology
- **生成文件**:
  - `wiki/resources/github-repos/obra-superpowers.md` �?Wiki 页面
  - `archive/resources/github/obra-superpowers-2026-04-28.json` �?归档数据
- **内容**: 完整�?AI 编码代理方法论，7 步开发流程，15+ 可组合技�?- **作�?*: Jesse Vincent (Prime Radiant)

## [2026-04-28] github-collect | Cocoon-AI/architecture-diagram-generator 收集完成

- **来源**: https://github.com/Cocoon-AI/architecture-diagram-generator
- **操作**: GitHub MCP 获取元数�?�?检�?Skill 目录结构 �?归档 JSON �?生成 v2.0 Wiki 页面
- **元数�?*:
  - Stars: 4,487
  - Forks: 338
  - Language: HTML
  - License: MIT
  - Topics: claude-code, claude-skill, architecture, svg, diagram
- **生成文件**:
  - `wiki/resources/github-repos/cocoon-ai-architecture-diagram-generator.md` �?v2.0 Wiki 页面
  - `archive/resources/github/cocoon-ai-architecture-diagram-generator-2026-04-28.json` �?归档数据
- **内容**: Claude AI Skill，生成精美暗黑主题架构图（独�?HTML/SVG�?- **文档结构**:
  - architecture-diagram/SKILL.md �?设计系统规范
  - architecture-diagram/assets/template.html �?基础模板
  - examples/ �?Web App, AWS Serverless, Microservices 示例
- **最新版�?*: v1.0 (2025-12-22)
- **增强特�?*: 颜色方案表、多平台安装指南、技术规格、设计系�?
## [2026-04-28] github-collect | safishamsi/graphify v2.0 增强收集完成

- **来源**: https://github.com/safishamsi/graphify
- **操作**: GitHub MCP 获取元数�?�?检�?docs/ 翻译目录 �?归档 JSON �?生成 v2.0 Wiki 页面
- **元数�?*:
  - Stars: 36,616
  - Forks: 4,062
  - Language: Python
  - License: MIT
  - Topics: graphrag, knowledge-graph, claude-code, skills, codex, gemini, openclaw
- **生成文件**:
  - `wiki/resources/github-repos/safishamsi-graphify.md` �?v2.0 Wiki 页面（项目快照、多语言文档�?  - `archive/resources/github/safishamsi-graphify-2026-04-28.json` �?归档数据（docs_structure 增强�?- **内容**: AI 编码助手技能，将代�?文档/图片/视频转化为可查询知识图谱
- **文档结构**:
  - docs/translations/ �?25+ 语言翻译 README
  - AGENTS.md, ARCHITECTURE.md, CHANGELOG.md, SECURITY.md
- **最新版�?*: v0.5.2 (2026-04-27)
- **增强特�?*: 项目快照表、帮助文档目录、多语言文档列表、安装与使用、团队工作流�?
## [2026-04-28] github-collect | vercel/next.js v2.0 增强收集完成

- **来源**: https://github.com/vercel/next.js
- **操作**: GitHub MCP 获取元数�?�?检�?docs/ 目录结构 �?归档 JSON �?生成 v2.0 Wiki 页面
- **元数�?*:
  - Stars: 139,195
  - Forks: 30,978
  - Language: JavaScript
  - License: MIT
  - Topics: react, ssr, ssg, vercel, node, server-rendering
- **生成文件**:
  - `wiki/resources/github-repos/vercel-nextjs.md` �?v2.0 Wiki 页面
  - `archive/resources/github/vercel-nextjs-2026-04-28.json` �?归档数据
- **文档结构**:
  - docs/01-app, docs/02-pages, docs/03-architecture, docs/04-community
  - CONTRIBUTING.md, release-channels-publishing.md, pull-request-descriptions.md
- **最新版�?*: v16.2.4 (2026-04-15)

## [2026-04-28] github-collect | iamzhihuix/skills-manage 收集完成

- **来源**: https://github.com/iamzhihuix/skills-manage
- **操作**: GitHub CLI 获取元数�?�?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 1,271
  - Language: TypeScript
  - License: Apache-2.0
  - Topics: ai, claude-code, cursor, desktop-app, llm, react, rust, skills, tauri
- **生成文件**:
  - `wiki/resources/github-repos/iamzhihuix-skills-manage.md` �?Wiki 页面
  - `archive/resources/github/iamzhihuix-skills-manage-2026-04-28.json` �?归档数据
- **内容**: Tauri 桌面应用，支�?20+ 平台统一管理 AI coding agent skills

## [2026-04-28] github-collect | cathrynlavery/diagram-design 收集完成

- **来源**: https://github.com/cathrynlavery/diagram-design
- **操作**: GitHub CLI 获取元数�?�?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 2,007
  - Language: HTML
  - License: None
  - Topics: claude-code, diagram, svg, html, claude-code-skill
- **生成文件**:
  - `wiki/resources/github-repos/cathrynlavery-diagram-design.md` �?Wiki 页面
  - `archive/resources/github/cathrynlavery-diagram-design-2026-04-28.json` �?归档数据
- **内容**: 13 种编辑级图表类型，Self-contained HTML + SVG，无阴影/�?Mermaid 杂讯

## [2026-04-28] github-collect | yizhiyanhua-ai/fireworks-tech-graph 收集完成

- **来源**: https://github.com/yizhiyanhua-ai/fireworks-tech-graph
- **操作**: 验证 URL �?GitHub MCP 获取元数�?�?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 4,750
  - Language: Python
  - License: MIT
  - Topics: claude-code-skill, svg, diagram, ai-agent
- **生成文件**:
  - `wiki/resources/github-repos/yizhiyanhua-ai-fireworks-tech-graph.md` �?Wiki 页面
  - `archive/resources/github/yizhiyanhua-ai-fireworks-tech-graph-2026-04-28.json` �?归档数据
- **内容**: 7 种视觉风格�?4 种图表类型、完�?UML 支持、AI/Agent 领域模式

## [2026-04-28] github-collect | addyosmani/agent-skills 收集完成

- **来源**: https://github.com/addyosmani/agent-skills
- **操作**: 验证 URL �?GitHub MCP 获取元数�?�?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 24,701
  - Language: Shell
  - License: MIT
  - Topics: agent-skills, claude-code, cursor, skills
- **生成文件**:
  - `wiki/resources/github-repos/addyosmani-agent-skills.md` �?Wiki 页面
  - `archive/resources/github/addyosmani-agent-skills-2026-04-28.json` �?归档数据
- **内容**: 包含 9 个开发技能�? 个角�?Persona�? 个参考检查清�?
---

## [2026-04-27] docs-ingest | Claude MCP/工具/编排架构 文档摄取完成

- **来源**: `raw/cc-doc/` (3个文�?
- **操作**: 分析 �?去重检�?�?创建/更新 Wiki 页面
- **更新文件**:
  - `entities/claude-mcp.md` �?新增 Token 消耗分析、无法禁用用户级 MCP 的三种方�?  - `entities/claude-tools.md` �?新增六大类别概览表格（Bash/LSP/Monitor/PowerShell 行为�?- **新建文件**:
  - `synthesis/orchestration-architecture.md` �?Command �?Agent �?Skill 分层编排架构详解
- **归档**: 源文件已存在�?`archive/cc-doc/`（之前批次已归档�?
---

## [2026-04-27] docs-ingest | Claude Code Week 15 周报摄取

- **来源**: `raw/cc-doc/Week 15 · April 6�?0, 2026.md`
- **操作**: 分析 �?去重检�?�?创建 Wiki 页面
- **新建文件**: `wiki/sources/claude-code-week-15-2026.md`
- **内容**: Ultraplan、Monitor tool�?autofix-pr�?team-onboarding �?4 个主要功�?
---

## [2026-04-27] docs-ingest | 工具/命令/Hooks/Plugins 官方文档摄取完成

- **来源**: `raw/cc-doc/` (13个文�?
- **操作**: 分析 �?创建/更新 Wiki 页面
- **新建文件**:
  - `entities/claude-tools.md` �?工具参考完整列表（�?Bash/LSP/Monitor/PowerShell 行为�?  - `entities/claude-checkpointing.md` �?断点、会话状态管�?  - `entities/claude-interactive-mode.md` �?交互模式（快捷键/Vim/命令历史/后台任务�?  - `entities/claude-env-vars.md` �?环境变量完整参�?  - `entities/claude-auto-mode.md` �?自动模式配置
  - `entities/claude-setup.md` �?系统要求、安装和高级设置
  - `implementation/plugins-reference.md` �?Plugin 系统完整参考（架构/生命周期�?  - `implementation/plugin-marketplace.md` �?Plugin Marketplace 创建和分�?  - `implementation/plugin-dependencies.md` �?依赖版本约束管理
- **更新文件**:
  - `entities/claude-cli.md` �?更新 source 字段
  - `entities/claude-commands.md` �?更新 source 字段
  - `entities/claude-hooks.md` �?更新 source 字段
  - `sources/claude-channels-full.md` �?Channels 完整文档（已存在�?- **已归�?*: `raw/cc-doc/` �?`archive/cc-doc/`�?3个文件）

---

## [2026-04-27] docs-ingest | Skills 官方文档摄取完成

- **来源**: `raw/cc-doc/使用 skills 扩展 Claude.md`
- **操作**: 去重检�?�?更新现有页面 �?归档
- **发现重复**: `wiki/entities/claude-skills.md`�?6行简略版�?- **更新文件**: `entities/claude-skills.md`（扩展至 ~250行，含完整示例和故障排除�?- **归档**: `raw/cc-doc/` �?`archive/cc-doc/使用 skills 扩展 Claude.md`

---

## [2026-04-27] docs-ingest | 官方文档摄取完成（第三批�?
- **来源**: `raw/cc-doc/` (3个文�?
- **操作**: 分析 �?创建 Wiki 页面 �?归档
- **新建文件**:
  - `sources/claude-skills-full.md` �?Skills 完整官方文档
  - `sources/claude-hooks-full.md` �?Hooks 完整官方文档
  - `sources/claude-subagents-full.md` �?Subagents 完整官方文档
- **归档**: `raw/cc-doc/` �?`archive/cc-doc/`
  - `使用 hooks 自动化工作流.md`
  - `创建自定�?subagents.md`

---

## [2026-04-27] docs-ingest | 官方文档摄取完成（第二批�?
- **来源**: `archive/cc-doc/` (4个文�?
- **操作**: 分析 �?创建/更新 Wiki 页面
- **新建文件**:
  - `guides/permissions.md` �?权限模式详解（default/acceptEdits/plan/auto/dontAsk/bypassPermissions�?  - `guides/claude-directory.md` �?.claude 目录结构详解
- **更新文件**:
  - `concepts/claude-memory.md` �?整合「Claude 如何记住你的项目.md」完整内�?  - `entities/claude-skills.md` �?整合「扩�?Claude Code.md」Skills 相关内容

---

## [2026-04-27] docs-ingest | 官方文档摄取完成（第一批）

- **来源**: `raw/cc-doc/` (8个文�?
- **操作**: 分析 �?去重 �?创建/更新 Wiki 页面
- **更新文件**:
  - `entities/claude-code.md` �?补充代理循环、工具类别、会话管�?  - `concepts/context-window.md` �?添加压缩行为和交互式演练
- **新建文件**:
  - `guides/best-practices.md` �?最佳实践指�?  - `guides/workflows.md` �?常见工作流程
- **归档**: `raw/cc-doc/` �?`archive/cc-doc/`

---

## [2026-04-27] lint | Source 路径修复完成

- **操作**: 修复 18 �?entities 页面�?source 路径错误
- **问题**: 使用�?`../../../archive/` 而非 `../../archive/`
- **修复文件**:
  - `entities/brand-guardian.md`
  - `entities/engineering-*.md` (11个文�?
  - `entities/design-*.md` (6个文�?
- **验证结果**:
  - Source 路径问题: 82 �?0 �?  - 根因: 之前脚本 bug 产生误报
- **更新**: `WIKI-LINT-REPORT.md` 已更新为当前状�?
---

## [2026-04-27] docs-ingest | Command/Agent/Skill 文档整合

- **操作**: 文档摄取（raw/ �?wiki/ + archive/�?- **更新**:
  - `wiki/synthesis/agent-command-skill-comparison.md` �?追加调用关系解析章节
- **新建**:
  - `wiki/implementation/agent-command-skill-fields.md` �?字段完整对比规格
  - `wiki/entities/engineering-sre-agent.md` �?SRE Agent 实体
- **归档**:
  - `archive/notes/2026-04-27-command-subagent-skill-relation.md`
  - `archive/notes/2026-04-27-agent-command-skill-fields.md`
  - `archive/agency-agents/engineering/engineering-sre.md`

---

## [2026-04-26] agency-agents | 多代理工作流文档

- **操作**: 归档 `archive/agency-agents/` �?`archive/agency-agents/`
- **文档状�?*: 6 个工作流文档已存在于 Wiki
  - `wiki/guides/workflow-startup-mvp.md` �?7-Agent 创业 MVP 工作�?  - `wiki/guides/workflow-with-memory.md` �?MCP Memory 增强�?  - `wiki/guides/workflow-book-chapter.md` �?Book Co-Author 工作�?  - `wiki/guides/workflow-landing-page.md` �?4-Agent 快速落�?  - `wiki/guides/nexus-spatial-discovery.md` �?8-Agent 深度调研
  - `wiki/guides/workflow-examples.md` �?README 概览
- **来源**: `archive/agency-agents/examples/`

---

## [2026-04-23] setup | Wiki 初始�?
- **操作**: 初始�?Wiki 结构
- **创建目录**:
  - `wiki/concepts/` �?概念页面
  - `wiki/entities/` �?实体页面
  - `wiki/sources/` �?来源摘要
  - `wiki/synthesis/` �?综合分析
  - `wiki/guides/` �?使用指南
  - `raw/` �?原始来源
- **创建核心文件**:
  - `WIKI.md` �?Schema 规范
  - `index.md` �?Wiki 索引
  - `log.md` �?本日�?- **创建示例页面**:
  - `concepts/context-window.md`
  - `concepts/context-management.md`
  - `concepts/agent-harness.md`
  - `entities/claude-code.md`
  - `entities/claude-skills.md`
  - `sources/karpathy-llm-wiki.md`
  - `synthesis/agent-architecture.md`
  - `guides/quick-start.md`
- **来源**: 项目现有文档分析
- **备注**: Wiki 基于 Karpathy LLM Wiki 方法论建�?
---

## [2026-04-23] lint | 初始健康检�?
- **状�?*: Wiki 刚建立，无需检�?- **待办**:
  - 随着来源摄入，更新相关页�?  - 监控孤立页面
  - 建立概念间交叉引�?
---

## [2026-04-23] complete | Wiki 示例页面创建完成

- **操作**: 创建所有核�?Wiki 页面
- **创建页面**:
  - `entities/claude-code.md` �?CLI 工具完整指南
  - `entities/claude-skills.md` �?Skills 扩展系统
  - `sources/karpathy-llm-wiki.md` �?方法论来源摘�?  - `synthesis/agent-architecture.md` �?Agent 架构综合分析
  - `guides/quick-start.md` �?快速入门指�?- **更新文件**:
  - `index.md` �?添加新页面到索引
- **待创建页�?*:
  - `entities/claude-subagents.md`
  - `entities/claude-mcp.md`
  - `entities/claude-hooks.md`
  - `entities/claude-commands.md`

---

## [2026-04-23] move | Wiki 目录移至根目�?
- **操作**: �?Wiki �?`.omc/wiki/` 移动到根目录 `wiki/`
- **更新文件**:
  - `WIKI.md` �?更新路径引用
  - `guides/quick-start.md` �?更新目录结构
  - `log.md` �?更新日志路径
  - `.claude/.gitignore` �?添加 wiki/ 排除规则

---

---

## [2026-04-23] frontmatter | 为所有文档添�?YAML Frontmatter

- **操作**: �?best-practice、reports、tips 添加 frontmatter
- **best-practice 文档** (7�?:
  - `best-practice/claude-memory.md` �?记忆系统
  - `best-practice/claude-subagents.md` �?子代�?  - `best-practice/claude-settings.md` �?设置配置
  - `best-practice/claude-mcp.md` �?MCP集成
  - `best-practice/claude-hooks.md` �?Hooks系统
  - `best-practice/claude-commands.md` �?Commands
  - `best-practice/claude-skills.md` �?Skills系统
- **reports 文档** (5�?:
  - `reports/harness-architecture.md` �?Harness架构重要�?  - `reports/llm-day-to-day-degradation.md` �?LLM性能波动
  - `reports/learning-journey-weather-reporter-redesign.md` �?演示重构
  - `reports/claude-usage-and-rate-limits.md` �?用量限制
- **tips 文档** (8�?:
  - `tips/claude-boris-13-tips-03-jan-26.md`
  - `tips/claude-boris-12-tips-12-feb-26.md`
  - `tips/claude-boris-10-tips-01-feb-26.md`
  - `tips/claude-boris-2-tips-10-mar-26.md`
  - `tips/claude-boris-2-tips-25-mar-26.md`
  - `tips/claude-boris-15-tips-30-mar-26.md`
  - `tips/claude-thariq-tips-16-apr-26.md`
  - `tips/claude-boris-6-tips-16-apr-26.md`
- **Frontmatter 字段**:
  - name: 页面slug标识
  - description: 一句话描述
  - type: concept/entity/source/synthesis/guide
  - tags: 标签数组
  - created: 创建日期
  - updated: 更新日期
  - sources: 来源数量

---

## [2026-04-23] index | 更新 Wiki 索引

- **操作**: 更新 wiki/index.md 索引
- **添加分类**:
  - Sources (来源) �?添加5个来源页�?  - Tips (技�? �?添加8个tips页面
- **更新统计**: 总页面数 25
- **更新标签�?*: 添加 tips、boris、thariq 等标�?
---

## 2026-05-02

### 技术教学质量保障体系建�?
- **14:00** �?设计文档完成：`docs/superpowers/specs/2026-05-02-teaching-skill-verification-design.md`
  - 建立分层置信度模型：📌 事实�?/ 💡 洞察�?/ 🔮 推测�?  - 决策：Skill 内部强制调用 wiki-query

- **14:30** �?实施计划完成：`docs/superpowers/plans/2026-05-02-teaching-skill-verification-plan.md`

- **Phase 1 P0 实施**
  - `.claude/rules/teaching-accuracy.md` �?添加分层置信度模�?  - `.claude/skills/mentor-ai-programming/SKILL.md` �?添加 Pre-Teaching Verification Gate
  - `wiki/log.md` �?本记�?
- **Phase 2 P1 验证** �?测试通过，验�?Gate 正常工作

- **Phase 3 P2 自动错误追踪**
  - `.claude/skills/mentor-ai-programming/SKILL.md` �?添加自动错误追踪机制
    - 定义三种触发场景：warning/error/critical
    - 记录格式：error_id, date, severity, source, category, topic, content, confidence_label, user_feedback, improvement
    - 执行方式：输出未验证内容后调�?`wiki-capture` 记录�?error-tracking.md

### 相关文档

- 设计文档：`docs/superpowers/specs/2026-05-02-teaching-skill-verification-design.md`
- 实施计划：`docs/superpowers/plans/2026-05-02-teaching-skill-verification-plan.md`
- 错误追踪：`.claude/rules/error-tracking.md`

---

## [2026-04-26] migration | implementation 文档迁移完成

- **操作**: 迁移 implementation/ 目录�?5 个实现文�?- **创建页面**:
  - `guides/agent-teams.md` �?Agent Teams 多会话协�?  - `guides/commands.md` �?Commands 命令实现
  - `guides/skills.md` �?Skills 实现指南
  - `guides/subagents.md` �?Sub-agents 实现指南
  - `guides/scheduled-tasks.md` �?定时任务 /loop 调度
- **更新 index.md**: 添加 5 个新页面，统计更新至 41 �?- **待创建页�?*:
  - `entities/claude-subagents.md`
  - `entities/claude-mcp.md`
  - `entities/claude-hooks.md`
  - `entities/claude-commands.md`

---

## [2026-04-26] migration | best-practice 迁移完成

- **操作**: 完成 7 �?best-practice 文件迁移�?Wiki
- **已迁移文�?*:
  - `wiki/entities/claude-cli-startup-flags.md` �?CLI 75+ 启动参数
  - `wiki/entities/claude-hooks.md` �?Hooks 系统
  - `wiki/concepts/claude-memory.md` �?(已存在，更新)
  - `wiki/entities/claude-subagents.md` �?(已存在，更新)
  - `wiki/entities/claude-commands.md` �?(已存在，更新)
  - `wiki/entities/claude-skills.md` �?(已存在，更新)
  - `wiki/entities/claude-mcp.md` �?(已存在，更新)
- **更新 index.md**: 添加 2 个新实体页面，更新统�?36�?9
- **标签云更�?*: 添加 claude-md、monorepo、flags、hooks 等标�?- **待删�?*: `best-practice/` 目录 �?(图片已迁�?archive/assets/images/best-practice/)

---

## [2026-04-26] verify | Wiki 状态核查与修正

- **操作**: 核查文件数量与索引一致�?- **发现差异**:
  - Sources: index 记录 11，实�?7�?4�?  - Tips: index 记录 8，实�?5�?3�?- **修正内容**:
  - 更新 Sources 分类：去除不存在的文件引�?  - 更新 Tips 分类：保留实际存在的 5 个文�?  - 更新统计数字�?1 �?36
  - 添加缺失�?entities �?concepts 条目
- **最终统�?*: 36 页（concepts:6, entities:7, sources:7, synthesis:4, guides:7, tips:5�?
---

## [2026-04-26] fix | archive/implementation 图片路径修复完成

- **修复文件** (3�?:
  - `claude-agent-teams-implementation.md:33` �?`assets/impl-agent-teams.png` �?`../../assets/images/implementation/impl-agent-teams.png`
  - `claude-scheduled-tasks-implementation.md:41` �?`assets/impl-loop-1.png` �?`../../assets/images/implementation/impl-loop-1.png`
  - `claude-scheduled-tasks-implementation.md:56` �?`assets/impl-loop-2.png` �?`../../assets/images/implementation/impl-loop-2.png`

---

## [2026-04-26] migrate | tutorial �?tips 目录迁移完成

- **迁移内容**:
  - `tutorial/` �?`archive/tutorial/`（包�?day0 �?day1 教程�?  - `tips/assets/` �?`archive/assets/images/tips/`（Boris �?Thariq 技巧图片）
  - `tutorial/day0/assets/login.png` �?`archive/assets/images/tutorial/login.png`
- **更新 wiki 引用** (5�?:
  - `wiki/tutorial/day0/README.md` �?添加 source 字段
  - `wiki/tutorial/day0/linux.md` �?添加 source 字段
  - `wiki/tutorial/day0/mac.md` �?添加 source 字段
  - `wiki/tutorial/day0/windows.md` �?添加 source 字段
  - `wiki/tutorial/day1/README.md` �?添加 source 字段
- **修复 archive 引用** (1�?:
  - `archive/tutorial/day0/README.md:62` �?`assets/login.png` �?`../!/images/tutorial/login.png`
- **删除残留目录**: `tutorial/`, `tips/`

---

## [2026-04-26] cleanup | reports, changelog, logs 目录清理完成

- **reports/ �?archive/assets/images/reports/**:
  - 迁移报告相关图片到统一管理
  - 修复 archive/reports/ 中的图片引用 (3�?:
    - `claude-advanced-tool-use.md:56`
    - `llm-day-to-day-degradation.md:28-29`
  - 删除残留目录 `reports/`
- **changelog/ �?archive/changelog/**:
  - 迁移变更日志�?archive 作为历史记录
  - 包含 best-practice �?development-workflows 的完整变更历�?  - 删除根目�?`changelog/`
- **logs/**:
  - 删除运行时日志目录（不应在版本控制中�?  - 创建 `.gitignore` 防止未来日志被提�?
---

## [2026-04-26] fix | Wiki source 引用修复完成

- **修复 source 引用** (1�?:
  - `wiki/guides/agent-teams.md:7` �?`source: ../archive/implementation/claude-agent-teams/` �?`source: ../archive/implementation/claude-agent-teams-implementation.md`
- **创建缺失源文�?* (1�?:
  - `archive/best-practice/claude-hooks.md` �?Hooks 系统完整源文档，包含配置、用例、最佳实践和示例
- **验证结果**: 所�?wiki 页面 source 引用现已指向存在的文�?
---

## [2026-04-26] update | Wiki 差距分析报告更新

- **修正统计数字** (3�?:
  - entities/: 10 �?9
  - synthesis/: 5 �?4
  - tips/: 13 �?12
- **验证结果更新**:
  - raw/ 目录状态：已创建（空目录）
  - source 引用�?2 个页面已验证指向存在�?archive 文件
- **报告状�?*: "已过�? �?"当前有效"
- **待处理项**: P4 Lint 工具异常（报�?页但实际62页）

---

---

## [2026-04-26] lint | Wiki Lint 工具创建与执�?
- **创建工具**: `.claude/skills/wiki-lint/wiki-lint.sh` �?Wiki 健康检查脚�?- **功能**:
  - 页面统计（按分类�?  - Frontmatter 完整性检�?  - 交叉引用验证（[[...]] 链接�?  - Source 引用验证
- **执行结果**: 生成 `wiki/WIKI-LINT-REPORT.md`
- **发现**: Source 引用路径系统性错误（所有路径缺少一�?`../`�?  - 影响范围: 37 个页�?  - 根本原因: Wiki 页面位于 `wiki/xxx/yyy.md`，使�?`../archive/` 指向 `wiki/archive/`，但实际 archive 在项目根目录
  - 正确路径: `wiki/entities/` 应使�?`../../archive/`（两�?`..`�?- **状�?*: P4 已完成（工具创建成功�?
---

## [2026-04-26] fix | Source 路径系统性错误批量修复完�?
- **修复范围**: 37 �?Wiki 页面�?source 引用路径
- **修复方法**: 
  - 一级子目录（concepts/, entities/, 等）：`source: ../archive/...` �?`source: ../../archive/...`
  - 二级子目录（tutorial/day0/, tutorial/day1/）：`source: ../../archive/...` �?`source: ../../../archive/...`
- **执行命令**:
  ```bash
  find wiki -mindepth 2 -maxdepth 2 -type f -name "*.md" \
    -not -path "*/tutorial/*" \
    -exec sed -i 's|source: \.\./archive/|source: ../../archive/|' {} \;
  
  find wiki/tutorial -type f -name "*.md" \
    -exec sed -i 's|source: \.\./\.\./archive/|source: ../../../archive/|' {} \;
  ```
- **验证结果**: 
  - Lint 工具报告 Source 引用问题�?32 个降�?0 �?  - �?所�?source 引用现已指向存在�?archive 文件
- **更新文档**: `WIKI-GAP-ANALYSIS.md` P5 标记为已完成
- **状�?*: P5 已完�?
---

## [2026-04-26] standards | log.md 规范�?
- **操作**: �?log.md 添加 YAML Frontmatter
- **添加字段**:
  - name: wiki-log
  - description: Wiki 操作历史记录 �?所有变更的追加式日�?  - type: reference
  - tags: [wiki, log, history, changelog, operations]
  - created: 2026-04-23
  - updated: 2026-04-26
- **效果**: Frontmatter 问题�?6 个降�?3 个（仅剩 WIKI-LINT-REPORT.md�?- **状�?*: 已完�?
---

## [2026-04-26] optimize | WIKI.md 文档优化完成

- **操作**: 基于实践经验优化 WIKI.md
- **更新内容**:
  - **目录结构**: 补充完整的子目录（tutorial/day0/, tutorial/day1/, assets/images/ 等）
  - **Lint 章节**: 更新为实际工具命�?`cd wiki && ../.claude/skills/wiki-lint/wiki-lint.sh`
  - **故障排除**: 新增章节，记�?source 路径错误修复经验
  - **更新历史**: 记录本次优化到版本历史（v2.1�?- **新增内容**:
  - 路径计算规则�?  - 批量修复命令
  - 验证命令示例
- **版本**: 2.0 �?2.1
- **状�?*: 已完�?
---

## [2026-04-26] migration | Dataview 自动索引迁移完成

- **操作**: �?index.md 从手动表格迁移到 Dataview 自动查询
- **创建文件**:
  - `wiki/index-manual.md` �?手动索引备份（应急用�?  - `wiki/index-auto.md` �?Dataview 测试�?- **更新文件**:
  - `wiki/index.md` �?替换�?Dataview 自动版本
  - `wiki/WIKI.md` �?添加 Dataview 使用文档，版�?2.1 �?2.2
- **效果**: 零维护索引，新页面自动出现，无需手动更新
- **核心查询** (7个分�?:
  ```dataview
  TABLE without id link(file.link, title) as "页面"
  FROM "wiki/{category}"
  WHERE type = "{type}"
  SORT updated DESC
  ```
- **前提条件**: Obsidian Dataview 插件必须安装并启�?- **状�?*: 已完�?
---

## [2026-04-26] config | CLAUDE.md 创建完成

- **创建文件**: `CLAUDE.md` �?Claude Code 项目配置
- **内容**:
  - 项目上下文（Obsidian Vault + Claude CLI�?  - Wiki 操作规范（Ingest/Query/Lint�?  - Frontmatter 标准
  - 路径计算规则
  - 维护清单
- **修复**: `docs/usage-guide.md:131` �?CLAUDE.md 引用指向 WIKI.md
- **效果**: Claude Code 启动时自动加�?Wiki 操作规范

---

## [2026-04-26] move | Skills 移动�?.claude/skills 完成

- **操作**: �?Wiki Workflow Skills �?`.omc/skills/` 移动�?`.claude/skills/`
- **移动内容**: 4 �?skills 目录
  - `wiki-query/` �?`.claude/skills/wiki-query`
  - `docs-ingest/` �?`.claude/skills/docs-ingest`
  - `wiki-lint/` �?`.claude/skills/wiki-lint`
  - `inspool/` �?`.claude/skills/inspool`
- **验证结果**: Skills 工具列表显示 4 个新 skills 可用 �?- **清理**: 删除空的 `.omc/skills/` 目录
- **状�?*: 已完�?
## [2026-04-26] ingest | Design Agent 文档摄取完成

- **操作**: 8 �?Design Agent 文档�?raw/ �?wiki/ + archive/
- **创建页面** (8�?entities):
  - `entities/brand-guardian.md` �?Brand strategy specialist (💎 #E91E63)
  - `entities/ui-designer.md` �?Visual design systems specialist (🎨 purple)
  - `entities/ux-researcher.md` �?User behavior analysis specialist (🔬 green)
  - `entities/image-prompt-engineer.md` �?AI photography prompts (📷 amber)
  - `entities/inclusive-visuals-specialist.md` �?AI bias defense (🌈 #4DB6AC)
  - `entities/visual-storyteller.md` �?Visual communication specialist (🎬 orange)
  - `entities/whimsy-injector.md` �?Creative personality specialist (�?pink)
  - `entities/ux-architect.md` �?Technical architecture specialist (🏗�?blue)
- **归档**: `archive/agency-agents/design/*.md` �?`archive/agency-agents/design/`
- **方法**: 直接文件系统写入（绕�?obsidian CLI 语法限制�?- **状�?*: 已完�?
## [2026-04-27] docs-ingest | 文档摄取完成

- **操作**: 完成剩余 raw/ 文档处理
- **归档内容**:
  - `raw/cc-doc/` �?`archive/cc-doc/` (10�?Claude Code 官方文档剪报)
  - `raw/notes/` �?`archive/notes/` (UI/UX entities 分析)
- **跳过原因**:
  - Claude Code 官方文档：Wiki 已有 `entities/claude-settings.md` �?17+ 页面覆盖
  - UI/UX notes：相�?4 �?Design Agent Wiki 页面已存�?- **清理**: 删除空的 `raw/` 目录
- **最终统�?*: 
  - 本次新增 Wiki 页面: 3 个（agent-command-skill-fields, engineering-sre-agent, 更新 synthesis�?  - 归档文件: 12 个（10 cc-doc + 1 notes + 1 engineering-sre源）
- **状�?*: �?完成

---

*格式: `## [YYYY-MM-DD] operation | Brief description`*
*查看最�?5 �? `grep "^## \[" wiki/log.md | tail -5`*

## [2026-04-28T09:20:00.000Z] 收集 GitHub 仓库

- 仓库: vercel/next.js
- Wiki 页面: wiki/resources/github-repos/vercel-nextjs.md

---

## [2026-04-28] github-collect | vercel/next.js 增强版收集完�?
- **来源**: https://github.com/vercel/next.js
- **操作**: GitHub MCP 获取元数�?�?增强归档 JSON �?生成完整 Wiki 页面
- **元数�?*:
  - Stars: 139,195
  - Forks: 30,978
  - Language: JavaScript
  - License: MIT
  - Topics: react, ssr, ssg, vercel, nextjs, node, server-rendering, static-site-generator
  - 默认分支: canary
  - 开�?Issues: 3,861
- **帮助文档检�?*:
  - �?docs/ 目录�?1-app, 02-pages, 03-architecture, 04-community�?  - �?contributing.md 详细贡献指南
  - �?外部文档: https://nextjs.org/docs
- **生成文件**:
  - `wiki/resources/github-repos/vercel-nextjs.md` �?增强�?Wiki 页面（v2.0�?  - `archive/resources/github/vercel-nextjs-2026-04-28.json` �?完整归档数据
- **内容更新**:
  - 项目快照表（Stars, Forks, 开�?Issues�?  - 核心特性说�?  - 多层次帮助文档（docs/、contributing、在线文档）
  - 安装与使用示�?  - 最新版本信�?
## [2026-04-28] github-collect | anthropics/claude-plugins-official 收集完成

- **来源**: https://github.com/anthropics/claude-plugins-official
- **操作**: GitHub MCP 获取元数�?�?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 18,064
  - Forks: 2,173
  - Language: Python
  - License: None
  - Topics: claude-code, mcp, skills
- **生成文件**:
  - `wiki/resources/github-repos/anthropics-claude-plugins-official.md` �?Wiki 页面
  - `archive/resources/github/anthropics-claude-plugins-official-2026-04-28.json` �?归档数据
- **内容**: Anthropic 官方 Claude Code Plugins 目录，包�?37 个官方插�?+ 15 个外部插�?- **官方插件**: agent-sdk-dev, clangd-lsp, code-review, code-simplifier, commit-commands, feature-dev, frontend-design, hookify, mcp-server-dev, plugin-dev, skill-creator, pr-review-toolkit, security-guidance �?- **外部插件**: asana, context7, discord, firebase, github, gitlab, greptile, imessage, laravel-boost, linear, playwright, serena, telegram, terraform
- **文档**: https://code.claude.com/docs/en/plugins

---

## [2026-04-28] github-collect | linshenkx/prompt-optimizer 收集完成

- **来源**: https://github.com/linshenkx/prompt-optimizer
- **操作**: GitHub MCP 获取元数�?�?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 27,308
  - Forks: 3,224
  - Language: TypeScript
  - License: Other
  - Topics: ai-prompts, ai-tools, llm, prompt, prompt-engineering, prompt-optimization, prompt-testing, prompt-toolkit, prompt-tuning
- **生成文件**:
  - `wiki/resources/github-repos/linshenkx-prompt-optimizer.md` �?Wiki 页面
  - `archive/resources/github/linshenkx-prompt-optimizer-2026-04-28.json` �?归档数据
- **内容**: AI 提示词优化器，用于编写更好的提示词并获得更好�?AI 结果
- **技术栈**: Next.js/React, pnpm monorepo, Docker, Playwright E2E, Vercel
- **主页**: https://prompt.always200.com

---

## [2026-04-28] github-collect | garrytan/gbrain 收集完成

- **来源**: https://github.com/garrytan/gbrain
- **操作**: GitHub MCP + zread 获取元数�?�?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: ~5,400+ (24小时内获�?
  - 语言: TypeScript
  - 许可�? MIT
  - 作�? Garry Tan (Y Combinator CEO)
- **生成文件**:
  - `wiki/resources/github-repos/garrytan-gbrain.md` �?Wiki 页面
  - `archive/resources/github/garrytan-gbrain-2026-04-28.json` �?归档数据
- **内容**: AI Agent 记忆大脑，持久化知识库，26 个技能模�?- **生产数据**: 17,888 页面�?,383 人物�?23 公司�?1 �?Cron 任务
- **性能基准**: Recall@5 83%�?5%, Graph-only F1 86.6% vs grep 57.8%
- **核心架构**: Postgres + pgvector 混合搜索、Self-wiring 知识图谱、MCP Server

---

## [2026-04-28] github-collect | forrestchang/andrej-karpathy-skills 收集完成

- **来源**: https://github.com/forrestchang/andrej-karpathy-skills
- **操作**: GitHub MCP 获取元数�?�?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 95,206
  - Forks: 9,224
  - 开�?Issues: 75
  - 语言: 无（配置文件仓库�?- **生成文件**:
  - `wiki/resources/github-repos/forrestchang-andrej-karpathy-skills.md` �?Wiki 页面
  - `archive/resources/github/forrestchang-andrej-karpathy-skills-2026-04-28.json` �?归档数据
- **内容**: Karpathy �?LLM 编码陷阱观察，改�?Claude Code 行为的单文件配置
- **项目结构**: CLAUDE.md (2.3KB), CURSOR.md, EXAMPLES.md (14.8KB), README.zh.md (中文翻译)
- **Fork �?*: 9,224（极�?Fork 率，说明广泛被定制使用）
- **相关项目**: vtroisWhite 中文�? vm140205-collab Codex �? nikolasdehor 多代理编排版

---

## [2026-04-28] github-collect | EveryInc/compound-engineering-plugin 收集完成

- **来源**: https://github.com/EveryInc/compound-engineering-plugin
- **操作**: GitHub MCP 获取元数�?�?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 15,715
  - Forks: 1,223
  - Language: TypeScript
  - License: MIT
  - Topics: compound, engineering
- **生成文件**:
  - `wiki/resources/github-repos/EveryInc-compound-engineering-plugin.md` �?Wiki 页面
  - `archive/resources/github/EveryInc-compound-engineering-plugin-2026-04-28.json` �?归档数据
- **内容**: Compound Engineering 方法论官方插件，支持 Claude Code、Codex、Cursor 等平�?- **文档**: https://every.to/guides/compound-engineering
- **仓库结构**: .agents, .claude-plugin, .cursor-plugin, docs/, plugins/, scripts/, src/, tests/

---

## [2026-04-28] github-collect | safishamsi/graphify 收集完成

- **来源**: https://github.com/safishamsi/graphify
- **操作**: GitHub CLI 获取元数�?�?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 36,616
  - Language: Python
  - License: MIT
  - Topics: antigravity, claude-code, codex, gemini, graphrag, knowledge-graph, openclaw, skills
- **生成文件**:
  - `wiki/resources/github-repos/safishamsi-graphify.md` �?Wiki 页面
  - `archive/resources/github/safishamsi-graphify-2026-04-28.json` �?归档数据
- **内容**: AI coding assistant skill，将代码、文档、论文、图片或视频转换为可查询的知识图�?- **主页**: https://graphifylabs.ai/

---

## [2026-04-28] github-collect | mattpocock/skills 收集完成

- **来源**: https://github.com/mattpocock/skills
- **操作**: zread.ai 获取元数�?�?归档 JSON �?生成增强 Wiki 页面
- **元数�?*:
  - Stars: 0
  - Forks: 0
  - Language: TypeScript
  - License: MIT
  - 作�? Matt Pocock
- **生成文件**:
  - `wiki/resources/github-repos/mattpocock-skills.md` �?Wiki 页面
  - `archive/resources/github/mattpocock-skills-2026-04-28.json` �?归档数据
- **核心内容**:
  - 20+ 个专业技能模块，涵盖规划、开发、工具配置、文档编�?  - 4 大技能分类（Planning & Design, Development, Tooling & Setup, Writing & Knowledge�?  - npx 安装系统（全局或单个技能）
  - 完整工作流支持（需求→PRD→Issues→设计→开发）
  - TDD 完整支持（RED→GREEN→IMPROVE�?  - 元技�?write-a-skill 用于创建新技�?- **仓库类型**: Skills Collection（Skills 集合�?
---

## [2026-04-29] github-collect | thedotmack/claude-mem 收集完成

- **来源**: https://github.com/thedotmack/claude-mem
- **操作**: GitHub MCP 获取元数�?�?下载 README/package.json �?归档 JSON �?生成 Wiki 页面
- **元数�?*:
  - Stars: 69,320
  - Forks: 5,921
  - Language: TypeScript
  - License: AGPL-3.0
  - Version: 12.4.8
- **生成文件**:
  - `wiki/resources/github-repos/thedotmack-claude-mem.md` �?Wiki 页面
  - `archive/resources/github/thedotmack-claude-mem-2026-04-29.json` �?归档数据
- **核心内容**:
  - Claude Code 持久化记忆压缩系�?  - 自动捕获会话、AI 压缩、智能注入上下文
  - 支持 30+ 种语言
  - 知识图谱存储、Tree-sitter 解析 20+ 种语言


---

## [2026-04-29] docs-ingest | 系统提示�?+ Karpathy 技能指南摄取完�?
- **来源**: raw/ 目录文档
- **操作**: 分析 raw/ 文档 �?去重检�?�?创建/更新 Wiki 页面 �?归档�?archive/
- **处理文档**:
  1. **AI 工具系统提示词大�?* (raw/system-prompts/)
     - 来源: x1xhlol/system-prompts-and-models-of-ai-tools
     - 操作: 创建�?Wiki 页面（无重复�?     - 生成: `wiki/sources/ai-tools-system-prompts.md`
     - 归档: `archive/sources/system-prompts/`
     - 内容: 50+ AI 工具的官方系统提示词集合（Anthropic、Google、开源、商业工具）
  
  2. **Karpathy 技能指�?* (raw/andrej-karpathy-skills.md)
     - 来源: andrej-karpathy/llm.training
     - 操作: 交叉引用更新（现有页�? forrestchang/andrej-karpathy-skills�?     - 更新: `wiki/resources/github-repos/forrestchang-andrej-karpathy-skills.md`
     - 归档: `archive/sources/github-repos/andrej-karpathy-llm.training-skills.md`
     - 变更: 添加原始来源链接，说明两个仓库记录相同内�?
- **去重检查结�?*:
  - �?AI 工具系统提示�?�?无重复，创建新页�?  - ⚠️ Karpathy 技能指�?�?发现相似内容（forrestchang 仓库），采用交叉引用策略

- **归档路径**:
  - `archive/sources/system-prompts/` �?AI 工具系统提示词集�?  - `archive/sources/github-repos/andrej-karpathy-llm.training-skills.md` �?Karpathy 原始文档


---

## [2026-04-29] docs-ingest | Cursor 系统提示词摄取完�?
- **来源**: raw/system-prompts/Cursor Prompts/
- **操作**: 分析文档 �?去重检�?�?创建专门 Wiki 页面 �?归档�?archive/
- **处理文档**:
  - **Cursor IDE 系统提示词集�?* (7 个文件，2,303 �?
    - 来源: x1xhlol/system-prompts-and-models-of-ai-tools �?Cursor Prompts 子集
    - 操作: 创建专门 Wiki 页面（现有页面仅有简要提及）
    - 生成: `wiki/sources/cursor-system-prompts.md`
    - 归档: `archive/sources/system-prompts/Cursor Prompts/`
    - 内容: Cursor AI 助手完整系统提示词（v1.0 �?v1.2 �?Chat �?2025-08-07 CLI �?2025-09-03 �?2.0�?
- **版本演进记录**:
  - **v1.0** (Claude Sonnet 4, 83 �? - 早期版本，`<user_query>` 标签
  - **v1.2** (GPT-4.1, 568 �? - Knowledge cutoff: 2024-06
  - **Chat** (GPT-4o, 119 �? - 聊天模式，简化版
  - **2025-08-07 CLI** (GPT-5, 206 �? - CLI 工具专用
  - **2025-09-03** (GPT-5, 229 �? - 强调自主性（"keep going until query resolved"�?  - **2.0** (支持图片, 772 �? - OpenAI Chat 格式，详细工具定�?
- **核心内容**:
  - 交互模式演进: `<user_query>` �?自然对话 �?OpenAI Chat 格式
  - 自主性增�? 响应�?�?强调自主解决问题
  - 工具定义: 内嵌�?�?独立 JSON 文件
  - 模型支持: Claude Sonnet 4 �?GPT-4.1 �?GPT-4o �?GPT-5

- **归档文件**:
  - Agent CLI Prompt 2025-08-07.txt
  - Agent Prompt 2.0.txt
  - Agent Prompt 2025-09-03.txt
  - Agent Prompt v1.0.txt
  - Agent Prompt v1.2.txt
  - Agent Tools v1.0.json
  - Chat Prompt.txt

- **页面关系**:
  - �?`ai-tools-system-prompts.md` 的关�? 概览页面保留，创建专门的 Cursor 深度页面
  - 交叉引用: 两个页面互相链接


---

## [2026-04-29] docs-ingest | Google Antigravity + Gemini Vibe Coder 文档摄取完成

- **来源**: raw/system-prompts/Google/ (3个文�?
- **操作**: 分析文档 �?去重检�?�?创建专门 Wiki 页面 �?等待用户确认后归�?- **处理文档**:
  1. **Google Antigravity 系统提示�?* (Fast Prompt + Planning Mode)
     - 文件: Fast Prompt.txt (214�?, planning-mode.txt (308�?
     - 操作: 创建专门 Wiki 页面（无重复�?     - 生成: `wiki/sources/google-antigravity-prompts.md`
     - 待归�? `archive/sources/system-prompts/Google/Antigravity/`
     - 内容: Antigravity AI 编程助手双模式（Fast Prompt 标准模式 + Planning Mode 增强模式�?     - 核心特点: 任务可视化、用户通知、KI 知识系统、对话日志检�?   
  2. **Gemini Vibe Coder 开发指�?* (AI Studio vibe-coder.txt)
     - 文件: AI Studio vibe-coder.txt (1645�?
     - 操作: 创建专门 Wiki 页面（无重复�?     - 生成: `wiki/sources/gemini-vibe-coder.md`
     - 待归�? `archive/sources/system-prompts/Google/Gemini/`
     - 内容: React 18+、TypeScript、Tailwind CSS 开发规�?+ Gemini API 完整集成指南
     - 核心特点: 设计美学驱动、Function Calling、Live API、Search Grounding、Maps Grounding

- **去重检查结�?*:
  - �?Google Antigravity �?无重复，创建新页�?  - �?Gemini Vibe Coder �?无重复，创建新页�?
- **核心内容亮点**:
  - **Antigravity 双模式设�?*:
    - Fast Prompt: 快速响应，标准代理模式�?14�?    - Planning Mode: 知识发现增强，持久上下文�?08�?    - KI (Knowledge Items) 检查流�?    - 对话日志检索和长期记忆维护
  
  - **Vibe Coder 开发规�?*:
    - React 18+ 函数组件 + Hooks
    - TypeScript 5+ 严格类型检�?    - Tailwind CSS 3+ 实用优先样式
    - Gemini API 完整集成（Generate Content、Streaming、Function Calling、Live API、Grounding�?    - 性能优化、安全性、可访问性最佳实�?
- **待归档文�?* (用户确认�?:
  - `raw/system-prompts/Google/Antigravity/Fast Prompt.txt`
  - `raw/system-prompts/Google/Antigravity/planning-mode.txt`
  - `raw/system-prompts/Google/Gemini/AI Studio vibe-coder.txt`

- **状�?*: �?已归档完�?
---

## [2026-04-29] docs-ingest | Replit 编程助手系统提示词文档摄�?
- **来源**: `archive/system-prompts/Replit/Prompt.txt`
- **操作**: 读取系统提示词文�?�?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/replit.md`
- **归档位置**: `archive/system-prompts/Replit/Prompt.txt`
- **内容**:
  - 身份规范: Replit Assistant，XML 格式响应协议
  - 4 种能�? 提议文件更改、提�?Shell 命令、回答查询、提议工具切�?  - 8 �?XML 标签协议: proposed_file_replace_substring, proposed_file_replace, proposed_file_insert, proposed_shell_command, proposed_package_install, proposed_workflow_configuration, proposed_deployment_configuration, proposed_workspace_tool_nudge
  - 环境特�? Linux + Nix 自动包管理，自动部署�?Replit
  - 行为规则: 专注请求、遵循模式、精确修�?
---

## [2026-04-29] docs-ingest | Same.dev 云端 IDE 系统提示词文档摄�?
- **来源**: `archive/system-prompts/Same.dev/Prompt.txt`
- **操作**: 读取系统提示词文�?�?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/same-dev.md`
- **归档位置**: `archive/system-prompts/Same.dev/Prompt.txt`
- **内容**:
  - 技术栈: Bun 包管理器、shadcn/ui、Netlify 自动部署
  - 9 个工�? edit_file, string_replace, startup, versioning, deploy, web_search, web_scrape, suggestions, task_agent
  - 并行工具调用支持
  - 项目跟踪: .same/todos.md
  - 工作流程: 创建项目、添加功能、部署应�?
---

## [2026-04-29] docs-ingest | Vercel v0 编程助手系统提示词文档摄�?
- **来源**: `archive/system-prompts/v0 Prompts and Tools/Prompt.txt`
- **操作**: 读取系统提示词文�?�?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/v0.md`
- **归档位置**: `archive/system-prompts/v0 Prompts and Tools/Prompt.txt`
- **内容**:
  - 设计系统: shadcn/ui�?-5 颜色�? 种字体、移动优先响应式
  - Next.js 16 特�? proxy.js、Turbopack、React Compiler、缓存指�?  - AI SDK 缓存 API: revalidateTag, updateTag, refresh
  - 5 个工�? AskUserQuestions, Move, GenerateImage, Write, scripts
  - 组件开发流�? 接收需�?�?澄清问题 �?生成代码 �?添加样式

---

## [2026-04-29] docs-ingest | Open Source AI Agents 系统提示词文档摄�?
- **来源**: `raw/system-prompts/Open Source prompts/`
- **操作**: 读取 6 个系统提示词文件 �?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/bolt.md`, `wiki/tools/cline.md`, `wiki/tools/codex-cli.md`, `wiki/tools/gemini-cli.md`, `wiki/tools/lumo.md`, `wiki/tools/roocode.md`
- **归档位置**: `archive/system-prompts/Open Source prompts/`
- **内容**:
  - **Bolt**: WebContainer 运行环境，boltArtifact XML 格式，支�?shell/file/start/supabase 操作
  - **Cline**: VSCode 扩展�?0 种工具类型，MCP 支持
  - **Codex CLI**: OpenAI CLI 代理，apply_patch 编辑器，Git 沙箱环境
  - **Gemini CLI**: Google CLI 代理�? 阶段工作流，最少输出原�?  - **Lumo**: Proton AI 助手，多模型自动路由，零访问加密
  - **RooCode**: VSCode 扩展�? 种模式（Code/Architect/Ask/Debug/Boomerang），自定义规�?
---

## [2026-04-29] docs-ingest | Superpowers 详细用法教程（cnblogs�?
- **来源**: `raw/cnblogs/Superpowers 详细用法教程.md`
- **操作**: 读取文档 �?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/guides/superpowers-tutorial.md`
- **归档位置**: `archive/cnblogs/Superpowers 详细用法教程.md`
- **内容**:
  - 快速提示词实例：新项目起步、强�?Brainstorming、生成实施计划、执行计�?  - Bug 修复、代码审查、完成分支等场景的提示词
  - 14 个技能速查表（TDD、调试、审查等�?  - 安装方式：Claude Code、其他平台（Codex/OpenCode�?  - TDD 强制示例（RED-GREEN-REFACTOR�?  - 常见坑与解决方案

---

## [2026-04-29] docs-ingest | Commands/Agents/Skills 协作关系（notes�?
- **来源**: `raw/notes/2026-04-29-command-agent-skill-collaboration.md`
- **操作**: 读取文档 �?去重检�?�?归档（内容已存在于现有页面）
- **归档位置**: `archive/notes/2026-04-29-command-agent-skill-collaboration.md`
- **说明**: 内容已存在于 `wiki/synthesis/agent-command-skill-comparison.md`，无需创建重复页面

---

## [2026-04-29] docs-ingest | Warp 终端 AI 代理系统提示词文档摄�?
- **来源**: `archive/system-prompts/Warp.dev/Prompt.txt`
- **操作**: 读取系统提示词文�?�?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/warp-dev.md`
- **归档位置**: `archive/system-prompts/Warp.dev/Prompt.txt`
- **内容**:
  - 问题分类�? Question（需要指导）vs Task（需要执行）
  - 6 个工�? run_command, read_files, grep, file_glob, edit_files, create_file
  - 环境限制: 终端环境，无图形界面，无浏览器自动化
  - 工作流示�? 问题解答、任务执行、复杂多步骤任务
  - 最佳实�? 命令执行、文件操作、搜索优�?
## [2026-04-29] docs-ingest | Open Source AI Agents 系统提示词文档摄�?
- **来源**: `raw/system-prompts/Open Source prompts/`
- **操作**: 读取 6 个系统提示词文件 �?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**: `wiki/tools/bolt.md`, `wiki/tools/cline.md`, `wiki/tools/codex-cli.md`, `wiki/tools/gemini-cli.md`, `wiki/tools/lumo.md`, `wiki/tools/roocode.md`
- **归档位置**: `archive/system-prompts/Open Source prompts/`
- **内容**:
  - **Bolt**: WebContainer 运行环境，boltArtifact XML 格式，支�?shell/file/start/supabase 操作
  - **Cline**: VSCode 扩展�?0 种工具类型，MCP 支持
  - **Codex CLI**: OpenAI CLI 代理，apply_patch 编辑器，Git 沙箱环境
  - **Gemini CLI**: Google CLI 代理�? 阶段工作流，最少输出原�?  - **Lumo**: Proton AI 助手，多模型自动路由，零访问加密
  - **RooCode**: VSCode 扩展�? 种模式（Code/Architect/Ask/Debug/Boomerang），自定义规�?

## [2026-04-29] docs-ingest | Amp/Cluely/CodeBuddy/Comet 系统提示词文档摄取完�?
- **来源**: `raw/system-prompts/` (10 个代�?
- **操作**: 读取系统提示词文�?�?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**:
  - `wiki/tools/amp-claude-4-sonnet.md` �?Amp Claude-4-Sonnet，Agency 框架�?0 个工�?  - `wiki/tools/amp-gpt-5.md` �?Amp GPT-5，增�?Debug 能力�?56K 上下�?  - `wiki/tools/cluely-enterprise.md` �?Cluely 企业版，�? 词标题，�?5 词要�?  - `wiki/tools/cluely-default.md` �?Cluely 默认版，无元短语，LaTeX 数学渲染
  - `wiki/tools/codebuddy-chat.md` �?CodeBuddy 聊天模式，自然对话，中文环境
  - `wiki/tools/codebuddy-craft.md` �?CodeBuddy 创作模式，完整代码模�?  - `wiki/tools/comet-assistant.md` �?Comet 浏览器自动化�? 个工具（navigate/computer/find 等）
  - `wiki/tools/dia.md` �?Dia 浏览器助手，Simple Answers 模式，ASK 链接
  - `wiki/tools/emergent-e1.md` �?Emergent E1 全栈代理，React/FastAPI/MongoDB
  - `wiki/tools/codex-cli.md` �?Codex CLI，apply_patch 工具，沙�?审批模式
- **归档位置**: `archive/system-prompts/` (Amp, Cluely, CodeBuddy Prompts, dia, Emergent, Open Source prompts/Codex CLI)
- **核心内容**:
  - **Amp**: Claude-4-Sonnet 20 个工具，GPT-5 增强 Debug�?56K 上下�?  - **Cluely**: Enterprise 严格格式限制，Default 无总结直接回答
  - **CodeBuddy**: Chat 自然对话追问式，Craft 一步到位模板生�?  - **Comet**: 浏览器自动化代理�? 个工具类型，视觉理解
  - **dia**: Browser Company 产品�?strong> 标签�?dia:image/video> 嵌入
  - **E1**: Mock-First 前端，FastAPI 后端，MongoDB 数据�?  - **Codex CLI**: apply_patch 精确修改，update_plan 任务跟踪

---

## [2026-04-29] docs-ingest | Claude Code Plugin Agents 系统提示词文档摄�?
- **来源**: `raw/system-prompts/` (5 个代�?
- **操作**: 读取系统提示词文�?�?去重检�?�?创建 Wiki 页面 �?归档
- **创建页面**:
  - `wiki/tools/junie-ai.md` �?Junie 只读代理，XML 格式�? 个命令（search_project, get_file_structure, open, answer 等）
  - `wiki/tools/leap-new.md` �?Leap.new 全栈代理，Encore.ts 后端 + React 前端�?leapArtifact> XML 格式
  - `wiki/tools/lovable.md` �?Lovable 前端代理，React/Vite/Tailwind，SEO 要求，设计系统语义化 Token
  - `wiki/tools/orchids-app.md` �?Orchids.app Next.js 代理，Shadcn/UI，最小编辑片段模式，禁止 styled-jsx
  - `wiki/tools/perplexity.md` �?Perplexity 搜索代理�?0 种查询类型分类，格式规则和引用标�?- **归档位置**: `archive/system-prompts/` (Junie, Leap.new, Lovable, Orchids.app, Perplexity)
- **核心内容**:
  - **Junie**: 只读模式，XML 响应格式，专注代码探索，无交互命令支�?  - **Leap.new**: Encore.ts 后端（SQL/Storage/PubSub/Secrets/Auth�? React 前端
  - **Lovable**: SEO 规范（title/meta/semantic HTML/JSON-LD），HSL 设计系统，variant 组件模式
  - **Orchids.app**: Next.js 15 + App Router，最小编辑片段，子代理集成（Database/Auth/Payments�?  - **Perplexity**: 查询类型分类（Academic/News/Weather/People/Coding 等），置信度评估，Markdown 引用格式


---

## [2026-04-30] docs-ingest | Orchids.app 决策代理提示词摄取完�?
- **操作**: 更新现有页面 �?添加决策代理章节 �?归档源文�?- **源文�?*: `raw/system-prompts/Orchids.app/Decision-making prompt.txt`
- **归档位置**: `archive/system-prompts/Orchids.app/Decision-making prompt.txt`
- **更新页面**: `wiki/tools/orchids-app.md`
- **核心内容**:
  - Orchids.app 双代理架构：编码代理 + 决策代理
  - 决策代理工具协调流程：generate_design_system �?clone_website �?handoff_to_coding_agent
  - 克隆条件：明�?"clone" 关键�?+ 具体网站 URL
  - 关键规则：顺序调用、精确传递用户查询、单一询问


---

## [2026-04-30] docs-ingest | 系统提示词辅助文件归档完�?
- **操作**: 批量归档辅助文件�?archive/system-prompts/
- **归档文件**:
  - `Comet Assistant/System Prompt.txt` �?归档（之前遗漏）
  - `Comet Assistant/tools.json` �?归档
  - `Amp/README.md` + `view-thread-yaml.png` �?归档
  - `Emergent/Tools.json` �?归档
  - `Leap.new/tools.json` �?归档
  - `Lovable/Agent Tools.json` �?归档
- **状�?*: raw/system-prompts/ 目录已清�?- **总结**: 完成系统提示词文档的完整摄取和归档流�?

---

## [2026-04-30] wiki-lint | Wiki 健康检查完�?
- **操作**: 运行 wiki-lint 全面检�?- **统计**: 226 个页面，624 �?Wiki 链接
- **发现问题**:
  - 🔴 19+ 页面缺失 Frontmatter 字段（concepts, entities, guides, implementation, sources�?  - 🟡 18+ 无效 source 路径（archive/reports, archive/cc-doc, archive/best-practice 等）
- **本次创建页面**: �?11 �?tools/ 页面全部符合规范
- **生成报告**: `wiki/WIKI-LINT-REPORT.md`
- **建议**: 修复缺失字段和无�?source 路径



---

## [2026-05-01] docs-ingest | claude-intelligence-harnessing 摄取完成

- **来源**: raw/claude/Harnessing Claude's Intelligence  3 Key Patterns for Building Apps.md
- **新增文件**: wiki/patterns/claude-intelligence-harnessing.md
- **归档文件**: archive/patterns/claude-intelligence-harnessing-2026-05-01.md
- **核心内容**:
  - 三种核心模式：使�?Claude 已知能力、询问可停止做什么、仔细设置边�?  - SWE-bench 性能数据�?9% �?61.6% 准确率提�?  - 上下文管理演进：Pokémon 游戏示例�?1 文件 �?10 文件组织化）
  - 缓存优化原则：静态优先、消息更新、小心管理工�?  - 声明式工具用�?UX/可观测�?安全边界
- **外部来源**: Anthropic 官方博客
- **语言**: 英文源文�?�?中文 Wiki 页面
- **状�?*: �?完成


---

## [2026-05-01] docs-ingest | prompt-caching-optimization 摄取完成

- **来源**: raw/claude/Lessons from building Claude Code Prompt caching is everything.md
- **新增文件**: wiki/guides/prompt-caching-optimization.md
- **归档文件**: archive/guides/prompt-caching-optimization-2026-05-01.md
- **核心内容**:
  - Prompt Caching 工作原理（前缀匹配机制�?  - 五大优化实践�?    1. 为缓存而设计提示词（静态优先，动态最后）
    2. 使用消息进行更新（避免破坏缓存）
    3. 会话中不更换模型（使�?Subagents�?    4. 会话中不增删工具（使�?defer_loading�?    5. 缓存安全的压缩操作（共享父级前缀�?  - 缓存命中率监控（视为正常运行时间�?  - 实战案例：Plan Mode、Tool Search、Compaction
- **外部来源**: Anthropic 官方博客
- **语言**: 英文源文�?�?中文 Wiki 页面
- **状�?*: �?完成


---

## [2026-05-01] docs-ingest | onboarding-claude-code-like-new-developer 摄取完成

- **来源**: raw/claude/Onboarding Claude Code like a new developer Lessons from 17 years of development.md
- **新增文件**: wiki/guides/onboarding-claude-code-like-new-developer.md
- **归档文件**: archive/guides/onboarding-claude-code-like-new-developer-2026-05-01.md
- **核心内容**:
  - Skyline 项目案例�?00,000+ �?C#�?7年开发历史）
  - 三层次架构方法论�?    1. 独立 AI 上下文仓库（pwiz-ai�?    2. Skills 编码领域知识�?参考而非嵌入"原则�?    3. MCP 集成实时数据访问
  - 实战成果�?    - Files View 面板�?周完成（原搁置项目）
    - Nightly Test 模块�?1天偿�?年技术债务
    - 每日摘要自动�?+ C# MCP 服务�?  - 给遗留代码库的建议：上下文是关键、投资技能库、使�?MCP
- **案例来源**: MacCoss Lab（华盛顿大学�?- **语言**: 英文源文�?�?中文 Wiki 页面
- **状�?*: �?完成

---

## [2026-05-01] docs-ingest | seeing-like-an-agent-tool-design 摄取完成

- **来源**: raw/claude/Seeing like an agent how we design tools in Claude Code.md
- **新增文件**: wiki/guides/seeing-like-an-agent-tool-design.md
- **归档文件**: archive/guides/seeing-like-an-agent-tool-design-2026-05-01.md
- **核心内容**:
  - 工具设计哲学：从 Agent 视角思考，工具与能力匹�?  - AskUserQuestion 工具演进�? 次尝试）�?    1. ExitPlanTool 参数（❌ 混淆 Claude�?    2. 输出格式控制（❌ 不可靠）
    3. 独立工具（✅ 成功�?  - 任务管理进化：TodoWrite �?Task tool（支�?subagent 协调�?  - 搜索接口演进：RAG �?Grep �?Agent Skills（渐进式披露�?  - Claude Code Guide Agent：专�?subagent 处理文档查询
  - 设计原则：渐进式披露优先、持续演进假设、工具数量控制（~20 个上限）
- **外部来源**: Anthropic 官方博客
- **语言**: 英文源文�?�?中文 Wiki 页面
- **状�?*: �?完成


---

## [2026-05-01] docs-ingest | auto-mode 摄取完成

- **来源**: raw/claude/Auto mode for Claude Code.md
- **新增文件**: wiki/guides/auto-mode.md
- **归档文件**: archive/guides/auto-mode-2026-05-01.md
- **核心内容**:
  - Auto mode 功能介绍：减少中断且保持安全的中间路�?  - 分类器检查机制：阻止批量删除、数据外泄、恶意代码执�?  - 决策流程：安全操作自动继续，风险操作阻止或重定向
  - 风险评估：比 --dangerously-skip-permissions 更安全，但不消除风险
  - 使用方法：Claude --enable-auto-mode，Shift+Tab 切换
  - 可用性：Team Plan 现已推出，Enterprise/API 即将推出
  - 兼容性：Claude Sonnet 4.6 �?Opus 4.6
- **外部来源**: Anthropic 官方博客
- **语言**: 英文源文�?�?中文 Wiki 页面
- **状�?*: �?完成

---

## [2026-05-01] docs-ingest | code-review 摄取完成

- **来源**: raw/claude/Code Review for Claude Code.md
- **新增文件**: wiki/guides/code-review.md
- **归档文件**: archive/guides/code-review-2026-05-01.md
- **核心内容**:
  - Code Review 功能介绍：多 Agent 团队深度审查，捕�?skim 遗漏�?bug
  - 工作原理：并行查�?bug �?验证 bug �?严重程度排序 �?高信噪比输出
  - 审查扩展：大�?PR�?1000 行）84% 有发现，小型 PR�?50 行）31% 有发�?  - 成本结构：平�?$15-25，根�?PR 规模和复杂度扩展
  - 管理员控制：月度上限、仓库级别控制、分析仪表板
  - 可用性：Team & Enterprise 研究预览�?  - 真实案例：TrueNAS ZFS 加密重构中发现预先存在的 bug
- **外部来源**: Anthropic 官方博客
- **语言**: 英文源文�?�?中文 Wiki 页面
- **状�?*: �?完成

---

## [2026-05-01] docs-ingest | skill-creator-improvements 摄取完成

- **来源**: raw/claude/Improving skill-creator Test, measure, and refine Agent Skills.md
- **新增文件**: wiki/guides/skill-creator-improvements.md
- **归档文件**: archive/guides/skill-creator-improvements-2026-05-01.md
- **核心内容**:
  - Skill Creator 改进：Evals、Benchmark、Multi-agent 支持
  - 两种技能类型：Capability Uplift（能力提升型）vs Encoded Preference（偏好编码型�?  - Evals 测试系统：捕获质量回退、识别模型进�?  - Benchmark 模式：标准化评估（通过率、时间、token 使用量）
  - Multi-agent 支持：并行评估、独立上下文、无交叉污染
  - Comparator Agents：A/B 比较技能版�?  - Description 优化：改进触发准确性，减少误报漏报
  - 未来展望：从 \"How\" �?\"What\" 的技能定义演�?  - 可用平台：Claude.ai、Cowork、Claude Code 插件
- **外部来源**: Anthropic 官方博客
- **语言**: 英文源文�?�?中文 Wiki 页面
- **状�?*: �?完成

---

## [2026-05-01] docs-ingest | skills-building-guide 摄取完成

- **来源**: raw/claude/A complete guide to building skills for Claude.md
- **新增文件**: wiki/resources/skills-building-guide.md
- **归档文件**: archive/resources/skills-building-guide-2026-05-01.md
- **核心内容**:
  - Skills 构建完整指南资源索引
  - PDF 下载：The Complete Guide to Building Skills for Claude
  - 目标受众：开发者、MCP 连接器构建者、高级用户、团�?  - 学习内容：技术要求、工作流模式、测试与分发
  - 时间投入�?5-30 分钟（需明确 2-3 个工作流�?  - 相关资源：Skills 功能发布、Skill Creator 插件、Skills 仓库
- **外部来源**: Anthropic 官方博客
- **语言**: 英文源文�?�?中文 Wiki 页面
- **类型**: 资源索引
- **状�?*: �?完成

---

## [2026-05-01] docs-ingest | contribution-metrics 摄取完成

- **来源**: raw/claude/Measure Claude Code's impact with contribution metrics.md
- **新增文件**: wiki/guides/contribution-metrics.md
- **归档文件**: archive/guides/contribution-metrics-2026-05-01.md
- **核心内容**:
  - Contribution Metrics 功能：衡�?Claude Code 对团队速度的影�?  - 内部数据：Anthropic 67% PRs 增长�?0-90% 代码使用 Claude Code
  - 数据指标：PRs merged、Code committed、Per-user contribution data
  - 数据计算：保守匹配会话与 GitHub 活动，只计高度确信的辅助
  - 集成方式：GitHub App + Claude Code analytics dashboard
  - 无需额外工具：自动填�?metrics
  - 使用场景：补充现�?KPIs（DORA、Sprint velocity�?  - 可用性：Team & Enterprise Beta
  - 设置步骤：安�?GitHub App �?启用 GitHub Analytics �?认证组织 �?自动追踪
- **外部来源**: Anthropic 官方博客
- **语言**: 英文源文�?�?中文 Wiki 页面
- **状�?*: �?完成

---

## [2026-05-01] docs-ingest | agents-skills-paradigm 摘取完成

- **来源**: raw/claude/Building Agents with Skills Equipping Agents for Specialized Work.md
- **新增文件**: wiki/concepts/agents-skills-paradigm.md
- **归档文件**: archive/concepts/building-agents-with-skills-2026-05-01.md
- **核心内容**:
  - Agent Skills 范式：从专用智能体转向通用智能�?+ 技能组�?  - 代码作为通用接口：Claude Code 通过代码完成任何数字工作
  - 渐进式披露：三层加载（Metadata ~50 tokens、SKILL.md ~500、References 2000+�?  - Skills 可包含脚本：代码自文档化、可修改、无需始终在上下文
  - 生态系统：基础技能、合作伙伴技能、企业技�?  - 趋势观察：复杂度增加（简�?100 �?�?复杂 2500+ 行）、Skills �?MCP 协同、非开发者采�?  - 完整架构：Agent loop + Runtime + MCP servers + Skills library
  - 垂直部署：金融服务（DCF 模型、可比公司分析）、医疗健康（生物信息学、临床试验）
  - Agent Skills 标准化：开放标�?AgentSkills.io
  - 相关资源：Skills 文档、GitHub 仓库、Cookbook、最佳实�?- **外部来源**: Anthropic 官方博客
- **语言**: 英文源文�?�?中文 Wiki 页面
- **类型**: 概念
- **状�?*: �?完成

---

## [2026-05-01] docs-ingest | claude-hooks-configuration-guide 摄取完成

- **来源**: raw/claude/Claude Code power user customization How to configure hooks.md
- **新增文件**: wiki/guides/claude-hooks-configuration-guide.md
- **归档文件**: archive/guides/claude-hooks-configuration-2026-05-01.md
- **核心内容**:
  - Claude Code Hooks 高级配置指南（完�?443 行实践指南）
  - 八种 Hook 类型详解：PreToolUse、PermissionRequest、PostToolUse、PreCompact、SessionStart、Stop、SubagentStop、UserPromptSubmit
  - 配置位置和优先级：项目级、用户级、本地项目级
  - Matcher 语法：基础匹配、多工具匹配、通配符、参数模式、MCP 工具模式
  - 输入输出和结构化响应：stdin JSON、exit codes、JSON 响应字段
  - 环境和执行：环境变量（CLAUDE_PROJECT_DIR、CLAUDE_CODE_REMOTE）、超时、并行执�?  - 安全考虑：直接编辑需审查、用户权限执行、安全实�?  - 调试技巧：transcript 日志、log-wrapper.sh 包装脚本
  - 构建建议：从简�?Hook 开始、PostToolUse 格式化器为起�?- **外部来源**: Anthropic 官方博客
- **语言**: 英文源文�?�?中文 Wiki 页面
- **类型**: 高级配置指南
- **状�?*: �?完成

## 2026-05-01 - Agentic Coding Benefits 摄取

**来源文件**: `raw/claude/The key benefits of transitioning to agentic coding.md`

**新建页面**: 
- `wiki/concepts/agentic-coding-benefits.md`

**归档位置**: 
- `archive/concepts/agentic-coding-benefits-2026-05-01.md`

**核心内容**:
- Agentic Coding 的六大核心好�?- 开发时间线的显著加速（Augment Code 案例�?- 开发者入职的指数级改善（从数周到 1-2 天）
- 跨复杂系统的自主问题解决（生产调试示例）
- 无需线性人员增长的开发扩�?- 通过系统分析增强代码质量
- 复杂开发能力的民主化访问（Grafana 案例�?
**技术要�?*:
- �?AI 辅助�?Agentic 编程的根本性转�?- 速度超越打字辅助�? 周完成传统需�?4-8 个月的项�?- 消除复杂代码库的认知开销
- Agent 作为思考伙伴，具有整个代码库的完美记忆
- 动态问题解�?vs 传统预定义脚�?- 多文件操作专长（重构数据模型等）
- 打破系统复杂性与团队规模之间的线性关�?- 系统性代码质量方�?- 专业能力民主化（�?Grafana 的智能助手）


## 2026-05-01 - CLAUDE.md 配置指南摄取

**来源文件**: `raw/claude/Using CLAUDE.MD files Customizing Claude Code for your codebase.md`

**新建页面**: 
- `wiki/guides/claude-md-configuration-guide.md`

**归档位置**: 
- `archive/guides/claude-md-configuration-2026-05-01.md`

**核心内容**:
- CLAUDE.md 文件的作用和重要�?- 使用 `/init` 命令自动生成配置
- 如何构建 CLAUDE.md（项目地图、工具集成、工作流程定义）
- 保持上下文新鲜（`/clear` 命令�?- 使用 Subagents 进行不同阶段工作
- 创建自定义斜杠命令（性能优化示例�?- 从简单开始，有意识地扩展

**技术要�?*:
- CLAUDE.md 是项目特定的持久上下文配置文�?- 可放在仓库根目录、父目录（monorepo）或主文件夹
- `/init` 命令分析代码库并生成入门配置
- 项目地图：目录树结构、主要依赖、架构模�?- MCP 服务器集成（�?Slack MCP 配置示例�?- 标准工作流程：四个关键问题（调查、计划、信息、测试）
- `/clear` 命令重置上下文窗口，保持信噪�?- Subagents 维护隔离上下文，防止早期任务干扰新分�?- 自定义命令存储在 `.claude/commands/` 目录，支�?`$ARGUMENTS` �?`$1` `$2` 参数
- 保持简洁，避免敏感信息，作为持续实践而非一次性设�?

---

### 2026-05-01 #9 - Skills 创建指南

**来源**: `raw/claude/How to create Skills for Claude steps and examples.md`
**归档**: `archive/guides/skills-creation-2026-05-01.md`
**Wiki 页面**: `[[guides/skills-creation-guide]]`

**核心内容**:
- Skills 创建�?5 步流程（理解需求→编写名称→编写描述→编写指令→上传）
- 强描�?vs 弱描述示�?- 指令结构和最佳实�?- 测试和验证矩阵（正常操作、边缘情况、超出范围）
- 基于使用情况迭代
- 通用最佳实践（从用例开始、定义成功标准、使�?Skill-Creator skill�?- Skill 限制和考虑因素（触发机制、文件大小、渐进式披露�?
**三个真实示例**:
1. **DOCX 创建 skill**: 决策树工作流程、批处理策略、完整验证流�?2. **品牌指南 skill**: 精确颜色/字体、智能字体应用、循环强调色
3. **前端设计 skill**: 设计思维、美学指南、避免陈词滥�?
**技术要�?*:
- name �?description 是影响触发的唯一部分
- 使用小写和连字符命名（如 `pdf-editor`�?- 描述决定 skill 何时激活（最关键组件�?- 强描述要素：具体能力、清晰触发器、相关上下文、明确边�?- 指令结构：概述→前提条件→执行步骤→示例→错误处理→限制
- 测试三个场景：正常操作、边缘情况、超出范围请�?- "菜单"方法：SKILL.md 描述可用内容，使用相对路径引用单独文�?- Claude.ai、Claude Code、Developer Platform 三种上传方式

**常见问题**:
- 如何编写真正触发的描述（专注于能力和场景，而非通用关键词）
- Claude 如何决定调用哪些 skills（语义理解，非关键词匹配�?- 描述的正确粒度（单一用途，足够聚焦�?- 组织内共�?Skills（小团队、中大型团队、最佳实践）
- 如何调试 skills（分别测试触发和执行�?

---

### 2026-05-01 #10 - YC 创业公司 Claude Code 案例研究

**来源**: `raw/claude/How three YC startups built their companies with Claude Code.md`
**归档**: `archive/sources/yc-startups-claude-code-2026-05-01.md`
**Wiki 页面**: `[[sources/yc-startups-claude-code-case-studies]]`

**三个案例公司**:
1. **HumanLayer (F24)** - �?SQL agents 转向 AI-first 工程团队
   - 产品转型：提供人类反�?API/SDK
   - 发布�?2-Factor Agents》context engineering 指南
   - 构建 CodeLayer：扩展团�?AI 工作流程
   - 使用 worktree + 远程 cloud workers 并行运行

2. **Ambral (W25)** - 使用 subagents 构建生产系统
   - AI 驱动账户管理�?0-100 账户/经理�?   - 三阶段工作流程：研究(Opus 4.1) �?规划(Opus 4.1) �?实现(Sonnet 4.5)
   - 基于 Claude Agent SDK 构建研究引擎
   - 每种数据类型配备专用 sub-agent

3. **Vulcan Technologies (S25)** - 非技术创始人的政府监管解决方�?   - 两位非技术创始人 + 1 �?CTO
   - 4 个月获州/联邦政府合同 + $11M 种子�?   - 为弗吉尼亚州节省 $10 �?/年（房价降低 $24K�?   - 州长签署�?51 号行政命令强制使�?
**YC 创始人最佳实�?*:
1. **分离研究、规划、实�?* - 不同阶段使用独立 Claude Code 会话
2. **精心管理上下�?* - 避免 prompt 矛盾，定期开始新对话
3. **监控思维�?* - 早期中断错误方向（前几次工具调用�?
**核心洞察**:
- 传统障碍（技术专长、团队规模、开发时间）�?新优势（清晰思维、问题分解、AI 协作�?- Claude Code 民主化公司构建：非技术创始人可从第一天竞�?- 组织挑战 > 技术挑战：规模�?AI 工作流程需重新连接团队协作


---

## [2026-05-01] docs-ingest | frontend-design-skills 摄取完成

- **来源**: `raw/claude/Improving frontend design through Skills.md`
- **操作**: docs-ingest 技�?�?去重检�?�?创建 Wiki 页面 �?归档源文�?- **归档**: `archive/guides/frontend-design-skills-2026-05-01.md`
- **新增文件**:
  - `wiki/guides/frontend-design-skills.md` �?前端设计技能指�?- **核心内容**:
  - **分布收敛问题**: LLM 默认生成通用、无特色�?UI（Inter 字体 + 紫色渐变�?  - **Skills 解决方案**: 动态上下文加载，避免永久上下文开销
  - **前端美学技�?*: ~400 token 提示涵盖字体、颜色、运动、背�?  - **字体指南**: 避免通用字体（Inter/Roboto），选择独特字体（JetBrains Mono/Playfair Display�?  - **主题示例**: RPG 主题美学（奇幻色调、装饰边框、羊皮纸纹理�?  - **三个案例对比**: 
    - SaaS 登录页面（紫色渐�?�?独特字体 + 分层背景�?    - 博客布局（平面白�?�?编辑字体 + 大气深度�?    - 管理仪表板（最小视�?�?粗体字体 + 暗色主题�?  - **Claude.ai Artifacts**: web-artifacts-builder skill 使用 React/Tailwind/shadcn
  - **核心洞察**: Skills �?Claude 从通用助手转变为领域专�?- **关键引用**:
  - <frontend_aesthetics> 提示（lines 110-127�?  - <use_interesting_fonts> 字体指导
  - <always_use_rpg_theme> 主题示例
  - Web-artifacts-builder skill（claude.ai�?- **相关页面**:
  - [[concepts/agents-skills-paradigm]] �?Agent Skills 范式
  - [[guides/skills-creation-guide]] �?Skills 创建指南
  - [[sources/yc-startups-claude-code-case-studies]] �?YC 创业公司案例


---

## [2026-05-01] docs-ingest | 知乎文章参考材料归档完�?
- **来源**: `raw/zhihu/如何管理Claude Code 100w上下文？Anthropic官方推荐了五种使用指�?md`
- **操作**: docs-ingest 技�?�?去重检�?�?方案 A：参考材料归�?�?添加相关阅读链接
- **归档**: `archive/zhihu/claude-session-management-zhihu-2026-05-01.md`
- **更新文件**:
  - `wiki/guides/session-management-context-window.md` �?添加"相关阅读"部分
- **核心内容**:
  - **知乎解读文章**: Anthropic 官方博客的中文版本，包含实践案例和决策对�?  - **内容重叠**: 与现有官方技术文档高度重�?  - **处理方式**: 不创建新 Wiki 页面，作为参考材料归�?  - **参考价�?*: 中文表达、实践示例、决策表格便于理�?- **关键洞察**:
  - **Context rot 概念**: 上下文增长导致性能缓慢下降
  - **1M Context 机遇**: 更多腾挪空间，但管理决策更值钱
  - **五个操作对比**: Continue/Rewind/Clear/Compact/Subagents 的使用时�?  - **Rewind 价�?*: 双击 Esc 的不起眼操作，擦除错误记�?  - **autocompact 风险**: �?Claude 最不聪明的时候触发压�?  - **Subagents 判断标准**: 只需要结论还是需要中间输�?- **决策参考表**:
  | 场景 | 推荐工具 | 关键原因 |
  |------|----------|----------|
  | 上下文仍在起作用 | Continue | 避免重建上下文的代价 |
  | Claude 走错方向 | Rewind | 丢弃失败尝试，干净重启 |
  | 开始真正的新任�?| Clear | �?rot，完全控制上下文 |
  | 会话臃肿需要摘�?| Compact | 低成本有损压缩，可引�?|
  | 只需要最终结�?| Subagent | 隔离中间噪声 |
- **相关页面**:
  - [[guides/session-management-context-window]] �?官方技术文档（已添加相关阅读链接）
  - [[concepts/context-management]] �?上下文管理概�?

---

## [2026-05-01] docs-ingest | oh-my-claudecode 插件指南摄取完成

- **来源**: `raw/zhihu/oh-my-claudecode 完全解析 �?Claude Code 多智能体编排插件.md`
- **操作**: docs-ingest 技�?�?去重检�?�?创建 Wiki 页面 �?归档源文�?- **归档**: `archive/resources/tools/oh-my-claudecode-zhihu-2026-05-01.md`
- **新增文件**:
  - `wiki/resources/tools/oh-my-claudecode.md` �?oh-my-claudecode 完全解析
- **核心内容**:
  - **插件定位**: Claude Code 多智能体编排插件，从"单个助手"升级�?专业团队"
  - **核心痛点解决**: 自动任务拆分、专�?Agent 分配、并行执行（3-5 倍）、智能模型路由（�?30-50% token�?  - **五种执行模式**:
    | 模式 | 速度 | 适用场景 |
    |------|------|----------|
    | Autopilot | �?| 全自主工作流（给目标，自己规划、执行、验证） |
    | Ultrapilot | 3-5 倍快 | 多组件系统（最大化并行�?|
    | Ecomode | �?�?30-50% | 预算敏感项目（简单用 Haiku，复杂才�?Opus�?|
    | Swarm | 协同执行 | 并行独立任务（多 Agent 协同�?|
    | Pipeline | 顺序执行 | 多阶段处理（输出作为下阶段输入） |
  - **32 个专�?Agent**: 覆盖架构与研究、开发、测试、数据分析全流程
  - **魔法关键�?*: autopilot（全自主）、ralph（持久化）、ulw（最大化并行）、eco（省钱）、plan（规划访谈）
  - **智能模型路由**: Haiku（简单任务）vs Opus（复杂推理），自动选择节省成本
  - **实际应用场景**: 
    - 从零构建项目（全栈博客自动完�?5 个阶段）
    - 批量代码重构（并行处理所有组件）
    - 疑难问题调试（ralph 持久化直到解决）
  - **HUD 状态栏**: 实时可视化执行进�?  - **可组合使�?*: `ralph ulw: migrate database`（持久化 + 最大化并行�?- **关键引用**:
  - 多智能体编排概念（lines 36-37�?  - 五种执行模式对比表（lines 44-50�?  - 魔法关键词速查表（lines 102-109�?  - 使用场景示例（lines 120-155�?- **关键洞察**:
  - **核心价�?*: 显著提升复杂项目的开发效�?  - **成本优化**: 智能模型路由可节�?30-50% token 成本
  - **适用边界**: 复杂多步骤任务适合，简单任务原生更�?  - **安装方式**: `/plugin marketplace add` + `/plugin install`
  - **初始设置**: `/oh-my-claudecode:omc-setup`
- **相关页面**:
  - [[resources/tools/gstack]] �?虚拟工程团队工具�?  - [[guides/claude-code-parallel-development]] �?并行开发指�?  - [[concepts/multi-agent-orchestration]] �?多智能体编排概念

---

## [2026-05-01] docs-ingest | Superpowers 插件框架指南摄取完成

- **来源**: `raw/zhihu/用了 Superpowers，我�?Claude Code 返工少了九成.md`
- **操作**: docs-ingest 技�?�?去重检�?�?创建 Wiki 页面 �?归档源文�?- **归档**: `archive/resources/tools/superpowers-zhihu-2026-05-01.md`
- **新增文件**:
  - `wiki/resources/tools/superpowers.md` �?Superpowers 完全解析
- **核心内容**:
  - **插件定位**: Claude Code 工作方法论插件框架，14 �?Skills 覆盖开发全流程
  - **核心痛点解决**: 减少 90% 返工，从"6 次返工推倒重�?�?0 次返工一次完�?
  - **Plan Mode 局�?*: 规划有约束，执行无约�?�?Superpowers 全流程约�?  - **14 �?Skills 分四阶段**:
    - **🧠 规划阶段** (2 �?: brainstorming�?0-50% 时间节省）、writing-plans（文档化计划�?    - **⚙️ 执行阶段** (7 �?: 
      - executing-plans�?0%+ 返工减少，检查点确认�?      - subagent-driven-development�?0-75% 时间缩短，并�?agent�?      - test-driven-development（TDD 强制执行�?      - systematic-debugging�?0% 时间缩短，系统化排查�?      - using-git-worktrees（隔离环境，避免污染主分支）
      - dispatching-parallel-agents（大规模并行任务�?    - **�?质检阶段** (4 �?:
      - verification-before-completion（验证再宣布完成�?      - requesting-code-review（合并前系统性审查）
      - receiving-code-review（理解反馈再修改�?      - finishing-a-development-branch（完整收尾流程）
    - **🔧 工具�?* (2 �?: writing-skills（自定义 skill）、using-superpowers（元 skill 入口�?  - **时间代价与真实收�?*:
    | 场景 | 一次任�?| 返工次数 | 总时�?|
    |------|---------|---------|--------|
    | 以前 | 30 分钟 | 3 �?| 2 小时 |
    | 现在 | 90 分钟 | 0 �?| **90 分钟** |
  - **核心洞察**: "慢即是快" �?单次 4-5 倍时间，但总时间节�?  - **GitHub**: [github.com/obra/superpowers](https://github.com/obra/superpowers) �?137k+ stars, v5.0.7
  - **关键原则**: 不是�?AI 更聪明，而是�?AI 套上工作方法�?- **适用场景**:
  - �?多步骤复杂任务、容易返工的功能、系统�?bug 修复、多任务并行
  - �?简单一次性修改、快速实验、不确定方向的探�?- **实际案例**: 4 个并行调�?agent（Two-Phase/Map-Reduce/模板+AI/分层规划）→ 1/4 时间完成
- **相关页面**:
  - [[resources/tools/oh-my-claudecode]] �?多智能体编排插件对比
  - [[concepts/agents-skills-paradigm]] �?Agent Skills 范式
  - [[resources/tools/]] �?更多工具资源

## 2026-05-01 �?摄取: Hermes Agent 长期记忆增强教程

**来源**: archive/resources/tools/hermes-mem0-zhihu-2026-05-01.md
**Wiki 页面**: [[resources/tools/hermes-mem0-tutorial]]
**外部来源**: https://zhuanlan.zhihu.com/p/2031865910697408162

**内容概述**:
- **问题分析**: Hermes 内置记忆的两个核心缺陷（容量限制、信息污染）
- **工具对比**: 8 种外置记忆工具横向评测（专业�?+ 通俗版对照表�?- **选型决策**: Mem0 选择�?4 个理由（易用、自动提取、用户级记忆、免费套餐）
- **配置流程**: 7 步完整配置（注册 �?获取 API Key �?安装 �?激�?�?验证�?- **故障排查**: 4 个常见问题及解决方案

**关键洞察**:
- **内置记忆硬限�?*: MEMORY.md (2200 字符)、USER.md (1375 字符)
- **Mem0 免费套餐**: 个人日常使用绰绰有余
- **不冲突设�?*: Mem0 作为"增强�?叠加在原生记忆之�?- **配置验证命令**: `hermes memory status` 查看记忆走的是否�?mem0

**核心对比�?*:
| 工具 | 聪明程度 | 上手难度 | 适合 Hermes |
|------|----------|----------|-------------|
| Mem0 | ⭐⭐⭐⭐ | ⭐⭐ | �?很适合 |
| Hindsight | ⭐⭐⭐⭐�?| ⭐⭐⭐⭐ | �?适合（但重）|
| Holographic | ⭐⭐ | �?| �?适合 |

**摄取类型**: tutorial

## 2026-05-01 �?摄取: 统一管理�?Agent �?Skill �?
**来源**: archive/guides/skill-management-unified-zhihu-2026-05-01.md
**Wiki 页面**: [[guides/skill-management-unified]]
**外部来源**: https://zhuanlan.zhihu.com/p/2031871706676056547

**内容概述**:
- **核心问题**: �?Agent 工具 Skill 管理混乱（重复安装、版本分裂、管理困难）
- **解决方案**: 中央 Skill + 软链接实�?Single Source of Truth
- **三大收益**: 版本永远一致、管理有主场、新 Skill 自动归库
- **深度思�?*: Skill �?AI 时代的确定性资产，方法论沉淀不属于工�?- **操作教程**: 4 步手把手教学（创建中央文件夹 �?清理原有 �?创建软链�?�?处理其他 Agent�?
**关键洞察**:
- **软链接原�?*: "指路�?机制，改一处全部同步，实时穿透无延迟
- **系统设计原则**: Single Source of Truth �?副本越多，同步成本越�?- **Skill 本质**: 是你�?AI 协作�?SOP，不是简单的 Prompt 模板
- **价值独�?*: Skill 的价值曲线和 AI 进化轨道独立，AI 越强，方法论越有价�?
**软链接命令模�?*:
```bash
# 格式
ln -s SharedSkills完整路径 ~/.Agent路径/skills

# Claude Code
ln -s ~/Documents/SharedSkills ~/.claude/skills

# Cursor
ln -s ~/Documents/SharedSkills ~/.cursor/skills

# OpenClaw
ln -s ~/Documents/SharedSkills ~/.openclaw/skills
```

**支持�?Agent 工具**:
Claude Code、Cursor、OpenClaw、Codex、Trae、Open Code、Qoder

**摄取类型**: guide

## 2026-05-02 �?错误修正：Command 语法幻觉与监督机制建�?
**错误 ID**: ERR-001
**严重程度**: Critical
**错误类型**: 技术幻觉（Hallucination�?
**问题发现**:
- 用户发现 Command 教学使用了错误的 XML 标签语法
- 实际 Command 使用�?Markdown 自然语言，没有任�?XML 标签
- 错误内容：`<invoke name="Agent">`, `<parameter name="prompt">xxx</parameter>`
- 正确内容：自然语言描述 + 项目符号参数

**根因分析**:
- �?违反 Wiki-First 原则（没有先查询 wiki/index.md�?- �?没有读取项目中的真实示例�?claude/commands/weather-orchestrator.md�?- �?凭记�?训练数据回答，产生幻觉内�?- �?过度自信，没有验�?
**已采取措�?*:
1. �?删除错误文档：raw/notes/2026-05-02-command-complete-guide.md
2. �?创建正确文档：raw/notes/2026-05-02-command-correct-guide.md
3. �?更新学习进度：wiki/progress-commands.md（标注语法更正）
4. �?建立监督机制�?   - .claude/rules/teaching-accuracy.md �?强制检查清�?   - .claude/rules/verification-protocol.md �?三重验证协议
   - .claude/rules/real-time-monitor.md �?实时监控清单
   - .claude/rules/error-tracking.md �?错误追踪系统
   - .claude/errors/ERR-001-command-hallucination.md �?详细错误记录

**监督机制核心**:
1. **强制三重验证**�?   - Wiki 验证（必须）
   - 实际示例验证（必须）
   - 来源标注（必须）
2. **实时监控清单**：每次教学前 30 秒检�?3. **错误追踪系统**：记录→分析→改进→验证
4. **红灯停止机制**：任何验证不通过立即停止

**核心教训**:
- 准确�?> 速度�?0秒验�?> 10分钟错误修正�?- Wiki-First 不是建议，是强制规则
- 不确定时�?我不知道"比错误更专业
- 项目资源优先：先利用已有资料再回�?
**长期目标**:
- 建立零错误技术教学标�?- 100% 验证执行�?- 0 次严重技术错�?
**相关文件**:
- [[raw/notes/2026-05-02-command-correct-guide]] �?已修正的完整指南
- [[progress-commands]] �?学习进度（已标注错误更正�?- [.claude/rules/teaching-accuracy] �?强制检查清�?- [.claude/errors/ERR-001-command-hallucination] �?错误详细记录

---

## [2026-05-03] github-collect | NevaMind-AI/memU 收集完成

- **操作**: GitHub 仓库收集 �?元数据获�?�?归档 JSON �?创建 Wiki 页面 �?更新日志
- **仓库**: [NevaMind-AI/memU](https://github.com/NevaMind-AI/memU)
- **元数�?*:
  - Stars: 13,514 | Forks: 1,011 | Language: Python | License: Other
  - Description: "Memory for 24/7 proactive agents like OpenClaw."
  - Topics: agent-memory, mcp, claude, proactive, openclaw, skills, sandbox
- **新增文件**:
  - `archive/resources/github/nevamind-memu-2026-05-03.json` �?归档元数�?  - `wiki/resources/github-repos/nevamind-memu.md` �?Wiki 页面
- **核心内容**: memU 主动式记忆引�?�?三层分层记忆（Resource/Item/Category）、双模式检索（RAG/LLM）�?4/7 后台运行、意图捕获、Token 优化（~1/10 同类方案）。与本项目已�?memU MCP 服务器集成作为长期语义记忆层

---

## [2026-05-03] github-collect | thedotmack/claude-mem 重新收集完成（更新）

- **操作**: GitHub 仓库重新收集 �?元数据更�?�?归档 JSON �?更新 Wiki 页面 �?更新日志
- **仓库**: [thedotmack/claude-mem](https://github.com/thedotmack/claude-mem)
- **元数据变�?*（距上次收集 4 天）:
  - Stars: 69,320 �?**71,058** (+1,738) | Forks: 5,921 �?**6,091** (+170)
  - Issues: 35 �?38 | 版本: v12.4.8
  - Language: TypeScript | License: AGPL-3.0
- **更新文件**:
  - `archive/resources/github/thedotmack-claude-mem-2026-05-03.json` �?归档更新
  - `wiki/resources/github-repos/thedotmack-claude-mem.md` �?Wiki 页面更新
- **内容新增**:
  - MCP Search Tools 三层检索架构（search �?timeline �?get_observations�?0x token 节省�?  - Mode & Language 配置（CLAUDE_MEM_MODE 环境变量�?CMEM token�?  - Beta 功能（Endless Mode 无限上下文、Biomimetic Memory 仿生记忆�?  - OpenClaw Gateway 开放式工具网关
  - Windows 支持指南
  - 一键安装方式（`npx claude-mem install`�?  - 多平台支持（Claude Code + Gemini CLI + OpenCode�?
---

## [2026-05-04] docs-ingest | Agent Skills 渐进式披露与 MCP 对比分析

- **操作**: 文档摄取 �?分析 Bilibili 视频脚本 �?创建多页 Wiki 指南 �?归档源文�?- **源文�?*: `raw/Clippings/Bilibili/2026-05-04-Agent Skill 从使用到原理，一次讲�?md` (马克的技术工作坊, BV1cGigBQE6n)
- **创建内容**:
  - Agent Skills 渐进式披露机制：三层架构（元数据层、指令层、资源层�?  - Reference vs Script 核心差异：读取文件（消�?token）vs 执行脚本（几乎零 token�?  - Agent Skills vs MCP 系统性对比：数据供给 vs 行为定义
  - 决策框架：何时使�?MCP、何时使�?Skills、如何组合使�?  - Token 优化策略：渐进式披露节省 85-95% token
  - 真实案例：会议总结 + 财务合规 + 自动上传完整工作�?- **新增文件**:
  - `wiki/guides/agent-skills-progressive-disclosure.md` �?渐进式披露机制详�?  - `wiki/concepts/agent-skills-vs-mcp.md` �?MCP vs Skills 系统性对�?  - `archive/clippings/bilibili/2026-05-04-agent-skills.md` �?归档源文�?- **相关 Wiki**: 
  - [[concepts/harness-engineering]] �?AI 工程第三次演进（Harness Engineering�?  - [[concepts/agents-skills-paradigm]] �?Agent Skills 范式概述
  - [[guides/skills-creation-guide]] �?Skills 创建基础指南

---

## [2026-05-04] docs-ingest | �����?Agent Skills �̳�ϵ��������ȡ

- **����**: ϵͳ����ȡ�����?Agent Skills 10 �������̳�
- **Դ�ļ�**:  Ŀ¼��10 �� Bilibili ��Ƶ��Ļ�ļ���
- **��������**:
  - **�γ�����** (): 10 �ڿ�ϵͳ������ѧϰ·�������ĸ�����
  - **���ʵ��?* (): �����淶���ļ��ṹ����дԭ�򡢵�Ԫ����
  - **ƽ̨ʹ��** (): Claude AI/Code/API/SDK ��ƽ̨�Ա��뼯��
  - **ʵս����** (): 4 ������������Ӫ��������ʱ�����С���ϰ�����ɡ����ܴ�������
- **�鵵λ��**: ��ȫ�� 10 ��Դ�ļ���
- **��������**:
  - ����ʽ��¶���ƣ�3 �����? Ԫ���ݡ�ָ�����Դ��?  - ��ƽ̨����ֲ�ԣ�Claude AI/Code/API/SDK��
  - ���ܱ���ʵս��MCP ���ɡ��Ӵ���Э����������Ϲ�������?  - �����������淶�����������������ԡ�������
- **���?Wiki**: 
  - [[tutorials/agent-skills-progressive-disclosure]] - ����ʽ��¶�������?  - [[concepts/agent-skills-vs-mcp]] - ��̬��λ����߿��
  - [[guides/claude-hooks-configuration-guide]] - Hooks ϵͳ���ã�GateGuard ���ɣ�
- **����Ҫ��**:
  - GateGuard ��ʵǿ���ţ�4 ����ʵ��֤���ļ���ϵ���ظ���顢����?I/O���û�ָ�
  - YAML frontmatter �淶��name, description, type, tags, created, updated, source��
  - Obsidian-cli ���ɣ�property:set, search, create, append��
  - Wiki-First ԭ�����Ȳ� Wiki������þ���?- **Token �Ż�**: 
  - Դ�ļ�ȥ�أ������ظ�����
  - ģ�黯��֯��4 ��ר��ҳ�棬ÿҳ�۽��ض�����
  - ���ö��Ǹ��ƣ�ʹ�� wikilinks [[page]] ���������ظ�
- **��������**:
  - ������֤Э�飺Wiki ��֤ �� ʵ��ʾ����֤ �� �ٷ��ĵ���֤
  - ��ѧ׼ȷ�Լ���嵥�����/�Ƶ�/�̵�������
  - ʵʱ����嵥��?0 ������Լ�����?
---

## [2026-05-04] docs-ingest | 吴恩�?Agent Skills 教程系列完整摄取

- **操作**: 系统化摄取吴恩达 Agent Skills 10 节完整教�?- **源文�?*: raw/Clippings/Bilibili/Agent-Skills/ 目录�?0 �?Bilibili 视频字幕文件�?- **创建内容**:
  - 课程总览 (wiki/tutorials/agent-skills-andrew-ng-course.md): 10 节课系统概览
  - 最佳实�?(wiki/tutorials/agent-skills-best-practices.md): 命名规范、文件结构、测�?  - 平台使用 (wiki/tutorials/agent-skills-platform-usage.md): 四平台对比与集成
  - 实战案例 (wiki/tutorials/agent-skills-examples.md): 4 个完整案�?- **归档位置**: archive/clippings/bilibili/2026-05-04-agent-skills-course/
- **相关 Wiki**: 
  - [[tutorials/agent-skills-progressive-disclosure]]
  - [[concepts/agent-skills-vs-mcp]]
  - [[guides/claude-hooks-configuration-guide]]

---

## [2026-05-04] docs-ingest | MCP 终极指南教程系列创建

- **操作**: 文档摄取 �?分析 Bilibili 视频脚本 �?创建 Wiki 教程页面 �?归档源文�?�?更新实体页关�?- **源文�?*: `raw/Clippings/Bilibili/MCP终极指南/` (马克的技术工作坊, 3 个视�?
  - `2026-05-04-MCP终极指南基础�?md` (BV1uronYREWR, 27:03, 入门)
  - `2026-05-04-MCP终极指南进阶�?md` (BV1Y854zmEg9, 27:03, 进阶)
  - `2026-05-04-MCP终极指南番外篇：抓包分析 Cline 与模型的交互协议.md` (BV1v9V5zSEHA, 44:15, 专家)
- **创建内容**:
  - **基础�?*: MCP 概念、Cline 配置、第一次使用、uvx/npx 工具、常�?Server 列表
  - **进阶�?*: FastMCP 自定�?Server、协议分析（JSON-RPC 2.0）、调试工具（MCP Logger）、高级功能（Resources/Prompts/Async）、部署发�?  - **番外�?*: Cline 与模型交互协议深度分析、SSE (Server-Sent Events)、ReAct 模式、FastAPI 抓包实战、System Prompt 解构�?26 �?48K 字符）、Agent 实现原理、流式响应处理、并发工具调�?- **新增文件**:
  - `wiki/tutorials/mcp-basics.md` �?MCP 基础教程（入门级�?  - `wiki/tutorials/mcp-advanced.md` �?MCP 进阶教程（自定义 Server 开发）
  - `wiki/tutorials/mcp-protocol-analysis.md` �?MCP 协议深度分析（专家级抓包�?ReAct�?  - `archive/clippings/bilibili/2026-05-04-mcp-ultimate-guide/` �?源文件归�?- **更新文件**:
  - `wiki/entities/claude-mcp.md` �?添加教程关联链接（related 字段�?- **技术亮�?*:
  - FastMCP 装饰器语法简�?MCP Server 开�?  - JSON-RPC 2.0 协议格式与通信流程
  - SSE 长连接推送机制（data: 行格式）
  - ReAct = Reasoning + Acting 循环模式
  - System Prompt 规模�?2,000 tokens�?8,670 字符�?  - FastAPI 中间件拦截抓包实�?  - 完整 Agent 架构：Planner �?Executor �?Tools
- **相关 Wiki**: [[entities/claude-mcp]]（实体总览页）

---

## [2026-05-04] docs-ingest | Agentic AI 教程系列创建

- **操作**: 系统性摄�?Bilibili 视频脚本 �?分析 43 个视�?�?创建 Wiki 教程页面 �?归档源文�?- **源文�?*:  (吴恩�?Agentic AI 课程, BV1DfrdByE2H, 43 个视频脚�?
- **创建内容**:
  - **教程主页** (wiki/tutorials/agentic-ai-course.md): 43 节课完整系统概览
  - **四大模块**: 设计模式基础、工具集成、评估方法、多智能体系�?  - **核心概念**: 反射模式、工具使用、规划模式、多智能体协�?  - **Google ADK 实现**: Agent 定义、工具模式、状态管�?  - **知识图谱构建**: Neo4j 集成、实体解析、文本分�?- **归档位置**: archive/clippings/bilibili/2026-05-04-llm-agent-course/ (43 个文�?
- **相关 Wiki**: 
  - [[agent-skills-andrew-ng-course]] (吴恩�?Agent Skills 课程)
  - [[entities/claude-mcp]] (MCP 协议参�?
## [2026-05-04] docs-ingest | Agentic AI 教程系列创建- **操作**: 系统性摄�?Bilibili 视频脚本 �?分析 43 个视�?�?创建 Wiki 教程页面 �?归档源文�? **源文�?*:  (吴恩�?Agentic AI 课程, BV1DfrdByE2H, 43 个视频脚�?- **创建内容**:  - **教程主页** (wiki/tutorials/agentic-ai-course.md): 43 节课完整系统概览  - **四大模块**: 设计模式基础、工具集成、评估方法、多智能体系�? - **核心概念**: 反射模式、工具使用、规划模式、多智能体协�? - **Google ADK 实现**: Agent 定义、工具模式、状态管�? - **知识图谱构建**: Neo4j 集成、实体解析、文本分�? **归档位置**: archive/clippings/bilibili/2026-05-04-llm-agent-course/ (43 个文�?- **相关 Wiki**: [[agent-skills-andrew-ng-course]] (吴恩�?Agent Skills 课程), [[entities/claude-mcp]] (MCP 协议参�?---
---

## [2026-05-04] docs-ingest | A2A 协议教程创建

- **操作**: 文档摄取 → 分析 Bilibili 视频脚本 → 创建 Wiki 教程页面 → 归档源文件
- **源文件**: `raw/Clippings/Bilibili/` (马克的技术工作坊, 2 个视频)
  - `2026-05-04-A2A协议深度解析 - 第 1 部分：双Agent同步调用场景.md` (BV1GC7hzKEX9, 35:43, 同步调用)
  - `2026-05-04-A2A协议深度解析 - 第 2 部分：流式返回 + 多Agent场景.md` (BV1dRTRzUED3, 17:16, 流式+多Agent)
- **创建内容**:
  - A2A 协议概念定义与适用场景（Agent 间通信 vs MCP 工具调用）
  - 五大核心结构：Agent Card、Task、Artifact、Part、Message
  - 同步调用模式（messages_send）完整 JSON-RPC 请求/响应
  - 流式返回模式（messages_stream）5 条消息序列模式
  - 双阶段运行流程（注册 + 问答）与多 Agent 协作（调度 Agent + 专业 Agent）
  - 技术栈与环境配置（Python/UV、Google AI Studio、Wireshark）
- **新增文件**:
  - `wiki/tutorials/a2a-protocol-guide.md` → A2A 协议教程页面
  - `archive/clippings/bilibili/2026-05-04-a2a-protocol/` → 源文件归档
- **相关 Wiki**: [[tutorials/a2a-protocol-guide]]（教程主页）、[[tutorials/agent-concepts-principles-patterns]]（Agent 概念）


- 2026-05-04 | [[guides/process-compliance]] | 创建 | 项目流程遵守规范 — 违规教训与预防机制 | 反思录，基于 raw/notes/2026-05-04-process-compliance-reflection.md

- 2026-05-04 | [[guides/process-compliance]] | 修复 | Chinese encoding workaround via PowerShell WriteAllText, 完整 frontmatter 设置, 记录 ERR-002 到 error-tracking.md- 2026-05-04: 批量摄取 raw/ 目录下的 5 个文档到 Wiki
