---
name: cathrynlavery-diagram-design
description: A Claude Code skill for creating editorial-quality technical diagrams as standalone HTML files with inline SVG. 13 diagram types with brand-matching.
type: source
version: 1.0
tags: [github, svg, diagram-design, claude-code, claude-skills]
created: 2026-04-28
updated: 2026-04-28
source: ../../../../archive/resources/github/cathrynlavery-diagram-design-2026-04-28.json
stars: 2007
forks: 0
language: HTML
license: MIT
github_url: https://github.com/cathrynlavery/diagram-design
platforms: [Claude Code]
author: Cathryn Lavery
---

# Diagram Design

A Claude Code skill for creating editorial-quality technical diagrams as standalone HTML files with inline SVG.

> *"The highest-quality move is usually deletion. Every node earns its place. Target density: 4/10."*

## 基本信息

| 字段 | 值 |
|------|-----|
| 作者 | [Cathryn Lavery](https://github.com/cathrynlavery) |
| Stars | ![2007](https://img.shields.io/github/stars/cathrynlavery/diagram-design) |
| 语言 | HTML |
| 许可证 | MIT |
| 图类型 | 13 种 |
| 平台 | Claude Code |

## 核心特色

### 品牌匹配（60 秒完成）

```
You:     "onboard diagram-design to https://yoursite.com"
Claude:  → fetches the homepage
         → extracts the dominant palette + font stack
         → maps detected values to semantic roles:
             paper, ink, muted, accent, link
         → shows a proposed diff
         → writes your tokens to references/style-guide.md
```

**自动提取内容：**

| 从网站检测 | 映射为 |
|-----------|--------|
| `<body>` 背景色 | `paper` |
| 主文本颜色 | `ink` |
| 次要文本 | `muted` |
| 卡片/容器 | `paper-2` |
| 最常用品牌色 | `accent` |
| `<h1>` 字体 | `title` |
| `<body>` 字体 | `node-name` |
| `<code>` 字体 | `sublabel` |

**WCAG AA 对比度检查自动进行**

### 13 种图类型

| 图类型 | 用途 | 复杂度上限 |
|--------|------|-----------|
| **Architecture** | 系统组件 + 连接 | 9 节点 |
| **Flowchart** | 决策逻辑 | 9 节点 |
| **Sequence** | 时序消息 | 5 条生命线 |
| **State machine** | 状态 + 转换 | 9 节点 |
| **ER / data model** | 实体 + 字段 | 8 实体 |
| **Timeline** | 时间轴事件 | 9 节点 |
| **Swimlane** | 跨职能流程 | 5 泳道 |
| **Quadrant** | 双轴定位 | 12 项目 |
| **Nested** | 嵌套层级 | 6 层 |
| **Tree** | 父子关系 | 4 层深 |
| **Layer stack** | 堆叠抽象 | 6 层 |
| **Venn** | 集合重叠 | 3 圆 |
| **Pyramid** | 层级/漏斗 | 6 层 |

### 三种变体

每种图类型都提供三种变体：

| 变体 | 用途 |
|------|------|
| **Minimal light** | 截图即用，暖色纸张 |
| **Minimal dark** | 暗色模式网站、幻灯片 |
| **Full editorial** | 长文英雄图，含摘要卡片 |

## 设计系统

### 语义色彩

| 角色 | 用途 | 默认值 |
|------|------|--------|
| `paper`, `paper-2` | 页面背景 | `#faf7f2` |
| `ink` | 主文本/描边 | `#1c1917` |
| `muted`, `soft` | 次要文本/箭头 | `#52534e` |
| `accent` | 焦点元素（1-2 个） | `#b5523a` |
| `link` | HTTP/API 箭头 | `#1a70c7` |

### 字体规范

| 用途 | 字体 | 大小 |
|------|------|------|
| 标题 | Instrument Serif | 1.75rem |
| 节点名称 | Geist sans | 12px |
| 技术标签 | Geist Mono | 9px |
| 侧边批注 | Instrument Serif *斜体* | 14px |

### 布局规则

- **4px 网格** — 所有值必须能被 4 整除
- **复杂度上限** — 最多 9 个节点/图
- **焦点规则** — accent 色最多用 2 个元素

## 复杂度预算

| 限制 | 规则 |
|------|------|
| 最大节点数 | 9 |
| 最大箭头数 | 12 |
| 最大 accent 元素 | 2 |
| 最大生命线（Sequence） | 5 |
| 最大泳道（Swimlane） | 5 |

## 质量门槛（输出前检查）

**类型适配：**
- [ ] 这是展示内容的正确类型吗？
- [ ] 表格/段落是否能达到同样效果？（如果是，不要画）

**删除测试：**
- [ ] 能删除任何节点吗？
- [ ] 能合并两个节点吗？
- [ ] 能删除任何箭头吗？
- [ ] 能删除任何标签吗？

**信号检查：**
- [ ] accent 色使用 ≤2 个元素？
- [ ] 图例覆盖所有使用的类型？
- [ ] 符合类型复杂度预算？

**技术检查：**
- [ ] 箭头绘制在节点之前？
- [ ] 每个箭头标签有实色背景？
- [ ] 图例是底部横条，不是浮动？
- [ ] 所有值能被 4 整除？

## 项目结构

```
diagram-design/
├── SKILL.md                         — 哲学、选型指南、检查清单
├── references/                      — 按需加载的类型参考
│   ├── style-guide.md               — 颜色+字体单一真相源
│   ├── onboarding.md                — URL→令牌流程
│   ├── type-*.md                    — 13 种图类型规范
│   ├── primitive-annotation.md       — 斜体编辑批注
│   └── primitive-sketchy.md         — 手绘 SVG 变体
├── assets/
│   ├── index.html                   — 实时画廊（可浏览器打开）
│   ├── template*.html               — 模板
│   └── example-*.html               — 39 个示例（13×3）
└── docs/screenshots/                 — README 图片
```

## 安装方式

### 方式一：克隆（推荐自定义）

```bash
git clone git@github.com:cathrynlavery/diagram-design.git ~/.claude/skills/diagram-design
```

### 方式二：插件（快速体验）

```bash
/plugin marketplace add cathrynlavery/diagram-design
/plugin install diagram-design@diagram-design
```

## 使用示例

```bash
# 打开画廊查看所有 13 种类型
open ~/.claude/skills/diagram-design/assets/index.html

# 在 Claude Code 中直接询问：
"Make me an architecture diagram of my app: frontend, backend, database, Redis cache."
"I need a quadrant showing Q2 projects by impact vs effort."
"Give me a sequence diagram of the OAuth handshake."
```

## 反模式警告

这些特征标志"AI 垃圾"图：

| 反模式 | 问题 |
|--------|------|
| 暗色 + 青色/紫色光晕 | 看起来"技术"但没有设计决策 |
| JetBrains Mono 通用"开发者"字体 | Mono 只用于技术内容 |
| 所有节点相同样式 | 抹去了层级 |
| 图例浮在图内 | 与节点冲突 |
| 垂直文字标签 | 不可读 |
| 每个"重要"节点都用 accent 色 | accent 是编辑焦点，不是信号系统 |

## 关于作者

**Cathryn Lavery** — [BestSelf.co](https://bestself.co) 创始人

- 博客：[littlemight.com](https://littlemight.com)
- Twitter：[@cathrynlavery](https://x.com/cathrynlavery)
- 分享 AI、创业和设计好东西

## 链接

- **GitHub**: https://github.com/cathrynlavery/diagram-design
- **画廊**: 打开 `assets/index.html` 查看所有图类型

## 相关资源

<!-- Dataview 自动填充 -->
