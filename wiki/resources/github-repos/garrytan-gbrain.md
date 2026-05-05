---
name: garrytan-gbrain
description: Garry's Opinionated OpenClaw/Hermes Agent Brain — 为 AI Agent 提供知识记忆系统的开源项目
type: source
version: 1.0
tags: [github, typescript, ai-agent, knowledge-graph, memory-system]
created: 2026-04-28
updated: 2026-04-28
source: ../../../archive/resources/github/garrytan-gbrain-2026-04-28.json
stars: 12000
language: TypeScript
license: MIT
github_url: https://github.com/garrytan/gbrain
---

# GBrain

Your AI agent is smart but forgetful. GBrain gives it a brain.

由 Y Combinator 总裁兼首席执行官构建的生产级 AI Agent 脑系统。支撑着 17,888 个页面、4,383 人、723 家公司、21 个自主运行的定时任务，在 12 天内构建完成。

## 基本信息

| 字段 | 值 |
|------|-----|
| 作者 | [garrytan](https://github.com/garrytan) |
| 语言 | TypeScript |
| Stars | ![stars](https://img.shields.io/github/stars/garrytan/gbrain) |
| 许可证 | MIT |
| 技能数量 | 29 |

## 核心特性

- **自布线知识图谱** — 每个页面写入时自动提取实体引用，创建类型化链接（attended, works_at, invested_in, founded, advises），零 LLM 调用
- **混合搜索** — 向量搜索 + BM25 + 图谱，突破纯向量检索的局限
- **结构化时间线** — 人员和公司页面包含完整时间线
- **反向链接增强排名** — 传统关键词搜索无法触及的关系查询

### Benchmarks

在 240 页 Opus 生成的丰富语料库上：
- P@5: **49.1%**（图谱禁用变体 +31.4 分）
- R@5: **97.9%**

完整 BrainBench 评分见 [gbrain-evals](https://github.com/garrytan/gbrain-evals) 仓库。

## 29 项内置技能

### 持续运行

| 技能 | 功能 |
|------|------|
| signal-detector | 每次消息触发，并行运行廉价模型捕获原始思维和实体提及 |
| brain-ops | 任何外部 API 调用前的脑优先查找 |

### 内容摄取

| 技能 | 功能 |
|------|------|
| ingest | 薄路由，检测输入类型并委托给正确的摄取技能 |
| idea-ingest | 链接、文章、推文成为脑页面，含分析和跨链接 |
| media-ingest | 视频、音频、PDF、书籍、截图、GitHub 仓库 |
| meeting-ingestion | 会议记录转脑页面，参会者获丰富，公司获时间线 |

### 脑操作

| 技能 | 功能 |
|------|------|
| enrich | 分层丰富（Tier 1/2/3） |
| query | 3层搜索 + 综合 + 引用 |
| maintain | 定期健康检查：僵尸页面、孤立页面、死链、引用审计 |
| citation-fixer | 扫描并修复格式 |
| data-research | 结构化数据研究 |

### MCP 服务

GBrain 通过 stdio 暴露 30+ MCP 工具：

```json
{
  "mcpServers": {
    "gbrain": {
      "command": "gbrain",
      "args": ["serve"]
    }
  }
}
```

支持 Claude Code、Cursor、Windsurf、GStack 等平台。

## 快速安装

### 方式一：Agent 平台安装（推荐）

```
Retrieve and follow the instructions at: https://raw.githubusercontent.com/garrytan/gbrain/master/INSTALL_FOR_AGENTS.md
```

约 30 分钟完成，数据库 2 秒就绪。

### 方式二：独立 CLI

```bash
git clone https://github.com/garrytan/gbrain.git && cd gbrain
bun install && bun link gbrain init
gbrain import ~/notes/
gbrain query "what themes show up across my notes?"
```

## 链接

- **GitHub**: https://github.com/garrytan/gbrain
- **文档**: https://github.com/garrytan/gbrain#readme
- **Skills**: https://github.com/garrytan/gbrain/tree/main/skills
- **评估报告**: https://github.com/garrytan/gbrain-evals

## 相关资源

<!-- Dataview 自动填充 -->

[[garrytan-gstack]]
