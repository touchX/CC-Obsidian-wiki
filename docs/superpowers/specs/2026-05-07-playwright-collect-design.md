# Playwright-Collect Skill 设计规范

> **版本**：v1.0.0
> **日期**：2026-05-07
> **状态**：设计完成，待实现

---

## 1. 概述与目标

### 核心目标

使用 playwright-cli 解决防爬网站的文章搜集问题，通过登录状态持久化实现无头模式抓取。

### 核心价值

- 将防爬网站的"人工登录"变成一次性操作
- 登录状态可复用，无需每次输入验证码
- 输出标准化 Markdown，兼容 Wiki Ingest 流程

### Scope 边界

| 包含 | 不包含 |
|------|--------|
| 登录引导 | 文章内容深度解析（依赖 Adapter） |
| 状态管理 | Wiki 页面创建（由下游处理） |
| 文章抓取 | 多平台同步发布 |
| Markdown 输出 | 内容翻译或转换 |

### 适用场景

- 知乎、微信公众号等强反爬平台
- 需要登录才能访问的付费/私有内容
- 定期增量抓取（状态未过期时）

---

## 2. 架构设计

### 整体架构

```
┌─────────────────────────────────────────────────────────┐
│                    playwright-collect                     │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  ┌──────────────┐    ┌──────────────┐    ┌───────────┐ │
│  │   Login      │───▶│   Collect    │───▶│   Status  │ │
│  │   Command    │    │   Command    │    │   Command │ │
│  └──────┬───────┘    └──────┬───────┘    └─────┬─────┘ │
│         │                    │                   │       │
│         ▼                    ▼                   ▼       │
│  ┌─────────────────────────────────────────────────┐    │
│  │              Session Manager                      │    │
│  │  · 状态加载/保存   · 会话验证   · 多网站隔离    │    │
│  └──────────────────────┬──────────────────────────┘    │
│                        │                                 │
│         ┌──────────────┼──────────────┐                 │
│         ▼              ▼              ▼                 │
│  ┌──────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │  Zhihu   │  │  WeChat Pub  │  │  Custom      │     │
│  │  Adapter │  │  Adapter     │  │  Adapter     │     │
│  └──────────┘  └──────────────┘  └──────────────┘     │
│                                                          │
│  ┌──────────────────────────────────────────────────┐   │
│  │           Markdown Formatter                       │   │
│  │  · Frontmatter   · 内容清洗   · 媒体处理         │   │
│  └──────────────────────────────────────────────────┘   │
│                                                          │
│  ┌──────────────────────────────────────────────────┐   │
│  │           Output: raw/{site}/{slug}.md            │   │
│  └──────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────┘
```

### 组件职责

| 组件 | 职责 |
|------|------|
| **Login Command** | 有头模式引导登录，调用 playwright-cli 保存状态 |
| **Collect Command** | 无头模式加载状态，抓取并解析文章 |
| **Status Command** | 检查当前登录状态有效性 |
| **Session Manager** | 状态文件读写、网站隔离、过期检测 |
| **Site Adapter** | 各网站专用解析逻辑（CSS Selector 配置） |
| **Markdown Formatter** | 统一输出格式，Frontmatter 生成 |

### 配置文件结构

```
~/.playwright-collect/
├── config.yaml              # 全局配置（输出目录等）
├── zhihu/
│   ├── state.json          # 登录状态（playwright-cli state-save）
│   ├── cookies.json        # 额外 Cookies（可选）
│   └── selector.yaml       # 自定义选择器（覆盖默认）
├── wechat/
│   └── ...
└── custom/
    └── ...
```

### Adapter 查找顺序

1. 用户在 `~/.playwright-collect/{site}/selector.yaml` 的自定义配置
2. 内置默认 Adapter 配置

---

## 3. 命令接口

### 命令列表

```bash
# 登录引导
playwright-collect login <site>

# 状态检查
playwright-collect status <site>

# 文章收集
playwright-collect collect <site> --url <url> --count <n>

# 自定义适配器
playwright-collect collect <site> --url <url> --adapter <path/to/config.yaml>
```

### 参数说明

| 参数 | 说明 | 默认值 |
|------|------|--------|
| `site` | 网站标识（zhihu, wechat 等） | 必填 |
| `--url` | 文章列表页 URL | 必填 |
| `--count` | 抓取文章数量 | 10 |
| `--adapter` | 自定义适配器配置路径 | 使用内置 |
| `--output` | 输出目录 | `raw/{site}` |
| `--force` | 强制重新登录 | false |

---

## 4. 数据流

### Login 流程

```
用户执行 login zhihu
  → playwright-cli open --persistent --browser=chrome (有头模式)
  → 用户在浏览器中完成登录（可能遇到验证码）
  → 用户确认登录成功
  → playwright-cli state-save ~/.playwright-collect/zhihu/state.json
  → 显示登录成功提示
```

### Collect 流程

```
用户执行 collect zhihu --url <文章URL> --count 10
  → 检测 ~/.playwright-collect/zhihu/state.json 是否存在
  → playwright-cli state-load ~/.playwright-collect/zhihu/state.json
  → playwright-cli goto <文章URL> (无头模式)
  → 验证登录状态是否有效
  → Site Adapter 解析页面
  → Markdown Formatter 生成内容
  → 保存到 raw/zhihu/{slug}.md
  → 循环直到完成 --count 篇
```

---

## 5. 输出格式

### Markdown 文件格式

```markdown
---
name: zhihu-article-slug
description: 文章标题摘要
type: source
tags: [zhihu, article]
source: ../../archive/zhihu/articles/slug.md
created: 2026-05-07
updated: 2026-05-07
author: 作者名
published: 2026-05-01
url: https://www.zhihu.com/p/xxx
---

# 文章标题

> 作者：xxx | 发布时间：2026-05-01 | 阅读：1234

文章正文内容...

---

*来源：知乎 | 采集时间：2026-05-07*
```

### Frontmatter 字段

| 字段 | 说明 |
|------|------|
| `name` | 文章 slug（由标题生成） |
| `description` | 文章标题摘要 |
| `type` | 固定为 `source` |
| `tags` | 网站标签 + article |
| `source` | 归档路径 |
| `author` | 作者名 |
| `published` | 发布时间 |
| `url` | 原始文章链接 |

---

## 6. 内置适配器

### Zhihu 适配器

```yaml
site: zhihu
name: 知乎

selectors:
  article-list: ".List-item"
  article-link: "a[data-za-attr='title']"
  article-title: "h2.ContentItem-title"
  article-content: ".RichText.Article-content"
  article-author: ".AuthorInfo-name"
  article-date: ".ContentItem-time"
  article-stats: ".ArticleMeta--props"

pagination:
  type: infinite-scroll
  max-articles: 100

output:
  directory: "raw/zhihu"
  filename-template: "{{slug}}"
```

### WeChat 适配器（预留）

```yaml
site: wechat
name: 微信公众号

selectors:
  article-list: ".weui-article__list li"
  article-title: ".article-title"
  article-content: "#js_content"
  article-author: ".account_nickname"
  article-date: ".article-time"

pagination:
  type: load-more
  max-articles: 50
```

### 自定义适配器扩展

用户可在 `~/.playwright-collect/{site}/selector.yaml` 覆盖任意选择器：

```yaml
selectors:
  article-title: ".my-custom-title-selector"
```

---

## 7. 错误处理

### 错误场景与策略

| 错误场景 | 处理方式 |
|----------|----------|
| 状态文件不存在 | 提示用户先执行 `login` 命令 |
| 登录状态过期 | 提示重新登录，可加 `--force` 强制重新登录 |
| 页面加载超时 | 重试 3 次，间隔 5 秒 |
| 解析失败 | 跳过该文章，记录到 error.log，继续下一篇 |
| 被反爬检测 | 自动切换到有头模式（需用户确认） |

---

## 8. 目录结构

```
playwright-collect/
├── SKILL.md                    # Skill 定义文档
├── scripts/
│   ├── login.sh               # 登录引导脚本
│   ├── collect.sh             # 收集主脚本
│   ├── status.sh              # 状态检查脚本
│   └── common.sh              # 公共函数
├── adapters/
│   ├── zhihu.yaml             # 内置适配器
│   └── wechat.yaml
├── lib/
│   ├── session-manager.sh     # 会话管理
│   ├── markdown-formatter.sh  # Markdown 生成
│   └── selector-parser.sh     # 配置解析
└── config/
    └── config.yaml            # 默认配置
```

---

## 9. 技术实现要点

### 状态持久化实现

```bash
# 登录时保存状态
playwright-cli open --persistent https://www.zhihu.com
# 用户完成登录后
playwright-cli state-save ~/.playwright-collect/zhihu/state.json

# 收集时加载状态
playwright-cli state-load ~/.playwright-collect/zhihu/state.json
```

### 登录状态验证

```bash
# 加载状态后访问一个需要登录的 API 或页面
playwright-cli goto https://www.zhihu.com/api/v4/members/current_user
# 检查返回内容是否包含登录态标识
```

### 标题 slug 生成

```bash
# 将中文标题转为合法文件名
slug=$(echo "$title" | iconv -f utf-8 -t ascii//TRANSLIT | sed 's/[^a-zA-Z0-9]/-/g' | tr -s '-' | tr 'A-Z' 'a-z')
```

### 无限滚动处理（知乎）

```bash
# 通过执行 JS 滚动页面
playwright-cli evaluate "window.scrollTo(0, document.body.scrollHeight)"
playwright-cli wait-for 2
```

---

## 10. 实现优先级

| 阶段 | 内容 | 优先级 |
|------|------|--------|
| P0 | 基础架构 + Login 命令 + Session Manager | P0 |
| P1 | Collect 命令 + Zhihu 适配器 | P1 |
| P2 | Status 命令 + 错误处理 | P2 |
| P3 | 自定义适配器支持 + WeChat 适配器 | P3 |
