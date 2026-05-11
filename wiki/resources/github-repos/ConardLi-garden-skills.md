---
name: ConardLi-garden-skills
description: ConardLi's open-source Skills collection, featuring web design, knowledge retrieval, image generation, and more.
type: source
tags: [github, css, typescript, ai-agents, skills, claude-code]
created: 2026-05-11
updated: 2026-05-11
source: ../../../archive/resources/github/ConardLi-garden-skills-2026-05-11.json
stars: 3954
language: CSS
license: mit
github_url: https://github.com/ConardLi/garden-skills
---

# Garden Skills

> [!tip] Repository Overview
> ⭐ **3954 Stars** | 🔥 **ConardLi's open-source Skills collection, featuring web design, knowledge retrieval, image generation, and more.**

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [ConardLi/garden-skills](https://github.com/ConardLi/garden-skills) |
| **Stars** | ⭐ 3954 |
| **语言** | CSS |
| **许可证** | MIT |
| **创建时间** | 2026-04-21 |
| **更新时间** | 2026-05-11 |

## 项目介绍

**Garden Skills** 是一个精选的生产级 [Agent Skills](https://support.claude.com/en/articles/12512176-what-are-skills) 集合，专为 Claude Code、Cursor、Codex 和其他 AI 编程代理设计。

该集合包含 4 个核心 Skills，覆盖了 Web 设计、知识检索、图片生成和视频演示等领域。每个 Skill 都经过精心设计，可以直接在生产环境中使用。

### 核心价值

- ✅ **生产级质量**：每个 Skill 都经过实战验证
- ✅ **多环境兼容**：支持 Claude Code、Cursor、Codex 等多种 AI 代理
- ✅ **灵活安装**：提供 5 种安装方式，适应不同工作流
- ✅ **持续更新**：活跃维护，频繁更新

## 技术架构

### 技术栈

- **构建工具**：Vite
- **前端框架**：React
- **编程语言**：TypeScript
- **样式方案**：CSS、CSS Tokens
- **颜色系统**：oklch()、Container Queries

### 架构特点

1. **模块化设计**：每个 Skill 独立运行，互不干扰
2. **渐进式工作流**：从需求到验证的完整流程
3. **多运行模式**：支持本地、托管和顾问模式
4. **版本管理**：通过 Git 标签和 Release 固定版本

## 核心特性

### 1️⃣ web-video-presentation（Web 视频/演示工程）

**最佳场景**：将脚本、文章、课程、产品演示和演讲转换为可点击驱动的 16:9 Web 演示，可录制为电影级视频。

**核心能力**：
- 📐 固定 1920×1080 舞台，自动缩放以适应视口
- 🎬 点击/键盘驱动的 `(章节, 步骤)` 光标，每个视觉步骤一个旁白节拍
- 🛑 硬协作检查点：脚本、主题、大纲、实现模式和可选音频
- 🎨 主题令牌架构，支持多种视觉语言（从 `paper-press` 到 `terminal-green`）
- 🏗️ 脚手架式 Vite + React + TypeScript 项目，包含可重用的舞台原语和录制指导

**技术栈**：Vite + React + TypeScript

**链接**：[README](https://github.com/ConardLi/garden-skills/tree/main/skills/web-video-presentation) · [SKILL.md](https://github.com/ConardLi/garden-skills/tree/main/skills/web-video-presentation) · [下载 v1.1.3](https://github.com/ConardLi/garden-skills/releases/download/web-video-presentation-v1.1.3/web-video-presentation-1.1.3.zip)

### 2️⃣ web-design-engineer（设计/前端）

**最佳场景**：Web 页面、落地页、仪表板、交互原型、HTML 幻灯片、动画、UI 模型、数据可视化和设计系统探索。

**核心能力**：
- 🎯 定义六步设计工作流：需求→上下文→设计系统→v0→完整构建→验证
- 🚫 超越通用 AI UI 模式的反陈词滥调黑名单和更强的视觉判断力
- 💻 覆盖 HTML/CSS/JavaScript/React 原型，包含响应式布局、动效和交互打磨指导
- 🎨 包含内联 React + Babel、CSS 令牌、`oklch()` 颜色工作、容器查询和减少动效处理的实用实现规则
- 📚 高级模式参考：设备框架、幻灯片引擎、动画时间轴、仪表板和其他可重用的 Web 工件

**技术栈**：HTML / CSS / JavaScript / React

**链接**：[README](https://github.com/ConardLi/garden-skills/tree/main/skills/web-design-engineer) · [SKILL.md](https://github.com/ConardLi/garden-skills/tree/main/skills/web-design-engineer) · [官网](https://github.com/ConardLi/garden-skills/tree/main/website/web-design-website) · [演示](https://github.com/ConardLi/garden-skills/tree/main/demo/web-design-demo) · [下载 v1.0.0](https://github.com/ConardLi/garden-skills/releases/download/web-design-engineer-v1.0.0/web-design-engineer-1.0.0.zip)

### 3️⃣ gpt-image-2（图片生成/提示工程）

**最佳场景**：海报、UI 模型、产品视觉、信息图、学术图表、技术图表、漫画、头像、故事板、品牌板和图片编辑工作流。

**核心能力**：
- 🔄 支持三种运行模式：**模式 A Garden 本地**、**模式 B 主机原生代理**、**模式 C 仅顾问提示写作**
- 🔍 每次任务都从模式检测开始，确保技能不会静默选择错误的执行路径
- 📂 在 `references/` 下提供 18 个视觉类别和 80+ 结构化提示模板
- 🎨 通过专用工作流和脚本覆盖图片生成和图片编辑
- 💾 在 Garden 模式下将提示和生成的图片保存在 `garden-gpt-image-2/` 中，以便重用、审查和版本控制

**技术栈**：GPT Image 2 API、OpenAI 兼容图片 API

**链接**：[README](https://github.com/ConardLi/garden-skills/tree/main/skills/gpt-image-2) · [SKILL.md](https://github.com/ConardLi/garden-skills/tree/main/skills/gpt-image-2) · [官网](https://github.com/ConardLi/garden-skills/tree/main/website/gpt-image2-website) · [下载 v1.0.3](https://github.com/ConardLi/garden-skills/releases/download/gpt-image-2-v1.0.3/gpt-image-2-1.0.3.zip)

### 4️⃣ kb-retriever（检索/本地知识库）

**最佳场景**：从本地 `knowledge/` 目录回答问题、搜索结构化文档，以及从 Markdown、文本、PDF 和 Excel 文件中提取证据，而不会淹没代理上下文。

**核心能力**：
- 🗺️ 使用分层 `data_structure.md` 文件在搜索内容之前导航知识库
- 📚 对 PDF 和 Excel 文件强制执行**先学习后处理**规则，使用包含的参考文档进行提取或分析
- 🔍 结合精确关键词搜索、本地窗口读取、同义词和迭代细化
- ⏱️ 将检索限制为最多 5 轮搜索，使探索保持可控
- 🛠️ 包含 `grep`、`pdftotext`、`pdfplumber` 和 `pandas` 的工作流，以及源感知的答案格式化

**技术栈**：grep、pdftotext、pdfplumber、pandas

**链接**：[README](https://github.com/ConardLi/garden-skills/tree/main/skills/kb-retriever) · [SKILL.md](https://github.com/ConardLi/garden-skills/tree/main/skills/kb-retriever) · [下载 v1.0.0](https://github.com/ConardLi/garden-skills/releases/download/kb-retriever-v1.0.0/kb-retriever-1.0.0.zip)

## 安装与使用

### 安装方式

提供 5 种支持的安装路径，选择适合你的方式：

| # | 方法 | 最适合 | 固定版本？ |
|---|---|---|---|
| A | [`skills` CLI (npx)](https://www.npmjs.com/package/skills) | 任何代理，一行安装，选择技能 | ✅ 通过标签 URL |
| B | [Claude Code 插件市场](https://github.com/ConardLi/garden-skills) | 想要订阅插件包的 Claude Code 用户 | ✅ 通过市场版本 |
| C | [来自 GitHub Releases 的固定 `.zip`](https://github.com/ConardLi/garden-skills/releases) | CI/隔离环境/可重现安装 | ✅ ✅ (不可变) |
| D | [手动复制](https://github.com/ConardLi/garden-skills) | 在技能本身上进行本地黑客 | ❌ (跟踪 `main`) |
| E | [Git 子模块](https://github.com/ConardLi/garden-skills) | 打包到更大的项目中，想要上游更新 | ✅ 通过子模块 SHA |

### 方法 A：skills CLI (npx) - 推荐

最快的代理无关路径。使用标准的 [`npx skills` CLI](https://www.npmjs.com/package/skills)，自动检测你的代理（Claude Code、Cursor、Codex 等）并将技能放入正确的目录。

```bash
# 安装所有四个技能（最新版本）
npx skills add ConardLi/garden-skills

# 仅安装一个技能（最新版本）
npx skills add ConardLi/garden-skills -s web-design-engineer

# 全局安装 (~/.skills) 而非每项目 (./.skills)
npx skills add ConardLi/garden-skills -s gpt-image-2 --global

# 目标特定代理
npx skills add ConardLi/garden-skills -s kb-retriever -a claude-code
```

> **默认为 `main` 上的最新提交。** 这是你 95% 的时间想要的 — CLI 直接从源树跟踪每个技能的最新发布的 `SKILL.md`。

**想要固定版本？（CI/生产）** 使用标签范围的 `tree/` URL — 这指向发布被切出的确切提交：

```bash
# 将一个技能固定到特定发布
npx skills add ConardLi/garden-skills/tree/web-design-engineer-v1.0.0/skills/web-design-engineer
```

### 常用命令

```bash
npx skills list                 # 查看已安装的技能
npx skills find web-design      # 搜索注册表
npx skills update               # 更新所有内容
npx skills remove kb-retriever  # 卸载技能
```

## 使用案例

### 案例 1：使用 web-design-engineer 创建落地页

```bash
# 1. 安装技能
npx skills add ConardLi/garden-skills -s web-design-engineer

# 2. 在 Claude Code 中使用
# 提示词："使用 web-design-engineer 为我的产品创建一个现代落地页"

# 技能将执行：
# - 需求分析
# - 上下文理解
# - 设计系统定义
# - v0 原型创建
# - 完整实现
# - 结果验证
```

### 案例 2：使用 kb-retriever 搜索本地文档

```bash
# 1. 安装技能
npx skills add ConardLi/garden-skills -s kb-retriever

# 2. 创建 knowledge 目录
mkdir -p knowledge/docs

# 3. 在 Claude Code 中使用
# 提示词："使用 kb-retriever 在我的 knowledge 目录中搜索关于 API 认证的信息"

# 技能将执行：
# - 导航 data_structure.md
# - 精确关键词搜索
# - 局部窗口读取
# - 迭代细化
# - 源感知答案格式化
```

### 案例 3：使用 gpt-image-2 生成产品视觉图

```bash
# 1. 安装技能
npx skills add ConardLi/garden-skills -s gpt-image-2

# 2. 在 Claude Code 中使用
# 提示词："使用 gpt-image-2 为我的 SaaS 产品创建 3 个宣传图"

# 技能将执行：
# - 模式检测（本地/托管/顾问）
# - 选择视觉类别
# - 应用结构化提示模板
# - 生成图片
# - 保存到 garden-gpt-image-2/
```

## 项目亮点

- 🌟 **高 Stars 数**：3954+ Stars，社区活跃度高
- 📦 **开箱即用**：所有技能都经过实战验证，可直接使用
- 🔄 **持续更新**：最后更新时间 2026-05-11，保持活跃维护
- 📚 **完整文档**：每个技能都有详细的 README 和 SKILL.md
- 🎯 **多环境支持**：兼容 Claude Code、Cursor、Codex 等多种 AI 代理
- 🛠️ **灵活安装**：提供 5 种安装方式，适应不同工作流

## 相关链接

- [GitHub 仓库](https://github.com/ConardLi/garden-skills)
- [NPM 包](https://www.npmjs.com/package/skills)
- [Claude Code Skills 文档](https://support.claude.com/en/articles/12512176-what-are-skills)
- [Agent Skills 规范](https://agentskills.io)
