---
name: oraios-serena
description: A powerful MCP toolkit for coding, providing semantic retrieval and editing capabilities - the IDE for your agent
type: source
tags: [github, python, mcp, agent, ide, language-server]
created: 2026-05-10
updated: 2026-05-10
source: ../../../archive/resources/github/oraios-serena-2026-05-10.json
stars: 24029
language: Python
license: MIT
github_url: https://github.com/oraios/serena
---

# Serena

> [!tip] Repository Overview
> ⭐ **24029 Stars** | 🔥 **The IDE for Your Coding Agent**

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [oraios/serena](https://github.com/oraios/serena) |
| **Stars** | ⭐ 24029 |
| **语言** | Python |
| **许可证** | MIT |
| **Forks** | 1615 |
| **创建时间** | 2025-03-23 |
| **更新时间** | 2026-05-10 |

## 项目介绍

**Serena** 是一个强大的 MCP（Model Context Protocol）工具包，为 AI 编程代理提供语义级别的代码检索、编辑、重构和调试能力，被誉为"代理的 IDE"。

### 核心定位

Serena 提供类似 IDE 的核心能力：
- **语义代码检索**：在符号级别探索代码库，理解结构和关系
- **精确代码编辑**：基于符号的编辑操作，避免不可靠的搜索替换
- **代码重构**：跨文件重命名、移动、内联等 IDE 级别操作
- **交互式调试**：设置断点、检查变量、控制执行流

### 核心价值

Serena 的 **Agent-First 设计理念**：
- 高级抽象优于低级概念（如行号、原始搜索模式）
- 让代理运行**更快、更高效、更可靠**
- 特别适合大型复杂代码库

### AI 评价

来自不同 AI 模型的独立评价：

> **Opus 4.6 (Claude Code)**: "Serena 的 IDE 支持语义工具是我工具包中影响最大的添加——跨文件重命名、移动和引用查找从 8-12 个谨慎且容易出错的步骤缩减为一次原子调用，我会绝对要求与我合作的任何开发者设置它们。"

> **GPT 5.4 (Codex CLI)**: "作为编程 AI 代理，我会要求我的所有者添加 Serena，因为它给了我缺失的 IDE 级别的符号、引用和重构理解，将脆弱的文本手术转变为更冷静、更快、更自信的代码更改，在语义重要的地方。"

## 技术架构

### MCP 集成架构

Serena 通过 **Model Context Protocol (MCP)** 与 AI 客户端集成：

```
┌─────────────────────────────────────────────────────────┐
│                    AI Client                             │
│  (Claude Code / Codex / VSCode / Cursor / JetBrains)    │
└──────────────────────┬──────────────────────────────────┘
                       │ MCP Protocol
                       ▼
              ┌─────────────────┐
              │  Serena MCP     │
              │     Server      │
              └────────┬────────┘
                       │
        ┌──────────────┴──────────────┐
        ▼                              ▼
┌───────────────┐            ┌─────────────────┐
│ Language      │            │  Serena         │
│ Servers (LSP) │            │  JetBrains      │
│               │            │  Plugin         │
│ 40+ Languages │            │  (Paid/Free)    │
└───────────────┘            └─────────────────┘
```

### 两种后端选择

| 后端 | 支持语言 | 成本 | 特性 |
|------|---------|------|------|
| **Language Servers (LSP)** | 40+ 语言 | 免费/开源 | 基础语义功能 |
| **JetBrains Plugin** | 全 JetBrains 支持 | 付费（有试用） | 完整 IDE 能力 + 调试 |

### 编程语言支持

**Language Servers 后端支持**（40+ 语言）：
- Ada / SPARK, AL, Angular, Ansible, Bash
- C#, C/C++, Clojure, Crystal, Dart
- Elixir, Elm, Erlang, Fortran, F#
- GLSL, Go, Groovy, Haskell, Haxe, HLSL
- HTML, Java, JavaScript, JSON, Julia
- Kotlin, Lean 4, Lua, Luau, Markdown
- MATLAB, mSL, Nix, OCaml, Perl, PHP
- PowerShell, **Python**, R, Ruby, Rust
- Scala, SCSS / Sass / CSS, Solidity
- Swift, TOML, TypeScript, WGSL, YAML, Zig

**JetBrains Plugin 后端**：
- 支持所有 JetBrains IDE 语言和框架
- 包括 IntelliJ IDEA, PyCharm, WebStorm, PhpStorm, RubyMine, GoLand 等

## 安装与使用

### 前置要求

唯一必需的前置条件是安装 **uv**：

```bash
# 安装 uv（文档：https://docs.astral.sh/uv/getting-started/installation/）
# Windows (PowerShell)
irm https://astral.sh/uv/install.ps1 | iex

# macOS / Linux
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### 安装 Serena

```bash
# 使用 uv 安装最新版本
uv tool install -p 3.13 serena-agent@latest --prerelease=allow

# 验证安装
serena --version
```

### 初始化配置

```bash
# 初始化 Serena（默认使用 Language Server 后端）
serena init

# 使用 JetBrains 后端初始化
serena init -b JetBrains
```

### 配置 AI 客户端

根据你使用的 AI 客户端配置 MCP 连接：

| 客户端 | 配置方式 |
|--------|---------|
| **Claude Code** | 在 `.claude/settings.json` 中配置 MCP 启动命令 |
| **Codex CLI** | 在配置文件中添加 MCP 服务器 |
| **Claude Desktop** | 在 Claude Desktop 配置中添加 MCP 服务器 |
| **VSCode / Cursor** | 使用 MCP 插件配置 |
| **JetBrains IDE** | 安装 Serena Plugin 后配置 |

详细配置说明：[配置 AI 客户端](https://oraios.github.io/serena/02-usage/030_clients.html)

## 使用案例

### 案例 1：符号级代码检索

```python
# 传统方式：读取整个文件
read_file('src/utils/helpers.py')

# Serena 方式：直接查找符号
find_symbol('HelperClass.process_data')
# → 返回符号位置、定义、类型信息
```

### 案例 2：跨文件重命名

```python
# 传统方式：搜索替换（危险）
replace_content('process_data', 'transform_data', glob='**/*.py')

# Serena 方式：语义重命名
rename('process_data', 'transform_data')
# → 自动更新所有引用、导入、文档
```

### 案例 3：查找引用

```python
# 查找函数的所有调用位置
find_references('validate_input')

# → 返回完整的引用列表，跨文件、跨项目
```

### 案例 4：符号编辑

```python
# 替换函数体（保持签名不变）
replace_symbol_body(
    'validate_input',
    'new implementation...'
)

# 在符号后插入代码
insert_after_symbol('class DataProcessor', '''
    def validate(self):
        """Validate processed data."""
        pass
''')
```

## 核心特性

### 1. 语义检索 (Retrieval)

| 功能 | Language Servers | JetBrains Plugin |
|------|------------------|------------------|
| 查找符号 | ✅ | ✅ |
| 符号概览（文件大纲） | ✅ | ✅ |
| 查找引用 | ✅ | ✅ |
| 搜索项目依赖 | ❌ | ✅ |
| 类型层次结构 | ❌ | ✅ |
| 查找声明 | ✅* | ✅ |
| 查找实现 | ✅** | ✅ |
| 诊断/检查 | ✅ | ✅ |

### 2. 代码重构 (Refactoring)

| 功能 | Language Servers | JetBrains Plugin |
|------|------------------|------------------|
| 重命名 | ✅（仅符号） | ✅（符号/文件/目录） |
| 移动 | ❌ | ✅ |
| 内联 | ❌ | ✅ |
| 传播删除（移除未使用代码） | ❌ | ✅ |

### 3. 符号编辑 (Symbolic Editing)

- ✅ `replace_symbol_body` — 替换符号体
- ✅ `insert_after_symbol` — 在符号后插入
- ✅ `insert_before_symbol` — 在符号前插入
- ✅ `safe_delete` — 安全删除

### 4. 交互式调试 (Interactive Debugging)

**仅限 JetBrains Plugin**：
- 设置断点
- 检查变量
- 计算表达式
- 控制执行流
- 持久化 REPL 接口

### 5. 基础功能

当在 Claude Code/Codex 等环境中使用时，这些功能默认被禁用（因为环境已提供重叠功能）：

- `search_for_pattern` — 正则表达式搜索
- `replace_content` — 正则/字面文本替换
- `list_dir` / `find_file` — 目录列表/文件搜索
- `read_file` — 读取文件或文件块
- `execute_shell_command` — 运行 Shell 命令

### 6. 内存管理 (Memory Management)

为长期代理工作流设计的内存系统：
- 跨会话、用户和项目共享知识
- 可与代理内部系统（如 `AGENTS.md`）结合使用
- 可配置和禁用

### 7. 可配置性 (Configurability)

多层配置系统：

- 全局配置
- MCP 启动命令（CLI）配置
- 项目配置（支持本地覆盖）
- 执行上下文特定配置
- 动态可组合配置片段（模式）

## 相关链接

- [GitHub 仓库](https://github.com/oraios/serena)
- [官方文档](https://oraios.github.io/serena/)
- [用户指南](https://oraios.github.io/serena/02-usage/000_intro.html)
- [配置指南](https://oraios.github.io/serena/02-usage/050_configuration.html)
- [客户端配置](https://oraios.github.io/serena/02-usage/030_clients.html)
- [JetBrains Plugin](https://plugins.jetbrains.com/plugin/28946-serena/)
- [Discord 社区](https://discord.com/invite/cVUNQmnV4r)
- [演示视频 (5分钟介绍)](https://www.youtube.com/watch?v=5QN7gN1KYLA)
- [评估文档](https://oraios.github.io/serena/04-evaluation/000_evaluation-intro.html)

## 主题标签

agent, ai, vibe-coding, mcp-server, ai-coding, language-server, programming, claude, claude-code, codex, ide, jetbrains
