---
name: tools/roocode
description: RooCode VSCode AI 编程助手系统提示词、5 种模式和自定义规则
type: source
tags: [roocode, vscode, agent, tools, system-prompt, mode, custom-rules]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/Open Source prompts/RooCode/Prompt.txt
---

# RooCode 编程助手

## 概述

RooCode 是一个嵌入在 VSCode 中的 AI 编程助手，提供 5 种专业模式应对不同的开发场景。它支持 MCP（Model Context Protocol）服务器连接和自定义规则加载。RooCode 的核心理念是为开发者提供场景化的 AI 辅助，让不同阶段的开发工作都能获得最适合的支持。

## 核心定位

| 维度 | 说明 |
|------|------|
| **运行环境** | VSCode 扩展 |
| **访问方式** | 侧边栏面板 |
| **核心特性** | 5 种模式、MCP 支持、自定义规则 |
| **规则目录** | `.roo/rules/` |

## 5 种专业模式

### 1. Code Mode（代码模式）

默认模式，用于日常编码任务。

**触发词**：
- 编写代码
- 实现功能
- 添加功能

**特点**：
- 快速代码补全
- 常规编辑操作
- 文件操作支持

**输出示例**：
```xml
<write_to_file>
<path>src/utils/helper.ts</path>
<content>export function helper() {
  return 'hello'
}</content>
</write_to_file>
```

### 2. Architect Mode（架构模式）

用于系统设计和架构规划。

**触发词**：
- 设计架构
- 系统设计
- 技术选型

**特点**：
- 高层次分析
- 组件关系设计
- 技术决策建议

**输出示例**：
```markdown
## 系统架构

### 组件关系
- API Gateway → Auth Service
- Auth Service → User Database
- API Gateway → Order Service

### 技术选型
- 前端: React + TypeScript
- 后端: Node.js + Express
- 数据库: PostgreSQL
```

### 3. Ask Mode（问答模式）

用于回答问题和解释代码。

**触发词**：
- 解释
- 是什么
- 为什么
- 如何实现

**特点**：
- 详细解释
- 示例演示
- 链接相关资源

**输出示例**：
```markdown
## JWT 认证原理

### 工作流程
1. 用户登录 → 服务器验证
2. 生成 JWT token
3. 客户端存储 token
4. 后续请求携带 token
5. 服务器验证 token

### 示例代码
```javascript
const token = jwt.sign(user, secret)
const verified = jwt.verify(token, secret)
```
```

### 4. Debug Mode（调试模式）

用于定位和修复问题。

**触发词**：
- 修复 bug
- 调试
- 出错了
- 不工作

**特点**：
- 问题分析
- 错误定位
- 修复建议

**输出示例**：
```xml
<search_files>
<path>src</path>
<regex>error|undefined|null</regex>
<file_pattern>*.ts</file_pattern>
</search_files>

<read_file>
<path>src/services/user.ts</path>
</read_file>

<!-- 问题分析 -->
<!-- 可能原因：userId 未定义 -->
<!-- 建议修复：添加空值检查 -->
<replace_in_file>
<path>src/services/user.ts</path>
<old_string>const user = users.find(u => u.id === userId)</old_string>
<new_string>const user = users.find(u => u.id === userId && userId !== undefined)</new_string>
</replace_in_file>
```

### 5. Boomerang Mode（回旋镖模式）

用于回顾和优化现有代码。

**触发词**：
- 重构
- 优化
- 代码审查
- 改进

**特点**：
- 代码分析
- 改进建议
- 性能优化

**输出示例**：
```xml
<!-- 当前实现分析 -->
<read_file>
<path>src/components/UserList.tsx</path>
</read_file>

<!-- 发现的问题 -->
<!-- 1. 缺少 memo 优化 -->
<!-- 2. 重复计算 -->
<!-- 3. 缺少错误边界 -->

<!-- 优化建议 -->
<replace_in_file>
<path>src/components/UserList.tsx</path>
<old_string>export function UserList({ users }) {</old_string>
<new_string>export const UserList = React.memo(({ users }) => {</new_string>
</replace_in_file>
```

## 自定义规则系统

### 规则目录结构

```
.roo/
└── rules/
    ├── coding-standards.md
    ├── tech-stack.md
    ├── project-patterns.md
    └── ai-behavior.md
```

### 规则文件示例

#### coding-standards.md

```markdown
# 编码规范

## TypeScript
- 使用严格模式
- 优先使用 interface
- 避免 any 类型
- 添加类型注解

## 命名规范
- 变量/函数: camelCase
- 类/组件: PascalCase
- 常量: UPPER_SNAKE_CASE

## 代码风格
- 使用 ESLint + Prettier
- 最大行长度: 100
- 缩进: 2 空格
```

#### tech-stack.md

```markdown
# 技术栈

## 框架
- Frontend: React 18+
- State: Zustand
- Styling: Tailwind CSS

## 后端
- Runtime: Node.js 20+
- Framework: Express
- ORM: Prisma

## 数据库
- PostgreSQL 15+
- Redis 7+
```

#### project-patterns.md

```markdown
# 项目模式

## 组件结构
```
components/
├── atoms/        # 基础组件
├── molecules/    # 组合组件
├── organisms/    # 复杂组件
└── templates/    # 页面模板
```

## 目录结构
```
src/
├── features/     # 功能模块
├── shared/       # 共享代码
├── lib/          # 工具库
└── config/       # 配置文件
```
```

#### ai-behavior.md

```markdown
# AI 行为配置

## 输出风格
- 简洁优先
- 中文注释
- 中文文档
- 英文代码

## 交互模式
- 确认后执行
- 自动保存
- 错误回滚

## 限制规则
- 不生成敏感信息
- 不修改其他功能
- 保持向后兼容
```

## 工具集详解

### 1. execute_command

执行 Shell 命令。

```xml
<execute_command>
  <command>npm install</command>
  <working_dir>/path/to/project</working_dir>
</execute_command>
```

### 2. read_file

读取文件内容，支持行范围。

```xml
<read_file>
  <path>src/App.tsx</path>
  <lineRanges>
    <range start="1" end="50"/>
  </lineRanges>
</read_file>
```

**扩展语法**：
```xml
<read_file>
<path>src/App.tsx</path>
<lineRanges>
  <range start=":start_line:" end=":end_line:"/>
</lineRanges>
</read_file>
```

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

### 4. replace_in_file

替换文件中的文本。

```xml
<replace_in_file>
<path>src/App.tsx</path>
<old_string>const VERSION = '1.0'</old_string>
<new_string>const VERSION = '2.0'</new_string>
</replace_in_file>
```

### 5. search_files

搜索文件和内容。

```xml
<search_files>
<path>src</path>
<regex>TODO|FIXME</regex>
<file_pattern>*.ts</file_pattern>
</search_files>
```

### 6. browser_action

浏览器自动化操作。

```xml
<browser_action>
<action>goto</action>
<url>https://example.com</url>
</browser_action>
```

### 7. use_mcp_tool

调用 MCP 服务器工具。

```xml
<use_mcp_tool>
<server_name>github</server_name>
<tool_name>create_issue</tool_name>
<arguments>{"title": "Bug", "body": "..."}</arguments>
</use_mcp_tool>
```

## MCP 服务器集成

### 配置方式

在 VSCode 设置中配置：

```json
{
  "roocode.mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"]
    },
    "filesystem": {
      "command": "npx", 
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/allowed/path"]
    }
  }
}
```

### 常用 MCP 服务器

| 服务器 | 功能 |
|--------|------|
| `github` | GitHub API 操作 |
| `filesystem` | 文件系统访问 |
| `brave-search` | 网络搜索 |
| `sqlite` | 数据库操作 |

## 模式切换指南

| 场景 | 推荐模式 | 理由 |
|------|----------|------|
| 写新功能 | Code Mode | 快速实现 |
| 设计系统 | Architect Mode | 全面分析 |
| 学新技术 | Ask Mode | 详细解释 |
| 修 Bug | Debug Mode | 定位问题 |
| 改进代码 | Boomerang Mode | 深度优化 |

## 与其他工具对比

| 维度 | RooCode | Cline | Claude Code | Cursor |
|------|---------|-------|-------------|--------|
| 模式系统 | 5 种模式 | 单一模式 | Agent Mode | AI Complete |
| 自定义规则 | ✅ | ❌ | ❌ | ❌ |
| MCP 支持 | ✅ | ✅ | ❌ | ❌ |
| 调试集成 | ✅ | 部分 | ❌ | 部分 |
| 架构设计 | ✅ | ❌ | 部分 | ❌ |

## 最佳实践

### 1. 规则配置

- 根据项目需求定制规则
- 保持规则文件简洁
- 定期更新规则

### 2. 模式选择

- 根据任务选择合适模式
- 复杂任务先用 Architect
- 调试任务使用 Debug Mode

### 3. MCP 使用

- 按需启用 MCP 服务器
- 注意敏感信息保护
- 定期更新 MCP 包

## 相关资源

- [[cline]] — Cline VSCode 扩展
- [[claude-code]] — Claude Code 编程助手
- [[cursor]] — Cursor AI IDE
- [[windsurf-ai]] — Windsurf Cascade
- [[agent-command-skill-comparison]] — 扩展机制对比