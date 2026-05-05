---
name: cocoon-ai-architecture-diagram-generator
description: 生成精美暗黑主题系统架构图的 Claude AI Skill — 输出独立 HTML/SVG 文件
type: source
version: 2.0
tags: [github, html, claude-code, claude-skill, architecture, svg, diagram, html]
created: 2025-12-22
updated: 2026-04-28
source: ../../../archive/resources/github/cocoon-ai-architecture-diagram-generator-2026-04-28.json
stars: 4487
forks: 338
language: HTML
license: MIT
github_url: https://github.com/Cocoon-AI/architecture-diagram-generator
docs_url: https://github.com/Cocoon-AI/architecture-diagram-generator/blob/main/README.md
---

# Architecture Diagram Generator

Generate beautiful dark-themed system architecture diagrams as standalone HTML/SVG files. Works as a Claude AI skill.

## 项目快照

| 字段 | 值 |
|------|-----|
| 作者 | [Cocoon-AI](https://github.com/Cocoon-AI) |
| 语言 | HTML |
| Stars | ![4487](https://img.shields.io/github/stars/Cocoon-AI/architecture-diagram-generator) |
| Forks | ![338](https://img.shields.io/github/forks/Cocoon-AI/architecture-diagram-generator) |
| 许可证 | MIT |
| 主题 | `claude-code` `claude-skill` `architecture` `svg` |
| 创建时间 | 2025-12-22 |
| 最后更新 | 2026-04-28 |
| 默认分支 | main |
| 开放 Issues | 1 |

## 项目介绍

需要架构图？让 AI 为你构建。使用 Claude.ai 配合这个特殊 Skill，在几秒钟内生成专业架构图。描述你的系统，Claude 会创建一个精美的暗黑主题图表作为独立 HTML 文件，你可以在任何浏览器中打开。

- **无需设计技能** — 只需用简单的英语描述你的架构
- **快速迭代** — 让 Claude 添加组件、更改布局或更新样式
- **易于分享** — 输出是单个 HTML 文件，无需特殊软件

## 工作原理

1. **获取架构描述** — 使用 AI 分析代码库，或自己编写
2. **粘贴到 Claude** — 使用安装的 Architecture Diagram Generator Skill
3. **生成图表** — Claude 创建精美的 HTML 文件，可直接在浏览器中打开

```
使用你的架构图 Skill 从这个描述创建架构图：

[PASTE YOUR ARCHITECTURE DESCRIPTION HERE]
```

## 核心特性

- **精美暗黑主题** — Slate-950 背景配细网格图案
- **语义颜色编码** — 前端、后端、数据库、云服务、安全组件颜色一致
- **独立输出** — 单个 HTML 文件，内嵌 CSS 和 SVG
- **无依赖** — 在任何现代浏览器中打开，无需 JavaScript
- **专业排版** — JetBrains Mono 字体，技术美学
- **智能分层** — 箭头在组件框后面清晰渲染

## 颜色方案

| 组件类型 | 颜色 | 用途 |
|----------|------|------|
| 前端 (Frontend) | 青色 Cyan | 客户端应用、UI、边缘设备 |
| 后端 (Backend) | 翡翠绿 Emerald | 服务器、API、服务 |
| 数据库 (Database) | 紫罗兰 Violet | 数据库、存储、AI/ML |
| 云/AWS | 琥珀色 Amber | 云服务、基础设施 |
| 安全 (Security) | 玫瑰色 Rose | 认证、安全组、加密 |
| 外部 (External) | 石板灰 Slate | 通用、外部系统 |

## 帮助文档

### 官方文档

| 目录 | 内容 |
|------|------|
| [README.md](./README.md) | 完整使用指南 |
| [architecture-diagram/SKILL.md](./architecture-diagram/SKILL.md) | Skill 技术规范 |
| [examples/](https://github.com/Cocoon-AI/architecture-diagram-generator/tree/main/examples) | 示例图表目录 |

### Skill 文件结构

```
architecture-diagram-generator/
├── architecture-diagram/
│   ├── SKILL.md              # Skill 指令（设计系统、模板）
│   └── assets/
│       └── template.html     # 基础模板
├── examples/
│   ├── web-app.html          # Web 应用示例
│   ├── aws-serverless.html   # AWS 无服务器示例
│   ├── microservices.html     # 微服务示例
│   └── images/               # 示例截图
└── architecture-diagram.zip   # 分发包
```

### 示例场景

**Web 应用：**
```
Create an architecture diagram for a web application with:
- React frontend
- Node.js/Express API
- PostgreSQL database
- Redis cache
- JWT authentication
```

**AWS 无服务器：**
```
Create an architecture diagram showing:
- CloudFront CDN
- API Gateway
- Lambda functions (Node.js)
- DynamoDB
- S3 for static assets
- Cognito for auth
```

**微服务：**
```
Create an architecture diagram for a microservices system with:
- React web app and mobile clients
- Kong API Gateway
- User Service (Go), Order Service (Java), Product Service (Python)
- PostgreSQL, MongoDB, and Elasticsearch databases
- Kafka for event streaming
- Kubernetes orchestration
```

## 链接

- **GitHub**: https://github.com/Cocoon-AI/architecture-diagram-generator
- **文档**: https://github.com/Cocoon-AI/architecture-diagram-generator/blob/main/README.md
- **Issue**: https://github.com/Cocoon-AI/architecture-diagram-generator/issues
- **联系**: hello@cocoon-ai.com

## 安装与使用

### 快速开始（3 步）

#### Step 1: 安装 Skill

> ⚠️ 需要 Claude Pro、Max、Team 或 Enterprise 计划

1. 下载 [`architecture-diagram.zip`](architecture-diagram.zip)
2. 进入 [claude.ai](https://claude.ai) → **Settings** → **Capabilities** → **Skills**
3. 点击 **+ Add** 并上传 zip 文件
4. 开启 Skill

#### Step 2: 获取架构描述文本

**选项 A: 让 AI 分析代码库**

在 Cursor、Claude Code、Windsurf 或 ChatGPT 中询问：

```
Analyze this codebase and describe the architecture. Include all major
components, how they connect, what technologies they use, and any cloud
services or integrations. Format as a list for an architecture diagram.
```

**选项 B: 自己编写**

列出组件和连接方式：

```
- React frontend talking to a Node.js API
- PostgreSQL database
- Redis for caching
- Hosted on AWS with CloudFront CDN
```

#### Step 3: 让 Claude 使用 Skill 生成图表

将 Step 2 的输出粘贴到 Claude（已安装 Architecture Diagram Generator Skill）：

```
Use your architecture diagram skill to create an architecture diagram from this description:

[PASTE YOUR ARCHITECTURE DESCRIPTION HERE]
```

完成！Claude 会生成一个精美的 HTML 文件，你可以在任何浏览器中打开。

### 多平台安装

| 平台 | 方法 |
|------|------|
| Claude.ai | 上传 zip → Settings → Capabilities → Skills |
| Claude Projects | 上传 zip 到 Project Knowledge |
| Claude Code CLI | `unzip architecture-diagram.zip -d ~/.claude/skills/` |

### 输出格式

生成的 HTML 结构：

```html
<!DOCTYPE html>
<html>
  <head>
    <!-- Embedded styles, Google Fonts -->
  </head>
  <body>
    <div class="container">
      <div class="header"><!-- Title --></div>
      <div class="diagram-container">
        <svg><!-- Architecture diagram --></svg>
      </div>
      <div class="cards"><!-- Summary cards --></div>
      <p class="footer"><!-- Metadata --></p>
    </div>
  </body>
</html>
```

### 技术规格

- **SVG viewBox:** 通常 1000-1100px 宽，响应式缩放
- **字体:** JetBrains Mono（从 Google Fonts 加载）
- **背景:** `#020617` 配 40px 网格图案
- **Z-ordering:** 箭头先绘制，被半透明填充遮罩

## 最新版本

- **版本**: v1.0 (2025-12-22)
- **初始版本**: Claude Skill for Architecture Diagrams

## 技术细节

### Skill 设计系统

**组件框模式：**
```svg
<rect x="X" y="Y" width="W" height="H" rx="6" fill="FILL" stroke="STROKE" stroke-width="1.5"/>
<text x="CENTER" y="Y+20" fill="white" font-size="11" text-anchor="middle">LABEL</text>
```

**箭头标记：**
```svg
<marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
  <polygon points="0 0, 10 3.5, 0 7" fill="#64748b" />
</marker>
```

**安全组边界：** 虚线描边（`stroke-dasharray="4,4"`），玫瑰色

**区域边界：** 更大虚线（`stroke-dasharray="8,4"`），琥珀色

### 布局结构

1. **Header** — 带脉冲点指示器的标题
2. **Main SVG diagram** — 圆角边框卡片中的主图表
3. **Summary cards** — 图表下方 3 个信息卡片的网格
4. **Footer** — 最小元数据行

## 标签

`html` `github` `source` `claude-code` `claude-skill` `architecture` `svg` `diagram`

## 相关资源

<!-- Dataview 自动填充 -->