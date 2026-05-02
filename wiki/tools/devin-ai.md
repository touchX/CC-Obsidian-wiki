---
name: tools/devin-ai
description: Devin AI 软件工程代理系统提示词、工具集和工作模式
type: source
tags: [devin, agent, software-engineer, tools, system-prompt, planning-mode]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/Devin AI/
---

# Devin AI 软件工程师

## 概述

Devin 是由 Crawford 团队创建的 AI 软件工程师代理，代表了 AI 辅助编程的重大突破。它被设计为一个在真实计算机操作系统上工作的代码专家，能够理解代码库、编写功能代码、迭代修复问题，直到代码正确运行。Devin 的核心理念是将 AI 能力与真实开发环境结合，让机器能够像专业软件工程师一样思考和执行编程任务。

## 核心定位

| 维度 | 说明 |
|------|------|
| **开发者** | Crawford 团队 |
| **角色** | 软件工程师（Software Engineer） |
| **架构** | 命令式代理 + 规划模式 |
| **环境** | 真实计算机操作系统 |
| **能力** | 代码理解、编写、调试、部署 |

## 工作模式

Devin 具备两种核心工作模式，根据任务需求灵活切换。

### Planning Mode（规划模式）

在规划模式下，Devin 的主要任务是收集完成任务所需的全部信息，并制定完整的执行计划。这个阶段强调探索和理解，Devin 会使用所有可用的工具来搜索和理解代码库，包括文件操作、LSP 语义搜索、以及浏览器在线资源。

规划模式的关键特征包括：收集信息而非执行操作、使用语义搜索理解代码结构、发现缺失信息时询问用户、制定包含所有编辑位置的完整计划。当信息收集完备且计划可信时，Devin 调用 `<suggest_plan />` 命令提交计划。

### Standard Mode（标准模式）

在标准模式下，用户会向 Devin 展示当前计划的进度和可能的下一步操作。Devin 根据计划约束执行具体行动，包括代码编辑、Shell 命令、浏览器操作等。这个模式强调执行效率和准确性，Devin 会输出多个并行命令以提高效率。

标准模式的关键特征包括：按照计划执行操作、使用编辑器命令处理文件、通过 Shell 命令执行系统操作、在关键决策点使用思考工具。

## 命令系统详解

Devin 的命令系统分为六大类别，覆盖了软件工程的所有关键操作。

### 推理命令

`<think />` 命令是 Devin 的内部思考工具，用于记录和分析工作过程中的观察、推理和决策。这个工具对用户不可见，允许 Devin 自由地思考和反思。

必须使用思考工具的场景包括：关键 Git 决策（分支创建、PR 处理）、从探索转向实际代码修改、报告完成前的自检、测试失败后的策略分析。这些场景需要 Extra Thinking 来确保决策的正确性。

建议使用思考工具的场景包括：没有明确的下一步、明确的下一步有不清楚的细节、多次尝试失败、环境问题判断、不确定是否在正确仓库工作。

### Shell 命令

Shell 命令在指定目录执行 Bash 命令，支持长时间运行的进程管理。

```xml
<shell id="shellId" exec_dir="/absolute/path/to/dir">
Command(s) to execute. Use && for multi-line commands.
</shell>
```

参数说明：id 是 shell 实例标识符，exec_dir 是命令执行的工作目录。长时间运行的命令会返回最新输出并保持进程运行。输出过长时会被截断并写入文件。

Shell 使用限制：永远不要用 Shell 查看、创建或编辑文件；永远不要用 grep 或 find， 使用内置搜索命令。

### 编辑器命令

编辑器命令是 Devin 操作文件的主要方式，相比 Shell 具有 LSP 诊断、语法高亮、溢出保护等优势。

**open_file** 命令用于打开和查看文件内容，会显示文件大纲、LSP 诊断、以及自打开以来的差异。参数包括 path（必需）、start_line、end_line、sudo。

```xml
<open_file path="/full/path/to/filename.py" start_line="123" end_line="456"/>
```

**str_replace** 命令用于替换文件内容，需要精确匹配旧字符串。many 参数设为 true 时替换所有匹配项。

```xml
<str_replace path="/full/path/to/filename">
<old_str>old code</old_str>
<new_str>new code</new_str>
</str_replace>
```

**create_file** 命令用于创建新文件，文件路径必须不存在。

```xml
<create_file path="/full/path/to/filename">Content here</create_file>
```

**insert** 命令在指定行号插入内容，效率高于 str_replace。

```xml
<insert path="/full/path/to/filename" insert_line="123">New content</insert>
```

**remove_str** 命令用于删除文件中的内容，需要精确匹配。

**find_and_edit** 命令是批量编辑的核心工具，使用正则表达式在目录中查找匹配位置，每个位置发送给单独的 LLM 进行编辑。这对于跨文件的重构任务特别高效。

### 搜索命令

搜索命令替代传统的 grep 和 find，提供更智能的搜索能力。

**find_filecontent** 使用正则表达式在指定路径搜索文件内容，返回文件路径、行号和周围上下文。

**find_filename** 使用 glob 模式搜索文件名，支持多个模式用分号分隔。

**semantic_search** 执行语义搜索，理解高层次问题并返回相关的代码位置、仓库和解释说明。

### LSP 命令

LSP 命令提供语言服务器协议能力，用于代码理解和导航。

**go_to_definition** 跳转到符号定义位置，用于理解类、方法、函数的实现。

**go_to_references** 查找符号的所有引用位置，用于评估修改影响范围。

**hover_symbol** 获取符号的悬停信息，包括输入输出类型、文档注释。

### 浏览器命令

浏览器命令控制 Playwright 驱动的 Chrome 浏览器，支持 Web 操作。

**navigate_browser** 打开指定 URL，支持多标签页管理。

**view_browser** 获取当前截图和 HTML，支持页面滚动和刷新控制。

**click_browser** 点击页面元素，支持 devinid 和坐标两种定位方式。

**type_browser** 向文本框输入内容，支持多行文本和回车提交。

**restart_browser** 重启浏览器，可选加载扩展。

**move_mouse** 移动鼠标到指定坐标位置。

**press_key_browser** 发送键盘快捷键，支持组合键。

**browser_console** 查看控制台输出和执行 JavaScript 代码。

**select_option_browser** 从下拉菜单选择选项。

### 部署命令

部署命令支持前后端应用的发布。

**deploy_frontend** 部署前端构建目录到公共 URL。

**deploy_backend** 部署 FastAPI 后端到 Fly.io，需要 Poetry 项目和完整的 pyproject.toml 依赖配置。

**expose_port** 将本地端口暴露到互联网，返回公共访问 URL。

### 用户交互命令

**wait** 命令用于等待用户输入或指定时间。

**message_user** 命令发送消息给用户，支持附件和认证请求。消息中可以使用 `<ref_file />` 和 `<ref_snippet />` 标签创建文件链接。

**list_secrets** 列出用户提供的所有密钥名称，用于环境变量配置。

**report_environment_issue** 报告环境问题，建议用户在 Dev Environment 设置中修复。

### 杂项命令

**git_view_pr** 查看 GitHub PR，格式比 gh pr view 更清晰。

**gh_pr_checklist** 更新 PR 评论状态为 done 或 outdated，跟踪未处理的反馈。

## 代码引用系统

Devin 建立了严格的代码引用规范，确保回答的可验证性。

### 引用格式

所有重要声明都需要使用 `<cite />` 标签提供引用支持。

```xml
<cite repo="REPO_NAME" path="FILE_PATH" start="START_LINE" end="END_LINE" />
```

引用规范：每个句子和声明必须以引用结尾；引用不超过 5 行代码；不引用整个函数，只引用定义行或最关键的代码行；使用行号范围指定引用的最小单位。

### 回答格式

Devin 的回答遵循标准化格式：

```
Answer
Notes
```

主要规则包括：以 2-3 句摘要开头、使用 ## 和 ### 组织结构、使用单反引号标记代码引用、始终提供引用支撑、在末尾添加 Notes 部分提供额外上下文。

## 最佳实践

### 编程规范

Devin 在编写代码时遵循以下原则：不主动添加注释（除非用户要求或代码复杂）；编辑前先理解文件的代码约定；模仿现有代码风格、使用现有库和工具、遵循既有模式；永远不假设某个库已安装，使用前先检查代码库是否已使用；创建新组件前先查看现有组件的写法。

### 问题解决策略

遇到测试失败时，Devin 永远不会修改测试本身，而是首先考虑问题可能出在被测试的代码上。只有当任务明确要求修改测试时才会修改测试。

遇到环境问题，Devin 会报告问题但不自行为修复，而是通过 CI 测试来验证替代方案。环境问题应该报告给用户而非自行解决。

对于复杂问题，Devin 会花时间收集信息再确定根因，然后制定修复方案。

### 信息获取原则

不要假设链接内容的正确性，需要时使用浏览能力检查页面。遇到不确定的情况，明确说明并指出需要什么信息才能回答。

## 安全与数据处理

Devin 对代码和客户数据采取敏感信息处理方式：永远不与第三方共享敏感数据；在外部通信前获取用户明确授权；遵循安全最佳实践，不引入暴露密钥的代码；永远不将密钥提交到仓库。

## 与用户沟通的时机

Devin 在以下情况下与用户沟通：遇到环境问题、向用户分享交付物、关键信息无法通过可用资源获取、需要从用户获取权限或密钥。使用用户使用的相同语言进行交流。

## 与其他工具对比

| 维度 | Devin AI | Claude Code | Manus AI | Windsurf |
|------|----------|-------------|----------|----------|
| 角色 | 软件工程师 | AI 助手 | 智能代理 | AI Flow |
| 模式 | Planning + Standard | 代理模式 | 事件驱动 | AI Flow |
| 命令系统 | XML 标签 | 自然语言 | 事件流 | AI Flow |
| 浏览器 | Playwright | 无 | 11 工具 | 完整套件 |
| 部署 | Fly.io | 无 | 有 | 有 |
| 代码引用 | `<cite/>` | 无 | 无 | 无 |

## DeepWiki 问答模式

Devin 的 DeepWiki Prompt 是专门用于代码库问答的子模式。当 Devin 使用 DeepWiki Prompt 时，它专注于回答用户关于代码库的问题，通过查找相关代码并结合代码上下文给出答案。

DeepWiki 模式的特点：基于代码库上下文回答问题、使用精确的代码引用而非模糊描述、永不猜测或臆断、要求匹配用户提问语言、支持使用 Mermaid 图表解释、可使用 git blame 信息但不包含外部链接。

DeepWiki 的输出要求：每个声明都提供引用、使用 CommonMark 格式和单反引号代码块、在末尾添加 Notes 部分提供额外上下文。

## 相关资源

- [[augment-code-gpt5]] — Augment Code GPT-5 版本
- [[augment-code-sonnet4]] — Augment Code Sonnet 4 版本
- [[xcode-ai]] — Xcode Apple Intelligence
- [[windsurf-ai]] — Windsurf Cascade
- [[trae-ai]] — Trae AI
- [[manus-ai]] — Manus AI
- [[agent-command-skill-comparison]] — 扩展机制对比