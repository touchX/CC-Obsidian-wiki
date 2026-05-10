---
name: iOfficeAI-OfficeCLI
description: 全球首款为 AI Agent 设计的 Office 套件，一行命令控制 Word、Excel、PowerPoint 文件
type: source
tags: [github, c#, ai-agent, office, mcp-server]
created: 2026-05-08
updated: 2026-05-08
source: ../../../archive/resources/github/iOfficeAI-OfficeCLI-2026-05-08.json
stars: 3185
language: C#
license: apache-2.0
github_url: https://github.com/iOfficeAI/OfficeCLI
---

# OfficeCLI

> [!tip] Repository Overview
> ⭐ **3,185 Stars** | 🔥 **全球首款为 AI Agent 设计的 Office 套件**

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [iOfficeAI/OfficeCLI](https://github.com/iOfficeAI/OfficeCLI) |
| **Stars** | ⭐ 3,185 |
| **Forks** | 244 |
| **语言** | C# |
| **许可证** | Apache License 2.0 |
| **创建时间** | 2026-03-15 |
| **更新时间** | 2026-05-08 |

## 项目介绍

OfficeCLI 是**全球首款专为 AI Agent 设计的 Office 办公套件**，让任何 AI Agent 只需一行代码即可完全控制 Word、Excel 和 PowerPoint 文件。

**核心特点**：
- 开源免费，Apache 2.0 许可证
- 单一二进制文件，无需安装 Office
- 无依赖，跨平台运行（macOS/Linux/Windows）
- 内置 Agent 友好的渲染引擎

**内置渲染引擎** — Agent 可以"看到"自己创建的内容，无需 Office 即可将 `.docx` / `.xlsx` / `.pptx` 渲染为 HTML 或 PNG，闭合 *渲染 → 查看 → 修复* 循环。

## 技术架构

### 三层架构

| 层级 | 用途 | 命令 |
|------|------|------|
| **L1: Read** | 语义视图 | `view` (text, annotated, outline, stats, issues, html, screenshot) |
| **L2: DOM** | 结构化元素操作 | `get`, `query`, `set`, `add`, `remove`, `move`, `swap` |
| **L3: Raw XML** | 直接 XPath 访问 | `raw`, `raw-set`, `add-part`, `validate` |

### 内置引擎

- **渲染引擎**：内置 Shape、图表、公式、3D 模型渲染，支持 HTML/PNG 输出
- **公式引擎**：150+ 内置 Excel 函数自动计算
- **透视表引擎**：原生 OOXML 透视表，一行命令创建

## 安装与使用

### 一键安装

```bash
# macOS / Linux
curl -fsSL https://raw.githubusercontent.com/iOfficeAI/OfficeCLI/main/install.sh | bash

# Windows (PowerShell)
irm https://raw.githubusercontent.com/iOfficeAI/OfficeCLI/main/install.ps1 | iex
```

### AI Agent 快速开始

Agent 一行命令即可安装并配置：

```bash
curl -fsSL https://officecli.ai/SKILL.md
```

OfficeCLI 会自动检测 AI 工具（Claude Code、Cursor、Windsurf 等）并安装技能文件。

### 基本命令

```bash
# 创建空白演示文稿
officecli create deck.pptx

# 实时预览
officecli watch deck.pptx  # 打开 http://localhost:26315

# 添加幻灯片
officecli add deck.pptx / --type slide --prop title="Q4 Report"

# 添加形状
officecli add deck.pptx '/slide[1]' --type shape \
  --prop text="Revenue grew 25%" --prop x=2cm --prop y=5cm

# 查看大纲
officecli view deck.pptx outline

# 获取结构化 JSON
officecli get deck.pptx '/slide[1]/shape[1]' --json
```

## 使用案例

### 报表生成

```bash
# 1. 创建
officecli create report.pptx

# 2. 添加内容
officecli add report.pptx / --type slide --prop title="Q4 Results"
officecli add report.pptx '/slide[1]' --type shape \
  --prop text="Revenue: $4.2M" --prop x=2cm --prop y=5cm --prop size=28

# 3. 验证
officecli view report.pptx outline
officecli validate report.pptx

# 4. 修复问题
officecli view report.pptx issues --json
```

### 模板合并

```bash
# 模板合并 — 填充 {{key}} 占位符
officecli merge invoice-template.docx out-001.docx '{"client":"Acme","total":"$5,200"}'
```

### 批量操作

```bash
# Batch 模式 — 原子级多命令执行
echo '[{"command":"set","path":"/slide[1]/shape[1]","props":{"text":"Hello"}},
      {"command":"set","path":"/slide[1]/shape[2]","props":{"fill":"FF0000"}}]' \
  | officecli batch deck.pptx --json
```

### MCP Server 集成

```bash
# 注册 MCP Server
officecli mcp claude       # Claude Code
officecli mcp cursor       # Cursor
officecli mcp vscode       # VS Code / Copilot
```

## 核心特性

- **AI 原生 CLI + JSON**：确定性 JSON 输出，无需正则解析
- **路径寻址**：稳定路径访问元素（`/slide[1]/shape[2]`）
- **渐进复杂度**：L1 → L2 → L3，Agent 从只读视图逐步深入
- **自我修复**：结构化错误码 + 建议，Agent 无需人工干预
- **内置渲染引擎**：`view html` / `view screenshot` / `watch` 原生输出
- **公式引擎**：150+ Excel 函数写即计算
- **模板合并**：`{{key}}` 占位符，批量生成报告
- **自动安装**：自动检测并配置 AI 工具

## 支持格式

| 格式 | 读取 | 修改 | 创建 |
|------|------|------|------|
| Word (.docx) | ✅ | ✅ | ✅ |
| Excel (.xlsx) | ✅ | ✅ | ✅ |
| PowerPoint (.pptx) | ✅ | ✅ | ✅ |

## 相关链接

- [GitHub 仓库](https://github.com/iOfficeAI/OfficeCLI)
- [官方文档](https://github.com/iOfficeAI/OfficeCLI/wiki)
- [AionUi GUI](https://github.com/iOfficeAI/AionUi)
- [OfficeCLI.AI](https://OfficeCLI.AI)

