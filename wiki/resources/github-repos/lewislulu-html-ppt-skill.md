---
name: lewlulu-html-ppt-skill
description: HTML PPT Studio — 36 themes, 15 templates, 31 layouts, 47 animations for professional HTML presentations
type: source
tags: [github, html, css, presentation, agent-skill, animation]
created: 2026-05-10
updated: 2026-05-10
source: ../../../archive/resources/github/lewislulu-html-ppt-skill-2026-05-10.json
stars: 3203
language: HTML
license: MIT
github_url: https://github.com/lewislulu/html-ppt-skill
---

# html-ppt-skill

> [!tip] Repository Overview
> ⭐ **3203 Stars** | 🔥 **A world-class AgentSkill for producing professional HTML presentations in 36 themes, 15 full-deck templates, 31 page layouts, 47 animations (27 CSS + 20 canvas FX), and a true presenter mode with pixel-perfect previews + speaker script + timer — all pure static HTML/CSS/JS, no build step.**

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [lewislulu/html-ppt-skill](https://github.com/lewislulu/html-ppt-skill) |
| **Stars** | ⭐ 3203 |
| **Forks** | 319 |
| **语言** | HTML |
| **许可证** | MIT |
| **创建时间** | 2026-04-15 |
| **更新时间** | 2026-05-09 |

## 项目介绍

**HTML PPT Studio** 是一个世界级的 AgentSkill，用于制作专业的 HTML 演示文稿。它提供了：

- **36 主题** × **15 完整模板** × **31 布局** × **47 动画**（27 CSS + 20 Canvas FX）
- **真正的演示者模式**：像素级完美预览 + 演讲稿 + 计时器
- **纯静态 HTML/CSS/JS**：无需构建步骤

> "One command installs **36 themes × 20 canvas FX × 31 layouts × 15 full decks + presenter mode**."

项目特点：
- **零构建**：纯静态 HTML/CSS/JS
- **专业设计**：高级设计师默认值，无"Corporate PowerPoint 2006"风格
- **中英文双语**：预导入 Noto Sans SC / Noto Serif SC 字体
- **Token-driven 设计系统**：所有颜色、圆角、阴影、字体决策都在 CSS 变量中

## 核心特性

### 🎤 演示者模式（Presenter Mode）

按 `S` 键打开专用的演示者窗口，包含四个可拖动、可调整大小的**磁性卡片**：

1. **当前幻灯片** - 显示正在演讲的页面
2. **下一页预览** - 提前查看下一张幻灯片
3. **演讲稿** - 显示详细的演讲提示词
4. **计时器** - 跟踪演讲时间

两个窗口通过 `BroadcastChannel` 保持同步。

**像素级完美预览**：每个卡片都是一个 `<iframe>`，加载相同的幻灯片 HTML 并带有 `?preview=N` 查询参数。运行时检测到此参数后，只渲染幻灯片 N，不显示任何装饰——因此预览使用与观众视图**相同的 CSS、主题、字体和视口**。

**流畅导航**：幻灯片切换时，演示者窗口向每个 iframe 发送 `postMessage({type:'preview-goto', idx:N})`。iframe 只是在幻灯片之间切换 `.is-active` 类——**无需重新加载，无闪烁**。

### 🎨 36 主题

包括：`minimal-white`, `editorial-serif`, `soft-pastel`, `sharp-mono`, `arctic-cool`, `sunset-warm`, `catppuccin-latte`, `catppuccin-mocha`, `dracula`, `tokyo-night`, `nord`, `solarized-light`, `gruvbox-dark`, `rose-pine`, `neo-brutalism`, `glassmorphism`, `bauhaus`, `swiss-grid`, `terminal-green`, `xiaohongshu-white`, `rainbow-gradient`, `aurora`, `blueprint`, `memphis-pop`, `cyberpunk-neon`, `y2k-chrome`, `retro-tv`, `japanese-minimal`, `vaporwave`, `midcentury`, `corporate-clean`, `academic-paper`, `news-broadcast`, `pitch-deck-vc`, `magazine-bold`, `engineering-whiteprint`。

每个主题都是纯 CSS 令牌文件——只需交换一个 `<link>` 即可重新换肤整个幻灯片。

### 📑 15 个完整幻灯片模板

**从真实幻灯片中提取的外观**（8 个）：
- `xhs-white-editorial` — 小红书白底杂志风
- `graphify-dark-graph` — 暗底 + 力导向知识图谱
- `knowledge-arch-blueprint` — 蓝图 / 架构图风
- `hermes-cyber-terminal` — 终端 cyberpunk
- `obsidian-claude-gradient` — 紫色渐变卡
- `testing-safety-alert` — 红 / 琥珀警示风
- `xhs-pastel-card` — 柔和马卡龙图文
- `dir-key-nav-minimal` — 方向键极简

**场景幻灯片**（7 个）：
- `pitch-deck`, `product-launch`, `tech-sharing`, `weekly-report`, `xhs-post` (9-slide 3:4), `course-module`, **`presenter-mode-reveal`** 🎤

### 🧩 31 个单页布局

cover · toc · section-divider · bullets · two-column · three-column · big-quote · stat-highlight · kpi-grid · table · code · diff · terminal · flow-diagram · timeline · roadmap · mindmap · comparison · pros-cons · todo-checklist · gantt · image-hero · image-grid · chart-bar · chart-line · chart-pie · chart-radar · arch-diagram · process-steps · cta · thanks

每个布局都附带真实的演示数据，可以直接放入幻灯片中并立即查看渲染效果。

### ✨ 47 个动画（27 CSS + 20 Canvas FX）

**CSS 动画（轻量级）**：directional fades, `rise-in`, `zoom-pop`, `blur-in`, `glitch-in`, `typewriter`, `neon-glow`, `shimmer-sweep`, `gradient-flow`, `stagger-list`, `counter-up`, `path-draw`, `morph-shape`, `parallax-tilt`, `card-flip-3d`, `cube-rotate-3d`, `page-turn-3d`, `perspective-zoom`, `marquee-scroll`, `kenburns`, `ripple-reveal`, `spotlight`...

**Canvas FX（电影级）**：`particle-burst`, `confetti-cannon`, `firework`, `starfield`, `matrix-rain`, `knowledge-graph` (力导向物理), `neural-net` (信号脉冲), `constellation`, `orbit-ring`, `galaxy-swirl`, `word-cascade`, `letter-explode`, `chain-react`, `magnetic-field`, `data-stream`, `gradient-blob`, `sparkle-trail`, `shockwave`, `typewriter-multi`, `counter-explosion`

## 技术架构

### 核心设计原则

- **Token-driven 设计系统**：所有颜色、圆角、阴影、字体决策都在 `assets/base.css` + 当前主题文件中。更改一个变量，整个幻灯片就会优雅地重新流动。
- **Iframe 隔离预览**：主题 / 布局 / 完整幻灯片展示都使用每张幻灯片 `<iframe>`，因此每个预览都是真实的、独立的渲染。
- **零构建**：纯静态 HTML/CSS/JS。CDN 仅用于 webfonts、highlight.js 和 chart.js（可选）。
- **高级设计师默认值**：有观点的字型比例、间距节奏、渐变和卡片处理——没有"Corporate PowerPoint 2006"的感觉。
- **中英文一流支持**：预导入 Noto Sans SC / Noto Serif SC。

### 技术栈

| 组件 | 技术 |
|------|------|
| **核心** | 纯静态 HTML/CSS/JS |
| **样式** | CSS Variables + Token-driven 设计系统 |
| **动画** | CSS Animations + Canvas API |
| **通信** | BroadcastChannel（演示者模式） |
| **字体** | Noto Sans SC / Noto Serif SC（预导入） |
| **可选** | highlight.js, chart.js（CDN） |

### 项目结构

```
html-ppt-skill/
├── SKILL.md                      agent-facing dispatcher
├── README.md                     this file
├── references/                   详细目录
│   ├── themes.md                 36 主题及使用时机
│   ├── layouts.md                31 种布局类型
│   ├── animations.md             27 CSS + 20 FX 目录
│   ├── full-decks.md             14 个完整幻灯片模板
│   └── authoring-guide.md        完整工作流程
├── assets/
│   ├── base.css                  共享令牌 + 基元
│   ├── fonts.css                 webfont 导入
│   ├── runtime.js                键盘 + 演示者 + 概览
│   ├── themes/*.css              36 个主题令牌文件
│   └── animations/
│       ├── animations.css        27 个命名 CSS 动画
│       ├── fx-runtime.js         自动初始化 [data-fx]
│       └── fx/*.js               20 个 canvas FX 模块
├── templates/
│   ├── deck.html                 最简入门
│   ├── theme-showcase.html       iframe 隔离主题浏览
│   ├── layout-showcase.html      所有 31 个布局
│   ├── animation-showcase.html   47 个动画幻灯片
│   ├── full-decks-index.html     14 幻灯片画廊
│   ├── full-decks/<name>/        14 个作用域多幻灯片
│   └── single-page/*.html        31 个带演示数据的布局文件
├── scripts/
│   ├── new-deck.sh               脚手架
│   ├── render.sh                 无头 Chrome → PNG
│   └── verify-output/            56 个自测试截图
└── examples/demo-deck/           完整的工作幻灯片
```

## 安装与使用

### 安装

```bash
npx skills add https://github.com/lewislulu/html-ppt-skill
```

这会将技能注册到您的 agent 运行时。安装后，任何支持 AgentSkills 的 agent 都可以通过提问来创作演示文稿，例如：

> "做一份 8 页的技术分享 slides，用 cyberpunk 主题"
> "turn this outline into a pitch deck"
> "做一个小红书图文，9 张，白底柔和风"

### 快速开始（手动）

```bash
# 从基础模板搭建新幻灯片
./scripts/new-deck.sh my-talk

# 浏览所有内容
open templates/theme-showcase.html         # 所有 36 个主题（iframe 隔离）
open templates/layout-showcase.html        # 所有 31 个布局
open templates/animation-showcase.html     # 所有 47 个动画
open templates/full-decks-index.html       # 所有 14 个完整幻灯片

# 通过无头 Chrome 将任何模板渲染为 PNG
./scripts/render.sh templates/theme-showcase.html
./scripts/render.sh examples/my-talk/index.html 12
```

### 键盘快捷键

```
← → Space PgUp PgDn Home End   导航
F                               全屏
S                               打开演示者窗口（磁性卡片）
N                               快速笔记抽屉（底部）
R                               重置计时器（在演示者窗口中）
O                               幻灯片概览网格
T                               循环主题（同步到演示者）
A                               在当前幻灯片上循环演示动画
#/N (URL)                       深度链接到幻灯片 N
?preview=N (URL)                仅预览模式（单张幻灯片，无装饰）
```

## 使用案例

### 场景 1：技术分享演示

```bash
# 创建技术分享幻灯片
./scripts/new-deck.sh tech-sharing

# 使用 tech-sharing 模板
cp -r templates/full-decks/tech-sharing/* examples/my-talk/
```

### 场景 2：小红书图文制作

```bash
# 使用小红书模板（9 张 3:4 图文）
cp -r templates/full-decks/xhs-post/* examples/xhs-post/
```

### 场景 3：使用演示者模式演讲

1. 打开幻灯片
2. 按 `S` 键打开演示者窗口
3. 拖动四个磁性卡片到合适位置
4. 开始演讲，演讲稿和计时器会帮助您掌控节奏

### 场景 4：渲染为图片

```bash
# 渲染整个幻灯片为 PNG
./scripts/render.sh examples/my-talk/index.html

# 渲染特定幻灯片
./scripts/render.sh examples/my-talk/index.html 5
```

## 演讲稿创作黄金法则

1. **提示信号，而不是朗读台词** — 加粗关键词，将过渡句分成单独的段落
2. **每张幻灯片 150–300 字** — 这就是约 2–3 分钟/页的节奏
3. **像说话一样写** — 对话式，而不是书面散文

完整创作指南请参阅 [`references/presenter-mode.md`](https://github.com/lewislulu/html-ppt-skill/blob/main/references/presenter-mode.md)，或复制 `templates/full-decks/presenter-mode-reveal/` 中的现成模板，每张幻灯片都附有完整的 150-300 字演讲稿。

## 相关链接

- [GitHub 仓库](https://github.com/lewislulu/html-ppt-skill)
- [中文文档](https://github.com/lewislulu/html-ppt-skill/blob/main/README.zh-CN.md)
- [完整指南](https://github.com/lewislulu/html-ppt-skill/tree/main/references)
- [作者](mailto:sudolewis@gmail.com)

---

**收集时间**：2026-05-10
**数据来源**：GitHub API + README 解析
**文档模式**：详细文档版（包含项目介绍、技术架构、使用案例）
