---
name: KKKKhazix-khazix-skills
description: 数字生命卡兹克开源的 AI Skills 合集 - 4 个实用 Skills + 1 个 Prompt
type: source
tags: [github, python, skills, claude-code, ai-agent, prompts, zhihu]
created: 2026-05-08
updated: 2026-05-08
source: ../../../archive/resources/github/KKKKhazix-khazix-skills-2026-05-08.json
stars: 8680
language: Python
license: MIT
github_url: https://github.com/KKKKhazix/khazix-skills
---

# Khazix Skills

> [!tip] Repository Overview
> ⭐ **8,680 Stars** | 🔥 **数字生命卡兹克开源的 AI Skills 合集**

我自己每天在用的一些 AI 技能和 Prompt，都开源在这里。没什么花活，就是几个挺实用的东西。

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [KKKKhazix/khazix-skills](https://github.com/KKKKhazix/khazix-skills) |
| **Stars** | ⭐ 8,680 |
| **Forks** | 1,267 |
| **语言** | Python |
| **许可证** | MIT |
| **作者** | 数字生命卡兹克 |
| **创建时间** | 2026-04-06 |
| **更新时间** | 2026-05-08 |

## 项目介绍

数字生命卡兹克（公众号「数字生命卡兹克」、虚实传媒创始人）开源的 AI Skills 合集。

**两种使用方式**：
- **Skills** — Agent 能直接加载的结构化指令集，遵循 Agent Skills 开放标准
- **Prompts** — 一段提示词，复制粘贴到 ChatGPT / Claude / Gemini 任何对话里就能用

**支持平台**：
Claude Code、Codex、OpenCode、OpenClaw 等

## Skills 清单

| 名字 | 类型 | 一句话 |
|------|------|--------|
| 🧹 **neat-freak（洁癖）** | 文档整理 | 干完活跑 `/neat`，自动对齐文档、CLAUDE.md、Agent 记忆 |
| 🔭 **hv-analysis（横纵分析法）** | 研究分析 | 想搞懂产品/公司/概念，丢给它，给你万字 PDF 研究报告 |
| ✍️ **khazix-writer（卡兹克写作）** | 写作风格 | 装上后，Agent 用作者口吻写公众号长文 |
| 🔥 **aihot（AI HOT 资讯查询）** | 资讯获取 | 一句话拿到每日 AI HOT 日报，无需 API Key |

### 🧹 neat-freak（洁癖）

> *"每次任务做完要退出窗口的时候，如果不跑一遍 /neat，我就浑身难受，如坐针毡如芒刺背如鲠在喉。"*

**功能**：每次在 Agent 里干完一件事，跑一下 `/neat`，它会把你这次会话改的东西，跟项目里的文档、CLAUDE.md / AGENTS.md、Agent 记忆全部对齐一遍，最后给你一份变更摘要。

**动哪三层东西**：
- 项目根的 CLAUDE.md / AGENTS.md（给当前 AI 看的）
- 项目的 docs/ 和 README（给同事和其他人看的）
- Agent 自己的记忆系统（给跨会话的自己看的）

**触发方式**：
```
/neat            # 直接命令
整理一下          # 自然语言
同步一下          # 自然语言
sync up          # English
```

### 🔭 hv-analysis（横纵分析法）

> *"纵向追时间深度，横向追同期广度，最终交汇出判断。"*

**功能**：想搞懂一个产品 / 公司 / 概念 / 人物到底是怎么回事，丢给它就行。它会同时跑两条线，最后给你一份排版精美的 PDF 研究报告，10,000–30,000 字。

**适合**：
- 调研竞品 / 调研一个新概念 / 调研一个公司
- 写作前期需要系统性的素材准备
- 对一个领域想从零搞懂

**不适合**：
- 单纯查个名词解释 — 那种问题用普通对话就行
- 写公众号文章 — 那个用 khazix-writer

### ✍️ khazix-writer（卡兹克写作）

> *"有见识的普通人在认真聊一件打动他的事。"*

**功能**：作者写公众号的那套写作 skill。装上之后，Agent 写出来的东西就是作者的口吻、节奏、禁忌词全在里面。

**它会做什么**：
- 完整的写作风格规则（节奏、叙事、判断、修辞）
- 四层自检体系（结构、节奏、内容、文字）
- 一套风格示例库

**会拒绝写**：
- 「赋能、抓手、闭环」
- 「首先...其次」
- 「在当今 AI 快速发展的时代」
- 「说白了 / 本质上 / 换句话说」

### 🔥 aihot（AI HOT 资讯查询）

> *"AI 圈一天发太多东西，等我反应过来已经过气了——干脆让 Agent 帮我每天扫一遍。"*

**功能**：让 Agent 用最自然的中文一句话拿到 aihot.virxact.com 每天的 AI HOT 日报和全部 AI 动态。无需 API Key、无需配 MCP server。

**它能做什么**：
- 拉今日 / 指定日期的 AI HOT 日报
- 拉精选条目流（每日精编候选池）
- 按分类拉条目（模型 / 产品 / 行业 / 论文 / 技巧）
- 按时间窗口拉（最近 N 天）
- 关键词 / 公司 / 主题搜索

**触发方式**：
```
今天 AI 圈有什么新东西
看一下 5 月 6 号的 AI 日报
最近一周的 AI 论文
看下精选条目
最近 OpenAI 有什么发布
```

**🇨🇳 国内直链**：
```bash
curl -fsSL https://aihot.virxact.com/aihot-skill/install.sh | bash
```

## Prompts 清单

| 名字 | 类型 | 一句话 |
|------|------|--------|
| 🔭 **横纵分析法（Prompt 版）** | 轻量版 | 上面 Skill 的 Prompt 版，复制粘贴到任何 Deep Research 模型里就能跑 |

**横纵分析法（Prompt 版）**是 hv-analysis Skill 的轻量版 — 一段 prompt，复制粘贴到任何支持 Deep Research 的模型里就能跑（ChatGPT Deep Research、Gemini Deep Research、Grok Deep Search、Claude Research 都行）。

## 安装方式

在 Claude Code、Codex、OpenClaw 等支持 Skill 的 Agent 里，直接说：

```
帮我安装这个 skill：https://github.com/KKKKhazix/khazix-skills/tree/main/<skill-name>
```

把 `<skill-name>` 换成你想装的那个，比如 `neat-freak`、`hv-analysis`、`khazix-writer`。Agent 会自己 clone 到对应目录。

## 相关链接

- [GitHub 仓库](https://github.com/KKKKhazix/khazix-skills)
- [公众号「数字生命卡兹克」](https://mp.weixin.qq.com/mp/profile_ext?action=home&__biz=MzI1MzY2NDY0NA==)
- [aihot.virxact.com](https://aihot.virxact.com)
- [ClawHub](https://clawhub.ai)
- [Tessl](https://tessl.io/registry/khazix-skills)

