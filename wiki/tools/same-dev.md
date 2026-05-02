---
name: tools/same-dev
description: Same.dev 云端 IDE 编程助手系统提示词、工具集和工作流
type: source
tags: [same-dev, agent, tools, system-prompt, cloud-ide, gpt-4.1, bun, netlify]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/Same.dev/Prompt.txt
---

# Same.dev 编程助手

## 概述

Same.dev 是一个云端开发环境，通过 same.new 访问，由 GPT-4.1 驱动。它提供完整的 IDE 功能，包括文件编辑、Shell 命令执行、版本控制和应用部署。Same.dev 的核心理念是让开发者无需本地配置，在浏览器中即可完成从编码到部署的全流程。

## 核心定位

| 维度 | 说明 |
|------|------|
| **运行环境** | 云端浏览器 IDE |
| **访问地址** | same.new |
| **底层模型** | GPT-4.1 |
| **调用格式** | JSON function calling |
| **核心能力** | 编辑、部署、版本控制 |

## 技术栈

### 默认环境

| 组件 | 技术 |
|------|------|
| **包管理器** | Bun |
| **UI 框架** | shadcn/ui |
| **部署平台** | Netlify（自动） |

### Bun 特性

Bun 是统一的 JavaScript 运行时和工具链：

```bash
# 运行脚本
bun run dev

# 安装依赖
bun install

# 测试
bun test
```

## 工具集详解

Same.dev 提供 9 个核心工具。

### 1. edit_file

编辑文件中的特定代码片段。

```json
{
  "path": "src/app/page.tsx",
  "old_string": "const count = 0",
  "new_string": "const count = 10"
}
```

**规则**：
- `old_string` 必须是文件中唯一存在的片段
- 自动处理缩进和格式

### 2. string_replace

替换文件中的字符串，支持正则表达式。

```json
{
  "path": "src/utils/format.ts",
  "old_string": "formatDate\\(\\d{4}-\\d{2}-\\d{2}\\)",
  "new_string": "formatDateISO"
}
```

### 3. startup

启动开发服务器。

```json
{
  "command": "bun run dev",
  "port": 3000,
  "route": "/"
}
```

**启动流程**：
1. 解析启动命令
2. 分配端口
3. 打开预览面板
4. 提供访问 URL

### 4. versioning

管理 Git 版本控制操作。

```json
{
  "operation": "commit",
  "message": "feat: add user authentication"
}
```

**支持的操作**：
| 操作 | 说明 |
|------|------|
| `status` | 查看当前状态 |
| `commit` | 提交变更 |
| `push` | 推送到远程 |
| `pull` | 拉取远程变更 |

### 5. deploy

部署应用到 Netlify。

```json
{
  "site_name": "my-awesome-app"
}
```

**部署特性**：
- 自动分配域名
- 构建失败回滚
- 预览部署每个 commit

### 6. web_search

执行网络搜索获取信息。

```json
{
  "query": "React 18 new features",
  "limit": 5
}
```

### 7. web_scrape

抓取网页内容。

```json
{
  "url": "https://example.com",
  "query": "extract documentation"
}
```

### 8. suggestions

获取代码建议。

```json
{
  "path": "src/components/Button.tsx",
  "line": 10,
  "type": "optimization"
}
```

### 9. task_agent

创建子任务代理处理复杂工作。

```json
{
  "task": "Write unit tests for the auth module",
  "context": {
    "files": ["auth.ts", "auth.test.ts"],
    "framework": "vitest"
  }
}
```

## 并行工具调用

Same.dev 支持并行调用多个工具以提高效率：

```json
[
  {
    "tool": "edit_file",
    "path": "src/app/page.tsx",
    "old_string": "...",
    "new_string": "..."
  },
  {
    "tool": "edit_file",
    "path": "src/styles/theme.css",
    "old_string": "...",
    "new_string": "..."
  },
  {
    "tool": "run_command",
    "command": "bun run lint"
  }
]
```

## 项目跟踪

Same.dev 使用 `.same/todos.md` 跟踪任务进度：

```markdown
# Todos

## In Progress
- [x] Set up authentication
- [ ] Add user dashboard
- [ ] Implement payment integration

## Done
- [x] Initialize project
- [x] Configure database
```

## 工作流程示例

### 1. 创建新项目

```
用户: 创建一个 Next.js 博客应用

助手:
1. startup: bun create next-app blog --typescript
2. edit_file: 添加博客组件
3. startup: bun run dev
```

### 2. 添加功能

```
用户: 添加深色模式切换

助手:
1. edit_file: 添加 ThemeProvider
2. edit_file: 添加主题切换按钮
3. web_search: shadcn dark mode 最佳实践
4. startup: 重启开发服务器
```

### 3. 部署应用

```
用户: 部署应用到生产环境

助手:
1. versioning: git commit -m "feat: add dark mode"
2. deploy: { "site_name": "my-blog" }
3. 返回部署 URL
```

## 与其他工具对比

| 维度 | Same.dev | Replit | Claude Code | Windsurf |
|------|----------|--------|-------------|----------|
| 运行环境 | 云端 IDE | 云端 IDE | 命令行 | IDE |
| 底层模型 | GPT-4.1 | 未知 | Claude | GPT-4 |
| 包管理器 | Bun | 多种 | 手动 | 多种 |
| UI 框架 | shadcn/ui | 自选 | 自选 | 自选 |
| 自动部署 | Netlify | Replit | 无 | 无 |
| 任务跟踪 | .same/todos.md | 无 | 无 | AI Flow |

## 设计规范

Same.dev 推荐以下设计实践：

### UI 框架

使用 **shadcn/ui** 构建界面：
- 基于 Radix UI 原语
- 完全可定制
- 复制粘贴到项目

### 颜色系统

```typescript
// tailwind.config.ts
colors: {
  primary: {
    DEFAULT: "hsl(var(--primary))",
    foreground: "hsl(var(--primary-foreground))",
  },
  background: "hsl(var(--background))",
  foreground: "hsl(var(--foreground))",
}
```

### 字体规范

最多使用 **2 种字体**：
- 标题：Inter 或 Geist Sans
- 正文：系统字体栈

## 相关资源

- [[replit]] — Replit 在线 IDE
- [[v0]] — Vercel v0 Web 开发助手
- [[cursor]] — Cursor AI IDE
- [[windsurf-ai]] — Windsurf Cascade
- [[agent-command-skill-comparison]] — 扩展机制对比
