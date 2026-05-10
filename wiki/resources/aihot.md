---
name: aihot
description: AIHOT — AI 热点监控网站，Agent 接入、RSS、API 三种方式
type: source
tags: [aihot, ai-news, agent, skill, rss, api, monitoring, 知识卡片]
created: 2026-05-08
updated: 2026-05-08
source: ../../archive/zhihu/装了这个AI热点Skill之后，你再也不需要自己去刷AI新闻了。.md
external_url: https://zhuanlan.zhihu.com/p/2036057281629003792
---

# AIHOT：AI 热点监控网站

## 原始文档

> [!info] 来源
> - 知乎专栏：[装了这个 AI 热点 Skill 之后](https://zhuanlan.zhihu.com/p/2036057281629003792)
> - 作者：virxact
> - 归档副本：[[../../archive/zhihu/装了这个AI热点Skill之后，你再也不需要自己去刷AI新闻了。.md|本地归档]]

---

## 概述

AIHOT 是一个 AI 热点监控网站，从数百个信源中抓取、筛选、去重、打分、分类 AI 相关资讯。

**访问数据**：
- 首日访问用户：突破 10 万 UV
- 浏览 PV：超过 60 万
- 用户反馈：无差评、无 BUG

**官网地址**：[aihot.virxact.com](https://aihot.virxact.com)

## Agent 接入方式

AIHOT 提供三种接入方式，分别对应不同需求：

### 1. AIHOT Skill（推荐给 Agent 用户）

**作用**：让 Agent 直接读取 AIHOT 网站数据，嵌入到工作流中。

**安装方式一（直接安装）**：
```
帮我安装这个 skill：https://aihot.virxact.com/aihot-skill/
```

**安装方式二（GitHub 源）**：
```bash
# GitHub: KKKKhazix/khazix-skills
```

**适用工具**：Claude Code、Codex、OpenCode、OpenClaw、Hermers 等支持 Skill 协议的 Agent。

### 2. RSS Feed（推荐给 RSS 用户）

适合习惯使用 Feedly、Inoreader、NetNewsWire 等 RSS 阅读器的用户。

**可用 Feed**：
- 精选动态
- 全部 AI 动态
- AI 日报

Feed 地址在 Agent 接入页面可一键复制。

### 3. API（推荐给系统集成用户）

适合想集成到内部系统或其他工具的开发者。

**提供**：
- 完整的 OpenAPI 规范文档
- 结构化数据接口

## AIHOT Skill 四大能力

### 能力 1：AI 日报

**更新时间**：每天北京时间早上 8 点

**内容结构**（五个版块）：
- 模型发布/更新
- 产品发布/更新
- 行业动态
- 论文研究
- 技巧与观点

**每条包含**：
- 中文标题
- 一句话摘要
- 信息来源
- 原文链接

**使用方式**：
```
"给我一份今天的AI日报"
"看一下5月6号的AI日报"
"总结一下最近三天的AI日报"
```

**时间效率**：30 秒掌握昨天整个 AI 行业动态。

### 能力 2：精选模式

**特点**：
- 从所有信息中挑选值得关注的内容
- 以原始时间流呈现（像 Feed）
- 默认模式（不明确指定时使用）

**适用场景**：
- 不想漏掉任何高质量条目
- 想要更全面的信息流

### 能力 3：按时间窗口或分类查询

**支持操作**：
- 查看某一方向的全部动态
- 指定时间范围（最长支持 7 天）
- 五大分类筛选

**示例**：
```
"看看全部消息，列出所有的新模型发布"
"看看最近3天所有的AI产品发布"
"过去24小时AI行业有啥大新闻"
```

**时间窗口限制**：最长 7 天（保护服务器性能）。

### 能力 4：按关键词查询

**支持功能**：
- 基本搜索功能
- 产品更新查询
- 模型发布查询

**示例**：
```
"最近XXX产品更新了哪些新功能"
"OpenAI发布了哪些新模型"
```

## Skill vs 无 Skill 对比

### 有 Skill 的情况
- ✅ 信息详细且全面
- ✅ 实时抓取（凌晨发布也能抓到）
- ✅ 包含源地址，可随意跳转

### 无 Skill 的情况
- ⚠️ 信息可能奇怪和缺失
- ⚠️ 实时性较差

## 输出格式

AIHOT Skill 提供最基础的 Markdown 格式，用户可根据需求：
- 自定义输出格式
- 嵌入到自己的工作流
- 后续优化处理

## 设计理念

**目标**：让 Agent 多了一双眼睛，帮用户盯着整个 AI 行业的新闻。

**希望**：AIHOT 能对大家真的有一点点帮助，给互联网留下一点点自己的印记。

## 相关资源

- **官网**：[aihot.virxact.com](https://aihot.virxact.com)
- **GitHub**：[KKKKhazix/khazix-skills](https://github.com/KKKKhazix/khazix-skills)
- **Agent 接入页面**：官网左侧菜单

---

*文档创建于 2026-05-08*
*来源：知乎专栏 - virxact*
*主题：AI 热点监控*
