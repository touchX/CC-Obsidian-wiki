---
name: ai-tools-system-prompts
description: 50+ AI 编程工具的官方系统提示词集合 — 深入了解各类 AI 开发工具的底层工作机制和提示工程策略
type: source
tags: [ai-tools, system-prompts, claude-code, cursor, cline, codex-cli, gemini-cli, prompt-engineering, llm, coding-assistants, ai-development]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/sources/system-prompts/
github_url: https://github.com/x1xhlol/system-prompts-and-models-of-ai-tools
stars: 0
language: Text
license: GNU GPL v3
---

# AI 工具系统提示词大全

> **50+ AI 编程工具的官方系统提示词集合** — 深入了解各类 AI 开发工具的底层工作机制和提示工程策略

## 基本信息

| 项目 | 信息 |
|------|------|
| **作者** | x1xhlol |
| **语言** | Text (系统提示词) |
| **许可证** | GNU GPL v3 |
| **类型** | 资源集合 |

## 核心价值

### 📚 独特资源

这是目前**最全面的 AI 工具系统提示词集合**，包含：

- **50+ AI 工具**的官方系统提示词
- **工具配置** (Tools.json) 定义
- **多版本模型**提示词对比
- **跨平台**覆盖（桌面、CLI、Web、IDE）

### 🔍 研究价值

系统提示词揭示了每个 AI 工具的：
- **核心能力边界**
- **工作流设计思路**
- **安全约束机制**
- **工具调用策略**
- **用户交互模式**

## 内容分类

### Anthropic / Claude 系列

| 工具 | 文件 | 说明 |
|------|------|------|
| **Claude Code** | `Anthropic/Claude Code/Prompt.txt` | 完整系统提示词 |
| **Claude Sonnet 4** | `Anthropic/Claude Code/claude-sonnet-4.txt` | Sonnet 4 专用提示词 |
| **Claude 3.5 Sonnet** | `Anthropic/Claude Code/claude-3.5-sonnet.txt` | 3.5 Sonnet 版本 |

### Google / Gemini 系列

| 工具 | 文件 | 说明 |
|------|------|------|
| **Gemini Code** | `Google/Gemini Code/Prompt.txt` | Gemini Code 系统 |
| **Gemini CLI** | `Google/Gemini CLI/Prompt.txt` | 命令行工具提示词 |

### 开源工具集合

| 工具 | 目录 | 特点 |
|------|------|------|
| **Cline** | `Open Source prompts/Cline/` | 3,928 行完整系统提示词 + 工具定义 |
| **Codex CLI** | `Open Source prompts/Codex CLI/` | OpenAI Codex 命令行工具 |
| **Aider** | `Open Source prompts/Aider/` | AI 结对编程工具 |
| **Continue** | `Open Source prompts/Continue/` | VSCode AI 助手 |

### 商业工具集合

| 工具 | 目录 | 说明 |
|------|------|------|
| **Cursor** | `Cursor Prompts/` | 多版本 Cursor 系统提示词 |
| **Windsurf** | `Windsurf/` | Windsurf IDE 提示词 |
| **Replit** | `Replit/` | Replit AI 系统 |
| **Xcode** | `Xcode/` | Apple Xcode AI 助手 |
| **VSCode Agent** | `VSCode Agent/` | VSCode AI 编程助手 |

## 项目结构

```
system-prompts-and-models-of-ai-tools/
├── Anthropic/              # Anthropic Claude 系列
│   └── Claude Code/
├── Google/                 # Google Gemini 系列
│   ├── Gemini Code/
│   └── Gemini CLI/
├── Open Source prompts/    # 开源工具
│   ├── Cline/
│   ├── Codex CLI/
│   ├── Aider/
│   └── Continue/
├── Cursor Prompts/         # Cursor IDE
├── Windsurf/               # Windsurf IDE
├── Replit/                 # Replit 平台
├── Xcode/                  # Apple Xcode
├── VSCode Agent/           # VSCode AI
└── LICENSE.md              # GPL-3.0 许可证
```

## 典型文件结构

每个工具目录包含：

```
{tool-name}/
├── Prompt.txt              # 主系统提示词
├── Tools.json              # 工具定义（可选）
├── {model-version}.txt     # 特定模型提示词（可选）
└── Tools/                  # 工具配置（可选）
    ├── {tool-name}.json
    └── ...
```

## 使用场景

### 📖 学习 AI 工具设计

研究不同工具的：
- 系统提示词结构和模式
- 工具定义和权限设计
- 安全约束和边界控制
- 用户交互策略

### 🔧 提示工程参考

借鉴成熟工具的：
- 提示词组织方式
- 指令设计模式
- 思维链引导技巧
- 工具调用策略

### ⚖️ 对比分析

对比不同工具的：
- 能力边界设定
- 安全约束强度
- 工具生态集成
- 用户引导方式

## 许可证说明

**GNU GPL v3** — Share-Alike

✅ **允许**:
- 学习和研究
- 修改和改进
- 分享衍生作品

⚠️ **要求**:
- 衍生作品必须使用相同许可证 (GPL v3)
- 保留原始版权声明
- 提供源代码

## 相关链接

| 链接 | 说明 |
|------|------|
| [GitHub 仓库](https://github.com/x1xhlol/system-prompts-and-models-of-ai-tools) | 源仓库 |
| [GNU GPL v3](https://www.gnu.org/licenses/gpl-3.0.html) | 许可证全文 |

## 亮点特性

1. **独特资源** — 全球最全面的 AI 工具系统提示词集合
2. **深度洞察** — 理解 AI 工具的底层工作机制
3. **对比研究** — 50+ 工具横向对比分析
4. **实用参考** — 提示工程最佳实践案例库
5. **开源共享** — GPL v3 保证知识自由传播

## 标签

#ai-tools #system-prompts #claude-code #cursor #cline #codex-cli #gemini-cli #prompt-engineering #llm #coding-assistants #ai-development

---

*收集时间：2026-04-29*
