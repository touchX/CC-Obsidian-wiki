---
claude.skills.essential.list
name: claude-skills-essential-list
description: Claude Code 必装 Skills 推荐清单（新手5个+进阶5个）
type: guide
tags: [claude-code, skills, productivity]
created: 2026-05-02
updated: 2026-05-02
source: ../../archive/zhihu/claude-skills-essential-list-2026-05-02.md
---

# Claude Skills 必装清单

## 挑 skill 的三条硬线

**第一条：一周用得到三次以上。**

skill 的描述会被注入每一轮对话的 system prompt，不管你这轮用没用它。所以一个 skill 占的不是磁盘，是 Claude 的注意力。一周内用不到三次的，不装。

**第二条：没它，prompt 写起来真的会累。**

有些 skill 装不装无所谓——你用一段 5 行的 prompt 就能搞定的事，没必要为它专门挂个 skill。但有些不一样，比如让 Claude 处理一份带表格、图片、批注的 docx 文件，没装 docx skill 的话，你得跟它解释半天。

**第三条：描述精准，不会乱触发。**

好的 skill 描述会清晰说明触发场景。装之前先看 SKILL.md 的 description 字段，那一行决定了它会不会污染你的 context。

## 新手必装 5 个

这五个的共同特点：通用、低门槛、装上立刻有用。

### 1. skill-creator — 你造 skill 的入口

让 Claude 帮你造 skill。给你一个交互式访谈，问你"你最常做的重复工作是什么""理想中的输出长什么样"，谈完直接生成 SKILL.md 文件给你。

当你发现自己在反复跟 Claude 解释同一段 prompt，就该把它沉淀成 skill 了。skill-creator 是这条路的起点。

### 2. pdf — 处理 PDF 几乎是刚需

读 PDF、写 PDF、合并、拆分、加水印、提取表格、填表单、OCR——所有跟 PDF 相关的操作。

PDF 是工作里出现频率仅次于聊天截图的文件类型。合同、研究报告、产品手册、银行账单——什么都是 PDF。

### 3. docx — 读写 Word 的最佳方案

处理 .docx 文件。包括复杂格式（表格、批注、tracked changes）、图片插入替换、查找替换、按模板生成报告。

办公场景里 Word 文档绕不开。给老板写月度报告、给客户改合同、整理面试反馈——很多人现在还在习惯让 Claude 输出文本然后自己去 Word 里粘贴格式，装了 docx 这一步彻底省了。

### 4. canvas-design — 做封面图、海报、排版

基于设计原则生成 .png 和 .pdf 视觉作品。海报、信息图、封面图、说明卡片都行。

自媒体和创作者的痛点之一是出图。Midjourney 出来的太"AI 味"，自己开 PS 太慢。canvas-design 走的是"设计原则 + 代码生成"路线。

### 5. xlsx 或 pptx（二选一，看你的工作侧重）

分别处理 Excel 和 PowerPoint。功能基本对应 docx 在 Word 上的能力——读、写、改、导出、生成图表。

**判断方法**：打开你最近 30 天的工作文件，xlsx 多还是 pptx 多，装那个。两个都装会让你的 skill 空间塞满"以备不时之需"，违反第一条硬线。

## 进阶推荐 5 个

这五个不是必需，但如果你已经把上面五个用熟了，这五个会让你的 Claude 进入"我替你干完整条工作流"的形态。

### 1. NanoBanana-PPT-Skills — pptx 不够看的时候

op7418（歸藏）开源的 PPT skill。GitHub 上 2.1K star，走的是"杂志风格 / 横滑 / WebGL 流体背景 / 单文件 HTML 输出"路线，更偏内容展示和发布会风格。

官方 pptx 给你的是"传统 PPT 文件"，能在 PowerPoint 里继续编辑。但当你要做的是分享到朋友圈的精美单页、发布会式的横滑展示、或者带动效的网页 PPT——官方那套就力不从心了。

### 2. mcp-builder — 开发者的能力外挂

教 Claude 怎么写 MCP server。MCP 是让 Claude 连接外部 API 的标准协议。

当你发现没有现成的 MCP 能连你公司内部的某个系统（CRM、报销系统、自研 API），mcp-builder 让你自己造一个。这是从"用别人的工具"到"造自己的工具"的分水岭。

### 3. web-artifacts-builder — 做交互页面/小工具

构建复杂的 React + Tailwind + shadcn/ui 页面。和官方那个能做单文件 HTML 的不一样，这个支持多组件、状态管理、路由——基本是个"前端项目生成器"。

你给团队做个内部小工具（数据看板、表单收集、计算器），以前要写好几天前端代码。现在一句话描述，它给你一个能跑的交互式工具。

### 4. code-review（NeoLabHQ）— 多角色 PR 审查

把 PR 审查拆成三个角色（bug-hunter / security / quality），分别用不同 prompt 审，最后综合输出。

单线程的"帮我 review 一下这段代码"经常漏东西。这个 skill 用 multi-agent 思路把审查粒度拆细——一个角色专门挑 bug，一个角色专门挑安全问题，一个角色专门看代码风格——比一个人粗糙地从头看到尾要稳。

### 5. last30days-skill — 选题灵感和热点追踪

抓 Reddit / X / YouTube / Hacker News 过去 30 天的热门内容，按主题聚合。

内容创作者最大的成本不是写，是选题。这个 skill 让你随时能问"过去 30 天 AI 编程领域最热的话题是什么""设计师圈最近吵什么"。

## 这几类我劝你别装

**第一类：描述写得特别宽的"通用助手"型 skill。**

名字叫"super-writer"或"all-in-one-helper"这种，描述里一堆"擅长任何文档/任何写作/任何任务"。几乎一定会和你别的 skill 打架，污染 context。

**第二类：你每月用不到一次的"行业特化"skill。**

装之前你觉得"以后说不定用得上"，但 skill 不是收藏品。它躺着也在吃 token。等你真用得上的那天再装回来，最多多花 5 分钟。

**第三类：和官方 skill 高度重叠的"功能仿制"型 skill。**

社区里有很多自己做的 docx / pdf / xlsx 仿制品，包装得花里胡哨。但坦率说，Anthropic 官方那一套已经覆盖 90% 的场景。

**第四类：超过 30 天没被触发过的 skill。**

每个月翻一次 `~/.claude/skills/`，看哪些 SKILL.md 文件的访问时间是上个月的——卸掉。装回来的成本是 0，留着的成本是每天在背景吃你的 token。

## 最后一句话

挑 skill 这事，本质上不是"装哪些"，是"为你的工作流配一台专用工作站"。

桌上摆什么工具，决定了你能高效干什么活。把工作站塞满工具的人不见得效率高，反而是只留高频核心、其他用到再拿的人，速度最稳。

**打开你的 ~/.claude/skills/ 目录，把上个月没访问过的全部移出去（不删，只移到一个 archive 文件夹）。下个月你会感谢自己。**