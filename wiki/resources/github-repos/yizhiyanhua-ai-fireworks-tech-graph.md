---
name: resources/github-repos/yizhiyanhua-ai-fireworks-tech-graph
description: Claude Code skill for generating production-quality SVG+PNG technical diagrams using natural language
type: source
version: 1.0
tags: [github, claude-code-skill, svg, diagram, python]
created: 2026-04-28
updated: 2026-04-28
source: ../../archive/resources/github/yizhiyanhua-ai-fireworks-tech-graph-2026-04-28.json
stars: 4750
language: Python
license: MIT
github_url: https://github.com/yizhiyanhua-ai/fireworks-tech-graph
---

# fireworks-tech-graph

Claude Code skill for generating production-quality SVG+PNG technical diagrams from natural language descriptions.

## 快速开始

```bash
npx skills add yizhiyanhua-ai/fireworks-tech-graph
```

## 核心功能

| 功能 | 描述 |
|------|------|
| **7 种视觉风格** | Flat Icon, Dark Terminal, Blueprint, Notion Clean, Glassmorphism, Claude Official, OpenAI Official |
| **14 种图表类型** | 完整 UML 支持 + AI/Agent 领域图 |
| **自然语言输入** | 用英文/中文描述系统，自动生成图表 |
| **SVG + PNG 输出** | SVG 用于编辑，1920px PNG 用于嵌入 |

## 支持的图表类型

- **AI/Agent 领域**: RAG, Agentic Search, Mem0, Multi-Agent, Tool Call
- **UML 图表**: Class, Component, Deployment, Sequence, State Machine 等 14 种
- **基础图表**: Architecture, Data Flow, Flowchart, Mind Map, Comparison

## 安装要求

```bash
# macOS
brew install librsvg

# Ubuntu/Debian
sudo apt install librsvg2-bin

# 验证安装
rsvg-convert --version
```

## 使用示例

```
Draw a RAG pipeline flowchart
```

```
Generate an Agentic Search architecture diagram
```

```
Draw a microservices architecture diagram, style 2 (dark terminal)
```

## 相关资源

- GitHub: [[https://github.com/yizhiyanhua-ai/fireworks-tech-graph]]
- NPM: https://www.npmjs.com/package/@yizhiyanhua-ai/fireworks-tech-graph

---

*归档时间: 2026-04-28*