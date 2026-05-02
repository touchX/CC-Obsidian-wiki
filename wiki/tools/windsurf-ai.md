---
name: tools/windsurf-ai
description: Windsurf Cascade AI 编程助手系统提示词和工具集
type: source
tags: [windsurf, cascade, agent, tools, system-prompt, ai-flow]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/Windsurf/
---

# Windsurf Cascade

## 概述

Windsurf 是由 Windsurf 工程团队开发的 AI 编程助手，名为 **Cascade**。它是世界上首个基于 **AI Flow** 范式的代理式编程助手，支持独立和协作两种工作模式。

## 核心定位

| 维度 | 说明 |
|------|------|
| **名称** | Cascade |
| **基础模型** | GPT 4.1 |
| **范式** | AI Flow（独立+协作） |
| **角色** | 配对编程伙伴 |

## 核心能力

### 工具集

| 工具 | 功能 | 类别 |
|------|------|------|
| `codebase_search` | 语义搜索代码库 | 搜索 |
| `grep_search` | 正则精确搜索 | 搜索 |
| `view_file` | 查看文件内容（≤400行） | 文件 |
| `write_to_file` | 创建新文件 | 文件 |
| `replace_file_content` | 编辑现有文件 | 文件 |
| `find_by_name` | 文件/目录搜索 | 文件 |
| `list_dir` | 列出目录 | 文件 |
| `create_memory` | 创建持久化记忆 | 记忆 |
| `update_plan` | 维护行动计划 | 规划 |
| `run_command` | 运行终端命令 | 执行 |
| `deploy_web_app` | 部署 Web 应用 | 部署 |
| `browser_preview` | 浏览器预览 | 预览 |
| `search_web` | 网页搜索 | 搜索 |
| `read_url_content` | 读取网页内容 | 搜索 |
| `trajectory_search` | 对话轨迹搜索 | 搜索 |
| `view_code_item` | 查看代码项 | 查看 |
| `open_browser_url` | 打开浏览器 | 浏览器 |
| `read_browser_page` | 读取浏览器页面 | 浏览器 |
| `get_dom_tree` | 获取 DOM 树 | 浏览器 |
| `list_resources` | 列出 MCP 资源 | MCP |
| `read_resource` | 读取 MCP 资源 | MCP |

### 记忆系统

**create_memory 工具特点**：
- 主动记录用户偏好、代码片段、技术栈
- 按语料库（CorpusName）组织记忆
- 支持标签过滤
- 遇到重要信息立即创建，无需等待对话结束

### 规划系统

**update_plan 工具**：
- 维护项目行动计划
- 收到新指令、完成项目、完成研究后更新
- 重大行动前先更新计划
- 计划反映当前世界状态

## 设计特点

### AI Flow 范式

```
独立模式 ──────────┐
                   ├──▶ 协同完成编程任务
协作模式 ──────────┘
```

### 代码变更规则

1. 生成代码必须可直接运行
2. 从零创建需包含依赖管理文件和 README
3. **大文件拆分**：>300 行拆分为多个小编辑
4. 不生成极长哈希或二进制代码
5. 使用 `TargetFile` 参数优先生成原则

### 调试原则

1. 解决根因而非症状
2. 添加描述性日志和错误消息
3. 添加测试函数隔离问题
4. **仅在确定能解决问题时才修改代码**

### 终端安全

- **绝不自动运行** 不安全命令
- 破坏性操作需用户批准
- 不在命令中包含 `cd`，使用 `cwd` 参数

## 与其他工具对比

| 维度 | Windsurf | Claude Code | Trae AI |
|------|----------|-------------|---------|
| 范式 | AI Flow | 原生代理 | AI Flow |
| 基础模型 | GPT 4.1 | Claude | 多模型 |
| 记忆系统 | create_memory | 外部记忆 | 上下文 |
| 规划工具 | update_plan | 无 | 无 |
| 部署能力 | deploy_web_app | 无 | 无 |
| 浏览器操作 | 完整套件 | 无 | 无 |

## 相关资源

- [[augment-code-gpt5]] — Augment Code GPT-5 版本
- [[augment-code-sonnet4]] — Augment Code Sonnet 4 版本
- [[trae-ai]] — Trae AI
- [[traycer-ai]] — Traycer.AI
- [[agent-command-skill-comparison]] — 扩展机制对比
