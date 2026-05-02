---
name: tools/bolt
description: Bolt 浏览器内 WebContainer AI 编程助手系统提示词
type: source
tags: [bolt, webcontainer, agent, tools, system-prompt, supabase, artifact]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/Open Source prompts/Bolt/Prompt.txt
---

# Bolt 编程助手

## 概述

Bolt 是一个在浏览器内运行的 AI 编程助手，基于 WebContainer 技术实现。它允许用户在浏览器环境中完成完整的开发工作流，无需本地配置。Bolt 的核心理念是将 AI 能力与即时可用的开发环境结合，让任何人都能在浏览器中快速构建和部署应用。

## 核心定位

| 维度 | 说明 |
|------|------|
| **运行环境** | 浏览器（WebContainer） |
| **访问方式** | bolt.new |
| **调用格式** | boltArtifact XML 标签 |
| **核心能力** | 前端开发、文件编辑、Shell 命令 |

## 环境特性

### WebContainer 技术

WebContainer 是一个基于浏览器的操作系统，使用 WebAssembly 在浏览器中运行 Node.js：

```javascript
// WebContainer 支持的命令
- npm install / npm run
- node scripts/*.js
- 实时热重载
- 交互式终端
```

### 环境限制

| 功能 | 状态 | 说明 |
|------|------|------|
| Node.js/npm | ✅ 支持 | WebContainer 内置 |
| Git 操作 | ❌ 不可用 | WebContainer 不支持 Git |
| pip/Python | ❌ 不可用 | 需要 WebAssembly 版本 |
| C/C++ 编译 | ❌ 不可用 | 无法安装原生二进制 |
| 文件系统 | ✅ 支持 | 虚拟文件系统 |

## boltArtifact 格式

Bolt 使用自定义 XML 标签格式定义不同类型的操作。

### 1. 文件操作

```xml
<boltAction type="file" filePath="src/App.tsx">
import React from 'react'

export function App() {
  return <h1>Hello World</h1>
}
</boltAction>
```

**参数**：
| 属性 | 说明 |
|------|------|
| `type` | 操作类型：`file` |
| `filePath` | 目标文件路径 |

### 2. Shell 命令

```xml
<boltAction type="shell" command="npm install">
安装项目依赖...
</boltAction>
```

**参数**：
| 属性 | 说明 |
|------|------|
| `type` | 操作类型：`shell` |
| `command` | 要执行的命令 |

### 3. 启动服务

```xml
<boltAction type="start" command="npm run dev">
启动开发服务器...
</boltAction>
```

### 4. Supabase 集成

```xml
<boltAction type="supabase" projectId="xxxxx">
配置 Supabase 连接...
</boltAction>
```

**功能**：
- 数据库连接配置
- 迁移文件管理
- 数据保护规范

## 数据库规范

### Supabase 集成

Bolt 默认使用 Supabase 作为数据库解决方案：

```xml
<boltAction type="supabase" projectId="your-project-id">
  <!-- 连接配置 -->
  <!-- 数据迁移 -->
  <!-- 安全规则 -->
</boltAction>
```

### 迁移文件规范

```javascript
// supabase/migrations/001_create_users.sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT UNIQUE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### 数据保护规则

```javascript
// Row Level Security (RLS)
ALTER TABLE users ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own data"
  ON users FOR SELECT
  USING (auth.uid() = id);
```

## 工作流示例

### 1. 创建项目

```
用户: 创建一个 React 博客应用

Bolt:
1. boltArtifact (file): 创建 package.json
2. boltArtifact (file): 创建 src/App.tsx
3. boltArtifact (shell): npm install
4. boltArtifact (start): npm run dev
```

### 2. 添加 Supabase 后端

```
用户: 添加用户认证功能

Bolt:
1. boltArtifact (file): 创建 supabase/migrations/001_auth.sql
2. boltArtifact (file): 创建 src/lib/supabase.ts
3. boltArtifact (file): 创建 src/components/Auth.tsx
```

### 3. 完整应用构建

```xml
<!-- 步骤 1: 项目初始化 -->
<boltAction type="file" filePath="package.json">
{
  "name": "my-app",
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0"
  }
}
</boltAction>

<!-- 步骤 2: 安装依赖 -->
<boltAction type="shell" command="npm install">
安装依赖中...
</boltAction>

<!-- 步骤 3: 启动开发 -->
<boltAction type="start" command="npm run dev">
开发服务器启动中...
</boltAction>
```

## 与其他工具对比

| 维度 | Bolt | Claude Code | Cursor | Windsurf |
|------|------|-------------|--------|----------|
| 运行环境 | 浏览器 | 命令行 | IDE | IDE |
| 环境类型 | WebContainer | 系统 Shell | 模拟 | 模拟 |
| 数据库集成 | Supabase 原生 | 无 | 无 | 无 |
| 无需配置 | ✅ | ❌ | ❌ | ❌ |
| Git 支持 | ❌ | ✅ | ✅ | ✅ |

## 最佳实践

### 1. 项目结构

```
my-app/
├── src/
│   ├── App.tsx
│   ├── components/
│   └── lib/
├── public/
├── supabase/
│   └── migrations/
├── package.json
└── README.md
```

### 2. 依赖管理

- 优先使用轻量级依赖
- 避免需要原生模块的包
- 使用 CDN 外链图片资源

### 3. 性能优化

- 懒加载组件
- 代码分割
- 使用 WebAssembly 替代原生模块

## 相关资源

- [[claude-code]] — Claude Code 编程助手
- [[cursor]] — Cursor AI IDE
- [[windsurf-ai]] — Windsurf Cascade
- [[replit]] — Replit 在线 IDE
- [[agent-command-skill-comparison]] — 扩展机制对比