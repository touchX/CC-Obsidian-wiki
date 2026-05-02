---
name: tools/cline
description: Cline VSCode AI 编程助手系统提示词、工具集和响应协议
type: source
tags: [cline, vscode, agent, tools, system-prompt, mcp, xml-protocol]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/Open Source prompts/Cline/Prompt.txt
---

# Cline 编程助手

## 概述

Cline 是一个嵌入在 VSCode 中的 AI 编程助手，通过 MCP（Model Context Protocol）协议连接外部工具。它支持多种工具类型，能够完成从代码编辑到浏览器自动化的复杂任务。Cline 的核心理念是将强大的 AI 能力与 VSCode 的开发环境深度集成，让开发者能够在熟悉的 IDE 中获得 AI 辅助。

## 核心定位

| 维度 | 说明 |
|------|------|
| **运行环境** | VSCode 扩展 |
| **访问方式** | 侧边栏面板 |
| **调用格式** | XML 标签协议 |
| **核心能力** | 代码编辑、Shell 命令、浏览器自动化 |

## 工具集详解

Cline 提供 10 种工具类型，覆盖开发全流程。

### 1. execute_command

在终端执行 Shell 命令。

```xml
<execute_command>
  <command>npm install</command>
  <working_dir>/path/to/project</working_dir>
</execute_command>
```

**参数**：
| 参数 | 说明 | 默认值 |
|------|------|--------|
| `command` | 要执行的命令 | 必需 |
| `working_dir` | 工作目录 | 项目根目录 |
| `timeout` | 超时时间（秒） | 60 |

**用途**：
- 安装依赖
- 运行脚本
- Git 操作

### 2. read_file

读取文件内容。

```xml
<read_file>
  <path>src/App.tsx</path>
  <lineRanges>
    <range start="1" end="50"/>
  </lineRanges>
</read_file>
```

**参数**：
| 参数 | 说明 |
|------|------|
| `path` | 文件路径（相对或绝对） |
| `lineRanges` | 可选的行范围 |

### 3. write_to_file

创建或覆盖文件。

```xml
<write_to_file>
  <path>src/utils/helper.ts</path>
  <content>export function helper() {
  return 'hello'
}</content>
</write_to_file>
```

**规则**：
- 会覆盖整个文件
- 自动创建父目录

### 4. replace_in_file

替换文件中的文本。

```xml
<replace_in_file>
  <path>src/App.tsx</path>
  <old_string>const VERSION = '1.0'</old_string>
  <new_string>const VERSION = '2.0'</new_string>
</replace_in_file>
```

**规则**：
- `old_string` 必须唯一
- 精确匹配，包括空白字符

### 5. search_files

在项目中搜索文件或内容。

```xml
<search_files>
  <path>src</path>
  <regex>TODO</regex>
  <file_pattern>*.ts</file_pattern>
</search_files>
```

**参数**：
| 参数 | 说明 | 默认值 |
|------|------|--------|
| `path` | 搜索路径 | 项目根目录 |
| `regex` | 正则表达式 | 必需 |
| `file_pattern` | 文件模式 | * |

### 6. browser_action

控制浏览器进行自动化操作。

```xml
<browser_action>
  <action>goto</action>
  <url>https://example.com</url>
</browser_action>
```

**支持的动作**：
| 动作 | 说明 |
|------|------|
| `goto` | 导航到 URL |
| `click` | 点击元素 |
| `type` | 输入文本 |
| `screenshot` | 截图 |
| `evaluate` | 执行 JavaScript |

### 7. use_mcp_tool

调用 MCP 服务器提供的工具。

```xml
<use_mcp_tool>
  <server_name>github</server_name>
  <tool_name>create_issue</tool_name>
  <arguments>{"title": "Bug fix", "body": "..."}</arguments>
</use_mcp_tool>
```

**用途**：
- GitHub 操作
- 数据库操作
- 自定义工具集成

### 8. ask_followup_question

向用户请求更多信息。

```xml
<ask_followup_question>
  <question>您想要使用哪个数据库？</question>
  <options>
    <option>PostgreSQL</option>
    <option>MySQL</option>
    <option>MongoDB</option>
  </options>
</ask_followup_question>
```

### 9. attempt_completion

标记任务完成并返回结果。

```xml
<attempt_completion>
  <result>已创建用户认证系统</result>
  <summary>完成了以下工作：\n1. 创建数据库表\n2. 添加登录页面\n3. 配置 JWT</summary>
</attempt_completion>
```

### 10. plan_mode_respond

进入计划模式，分析任务并制定步骤。

```xml
<plan_mode_respond>
  <plan>
    1. 读取现有代码结构
    2. 设计数据库 schema
    3. 实现后端 API
    4. 实现前端组件
  </plan>
</plan_mode_respond>
```

## MCP 服务器集成

### 配置 MCP 服务器

在 `cline_mcp_settings.json` 中配置：

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "${GITHUB_TOKEN}"
      }
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem"],
      "args": ["/path/to/allowed/directory"]
    }
  }
}
```

### 常用 MCP 服务器

| 服务器 | 功能 |
|--------|------|
| `@modelcontextprotocol/server-github` | GitHub API 操作 |
| `@modelcontextprotocol/server-filesystem` | 文件系统访问 |
| `@modelcontextprotocol/server-brave-search` | 网络搜索 |
| `@modelcontextprotocol/server-sqlite` | SQLite 数据库 |

## 工作流示例

### 1. 完整功能实现

```
用户: 为博客添加评论功能

Cline:
1. read_file: 查看现有项目结构
2. search_files: 查找相关组件
3. write_to_file: 创建数据库迁移
4. write_to_file: 创建 API 路由
5. write_to_file: 创建评论组件
6. execute_command: 测试功能
```

### 2. Bug 修复

```
用户: 修复登录页面的重定向问题

Cline:
1. search_files: 查找登录相关代码
2. read_file: 读取登录组件
3. replace_in_file: 修复重定向逻辑
4. attempt_completion: 报告修复结果
```

### 3. 浏览器自动化

```
用户: 自动填写并提交表单

Cline:
1. browser_action: goto https://example.com/form
2. browser_action: type #email "test@example.com"
3. browser_action: type #password "password123"
4. browser_action: click button[type="submit"]
```

## 与其他工具对比

| 维度 | Cline | Claude Code | Cursor | Windsurf |
|------|-------|-------------|--------|----------|
| 运行环境 | VSCode | 命令行 | IDE | IDE |
| 工具数量 | 10+ | 8 | 5 | 7 |
| MCP 支持 | ✅ 原生 | ❌ | ❌ | ❌ |
| 浏览器自动化 | ✅ | ❌ | 部分 | 部分 |
| 计划模式 | ✅ | 部分 | ❌ | AI Flow |

## 最佳实践

### 1. 工具选择

- 文件读取优先于搜索
- 使用精确路径减少搜索范围
- 批量操作使用并行调用

### 2. 错误处理

- 检查命令退出码
- 验证文件写入成功
- 提供清晰的完成摘要

### 3. MCP 工具使用

- 按需启用 MCP 服务器
- 注意环境变量配置
- 定期更新 MCP 包

## 相关资源

- [[claude-code]] — Claude Code 编程助手
- [[cursor]] — Cursor AI IDE
- [[windsurf-ai]] — Windsurf Cascade
- [[roocode]] — RooCode VSCode 扩展
- [[agent-command-skill-comparison]] — 扩展机制对比