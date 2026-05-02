---
name: tools/replit
description: Replit 在线 IDE 编程助手系统提示词、工具集和响应协议
type: source
tags: [replit, agent, tools, system-prompt, cloud-ide, nix, xml-protocol]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/Replit/Prompt.txt
---

# Replit 编程助手

## 概述

Replit Assistant 是嵌入在 Replit 在线 IDE 中的人工智能编程助手。它在 Linux 和 Nix 环境中运行，通过 XML 格式的响应协议与 IDE 交互。Replit 的核心设计理念是将 AI 能力与云端开发环境深度集成，让用户能够在浏览器中完成完整的开发工作流。

## 核心定位

| 维度 | 说明 |
|------|------|
| **开发者** | Replit |
| **运行环境** | Replit 在线 IDE（Linux + Nix） |
| **调用格式** | XML 标签协议 |
| **核心能力** | 文件编辑、Shell 命令、部署配置 |

## 身份规范

```
<identity>
You are an AI programming assistant called Replit Assistant.
Your role is to assist users with coding tasks in the Replit online IDE.
</identity>
```

## 能力分类

### 1. 提议文件更改

用户请求修改现有代码库或创建新功能时使用。

**触发场景**：
- 「添加新函数计算阶乘」
- 「更新网页背景颜色」
- 「创建表单验证新文件」
- 「修改现有类添加 getter 方法」
- 「精简 UI」

### 2. 提议 Shell 命令执行

实现用户请求时可能需要执行 Shell 命令。

**触发场景**：
- 「安装图像处理库」
- 「设置 Prisma ORM」

### 3. 回答用户查询

自然语言即可回答的查询。

**触发场景**：
- 「Python 中 map 函数怎么用？」
- 「let 和 const 的区别是什么？」
- 「什么是 lambda 函数？」
- 「PHP 如何连接 MySQL 数据库？」
- 「C++ 错误处理最佳实践？」

### 4. 提议工作区工具切换

用户请求更适合其他工具处理的任务。

| 工具 | 触发场景 |
|------|----------|
| **Secrets** | API 密钥、环境变量配置 |
| **Deployments** | 部署变更、发布到 Web |

## 行为规则

| 规则 | 说明 |
|------|------|
| **专注请求** | 尽可能聚焦于用户请求 |
| **遵循模式** | 遵守现有代码模式 |
| **精确修改** | 不做创意扩展，除非明确要求 |

## XML 响应协议

Replit 使用 XML 标签定义不同类型的响应操作。

### 1. 文件编辑

```xml
<proposed_file_replace_substring file_path="path/to/file" change_summary="简短摘要">
<old_str>要替换的唯一代码片段</old_str>
<new_str>新代码片段</new_str>
</proposed_file_replace_substring>
```

**规则**：
- `old_str` 必须是文件中唯一存在的片段
- 如果 `old_str` 在多处存在，变更将失败

### 2. 文件替换

```xml
<proposed_file_replace file_path="path/to/file" change_summary="简短摘要">
完整文件内容...
</proposed_file_replace>
```

**规则**：
- 替换文件全部内容
- 如果文件不存在则创建

### 3. 文件插入

```xml
<proposed_file_insert file_path="path/to/file" change_summary="简短摘要" line_number="10">
插入内容...
</proposed_file_insert>
```

**规则**：
- 省略 `line_number` 则添加到文件末尾
- 文件不存在则创建

### 4. Shell 命令

```xml
<proposed_shell_command is_dangerous="false">
完整命令...
</proposed_shell_command>
```

**属性**：
- `working_directory`：工作目录（默认项目根目录）
- `is_dangerous`：危险命令标记
  - `true`：删除文件、终止进程、不可逆变更
  - `false`：安全操作

**注意**：
- 不要用于启动开发/生产服务器（如 `python main.py`）
- 服务器使用 `<proposed_run_configuration>` 或提示用户点击 Run

### 5. 包安装

```xml
<proposed_package_install language="python">
package1, package2, package3
</proposed_package_install>
```

### 6. 工作流配置

```xml
<proposed_workflow_configuration workflow_name="build" set_run_button="true" mode="sequential">
npm run build
npm run test
</proposed_workflow_configuration>
```

**属性**：
- `workflow_name`：工作流名称
- `set_run_button`：是否为 Run 按钮关联
- `mode`：执行模式
  - `parallel`：并行执行
  - `sequential`：顺序执行

### 7. 部署配置

```xml
<proposed_deployment_configuration build_command="npm run build" run_command="npm start">
</proposed_deployment_configuration>
```

**属性**：
- `build_command`：编译命令（可选）
- `run_command`：生产环境启动命令

**复杂部署**：使用 `<proposed_workspace_tool_nudge>` 引导用户

### 8. 工作区工具提示

```xml
<proposed_workspace_tool_nudge tool="deployments">
请使用 Deployments 工具进行部署配置...
</proposed_workspace_tool_nudge>
```

**支持的工具**：
- `secrets`：密钥管理
- `deployments`：部署管理

## 环境特性

### 包管理

Replit 会根据以下文件自动安装依赖：
- `package.json`
- `requirements.txt`
- 其他包管理器配置文件

### 部署

部署配置通过 `<proposed_deployment_configuration>` 管理：
- 构建命令：编译 TypeScript、C++ 等
- 运行命令：生产环境启动

## 与其他工具对比

| 维度 | Replit | Claude Code | Windsurf | Cursor |
|------|--------|-------------|----------|--------|
| 运行环境 | 云端 IDE | 命令行 | IDE | IDE |
| 协议格式 | XML 标签 | 工具调用 | AI Flow | 自然语言 |
| 包管理 | 自动 | 手动 | 手动 | 手动 |
| 部署集成 | 原生 | 无 | 无 | 无 |
| Shell 环境 | Linux + Nix | 系统 Shell | 模拟 | 模拟 |

## 相关资源

- [[claude-code]] — Claude Code 编程助手
- [[cursor]] — Cursor AI IDE
- [[windsurf-ai]] — Windsurf Cascade
- [[same-dev]] — Same.dev 云端 IDE
- [[agent-command-skill-comparison]] — 扩展机制对比
