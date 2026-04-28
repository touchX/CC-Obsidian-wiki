---
name: safishamsi-graphify
description: AI coding assistant skill — 将代码、文档、图片、视频转化为可查询的知识图谱
type: source
version: 2.0
tags: [github, python, claude-code, graphrag, knowledge-graph, skills, codex, gemini, openclaw]
created: 2026-04-03
updated: 2026-04-28
source: ../../../../archive/resources/github/safishamsi-graphify-2026-04-28.json
stars: 36616
forks: 4062
language: Python
license: MIT
github_url: https://github.com/safishamsi/graphify
homepage: https://graphifylabs.ai/
docs_url: https://github.com/safishamsi/graphify/blob/main/README.md
---

# Graphify

An AI coding assistant skill — 将代码、文档、图片、视频转化为可查询的知识图谱

## 项目快照

| 字段 | 值 |
|------|-----|
| 作者 | [safishamsi](https://github.com/safishamsi) |
| 语言 | Python |
| Stars | ![36616](https://img.shields.io/github/stars/safishamsi/graphify) |
| Forks | ![4062](https://img.shields.io/github/forks/safishamsi/graphify) |
| 许可证 | MIT |
| 主题 | `graphrag` `knowledge-graph` `claude-code` `skills` |
| 创建时间 | 2026-04-03 |
| 最后更新 | 2026-04-28 |
| 默认分支 | v5 |
| 开放 Issues | 190 |

## 项目介绍

Graphify 是一个 AI 编码助手技能，在 Claude Code、Codex、OpenCode、Cursor、Gemini CLI、GitHub Copilot CLI、VS Code Copilot Chat、Aider、OpenClaw、Factory Droid、Trae、Hermes、Kiro 或 Google Antigravity 中输入 `/graphify`，它会读取你的文件，构建知识图谱，并返回你不知道存在的结构。更快地理解代码库。找到架构决策背后的"为什么"。

**完全多模态**。支持代码、PDF、Markdown、截图、图表、白板照片、其他语言的图片、视频和音频文件 — graphify 从中提取概念和关系，并将它们连接成一个图谱。

> Andrej Karpathy 保留了一个 `/raw` 文件夹，用于存放论文、推文、截图和笔记。graphify 就是这个问题的答案 — 每个查询的 token 减少 71.5 倍，会话间持久化，对找到的内容和猜测的内容保持诚实。

```
/graphify .                        # 适用于任何文件夹 — 代码库、笔记、论文
```

输出：
```
graphify-out/
├── graph.html       交互式图谱 — 在浏览器中打开，点击节点，搜索，按社区过滤
├── GRAPH_REPORT.md  上帝节点、令人惊讶的连接、建议的问题
├── graph.json       持久化图谱 — 几周后查询无需重新阅读
└── cache/           SHA256 缓存 — 重新运行仅处理更改的文件
```

## 工作原理

graphify 运行三个阶段：
1. **AST 阶段** — 使用 tree-sitter 从代码文件中提取结构（类、函数、导入、调用图、文档字符串、理由注释），无需 LLM
2. **转录阶段** — 使用 faster-whisper 本地转录视频和音频（需要 `pip install graphifyy[video]`）
3. **提取阶段** — Claude 子代理并行处理文档、论文、图片和转录稿，提取概念、关系和设计理由

结果合并到 NetworkX 图中，使用 Leiden 社区检测进行聚类，并导出为交互式 HTML、可查询 JSON 和自然语言审计报告。

**聚类是基于图拓扑的 — 无需嵌入**。Leiden 通过边密度找到社区。Claude 提取的语义相似边（标记为 INFERRED）已经在图中，因此它们直接影响社区检测。

## 核心特性

- **多语言支持** — 25 种语言通过 tree-sitter AST（Python、JS、TS、Go、Rust、Java、C、C++、Ruby、C#、Kotlin、Scala、PHP、Swift、Lua、Zig、PowerShell、Elixir、Objective-C、Julia、Verilog、SystemVerilog、Vue、Svelte、Dart）
- **多模态输入** — 代码、PDF、Markdown、图片、视频、音频
- **无嵌入聚类** — 基于图拓扑的 Leiden 社区检测
- **自信评分** — 每个 INFERRED 边都有 0.0-1.0 的置信度分数
- **理由提取** — 从文档字符串、内联注释中提取设计理由
- **跨平台支持** — Claude Code、Codex、OpenCode、Cursor、Gemini CLI、Copilot CLI、VS Code、Aider、OpenClaw、Factory Droid、Trae、Hermes、Kiro、Google Antigravity

## 帮助文档

### 官方文档

| 目录 | 内容 |
|------|------|
| [README.md](./README.md) | 完整使用指南（多语言） |
| [docs/translations/](https://github.com/safishamsi/graphify/tree/main/docs/translations) | 25+ 语言翻译文档 |
| [ARCHITECTURE.md](https://github.com/safishamsi/graphify/blob/main/ARCHITECTURE.md) | 架构设计文档 |
| [CHANGELOG.md](https://github.com/safishamsi/graphify/blob/main/CHANGELOG.md) | 版本变更记录 |

### 多语言文档

Graphify 提供 25+ 语言翻译的 README：
- 🇨🇳 简体中文 | 🇯🇵 日本語 | 🇰🇷 한국어 | 🇩🇪 Deutsch | 🇫🇷 Français
- 🇪🇸 Español | 🇮🇳 हिन्दी | 🇧🇷 Português | 🇷🇺 Русский | 🇸🇦 العربية
- 🇮🇹 Italiano | 🇵🇱 Polski | 🇳🇱 Nederlands | 🇹🇷 Türkçe | 🇺🇦 Українська
- 🇻🇳 Tiếng Việt | 🇮🇩 Bahasa Indonesia | 🇸🇪 Svenska | 🇬🇷 Ελληνικά | 🇷🇴 Română
- 🇨🇿 Čeština | 🇫🇮 Suomi | 🇩🇰 Dansk | 🇳🇴 Norsk | 🇭🇺 Magyar
- 🇹🇭 ภาษาไทย | 🇹🇼 繁體中文

### 贡献指南

项目包含详细的贡献文档：
- [ARCHITECTURE.md](https://github.com/safishamsi/graphify/blob/main/ARCHITECTURE.md) — 模块职责和添加语言的方法
- [CHANGELOG.md](https://github.com/safishamsi/graphify/blob/main/CHANGELOG.md) — 版本历史
- [SECURITY.md](https://github.com/safishamsi/graphify/blob/main/SECURITY.md) — 安全政策

## 链接

- **GitHub**: https://github.com/safishamsi/graphify
- **文档**: https://github.com/safishamsi/graphify/blob/main/README.md
- **官网**: https://graphifylabs.ai/
- **PyPI**: https://pypi.org/project/graphifyy/
- **Issue**: https://github.com/safishamsi/graphify/issues
- **讨论**: https://github.com/safishamsi/graphify/discussions

## 安装与使用

### 基本安装

```bash
# 推荐方式 — Mac 和 Linux 无需 PATH 设置
uv tool install graphifyy && graphify install

# 或使用 pipx
pipx install graphifyy && graphify install

# 或使用 pip
pip install graphifyy && graphify install
```

> **PyPI 包名**：`graphifyy`（双 y）。其他名为 `graphify*` 的 PyPI 包与此项目无关。

### 平台安装

| 平台 | 命令 |
|------|------|
| Claude Code | `graphify install` |
| Codex | `graphify install --platform codex` |
| OpenCode | `graphify install --platform opencode` |
| GitHub Copilot CLI | `graphify install --platform copilot` |
| VS Code Copilot Chat | `graphify vscode install` |
| Aider | `graphify install --platform aider` |
| OpenClaw | `graphify install --platform claw` |
| Factory Droid | `graphify install --platform droid` |
| Trae | `graphify install --platform trae` |
| Gemini CLI | `graphify install --platform gemini` |
| Cursor | `graphify cursor install` |
| Google Antigravity | `graphify antigravity install` |

### 使用方法

```bash
/graphify                          # 在当前目录运行
/graphify ./raw                    # 在特定文件夹运行
/graphify ./raw --mode deep        # 更积极地提取 INFERRED 边
/graphify ./raw --update           # 仅重新提取更改的文件，合并到现有图谱
/graphify ./raw --directed          # 构建有向图（保留边方向）
/graphify ./raw --watch            # 自动同步文件更改时的图谱

# 查询和导航图谱
/graphify query "what connects attention to the optimizer?"
/graphify path "DigestAuth" "Response"
/graphify explain "SwinTransformer"

# 从终端查询
graphify query "what connects attention to the optimizer?" --graph graphify-out/graph.json

# 克隆 GitHub 仓库并运行
graphify clone https://github.com/karpathy/nanoGPT

# 合并多个图谱
graphify merge-graphs repo1/graphify-out/graph.json repo2/graphify-out/graph.json
```

### MCP 服务器

```bash
# 启动 MCP 服务器
python -m graphify.serve graphify-out/graph.json

# WSL/Linux 注意
python3 -m venv .venv && .venv/bin/pip install "graphifyy[mcp]"
```

在 `.mcp.json` 中配置：
```json
{
  "mcpServers": {
    "graphify": {
      "type": "stdio",
      "command": ".venv/bin/python3",
      "args": ["-m", "graphify.serve", "graphify-out/graph.json"]
    }
  }
}
```

### 视频/音频支持

```bash
pip install 'graphifyy[video]'   # 一次性设置
/graphify ./my-corpus            # 转录任何视频/音频文件

# 指定 Whisper 模型
graphify ./my-corpus --whisper-model medium
```

## 最新版本

- **稳定版**: v0.5.2 (2026-04-27)

### v0.5.2 更新

- **Claude Code v2.1.117+ Hook 修复** — PreToolUse hook 现在匹配 `Bash` 而不是 `Glob|Grep`
- Claude Code v2.1.117 移除了专用的 Grep/Glob 工具，搜索现在通过 Bash 进行
- Hook 检查命令字符串，仅在搜索类调用（grep、rg、find、fd 等）时触发

### v0.5.1 更新

- **节点 ID 冲突修复** — 不同目录中的同名文件（如两个 `utils.py`）现在通过前缀父目录名获得唯一 ID
- **可移植 `source_file` 路径** — `extract()` 现在在返回前将所有 `source_file` 字段相对化
- **去同步保护** — `to_json()` 返回布尔值；`graphify update` 仅在 JSON 写入成功时写入报告
- **TypeScript 路径别名** — `@/` 和其他 `tsconfig.json` 中的 `compilerOptions.paths` 别名现在解析为真实文件节点

### v0.5.0 更新

- **`graphify clone <github-url>`** — 克隆任何公共 GitHub 仓库并运行完整流程
- **`graphify merge-graphs`** — 将两个或多个 `graph.json` 输出合并为一个跨仓库图谱
- **`CLAUDE_CONFIG_DIR` 支持** — `graphify install` 现在尊重 `CLAUDE_CONFIG_DIR` 环境变量
- **Shrink Guard** — `to_json()` 拒绝用更小的图谱覆盖 `graph.json`
- **`build_merge()`** — 新的安全增量更新库函数

## 团队工作流程

`graphify-out/` 设计为提交到 git，以便每个队友从新鲜的地图开始。

1. 一个人运行 `/graphify .` 构建初始图谱并提交 `graphify-out/`
2. 其他所有人拉取 — 他们的助手立即读取 `GRAPH_REPORT.md`
3. 安装 post-commit hook (`graphify hook install`) 以便代码更改后自动重建图谱

**.gitignore 建议：**
```
# 可选：提交以共享提取速度
graphify-out/cache/

# mtime-based, git clone 后无效
graphify-out/manifest.json

# 本地 token 跟踪
graphify-out/cost.json
```

## 隐私

graphify 将文件内容发送到你的 AI 编码助手的底层模型 API 进行语义提取 — Anthropic (Claude Code)、OpenAI (Codex) 或你的平台使用的提供商。代码文件通过 tree-sitter AST 在本地处理。视频和音频通过 faster-whisper 在本地转录。无需遥测、用法跟踪或分析。

## 技术栈

NetworkX + Leiden (graspologic) + tree-sitter + vis.js。语义提取通过 Claude (Claude Code)、GPT-4 (Codex) 或你的平台运行的模型。视频转录通过 faster-whisper + yt-dlp（可选）。

## 构建于 Graphify 之上的产品

[**Penpax**](https://safishamsi.github.io/penpax.ai) 是 graphify 之上的企业层。将 graphify 应用于你的整个工作生活。

| | graphify | Penpax |
|---|---|---|
| 输入 | 一文件夹文件 | 浏览器历史、会议、邮件、文件、代码 — 一切 |
| 运行 | 按需 | 持续在后台运行 |
| 范围 | 一个项目 | 你的整个工作生活 |
| 查询 | CLI / MCP / AI skill | 自然语言，始终开启 |
| 隐私 | 默认本地 | 完全设备上，无云 |

## 标签

`python` `github` `source` `graphrag` `knowledge-graph` `claude-code` `skills` `codex` `gemini` `openclaw`

## 相关资源

<!-- Dataview 自动填充 -->